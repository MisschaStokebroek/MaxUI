------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up PLAYER FRAMES.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Movers = T["Movers"]
local basePlayer = UnitFrames.Player

if (Class ~= "MAGE") then
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
	if not T.Retail or not C.UnitFrames.ClassBar then  return end

	local ArcaneChargeBar = self.ArcaneChargeBar
	local Health = self.Health
	local ClassPowerTexture = T.GetTexture(C["ClassOptions"]["ClassPowerTexture"])
	local ClassPowerHeight = C["ClassOptions"]["ClassPowerHeight"]
	local ClassPowerWidth = C["ClassOptions"]["ClassPowerWidth"]
	local ClassPowerSpace = C["ClassOptions"]["ClassPowerSpace"]

	if C["ClassOptions"]["Mage"] == true then
	
		-- bar/anchor
		ArcaneChargeBar:SetFrameStrata("MEDIUM")
		ArcaneChargeBar:SetFrameLevel(5)
		ArcaneChargeBar.Backdrop:SetAlpha(0)
		Movers:RegisterFrame(ArcaneChargeBar, "Arcane Charges")
	
		-- position/acnhor
		ArcaneChargeBar:ClearAllPoints()
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical"	then
			ArcaneChargeBar:SetPoint("BOTTOM", Health, "BOTTOMRIGHT", 0, 10)
		else
			ArcaneChargeBar:SetPoint("CENTER", Health, "TOP", 0, 1)
		end

		-- size according to orientation
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical"	then
			ArcaneChargeBar:SetSize((ClassPowerWidth), (4*ClassPowerHeight)+(3*ClassPowerSpace))
			if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
				ArcaneChargeBar:SetSize((4*ClassPowerWidth)+(3*ClassPowerSpace), ClassPowerHeight)
			end
		else
			ArcaneChargeBar:SetSize((4*ClassPowerWidth)+(3*ClassPowerSpace), ClassPowerHeight)
			if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
				ArcaneChargeBar:SetSize((ClassPowerWidth), (4*ClassPowerHeight)+(3*ClassPowerSpace))
			end
		end
		
		-- each point
		for i = 1, 4 do
			ArcaneChargeBar[i]:SetFrameStrata("MEDIUM")
			ArcaneChargeBar[i]:SetFrameLevel(5)
			ArcaneChargeBar[i]:ClearAllPoints()
			ArcaneChargeBar[i]:CreateBackdrop()
			ArcaneChargeBar[i].Backdrop:SetOutside(ArcaneChargeBar[i])
			ArcaneChargeBar[i].Backdrop:CreateShadow()
			if C["General"]["ClassShadowExcludeUF"] then
				ArcaneChargeBar[i].Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
			end
			ArcaneChargeBar[i]:SetHeight(ClassPowerHeight)
			ArcaneChargeBar[i]:SetStatusBarTexture(ClassPowerTexture)

			if i == 1 then
				if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
						ArcaneChargeBar[i]:SetPoint("LEFT", ArcaneChargeBar, "LEFT", 0, 0)
						ArcaneChargeBar[i]:SetHeight(ClassPowerHeight)
						ArcaneChargeBar[i]:SetWidth(ClassPowerWidth)
					else
						ArcaneChargeBar[i]:SetPoint("BOTTOM", ArcaneChargeBar, "BOTTOM", 0, 0)
						ArcaneChargeBar[i]:SetHeight(ClassPowerHeight)
						ArcaneChargeBar[i]:SetWidth(ClassPowerWidth)
					end
				else
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
						ArcaneChargeBar[i]:SetPoint("BOTTOM", ArcaneChargeBar, "BOTTOM", 0, 0)
						ArcaneChargeBar[i]:SetHeight(ClassPowerHeight)
						ArcaneChargeBar[i]:SetWidth(ClassPowerWidth)
					else
						ArcaneChargeBar[i]:SetPoint("LEFT", ArcaneChargeBar, "LEFT", 0, 0)
						ArcaneChargeBar[i]:SetHeight(ClassPowerHeight)
						ArcaneChargeBar[i]:SetWidth(ClassPowerWidth)
					end
				end
			else
				if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
						ArcaneChargeBar[i]:SetPoint("LEFT", ArcaneChargeBar[i-1], "RIGHT", ClassPowerSpace, 0)
						ArcaneChargeBar[i]:SetHeight(ClassPowerHeight)
						ArcaneChargeBar[i]:SetWidth(ClassPowerWidth)
					else
						ArcaneChargeBar[i]:SetPoint("BOTTOMLEFT", ArcaneChargeBar[i-1], "TOPLEFT", -0, ClassPowerSpace)
						ArcaneChargeBar[i]:SetHeight(ClassPowerHeight)
						ArcaneChargeBar[i]:SetWidth(ClassPowerWidth)
					end
				else
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
						ArcaneChargeBar[i]:SetPoint("BOTTOMLEFT", ArcaneChargeBar[i-1], "TOPLEFT", -0, ClassPowerSpace)
						ArcaneChargeBar[i]:SetHeight(ClassPowerHeight)
						ArcaneChargeBar[i]:SetWidth(ClassPowerWidth)
					else
						ArcaneChargeBar[i]:SetPoint("LEFT", ArcaneChargeBar[i-1], "RIGHT", ClassPowerSpace, 0)
						ArcaneChargeBar[i]:SetHeight(ClassPowerHeight)
						ArcaneChargeBar[i]:SetWidth(ClassPowerWidth)
					end
				end
			end
		end
	else
		ArcaneChargeBar:ClearAllPoints()
	end
end