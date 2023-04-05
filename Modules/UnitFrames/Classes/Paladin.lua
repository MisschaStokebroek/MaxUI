------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- setting up PALADIN.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Movers = T["Movers"]
local basePlayer = UnitFrames.Player

if (Class ~= "PALADIN") then return end

------------------------------------------------------------------------------------------
-- CLASS RESOURCES
------------------------------------------------------------------------------------------
function UnitFrames:Player()
	basePlayer(self)
	
	if not T.Retail or not C.UnitFrames.ClassBar then return end
	if C.ClassOptions.ClassPowerStyle.Value ~= "MaxUI" then return end

	-- elements
	local HolyPower = self.HolyPower
	local Health = self.Health

	-- settings
	local ClassPowerHeight = C["ClassOptions"]["ClassPowerHeight"]
	local ClassPowerWidth = C["ClassOptions"]["ClassPowerWidth"]
	local ClassPowerSpace = C["ClassOptions"]["ClassPowerSpace"]

	-- textures
	local ClassPowerTexture = T.GetTexture(C["ClassOptions"]["ClassPowerTexture"])

	if C["ClassOptions"]["Paladin"] == true then

		HolyPower:SetFrameStrata("HIGH")
		HolyPower:SetFrameLevel(5)
		HolyPower.Backdrop:SetAlpha(0)

		if C["ClassOptions"]["ClassPowerBackdrop"] then
			HolyPower.Backdrop:SetAlpha(1)
			HolyPower.Backdrop:SetBackdropColor(0.11, 0.11, 0.11, 0.7)
			HolyPower.Backdrop:CreateShadow()
		
			if C["Skins"]["UnitFramesFilter"] == true then 
				HolyPower.Backdrop:CreateMaxUIFilter()
			end
		end	
	
		if C["ClassOptions"]["ClassPowerMover"] then
			Movers:RegisterFrame(HolyPower, "Holy Power")
		end

		-- position/acnhor
		HolyPower:ClearAllPoints()
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical"	then
			HolyPower:SetPoint("BOTTOM", Health, "BOTTOMRIGHT", 0, 10)
		else
			HolyPower:SetPoint("CENTER", Health, "TOP", 0, 1)
		end

		-- size according to orientation
		if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
			HolyPower:SetSize((5*ClassPowerWidth)+(4*ClassPowerSpace)+6, ClassPowerHeight+6)
		else
			HolyPower:SetSize(ClassPowerWidth+6, (5*ClassPowerHeight)+(4*ClassPowerSpace)+6)
		end

		-- each point
		for i = 1, 5 do
			HolyPower[i]:SetFrameStrata("MEDIUM")
			HolyPower[i]:SetFrameLevel(7)
			HolyPower[i]:SetHeight(ClassPowerHeight)
			HolyPower[i]:SetWidth(ClassPowerWidth)
			HolyPower[i]:SetStatusBarTexture(ClassPowerTexture)

			HolyPower[i]:CreateBackdrop()
			HolyPower[i].Backdrop:SetOutside(HolyPower[i])
			HolyPower[i].Backdrop:CreateShadow()
			if C["General"]["ClassShadowExcludeUF"] then
				HolyPower[i].Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
			end

			HolyPower[i]:ClearAllPoints()
			if i == 1 then
				if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
					HolyPower[i]:SetPoint("LEFT", HolyPower, "LEFT", 3, 0)
				else
					HolyPower[i]:SetPoint("BOTTOM", HolyPower, "BOTTOM", 0, 3)
				end
			else
				if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
					HolyPower[i]:SetPoint("LEFT", HolyPower[i-1], "RIGHT", ClassPowerSpace, 0)
				else
					HolyPower[i]:SetPoint("BOTTOM", HolyPower[i-1], "TOP", -0, ClassPowerSpace)
				end
			end

			if C["Skins"]["UnitFramesFilter"] == true then 
				if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
					HolyPower[i]:CreateMaxUIFilter()
				else
					HolyPower[i]:CreateMaxUIVerticalFilter()
				end	
			end
		end
	else
		HolyPower:ClearAllPoints()
	end
end