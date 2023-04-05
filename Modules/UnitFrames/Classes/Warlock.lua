------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- setting up WARLOCK.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Movers = T["Movers"]
local basePlayer = UnitFrames.Player

if (Class ~= "WARLOCK") then return end

------------------------------------------------------------------------------------------
-- CLASS RESOURCES
------------------------------------------------------------------------------------------
function UnitFrames:Player()
	basePlayer(self)
	
	if not T.Retail or not C.UnitFrames.ClassBar then return end
	if C.ClassOptions.ClassPowerStyle.Value ~= "MaxUI" then return end

	-- elements
	local SoulShards = self.SoulShards
	local Health = self.Health

	-- settings
	local ClassPowerHeight = C["ClassOptions"]["ClassPowerHeight"]
	local ClassPowerWidth = C["ClassOptions"]["ClassPowerWidth"]
	local ClassPowerSpace = C["ClassOptions"]["ClassPowerSpace"]

	-- texture
	local ClassPowerTexture = T.GetTexture(C["ClassOptions"]["ClassPowerTexture"])

	if C["ClassOptions"]["Warlock"] == true then
	
		SoulShards:SetFrameStrata("MEDIUM")
		SoulShards:SetFrameLevel(5)
		SoulShards.Backdrop:SetAlpha(0)
		
		if C["ClassOptions"]["ClassPowerBackdrop"] then
			SoulShards.Backdrop:SetAlpha(1)
			SoulShards.Backdrop:SetBackdropColor(0.11, 0.11, 0.11, 0.7)
			SoulShards.Backdrop:CreateShadow()
		
			if C["Skins"]["UnitFramesFilter"] == true then 
				SoulShards.Backdrop:CreateMaxUIFilter()
			end
		end
	
		if C["ClassOptions"]["ClassPowerMover"] then
 			Movers:RegisterFrame(SoulShards, "Soul Shards")
		end

		-- position/acnhor
		SoulShards:ClearAllPoints()
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical"	then
			SoulShards:SetPoint("BOTTOM", Health, "BOTTOMRIGHT", 0, 10)
		else
			SoulShards:SetPoint("CENTER", Health, "TOP", 0, 1)
		end

		-- size according to orientation
		if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
			SoulShards:SetSize((5*ClassPowerWidth)+(4*ClassPowerSpace)+6, ClassPowerHeight+6)
		else
			SoulShards:SetSize((ClassPowerWidth)+6, (5*ClassPowerHeight)+(4*ClassPowerSpace)+6)
		end
		
		-- each point
		for i = 1, 5 do
			SoulShards[i]:SetFrameStrata("MEDIUM")
			SoulShards[i]:SetFrameLevel(7)
			SoulShards[i]:SetHeight(ClassPowerHeight)
			SoulShards[i]:SetWidth(ClassPowerWidth)
			SoulShards[i]:SetStatusBarTexture(ClassPowerTexture)
			
			SoulShards[i]:CreateBackdrop()
			SoulShards[i].Backdrop:SetOutside(SoulShards[i])
			SoulShards[i].Backdrop:CreateShadow()
			if C["General"]["ClassShadowExcludeUF"] then
				SoulShards[i].Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
			end

			if C["Skins"]["UnitFramesFilter"] == true then 
				if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
					SoulShards[i]:CreateMaxUIFilter()
				else
					SoulShards[i]:CreateMaxUIVerticalFilter()
				end	
			end

			SoulShards[i]:ClearAllPoints()
			if i == 1 then
				if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
					SoulShards[i]:SetPoint("LEFT", SoulShards, "LEFT", 3, 0)
				else
					SoulShards[i]:SetPoint("BOTTOM", SoulShards, "BOTTOM", 0, 3)
				end
			else
				if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
					SoulShards[i]:SetPoint("LEFT", SoulShards[i-1], "RIGHT", ClassPowerSpace, 0)
				else
					SoulShards[i]:SetPoint("BOTTOM", SoulShards[i-1], "TOP", -0, ClassPowerSpace)
				end
			end
		end
	else
		SoulShards:ClearAllPoints()
	end
end