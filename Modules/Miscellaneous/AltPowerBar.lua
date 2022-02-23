------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
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
local Movers = T["Movers"]

------------------------------------------------------------------------------------------
-- ALTERNATIVE POWER
------------------------------------------------------------------------------------------
local function MaxUIAltPowerBar()
	local AltPower = T.Miscellaneous.AltPowerBar
	local BottomLine = BottomLine
	local Height = C["Misc"]["AlternativePowerBarHeight"]
	local Width = C["Misc"]["AlternativePowerBarWidth"]
	local Texture = T.GetTexture(C["Misc"]["AlternativePowerBarTexture"])

	AltPower:SetFrameLevel(15)
	AltPower:SetFrameStrata("HIGH")
	AltPower:SetWidth(Width)
	AltPower:SetHeight(Height)
	AltPower:ClearAllPoints()
	AltPower:SetPoint("TOP", UIParent, "TOP", 0, -240)
	
	AltPower.Backdrop:SetAlpha(0.75)
	AltPower.Backdrop:CreateShadow()

	AltPower.Status:SetStatusBarTexture(Texture)
	AltPower.Status:SetInside(AltPower)
	AltPower.Status.Text:SetFont(C.Medias.MaxUIFont, 12)

	AltPower:SetScript("OnEnter", function(self)
		AltPower.Backdrop:SetBorderColor(AltPower.Status:GetStatusBarColor())
	end)

	AltPower:SetScript("OnLeave", function(self)
		AltPower.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
	end)
end

------------------------------------------------------------------------------------------
-- ALTERNATIVE ENABLE
------------------------------------------------------------------------------------------
function AltPower:Enable()
	if not C["Misc"]["AlternativePowerBarEnable"] then return end

	-- Tukui
	baseEnable(self)
	
	-- MaxUI
	if not (C.General.Themes.Value == "MaxUI") then return end
	MaxUIAltPowerBar()
end