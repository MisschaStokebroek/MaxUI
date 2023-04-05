------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

--setting up EVOKER.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Movers = T["Movers"]
local basePlayer = UnitFrames.Player

if (Class ~= "EVOKER") then return end

------------------------------------------------------------------------------------------
-- CLASS RESOURCES
------------------------------------------------------------------------------------------
function UnitFrames:Player()
	basePlayer(self)
	

	if not C.UnitFrames.ClassBar then return end
	if C.ClassOptions.ClassPowerStyle.Value ~= "MaxUI" then return end

   	-- elements
	local Essence = TukuiPlayerFrameEssence
	local EssencePoint = self.ClassPower
	local Health = self.Health

	-- settings
	local ClassPowerHeight = C["ClassOptions"]["ClassPowerHeight"]
	local ClassPowerWidth = C["ClassOptions"]["ClassPowerWidth"]
	local ClassPowerSpace = C["ClassOptions"]["ClassPowerSpace"]

	-- textures
	local ClassPowerTexture = T.GetTexture(C["ClassOptions"]["ClassPowerTexture"])

	if C["ClassOptions"]["Evoker"] == true then

		Essence:SetFrameStrata("MEDIUM")
		Essence:SetFrameLevel(5)
		Essence.Backdrop:SetAlpha(0)

		if C["ClassOptions"]["ClassPowerBackdrop"] then
			Essence.Backdrop:SetAlpha(1)
			Essence.Backdrop:SetBackdropColor(0.11, 0.11, 0.11, 0.7)
			Essence.Backdrop:CreateShadow()
			
			if C["Skins"]["UnitFramesFilter"] == true then 
				Essence.Backdrop:CreateMaxUIFilter()
			end
		end
	
		if C["ClassOptions"]["ClassPowerMover"] then
			Movers:RegisterFrame(Essence, "Essence")
		end

		-- position/acnhor
		Essence:ClearAllPoints()
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical"	then
			Essence:SetPoint("BOTTOM", Health, "BOTTOMRIGHT", 0, 10)
		else
			Essence:SetPoint("CENTER", Health, "TOP", 0, 1)
		end

		-- size according to orientation
		if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
			Essence:SetSize((6*ClassPowerWidth)+(5*ClassPowerSpace)+6, ClassPowerHeight+6)
		else
			Essence:SetSize(ClassPowerWidth+6, (6*ClassPowerHeight)+(5*ClassPowerSpace)+6)
		end
		
		-- each point
		for i = 1, 6 do
			EssencePoint[i]:SetFrameStrata("MEDIUM")
			EssencePoint[i]:SetFrameLevel(7)
			EssencePoint[i]:SetHeight(ClassPowerHeight)
			EssencePoint[i]:SetWidth(ClassPowerWidth)
			EssencePoint[i]:SetStatusBarTexture(ClassPowerTexture)

			EssencePoint[i]:CreateBackdrop()
			EssencePoint[i].Backdrop:SetParent(Essence)
			EssencePoint[i].Backdrop:SetOutside(EssencePoint[i])
			EssencePoint[i].Backdrop:CreateShadow()
			if C["General"]["ClassShadowExcludeUF"] then
				EssencePoint[i].Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
			end

			EssencePoint[i]:ClearAllPoints()
			if i == 1 then
				if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
					EssencePoint[i]:SetPoint("LEFT", Essence, "LEFT", 3, 0)
				else
					EssencePoint[i]:SetPoint("BOTTOM", Essence, "BOTTOM", 0, 3)
				end
			else
				if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
					EssencePoint[i]:SetPoint("LEFT", EssencePoint[i-1], "RIGHT", ClassPowerSpace, 0)
				else
					EssencePoint[i]:SetPoint("BOTTOM", EssencePoint[i-1], "TOP", -0, ClassPowerSpace)
				end
			end

			if C["Skins"]["UnitFramesFilter"] == true then 
				if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
					EssencePoint[i]:CreateMaxUIFilter()
				else
					EssencePoint[i]:CreateMaxUIVerticalFilter()
				end	
			end
		end

		self.ClassPower.PostUpdate = UnitFrames.UpdateMaxEssence
	else
		Essence:ClearAllPoints()
	end
end