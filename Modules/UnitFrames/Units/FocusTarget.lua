------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up FOCUS TARGET FRAMES.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T.UnitFrames
local baseFocusTarget = UnitFrames.FocusTarget

------------------------------------------------------------------------------------------
-- FOCUS FRAME SETUP POSITION AND BASIC SIZE
------------------------------------------------------------------------------------------
local function CreateUnits()
	local FocusTarget = UnitFrames.Units.FocusTarget
	local Focus = UnitFrames.Units.Focus
	
	if not C["UnitFrames"]["Enable"] == true then return end

	if C["UF: Focus"]["Enable"] ~= true then
		FocusTarget:Kill()
	end	
	
------------------------------------------------------------------------------------------
-- FOCUS FRAME SIZE
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		FocusTarget:SetHeight(C["UF: Focus"]["HealthHeight"])
		FocusTarget:SetWidth(C["UF: Focus"]["HealthWidth"])
		FocusTarget.Backdrop:SetBackdrop(nil)
	end	
		
------------------------------------------------------------------------------------------
-- FOCUS FRAME POSITION
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		FocusTarget:ClearAllPoints()
		FocusTarget:SetPoint("LEFT", Focus, "RIGHT", 10, 0)
	end	
end
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- FOCUS FRAME MAXUI THEME
------------------------------------------------------------------------------------------
function UnitFrames:FocusTarget()
	-- Tukui
	baseFocusTarget(self)
	
	-- MaxUI
	local Health = self.Health
	local Power = self.Power
	local Castbar = self.Castbar
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs
	local Name = self.Name
	local RaidIcon = self.RaidTargetIndicator
	--local myBar = self.HealthPrediction.myBar
	--local otherBar = self.HealthPrediction.otherBar
	--local absorbBar = self.HealthPrediction.absorbBar
	
	local thickness = C["General"]["thickness"] 
	local HealthHeight = C["UF: Focus"]["HealthHeight"]
	local HealthWidth = C["UF: Focus"]["HealthWidth"]
	local PowerHeight = C["UF: Focus"]["PowerHeight"]
	local PowerWidth = C["UF: Focus"]["PowerWidth"]
	local CastFont = T.GetFont(C["UF: Focus"]["CastFont"])
	local HealthFont = T.GetFont(C["UF: Focus"]["HealthFont"])
	local NameFont = T.GetFont(C["UF: Focus"]["NameFont"])
	local PowerFont = T.GetFont(C["UF: Focus"]["PowerFont"])
	local CastFontSize = C["UF: Focus"]["CastFontSize"]/10
	local HealthFontSize = C["UF: Focus"]["HealthFontSize"]/10
	local NameFontSize = C["UF: Focus"]["NameFontSize"]/10
	local PowerFontSize = C["UF: Focus"]["PowerFontSize"]/10
	local HealthTexture = T.GetTexture(C["UF: Focus"]["HealthTexture"])
	local PowerTexture = T.GetTexture(C["UF: Focus"]["PowerTexture"])
	local CastTexture = T.GetTexture(C["UF: Focus"]["CastTexture"])
	local RoleIconSize = C["UF: Focus"]["RoleIconSize"]
	local RaidIconSize = C["UF: Focus"]["RaidIconSize"]
	
------------------------------------------------------------------------------------------
-- PORTRAIT STYLE
------------------------------------------------------------------------------------------
	local Portrait = CreateFrame("PlayerModel", nil, Health)
	self.Portrait = Portrait

	if C["UF: Focus"]["PortraitStyle"]["Value"] == "None" then

	elseif C["UF: Focus"]["PortraitStyle"]["Value"] == "Side" then
		Portrait:SetPoint("LEFT", Health, "RIGHT", 8, 0)
		Portrait:SetWidth(HealthHeight)
		Portrait:SetHeight(HealthHeight-2)
		Portrait:CreateBackdrop()
		Portrait.Backdrop:SetOutside(Portrait)
		Portrait.Backdrop:CreateShadow()
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
			Portrait:Kill()
		end
			
	elseif C["UF: Focus"]["PortraitStyle"]["Value"] == "Overlay" then
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
-- HEALCOMM
------------------------------------------------------------------------------------------
	--if C.UnitFrames.HealComm then
	--	myBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
	--	otherBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
	--	absorbBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
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
-- MaxUI UF STYLE
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then

		-- health
		Health:SetStatusBarTexture(HealthTexture)
		Health:ClearAllPoints()
		Health:SetInside(self)
		
		Health:CreateBackdrop()
		Health.Backdrop:SetBackdropColor(0, 0, 0, 0)
		Health.Backdrop:SetOutside(Health)
		
		Health.Value:ClearAllPoints()
		Health.Value:SetPoint("RIGHT", Health, "RIGHT", -2, 1)
		Health.Value:SetFontObject(HealthFont)
		Health.Value:SetScale(HealthFontSize)
		self:Tag(Health.Value, C["UnitFrames"]["FocusTargetHealthTag"]["Value"])
	
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
		Power:SetPoint("LEFT", Health, "BOTTOMLEFT", 6, 0)
		Power:SetHeight(PowerHeight)
		Power:SetWidth(PowerWidth)
		Power:SetFrameLevel(5)
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

		-- name focus target
		Name:ClearAllPoints()
		Name:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", 0, 5)
		Name:SetFontObject(NameFont)
		Name:SetScale(NameFontSize)
		self:Tag(Name, C["UF: Focus"]["FocusTargetNameTag"]["Value"]) 

--[[
		-- castbar	
		if C["UF: Focus"]["CastBar"] == true then
			Castbar:SetFrameLevel(15)
			Castbar:CreateBackdrop()
			Castbar:SetStatusBarTexture(CastTexture)
			
			if C["UF: Focus"]["CastIcon"] == true then
				Castbar.Button:ClearAllPoints()
				Castbar.Button:SetPoint("TOPLEFT", Health, "BOTTOMLEFT", 2, -10)
				Castbar.Button:SetWidth(20)
				Castbar.Button:SetHeight(20)
				Castbar.Button:CreateBackdrop()
				Castbar.Button:CreateShadow()
				if C["General"]["ClassShadowExcludeUF"] then
					Castbar.Button.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
				end
			else
				Castbar.Button:Hide()
			end

			--Castbar.Time = Castbar:CreateFontString(nil, "OVERLAY")
			--Castbar.Time:SetPoint("TOPLEFT", Castbar.Text, "BOTTOMLEFT", 0, -4)
			--Castbar.Time:SetFontObject(CastFont)
			--Castbar.Time:SetScale(CastFontSize)
			--Castbar.Time:SetJustifyH("LEFT")
	
			Castbar.Text:ClearAllPoints()
			Castbar.Text:SetWidth(250)
			Castbar.Text:SetJustifyH("LEFT")
			Castbar.Text:SetFontObject(CastFont)
			Castbar.Text:SetScale(CastFontSize)
			Castbar.Text:SetPoint("TOPLEFT", Castbar, "BOTTOMLEFT", 0, -4)
		
			if C["UF: Focus"]["CastIcon"] == true then
				Castbar.Text:ClearAllPoints()
				Castbar.Text:SetPoint("TOPLEFT", Castbar.Button, "TOPRIGHT", 4, 0)
			end

			else
				Castbar:Kill()
			end
]]
		
		-- raid icon
		RaidIcon:ClearAllPoints()
		RaidIcon:SetWidth(RaidIconSize)
		RaidIcon:SetHeight(RaidIconSize)
		RaidIcon:SetPoint("CENTER", Health, "BOTTOMRIGHT", 2, -2)	
		
		-- roll icon
		if T.Retail then
			if C["UF: Focus"]["RoleIcon"] == true then
				local GroupRoleIndicator = Health:CreateTexture(nil, "OVERLAY")
				GroupRoleIndicator:SetHeight(RoleIconSize)
				GroupRoleIndicator:SetWidth(RoleIconSize)
				GroupRoleIndicator:SetPoint("LEFT", Name, "LEFT", -0, 0)
				
				if C["UnitFrames"]["Roles"]["Value"] == "MaxUI Style" or C["UnitFrames"]["Roles"]["Value"] == "Elvui Style" then
					GroupRoleIndicator.Override = UnitFrames.SetGridGroupRole
				end
				self.GroupRoleIndicator = GroupRoleIndicator
			end
		end
		
		-- highlighting unit
		self:HookScript("OnEnter", function(self)
			Health.Backdrop:SetBorderColor(Health:GetStatusBarColor())
			Power.Backdrop:SetBorderColor(Power:GetStatusBarColor())
		end)

		self:HookScript("OnLeave", function(self)
			Health.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
			Power.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
		end)

		-- Healcomm Bars adjustments
		--if C.UnitFrames.HealComm then
		--	myBar:SetWidth(HealthWidth)
		--	otherBar:SetWidth(HealthWidth)
		--	absorbBar:SetWidth(HealthWidth)
		--	myBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
		--	otherBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
		--	absorbBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
		--end

		-- buffs and debuffs
		if (C.UnitFrames.FocusAuras) then
			if C["UF: Focus"]["Buffs"] == true then
				Buffs:ClearAllPoints()
				Buffs:SetPoint("BOTTOMRIGHT", Health, "TOPRIGHT", 1, 8)
				Buffs:SetWidth(HealthWidth)
				Buffs:SetHeight(18)
				Buffs.initialAnchor = "BOTTOMRIGHT"
				Buffs["growth-x"] = "LEFT"
				Buffs.size = 18
				Buffs.num = 3
				Buffs.spacing = 4
			else
				Buffs.num = 0
			end
			
			if C["UF: Focus"]["Debuffs"] == true then
				Debuffs:SetWidth(200)
				Debuffs:SetHeight(HealthHeight)
				Debuffs:ClearAllPoints()
				Debuffs:SetParent(Health)
				if C["UF: Focus"]["PercentageTags"] == true then
					Debuffs:SetPoint("LEFT", Health, "RIGHT", 40, 0)
				else
					Debuffs:SetPoint("LEFT", Health, "RIGHT", 10, 0)
				end
				Debuffs.size = HealthHeight
				Debuffs.spacing = 4
				Debuffs.num = 3
				Debuffs.initialAnchor = "LEFT"
				Debuffs["growth-x"] = "RIGHT"
			else
				Debuffs.num = 0
			end
		end
	end
end