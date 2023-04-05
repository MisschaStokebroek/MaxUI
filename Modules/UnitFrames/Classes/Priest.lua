------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- setting up PRIEST.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Movers = T["Movers"]
local basePlayer = UnitFrames.Player

if (Class ~= "PRIEST") then	return end

------------------------------------------------------------------------------------------
-- CLASS RESOURCES
------------------------------------------------------------------------------------------
function UnitFrames:Player()
	basePlayer(self)
	
	if not T.Retail or not C.UnitFrames.ClassBar then return end
	if not (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then return end

	-- elements
	local Health = self.Health
	local Atonement = self.Atonement
	local AdditionalPower = self.AdditionalPower

	-- settings
	local PowerHeight = C["UF: Player"]["PowerHeight"]
	local PowerWidth = C["UF: Player"]["PowerWidth"]

	-- textures
	local ClassPowerTexture = T.GetTexture(C["ClassOptions"]["ClassPowerTexture"])

	-- atonement
	if C["ClassOptions"]["PriestAtonement"] == true then
		Atonement:ClearAllPoints()
		Atonement:SetPoint("RIGHT", Health, "TOPRIGHT", -10, 0)
		Atonement:SetHeight(PowerHeight-4)
		Atonement:SetWidth(PowerWidth)
		Atonement:SetStatusBarTexture(ClassPowerTexture)
		Atonement:SetFrameStrata("HIGH")
		Atonement:SetFrameLevel(6)
		
		Atonement.Backdrop:CreateShadow()
		if C["General"]["ClassShadowExcludeUF"] then
			Atonement.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
		end
		
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
			Atonement:SetHeight(PowerWidth)
			Atonement:SetWidth(PowerHeight-4)
			Atonement:SetOrientation("VERTICAL")
			Atonement:ClearAllPoints()
			Atonement:SetPoint("BOTTOM", Health, "BOTTOMRIGHT", 0, 10)
		end

		if C["Skins"]["UnitFramesFilter"] == true then 
			if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
				Atonement:CreateMaxUIFilter()
			else
				Atonement:CreateMaxUIVerticalFilter()
			end	
		end
	else
		Atonement:ClearAllPoints()
	end
end