------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
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

if (Class ~= "PRIEST") then
	return
end

------------------------------------------------------------------------------------------
-- CLASS RESOURCES
------------------------------------------------------------------------------------------
function UnitFrames:Player()
	-- Tukui
	basePlayer(self)
	
	-- MaxUI
	if not T.Retail or not C.UnitFrames.ClassBar then return end
	if not (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then return end

	local Health = self.Health
	--local Shadow = self.Shadow
	local Atonement = self.Atonement
	local ClassPowerTexture = T.GetTexture(C["ClassOptions"]["ClassPowerTexture"])
	local PowerTexture = T.GetTexture(C["UF: Player"]["PowerTexture"])
	local PowerHeight = C["UF: Player"]["PowerHeight"]
	local PowerWidth = C["UF: Player"]["PowerWidth"]
	local AdditionalPower = self.AdditionalPower

	-- atonement
	if C["ClassOptions"]["PriestAtonement"] == true then
		Atonement:ClearAllPoints()
		Atonement:SetPoint("RIGHT", Health, "TOPRIGHT", -10, 0)
		Atonement:SetHeight(PowerHeight-4)
		Atonement:SetWidth(PowerWidth)
		Atonement:SetStatusBarTexture(ClassPowerTexture)
		Atonement:SetFrameStrata("MEDIUM")
		Atonement:SetFrameLevel(5)
		Movers:RegisterFrame(Atonement, "Atonement")
		Atonement:CreateShadow()
		if C["General"]["ClassShadowExcludeUF"] then
			Atonement.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
		end
		
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
			Atonement:SetHeight(PowerWidth)
			Atonement:SetWidth(PowerHeight-4)
			Atonement:SetOrientation("VERTICAL")
			Atonement:SetFrameStrata("MEDIUM")
			Atonement:ClearAllPoints()
			Atonement:SetPoint("BOTTOM", Health, "BOTTOMRIGHT", 0, 10)
		end
	else
		Atonement:ClearAllPoints()
	end
end