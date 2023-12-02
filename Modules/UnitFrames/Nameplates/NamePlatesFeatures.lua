------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- Setting up Nameplates Extra Features.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T["UnitFrames"]
local baseNameplates = UnitFrames.Nameplates

local IsInGroup = IsInGroup
local IsInRaid = IsInRaid
local UnitDetailedThreatSituation = UnitDetailedThreatSituation
local UnitIsUnit = UnitIsUnit

------------------------------------------------------------------------------------------
-- NAMEPLATE EXTRA FEATURES
------------------------------------------------------------------------------------------
function UnitFrames:Nameplates()
	baseNameplates(self)

	-- wow

	-- elements
	local Nameplates = self
	local Health = self.Health
	local Name = self.Name
	local Highlight = self.Highlight
	local Castbar = self.Castbar
	local Power = self.Power
	local RaidIcon = self.RaidTargetIndicator

	-- settings
	local HealthTexture = T.GetTexture(C["NamePlates"]["HealthTexture"])

	-- font

	-- texture

	-- MaxUI
	local TargetIconRight = self:CreateTexture(nil, "BACKGROUND")
	local TargetIconLeft = self:CreateTexture(nil, "BACKGROUND")
	local ThreatIcon = self:CreateTexture(nil, "ARTWORK")

------------------------------------------------------------------------------------------
-- Set NamePlate Health Prediction
------------------------------------------------------------------------------------------
	if C["NamePlates"]["HealthPrediction"] then
		local myHealthBar = CreateFrame("StatusBar", nil, Health)
		myHealthBar:SetFrameStrata(self:GetFrameStrata())
		myHealthBar:SetPoint("TOPLEFT", Health:GetStatusBarTexture(), "TOPRIGHT", 0, 0)
		myHealthBar:SetPoint("BOTTOMLEFT", Health:GetStatusBarTexture(), "BOTTOMRIGHT", 0, 0)
		myHealthBar:SetWidth(self:GetWidth())
		myHealthBar:SetStatusBarTexture(HealthTexture)
		myHealthBar:SetStatusBarColor(0, 0.3, 0.15, 1)
		myHealthBar:SetMinMaxValues(0,1)

		local otherHealthBar = CreateFrame("StatusBar", nil, Health)
		otherHealthBar:SetFrameStrata(self:GetFrameStrata())
		otherHealthBar:SetPoint("TOPLEFT", Health:GetStatusBarTexture(), "TOPRIGHT", 0, 0)
		otherHealthBar:SetPoint("BOTTOMLEFT", Health:GetStatusBarTexture(), "BOTTOMRIGHT", 0, 0)
		otherHealthBar:SetWidth(self:GetWidth())
		otherHealthBar:SetStatusBarTexture(HealthTexture)
		otherHealthBar:SetStatusBarColor(0, 0.3, 0, 1)

		local absorbHealthBar = CreateFrame("StatusBar", nil, Health)
		absorbHealthBar:SetFrameStrata(self:GetFrameStrata())
		absorbHealthBar:SetPoint("TOPLEFT", Health:GetStatusBarTexture(), "TOPRIGHT", 0, 0)
		absorbHealthBar:SetPoint("BOTTOMLEFT", Health:GetStatusBarTexture(), "BOTTOMRIGHT", 0, 0)
		absorbHealthBar:SetWidth(self:GetWidth())
		absorbHealthBar:SetStatusBarTexture(HealthTexture)
		absorbHealthBar:SetStatusBarColor(0.3, 0.3, 0, 1)

		absorbHealthBar:SetFrameLevel(Health:GetFrameLevel())
		otherHealthBar:SetFrameLevel(absorbHealthBar:GetFrameLevel() + 1)
		myHealthBar:SetFrameLevel(absorbHealthBar:GetFrameLevel() + 2)

		self.HealthPrediction = {
			myBar = myHealthBar,
			otherBar = otherHealthBar,
			absorbBar = absorbHealthBar,
			maxOverflow = 1,
		}
	end	

------------------------------------------------------------------------------------------
-- target indicator
------------------------------------------------------------------------------------------
	if (C["NamePlates"].Enable and C["NamePlates"]["TargetIndicator"] == true) then 
		TargetIconLeft:SetWidth(self:GetHeight()+4)
		TargetIconLeft:SetHeight(self:GetHeight()+4)
		TargetIconLeft:SetPoint("RIGHT", self, "LEFT", -2, 0)
		TargetIconLeft:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Custom\target_indicator_right.tga]])
		TargetIconLeft:SetVertexColor(unpack(C.NamePlates.HighlightColor))
		TargetIconLeft:Hide()

		TargetIconRight:SetWidth(self:GetHeight()+4)
		TargetIconRight:SetHeight(self:GetHeight()+4)
		TargetIconRight:SetPoint("LEFT", self, "RIGHT", 2, 0)
		TargetIconRight:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Custom\target_indicator_left.tga]])
		TargetIconRight:SetVertexColor(unpack(C.NamePlates.HighlightColor))
		TargetIconRight:Hide()

		local function SetNamePlateTargetIndicator(UnitIsUnit)
			if UnitIsUnit("target", self.unit) then
				TargetIconLeft:Show()
				TargetIconRight:Show()
			else
				TargetIconLeft:Hide()
				TargetIconRight:Hide()
			end
		end
			
		SetNamePlateTargetIndicator(UnitIsUnit)
				
		local EventHandler = CreateFrame("Frame")
		EventHandler:RegisterEvent("PLAYER_TARGET_CHANGED")
		EventHandler:RegisterEvent("NAME_PLATE_UNIT_ADDED")
		EventHandler:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
		EventHandler:SetScript("OnEvent", function()
			SetNamePlateTargetIndicator(UnitIsUnit)
		end)
	end	
	
------------------------------------------------------------------------------------------
-- Set NamePlate threat feature
------------------------------------------------------------------------------------------
	if C["NamePlates"]["ThreatIndicator"] == true or C["NamePlates"]["ThreatOnHealth"] == true or C["NamePlates"]["ThreatGlow"] == true then
		local ThreatIconFrame = CreateFrame("StatusBar")
		local Health = self.Health
		
		ThreatIcon:SetWidth(self:GetHeight())
		ThreatIcon:SetHeight(self:GetHeight())
		ThreatIcon:SetPoint("LEFT", self, "RIGHT", 18, 0)
		ThreatIcon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Custom\threat.tga]])
		ThreatIcon:Hide()

		local function ThreatNamePlateUpdate()
			local GetColor = T.ColorGradient
			local unit = self.unit
			local isInGroup, isInRaid = IsInGroup(), IsInRaid()
			local Highlight = self.Highlight
			local Shadow = self.Shadow
			local R, G, B
		
			if UnitAffectingCombat("player") and UnitAffectingCombat(unit) and UnitCanAttack("player", unit) then
				local _, _, ThreatPercent = UnitDetailedThreatSituation("player", unit)
				local ThreatValue = ThreatPercent or 0
				ThreatIconFrame:SetValue(ThreatValue)
				R, G, B = GetColor(ThreatValue, 100, 0,.8,0,.8,.8,0,.8,0,0)
				
				if C["NamePlates"]["ThreatIndicator"] then
					ThreatIcon:Show()
					ThreatIcon:SetVertexColor(R, G, B)
				end	
			else
				if C["NamePlates"]["ThreatIndicator"] then
					ThreatIcon:Hide()
				end
			end
		end
			
		local EventHandler = CreateFrame("Frame")
		-- what events are useful?
		EventHandler:RegisterEvent("PLAYER_DEAD")
		EventHandler:RegisterEvent("PLAYER_ENTERING_WORLD")
		EventHandler:RegisterEvent("PLAYER_TARGET_CHANGED")
		EventHandler:RegisterEvent("NAME_PLATE_UNIT_ADDED")
		EventHandler:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
		EventHandler:RegisterEvent("PLAYER_REGEN_ENABLED")
		EventHandler:RegisterEvent("PLAYER_REGEN_DISABLED")
		EventHandler:RegisterEvent("UNIT_THREAT_LIST_UPDATE")
		EventHandler:SetScript("OnEvent", function()
			ThreatNamePlateUpdate()
		end)
	end

------------------------------------------------------------------------------------------
-- Set NamePlate alpha
------------------------------------------------------------------------------------------

	if C["NamePlates"]["EnableAlphaSettings"] == true then 
		local function SetNamePlateAlpha(UnitIsUnit)
			if UnitIsUnit("target", self.unit) then
				Nameplates:SetAlpha(1)
				Health.Background:SetAlpha(1)
			else
				Nameplates:SetAlpha(C.NamePlates.NotSelectedAlpha / 100)
				Health.Background:SetAlpha(C.NamePlates.NotSelectedAlpha / 100)
			end
		end
		SetNamePlateAlpha(UnitIsUnit)
	
		local EventHandler = CreateFrame("Frame")
		EventHandler:RegisterEvent("PLAYER_TARGET_CHANGED")
		EventHandler:RegisterEvent("NAME_PLATE_UNIT_ADDED")
		EventHandler:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
		EventHandler:SetScript("OnEvent", function()
			SetNamePlateAlpha(UnitIsUnit)
		end)
	end

	if C["NamePlates"]["EnableScaling"] == true then 
		local function SetNamePlateScale(UnitIsUnit)
			if UnitIsUnit("target", self.unit) then
				Nameplates:SetScale(C["NamePlates"]["TargetScale"]/100 *C["General"]["UIScale"])
			else
				Nameplates:SetScale(C["NamePlates"]["NonTargetScale"]/100 *C["General"]["UIScale"])
			end
		end
		SetNamePlateScale(UnitIsUnit)
		
		local EventHandler = CreateFrame("Frame")
		EventHandler:RegisterEvent("PLAYER_TARGET_CHANGED")
		EventHandler:RegisterEvent("NAME_PLATE_UNIT_ADDED")
		EventHandler:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
		EventHandler:SetScript("OnEvent", function()
			SetNamePlateScale(UnitIsUnit)
		end)
	end
	
------------------------------------------------------------------------------------------
-- NO HEALTHBARS
------------------------------------------------------------------------------------------
	if C["NamePlates"]["HealthBars"] ~= true then
		Health:SetAlpha(0)
		self.Backdrop:SetAlpha(0)
		self.Shadow:SetAlpha(0)
		TargetIconLeft:SetPoint("RIGHT", Name, "LEFT", -2, 0)
		TargetIconRight:SetPoint("LEFT", Name, "RIGHT", 2, 0)
		ThreatIcon:SetPoint("LEFT", Name, "RIGHT", 18, 0)
		Highlight:SetAlpha(0)
		RaidIcon:SetAlpha(1)
		RaidIcon:SetPoint("BOTTOM", Name, "TOP", 0, 4)
		if C.NamePlates.NameplateCastBar then
			Castbar:SetAlpha(1)
			Castbar:ClearAllPoints()
			Castbar:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 12, 8)
			Castbar:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", 0, 8)
			Castbar.Button:ClearAllPoints()
			Castbar.Button:SetPoint("TOPRIGHT", self, "TOPLEFT", 6, 0)
		end	
	end	
end

------------------------------------------------------------------------------------------
-- Set NamePlate Targeted and Non Targeted settings
------------------------------------------------------------------------------------------
local function CreateUnits()	
	-- stacking
	if (C["NamePlates"].Enable and C["NamePlates"]["Stacking"]) then
		SetCVar("nameplateMotion", 1)
		
	else
		SetCVar("nameplateMotion", 0)
	end
	
	-- overlap spacing nameplates
	SetCVar("nameplateOverlapH", C["NamePlates"]["HorizontalSpacing"])
	SetCVar("nameplateOverlapV", C["NamePlates"]["VerticalSpacing"])
	
	if C["NamePlates"]["CombatOnly"] then
		local f = CreateFrame("Frame")
		f:RegisterEvent("PLAYER_REGEN_DISABLED")
		f:RegisterEvent("PLAYER_REGEN_ENABLED")
		f:SetScript("OnEvent", function(self, event)
			SetCVar("nameplateShowEnemies", event == "PLAYER_REGEN_DISABLED" and 1 or 0)
		end)

		-- Run combat check on startup
		SetCVar("nameplateShowEnemies", UnitAffectingCombat("player") and 1 or 0)
	end
end	
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)