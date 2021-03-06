------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 01-08-2021
------------------------------------------------------------------------------------------

-- setting up Extended Color Picker

--if IsAddOnLoaded('MaxUI') then 
--	return
--end

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local ColorPicker = CreateFrame("Frame")
local GUI = T["GUI"]

--Lua functions
local _G = _G
local strlen, strjoin, gsub = strlen, strjoin, gsub
local tonumber, floor, strsub, wipe = tonumber, floor, strsub, wipe

--WoW API / Variables
local CreateFrame = CreateFrame
local IsAddOnLoaded = IsAddOnLoaded
local IsControlKeyDown = IsControlKeyDown
local IsModifierKeyDown = IsModifierKeyDown
local CALENDAR_COPY_EVENT, CALENDAR_PASTE_EVENT = CALENDAR_COPY_EVENT, CALENDAR_PASTE_EVENT
local CLASS, DEFAULT = CLASS, DEFAULT

local colorBuffer = {}
local function alphaValue(num)
	return num and floor(((1 - num) * 100) + .05) or 0
end

local function UpdateAlphaText(alpha)
	if not alpha then alpha = alphaValue(_G.OpacitySliderFrame:GetValue()) end

	_G.ColorPPBoxA:SetText(alpha)
end

local function UpdateAlpha(tbox)
	local num = tbox:GetNumber()
	if num > 100 then
		tbox:SetText(100)
		num = 100
	end

	_G.OpacitySliderFrame:SetValue(1 - (num / 100))
end

local function expandFromThree(r, g, b)
	return strjoin('',r,r,g,g,b,b)
end

local function extendToSix(str)
	for _=1, 6-strlen(str) do str=str..0 end
	return str
end

local function GetHexColor(box)
	local rgb, rgbSize = box:GetText(), box:GetNumLetters()
	if rgbSize == 3 then
		rgb = gsub(rgb, '(%x)(%x)(%x)$', expandFromThree)
	elseif rgbSize < 6 then
		rgb = gsub(rgb, '(.+)$', extendToSix)
	end

	local r, g, b = tonumber(strsub(rgb,0,2),16) or 0, tonumber(strsub(rgb,3,4),16) or 0, tonumber(strsub(rgb,5,6),16) or 0

	return r/255, g/255, b/255
end

local function UpdateColorTexts(r, g, b, box)
	if not (r and g and b) then
		r, g, b = _G.ColorPickerFrame:GetColorRGB()

		if box then
			if box == _G.ColorPPBoxH then
				r, g, b = GetHexColor(box)
			else
				local num = box:GetNumber()
				if num > 255 then num = 255 end
				local c = num/255
				if box == _G.ColorPPBoxR then
					r = c
				elseif box == _G.ColorPPBoxG then
					g = c
				elseif box == _G.ColorPPBoxB then
					b = c
				end
			end
		end
	end

	-- we want those /255 values
	r, g, b = r*255, g*255, b*255

	_G.ColorPPBoxH:SetText(("%.2x%.2x%.2x"):format(r, g, b))
	_G.ColorPPBoxR:SetText(r)
	_G.ColorPPBoxG:SetText(g)
	_G.ColorPPBoxB:SetText(b)
end

local function UpdateColor()
	local r, g, b = GetHexColor(_G.ColorPPBoxH)
	_G.ColorPickerFrame:SetColorRGB(r, g, b)
	_G.ColorSwatch:SetColorTexture(r, g, b)
end

local function ColorPPBoxA_SetFocus()
	_G.ColorPPBoxA:SetFocus()
end

local function ColorPPBoxR_SetFocus()
	_G.ColorPPBoxR:SetFocus()
end

local delayWait, delayFunc = 0.15
local function delayCall()
	if delayFunc then
		delayFunc()
		delayFunc = nil
	end
end
local function onColorSelect(frame, r, g, b)
	if frame.noColorCallback then return end

	_G.ColorSwatch:SetColorTexture(r, g, b)
	UpdateColorTexts(r, g, b)

	if not frame:IsVisible() then
		delayCall()
	elseif not delayFunc then
		delayFunc = _G.ColorPickerFrame.func
	--	T.Delay(delayWait, delayCall)
	end
end

local function onValueChanged(frame, value)
	local alpha = alphaValue(value)
	if frame.lastAlpha ~= alpha then
		frame.lastAlpha = alpha

		UpdateAlphaText(alpha)

		if not _G.ColorPickerFrame:IsVisible() then
			delayCall()
		else
			local opacityFunc = _G.ColorPickerFrame.opacityFunc
			if delayFunc and (delayFunc ~= opacityFunc) then
				delayFunc = opacityFunc
			elseif not delayFunc then
				delayFunc = opacityFunc
				--T.Delay(delayWait, delayCall)
			end
		end
	end
end

function ColorPicker:EnhanceColorPicker()
	if IsAddOnLoaded('ColorPickerPlus') then return end

	local ClassHeaderColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}

	--Skin the default frame, move default buttons into place
	_G.ColorPickerFrame:SetClampedToScreen(true)
	_G.ColorPickerFrame:SetFrameLevel(1)
	_G.ColorPickerFrame:SetFrameStrata("DIALOG")
	_G.ColorPickerFrame:ClearAllPoints()
	_G.ColorPickerFrame:SetPoint("LEFT", UIParent, "CENTER", 300, 0)
	
	_G.ColorPickerFrame:SetParent(UIParent)
	_G.ColorPickerFrame:CreateShadow()
	_G.ColorPickerFrame:CreateBackdrop("Transparent")
	
	_G.ColorPickerFrame:CreateMaxUIHeader(" ")

	if T.Retail then
		_G.ColorPickerFrame.Header:Hide()
		_G.ColorPickerFrame.Border:Hide()
	end
		
	_G.ColorPickerCancelButton:ClearAllPoints()
	_G.ColorPickerCancelButton:SetPoint("BOTTOMRIGHT", _G.ColorPickerFrame, "BOTTOMRIGHT", -6, 6)
	_G.ColorPickerCancelButton:SetPoint("BOTTOMLEFT", _G.ColorPickerFrame, "BOTTOM", 0, 6)
	_G.ColorPickerCancelButton:SkinButton()
	
	_G.ColorPickerOkayButton:ClearAllPoints()
	_G.ColorPickerOkayButton:SetPoint("BOTTOMLEFT", _G.ColorPickerFrame,"BOTTOMLEFT", 6,6)
	_G.ColorPickerOkayButton:SetPoint("RIGHT", _G.ColorPickerCancelButton,"LEFT", -4,0)
	_G.ColorPickerOkayButton:SkinButton()
	
	_G.OpacitySliderFrame:SkinScrollBar()

	_G.ColorPickerFrame:HookScript("OnShow", function(frame)
		-- get color that will be replaced
		local r, g, b = frame:GetColorRGB()
		_G.ColorPPOldColorSwatch:SetColorTexture(r,g,b)

		-- show/hide the alpha box
		if frame.hasOpacity then
			_G.ColorPPBoxA:Show()
			_G.ColorPPBoxLabelA:Show()
			_G.ColorPPBoxH:SetScript('OnTabPressed', ColorPPBoxA_SetFocus)
			UpdateAlphaText()
			UpdateColorTexts()
			frame:SetWidth(405)
		else
			_G.ColorPPBoxA:Hide()
			_G.ColorPPBoxLabelA:Hide()
			_G.ColorPPBoxH:SetScript('OnTabPressed', ColorPPBoxR_SetFocus)
			UpdateColorTexts()
			frame:SetWidth(345)
		end

		-- Memory Fix, Colorpicker will call the self.func() 100x per second, causing fps/memory issues,
		-- We overwrite these two scripts and set a limit on how often we allow a call their update functions
		_G.OpacitySliderFrame:SetScript('OnValueChanged', onValueChanged)
		frame:SetScript('OnColorSelect', onColorSelect)
	end)

	-- make the Color Picker dialog a bit taller, to make room for edit boxes
	_G.ColorPickerFrame:SetHeight(_G.ColorPickerFrame:GetHeight() + 40)

	-- move the Color Swatch
	_G.ColorSwatch:ClearAllPoints()
	_G.ColorSwatch:SetPoint("TOPLEFT", _G.ColorPickerFrame, "TOPLEFT", 215, -45)

	-- add Color Swatch for original color
	local t = _G.ColorPickerFrame:CreateTexture("ColorPPOldColorSwatch")
	local w = _G.ColorSwatch:GetWidth()
	local h = _G.ColorSwatch:GetHeight()
	t:SetWidth(w*0.75)
	t:SetHeight(h*0.75)
	t:SetColorTexture(0,0,0)
	-- OldColorSwatch to appear beneath ColorSwatch
	t:SetDrawLayer("BORDER")
	t:SetPoint("BOTTOMLEFT", "ColorSwatch", "TOPRIGHT", -(w/2), -(h/3))

	-- add Color Swatch for the copied color
	t = _G.ColorPickerFrame:CreateTexture("ColorPPCopyColorSwatch")
	t:SetColorTexture(0,0,0)
	t:SetWidth(w)
	t:SetHeight(h)
	t:Hide()

	-- add copy button to the _G.ColorPickerFrame
	local b = CreateFrame("Button", "ColorPPCopy", _G.ColorPickerFrame, "UIPanelButtonTemplate")
	b:SkinButton()
	b:SetText(CALENDAR_COPY_EVENT)
	b:SetWidth(60)
	b:SetHeight(22)
	b:SetPoint("TOPLEFT", "ColorSwatch", "BOTTOMLEFT", 0, -5)

	-- copy color into buffer on button click
	b:SetScript("OnClick", function()
		-- copy current dialog colors into buffer
		colorBuffer.r, colorBuffer.g, colorBuffer.b = _G.ColorPickerFrame:GetColorRGB()

		-- enable Paste button and display copied color into swatch
		_G.ColorPPPaste:Enable()
		_G.ColorPPCopyColorSwatch:SetColorTexture(colorBuffer.r, colorBuffer.g, colorBuffer.b)
		_G.ColorPPCopyColorSwatch:Show()

		colorBuffer.a = (_G.ColorPickerFrame.hasOpacity and _G.OpacitySliderFrame:GetValue()) or nil
	end)

	--class color button
	b = CreateFrame('Button', 'ColorPPClass', _G.ColorPickerFrame, 'UIPanelButtonTemplate')
	b:SetText(CLASS)
	b:SkinButton()
	b:SetWidth(80)
	b:SetHeight(22)
	b:SetPoint("TOP", "ColorPPCopy", "BOTTOMRIGHT", 0, -7)

	b:SetScript('OnClick', function()
		local color = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
		_G.ColorPickerFrame:SetColorRGB(color.r, color.g, color.b)
		_G.ColorSwatch:SetColorTexture(color.r, color.g, color.b)
		if _G.ColorPickerFrame.hasOpacity then
			_G.OpacitySliderFrame:SetValue(0)
		end
	end)

	-- add paste button to the _G.ColorPickerFrame
	b = CreateFrame("Button", "ColorPPPaste", _G.ColorPickerFrame, "UIPanelButtonTemplate")
	b:SetText(CALENDAR_PASTE_EVENT)
	b:SkinButton()
	b:SetWidth(60)
	b:SetHeight(22)
	b:SetPoint('TOPLEFT', 'ColorPPCopy', 'TOPRIGHT', 2, 0)
	b:Disable() -- enable when something has been copied

	-- paste color on button click, updating frame components
	b:SetScript("OnClick", function()
		_G.ColorPickerFrame:SetColorRGB(colorBuffer.r, colorBuffer.g, colorBuffer.b)
		_G.ColorSwatch:SetColorTexture(colorBuffer.r, colorBuffer.g, colorBuffer.b)
		if _G.ColorPickerFrame.hasOpacity then
			if colorBuffer.a then --color copied had an alpha value
				_G.OpacitySliderFrame:SetValue(colorBuffer.a)
			end
		end
	end)

	-- add defaults button to the _G.ColorPickerFrame
	b = CreateFrame("Button", "ColorPPDefault", _G.ColorPickerFrame, "UIPanelButtonTemplate")
	b:SetText(DEFAULT)
	b:SkinButton()
	b:SetFrameLevel(5)
	b:SetWidth(80)
	b:SetHeight(22)
	b:SetPoint("TOPLEFT", "ColorPPClass", "BOTTOMLEFT", 0, -7)
	b:Disable() -- enable when something has been copied
	b:SetScript("OnHide", function(btn)
		if btn.colors then
			wipe(btn.colors)
		end
	end)
	b:SetScript("OnShow", function(btn)
		if btn.colors then
			btn:Enable()
		else
			btn:Disable()
		end
	end)

	-- paste color on button click, updating frame components
	b:SetScript("OnClick", function(btn)
		local colors = btn.colors
		_G.ColorPickerFrame:SetColorRGB(colors.r, colors.g, colors.b)
		_G.ColorSwatch:SetColorTexture(colors.r, colors.g, colors.b)
		if _G.ColorPickerFrame.hasOpacity then
			if colors.a then
				_G.OpacitySliderFrame:SetValue(colors.a)
			end
		end
	end)

	-- position Color Swatch for copy color
	_G.ColorPPCopyColorSwatch:SetPoint("BOTTOM", "ColorPPPaste", "TOP", 0, 10)

	-- move the Opacity Slider Frame to align with bottom of Copy ColorSwatch
	_G.OpacitySliderFrame:ClearAllPoints()
	_G.OpacitySliderFrame:SetPoint("BOTTOM", "ColorPPDefault", "BOTTOM", 0, 0)
	_G.OpacitySliderFrame:SetPoint("RIGHT", "ColorPickerFrame", "RIGHT", -35, 18)

	-- set up edit box frames and interior label and text areas
	local boxes = { "R", "G", "B", "H", "A" }
	for i = 1, #boxes do
		local rgb = boxes[i]
		local box = CreateFrame("EditBox", "ColorPPBox"..rgb, _G.ColorPickerFrame, "InputBoxTemplate")
		box:SetPoint("TOP", "ColorPickerWheel", "BOTTOM", 0, -15)
		box:SetFrameStrata("DIALOG")
		box:SetAutoFocus(false)
		box:SetTextInsets(0,7,0,0)
		box:SetJustifyH("RIGHT")
		box:SetHeight(24)
		box:SetID(i)
		box:SkinEditBox()
		box:StripTextures()

		-- hex entry box
		if i == 4 then
			box:SetMaxLetters(6)
			box:SetWidth(56)
			box:SetNumeric(false)
		else
			box:SetMaxLetters(3)
			box:SetWidth(40)
			box:SetNumeric(true)
		end

		-- label
		local label = box:CreateFontString("ColorPPBoxLabel"..rgb, "ARTWORK", "GameFontNormalSmall")
		label:SetPoint("RIGHT", "ColorPPBox"..rgb, "LEFT", -5, 0)
		label:SetText(i == 4 and "#" or rgb)
		label:SetTextColor(1, 1, 1)

		-- set up scripts to handle event appropriately
		if i == 5 then
			box:SetScript("OnKeyUp", function(eb, key)
				local copyPaste = IsControlKeyDown() and key == 'V'
				if key == "BACKSPACE" or copyPaste or (strlen(key) == 1 and not IsModifierKeyDown()) then
					UpdateAlpha(eb)
				elseif key == "ENTER" or key == "ESCAPE" then
					eb:ClearFocus()
					UpdateAlpha(eb)
				end
			end)
		else
			box:SetScript("OnKeyUp", function(eb, key)
				local copyPaste = IsControlKeyDown() and key == 'V'
				if key == "BACKSPACE" or copyPaste or (strlen(key) == 1 and not IsModifierKeyDown()) then
					if i ~= 4 then UpdateColorTexts(nil, nil, nil, eb) end
					if i == 4 and eb:GetNumLetters() ~= 6 then return end
					UpdateColor()
				elseif key == "ENTER" or key == "ESCAPE" then
					eb:ClearFocus()
					UpdateColorTexts(nil, nil, nil, eb)
					UpdateColor()
				end
			end)
		end

		box:SetScript("OnEditFocusGained", function(eb) eb:SetCursorPosition(0) eb:HighlightText() end)
		box:SetScript("OnEditFocusLost", function(eb) eb:HighlightText(0,0) end)
		box:Show()
	end

	-- finish up with placement
	_G.ColorPPBoxA:SetPoint("RIGHT", "OpacitySliderFrame", "RIGHT", 10, 0)
	_G.ColorPPBoxH:SetPoint("RIGHT", "ColorPPDefault", "RIGHT", -10, 0)
	_G.ColorPPBoxB:SetPoint("RIGHT", "ColorPPDefault", "LEFT", -40, 0)
	_G.ColorPPBoxG:SetPoint("RIGHT", "ColorPPBoxB", "LEFT", -25, 0)
	_G.ColorPPBoxR:SetPoint("RIGHT", "ColorPPBoxG", "LEFT", -25, 0)

	-- define the order of tab cursor movement
	_G.ColorPPBoxR:SetScript("OnTabPressed", function() _G.ColorPPBoxG:SetFocus() end)
	_G.ColorPPBoxG:SetScript("OnTabPressed", function() _G.ColorPPBoxB:SetFocus() end)
	_G.ColorPPBoxB:SetScript("OnTabPressed", function() _G.ColorPPBoxH:SetFocus() end)
	_G.ColorPPBoxA:SetScript("OnTabPressed", function() _G.ColorPPBoxR:SetFocus() end)
end

function ColorPicker:Enable()
	self:EnhanceColorPicker()
end

ColorPicker:Enable()