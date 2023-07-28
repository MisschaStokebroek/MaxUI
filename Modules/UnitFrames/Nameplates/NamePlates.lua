------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- Setting up Nameplates.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local TukuiUnitFrames = T["UnitFrames"]
local baseNameplates = TukuiUnitFrames.Nameplates

------------------------------------------------------------------------------------------
-- NAMEPLATE ADJUSTMENTS
------------------------------------------------------------------------------------------
function TukuiUnitFrames:Nameplates()
	baseNameplates(self)

	-- wow

	-- elements
	local Health = self.Health
	local Name = self.Name
	local Power = self.Power
	local Castbar = self.Castbar
	local RaidIcon = self.RaidTargetIndicator
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs
	local Highlight = self.Highlight
	local QuestIcon = self.QuestIcon
	local ClassIcon = self.ClassIcon

	-- settings
	local NamePlateHeight = C["NamePlates"]["Height"]
	local NamePlateWidth = C["NamePlates"]["Width"]
	local CastbarHeight = C["NamePlates"]["CastHeight"]
	local DebuffAnchorSpace = C["NamePlates"]["DebuffAnchorSpace"]
	-- fonts
	local NamePlateFont = T.GetFont(C["NamePlates"]["Font"])
	local HealthFont = T.GetFont(C["NamePlates"]["Font"])
	local HealthFontSize = C["NamePlates"]["HealthFontSize"]/10

	-- textures

	-- MaxUI

------------------------------------------------------------------------------------------
-- ADDED OPTIONS
------------------------------------------------------------------------------------------
	-- shadow colors
	if C["General"]["ClassShadowExcludeUF"] then
		self.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
	end
	
	if C["Skins"]["NamePlatesFilter"] == true then 
		Health:CreateMaxUIFilter()
		Power:CreateMaxUIFilter()
		Castbar:CreateMaxUIFilter()
	end

	-- health tag
	Health.Value:ClearAllPoints()
	Health.Value:SetPoint("RIGHT", Health, "RIGHT", -2, 0)
	Health.Value:SetJustifyH("RIGHT")
	Health.Value:SetFontObject(HealthFont)
	Health.Value:SetScale(HealthFontSize)
	self:Tag(Health.Value, C["NamePlates"]["HealthTag"]["Value"])
	
	if T.Retail and C.NamePlates.QuestIcon then
		QuestIcon:ClearAllPoints()
		QuestIcon:SetPoint("BOTTOM", Name, "TOP", 0, 0)
		QuestIcon:SetWidth(C["NamePlates"]["QuestIconSize"])
		QuestIcon:SetHeight(C["NamePlates"]["QuestIconSize"])
	end

	self:Tag(Name, C["NamePlates"]["NameTag"]["Value"])
	
	-- glow adjustments
	if C["NamePlates"]["TargetHighlight"] == false then 
		Highlight:SetAlpha(0)
	end
	
------------------------------------------------------------------------------------------
-- COLOR THEME
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Colorstyle"]["Value"] == "Dark" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = false
		Health.colorReaction = false
		Health.colorThreat = C.NamePlates.ColorThreat
	elseif C["UnitFrames"]["Colorstyle"]["Value"] == "Gradient" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = false
		Health.colorReaction = false
		Health.colorSmooth = true
		Health.colorThreat = C.NamePlates.ColorThreat
	elseif C["UnitFrames"]["Colorstyle"]["Value"] == "Class" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = true
		Health.colorReaction = true
		Health.colorThreat = C.NamePlates.ColorThreat
	elseif C["UnitFrames"]["Colorstyle"]["Value"] == "Custom" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = false
		Health.colorReaction = false
		Health.colorThreat = C.NamePlates.ColorThreat
	end	
	Health.PreUpdate = TukuiUnitFrames.PreUpdateHealth

------------------------------------------------------------------------------------------
-- BUFFS AND DEBUFFS
------------------------------------------------------------------------------------------
	-- Debuffs
	if C["NamePlates"]["Debuffs"] == true then
		if C["NamePlates"]["DebuffsOnTop"] == true then
			Debuffs:ClearAllPoints()
			Debuffs:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 18+DebuffAnchorSpace)
		end
		Debuffs:SetHeight(C["NamePlates"]["DebuffSize"])
		Debuffs.size = C["NamePlates"]["DebuffSize"]
	else
		Debuffs:Kill()	
	end
	
------------------------------------------------------------------------------------------
-- MaxUI UF STYLE
------------------------------------------------------------------------------------------
	if C["NamePlates"]["Style"]["Value"] ~= "MaxUI" then return end

	-- Name
	Name:ClearAllPoints()
	Name:SetParent(self)
	Name:SetPoint("BOTTOM", self, "TOP", 0, 4)
	Name:SetFontObject(NamePlateFont)
	Name:SetScale(C["NamePlates"]["FontSize"]/10)
	
	-- Health
	Health:ClearAllPoints()
	Health:SetAllPoints(self)

	-- Power
	Power:ClearAllPoints()
	Power:SetWidth(NamePlateWidth/2)
	Power:SetHeight(NamePlateHeight/2)
	Power:SetPoint("LEFT", Health, "BOTTOMLEFT", 4, 0)
	Power:CreateBackdrop()
	Power.Backdrop:CreateShadow()
	if C["General"]["ClassShadowExcludeUF"] then
		Power.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, 1)
	end
	Power:SetFrameLevel(Health:GetFrameLevel() +6)
	
	-- castbar
	if C.NamePlates.NameplateCastBar then
		Castbar.Spark:Kill()

		Castbar:SetParent(self)
		Castbar:SetFrameLevel(self:GetFrameLevel()+1)
		Castbar:CreateBackdrop()
		Castbar.Backdrop:SetSize(NamePlateWidth+4, NamePlateHeight+4)
		Castbar.Backdrop:CreateShadow()
		Castbar:SetHeight(CastbarHeight)
		
		Castbar:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 0, -10)
		Castbar:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", 0, -10)

		Castbar.Button:SetWidth(CastbarHeight+6+NamePlateHeight)
		Castbar.Button:SetHeight(CastbarHeight+6+NamePlateHeight)
		Castbar.Button:ClearAllPoints()
		Castbar.Button:SetPoint("TOPRIGHT", self, "TOPLEFT", -2, 0)

		Castbar.Text:ClearAllPoints()
		Castbar.Text:SetPoint("TOPLEFT", Castbar, "BOTTOMLEFT", 0, -2)
		Castbar.Text:SetJustifyH("LEFT")
		
		if C["NamePlates"]["CastbarFullNameplateOverlap"] == true then 
			Castbar:ClearAllPoints()
			Castbar:SetAllPoints(self)
			if C["NamePlates"]["Debuffs"] == true then
				if C["NamePlates"]["DebuffsOnTop"] == false then
					Castbar.Text:ClearAllPoints()
					Castbar.Text:SetPoint("BOTTOM", Name, "TOP", 0, 2)
					Castbar.Text:SetJustifyH("CENTER")						
				end
			end
		end
		
		if C["General"]["ClassShadowExcludeUF"] then
			Castbar.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
			Castbar.Button.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
		end
	end

	-- stealable buffs
	if C["NamePlates"]["StealableBuffs"] then
		Buffs:ClearAllPoints()
		Buffs:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", 0, -6)
		Buffs:SetWidth((C["NamePlates"]["StealableBuffsSize"]*3)+8)
		Buffs:SetHeight(C["NamePlates"]["StealableBuffsSize"])
		--Buffs:CreateBackdrop()
		Buffs.size = C["NamePlates"]["StealableBuffsSize"]
		Buffs.num = C["NamePlates"]["NumberStealableBuffs"] 
		Buffs.numRow = 1
		Buffs.disableMouse = true
		Buffs.spacing = 2
		Buffs.initialAnchor = "TOPRIGHT"
		Buffs["growth-y"] = "DOWN"
		Buffs["growth-x"] = "LEFT"
	else
		Buffs.num = 0
	end	

	if C["NamePlates"]["DebuffsOnTop"] ~= true then
		Debuffs:ClearAllPoints()
		Debuffs:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 0, -DebuffAnchorSpace)
	end

	-- RaidIcon
	RaidIcon:SetParent(self)
	RaidIcon:SetWidth(C["NamePlates"]["MarkerSize"])
	RaidIcon:SetHeight(C["NamePlates"]["MarkerSize"])
	RaidIcon:ClearAllPoints()
	RaidIcon:SetPoint("BOTTOM", Name, "TOP", 0, 4)

	-- questicon
	if T.Retail and C.NamePlates.QuestIcon then
		QuestIcon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Custom\QuestIcon.tga]])
		QuestIcon:SetVertexColor(1, 220/255, 0.3)
		QuestIcon:SetSize(20, 40)
	end

	-- classicon
	if C.NamePlates.ClassIcon then
		ClassIcon:SetSize(32, 32)
		ClassIcon:ClearAllPoints()
		ClassIcon:SetPoint("BOTTOM", Name, "TOP", 0, 0)
		ClassIcon.Backdrop:Hide()
	end
	
	-- PVP Classification
	--if C.NamePlates.RoleIndicator then

	--end
	
	-- PVP Classification
	if T.Retail and C.NamePlates.PvPClassificationIndicator then
		local PvPClassificationIndicator = Health:CreateTexture(nil, 'OVERLAY')
		PvPClassificationIndicator:SetSize(40, 40)
		PvPClassificationIndicator:SetPoint("BOTTOM", self, "TOP", 0, 12)
		self.PvPClassificationIndicator = PvPClassificationIndicator
	end
	
	-- PVP indicator and badge
	if T.Retail and C.NamePlates.PvPIndicator then
		local PvPIndicator = self:CreateTexture(nil, 'ARTWORK', nil, 1)
		PvPIndicator:SetSize(24, 24)
		PvPIndicator:SetPoint("BOTTOMLEFT", Name, "BOTTOMRIGHT", -2, -4)
		self.PvPIndicator = PvPIndicator
	
		if C.NamePlates.Badge then
			local Badge = self:CreateTexture(nil, 'ARTWORK')
			Badge:SetSize(24, 24)
			Badge:SetPoint('CENTER', PvPIndicator, 'CENTER', 0, 0)
			PvPIndicator.Badge = Badge
		end
	end
end