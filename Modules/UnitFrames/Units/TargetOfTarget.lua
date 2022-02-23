------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up TARGET OF TARGET FRAME.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T.UnitFrames
local baseToT = UnitFrames.TargetOfTarget
local Movers = T["Movers"]

------------------------------------------------------------------------------------------
-- TARGET of TARGET FRAME SETUP
------------------------------------------------------------------------------------------
local function CreateUnits()	
	local ToT = UnitFrames.Units.TargetOfTarget
	local Target = UnitFrames.Units.Target
	
------------------------------------------------------------------------------------------
-- TARGET of TARGET FRAME disable
------------------------------------------------------------------------------------------
	if not C["UnitFrames"]["Enable"] == true then return end

	if C["UF: ToT"]["Enable"] ~= true then
		ToT:Kill()
	end	

------------------------------------------------------------------------------------------
-- TARGET of TARGET FRAME SIZE
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		ToT:SetHeight(C["UF: ToT"]["HealthHeight"])
		ToT:SetWidth(C["UF: ToT"]["HealthWidth"])
		ToT.Backdrop:SetBackdrop(nil)
		
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
			ToT:SetHeight(C["UF: ToT"]["HealthWidth"])
			ToT:SetWidth(C["UF: ToT"]["HealthHeight"])
		end	
	end
	
------------------------------------------------------------------------------------------
-- TARGET of TARGET FRAME POSITION
------------------------------------------------------------------------------------------
	ToT:ClearAllPoints()
	ToT:SetPoint("CENTER", MaxUIUnitframesAnchor, "CENTER", 0, 2)
	
	-- tukui
	if C["Layout"]["LayoutRole"]["Value"] == "Tukui" then

	-- melee or tank
	elseif (C["Layout"]["LayoutRole"]["Value"] == "Melee") or (C["Layout"]["LayoutRole"]["Value"] == "Tank") then 
		ToT:ClearAllPoints()
		if C["UF: Pet"]["PortraitStyle"]["Value"] == "Side" then
			ToT:SetPoint("TOPLEFT", Target, "TOPRIGHT", 82, 0)
		else
			ToT:SetPoint("TOPLEFT", Target, "TOPRIGHT", 60, 0)
		end	
	
	-- healing 
	elseif C["Layout"]["LayoutRole"]["Value"] == "Healer" then 
		ToT:ClearAllPoints()
		if C["UF: Pet"]["PortraitStyle"]["Value"] == "Side" then
			ToT:SetPoint("TOPLEFT", Target, "TOPRIGHT", 82, 0)
		else
			ToT:SetPoint("TOPLEFT", Target, "TOPRIGHT", 60, 0)
		end	
		
	-- range
	elseif C["Layout"]["LayoutRole"]["Value"] == "Range" then 
		
		if C["Layout"]["LayoutAB"]["Value"] == "Single" or C["Layout"]["LayoutAB"]["Value"] == "Double" then
			ToT:ClearAllPoints()
			if C["UF: Pet"]["PortraitStyle"]["Value"] == "Side" then
				ToT:SetPoint("TOPLEFT", Target, "TOPRIGHT", 82, 0)
			else
				ToT:SetPoint("TOPLEFT", Target, "TOPRIGHT", 60, 0)
			end	
		end
		
	-- center chat
	elseif C["Layout"]["LayoutRole"]["Value"] == "CenterChat" then 

	end

	if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" and C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		ToT:ClearAllPoints()
		ToT:SetPoint("LEFT", Target, "RIGHT", 70, 10)
	end
end	
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- TARGET of TARGET FRAME - MaxUI THEME
------------------------------------------------------------------------------------------
function UnitFrames:TargetOfTarget()
	-- tukui
	baseToT(self)
	
	-- MaxUI
	local Panel = self.Panel
	local Health = self.Health
	local Name = self.Name
	local Panel = self.Panel
	local RaidIcon = self.RaidTargetIndicator
	local myBar = self.HealthPrediction.myBar
	local otherBar = self.HealthPrediction.otherBar
	local absorbBar = self.HealthPrediction.absorbBar
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs
	
	local HealthHeight = C["UF: ToT"]["HealthHeight"]
	local HealthWidth = C["UF: ToT"]["HealthWidth"]
	local PowerHeight = C["UF: ToT"]["PowerHeight"]
	local PowerWidth = C["UF: ToT"]["PowerWidth"]
	local NameFont = T.GetFont(C["UF: ToT"]["NameFont"])
	local HealthFont = T.GetFont(C["UF: ToT"]["HealthFont"])
	local PowerFont = T.GetFont(C["UF: ToT"]["PowerFont"])
	local HealthFontSize = C["UF: ToT"]["HealthFontSize"]/10
	local NameFontSize = C["UF: ToT"]["NameFontSize"]/10
	local PowerFontSize = C["UF: ToT"]["PowerFontSize"]/10
	local HealthTexture = T.GetTexture(C["UF: ToT"]["HealthTexture"])
	local PowerTexture = T.GetTexture(C["UF: ToT"]["PowerTexture"])
	local RoleIconSize = C["UF: ToT"]["RoleIconSize"]
	local RaidIconSize = C["UF: ToT"]["RaidIconSize"]

	local Power = CreateFrame("StatusBar", nil, Health)
	Power.Background = Power:CreateTexture(nil, "BORDER")

------------------------------------------------------------------------------------------
-- PORTRAIT STYLE
------------------------------------------------------------------------------------------
	local Portrait = CreateFrame("PlayerModel", nil, Health)
	self.Portrait = Portrait

	if C["UF: ToT"]["PortraitStyle"]["Value"] == "None" then

	elseif C["UF: ToT"]["PortraitStyle"]["Value"] == "Side" then
		Portrait:SetPoint("RIGHT", Health, "LEFT", -8, 0)
		Portrait:SetWidth(HealthHeight)
		Portrait:SetHeight(HealthHeight-2)
		Portrait:CreateBackdrop()
		Portrait.Backdrop:SetOutside(Portrait)
		Portrait.Backdrop:CreateShadow()
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
			Portrait:Kill()
		end
			
	elseif C["UF: ToT"]["PortraitStyle"]["Value"] == "Overlay" then
		Portrait:SetAllPoints()
		Portrait:SetFrameLevel(3)
		Portrait:SetAlpha(C["UF: ToT"]["PortraitOverlayAlpha"])
	end

------------------------------------------------------------------------------------------
-- COLOR THEME
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Colorstyle"]["Value"] == "Dark" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = false
		Health.colorReaction = false
		Health.colorThreat = C["UF: ToT"]["ColorThreat"]
	elseif C["UnitFrames"]["Colorstyle"]["Value"] == "Gradient" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = false
		Health.colorReaction = false
		Health.colorSmooth = true
		Health.colorThreat = C["UF: ToT"]["ColorThreat"]
	elseif C["UnitFrames"]["Colorstyle"]["Value"] == "Class" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = true
		Health.colorReaction = true
		Health.colorThreat = C["UF: ToT"]["ColorThreat"]
	elseif C["UnitFrames"]["Colorstyle"]["Value"] == "Custom" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = false
		Health.colorReaction = false
		Health.colorThreat = C["UF: ToT"]["ColorThreat"]
	end	
	Health.PreUpdate = UnitFrames.PreUpdateHealth

------------------------------------------------------------------------------------------
-- HEALCOMM
------------------------------------------------------------------------------------------
	if C.UnitFrames.HealComm then
		myBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
		otherBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
		absorbBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
	end

------------------------------------------------------------------------------------------
-- MOUSEOVER COMBAT ALPHA
------------------------------------------------------------------------------------------
	if C["UF: ToT"]["NonCombatAlphaEnable"] == true then 
		self:HookScript("OnUpdate", function(self)
			if InCombatLockdown() then
				self:SetAlpha(1)
				Health.Background:SetAlpha(1)
			elseif MouseIsOver(self) then
				self:SetAlpha(1)
				Health.Background:SetAlpha(1)
			else
				self:SetAlpha(C["UF: ToT"]["NonCombatAlpha"])
				Health.Background:SetAlpha(C["UF: ToT"]["NonCombatAlpha"])
			end
		end)
	end	

------------------------------------------------------------------------------------------
-- EXCLUDE SHADOW COLOR
------------------------------------------------------------------------------------------
	if C["General"]["ClassShadowExcludeUF"] then
		self.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
	end

------------------------------------------------------------------------------------------
-- MaxUI UF STYLE
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then

		-- health
		Health:SetStatusBarTexture(HealthTexture)
		Health:SetInside(self)

		Health:CreateBackdrop()
		Health.Backdrop:SetBackdropColor(0, 0, 0, 0)
		Health.Backdrop:SetOutside(Health)

		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
			Health:SetOrientation("VERTICAL")
		end
		
		Health.Value = Health:CreateFontString(nil, "OVERLAY")
		Health.Value:SetPoint("RIGHT", Health, "RIGHT", -2, 0)
		Health.Value:SetJustifyH("RIGHT")
		Health.Value:SetFontObject(HealthFont)
		Health.Value:SetScale(HealthFontSize)
		self:Tag(Health.Value, C["UF: ToT"]["HealthTag"]["Value"])
		
		-- power
		Power:SetPoint("LEFT", Health, "BOTTOMLEFT", 6, 0)
		Power:SetHeight(PowerHeight)
		Power:SetWidth(PowerWidth)
		Power:SetFrameLevel(8)
		Power:SetFrameStrata("MEDIUM")
		Power:SetStatusBarTexture(PowerTexture)
		Power:CreateBackdrop()
		Power.Backdrop:SetOutside(Power)
		Power.Backdrop:CreateShadow()
		if C["General"]["ClassShadowExcludeUF"] then
			Power.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
		end
		
		Power.Background:SetTexture(PowerTexture)
		Power.Background:SetAllPoints(Power)
		Power.Background.multiplier = C.UnitFrames.StatusBarBackgroundMultiplier / 100
		
		Power.Value = Power:CreateFontString(nil, "OVERLAY")
		Power.Value:SetPoint("RIGHT", Power, "RIGHT", -4, 0)
		Power.Value:SetFontObject(PowerFont)
		Power.Value:SetScale(PowerFontSize)
		Power.Value:SetJustifyH("RIGHT")
		self:Tag(Power.Value, C["UF: ToT"]["PowerTag"]["Value"])
		
		self.Power = Power
		self.Power.bg = Power.Background
		Power.frequentUpdates = true
		Power.colorPower = true
		Power.PostUpdate = nil
		
		-- infopanel
		Panel:SetAlpha(0)
		
		-- Name
		Name:SetParent(Health)
		Name:SetFontObject(NameFont)
		Name:SetScale(NameFontSize)
		Name:SetPoint("TOPLEFT", Health, "BOTTOMLEFT", 0, -10)
		Name:SetJustifyH("LEFT")
		self:Tag(Name, C["UF: ToT"]["NameTag"]["Value"]) 

		-- percentage tag adjustments
		if C["UF: ToT"]["PercentageTags"] == true then
			local HPpercentage = Health:CreateFontString(nil, "OVERLAY")
			HPpercentage:SetPoint("LEFT", Health, "Right", 2, 0)
			HPpercentage:SetAlpha(1)
			HPpercentage:SetJustifyH("LEFT")
			HPpercentage:SetFontObject(HealthFont)
			HPpercentage:SetScale(HealthFontSize)
			self:Tag(HPpercentage, "[perhp]%")
			
			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
				HPpercentage:ClearAllPoints()
				HPpercentage:SetPoint("BOTTOM", Health, "TOP", 2, 4)
				HPpercentage:SetJustifyH("CENTER")
			end
			
			local MPpercentage = Power:CreateFontString(nil, "OVERLAY")
			MPpercentage:SetPoint("LEFT", Power, "RIGHT", 2, 0)
			MPpercentage:SetAlpha(1)
			MPpercentage:SetJustifyH("LEFT")
			MPpercentage:SetFontObject(PowerFont)
			MPpercentage:SetScale(PowerFontSize)
			self:Tag(MPpercentage, "[perpp]%")
			
			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
				MPpercentage:ClearAllPoints()
				MPpercentage:SetPoint("BOTTOM", Power, "TOP", -2, 4)
				MPpercentage:SetJustifyH("CENTER")
			end
		end

		-- raid icon
		if C["UF: ToT"]["RoleIcon"] == true then
			RaidIcon:ClearAllPoints()
			RaidIcon:SetWidth(RaidIconSize)
			RaidIcon:SetHeight(RaidIconSize)
			RaidIcon:SetPoint("LEFT", Name, "RIGHT", 26, 0)
		else
			RaidIcon:Hide()
		end
		
		-- roll icon
		if T.Retail then
			if C["UF: ToT"]["RoleIcon"] == true then
				local GroupRoleIndicator = Health:CreateTexture(nil, "OVERLAY")
			
				if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
					GroupRoleIndicator:SetPoint("TOP", Health, "BOTTOM", 0, -4)
					GroupRoleIndicator:SetWidth(RoleIconSize)
					GroupRoleIndicator:SetHeight(RoleIconSize)
				else
					GroupRoleIndicator:SetPoint("LEFT", Name, "RIGHT", 0, 0)
					GroupRoleIndicator:SetHeight(RoleIconSize)
					GroupRoleIndicator:SetWidth(RoleIconSize)
				end

				if C["UnitFrames"]["Roles"]["Value"] == "MaxUI Style" or C["UnitFrames"]["Roles"]["Value"] == "Elvui Style" then
					GroupRoleIndicator.Override = UnitFrames.SetGridGroupRole
				end
				self.GroupRoleIndicator = GroupRoleIndicator
			end
		end
		
		-- adjustments for Vertical Unitframes
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
			Power:ClearAllPoints()
			Power:SetPoint("BOTTOM", Health, "BOTTOMRIGHT", 0, 10)
			Power:SetHeight(PowerWidth)
			Power:SetWidth(PowerHeight)
			Power:SetOrientation("VERTICAL")
			
			Name:ClearAllPoints()
			Name:SetPoint("TOPLEFT", Health, "BOTTOMLEFT", 0, -10)
			
			RaidIcon:ClearAllPoints()
			RaidIcon:SetPoint("BOTTOM", Power, "TOP", 0, 16)
			
			Health.Value:ClearAllPoints()
			Health.Value:SetPoint("TOPLEFT", Name, "BOTTOMLEFT", 4, -4)
			Health.Value:SetJustifyH("LEFT")
			Power.Value:ClearAllPoints()
			Power.Value:SetPoint("TOPLEFT", Health.Value, "BOTTOMLEFT", -0, -4)
		end

		-- highlighting
		self:HookScript("OnEnter", function(self)
			Health.Backdrop:SetBorderColor(Health:GetStatusBarColor())
			Power.Backdrop:SetBorderColor(Power:GetStatusBarColor())
		end)

		self:HookScript("OnLeave", function(self)
			Health.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
			Power.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
		end)
		
		-- Healcomm Bars adjustments
		if C.UnitFrames.HealComm then
			myBar:SetWidth(HealthWidth)
			otherBar:SetWidth(HealthWidth)
			absorbBar:SetWidth(HealthWidth)
			myBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
			otherBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
			absorbBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])

			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
				myBar:SetOrientation("VERTICAL")
				myBar:SetWidth(HealthHeight)
				myBar:SetHeight(HealthWidth)
				myBar:SetStatusBarTexture(HealthTexture)
				myBar:ClearAllPoints()
				myBar:SetPoint("BOTTOM", Health:GetStatusBarTexture(), "TOP", 0, 0)

				otherBar:SetOrientation("VERTICAL")
				otherBar:SetWidth((HealthHeight))
				otherBar:SetHeight(HealthWidth)
				otherBar:SetStatusBarTexture(HealthTexture)
				otherBar:ClearAllPoints()
				otherBar:SetPoint("BOTTOM", myBar:GetStatusBarTexture(), "TOP", 0, 0)

				absorbBar:SetOrientation("VERTICAL")
				absorbBar:SetWidth((HealthHeight))
				absorbBar:SetHeight(HealthWidth)
				absorbBar:SetStatusBarTexture(HealthTexture)
				absorbBar:ClearAllPoints()
				absorbBar:SetPoint("BOTTOM", Health:GetStatusBarTexture(), "TOP", 0, 0)
			end
		end
		
		-- Buffs and Debuffs
		if (C.UnitFrames.TOTAuras) then
		
			-- Debuffs
			if C["UF: ToT"]["Debuffs"] == true then
				-- Debuffs anchorframe
				Debuffs:ClearAllPoints()
				Debuffs:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", 2, 14)
				Debuffs:SetParent(Health)
				Debuffs:SetHeight(C["UF: ToT"]["DebuffSize"]*C["UF: ToT"]["DebuffNumberRows"])
				Debuffs:SetWidth(HealthWidth)
				
				-- Debuffs icons
				Debuffs.size = C["UF: ToT"]["DebuffSize"]
				Debuffs.num = C["UF: ToT"]["DebuffNumber"]
				Debuffs.numRow = C["UF: ToT"]["DebuffNumberRows"]
				Debuffs.spacing = C["UF: ToT"]["DebuffSpacing"]
				Debuffs.initialAnchor = "TOPLEFT"
				Debuffs["growth-y"] = "UP"
				Debuffs["growth-x"] = "RIGHT"
				Debuffs.PostCreateIcon = UnitFrames.PostCreateAura
				Debuffs.PostUpdateIcon = UnitFrames.PostUpdateAura
				Debuffs.onlyShowPlayer = C["UF: ToT"].OnlySelfDebuffs
				Movers:RegisterFrame(Debuffs, "ToT Debuffs")

				if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
					Debuffs.initialAnchor = "BOTTOMLEFT"
					Debuffs["growth-y"] = "RIGHT"
					Debuffs["growth-x"] = "UP"
					Debuffs:ClearAllPoints()
					Debuffs:SetHeight(HealthWidth)
					Debuffs:SetWidth(C["UF: ToT"]["DebuffSize"]*C["UF: ToT"]["DebuffNumberRows"])
					Debuffs:SetPoint("BOTTOMLEFT", Health, "BOTTOMRIGHT", 14, 0)
				end
			else
				Debuffs.num = 0
			end
			
			-- Buffs
			if C["UF: ToT"]["Buffs"] == true then
				Buffs:ClearAllPoints()
				Buffs:SetFrameStrata(self:GetFrameStrata())
				Buffs:SetParent(Health)
				Buffs:SetHeight(C["UF: ToT"]["BuffSize"]*C["UF: ToT"]["BuffNumberRows"])
				Buffs:SetWidth(C["UF: ToT"]["HealthWidth"])
				
				-- Buffs icons
				Buffs.size = C["UF: ToT"]["BuffSize"]
				Buffs.num = C["UF: ToT"]["BuffNumber"]
				Buffs.numRow = C["UF: ToT"]["BuffNumberRows"]
				Buffs.spacing = C["UF: ToT"]["BuffSpacing"]
				Buffs.initialAnchor = "TOPLEFT"
				Buffs["growth-y"] = "UP"
				Buffs["growth-x"] = "RIGHT"
				Buffs.PostCreateIcon = UnitFrames.PostCreateAura
				Buffs.PostUpdateIcon = UnitFrames.PostUpdateAura
				Buffs.PostUpdate = UnitFrames.UpdateBuffsHeaderPosition
				Buffs.onlyShowPlayer = C["UF: ToT"]["OnlySelfBuffs"]

				-- Buffs anchorframe
				if C["UF: ToT"]["Debuffs"] == true then
					Buffs:SetPoint("BOTTOMLEFT", Debuffs, "TOPLEFT", 0, 14)
				else
					Buffs:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", 2, 42)
				end

				if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
					Buffs.initialAnchor = "BOTTOMLEFT"
					Buffs["growth-y"] = "RIGHT"
					Buffs["growth-x"] = "UP"
					Buffs:SetHeight(HealthWidth)
					Buffs:SetWidth(C["UF: ToT"]["BuffSize"]*C["UF: ToT"]["BuffNumberRows"])
					
					-- Buffs anchorframe
					if C["UF: ToT"]["Debuffs"] == true then
						Buffs:SetPoint("BOTTOMLEFT", Debuffs, "BOTTOMRIGHT", 8, 0)
					else
						Buffs:SetPoint("BOTTOMLEFT", Health, "BOTTOMRIGHT", 14, 0)
					end
				end
				
				Movers:RegisterFrame(Buffs, "ToT Buffs")
				
				if C["UF: ToT"]["BuffsToTCombatState"]["Value"] == "Show" then
					RegisterStateDriver(Buffs, "visibility", "[combat] show;hide")
				end	
				
				if C["UF: ToT"]["BuffsToTCombatState"]["Value"] == "Hide" then
					RegisterStateDriver(Buffs, "visibility", "[combat] hide;show")
				end	
			else
				Buffs.num = 0
			end
		end
	end
end