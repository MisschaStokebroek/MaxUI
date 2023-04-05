------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-10-2022
------------------------------------------------------------------------------------------

-- setting up TARGET OF TARGET FRAME.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T.UnitFrames
local Movers = T["Movers"]
local baseToT = UnitFrames.TargetOfTarget

------------------------------------------------------------------------------------------
-- TARGET of TARGET FRAME SETUP
------------------------------------------------------------------------------------------
local function CreateUnits()	
	local ToT = UnitFrames.Units.TargetOfTarget
	local Target = UnitFrames.Units.Target
	
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
		if C.UnitFrames.Portrait == true and C["UF: ToT"]["PortraitStyle"]["Value"] == "Side" then
			ToT:SetPoint("TOPLEFT", Target, "TOPRIGHT", 82, 0)
		else
			ToT:SetPoint("TOPLEFT", Target, "TOPRIGHT", 60, 0)
		end	
	
	-- healing 
	elseif C["Layout"]["LayoutRole"]["Value"] == "Healer" then 
		ToT:ClearAllPoints()
		if C.UnitFrames.Portrait == true and C["UF: ToT"]["PortraitStyle"]["Value"] == "Side" then
			ToT:SetPoint("TOPLEFT", Target, "TOPRIGHT", 82, 0)
		else
			ToT:SetPoint("TOPLEFT", Target, "TOPRIGHT", 60, 0)
		end	
		
	-- range
	elseif C["Layout"]["LayoutRole"]["Value"] == "Range" then 
		
		if C["Layout"]["LayoutAB"]["Value"] == "Single" or C["Layout"]["LayoutAB"]["Value"] == "Double" then
			ToT:ClearAllPoints()
			if C.UnitFrames.Portrait == true and C["UF: ToT"]["PortraitStyle"]["Value"] == "Side" then
				ToT:SetPoint("TOPLEFT", Target, "TOPRIGHT", 82, 0)
			else
				ToT:SetPoint("TOPLEFT", Target, "TOPRIGHT", 60, 0)
			end	
		end
	end	

	if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" and C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		ToT:ClearAllPoints()
		ToT:SetPoint("LEFT", Target, "RIGHT", 70, 20)
	end
end	
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- TARGET of TARGET FRAME GENERAL (MAXUI AND TUKUI)
------------------------------------------------------------------------------------------
function UnitFrames:TargetOfTarget()
	baseToT(self)
	
	-- wow

	-- elements
	local Panel = self.Panel
	local Name = self.Name
	local Health = self.Health
	local myBar = self.HealthPrediction.myBar
	local otherBar = self.HealthPrediction.otherBar
	local absorbBar = self.HealthPrediction.absorbBar
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs
	local RaidIcon = self.RaidTargetIndicator
	local Portrait
	local PortraitBackdrop
	local PortraitShadow

	-- settings
	local HealthHeight = C["UF: ToT"]["HealthHeight"]
	local HealthWidth = C["UF: ToT"]["HealthWidth"]
	local PowerHeight = C["UF: ToT"]["PowerHeight"]
	local PowerWidth = C["UF: ToT"]["PowerWidth"]
	local RoleIconSize = C["UF: ToT"]["RoleIconSize"]
	local RaidIconSize = C["UF: ToT"]["RaidIconSize"]

	-- font
	local NameFont = T.GetFont(C["UF: ToT"]["NameFont"])
	local HealthFont = T.GetFont(C["UF: ToT"]["HealthFont"])
	local PowerFont = T.GetFont(C["UF: ToT"]["PowerFont"])
	local HealthFontSize = C["UF: ToT"]["HealthFontSize"]/10
	local NameFontSize = C["UF: ToT"]["NameFontSize"]/10
	local PowerFontSize = C["UF: ToT"]["PowerFontSize"]/10

	-- texture
	local HealthTexture = T.GetTexture(C["UF: ToT"]["HealthTexture"])
	local PowerTexture = T.GetTexture(C["UF: ToT"]["PowerTexture"])

	-- MaxUI
	local Power = CreateFrame("StatusBar", nil, Health)

------------------------------------------------------------------------------------------
-- PORTRAIT STYLE
------------------------------------------------------------------------------------------
	if C.UnitFrames.Portrait then
		Portrait = CreateFrame("Frame", nil, self)

		if C.UnitFrames.Portrait2D then
			Portrait.Texture = Portrait:CreateTexture(nil, "OVERLAY")
			Portrait.Texture:SetTexCoord(0.1,0.9,0.1,0.9)
		else
			Portrait.Texture = CreateFrame("PlayerModel", nil, Portrait)
		end

		Portrait:SetSize(35, 35)
		Portrait:SetPoint("RIGHT", self, "LEFT", -10, 0)
		Portrait:CreateBackdrop()
		Portrait:CreateShadow()

		Portrait.Backdrop:SetOutside()

		Portrait.Texture:SetAllPoints(Portrait)

		self.Portrait = Portrait.Texture
		self.Portrait.Backdrop = Portrait.Backdrop
		self.Portrait.Shadow = Portrait.Shadow
	end
	
	if C.UnitFrames.Portrait == true then
		Portrait = self.Portrait
		PortraitBackdrop = self.Portrait.Backdrop
		PortraitShadow = self.Portrait.Shadow

		if (C.UnitFrames.Portrait == true and C["UF: ToT"]["PortraitStyle"]["Value"] == "None") then
			Portrait:Kill()
			PortraitBackdrop:Kill()
			PortraitShadow:Kill()

		elseif C["UF: ToT"]["PortraitStyle"]["Value"] == "Overlay" then
			Portrait:ClearAllPoints()
			Portrait:SetParent(Health)
			PortraitBackdrop:Kill()
			PortraitShadow:Kill()
			
			if C.UnitFrames.Portrait2D then
				Portrait:Kill()
			else
				Portrait:SetAllPoints()
				Portrait:SetFrameLevel(4)
			end
			Portrait:SetAlpha(C["UF: ToT"]["PortraitOverlayAlpha"])
		end
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
-- MaxUI UF STYLE BASIC
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] ~= "MaxUI" then return end

	-- infopanel
	Panel:Hide()
	Panel:SetFrameStrata(self:GetFrameStrata())
	Panel:SetFrameLevel(self:GetFrameLevel()+1)

	-- Name
	Name:ClearAllPoints()
	Name:SetPoint("TOPLEFT", Health, "BOTTOMLEFT", 0, -10)
	Name:SetParent(Health)
	Name:SetJustifyH("LEFT")
	Name:SetFontObject(NameFont)
	Name:SetScale(NameFontSize)
	self:Tag(Name, C["UF: ToT"]["NameTag"]["Value"]) 

	-- health
	Health:SetFrameStrata("MEDIUM")
	Health:SetFrameLevel(1)
	Health:SetStatusBarTexture(HealthTexture)
	Health:SetInside(self)

	Health:CreateBackdrop()
	Health.Backdrop:SetBackdropColor(0, 0, 0, 0)
	Health.Backdrop:SetOutside(Health)

	-- health value
	Health.Value = Health:CreateFontString(nil, "OVERLAY")
	Health.Value:SetFontObject(HealthFont)
	Health.Value:SetScale(HealthFontSize)
	self:Tag(Health.Value, C["UF: ToT"]["HealthTag"]["Value"])

	-- health percentage
	local HPpercentage
	if C["UF: ToT"]["PercentageTags"] == true then
		HPpercentage = Health:CreateFontString(nil, "OVERLAY")
		HPpercentage:SetAlpha(1)
		HPpercentage:SetFontObject(HealthFont)
		HPpercentage:SetScale(HealthFontSize)
		self:Tag(HPpercentage, "[perhp]%")
	end

	-- Healcomm
	if C.UnitFrames.HealComm then
		myBar:SetWidth(HealthWidth)
		otherBar:SetWidth(HealthWidth)
		absorbBar:SetWidth(HealthWidth)
	end

	-- power
	Power:SetFrameStrata("MEDIUM")
	Power:SetFrameLevel(3)
	Power:SetStatusBarTexture(PowerTexture)
	
	Power:CreateBackdrop()
	Power.Backdrop:SetOutside(Power)
	Power.Backdrop:CreateShadow()
	if C["General"]["ClassShadowExcludeUF"] then
		Power.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
	end

	Power.Background = Power:CreateTexture(nil, "BORDER")
	Power.Background:SetTexture(PowerTexture)
	Power.Background:SetAllPoints(Power)
	Power.Background.multiplier = C.UnitFrames.StatusBarBackgroundMultiplier / 100

	-- power value
	Power.Value = Power:CreateFontString(nil, "OVERLAY")
	Power.Value:SetFontObject(PowerFont)
	Power.Value:SetScale(PowerFontSize)
	self:Tag(Power.Value, C["UF: ToT"]["PowerTag"]["Value"])

	self.Power = Power
	self.Power.bg = Power.Background
	Power.frequentUpdates = true
	Power.colorPower = true
	Power.PostUpdate = nil

	-- power percentage
	local MPpercentage
	if C["UF: ToT"]["PercentageTags"] == true then
		MPpercentage = Power:CreateFontString(nil, "OVERLAY")
		MPpercentage:SetAlpha(1)
		MPpercentage:SetFontObject(PowerFont)
		MPpercentage:SetScale(PowerFontSize)
		self:Tag(MPpercentage, "[perpp]%")
	end

	-- portrait
	if C.UnitFrames.Portrait == true and C["UF: ToT"]["PortraitStyle"]["Value"] == "Side" then
		Portrait:ClearAllPoints()
		Portrait:SetParent(Health)
		Portrait.Backdrop:SetOutside(Portrait)
		Portrait.Backdrop:CreateShadow()
		PortraitShadow:Kill()
	end

		-- Debuffs
	if (C.UnitFrames.TOTAuras) then
		if C["UF: ToT"]["Debuffs"] == true then
			-- Debuffs anchorframe
			Debuffs:ClearAllPoints()
			Debuffs:SetParent(Health)
			
			-- Debuffs icons
			Debuffs.size = C["UF: ToT"]["DebuffSize"]
			Debuffs.num = C["UF: ToT"]["DebuffNumber"]
			Debuffs.numRow = C["UF: ToT"]["DebuffNumberRows"]
			Debuffs.spacing = C["UF: ToT"]["DebuffSpacing"]
			Debuffs.PostCreateIcon = UnitFrames.PostCreateAura
			Debuffs.PostUpdateIcon = UnitFrames.PostUpdateAura
			Debuffs.onlyShowPlayer = C["UF: ToT"].OnlySelfDebuffs
			Movers:RegisterFrame(Debuffs, "ToT Debuffs")
		else
			Debuffs.num = 0
		end
	end
		
	-- Buffs	
	if (C.UnitFrames.TOTAuras) then
		if C["UF: ToT"]["Buffs"] == true then
			Buffs:ClearAllPoints()
			Buffs:SetFrameStrata(self:GetFrameStrata())
			Buffs:SetParent(Health)
			
			-- Buffs icons
			Buffs.size = C["UF: ToT"]["BuffSize"]
			Buffs.num = C["UF: ToT"]["BuffNumber"]
			Buffs.numRow = C["UF: ToT"]["BuffNumberRows"]
			Buffs.spacing = C["UF: ToT"]["BuffSpacing"]
			Buffs.PostCreateIcon = UnitFrames.PostCreateAura
			Buffs.PostUpdateIcon = UnitFrames.PostUpdateAura
			Buffs.PostUpdate = UnitFrames.UpdateBuffsHeaderPosition
			Buffs.onlyShowPlayer = C["UF: ToT"]["OnlySelfBuffs"]

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

	-- raid icon
	if C["UF: ToT"]["RaidIcon"] == true then
		RaidIcon:ClearAllPoints()
		RaidIcon:SetDrawLayer("OVERLAY", 7)
		RaidIcon:SetWidth(RaidIconSize)
		RaidIcon:SetHeight(RaidIconSize)
	else
		RaidIcon:Hide()
	end

	-- roll icon
	local GroupRoleIndicator
	if T.Retail then
		if C["UF: ToT"]["RoleIcon"] == true then
			GroupRoleIndicator = Health:CreateTexture(nil, "OVERLAY")
			GroupRoleIndicator:SetWidth(RoleIconSize)
			GroupRoleIndicator:SetHeight(RoleIconSize)

			if C["UnitFrames"]["Roles"]["Value"] == "MaxUI Style" or C["UnitFrames"]["Roles"]["Value"] == "Elvui Style" then
				GroupRoleIndicator.Override = UnitFrames.SetGridGroupRole
			end
			self.GroupRoleIndicator = GroupRoleIndicator
		end
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

------------------------------------------------------------------------------------------
-- MaxUI UF STYLE HORIZONTAL
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["HorVer"]["Value"] == "Horizontal" then

		-- health value
		Health.Value:SetPoint("RIGHT", Health, "RIGHT", -2, 0)
		Health.Value:SetJustifyH("RIGHT")

		-- health percentage
		if C["UF: ToT"]["PercentageTags"] == true then
			HPpercentage:SetPoint("LEFT", Health, "Right", 2, 0)
			HPpercentage:SetJustifyH("LEFT")
		end

		-- power
		Power:SetPoint("LEFT", Health, "BOTTOMLEFT", 6, 0)
		Power:SetHeight(PowerHeight)
		Power:SetWidth(PowerWidth)

		-- power value
		Power.Value:SetPoint("RIGHT", Power, "RIGHT", -4, 0)
		Power.Value:SetJustifyH("RIGHT")

		-- power percentage
		if C["UF: ToT"]["PercentageTags"] == true then
			MPpercentage:SetPoint("LEFT", Power, "RIGHT", 2, 0)
			MPpercentage:SetJustifyH("LEFT")
		end
		
		-- portrait
		if C.UnitFrames.Portrait == true and C["UF: ToT"]["PortraitStyle"]["Value"] == "Side" then
			Portrait:SetPoint("RIGHT", Health, "LEFT", -8, 0)
			Portrait:SetWidth(HealthHeight)
			Portrait:SetHeight(HealthHeight-2)
		end

		-- Debuffs
		if (C.UnitFrames.TOTAuras) then
			if C["UF: ToT"]["Debuffs"] == true then
				Debuffs:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", 2, 14)
				Debuffs:SetHeight(C["UF: ToT"]["DebuffSize"]*C["UF: ToT"]["DebuffNumberRows"])
				Debuffs:SetWidth(HealthWidth)
				
				Debuffs.initialAnchor = "BOTTOMLEFT"
				Debuffs["growth-y"] = "UP"
				Debuffs["growth-x"] = "RIGHT"
			end
		end

		-- Buffs	
		if (C.UnitFrames.TOTAuras) then
			if C["UF: ToT"]["Buffs"] == true then
				if C["UF: ToT"]["Debuffs"] == true then
					Buffs:SetPoint("BOTTOMLEFT", Debuffs, "TOPLEFT", 0, 14)
				else
					Buffs:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", 2, 42)
				end
				Buffs:SetHeight(C["UF: ToT"]["BuffSize"]*C["UF: ToT"]["BuffNumberRows"])
				Buffs:SetWidth(C["UF: ToT"]["HealthWidth"])
				
				Buffs.initialAnchor = "BOTTOMLEFT"
				Buffs["growth-y"] = "UP"
				Buffs["growth-x"] = "RIGHT"
			end
		end

		-- raid icon
		if C["UF: ToT"]["RaidIcon"] == true then
			RaidIcon:SetPoint("LEFT", Name, "RIGHT", 26, 0)
		end

		-- roll icon
		if T.Retail then
			if C["UF: ToT"]["RoleIcon"] == true then
				GroupRoleIndicator:SetPoint("LEFT", Name, "RIGHT", 0, 0)
			end
		end

		-- filter
		if C["Skins"]["UnitFramesFilter"] == true then 
			Health:CreateMaxUIFilter()
			Power:CreateMaxUIFilter()
		end
	end

------------------------------------------------------------------------------------------
-- MaxUI UF STYLE VERTICAL
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then

		-- health
		Health:SetOrientation("VERTICAL")

		-- health value
		Health.Value:ClearAllPoints()
		Health.Value:SetPoint("TOPLEFT", Name, "BOTTOMLEFT", 0, -4)
		Health.Value:SetJustifyH("LEFT")

		-- health percentage
		if C["UF: ToT"]["PercentageTags"] == true then
			HPpercentage:SetPoint("BOTTOM", Health, "TOP", 2, 4)
			HPpercentage:SetJustifyH("CENTER")
		end

		-- healcomm
		if C.UnitFrames.HealComm then
			myBar:SetOrientation("VERTICAL")
			myBar:SetWidth(HealthHeight-2)
			myBar:SetHeight(HealthWidth)
			myBar:SetStatusBarTexture(HealthTexture)
			myBar:ClearAllPoints()
			myBar:SetPoint("BOTTOM", Health:GetStatusBarTexture(), "TOP", 0, 0)

			otherBar:SetOrientation("VERTICAL")
			otherBar:SetWidth(HealthHeight-2)
			otherBar:SetHeight(HealthWidth)
			otherBar:SetStatusBarTexture(HealthTexture)
			otherBar:ClearAllPoints()
			otherBar:SetPoint("BOTTOM", myBar:GetStatusBarTexture(), "TOP", 0, 0)

			absorbBar:SetOrientation("VERTICAL")
			absorbBar:SetWidth(HealthHeight-2)
			absorbBar:SetHeight(HealthWidth)
			absorbBar:SetStatusBarTexture(HealthTexture)
			absorbBar:ClearAllPoints()
			absorbBar:SetPoint("BOTTOM", Health:GetStatusBarTexture(), "TOP", 0, 0)
		end

		-- power
		--Power:ClearAllPoints()
		Power:SetPoint("BOTTOM", Health, "BOTTOMRIGHT", 0, 10)
		Power:SetHeight(PowerWidth)
		Power:SetWidth(PowerHeight)
		Power:SetOrientation("VERTICAL")

		-- power value
		--Power.Value:ClearAllPoints()
		Power.Value:SetPoint("TOPLEFT", Health.Value, "BOTTOMLEFT", -0, -4)

		-- power percentage
		if C["UF: ToT"]["PercentageTags"] == true then
			MPpercentage:SetPoint("BOTTOM", Power, "TOP", -2, 4)
			MPpercentage:SetJustifyH("CENTER")
		end
		
		-- portrait
		if C.UnitFrames.Portrait == true and C["UF: ToT"]["PortraitStyle"]["Value"] == "Side" then
			Portrait:SetPoint("TOP", Health, "BOTTOM", 0, -10)
			Portrait:SetWidth(HealthHeight-2)
			if C.UnitFrames.Portrait2D then
				Portrait:SetHeight(HealthHeight-2)
			else
				Portrait:SetHeight(8 + C["UF: ToT"]["NameFontSize"] + C["UF: ToT"]["HealthFontSize"] +C["UF: ToT"]["PowerFontSize"])
			end

			Name:ClearAllPoints()
			Name:SetPoint("TOPLEFT", Portrait, "TOPRIGHT", 4, 0)
		end

		-- Debuffs
		if (C.UnitFrames.TOTAuras) then
			if C["UF: ToT"]["Debuffs"] == true then
				Debuffs.initialAnchor = "BOTTOMLEFT"
				Debuffs["growth-y"] = "UP"
				Debuffs["growth-x"] = "RIGHT"

				Debuffs:SetHeight(HealthWidth)
				Debuffs:SetWidth(C["UF: ToT"]["DebuffSize"]*C["UF: ToT"]["DebuffNumberRows"])
				Debuffs:SetPoint("BOTTOMLEFT", Health, "BOTTOMRIGHT", 14, 0)
			end
		end

		-- Buffs	
		if (C.UnitFrames.TOTAuras) then
			if C["UF: ToT"]["Buffs"] == true then
				if C["UF: ToT"]["Debuffs"] == true then
					Buffs:SetPoint("BOTTOMLEFT", Debuffs, "BOTTOMRIGHT", 8, 0)
				else
					Buffs:SetPoint("BOTTOMLEFT", Health, "BOTTOMRIGHT", 14, 0)
				end
				Buffs:SetHeight(HealthWidth)
				Buffs:SetWidth(C["UF: ToT"]["BuffSize"]*C["UF: ToT"]["BuffNumberRows"])

				Buffs.initialAnchor = "BOTTOMLEFT"
				Buffs["growth-y"] = "UP"
				Buffs["growth-x"] = "RIGHT"
			end
		end

		-- raid icon
		if C["UF: ToT"]["RaidIcon"] == true then
			--RaidIcon:ClearAllPoints()
			RaidIcon:SetPoint("BOTTOM", Power, "TOP", 0, 16)
		end

		-- roll icon
		if T.Retail then
			if C["UF: ToT"]["RoleIcon"] == true then
				GroupRoleIndicator:SetPoint("TOP", Health, "BOTTOM", 0, -4)
			end
		end

		-- filter
		if C["Skins"]["UnitFramesFilter"] == true then 
			Health:CreateMaxUIVerticalFilter()
			Power:CreateMaxUIVerticalFilter()
		end
	end		
end	