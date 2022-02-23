------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

--setting up MONK.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T["UnitFrames"]
local Movers = T["Movers"]
local basePlayer = UnitFrames.Player
local Class = select(2, UnitClass("player"))

if (Class ~= "MONK") then
	return
end

------------------------------------------------------------------------------------------
-- CLASS RESOURCES
------------------------------------------------------------------------------------------
function UnitFrames:Player()
	-- Tukui
	basePlayer(self)
	
	-- MaxUI
	if not C.UnitFrames.ClassBar then return end
	if not (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then return end

	local Harmony = self.HarmonyBar
	local Health = self.Health
	local ClassPowerTexture = T.GetTexture(C["ClassOptions"]["ClassPowerTexture"])
	local ClassPowerHeight = C["ClassOptions"]["ClassPowerHeight"]
	local ClassPowerWidth = C["ClassOptions"]["ClassPowerWidth"]
	local ClassPowerSpace = C["ClassOptions"]["ClassPowerSpace"]

	if C["ClassOptions"]["Monk"] == true then
		-- bar/anchor
		Harmony:SetFrameLevel(5)
		Harmony.Backdrop:SetAlpha(0)
		Movers:RegisterFrame(Harmony, "Harmony / Chi")
	
		-- position/acnhor
		Harmony:ClearAllPoints()
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical"	then
			Harmony:SetPoint("BOTTOM", Health, "BOTTOMRIGHT", 0, 10)
		else
			Harmony:SetPoint("CENTER", Health, "TOP", 0, 1)
		end

		-- size according to orientation
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical"	then
			Harmony:SetSize((ClassPowerWidth), (6*ClassPowerHeight)+(5*ClassPowerSpace))
			if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
				Harmony:SetSize((6*ClassPowerWidth)+(5*ClassPowerSpace), ClassPowerHeight)
			end
		else
			Harmony:SetSize((6*ClassPowerWidth)+(5*ClassPowerSpace), ClassPowerHeight)
			if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
				Harmony:SetSize((ClassPowerWidth), (6*ClassPowerHeight)+(5*ClassPowerSpace))
			end
		end
		
		-- each point
		for i = 1, 6 do
			Harmony[i]:SetFrameStrata("MEDIUM")
			Harmony[i]:SetFrameLevel(5)
			Harmony[i]:ClearAllPoints()
			Harmony[i]:CreateBackdrop()
			Harmony[i].Backdrop:CreateShadow()
			if C["General"]["ClassShadowExcludeUF"] then
				Harmony[i].Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
			end
			Harmony[i].Backdrop:SetFrameLevel(5)
			Harmony[i].Backdrop:SetOutside(Harmony[i])
			Harmony[i]:SetHeight(ClassPowerHeight)
			Harmony[i]:SetStatusBarTexture(ClassPowerTexture)

			if i == 1 then
				if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
						Harmony[i]:SetPoint("LEFT", Harmony, "LEFT", 0, 0)
						Harmony[i]:SetHeight(ClassPowerHeight)
						Harmony[i]:SetWidth(ClassPowerWidth)
						Harmony[i].Ascension = Harmony[i]:GetWidth()
						Harmony[i].NoTalent = (ClassPowerWidth*6/5) + (ClassPowerSpace*1/5)
					else
						Harmony[i]:SetPoint("BOTTOM", Harmony, "BOTTOM", 0, 0)
						Harmony[i]:SetHeight(ClassPowerHeight)
						Harmony[i]:SetWidth(ClassPowerWidth)
						Harmony[i].Ascension = Harmony[i]:GetWidth()
						Harmony[i].NoTalent = (ClassPowerWidth*6/5) + (ClassPowerSpace*1/5)
					end
				else
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
						Harmony[i]:SetPoint("BOTTOM", Harmony, "BOTTOM", 0, 0)
						Harmony[i]:SetHeight(ClassPowerHeight)
						Harmony[i]:SetWidth(ClassPowerWidth)
						Harmony[i].Ascension = Harmony[i]:GetWidth()
						Harmony[i].NoTalent = (ClassPowerWidth*6/5) + (ClassPowerSpace*1/5)
					else
						Harmony[i]:SetPoint("LEFT", Harmony, "LEFT", 0, 0)
						Harmony[i]:SetHeight(ClassPowerHeight)
						Harmony[i]:SetWidth(ClassPowerWidth)
						Harmony[i].Ascension = Harmony[i]:GetWidth()
						Harmony[i].NoTalent = (ClassPowerWidth*6/5) + (ClassPowerSpace*1/5)
					end
				end
			else
				if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
						Harmony[i]:SetPoint("LEFT", Harmony[i-1], "RIGHT", ClassPowerSpace, 0)
						Harmony[i]:SetHeight(ClassPowerHeight)
						Harmony[i]:SetWidth(ClassPowerWidth)
						Harmony[i].Ascension = Harmony[i]:GetWidth()
						Harmony[i].NoTalent = (ClassPowerWidth*6/5) + (ClassPowerSpace*1/5)
					else
						Harmony[i]:SetPoint("BOTTOMLEFT", Harmony[i-1], "TOPLEFT", -0, ClassPowerSpace)
						Harmony[i]:SetHeight(ClassPowerHeight)
						Harmony[i]:SetWidth(ClassPowerWidth)
						Harmony[i].Ascension = Harmony[i]:GetWidth()
						Harmony[i].NoTalent = (ClassPowerWidth*6/5) + (ClassPowerSpace*1/5)
					end
				else
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
						Harmony[i]:SetPoint("BOTTOMLEFT", Harmony[i-1], "TOPLEFT", -0, ClassPowerSpace)
						Harmony[i]:SetHeight(ClassPowerHeight)
						Harmony[i]:SetWidth(ClassPowerWidth)
						Harmony[i].Ascension = Harmony[i]:GetWidth()
						Harmony[i].NoTalent = (ClassPowerWidth*6/5) + (ClassPowerSpace*1/5)
					else
						Harmony[i]:SetPoint("LEFT", Harmony[i-1], "RIGHT", ClassPowerSpace, 0)
						Harmony[i]:SetHeight(ClassPowerHeight)
						Harmony[i]:SetWidth(ClassPowerWidth)
						Harmony[i].Ascension = Harmony[i]:GetWidth()
						Harmony[i].NoTalent = (ClassPowerWidth*6/5) + (ClassPowerSpace*1/5)
					end
				end
			end
		end
	else
		Harmony:ClearAllPoints()
	end
end