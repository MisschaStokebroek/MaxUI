------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkins

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local ColorPickerPlusSkin = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- SKIN simc
------------------------------------------------------------------------------------------
local function SkinColorPickerPlusSkinToMaxUIStyle()
	if ColorPickerFrame.IsMaxUISkinned then return end
	C["Skins"]["ColorPicker"] = false

	ColorPickerFrame:EnableMouse(true)

	for i = 1, ColorPickerFrame:GetNumRegions() do
		local Region = select(i, ColorPickerFrame:GetRegions())
		if Region and Region:GetObjectType() == "Texture" then
			Region:Hide()
			hooksecurefunc(Region, "Show", Region.Hide)
		end
	end

	if T.Retail then
		ColorPPHeaderTitle:Hide()
	end
	
	ColorPickerFrame:SkinMaxUIBaseFrame(nil, nil, "Color Picker Plus")
	ColorPickerFrame:SetFrameStrata("TOOLTIP")

	if ColorPickerFrame.Border then
		ColorPickerFrame.Border:StripTextures()
	end

	ColorPPSwitcher:SkinMaxUIButton(true)
	ColorPPCopy:SkinMaxUIButton(true)
	ColorPPPaste:SkinMaxUIButton(true)
	ColorPickerOkayButton:SkinMaxUIButton(true)
	ColorPickerCancelButton:SkinMaxUIButton(true)
	
	ColorPickerOkayButton:ClearAllPoints()
	ColorPickerOkayButton:SetPoint("RIGHT", ColorPickerCancelButton, "LEFT", -2, 0)

	ColorPPSwitcher:ClearAllPoints()
	ColorPPSwitcher:SetPoint("RIGHT", ColorPickerOkayButton, "LEFT", -12, 0)

	ColorPPHelp:ClearAllPoints()
	ColorPPHelp:SetPoint("RIGHT", ColorPPSwitcher, "LEFT", -2, 0)

	ColorPickerFrame.IsMaxUISkinned = true
end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function ColorPickerPlusSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	--if not T.Retail then return end
	if not C.Skins.MaxUISkinsAddons then return end

	if IsAddOnLoaded('ColorPickerPlus') and C["AddOns"]["ColorPickerPlusSkin"] then 
		SkinColorPickerPlusSkinToMaxUIStyle()
	end
	self:UnregisterAllEvents()
end

ColorPickerPlusSkin:RegisterEvent("PLAYER_LOGIN")
ColorPickerPlusSkin:SetScript("OnEvent", ColorPickerPlusSkin.OnEvent)