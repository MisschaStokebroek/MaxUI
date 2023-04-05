-----------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-01-2023
------------------------------------------------------------------------------------------

-- setting up MaxUISkinsBlizzard

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local MacroSkin = CreateFrame("Frame")

local _G = _G
local next = next
local unpack = unpack
local hooksecurefunc = hooksecurefunc

------------------------------------------------------------------------------------------
-- SKIN Achievements
------------------------------------------------------------------------------------------
local function SkinMacroFrame()
	local MacroFrame = _G.MacroFrame

	-- frame
	MacroFrame:SkinMaxUIBaseFrame(true, true)
	MacroFrame:SetHeight(520)
	
	-- tabs
	for _, tab in next, {
		_G.MacroFrameTab1,
		_G.MacroFrameTab2,
	} do
		tab:SkinMaxUITab(true)
		tab.Text:SetAllPoints(tab)
	end

	-- scroll selector
	MacroFrame.MacroSelector.ScrollBar:SkinMaxUIScrollBarNew(true)
	MacroFrame.MacroSelector.ScrollBox:SkinMaxUIFrame()
	MacroFrame.MacroSelector.ScrollBox.Backdrop:ClearAllPoints()
	MacroFrame.MacroSelector.ScrollBox.Backdrop:SetPoint("TOPLEFT", -2, 2)
	MacroFrame.MacroSelector.ScrollBox.Backdrop:SetPoint("BOTTOMRIGHT", -2, -1)

	-- edit box
	_G.MacroFrameTextBackground:Hide()
	_G.MacroFrameScrollFrame:SkinMaxUIEditBox(true)
	_G.MacroFrameScrollFrame.Backdrop:SetPoint("TOPLEFT", -2, 2)
	_G.MacroFrameScrollFrame.Backdrop:SetPoint("BOTTOMRIGHT", -2, -1)

	_G.MacroFrameScrollFrameScrollBar:SkinMaxUIScrollBar(true)

	_G.MacroFrameEnterMacroText:ClearAllPoints()
	_G.MacroFrameEnterMacroText:SetPoint("BOTTOMLEFT", _G.MacroFrameScrollFrame, "TOPLEFT", 0, 6)

	_G.MacroFrameText:ClearAllPoints()
	_G.MacroFrameText:SetInside(_G.MacroFrameScrollFrame, 4, 4, -4, -4)

	_G.MacroFrameCharLimitText:ClearAllPoints()
	_G.MacroFrameCharLimitText:SetPoint("TOPLEFT", _G.MacroFrameScrollFrame, "BOTTOMLEFT", 0, -6)
end

local function SkinMacroButtons()
	local MacroFrame = _G.MacroFrame

	local MacroButtons = {
		_G.MacroDeleteButton,
		_G.MacroNewButton,
		_G.MacroExitButton,
		_G.MacroEditButton,
		_G.MacroSaveButton,
		_G.MacroCancelButton,
		_G.MacroPopupFrame.BorderBox.CancelButton,
		_G.MacroPopupFrame.BorderBox.OkayButton,
	}
	
	for _, Button in pairs(MacroButtons) do
		Button:SkinMaxUIButton(true)
	end

	_G.MacroDeleteButton:ClearAllPoints()
	_G.MacroNewButton:ClearAllPoints()
	_G.MacroExitButton:Hide()
	_G.MacroEditButton:ClearAllPoints()
	_G.MacroSaveButton:ClearAllPoints()
	_G.MacroCancelButton:ClearAllPoints()

	_G.MacroEditButton:SetPoint("BOTTOMLEFT", _G.MacroFrame, "BOTTOMLEFT", 12, 6)
	_G.MacroEditButton:SetPoint("BOTTOMRIGHT", MacroFrame, "BOTTOMRIGHT", -12, 6)
	
	_G.MacroSaveButton:SetPoint("BOTTOMLEFT", _G.MacroEditButton, "TOPLEFT", 0, 6)
	_G.MacroSaveButton:SetPoint("BOTTOMRIGHT", _G.MacroEditButton, "TOP", -3, 6)

	_G.MacroCancelButton:SetPoint("BOTTOMLEFT", _G.MacroEditButton, "TOP", 3, 6)
	_G.MacroCancelButton:SetPoint("BOTTOMRIGHT", _G.MacroEditButton, "TOPRIGHT", 0, 6)

	_G.MacroNewButton:SetPoint("BOTTOMLEFT", _G.MacroSaveButton, "TOPLEFT", 0, 6)
	_G.MacroNewButton:SetPoint("BOTTOMRIGHT", _G.MacroSaveButton, "TOPRIGHT", 0, 6)
	
	_G.MacroDeleteButton:SetPoint("BOTTOMLEFT", _G.MacroCancelButton, "TOPLEFT", 0, 6)
	_G.MacroDeleteButton:SetPoint("BOTTOMRIGHT", _G.MacroCancelButton, "TOPRIGHT", 0, 6)
end

local function SkinMacroPopupFrame()
	local MacroFrame = _G.MacroFrame
	local MacroPopupFrame = _G.MacroPopupFrame
	
	MacroPopupFrame:SkinMaxUIBaseFrame(true)
	MacroPopupFrame:SetHeight(520)
	MacroPopupFrame:ClearAllPoints()
	MacroPopupFrame:SetPoint("TOPLEFT", MacroFrame, "TOPRIGHT", 3, 0)

	MacroPopupFrame.BorderBox.IconSelectorEditBox:SkinMaxUIEditBox()
	MacroPopupFrame.BorderBox.IconSelectorEditBox.IconSelectorPopupNameLeft:Hide()
	MacroPopupFrame.BorderBox.IconSelectorEditBox.IconSelectorPopupNameMiddle:Hide()
	MacroPopupFrame.BorderBox.IconSelectorEditBox.IconSelectorPopupNameRight:Hide()
	
	MacroPopupFrame.IconSelector.ScrollBar:SkinMaxUIScrollBarNew(true)
	MacroPopupFrame.IconSelector.ScrollBox:SkinMaxUIFrame()

	MacroPopupFrame.BorderBox.IconSelectionText.Background = CreateFrame("Frame", nil, MacroPopupFrame)
	MacroPopupFrame.BorderBox.IconSelectionText.Background:SetHeight(12)
	MacroPopupFrame.BorderBox.IconSelectionText.Background:SetWidth(MacroPopupFrame.IconSelector.ScrollBox:GetWidth()-2)
	MacroPopupFrame.BorderBox.IconSelectionText.Background:SetPoint("BOTTOM", MacroPopupFrame.IconSelector.ScrollBox, "TOP", 0, 3)
	MacroPopupFrame.BorderBox.IconSelectionText.Background:SkinMaxUIFrame()
end


local function SkinMacroIcon()
	local MacroFrame = _G.MacroFrame

	-- handle the macro buttons
	hooksecurefunc(MacroFrame.MacroSelector.ScrollBox, 'Update', function()
		for _, button in next, { MacroFrame.MacroSelector.ScrollBox.ScrollTarget:GetChildren() } do
			if button.Icon and not button.isSkinned then
				--button.Icon:SetTexCoord(unpack(T.IconCoord))
				--button.Icon:SetInside()
				--button:SkinMaxUIButton()
			end
		end
	end)
end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function MacroSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsBlizzard then return end

	if C["Skins"]["Macros"] then
		if not IsAddOnLoaded("Blizzard_MacroUI") then
			LoadAddOn("Blizzard_MacroUI")
		end		
		SkinMacroFrame()
		SkinMacroPopupFrame()
		--SkinMacroIcon()
		SkinMacroButtons()
	end
	self:UnregisterAllEvents()
end

MacroSkin:RegisterEvent("PLAYER_LOGIN")
MacroSkin:SetScript("OnEvent", MacroSkin.OnEvent)