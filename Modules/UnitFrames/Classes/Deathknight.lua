------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

--setting up DEATHKNIGHT.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T["UnitFrames"]
local Movers = T["Movers"]
local basePlayer = UnitFrames.Player
local Class = select(2, UnitClass("player"))

if (Class ~= "DEATHKNIGHT") then
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

	local RunesBar = self.Runes
	local Health = self.Health
	local ClassPowerTexture = T.GetTexture(C["ClassOptions"]["ClassPowerTexture"])
	local ClassPowerHeight = C["ClassOptions"]["ClassPowerHeight"]
	local ClassPowerWidth = C["ClassOptions"]["ClassPowerWidth"]
	local ClassPowerSpace = C["ClassOptions"]["ClassPowerSpace"]

	if C["ClassOptions"]["Deathknight"] == true then
		-- bar/anchor
		RunesBar:SetFrameLevel(5)
		RunesBar.Backdrop:SetAlpha(0)
		Movers:RegisterFrame(RunesBar, "Runes")
	
		-- position/acnhor
		RunesBar:ClearAllPoints()
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical"	then
			RunesBar:SetPoint("BOTTOM", Health, "BOTTOMRIGHT", 0, 10)
		else
			RunesBar:SetPoint("CENTER", Health, "TOP", 0, 1)
		end

		-- size according to orientation
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical"	then
			RunesBar:SetSize((ClassPowerWidth), (6*ClassPowerHeight)+(5*ClassPowerSpace))
			if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
				RunesBar:SetSize((6*ClassPowerWidth)+(5*ClassPowerSpace), ClassPowerHeight)
			end
		else
			RunesBar:SetSize((6*ClassPowerWidth)+(5*ClassPowerSpace), ClassPowerHeight)
			if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
				RunesBar:SetSize((ClassPowerWidth), (6*ClassPowerHeight)+(5*ClassPowerSpace))
			end
		end
		
		-- each point
		for i = 1, 6 do
			RunesBar[i]:SetFrameStrata("MEDIUM")
			RunesBar[i]:SetFrameLevel(5)
			RunesBar[i]:ClearAllPoints()
			RunesBar[i]:CreateBackdrop()
			RunesBar[i].Backdrop:CreateShadow()
			if C["General"]["ClassShadowExcludeUF"] then
				RunesBar[i].Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
			end
			RunesBar[i].Backdrop:SetFrameLevel(5)
			RunesBar[i].Backdrop:SetOutside(RunesBar[i])
			RunesBar[i]:SetHeight(ClassPowerHeight)
			RunesBar[i]:SetStatusBarTexture(ClassPowerTexture)

			if i == 1 then
				if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
						RunesBar[i]:SetPoint("LEFT", RunesBar, "LEFT", 0, 0)
						RunesBar[i]:SetHeight(ClassPowerHeight)
						RunesBar[i]:SetWidth(ClassPowerWidth)
					else
						RunesBar[i]:SetPoint("BOTTOM", RunesBar, "BOTTOM", 0, 0)
						RunesBar[i]:SetHeight(ClassPowerHeight)
						RunesBar[i]:SetWidth(ClassPowerWidth)
					end
				else
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
						RunesBar[i]:SetPoint("BOTTOM", RunesBar, "BOTTOM", 0, 0)
						RunesBar[i]:SetHeight(ClassPowerHeight)
						RunesBar[i]:SetWidth(ClassPowerWidth)
					else
						RunesBar[i]:SetPoint("LEFT", RunesBar, "LEFT", 0, 0)
						RunesBar[i]:SetHeight(ClassPowerHeight)
						RunesBar[i]:SetWidth(ClassPowerWidth)
					end
				end
			else
				if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
						RunesBar[i]:SetPoint("LEFT", RunesBar[i-1], "RIGHT", ClassPowerSpace, 0)
						RunesBar[i]:SetHeight(ClassPowerHeight)
						RunesBar[i]:SetWidth(ClassPowerWidth)
					else
						RunesBar[i]:SetPoint("BOTTOMLEFT", RunesBar[i-1], "TOPLEFT", -0, ClassPowerSpace)
						RunesBar[i]:SetHeight(ClassPowerHeight)
						RunesBar[i]:SetWidth(ClassPowerWidth)
					end
				else
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
						RunesBar[i]:SetPoint("BOTTOMLEFT", RunesBar[i-1], "TOPLEFT", -0, ClassPowerSpace)
						RunesBar[i]:SetHeight(ClassPowerHeight)
						RunesBar[i]:SetWidth(ClassPowerWidth)
					else
						RunesBar[i]:SetPoint("LEFT", RunesBar[i-1], "RIGHT", ClassPowerSpace, 0)
						RunesBar[i]:SetHeight(ClassPowerHeight)
						RunesBar[i]:SetWidth(ClassPowerWidth)
					end
				end
			end
		end
	else
		RunesBar:ClearAllPoints()
	end
end