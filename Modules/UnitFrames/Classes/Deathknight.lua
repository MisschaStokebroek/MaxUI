------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

--setting up DEATHKNIGHT.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Movers = T["Movers"]
local basePlayer = UnitFrames.Player

if (Class ~= "DEATHKNIGHT") then return end

------------------------------------------------------------------------------------------
-- CLASS RESOURCES
------------------------------------------------------------------------------------------
function UnitFrames:Player()
	basePlayer(self)
	
	if not C.UnitFrames.ClassBar then return end
	if C.ClassOptions.ClassPowerStyle.Value ~= "MaxUI" then return end

	-- elements
	local RunesBar = self.Runes
	local Health = self.Health

	-- settings
	local ClassPowerHeight = C["ClassOptions"]["ClassPowerHeight"]
	local ClassPowerWidth = C["ClassOptions"]["ClassPowerWidth"]
	local ClassPowerSpace = C["ClassOptions"]["ClassPowerSpace"]

	-- textures
	local ClassPowerTexture = T.GetTexture(C["ClassOptions"]["ClassPowerTexture"])

	if C["ClassOptions"]["Deathknight"] == true then

		RunesBar:SetFrameStrata("MEDIUM")
		RunesBar:SetFrameLevel(5)
		RunesBar.Backdrop:SetAlpha(0)

		if C["ClassOptions"]["ClassPowerBackdrop"] then
			RunesBar.Backdrop:SetAlpha(1)
			RunesBar.Backdrop:SetBackdropColor(0.11, 0.11, 0.11, 0.7)
			RunesBar.Backdrop:CreateShadow()
			
			if C["Skins"]["UnitFramesFilter"] == true then 
				RunesBar.Backdrop:CreateMaxUIFilter()
			end
		end
	
		if C["ClassOptions"]["ClassPowerMover"] then
			Movers:RegisterFrame(RunesBar, "Runes")
		end

		-- position/acnhor
		RunesBar:ClearAllPoints()
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical"	then
			RunesBar:SetPoint("BOTTOM", Health, "BOTTOMRIGHT", 0, 10)
		else
			RunesBar:SetPoint("CENTER", Health, "TOP", 0, 1)
		end

		-- size according to orientation
		if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
			RunesBar:SetSize((6*ClassPowerWidth)+(5*ClassPowerSpace)+6, ClassPowerHeight+6)
		else
			RunesBar:SetSize(ClassPowerWidth+6, (6*ClassPowerHeight)+(5*ClassPowerSpace)+6)
		end
      
        -- each point
		for i = 1, 6 do
			RunesBar[i]:SetFrameStrata("MEDIUM")
			RunesBar[i]:SetFrameLevel(7)
			RunesBar[i]:SetHeight(ClassPowerHeight)
			RunesBar[i]:SetWidth(ClassPowerWidth)
			RunesBar[i]:SetStatusBarTexture(ClassPowerTexture)

			RunesBar[i]:CreateBackdrop()
			RunesBar[i].Backdrop:SetOutside(RunesBar[i])
			RunesBar[i].Backdrop:CreateShadow()
			if C["General"]["ClassShadowExcludeUF"] then
				RunesBar[i].Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
			end

			RunesBar[i]:ClearAllPoints()
			if i == 1 then
				if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
					RunesBar[i]:SetPoint("LEFT", RunesBar, "LEFT", 3, 0)
				else
					RunesBar[i]:SetPoint("BOTTOM", RunesBar, "BOTTOM", 0, 3)
				end
			else
				if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
					RunesBar[i]:SetPoint("LEFT", RunesBar[i-1], "RIGHT", ClassPowerSpace, 0)
				else
					RunesBar[i]:SetPoint("BOTTOM", RunesBar[i-1], "TOP", -0, ClassPowerSpace)
				end
			end

			if C["Skins"]["UnitFramesFilter"] == true then 
				if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
					RunesBar[i]:CreateMaxUIFilter()
				else
					RunesBar[i]:CreateMaxUIVerticalFilter()
				end	
			end
		end
	else
		RunesBar:ClearAllPoints()
	end
end