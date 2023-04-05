------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- setting up MAGE.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Movers = T["Movers"]
local basePlayer = UnitFrames.Player

if (Class ~= "MAGE") then return end

------------------------------------------------------------------------------------------
-- CLASS RESOURCES
------------------------------------------------------------------------------------------
function UnitFrames:Player()
	basePlayer(self)
	
	if not T.Retail or not C.UnitFrames.ClassBar then  return end
	if C.ClassOptions.ClassPowerStyle.Value ~= "MaxUI" then return end

	-- elements
	local ArcaneChargeBar = self.ArcaneChargeBar
	local Health = self.Health

	-- settings
	local ClassPowerHeight = C["ClassOptions"]["ClassPowerHeight"]
	local ClassPowerWidth = C["ClassOptions"]["ClassPowerWidth"]
	local ClassPowerSpace = C["ClassOptions"]["ClassPowerSpace"]

	-- texture
	local ClassPowerTexture = T.GetTexture(C["ClassOptions"]["ClassPowerTexture"])

	if C["ClassOptions"]["Mage"] == true then
	
		ArcaneChargeBar:SetFrameStrata("MEDIUM")
		ArcaneChargeBar:SetFrameLevel(5)
		ArcaneChargeBar.Backdrop:SetAlpha(0)

		if C["ClassOptions"]["ClassPowerBackdrop"] then
			ArcaneChargeBar.Backdrop:SetAlpha(1)
			ArcaneChargeBar.Backdrop:SetBackdropColor(0.11, 0.11, 0.11, 0.7)
			ArcaneChargeBar.Backdrop:CreateShadow()
		
			if C["Skins"]["UnitFramesFilter"] == true then 
				ArcaneChargeBar.Backdrop:CreateMaxUIFilter()
			end
		end
	
		if C["ClassOptions"]["ClassPowerMover"] then
			Movers:RegisterFrame(ArcaneChargeBar, "Arcane Charges")
		end

		-- position/acnhor
		ArcaneChargeBar:ClearAllPoints()
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical"	then
			ArcaneChargeBar:SetPoint("BOTTOM", Health, "BOTTOMRIGHT", 0, 10)
		else
			ArcaneChargeBar:SetPoint("CENTER", Health, "TOP", 0, 1)
		end

		-- size according to orientation
		if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
			ArcaneChargeBar:SetSize((4*ClassPowerWidth)+(3*ClassPowerSpace)+6, ClassPowerHeight+6)
		else
			ArcaneChargeBar:SetSize((ClassPowerWidth)+6, (4*ClassPowerHeight)+(3*ClassPowerSpace)+6)
		end
		
		-- each point
		for i = 1, 4 do
			ArcaneChargeBar[i]:SetFrameStrata("MEDIUM")
			ArcaneChargeBar[i]:SetFrameLevel(7)
			ArcaneChargeBar[i]:SetHeight(ClassPowerHeight)
			ArcaneChargeBar[i]:SetWidth(ClassPowerWidth)
			ArcaneChargeBar[i]:SetStatusBarTexture(ClassPowerTexture)

			ArcaneChargeBar[i]:CreateBackdrop()
			ArcaneChargeBar[i].Backdrop:SetOutside(ArcaneChargeBar[i])
			ArcaneChargeBar[i].Backdrop:CreateShadow()
			if C["General"]["ClassShadowExcludeUF"] then
				ArcaneChargeBar[i].Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
			end

			ArcaneChargeBar[i]:ClearAllPoints()
			if i == 1 then
				if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
					ArcaneChargeBar[i]:SetPoint("LEFT", ArcaneChargeBar, "LEFT", 3, 0)
				else
					ArcaneChargeBar[i]:SetPoint("BOTTOM", ArcaneChargeBar, "BOTTOM", 0, 3)
				end
			else
				if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
					ArcaneChargeBar[i]:SetPoint("LEFT", ArcaneChargeBar[i-1], "RIGHT", ClassPowerSpace, 0)
				else
					ArcaneChargeBar[i]:SetPoint("BOTTOM", ArcaneChargeBar[i-1], "TOP", -0, ClassPowerSpace)
				end
			end

			if C["Skins"]["UnitFramesFilter"] == true then 
				if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
					ArcaneChargeBar[i]:CreateMaxUIFilter()
				else
					ArcaneChargeBar[i]:CreateMaxUIVerticalFilter()
				end	
			end
		end
	else
		ArcaneChargeBar:ClearAllPoints()
	end
end