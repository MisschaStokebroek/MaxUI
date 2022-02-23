------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up COMBOBAR.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local basePlayer = UnitFrames.Player
local Movers = T["Movers"]
local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}

------------------------------------------------------------------------------------------
-- CLASS RESOURCES
------------------------------------------------------------------------------------------
function UnitFrames:Player()
	-- Tukui
	basePlayer(self)

	-- MaxUI
	if not (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then return end
	local Health = self.Health
	ComboPointsBar = self.ComboPointsBar
	local ClassPowerTexture = T.GetTexture(C["ClassOptions"]["ClassPowerTexture"])
	local ClassPowerHeight = C["ClassOptions"]["ClassPowerHeight"]
	local ClassPowerWidth = C["ClassOptions"]["ClassPowerWidth"]
	local ClassPowerSpace = C["ClassOptions"]["ClassPowerSpace"]
	
	-- combopoints and bar
	if C.UnitFrames.ComboBar == true then
	
		if (Class == "ROGUE" or Class == "DRUID") then
		
			-- bar/anchor
			ComboPointsBar:SetFrameLevel(15)
			ComboPointsBar:SetAlpha(1)
			ComboPointsBar.Backdrop:SetAlpha(0)
			Movers:RegisterFrame(ComboPointsBar, "Combo Points")

			-- position/acnhor
			ComboPointsBar:ClearAllPoints()
			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical"	then
				ComboPointsBar:SetPoint("BOTTOM", Health, "BOTTOMRIGHT", 0, 10)
			else
				ComboPointsBar:SetPoint("CENTER", Health, "TOP", 0, 1)
			end

			-- size according to orientation
			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
				ComboPointsBar:SetSize((ClassPowerWidth), (6*ClassPowerHeight)+(5*ClassPowerSpace))
				if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
					ComboPointsBar:SetSize((6*ClassPowerWidth)+(5*ClassPowerSpace), ClassPowerHeight)
				end
			else
				ComboPointsBar:SetSize((6*ClassPowerWidth)+(5*ClassPowerSpace), ClassPowerHeight)
				if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
					ComboPointsBar:SetSize((ClassPowerWidth), (6*ClassPowerHeight)+(5*ClassPowerSpace))
				end
			end

			-- each point
			for i = 1, 6 do
				ComboPointsBar[i].Size6Points = ClassPowerWidth
				ComboPointsBar[i].Size5Points = ClassPowerWidth

				ComboPointsBar[i]:ClearAllPoints()
				ComboPointsBar[i]:CreateBackdrop(0,0,0,1)
				ComboPointsBar[i].Backdrop:SetOutside(ComboPointsBar[i])
				ComboPointsBar[i].Backdrop:CreateShadow()
				if C["General"]["ClassShadowExcludeUF"] then
					ComboPointsBar[i].Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
				end
				ComboPointsBar[i]:SetHeight(ClassPowerHeight)
				ComboPointsBar[i]:SetStatusBarTexture(ClassPowerTexture)

				if i == 1 then
					if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
						if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
							ComboPointsBar[i]:SetPoint("LEFT", ComboPointsBar, "LEFT", 0, 0)
							ComboPointsBar[i]:SetHeight(ClassPowerHeight)
							ComboPointsBar[i]:SetWidth(ClassPowerWidth)
						else
							ComboPointsBar[i]:SetPoint("BOTTOM", ComboPointsBar, "BOTTOM", 0, 0)
							ComboPointsBar[i]:SetHeight(ClassPowerHeight)
							ComboPointsBar[i]:SetWidth(ClassPowerWidth)
						end
					else
						if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
							ComboPointsBar[i]:SetPoint("BOTTOM", ComboPointsBar, "BOTTOM", 0, 0)
							ComboPointsBar[i]:SetHeight(ClassPowerHeight)
							ComboPointsBar[i]:SetWidth(ClassPowerWidth)
						else
							ComboPointsBar[i]:SetPoint("LEFT", ComboPointsBar, "LEFT", 0, 0)
							ComboPointsBar[i]:SetHeight(ClassPowerHeight)
							ComboPointsBar[i]:SetWidth(ClassPowerWidth)
						end
					end
				else
					if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
						if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
							ComboPointsBar[i]:SetPoint("LEFT", ComboPointsBar[i-1], "RIGHT", ClassPowerSpace, 0)
							ComboPointsBar[i]:SetHeight(ClassPowerHeight)
							ComboPointsBar[i]:SetWidth(ClassPowerWidth)
						else
							ComboPointsBar[i]:SetPoint("BOTTOMLEFT", ComboPointsBar[i-1], "TOPLEFT", -0, ClassPowerSpace)
							ComboPointsBar[i]:SetHeight(ClassPowerHeight)
							ComboPointsBar[i]:SetWidth(ClassPowerWidth)
						end
					else
						if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
							ComboPointsBar[i]:SetPoint("BOTTOMLEFT", ComboPointsBar[i-1], "TOPLEFT", -0, ClassPowerSpace)
							ComboPointsBar[i]:SetHeight(ClassPowerHeight)
							ComboPointsBar[i]:SetWidth(ClassPowerWidth)
						else
							ComboPointsBar[i]:SetPoint("LEFT", ComboPointsBar[i-1], "RIGHT", ClassPowerSpace, 0)
							ComboPointsBar[i]:SetHeight(ClassPowerHeight)
							ComboPointsBar[i]:SetWidth(ClassPowerWidth)
						end
					end
				end
			end
		end
	end
end