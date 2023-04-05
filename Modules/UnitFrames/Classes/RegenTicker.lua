------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- setting up MANAREGENTICKER.

-- NEED TO TEST FOR BCC AND CLASSIC

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()

if not T.BCC then return end

local UnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local basePlayer = UnitFrames.Player
local Movers = T["Movers"]
local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}

------------------------------------------------------------------------------------------
-- CLASS RESOURCES
------------------------------------------------------------------------------------------
function UnitFrames:Player()
	basePlayer(self)

	if not (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then return end
	
	-- elements
	local EnergyManaRegen = self.EnergyManaRegen

	-- energy/mana ticker
	if C.UnitFrames.PowerTick then
	
		if C["ClassOptions"]["MaxUITicker"] == true then 
			local EnergyTickerTracker = CreateFrame("StatusBar", "EnergyTickerTracker", UIParent)
			EnergyTickerTracker:SetTemplate()
			EnergyTickerTracker:SetPoint("CENTER", UIParent, "CENTER", 0, -330)
			EnergyTickerTracker:SetSize(C["ClassOptions"]["MaxUITickerLength"], 1)
			EnergyTickerTracker:SetFrameLevel(2)
			EnergyTickerTracker:SetFrameStrata("BACKGROUND")
			EnergyTickerTracker:SetAlpha(1)
			EnergyTickerTracker:CreateBackdrop()
			EnergyTickerTracker.Backdrop:CreateShadow()
			EnergyTickerTracker:SetStatusBarTexture(C.Medias.Blank)
			Movers:RegisterFrame(EnergyTickerTracker)

			if C["General"]["ClassColorLines"] == true then
				EnergyTickerTracker:SetStatusBarColor(unpack(ClassColor))
			else
				EnergyTickerTracker:SetStatusBarColor(unpack(C["General"]["BackdropColor"]))
			end
		
			EnergyManaRegen:ClearAllPoints()
			EnergyManaRegen:SetAllPoints(EnergyTickerTracker)
			EnergyManaRegen:SetParent(EnergyTickerTracker)
			EnergyManaRegen:SetFrameStrata("HIGH")
			EnergyManaRegen:SetFrameLevel(EnergyTickerTracker:GetFrameLevel() + 1)
		
			if C["ClassOptions"]["OrientationTicker"]["Value"] == "Vertical" then
				EnergyTickerTracker:Size(1, C["ClassOptions"]["MaxUITickerLength"])
				EnergyTickerTracker:ClearAllPoints()
				EnergyTickerTracker:SetPoint("RIGHT", Power, "LEFT", -3, -0)
				EnergyManaRegen:ClearAllPoints()
				EnergyManaRegen:SetAllPoints(EnergyTickerTracker)
				EnergyManaRegen:SetOrientation("VERTICAL")
			end
		else
	
			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
				EnergyManaRegen:SetOrientation("VERTICAL")
			end
		end	
	end
end