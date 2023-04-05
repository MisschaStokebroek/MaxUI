------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-10-2022
------------------------------------------------------------------------------------------

-- setting up FOCUS TARGET FRAMES.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T.UnitFrames
local Movers = T["Movers"]
local baseFocusTarget = UnitFrames.FocusTarget

------------------------------------------------------------------------------------------
-- TARGET FOCUS FRAME SETUP POSITION AND BASIC SIZE
------------------------------------------------------------------------------------------
local function CreateUnits()
	local FocusTarget = UnitFrames.Units.FocusTarget
	local Focus = UnitFrames.Units.Focus
	
	if not C["UnitFrames"]["Enable"] == true then return end

	if C["UF: Focus"]["EnableFT"] ~= true then
		FocusTarget:Kill()
	end	
	
------------------------------------------------------------------------------------------
-- TARGET FOCUS FRAME SIZE
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		FocusTarget:SetHeight(C["UF: Focus"]["HealthHeight"])
		FocusTarget:SetWidth(C["UF: Focus"]["HealthWidth"])
		FocusTarget.Backdrop:SetBackdrop(nil)
	end	
		
------------------------------------------------------------------------------------------
-- TARGET FOCUS FRAME POSITION
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		FocusTarget:ClearAllPoints()

		if (C.UnitFrames.Portrait == true and C["UF: Focus"]["PortraitStyle"]["Value"] == "Side") or
			(C.UnitFrames.CastBar == true and C["UF: Focus"]["CastBar"] and C["UF: Focus"]["CastBarIcon"] == true and C["UF: Focus"]["CastBarUnlink"] == false) then
			
			FocusTarget:SetPoint("LEFT", Focus, "RIGHT", ((C["UF: Focus"]["HealthHeight"]*2) +6+10+6), 0)
				
		else
			FocusTarget:SetPoint("LEFT", Focus, "RIGHT", 10, 0)
		end
	end	
end
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- TARGET FOCUS FRAME GENERAL (MAXUI AND TUKUI)
------------------------------------------------------------------------------------------
function UnitFrames:FocusTarget()
	baseFocusTarget(self)
	
	-- wow

	-- elements
	local Name = self.Name
	local Health = self.Health
	local Power = self.Power
	local Castbar = self.Castbar
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs
	local RaidIcon = self.RaidTargetIndicator
	local Portrait
	local PortraitBackdrop
	local PortraitShadow

	-- settings
	local HealthHeight = C["UF: Focus"]["HealthHeight"]
	local HealthWidth = C["UF: Focus"]["HealthWidth"]
	local PowerHeight = C["UF: Focus"]["PowerHeight"]
	local PowerWidth = C["UF: Focus"]["PowerWidth"]
	local CastHeight = C["UF: Focus"]["CastHeight"]
	local CastWidth = C["UF: Focus"]["CastWidth"]
	local RoleIconSize = C["UF: Focus"]["RoleIconSize"]
	local RaidIconSize = C["UF: Focus"]["RaidIconSize"]

	-- fonts
	local NameFont = T.GetFont(C["UF: Focus"]["NameFont"])
	local HealthFont = T.GetFont(C["UF: Focus"]["HealthFont"])
	local PowerFont = T.GetFont(C["UF: Focus"]["PowerFont"])
	local CastFont = T.GetFont(C["UF: Focus"]["CastFont"])
	local NameFontSize = C["UF: Focus"]["NameFontSize"]/10
	local HealthFontSize = C["UF: Focus"]["HealthFontSize"]/10
	local PowerFontSize = C["UF: Focus"]["PowerFontSize"]/10
	local CastFontSize = C["UF: Focus"]["CastFontSize"]/10

	-- textures
	local HealthTexture = T.GetTexture(C["UF: Focus"]["HealthTexture"])
	local PowerTexture = T.GetTexture(C["UF: Focus"]["PowerTexture"])
	local CastTexture = T.GetTexture(C["UF: Focus"]["CastTexture"])

	-- MaxUI
	
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

		Portrait:SetSize(19, 19)
		Portrait:SetPoint("LEFT", self, "RIGHT", 10, 0)
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

		if (C.UnitFrames.Portrait == true and C["UF: Focus"]["PortraitStyle"]["Value"] == "None") then
			Portrait:Kill()
			PortraitBackdrop:Kill()
			PortraitShadow:Kill()

		elseif C["UF: Focus"]["PortraitStyle"]["Value"] == "Overlay" then
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
			Portrait:SetAlpha(C["UF: Focus"]["PortraitOverlayAlpha"])
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
		Health.colorThreat = C["UF: Focus"]["ColorThreat"]
	elseif C["UnitFrames"]["Colorstyle"]["Value"] == "Gradient" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = false
		Health.colorReaction = false
		Health.colorSmooth = true
		Health.colorThreat = C["UF: Focus"]["ColorThreat"]
	elseif C["UnitFrames"]["Colorstyle"]["Value"] == "Class" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = true
		Health.colorReaction = true
		Health.colorThreat = C["UF: Focus"]["ColorThreat"]
	elseif C["UnitFrames"]["Colorstyle"]["Value"] == "Custom" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = false
		Health.colorReaction = false
		Health.colorThreat = C["UF: Focus"]["ColorThreat"]
	end	
	Health.PreUpdate = UnitFrames.PreUpdateHealth

------------------------------------------------------------------------------------------
-- HEALCOMM - to be added?
------------------------------------------------------------------------------------------
	--if C.UnitFrames.HealComm then
		--myBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
		--otherBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
		--absorbBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
	--end
	
------------------------------------------------------------------------------------------
-- MOUSEOVER COMBAT ALPHA
------------------------------------------------------------------------------------------
	if C["UF: Focus"]["NonCombatAlphaEnable"] == true then 
		self:HookScript("OnUpdate", function(self)
			if InCombatLockdown() then
				self:SetAlpha(1)
				Health.Background:SetAlpha(1)
			elseif MouseIsOver(self) then
				self:SetAlpha(1)
				Health.Background:SetAlpha(1)
			else
				self:SetAlpha(C["UF: Focus"]["NonCombatAlpha"])
				Health.Background:SetAlpha(C["UF: Focus"]["NonCombatAlpha"])
			end
		end)
	end

------------------------------------------------------------------------------------------
-- EXCLUDE SHADOW COLOR
------------------------------------------------------------------------------------------
	if C["General"]["ClassShadowExcludeUF"] then
		self.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
	end

------------------------------------------------------------------------------------------
-- MaxUI UF STYLE BASIC
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] ~= "MaxUI" then return end

	-- name focus target
	Name:ClearAllPoints()
	Name:SetPoint("TOPLEFT", Health, "BOTTOMLEFT", 0, -8)
	Name:SetFontObject(NameFont)
	Name:SetScale(NameFontSize)
	self:Tag(Name, C["UF: Focus"]["FocusNameTag"]["Value"]) 

	-- health
	Health:SetFrameStrata("MEDIUM")
	Health:SetFrameLevel(1)
	Health:SetStatusBarTexture(HealthTexture)
	--Health:ClearAllPoints()
	Health:SetInside(self)
	
	Health:CreateBackdrop()
	Health.Backdrop:SetBackdropColor(0, 0, 0, 0)
	Health.Backdrop:SetOutside(Health)
	
	Health.Value:ClearAllPoints()
	Health.Value:SetPoint("RIGHT", Health, "RIGHT", -2, 1)
	Health.Value:SetJustifyH("RIGHT")
	Health.Value:SetFontObject(HealthFont)
	Health.Value:SetScale(HealthFontSize)
	self:Tag(Health.Value, C["UnitFrames"]["FocusHealthTag"]["Value"])

	-- HPpercentage tag
	if C["UF: Focus"]["PercentageTags"] == true then
		local HPpercentage = Health:CreateFontString(nil, "OVERLAY")
		HPpercentage:SetPoint("LEFT", Health, "RIGHT", 4, 0)
		HPpercentage:SetAlpha(1)
		HPpercentage:SetJustifyH("LEFT")
		HPpercentage:SetFontObject(HealthFont)
		HPpercentage:SetScale(HealthFontSize)
		self:Tag(HPpercentage, "[perhp]%")
	end

	-- power
	Power:ClearAllPoints()
	Power:SetFrameStrata("MEDIUM")
	Power:SetFrameLevel(3)
	Power:SetPoint("LEFT", Health, "BOTTOMLEFT", 6, 0)
	Power:SetHeight(PowerHeight)
	Power:SetWidth(PowerWidth)
	Power:SetStatusBarTexture(PowerTexture)

	Power:CreateBackdrop()
	Power.Backdrop:SetOutside(Power)
	Power.Backdrop:CreateShadow()
	if C["General"]["ClassShadowExcludeUF"] then
		Power.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
	end

	Power.Value = Power:CreateFontString(nil, "OVERLAY")
	Power.Value:SetPoint("RIGHT", Power, "RIGHT", -2, 1)
	Power.Value:SetFontObject(PowerFont)
	Power.Value:SetScale(PowerFontSize)
	Power.Value:SetJustifyH("RIGHT")
	self:Tag(Power.Value, C["UF: Focus"]["PowerTag"]["Value"])
	
	Power.PostUpdate = nil

	-- mp percentage
	if C["UF: Focus"]["PercentageTags"] == true then
		local MPpercentage = Power:CreateFontString(nil, "OVERLAY")
		MPpercentage:SetPoint("LEFT", Power, "RIGHT", 2, 0)
		MPpercentage:SetAlpha(1)
		MPpercentage:SetJustifyH("LEFT")
		MPpercentage:SetFontObject(PowerFont)
		MPpercentage:SetScale(PowerFontSize)
		self:Tag(MPpercentage, "[perpp]%")
	end

	-- portrait
	if (C.UnitFrames.Portrait == true and C["UF: Focus"]["PortraitStyle"]["Value"] == "Side") then
		Portrait:ClearAllPoints()
		Portrait:SetParent(Health)
		
		Portrait:SetPoint("RIGHT", Health, "LEFT", -6, 0)
		Portrait:SetWidth(HealthHeight)
		Portrait:SetHeight(HealthHeight-2)
		
		Portrait.Backdrop:SetOutside(Portrait)
		Portrait.Backdrop:CreateShadow()
		PortraitShadow:Kill()
	end

	-- buffs
	if (C.UnitFrames.FocusAuras) then
		if C["UF: Focus"]["Buffs"] == true then
			Buffs:ClearAllPoints()
			Buffs:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", 1, 8)
			Buffs:SetWidth(HealthWidth)
			Buffs:SetHeight(20)
			Buffs.initialAnchor = "BOTTOMLEFT"
			Buffs["growth-x"] = "RIGHT"
			Buffs.size = 18
			Buffs.num = C["UF: Focus"]["NumberOfBuffsShown"]
			Buffs.spacing = 4
		else
			Buffs.num = 0
		end
	end	
		
	-- debuffs
	if (C.UnitFrames.FocusAuras) then
		if C["UF: Focus"]["Debuffs"] == true then
			Debuffs:ClearAllPoints()
			if C["UF: Focus"]["PercentageTags"] == true then
				Debuffs:SetPoint("LEFT", Health, "RIGHT", 40, 0)
			else
				Debuffs:SetPoint("LEFT", Health, "RIGHT", 10, 0)
			end
			Debuffs:SetWidth((C["UF: Focus"]["NumberOfDebuffsShown"]*HealthHeight) + (4*(C["UF: Focus"]["NumberOfDebuffsShown"]-1)))
			Debuffs:SetHeight(HealthHeight)
			Debuffs:SetParent(Health)
			Debuffs.size = HealthHeight
			Debuffs.spacing = 4
			Debuffs.num = C["UF: Focus"]["NumberOfDebuffsShown"]
			Debuffs.initialAnchor = "LEFT"
			Debuffs["growth-x"] = "RIGHT"
		else
			Debuffs.num = 0
		end
	end

	-- raid icon
	RaidIcon:ClearAllPoints()
	RaidIcon:SetWidth(RaidIconSize)
	RaidIcon:SetHeight(RaidIconSize)
	RaidIcon:SetPoint("LEFT", Name, "RIGHT", 4, 0)	
	
	-- roll icon
	if T.Retail then
		if C["UF: Focus"]["RoleIcon"] == true then
			local GroupRoleIndicator = Health:CreateTexture(nil, "OVERLAY")
			GroupRoleIndicator:SetHeight(RoleIconSize)
			GroupRoleIndicator:SetWidth(RoleIconSize)
			GroupRoleIndicator:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -0, 4)
			
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

	-- filter
	if C["Skins"]["UnitFramesFilter"] == true then 
		Health:CreateMaxUIFilter()
		Power:CreateMaxUIFilter()
		if (C.UnitFrames.Portrait == true and C["UF: Player"]["PortraitStyle"]["Value"] == "Side") then
			Portrait.Backdrop:CreateMaxUIFilter()
			Portrait.Backdrop.Filter:SetDrawLayer("OVERLAY", 5)
		end
	end
end