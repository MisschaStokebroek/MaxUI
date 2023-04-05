------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- setting up ALTERNATIVE POWER.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()

if not T.Retail then return end

local AltPower = T.Miscellaneous.AltPowerBar
local Miscellaneous = T["Miscellaneous"]
local baseEnable = AltPower.Enable

------------------------------------------------------------------------------------------
-- ALTERNATIVE POWER
------------------------------------------------------------------------------------------
local function MaxUIAltPowerBar()
	local AltPower = T.Miscellaneous.AltPowerBar
	local Height = C["Misc"]["AlternativePowerBarHeight"]
	local Width = C["Misc"]["AlternativePowerBarWidth"]
	local Texture = T.GetTexture(C["Misc"]["AlternativePowerBarTexture"])

	AltPower:SetFrameLevel(15)
	AltPower:SetFrameStrata("MEDIUM")
	AltPower:SetWidth(Width)
	AltPower:SetHeight(Height)
	AltPower:ClearAllPoints()
	AltPower:SetPoint("TOP", UIParent, "TOP", 0, -240)
	
	AltPower.Backdrop:SetAlpha(0.75)
	AltPower.Backdrop:CreateShadow()

	AltPower.Status:SetStatusBarTexture(Texture)
	AltPower.Status:SetInside(AltPower)
	AltPower.Status.Text:SetFont(C.Medias.MaxUIFont, 12)
	AltPower.Status.Text:ClearAllPoints()
	AltPower.Status.Text:SetPoint("RIGHT", AltPower, "RIGHT", -10, 0)
	AltPower.Status.Text:SetJustifyH("RIGHT")

	AltPower.Status.Percent:SetFont(C.Medias.MaxUIFont, 12)
	AltPower.Status.Percent:ClearAllPoints()
	AltPower.Status.Percent:SetPoint("LEFT", AltPower, "LEFT", 10, 0)
	AltPower.Status.Percent:SetJustifyH("LEFT")

	AltPower:SetScript("OnEnter", function(self)
		AltPower.Backdrop:SetBorderColor(AltPower.Status:GetStatusBarColor())
	end)

	AltPower:SetScript("OnLeave", function(self)
		AltPower.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
	end)

	if C["Skins"]["DataBarFilter"] == true then 
		AltPower.Status:CreateMaxUIFilter()
	end
end

------------------------------------------------------------------------------------------
-- ALTERNATIVE ENABLE
------------------------------------------------------------------------------------------
function AltPower:Enable()
	if not C["Misc"]["AlternativePowerBarEnable"] then return end
	baseEnable(self)
	
	if not (C.General.Themes.Value == "MaxUI") then return end
	MaxUIAltPowerBar()
end