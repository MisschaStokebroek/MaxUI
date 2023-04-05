------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

--setting up MONK.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Movers = T["Movers"]
local basePlayer = UnitFrames.Player

if (Class ~= "MONK") then return end

------------------------------------------------------------------------------------------
-- CLASS RESOURCES
------------------------------------------------------------------------------------------
function UnitFrames:Player()
	basePlayer(self)
	
	if not C.UnitFrames.ClassBar then return end
	if C.ClassOptions.ClassPowerStyle.Value ~= "MaxUI" then return end

   	-- elements
	local Harmony = self.HarmonyBar
	local Health = self.Health

	-- settings
	local ClassPowerHeight = C["ClassOptions"]["ClassPowerHeight"]
	local ClassPowerWidth = C["ClassOptions"]["ClassPowerWidth"]
	local ClassPowerSpace = C["ClassOptions"]["ClassPowerSpace"]

	-- textures
	local ClassPowerTexture = T.GetTexture(C["ClassOptions"]["ClassPowerTexture"])

	if C["ClassOptions"]["Monk"] == true then

		Harmony:SetFrameStrata("MEDIUM")
		Harmony:SetFrameLevel(5)
		Harmony.Backdrop:SetAlpha(0)

		if C["ClassOptions"]["ClassPowerBackdrop"] then
			Harmony.Backdrop:SetAlpha(1)
			Harmony.Backdrop:SetBackdropColor(0.11, 0.11, 0.11, 0.7)
			Harmony.Backdrop:CreateShadow()
			
			if C["Skins"]["UnitFramesFilter"] == true then 
				Harmony.Backdrop:CreateMaxUIFilter()
			end
		end
	
		if C["ClassOptions"]["ClassPowerMover"] then
			Movers:RegisterFrame(Harmony, "Harmony")
		end

		-- position/acnhor
		Harmony:ClearAllPoints()
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical"	then
			Harmony:SetPoint("BOTTOM", Health, "BOTTOMRIGHT", 0, 10)
		else
			Harmony:SetPoint("CENTER", Health, "TOP", 0, 1)
		end

		-- size according to orientation
		if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
			Harmony:SetSize((6*ClassPowerWidth)+(5*ClassPowerSpace)+6, ClassPowerHeight+6)
		else
			Harmony:SetSize(ClassPowerWidth+6, (6*ClassPowerHeight)+(5*ClassPowerSpace)+6)
		end
		
		-- each point
		for i = 1, 6 do
			Harmony[i]:SetFrameStrata("MEDIUM")
			Harmony[i]:SetFrameLevel(7)
			Harmony[i]:SetHeight(ClassPowerHeight)
			Harmony[i]:SetWidth(ClassPowerWidth)
			Harmony[i]:SetStatusBarTexture(ClassPowerTexture)
			
			Harmony[i].Ascension = Harmony[i]:GetWidth()
			Harmony[i].NoTalent = Harmony[i]:GetWidth()

			Harmony[i]:CreateBackdrop()
			Harmony[i].Backdrop:SetOutside(Harmony[i])
			Harmony[i].Backdrop:CreateShadow()
			if C["General"]["ClassShadowExcludeUF"] then
				Harmony[i].Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
			end

			Harmony[i]:ClearAllPoints()
			if i == 1 then
				if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
					Harmony[i]:SetPoint("LEFT", Harmony, "LEFT", 3, 0)
				else
					Harmony[i]:SetPoint("BOTTOM", Harmony, "BOTTOM", 0, 3)
				end
			else
				if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
					Harmony[i]:SetPoint("LEFT", Harmony[i-1], "RIGHT", ClassPowerSpace, 0)
				else
					Harmony[i]:SetPoint("BOTTOM", Harmony[i-1], "TOP", -0, ClassPowerSpace)
				end
			end

			if C["Skins"]["UnitFramesFilter"] == true then 
				if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
					Harmony[i]:CreateMaxUIFilter()
				else
					Harmony[i]:CreateMaxUIVerticalFilter()
				end	
			end
		end
	else
		Harmony:ClearAllPoints()
	end
end