------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkinsBlizzard

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local ColorPickerSkin = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- SKIN ColorPicker
------------------------------------------------------------------------------------------
local function SkinBlizzardToMaxUIStyleColorPicker()
	ColorPickerFrame:SkinMaxUIBaseFrame(nil, nil, "Color Picker")
	ColorPickerFrame.Header:Hide()

	ColorPickerFrame:EnableMouse(true)
	ColorPickerFrame:SetFrameStrata("TOOLTIP")

	if ColorPickerFrame.Border then
		ColorPickerFrame.Border:StripTextures()
	end

	ColorPickerOkayButton:SkinMaxUIButton(true)
	ColorPickerCancelButton:SkinMaxUIButton(true)
end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function ColorPickerSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsBlizzard then return end

	if C["Skins"]["ColorPicker"] then
		SkinBlizzardToMaxUIStyleColorPicker()
	end
	self:UnregisterAllEvents()
end

ColorPickerSkin:RegisterEvent("PLAYER_LOGIN")
ColorPickerSkin:SetScript("OnEvent", ColorPickerSkin.OnEvent)