------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- setting up COMBOBAR.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Movers = T["Movers"]
local basePlayer = UnitFrames.Player

------------------------------------------------------------------------------------------
-- CLASS RESOURCES
------------------------------------------------------------------------------------------
function UnitFrames:Player()
	basePlayer(self)

	if not C.UnitFrames.ClassBar then return end
	if C.ClassOptions.ClassPowerStyle.Value ~= "MaxUI" then return end

	-- elements
	local Health = self.Health
	ComboPointsBar = self.ComboPointsBar

	-- settings
	local ClassPowerHeight = C["ClassOptions"]["ClassPowerHeight"]
	local ClassPowerWidth = C["ClassOptions"]["ClassPowerWidth"]
	local ClassPowerSpace = C["ClassOptions"]["ClassPowerSpace"]

	-- textures
	local ClassPowerTexture = T.GetTexture(C["ClassOptions"]["ClassPowerTexture"])
	
	-- combopoints and bar
	if C.UnitFrames.ComboBar == true then	
		if (Class == "ROGUE" or Class == "DRUID") then
		
			ComboPointsBar:SetFrameStrata("MEDIUM")
			ComboPointsBar:SetFrameLevel(5)
			ComboPointsBar.Backdrop:SetAlpha(0)

			if C["ClassOptions"]["ClassPowerBackdrop"] then
				ComboPointsBar.Backdrop:SetAlpha(1)
				ComboPointsBar.Backdrop:SetBackdropColor(0.11, 0.11, 0.11, 0.7)
				ComboPointsBar.Backdrop:CreateShadow()
			
				if C["Skins"]["UnitFramesFilter"] == true then 
					ComboPointsBar.Backdrop:CreateMaxUIFilter()
				end
			end
		
			if C["ClassOptions"]["ClassPowerMover"] then
				Movers:RegisterFrame(ComboPointsBar, "Combo Points")
			end

			-- position/acnhor
			ComboPointsBar:ClearAllPoints()
			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical"	then
				ComboPointsBar:SetPoint("BOTTOM", Health, "BOTTOMRIGHT", 0, 10)
			else
				ComboPointsBar:SetPoint("CENTER", Health, "TOP", 0, 1)
			end

			-- size according to orientation
			if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
				ComboPointsBar:SetSize((6*ClassPowerWidth)+(6*ClassPowerSpace)+6, ClassPowerHeight+6)
			else
				ComboPointsBar:SetSize(ClassPowerWidth+6, (6*ClassPowerHeight)+(5*ClassPowerSpace)+6)
			end

			-- each point
			for i = 1, 7 do
				ComboPointsBar[i].Size7Points = ClassPowerWidth
				ComboPointsBar[i].Size6Points = ClassPowerWidth
				ComboPointsBar[i].Size5Points = ClassPowerWidth

				ComboPointsBar[i]:SetFrameStrata("MEDIUM")
				ComboPointsBar[i]:SetFrameLevel(7)
				ComboPointsBar[i]:SetHeight(ClassPowerHeight)
				ComboPointsBar[i]:SetWidth(ClassPowerWidth)
				ComboPointsBar[i]:SetStatusBarTexture(ClassPowerTexture)

				ComboPointsBar[i]:CreateBackdrop()
				ComboPointsBar[i].Backdrop:SetOutside(ComboPointsBar[i])
				ComboPointsBar[i].Backdrop:CreateShadow()
				
				if C["General"]["ClassShadowExcludeUF"] then
					ComboPointsBar[i].Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
				end

				if C["Skins"]["UnitFramesFilter"] == true then 
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
						ComboPointsBar[i]:CreateMaxUIFilter()
					else
						ComboPointsBar[i]:CreateMaxUIVerticalFilter()
					end	
				end

				ComboPointsBar[i]:ClearAllPoints()
				if i == 1 then
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
						ComboPointsBar[i]:SetPoint("LEFT", ComboPointsBar, "LEFT", 3, 0)
					else
						ComboPointsBar[i]:SetPoint("BOTTOM", ComboPointsBar, "BOTTOM", 0, 3)
					end
				else
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
						ComboPointsBar[i]:SetPoint("LEFT", ComboPointsBar[i-1], "RIGHT", ClassPowerSpace, 0)
					else
						ComboPointsBar[i]:SetPoint("BOTTOM", ComboPointsBar[i-1], "TOP", -0, ClassPowerSpace)
					end
				end
			end
		end
	else
		ComboPointsBar:ClearAllPoints()
	end
end