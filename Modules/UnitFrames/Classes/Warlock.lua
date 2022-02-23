------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
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

if (Class ~= "WARLOCK") then
	return
end

------------------------------------------------------------------------------------------
-- CLASS RESOURCES
------------------------------------------------------------------------------------------
function UnitFrames:Player()
	-- Tukui
	basePlayer(self)
	
	-- MaxUI
	if not T.Retail or not C.UnitFrames.ClassBar then return end
	if not (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then return end

	local SoulShards = self.SoulShards
	local Health = self.Health
	local ClassPowerTexture = T.GetTexture(C["ClassOptions"]["ClassPowerTexture"])
	local ClassPowerHeight = C["ClassOptions"]["ClassPowerHeight"]
	local ClassPowerWidth = C["ClassOptions"]["ClassPowerWidth"]
	local ClassPowerSpace = C["ClassOptions"]["ClassPowerSpace"]

	if C["ClassOptions"]["Warlock"] == true then
	
		-- bar/anchor
		SoulShards:SetFrameLevel(5)
		SoulShards.Backdrop:SetAlpha(0)
		Movers:RegisterFrame(SoulShards, "Soul Shards")
	
		-- position/acnhor
		SoulShards:ClearAllPoints()
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical"	then
			SoulShards:SetPoint("BOTTOM", Health, "BOTTOMRIGHT", 0, 10)
		else
			SoulShards:SetPoint("CENTER", Health, "TOP", 0, 1)
		end

		-- size according to orientation
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical"	then
			SoulShards:SetSize((ClassPowerWidth), (5*ClassPowerHeight)+(4*ClassPowerSpace))
			if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
				SoulShards:SetSize((5*ClassPowerWidth)+(4*ClassPowerSpace), ClassPowerHeight)
			end
		else
			SoulShards:SetSize((5*ClassPowerWidth)+(4*ClassPowerSpace), ClassPowerHeight)
			if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
				SoulShards:SetSize((ClassPowerWidth), (5*ClassPowerHeight)+(4*ClassPowerSpace))
			end
		end
		
		-- each point
		for i = 1, 5 do
			SoulShards[i]:SetFrameStrata("MEDIUM")
			SoulShards[i]:SetFrameLevel(5)
			SoulShards[i]:ClearAllPoints()
			SoulShards[i]:CreateBackdrop(0,0,0,1)
			SoulShards[i].Backdrop:SetOutside(SoulShards[i])
			SoulShards[i].Backdrop:CreateShadow()
			if C["General"]["ClassShadowExcludeUF"] then
				SoulShards[i].Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
			end
			SoulShards[i]:SetHeight(ClassPowerHeight)
			SoulShards[i]:SetStatusBarTexture(ClassPowerTexture)

			if i == 1 then
				if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
						SoulShards[i]:SetPoint("LEFT", SoulShards, "LEFT", 0, 0)
						SoulShards[i]:SetHeight(ClassPowerHeight)
						SoulShards[i]:SetWidth(ClassPowerWidth)
					else
						SoulShards[i]:SetPoint("BOTTOM", SoulShards, "BOTTOM", 0, 0)
						SoulShards[i]:SetHeight(ClassPowerHeight)
						SoulShards[i]:SetWidth(ClassPowerWidth)
					end
				else
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
						SoulShards[i]:SetPoint("BOTTOM", SoulShards, "BOTTOM", 0, 0)
						SoulShards[i]:SetHeight(ClassPowerHeight)
						SoulShards[i]:SetWidth(ClassPowerWidth)
					else
						SoulShards[i]:SetPoint("LEFT", SoulShards, "LEFT", 0, 0)
						SoulShards[i]:SetHeight(ClassPowerHeight)
						SoulShards[i]:SetWidth(ClassPowerWidth)
					end
				end
			else
				if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
						SoulShards[i]:SetPoint("LEFT", SoulShards[i-1], "RIGHT", ClassPowerSpace, 0)
						SoulShards[i]:SetHeight(ClassPowerHeight)
						SoulShards[i]:SetWidth(ClassPowerWidth)
					else
						SoulShards[i]:SetPoint("BOTTOMLEFT", SoulShards[i-1], "TOPLEFT", -0, ClassPowerSpace)
						SoulShards[i]:SetHeight(ClassPowerHeight)
						SoulShards[i]:SetWidth(ClassPowerWidth)
					end
				else
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
						SoulShards[i]:SetPoint("BOTTOMLEFT", SoulShards[i-1], "TOPLEFT", -0, ClassPowerSpace)
						SoulShards[i]:SetHeight(ClassPowerHeight)
						SoulShards[i]:SetWidth(ClassPowerWidth)
					else
						SoulShards[i]:SetPoint("LEFT", SoulShards[i-1], "RIGHT", ClassPowerSpace, 0)
						SoulShards[i]:SetHeight(ClassPowerHeight)
						SoulShards[i]:SetWidth(ClassPowerWidth)
					end
				end
			end
		end
	else
		SoulShards:ClearAllPoints()
	end
end