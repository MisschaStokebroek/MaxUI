------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
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

if (Class ~= "PALADIN") then
	return
end

------------------------------------------------------------------------------------------
-- CLASS RESOURCES
------------------------------------------------------------------------------------------
function UnitFrames:Player()
	-- Tukui
	basePlayer(self)
	
	-- MaxUI
	if not (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then return end
	if not T.Retail or not C.UnitFrames.ClassBar then return end

	local HolyPower = self.HolyPower
	local Health = self.Health
	local ClassPowerTexture = T.GetTexture(C["ClassOptions"]["ClassPowerTexture"])
	local ClassPowerHeight = C["ClassOptions"]["ClassPowerHeight"]
	local ClassPowerWidth = C["ClassOptions"]["ClassPowerWidth"]
	local ClassPowerSpace = C["ClassOptions"]["ClassPowerSpace"]

	if C["ClassOptions"]["Paladin"] == true then
		-- bar/anchor
		HolyPower:SetFrameLevel(5)
		HolyPower.Backdrop:SetAlpha(0)
		Movers:RegisterFrame(HolyPower, "Holy Power")
	
		-- position/acnhor
		HolyPower:ClearAllPoints()
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical"	then
			HolyPower:SetPoint("BOTTOM", Health, "BOTTOMRIGHT", 0, 10)
		else
			HolyPower:SetPoint("CENTER", Health, "TOP", 0, 1)
		end

		-- size according to orientation
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical"	then
			HolyPower:SetSize((ClassPowerWidth), (5*ClassPowerHeight)+(4*ClassPowerSpace))
			if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
				HolyPower:SetSize((5*ClassPowerWidth)+(4*ClassPowerSpace), ClassPowerHeight)
			end
		else
			HolyPower:SetSize((5*ClassPowerWidth)+(4*ClassPowerSpace), ClassPowerHeight)
			if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
				HolyPower:SetSize((ClassPowerWidth), (5*ClassPowerHeight)+(4*ClassPowerSpace))
			end
		end
		
		-- each point
		for i = 1, 5 do
			HolyPower[i]:SetFrameStrata("MEDIUM")
			HolyPower[i]:SetFrameLevel(5)
			HolyPower[i]:ClearAllPoints()
			HolyPower[i]:CreateBackdrop(0,0,0,1)
			HolyPower[i].Backdrop:SetOutside(HolyPower[i])
			HolyPower[i].Backdrop:CreateShadow()
			if C["General"]["ClassShadowExcludeUF"] then
				HolyPower[i].Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
			end
			HolyPower[i]:SetHeight(ClassPowerHeight)
			HolyPower[i]:SetStatusBarTexture(ClassPowerTexture)

			if i == 1 then
				if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
						HolyPower[i]:SetPoint("LEFT", HolyPower, "LEFT", 0, 0)
						HolyPower[i]:SetHeight(ClassPowerHeight)
						HolyPower[i]:SetWidth(ClassPowerWidth)
					else
						HolyPower[i]:SetPoint("BOTTOM", HolyPower, "BOTTOM", 0, 0)
						HolyPower[i]:SetHeight(ClassPowerHeight)
						HolyPower[i]:SetWidth(ClassPowerWidth)
					end
				else
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
						HolyPower[i]:SetPoint("BOTTOM", HolyPower, "BOTTOM", 0, 0)
						HolyPower[i]:SetHeight(ClassPowerHeight)
						HolyPower[i]:SetWidth(ClassPowerWidth)
					else
						HolyPower[i]:SetPoint("LEFT", HolyPower, "LEFT", 0, 0)
						HolyPower[i]:SetHeight(ClassPowerHeight)
						HolyPower[i]:SetWidth(ClassPowerWidth)
					end
				end
			else
				if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
						HolyPower[i]:SetPoint("LEFT", HolyPower[i-1], "RIGHT", ClassPowerSpace, 0)
						HolyPower[i]:SetHeight(ClassPowerHeight)
						HolyPower[i]:SetWidth(ClassPowerWidth)
					else
						HolyPower[i]:SetPoint("BOTTOMLEFT", HolyPower[i-1], "TOPLEFT", -0, ClassPowerSpace)
						HolyPower[i]:SetHeight(ClassPowerHeight)
						HolyPower[i]:SetWidth(ClassPowerWidth)
					end
				else
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
						HolyPower[i]:SetPoint("BOTTOMLEFT", HolyPower[i-1], "TOPLEFT", -0, ClassPowerSpace)
						HolyPower[i]:SetHeight(ClassPowerHeight)
						HolyPower[i]:SetWidth(ClassPowerWidth)
					else
						HolyPower[i]:SetPoint("LEFT", HolyPower[i-1], "RIGHT", ClassPowerSpace, 0)
						HolyPower[i]:SetHeight(ClassPowerHeight)
						HolyPower[i]:SetWidth(ClassPowerWidth)
					end
				end
			end
		end
	else
		HolyPower:ClearAllPoints()
	end
end