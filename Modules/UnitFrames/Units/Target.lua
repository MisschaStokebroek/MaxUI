------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-10-2022
------------------------------------------------------------------------------------------

-- setting up TARGET FRAMES.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T.UnitFrames
local Movers = T["Movers"]
local baseTarget = UnitFrames.Target

------------------------------------------------------------------------------------------
-- TARGET FRAME SETUP
------------------------------------------------------------------------------------------
local function CreateUnits()	
	local Target = UnitFrames.Units.Target

	if not C["UnitFrames"]["Enable"] == true then return end

	if C["UF: Target"]["Enable"] ~= true then
		Target:Kill()
	end	

------------------------------------------------------------------------------------------
-- TARGET FRAME SIZE
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		Target:SetHeight(C["UF: Target"]["HealthHeight"])
		Target:SetWidth(C["UF: Target"]["HealthWidth"])
		Target.Backdrop:SetBackdrop(nil)
		
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
			Target:SetHeight(C["UF: Target"]["HealthWidth"])
			Target:SetWidth(C["UF: Target"]["HealthHeight"])
		end
	end
	
------------------------------------------------------------------------------------------
-- TARGET FRAME POSITION
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		if (C.UnitFrames.Portrait == true and C["UF: Target"]["PortraitStyle"]["Value"] == "Side") then				
			Target:ClearAllPoints()
			Target:SetPoint("LEFT", MaxUIUnitframesAnchor, "RIGHT", C["UF: Target"]["HealthHeight"] +6, 0)
		else
			Target:ClearAllPoints()
			Target:SetPoint("LEFT", MaxUIUnitframesAnchor, "RIGHT", 0, 0)
		end
		
		-- Vertical UnitFrames
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" and C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
			Target:ClearAllPoints()
			Target:SetPoint("BOTTOM", MaxUIUnitframesAnchor, "TOPRIGHT", 0, 0)
		end
	end
end	
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- TARGET FRAME  GENERAL (MAXUI AND TUKUI)
------------------------------------------------------------------------------------------
function UnitFrames:Target()
	baseTarget(self)
	
	-- wow
	-- elements
	local Panel = self.Panel
	local Name = self.Name
	local Health = self.Health
	local myBar = self.HealthPrediction.myBar
	local otherBar = self.HealthPrediction.otherBar
	local absorbBar = self.HealthPrediction.absorbBar
	local Power = self.Power
	local AltPower = self.AlternativePower
	local CastBar = self.Castbar
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs
	local Portrait
	local PortraitBackdrop
	local PortraitShadow
	if C.UnitFrames.Portrait == true then	
		Portrait = self.Portrait
		PortraitBackdrop = self.Portrait.Backdrop
		PortraitShadow = self.Portrait.Shadow
	end	
	local CombatFeedbackText
	local RaidIcon = self.RaidTargetIndicator
	local Leader = self.LeaderIndicator
	local MasterLooter = self.MasterLooterIndicator 
	local GroupRoleIndicator

	-- settings
	local HealthHeight = C["UF: Target"]["HealthHeight"]
	local HealthWidth = C["UF: Target"]["HealthWidth"]
	local PowerHeight = C["UF: Target"]["PowerHeight"]
	local PowerWidth = C["UF: Target"]["PowerWidth"]
	local CastHeight = C["UF: Target"]["CastHeight"]
	local CastWidth = C["UF: Target"]["CastWidth"]
	local RoleIconSize = C["UF: Target"]["RoleIconSize"]
	local RaidIconSize = C["UF: Target"]["RaidIconSize"]
	local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
	
	-- font
	local NameFont = T.GetFont(C["UF: Target"]["NameFont"])
	local HealthFont = T.GetFont(C["UF: Target"]["HealthFont"])
	local PowerFont = T.GetFont(C["UF: Target"]["PowerFont"])
	local CastFont = T.GetFont(C["UF: Target"]["CastFont"])
	local NameFontSize = C["UF: Target"]["NameFontSize"]/10
	local DescFontSize = C["UF: Target"]["DescFontSize"]/10
	local HealthFontSize = C["UF: Target"]["HealthFontSize"]/10
	local PowerFontSize = C["UF: Target"]["PowerFontSize"]/10
	local CastFontSize = C["UF: Target"]["CastFontSize"]/10
	
	-- textures
	local HealthTexture = T.GetTexture(C["UF: Target"]["HealthTexture"])
	local PowerTexture = T.GetTexture(C["UF: Target"]["PowerTexture"])
	local CastBarTexture = T.GetTexture(C["UF: Target"]["CastTexture"])
	local ClassPowerTexture = T.GetTexture(C["ClassOptions"]["ClassPowerTexture"])
	
------------------------------------------------------------------------------------------
-- PORTRAIT STYLE
------------------------------------------------------------------------------------------
	if (C.UnitFrames.Portrait == true and C["UF: Target"]["PortraitStyle"]["Value"] == "None") then
		Portrait:Kill()
		PortraitBackdrop:Kill()
		PortraitShadow:Kill()
		
	elseif (C.UnitFrames.Portrait == true and C["UF: Target"]["PortraitStyle"]["Value"] == "Overlay") then
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
		Portrait:SetAlpha(C["UF: Target"]["PortraitOverlayAlpha"])
	
	elseif (C.UnitFrames.Portrait == true and C["UF: Target"]["PortraitStyle"]["Value"] == "ClassIcon") then
		Portrait:Kill()
		PortraitBackdrop:Kill()
		PortraitShadow:Kill()

		Portrait = Health:CreateTexture(nil, "OVERLAY")
		Portrait:SetWidth(HealthHeight)

		if select(2, UnitClass('target')) == "DRUID" then
			Portrait:SetTexture(T.GetTexture("vectorDR"))
		end
		
		if select(2, UnitClass('target')) == "EVOKER" then
			Portrait:SetTexture(T.GetTexture("vectorEV"))
		end

		if select(2, UnitClass('target')) == "MONK" then
			Portrait:SetTexture(T.GetTexture("vectorMO"))
		end
		
		if select(2, UnitClass('target')) == "ROGUE" then
			Portrait:SetTexture(T.GetTexture("vectorRO"))
		end
		
		if select(2, UnitClass('target')) == "MAGE" then
			Portrait:SetTexture(T.GetTexture("vectorMA"))
		end
		
		if select(2, UnitClass('target')) == "PRIEST" then
			Portrait:SetTexture(T.GetTexture("vectorPR"))
		end
		
		if select(2, UnitClass('target')) == "WARLOCK" then
			Portrait:SetTexture(T.GetTexture("vectorWL"))
		end
		
		if select(2, UnitClass('target')) == "SHAMAN" then
			Portrait:SetTexture(T.GetTexture("vectorSH"))
		end
		
		if select(2, UnitClass('target')) == "HUNTER" then
			Portrait:SetTexture(T.GetTexture("vectorHU"))
		end
		
		if select(2, UnitClass('target')) == "DEATHKNIGHT" then
			Portrait:SetTexture(T.GetTexture("vectorDK"))
		end
		
		if select(2, UnitClass('target')) == "WARRIOR" then
			Portrait:SetTexture(T.GetTexture("vectorWA"))
		end

		if select(2, UnitClass('target')) == "PALADIN" then
			Portrait:SetTexture(T.GetTexture("vectorPA"))
		end

		if select(2, UnitClass('target')) == "DEMONHUNTER" then
			Portrait:SetTexture(T.GetTexture("vectorDH"))
		end	end

------------------------------------------------------------------------------------------
-- COLOR THEME
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Colorstyle"]["Value"] == "Dark" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = false
		Health.colorReaction = false
		Health.colorThreat = C["UF: Target"]["ColorThreat"]
	elseif C["UnitFrames"]["Colorstyle"]["Value"] == "Gradient" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = false
		Health.colorReaction = false
		Health.colorSmooth = true
		Health.colorThreat = C["UF: Target"]["ColorThreat"]
	elseif C["UnitFrames"]["Colorstyle"]["Value"] == "Class" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = true
		Health.colorReaction = true
		Health.colorThreat = C["UF: Target"]["ColorThreat"]
	elseif C["UnitFrames"]["Colorstyle"]["Value"] == "Custom" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = false
		Health.colorReaction = false
		Health.colorThreat = C["UF: Target"]["ColorThreat"]
	end	
	Health.PreUpdate = UnitFrames.PreUpdateHealth
	Health.colorSmooth = C["UF: Target"]["ColorGradient"]

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
	if C["UF: Target"]["NonCombatAlphaEnable"] == true then 
		self:HookScript("OnUpdate", function(self)
			if InCombatLockdown() then
				self:SetAlpha(1)
				Health.Background:SetAlpha(1)
			elseif MouseIsOver(self) then
				self:SetAlpha(1)
				Health.Background:SetAlpha(1)
			else
				self:SetAlpha(C["UF: Target"]["NonCombatAlpha"])
				Health.Background:SetAlpha(C["UF: Target"]["NonCombatAlpha"])
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

	-- panel
	Panel:Hide()
	Panel:SetFrameStrata(self:GetFrameStrata())
	Panel:SetFrameLevel(self:GetFrameLevel()+1)
		
	-- name
	Name:ClearAllPoints()
	Name:SetPoint("TOPLEFT", Health, "BOTTOMLEFT", 0, -10)
	Name:SetParent(Health)
	Name:SetAlpha(1)
	Name:SetJustifyH("LEFT")
	Name:SetFontObject(NameFont)
	Name:SetScale(NameFontSize)
	self:Tag(Name, C["UF: Target"]["NameTag"]["Value"]) 
	
	local Desc = self:CreateFontString(nil, "OVERLAY")
	Desc:SetPoint("TOPLEFT", Name, "BOTTOMLEFT", 0, -4)
	Desc:SetAlpha(1)
	Desc:SetJustifyH("LEFT")
	Desc:SetFontObject(NameFont)
	Desc:SetScale(DescFontSize)
	Desc:SetTextColor(0.84, 0.75, 0.65)
	self:Tag(Desc, C["UF: Target"]["DescriptionTag"]["Value"]) 

	-- health
	Health:SetFrameStrata("MEDIUM")
	Health:SetFrameLevel(1)
	Health:SetStatusBarTexture(HealthTexture)
	Health:SetInside(self)
	
	Health:CreateBackdrop()
	Health.Backdrop:SetBackdropColor(0, 0, 0, 0)
	Health.Backdrop:SetOutside(Health)

	-- health value
	Health.Value:ClearAllPoints()
	Health.Value:SetFontObject(HealthFont)
	Health.Value:SetScale(HealthFontSize)
	self:Tag(Health.Value, C["UnitFrames"]["TargetHealthTag"]["Value"])

	-- hp percentage
	local HPpercentage
	if C["UF: Target"]["PercentageTags"] == true then
		HPpercentage = Health:CreateFontString(nil, "OVERLAY")
		HPpercentage:SetAlpha(1)
		HPpercentage:SetFontObject(HealthFont)
		HPpercentage:SetScale(HealthFontSize)
		self:Tag(HPpercentage, "[perhp]%")
	end

	-- healcomm
	if C.UnitFrames.HealComm then
		myBar:SetStatusBarTexture(HealthTexture)
		otherBar:SetStatusBarTexture(HealthTexture)
		absorbBar:SetStatusBarTexture(HealthTexture)
	end

	-- power
	Power:ClearAllPoints()
	Power:SetParent(Health)
	Power:SetFrameStrata("MEDIUM")
	Power:SetFrameLevel(3)
	Power:SetStatusBarTexture(PowerTexture)
	
	Power:CreateBackdrop()
	Power.Backdrop:SetOutside(Power)
	Power.Backdrop:CreateShadow()
	if C["General"]["ClassShadowExcludeUF"] then
		Power.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
	end

	-- power value
	Power.Value = Power:CreateFontString(nil, "OVERLAY")
	Power.Value:SetParent(Power)
	Power.Value:SetFontObject(PowerFont)
	Power.Value:SetScale(PowerFontSize)
	self:Tag(Power.Value, C["UF: Target"]["PowerTag"]["Value"])
	Power.PostUpdate = nil
	
	-- MP percentage
	local MPpercentage
	if C["UF: Target"]["PercentageTags"] == true then
		MPpercentage = Power:CreateFontString(nil, "OVERLAY")
		MPpercentage:SetAlpha(1)
		MPpercentage:SetFontObject(PowerFont)
		MPpercentage:SetScale(PowerFontSize)
		self:Tag(MPpercentage, "[perpp]%")
	end

	-- AltPower (boss)
	if T.Retail then
		AltPower:ClearAllPoints()
		AltPower:SetStatusBarTexture(PowerTexture)
		AltPower:SetParent(Health)
		AltPower:SetFrameStrata("MEDIUM")
		AltPower:SetFrameLevel(3)
		
		AltPower.Backdrop:CreateShadow()
		if C["General"]["ClassShadowExcludeUF"] then
			AltPower.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
		end
	end

	-- portrait
	if (C.UnitFrames.Portrait == true and C["UF: Target"]["PortraitStyle"]["Value"] == "Side") then
		Portrait:ClearAllPoints()
		Portrait:SetParent(Health)
		Portrait.Backdrop:SetOutside(Portrait)
		Portrait.Backdrop:CreateShadow()
		PortraitShadow:Kill()
	elseif (C.UnitFrames.Portrait == true and C["UF: Target"]["PortraitStyle"]["Value"] == "ClassIcon") then
		Portrait:ClearAllPoints()
		Portrait:SetParent(self)
		--Portrait.Backdrop:SetOutside(Portrait)
		--Portrait.Backdrop:CreateShadow()
		--PortraitShadow:Kill()
	end

	-- castbar
	if C["UF: Target"]["CastBar"] == true then
		CastBar.Spark:Kill()

		CastBar:ClearAllPoints()
		CastBar:SetAllPoints(Power)
		CastBar:SetFrameStrata("MEDIUM")
		CastBar:SetFrameLevel(4)
		CastBar:SetStatusBarTexture(CastBarTexture)
		CastBar.Background:SetTexture(0, 0, 0, 1)
		CastBar:CreateBackdrop()
		CastBar.Backdrop:SetOutside()

		if C["UF: Target"]["CastBarIcon"] == true then
			CastBar.Button:ClearAllPoints()
			CastBar.Button.Shadow:Kill()
			CastBar.Button.Backdrop:CreateShadow()
			CastBar.Button.Backdrop:SetOutside()
			if C["General"]["ClassShadowExcludeUF"] then
				CastBar.Button.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
			end
			CastBar.Icon:SetInside()
			CastBar.Icon:SetTexCoord(unpack(T.IconCoord))
		else
			CastBar.Button:Hide()
		end

		if C["UF: Target"]["CastBarTime"] == true then
			CastBar.Time:ClearAllPoints()
			CastBar.Time:SetFontObject(CastFont)
			CastBar.Time:SetScale(CastFontSize)
			CastBar.Time:SetJustifyH("RIGHT")
		else
			CastBar.Time:Hide()
		end
		
		if C["UF: Target"]["CastBarText"] == true then
			CastBar.Text:ClearAllPoints()
			CastBar.Text:SetFontObject(CastFont)
			CastBar.Text:SetScale(CastFontSize)
			CastBar.Text:SetJustifyH("LEFT")
		else
			CastBar.Text:Hide()
		end

		-- unlink from UF
		if C["UF: Target"]["CastBarUnlink"] == true then
			CastBar:ClearAllPoints()
			CastBar:SetOrientation("HORIZONTAL")
			CastBar:SetWidth(CastWidth)
			CastBar:SetHeight(CastHeight)

			CastBar.Backdrop:CreateShadow()
			if C["General"]["ClassShadowExcludeUF"] then
				CastBar.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
			end	
			
			Movers:RegisterFrame(CastBar, "Castbar Target")

			if C["UF: Target"]["CastBarIcon"] == true then
				CastBar.Button:SetWidth(CastHeight + 4 + C["UF: Target"]["CastFontSize"])
				CastBar.Button:SetHeight(CastHeight + 4 + C["UF: Target"]["CastFontSize"])
				CastBar.Button:SetPoint("TOPLEFT", Name, "BOTTOMLEFT", -4, -4)
				
				CastBar:SetWidth(CastWidth-(CastHeight + 8 + C["UF: Target"]["CastFontSize"]))
				CastBar:SetPoint("TOPLEFT", CastBar.Button, "TOPRIGHT", 4, 0)
			else
				CastBar:SetPoint("TOPLEFT", Power.Value, "TOPRIGHT", 4, 0)
			end

			if C["UF: Target"]["CastBarText"] == true then
				CastBar.Text:SetPoint("TOPLEFT", CastBar, "BOTTOMLEFT", 0, -4)
				CastBar.Text:SetWidth(CastWidth)
				CastBar.Text:SetHeight(C["UF: Target"]["CastFontSize"])
				CastBar.Text:SetJustifyH("LEFT")
			end

			if C["UF: Target"]["CastBarTime"] == true then
				CastBar.Time:SetPoint("RIGHT", CastBar, "RIGHT", -4, 0)
				CastBar.Time:SetHeight(C["UF: Target"]["CastFontSize"])
			end	
		end
	else
		CastBar:Kill()
	end

	-- Buffs
	if C["UnitFrames"]["TargetBuffs"] == true then
		
		-- Buffs  anchorframe
		Buffs:ClearAllPoints()
		Buffs:SetFrameStrata(self:GetFrameStrata())
		Buffs:SetParent(Health)
		
		-- Buffs icons
		Buffs.size = C["UF: Target"]["BuffSize"]
		Buffs.num = C["UF: Target"]["BuffNumber"]
		Buffs.numRow = C["UF: Target"]["BuffNumberRows"]
		Buffs.spacing = C["UF: Target"]["BuffSpacing"]
		Buffs.onlyShowPlayer = C["UF: Target"].OnlySelfBuffs
		Buffs.PostUpdate = UnitFrames.UpdateBuffsHeaderPosition
		Movers:RegisterFrame(Buffs, "Target Buffs")
		
		-- In Combat State
		if C["UF: Target"]["BuffsTargetCombatState"]["Value"] == "Show" then
			RegisterStateDriver(Buffs, "visibility", "[combat] show;hide")
		end	
		
		if C["UF: Target"]["BuffsTargetCombatState"]["Value"] == "Hide" then
			RegisterStateDriver(Buffs, "visibility", "[combat] hide;show")
		end	
	end

	-- Debuffs
	if C["UnitFrames"]["TargetDebuffs"] == true then
		
		-- Debuffs anchorframe
		Debuffs:ClearAllPoints()
		Debuffs:SetFrameStrata(self:GetFrameStrata())
		Debuffs:SetParent(Health)
		
		-- debuffs icons
		Debuffs.size = C["UF: Target"]["DebuffSize"]
		Debuffs.num = C["UF: Target"]["DebuffNumber"]
		Debuffs.numRow = C["UF: Target"]["DebuffNumberRows"]
		Debuffs.spacing = C["UF: Target"]["DebuffSpacing"]
		Debuffs.onlyShowPlayer = C["UF: Target"].OnlySelfDebuffs
		Movers:RegisterFrame(Debuffs, "Target Debuffs")
	end

	-- combat feedback text
	if (C.UnitFrames.CombatLog) then
		CombatFeedbackText = Health:CreateFontString(nil, "OVERLAY")
		CombatFeedbackText:SetFontObject(HealthFont)
		CombatFeedbackText:SetScale(HealthFontSize)
		if C["UF: Target"]["CombatLog"] == false then
			CombatFeedbackText:ClearAllPoints()
		end
		
		CombatFeedbackText.colors = {
			DAMAGE = {0.69, 0.31, 0.31},
			CRUSHING = {0.69, 0.31, 0.31},
			CRITICAL = {0.69, 0.31, 0.31},
			GLANCING = {0.69, 0.31, 0.31},
			STANDARD = {0.84, 0.75, 0.65},
			IMMUNE = {0.84, 0.75, 0.65},
			ABSORB = {0.84, 0.75, 0.65},
			BLOCK = {0.84, 0.75, 0.65},
			RESIST = {0.84, 0.75, 0.65},
			MISS = {0.84, 0.75, 0.65},
			HEAL = {0.33, 0.59, 0.33},
			CRITHEAL = {0.33, 0.59, 0.33},
			ENERGIZE = {0.31, 0.45, 0.63},
			CRITENERGIZE = {0.31, 0.45, 0.63},
		}
		self.CombatFeedbackText = CombatFeedbackText
	end

	-- raid icon
	if C["UF: Target"]["RaidIcon"] == true then
		RaidIcon:ClearAllPoints()
		RaidIcon:SetDrawLayer("OVERLAY", 7)
		RaidIcon:SetWidth(RaidIconSize)
		RaidIcon:SetHeight(RaidIconSize)
	else
		RaidIcon:ClearAllPoints()
	end

	-- role icon
	if T.Retail then
		if C["UF: Target"]["RoleIcon"] == true then
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
	
	-- filter
	if C["Skins"]["UnitFramesFilter"] == true then 
		if C["UF: Target"]["CastBar"] == true then
			if C["UF: Target"]["CastBarIcon"] == true then
				CastBar.Button:CreateMaxUIFilter()
			end
			if C["UF: Target"]["CastBarUnlink"] == true then
				CastBar:CreateMaxUIFilter()
			end	
		end

		if (C.UnitFrames.Portrait == true and C["UF: Target"]["PortraitStyle"]["Value"] == "Side") then
			Portrait.Backdrop:CreateMaxUIFilter()
			Portrait.Backdrop.Filter:SetDrawLayer("OVERLAY", 5)
		end
	end

------------------------------------------------------------------------------------------
-- MaxUI UF STYLE HORIZONTAL
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["HorVer"]["Value"] == "Horizontal" then
		-- health.value
		Health.Value:SetPoint("RIGHT", Health, "RIGHT", -2, 0)
		Health.Value:SetJustifyH("RIGHT")

		-- hp percentage
		if C["UF: Target"]["PercentageTags"] == true then
			HPpercentage:SetPoint("LEFT", Health, "RIGHT", 5, 0)
			HPpercentage:SetJustifyH("LEFT")
		end

		-- healcomm
		if C.UnitFrames.HealComm then
			myBar:SetWidth(HealthWidth)
			otherBar:SetWidth(HealthWidth)
			absorbBar:SetWidth(HealthWidth)
		end

		-- power
		Power:SetPoint("LEFT", Health, "BOTTOMLEFT", 10, 0)
		Power:SetHeight(PowerHeight)
		Power:SetWidth(PowerWidth)

		-- power.value
		Power.Value:SetPoint("RIGHT", Power, "RIGHT", -2, 0)
		Power.Value:SetJustifyH("RIGHT")

		-- mp percentage
		if C["UF: Target"]["PercentageTags"] == true then
			MPpercentage:SetPoint("LEFT", Power, "RIGHT", 4, 0)
			MPpercentage:SetJustifyH("LEFT")
		end

		-- alternative power
		if T.Retail then
			AltPower:SetPoint("LEFT", Health, "TOPLEFT", 10, 0)
			AltPower:SetHeight(PowerHeight-4)
			AltPower:SetWidth(PowerWidth)
		end

		-- portrait side
		if (C.UnitFrames.Portrait == true and C["UF: Target"]["PortraitStyle"]["Value"] == "Side") then
			Portrait:SetPoint("RIGHT", Health, "LEFT", -10, 0)
			Portrait:SetWidth(HealthHeight)
			Portrait:SetHeight(HealthHeight-2)
		elseif (C.UnitFrames.Portrait == true and C["UF: Target"]["PortraitStyle"]["Value"] == "ClassIcon") then
			Portrait:SetPoint("RIGHT", Health, "LEFT", -10, 0)
		end

		-- castbar
		if C["UF: Target"]["CastBar"] == true then
			if C["UF: Target"]["CastBarUnlink"] == false then

				if C["UF: Target"]["CastBarIcon"] == true then
					CastBar.Button:SetWidth(HealthHeight-2)
					CastBar.Button:SetHeight(HealthHeight-2)
					CastBar.Button:SetPoint("RIGHT", Health, "LEFT", -10, 0)
				end

				if C["UF: Target"]["CastBarTime"] == true then
					CastBar.Time:SetPoint("RIGHT", CastBar, "RIGHT", -4, 0)
					CastBar.Time:SetJustifyH("RIGHT")
				end

				if C["UF: Target"]["CastBarText"] == true then
					CastBar.Text:SetSize(HealthWidth, 10)
					CastBar.Text:SetJustifyH("LEFT")
					if C["UF: Target"]["DescriptionTag"]["Value"] ~= "" then
						CastBar.Text:SetPoint("TOPLEFT", Desc, "BOTTOMLEFT", 0, -4)
					else
						CastBar.Text:SetPoint("TOPLEFT", Name, "BOTTOMLEFT", 0, -4)
					end
				end
			else
				if C["UF: Target"]["CastBarIcon"] == true then

					if C["UF: Target"]["DescriptionTag"]["Value"] ~= "" then
						CastBar.Button:SetPoint("TOPLEFT", Desc, "BOTTOMLEFT", 0, -4)
					else
						CastBar.Button:SetPoint("TOPLEFT", Name, "BOTTOMLEFT", 0, -4)
					end
				else
					if C["UF: Target"]["DescriptionTag"]["Value"] ~= "" then
						CastBar:SetPoint("TOPLEFT", Desc, "BOTTOMLEFT", 0, -4)
					else
						CastBar:SetPoint("TOPLEFT", Name, "BOTTOMLEFT", 0, -4)
					end
				end	
			end	
		end

		-- debuffs
		if C["UnitFrames"]["TargetDebuffs"] == true then
			Debuffs:SetPoint("BOTTOMLEFT", self, "TOPLEFT", -2, 28)
			Debuffs:SetHeight(C["UF: Target"]["DebuffSize"]*C["UF: Target"]["DebuffNumberRows"])
			Debuffs:SetWidth(HealthWidth)
			
			Debuffs.initialAnchor = "BOTTOMLEFT"
			Debuffs["growth-y"] = "UP"
			Debuffs["growth-x"] = "RIGHT"
		end

		-- buffs
		if C["UnitFrames"]["TargetBuffs"] == true then
			if C["UnitFrames"]["TargetDebuffs"] == true then
				Buffs:SetPoint("BOTTOMLEFT", Debuffs, "TOPLEFT", 0, 16)
			else
				Buffs:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", -2, 42)
			end
			Buffs:SetHeight(C["UF: Target"]["BuffSize"]*C["UF: Target"]["BuffNumberRows"])
			Buffs:SetWidth(HealthWidth)
			
			Buffs.initialAnchor = "BOTTOMLEFT"
			Buffs["growth-y"] = "UP"
			Buffs["growth-x"] = "RIGHT"
		end

		-- combat feedback text
		if (C.UnitFrames.CombatLog) then
			CombatFeedbackText:SetPoint("BOTTOM", Health, "TOP", 0, 5)
		end
		
		-- raid icon
		if C["UF: Target"]["RaidIcon"] == true then
			RaidIcon:SetPoint("LEFT", Name, "RIGHT", 26, 0)
		end

		-- role icon
		if T.Retail then
			if C["UF: Target"]["RoleIcon"] == true then
				GroupRoleIndicator:SetPoint("LEFT", Name, "RIGHT", -0, 0)
			end
		end

		-- filter
		if C["Skins"]["UnitFramesFilter"] == true then 
			Health:CreateMaxUIFilter()
			Power:CreateMaxUIFilter()
			if T.Retail then
				AltPower:CreateMaxUIFilter()
			end
			if C["UF: Target"]["CastBar"] == true then
				if C["UF: Target"]["CastBarUnlink"] == false then
					CastBar:CreateMaxUIFilter()
				end	
			end
		end
	end

------------------------------------------------------------------------------------------
-- MaxUI UF STYLE VERTICAL
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
		-- health
		Health:SetOrientation("VERTICAL")

		-- healcomm
		if C.UnitFrames.HealComm then
			myBar:ClearAllPoints()
			myBar:SetOrientation("VERTICAL")
			myBar:SetWidth(HealthHeight-2)
			myBar:SetHeight(HealthWidth)
			myBar:SetPoint("BOTTOM", Health:GetStatusBarTexture(), "TOP", 0, 0)

			otherBar:ClearAllPoints()
			otherBar:SetOrientation("VERTICAL")
			otherBar:SetWidth(HealthHeight-2)
			otherBar:SetHeight(HealthWidth)
			otherBar:SetPoint("BOTTOM", myBar:GetStatusBarTexture(), "TOP", 0, 0)
			
			absorbBar:ClearAllPoints()
			absorbBar:SetOrientation("VERTICAL")
			absorbBar:SetWidth(HealthHeight-2)
			absorbBar:SetHeight(HealthWidth)
			absorbBar:SetPoint("BOTTOM", Health:GetStatusBarTexture(), "TOP", 0, 0)
		end

		-- health.value
		Health.Value:SetJustifyH("LEFT")
		if C["UF: Target"]["DescriptionTag"]["Value"] ~= "" then
			Health.Value:SetPoint("TOPLEFT", Desc, "BOTTOMLEFT", 0, -4)
		else
			Health.Value:SetPoint("TOPLEFT", Name, "BOTTOMLEFT", 0, -4)
		end

		-- hp percentage
		if C["UF: Target"]["PercentageTags"] == true then
			HPpercentage:SetJustifyH("CENTER")
			HPpercentage:SetPoint("BOTTOM", Health, "TOP", 2, 4)
		end

		-- power
		Power:SetPoint("BOTTOM", Health, "BOTTOMRIGHT", 0, 10)
		Power:SetHeight(PowerWidth)
		Power:SetWidth(PowerHeight)
		Power:SetOrientation("VERTICAL")

		-- power.value
		Power.Value:SetPoint("TOPLEFT", Health.Value, "BOTTOMLEFT", -0, -4)
		Power.Value:SetJustifyH("LEFT")

		-- mp percentage
		if C["UF: Target"]["PercentageTags"] == true then
			MPpercentage:SetPoint("BOTTOM", Power, "TOP", 0, 4)
			MPpercentage:SetJustifyH("CENTER")
		end

		-- alternative power
		if T.Retail then
			AltPower:SetPoint("BOTTOM", Health, "BOTTOMLEFT", 0, 10)
			AltPower:SetHeight(PowerWidth)
			AltPower:SetWidth(PowerHeight-4)
			AltPower:SetOrientation("VERTICAL")
		end

		-- portrait
		if (C.UnitFrames.Portrait == true and C["UF: Target"]["PortraitStyle"]["Value"] == "Side") then
			Portrait:SetPoint("TOP", Health, "BOTTOM", 0, -10)
			Portrait:SetWidth(HealthHeight-2)
			
			if C["UF: Target"]["DescriptionTag"]["Value"] ~= "" then
				Portrait:SetHeight(12 + C["UF: Target"]["NameFontSize"] + C["UF: Target"]["DescFontSize"] + C["UF: Target"]["HealthFontSize"] +C["UF: Target"]["PowerFontSize"])
				if C.UnitFrames.Portrait2D then
					Portrait:SetHeight(HealthHeight-2)
				end	
			else
				Portrait:SetHeight(8 + C["UF: Target"]["NameFontSize"] + C["UF: Target"]["HealthFontSize"] +C["UF: Target"]["PowerFontSize"])
				if C.UnitFrames.Portrait2D then
					Portrait:SetHeight(HealthHeight-2)
				end	
			end

			Name:ClearAllPoints()
			Name:SetPoint("TOPLEFT", Portrait, "TOPRIGHT", 4, 0)
		elseif (C.UnitFrames.Portrait == true and C["UF: Target"]["PortraitStyle"]["Value"] == "ClassIcon") then
			Portrait:SetPoint("TOP", Health, "BOTTOM", 0, -10)
		
			Name:ClearAllPoints()
			Name:SetPoint("TOPLEFT", Portrait, "TOPRIGHT", 4, 0)
		end

		-- castbar
		if C["UF: Target"]["CastBar"] == true then
			if C["UF: Target"]["CastBarIcon"] == true then
				if (C.UnitFrames.Portrait == true and C["UF: Target"]["PortraitStyle"]["Value"] == "Side") then
					CastBar.Button:SetPoint("TOPLEFT", Portrait, "BOTTOMLEFT", 0, -8)
				else
					CastBar.Button:SetPoint("TOPLEFT", Power.Value, "BOTTOMLEFT", 0, -8)
				end	
			end	

			if C["UF: Target"]["CastBarUnlink"] == false then
				CastBar:SetOrientation("VERTICAL")
				if C["UF: Target"]["CastBarIcon"] == true then
					CastBar.Button:SetWidth(HealthHeight)
					CastBar.Button:SetHeight(HealthHeight)

					if C["UF: Target"]["CastBarText"] == true then
						CastBar.Text:SetPoint("TOPLEFT", CastBar.Button, "TOPRIGHT", 4, 0)
					end
					if C["UF: Target"]["CastBarTime"] == true then
						CastBar.Time:SetPoint("TOPLEFT", CastBar.Text, "BOTTOMLEFT", 0, -4)
					end	
				else
					if C["UF: Target"]["CastBarText"] == true then
						CastBar.Text:SetPoint("TOPLEFT", Power.Value or Health.value or Playername, "BOTTOMLEFT", 0, -4)
					end
					if C["UF: Target"]["CastBarTime"] == true then
						CastBar.Time:SetPoint("TOPLEFT", CastBar.Text, "BOTTOMLEFT", 0, -4)
					end
				end	
			end	
		end

		-- buffs
		if C["UnitFrames"]["TargetBuffs"] == true then
			Buffs:SetHeight(HealthWidth)
			Buffs:SetWidth(C["UF: Target"]["BuffSize"]*C["UF: Target"]["BuffNumberRows"])
			Buffs:SetPoint("BOTTOMLEFT", Health, "BOTTOMRIGHT", 20, 0)
			
			Buffs.initialAnchor = "BOTTOMLEFT"
			Buffs["growth-y"] = "RIGHT"
			Buffs["growth-x"] = "UP"
		end

		-- debuffs
		if C["UnitFrames"]["TargetDebuffs"] == true then
			Debuffs.initialAnchor = "BOTTOMRIGHT"
			Debuffs["growth-x"] = "LEFT"
			Debuffs["growth-y"] = "UP"
			
			Debuffs:SetHeight(HealthWidth)
			Debuffs:SetWidth(C["UF: Target"]["DebuffSize"]*C["UF: Target"]["DebuffNumberRows"])
			Debuffs:SetPoint("BOTTOMRIGHT", Health, "BOTTOMLEFT", -20, 0)
		end

		-- combat feedback text
		if (C.UnitFrames.CombatLog) then
			CombatFeedbackText:SetPoint("BOTTOM", Health, "TOP", 0, 18)
		end

		-- raid icon
		if C["UF: Target"]["RaidIcon"] == true then
			RaidIcon:SetPoint("BOTTOM", Power, "TOP", 0, 16)
		end

		-- role icon
		if T.Retail then
			if C["UF: Target"]["RoleIcon"] == true then
				if (C.UnitFrames.Portrait == true and C["UF: Target"]["PortraitStyle"]["Value"] == "Side") then
					GroupRoleIndicator:SetPoint("RIGHT", Portrait, "LEFT", -4, 0)
				else
					GroupRoleIndicator:SetPoint("TOP", Health, "BOTTOM", 0, -4)
				end	
			end	
		end

		-- filter
		if C["Skins"]["UnitFramesFilter"] == true then 
			Health:CreateMaxUIVerticalFilter()
			Power:CreateMaxUIVerticalFilter()
			if T.Retail then
				AltPower:CreateMaxUIVerticalFilter()
			end	
			if C["UF: Target"]["CastBar"] == true then
				if C["UF: Target"]["CastBarUnlink"] == false then
					CastBar:CreateMaxUIVerticalFilter()
				end	
			end
		end
	end	
end