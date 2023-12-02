------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-10-2022
------------------------------------------------------------------------------------------

-- setting up PLAYER FRAMES.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T.UnitFrames
local Movers = T["Movers"]
local basePlayer = UnitFrames.Player

------------------------------------------------------------------------------------------
-- PLAYER FRAME SETUP
------------------------------------------------------------------------------------------
local function CreateUnits()
	local Player = UnitFrames.Units.Player

	if not C["UnitFrames"]["Enable"] == true then return end

	if C["UF: Player"]["Enable"] ~= true then
		Player:Kill()
	end	
	
------------------------------------------------------------------------------------------
-- PLAYER FRAME SIZE
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		Player:SetHeight(C["UF: Player"]["HealthHeight"])
		Player:SetWidth(C["UF: Player"]["HealthWidth"])
		Player.Backdrop:SetBackdrop(nil)
			
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
			Player:SetHeight(C["UF: Player"]["HealthWidth"])
			Player:SetWidth(C["UF: Player"]["HealthHeight"])
		end	
	end
	
------------------------------------------------------------------------------------------
-- PLAYER FRAME POSITION
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		if (C.UnitFrames.Portrait == true and C["UF: Player"]["PortraitStyle"]["Value"] == "Side") then				
			Player:ClearAllPoints()
			Player:SetPoint("RIGHT", MaxUIUnitframesAnchor, "LEFT", -(C["UF: Player"]["HealthHeight"] + 6), 0)
		else
			Player:ClearAllPoints()
			Player:SetPoint("RIGHT", MaxUIUnitframesAnchor, "LEFT", 0, 0)
		end
		
		-- Vertical UnitFrames
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" and C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
			Player:ClearAllPoints()
			Player:SetPoint("BOTTOM", MaxUIUnitframesAnchor, "TOPLEFT", 0, 0)
		end
	end	
end	
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- PLAYER FRAME GENERAL (MAXUI AND TUKUI)
------------------------------------------------------------------------------------------
function UnitFrames:Player()
	basePlayer(self)
	
	-- wow
	local Class = select(2, UnitClass("player"))

	-- elements
	local Panel = self.Panel
	local Health = self.Health
	local myBar = self.HealthPrediction.myBar
	local otherBar = self.HealthPrediction.otherBar
	local absorbBar = self.HealthPrediction.absorbBar
	local Power = self.Power
	local PowerPrediction = self.PowerPrediction.mainBar
	local AdditionalPower = self.AdditionalPower
	local CastBar = self.Castbar
	local Portrait
	local PortraitBackdrop
	local PortraitShadow
	if C.UnitFrames.Portrait == true then	
		Portrait = self.Portrait
		PortraitBackdrop = self.Portrait.Backdrop
		PortraitShadow = self.Portrait.Shadow
	end	
	local Buffs = self.Buffs
	local Debuffs
	local AuraBars = self.AuraBars
	local CombatFeedbackText
	local Combat = self.CombatIndicator 
	local Status = self.Status
	local Leader = self.LeaderIndicator
	local MasterLooter = self.MasterLooterIndicator 
	local RaidIcon = self.RaidTargetIndicator
	local RestingIndicator = self.RestingIndicator
	local GroupRoleIndicator
	
	-- settings
	local HealthHeight = C["UF: Player"]["HealthHeight"]
	local HealthWidth = C["UF: Player"]["HealthWidth"]
	local PowerHeight = C["UF: Player"]["PowerHeight"]
	local PowerWidth = C["UF: Player"]["PowerWidth"]
	local CastHeight = C["UF: Player"]["CastHeight"]
	local CastWidth = C["UF: Player"]["CastWidth"]
	local AuraBarsHeight = C["UF: Player"]["AuraBarsHeight"]
	local AuraBarsWidth = C["UF: Player"]["AuraBarsWidth"]
	local AuraBarsSpacing = C["UF: Player"]["AuraBarsSpacing"]
	local RoleIconSize = C["UF: Player"]["RoleIconSize"]
	local RaidIconSize = C["UF: Player"]["RaidIconSize"]
	local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
	
	-- font
	local NameFont = T.GetFont(C["UF: Player"]["NameFont"])
	local HealthFont = T.GetFont(C["UF: Player"]["HealthFont"])
	local PowerFont = T.GetFont(C["UF: Player"]["PowerFont"])
	local CastFont = T.GetFont(C["UF: Player"]["CastFont"])
	local NameFontSize = C["UF: Player"]["NameFontSize"]/10
	local DescFontSize = C["UF: Player"]["DescFontSize"]/10
	local HealthFontSize = C["UF: Player"]["HealthFontSize"]/10
	local PowerFontSize = C["UF: Player"]["PowerFontSize"]/10
	local CastFontSize = C["UF: Player"]["CastFontSize"]/10
	
	-- textures
	local HealthTexture = T.GetTexture(C["UF: Player"]["HealthTexture"])
	local PowerTexture = T.GetTexture(C["UF: Player"]["PowerTexture"])
	local CastBarTexture = T.GetTexture(C["UF: Player"]["CastTexture"])

------------------------------------------------------------------------------------------
-- PORTRAIT STYLE
------------------------------------------------------------------------------------------
	if (C.UnitFrames.Portrait == true and C["UF: Player"]["PortraitStyle"]["Value"] == "None") then
		Portrait:Kill()
		PortraitBackdrop:Kill()
		PortraitShadow:Kill()
		
	elseif (C.UnitFrames.Portrait == true and C["UF: Player"]["PortraitStyle"]["Value"] == "Overlay") then
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
		Portrait:SetAlpha(C["UF: Player"]["PortraitOverlayAlpha"])
	
	elseif (C.UnitFrames.Portrait == true and C["UF: Player"]["PortraitStyle"]["Value"] == "ClassIcon") then
		Portrait:Kill()
		PortraitBackdrop:Kill()
		PortraitShadow:Kill()

		Portrait = Health:CreateTexture(nil, "OVERLAY")
		Portrait:SetWidth(HealthHeight)
		Portrait:SetHeight(HealthHeight)

		if select(2, UnitClass('player')) == "DRUID" then
			Portrait:SetTexture(T.GetTexture("vectorDR"))
		end
		
		if select(2, UnitClass('player')) == "EVOKER" then
			Portrait:SetTexture(T.GetTexture("vectorEV"))
		end

		if select(2, UnitClass('player')) == "MONK" then
			Portrait:SetTexture(T.GetTexture("vectorMO"))
		end
		
		if select(2, UnitClass('player')) == "ROGUE" then
			Portrait:SetTexture(T.GetTexture("vectorRO"))
		end
		
		if select(2, UnitClass('player')) == "MAGE" then
			Portrait:SetTexture(T.GetTexture("vectorMA"))
		end
		
		if select(2, UnitClass('player')) == "PRIEST" then
			Portrait:SetTexture(T.GetTexture("vectorPR"))
		end
		
		if select(2, UnitClass('player')) == "WARLOCK" then
			Portrait:SetTexture(T.GetTexture("vectorWL"))
		end
		
		if select(2, UnitClass('player')) == "SHAMAN" then
			Portrait:SetTexture(T.GetTexture("vectorSH"))
		end
		
		if select(2, UnitClass('player')) == "HUNTER" then
			Portrait:SetTexture(T.GetTexture("vectorHU"))
		end
		
		if select(2, UnitClass('player')) == "DEATHKNIGHT" then
			Portrait:SetTexture(T.GetTexture("vectorDK"))
		end
		
		if select(2, UnitClass('player')) == "WARRIOR" then
			Portrait:SetTexture(T.GetTexture("vectorWA"))
		end

		if select(2, UnitClass('player')) == "PALADIN" then
			Portrait:SetTexture(T.GetTexture("vectorPA"))
		end

		if select(2, UnitClass('player')) == "DEMONHUNTER" then
			Portrait:SetTexture(T.GetTexture("vectorDH"))
		end
	end
------------------------------------------------------------------------------------------
-- RESTING ICON
------------------------------------------------------------------------------------------
	if C["UF: Player"]["RestedIcon"] == true then
		RestingIndicator:ClearAllPoints()
		RestingIndicator:Show()
		
		if C.UnitFrames.Portrait == true and C["UF: Player"]["PortraitStyle"]["Value"] == "Side" then
			RestingIndicator:SetPoint("BOTTOM", Portrait, "TOP", 0, 0)
		elseif C.UnitFrames.Portrait == true and C["UF: Player"]["PortraitStyle"]["Value"] == "Overlay" then
			RestingIndicator:SetPoint("BOTTOM", Health, "TOP", 0, 4)
		else
			RestingIndicator:SetPoint("BOTTOM", Health, "TOP", 0, 4)
		end
	else
		RestingIndicator:Kill()
	end
	
------------------------------------------------------------------------------------------
-- COLOR THEME
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Colorstyle"]["Value"] == "Dark" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = false
		Health.colorReaction = false
	elseif C["UnitFrames"]["Colorstyle"]["Value"] == "Gradient" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = false
		Health.colorReaction = false
		Health.colorSmooth = true
	elseif C["UnitFrames"]["Colorstyle"]["Value"] == "Class" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = true
		Health.colorReaction = true
	elseif C["UnitFrames"]["Colorstyle"]["Value"] == "Custom" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = false
		Health.colorReaction = false
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
	if C["UF: Player"]["NonCombatAlphaEnable"] == true then 
		self:HookScript("OnUpdate", function(self)
			local currenthealth = UnitHealth("player")
			local maxhealth = UnitHealthMax("player")
			if InCombatLockdown() then
				self:SetAlpha(1)
				Health.Background:SetAlpha(1)
			elseif MouseIsOver(self) then
				self:SetAlpha(1)
				Health.Background:SetAlpha(1)
			elseif C["UF: Player"]["OnlyFullHP"] and (currenthealth < maxhealth) then
				self:SetAlpha(1)
				Health.Background:SetAlpha(1)
			else
				self:SetAlpha(C["UF: Player"]["NonCombatAlpha"])
				Health.Background:SetAlpha(C["UF: Player"]["NonCombatAlpha"])
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
-- Trackbars
------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------
-- MaxUI UF STYLE BASIC 
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] ~= "MaxUI" then return end
		
	-- panel
	Panel:Hide()
	Panel:SetFrameStrata(self:GetFrameStrata())
	Panel:SetFrameLevel(self:GetFrameLevel()+1)

	-- name
	local Playername = self:CreateFontString(nil, "OVERLAY")
	Playername:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", 0, -10)
	Playername:SetAlpha(1)
	Playername:SetJustifyH("RIGHT")
	Playername:SetFontObject(NameFont)
	Playername:SetScale(NameFontSize)
	self:Tag(Playername, C["UF: Player"]["NameTag"]["Value"]) 

	local PlayerDesc = self:CreateFontString(nil, "OVERLAY")
	PlayerDesc:SetPoint("TOPRIGHT", Playername, "BOTTOMRIGHT", 0, -4)
	PlayerDesc:SetAlpha(1)
	PlayerDesc:SetJustifyH("RIGHT")
	PlayerDesc:SetFontObject(NameFont)
	PlayerDesc:SetScale(DescFontSize)
	PlayerDesc:SetTextColor(0.84, 0.75, 0.65)
	self:Tag(PlayerDesc, C["UF: Player"]["DescriptionTag"]["Value"]) 

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
	self:Tag(Health.Value, C["UnitFrames"]["PlayerHealthTag"]["Value"])

	-- hp percentage
	local HPpercentage
	if C["UF: Player"]["PercentageTags"] == true then
		HPpercentage = Health:CreateFontString(nil, "OVERLAY")
		HPpercentage:SetAlpha(1)
		HPpercentage:SetFontObject(HealthFont)
		HPpercentage:SetScale(HealthFontSize)
		self:Tag(HPpercentage, "[perhp]%")
	end

	-- Healcomm
	if C.UnitFrames.HealComm then
		myBar:SetStatusBarTexture(HealthTexture)
		otherBar:SetStatusBarTexture(HealthTexture)
		absorbBar:SetStatusBarTexture(HealthTexture)
	end

	-- power
	Power:ClearAllPoints()
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
	Power.Value:ClearAllPoints()
	Power.Value:SetParent(Power)
	Power.Value:SetFontObject(PowerFont)
	Power.Value:SetScale(PowerFontSize)
	self:Tag(Power.Value, C["UF: Player"]["PowerTag"]["Value"])
	Power.PostUpdate = nil

	-- mp percentage
	local MPpercentage
	if C["UF: Player"]["PercentageTags"] == true then
		MPpercentage = Power:CreateFontString(nil, "OVERLAY")
		MPpercentage:SetAlpha(1)
		MPpercentage:SetFontObject(PowerFont)
		MPpercentage:SetScale(PowerFontSize)
		self:Tag(MPpercentage, "[perpp]%")
	end

	-- additional power
	if T.Retail then
		AdditionalPower:ClearAllPoints()
		AdditionalPower:SetStatusBarTexture(PowerTexture)
		AdditionalPower:SetParent(Health)
		AdditionalPower:SetFrameStrata("MEDIUM")
		AdditionalPower:SetFrameLevel(3)

		AdditionalPower.Backdrop:CreateShadow()
		if C["General"]["ClassShadowExcludeUF"] then
			AdditionalPower.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
		end

		AdditionalPower:SetAlpha(0)
		if (Class == "SHAMAN" and C["ClassOptions"]["ShamanAdditionalPower"] == true) then
			AdditionalPower:SetAlpha(1)
		end

		if (Class == "DRUID" and C["ClassOptions"]["DruidAdditionalPower"] == true) then
			AdditionalPower:SetAlpha(1)
		end

		if (Class == "PRIEST" and C["ClassOptions"]["PriestAdditionalPower"] == true) then
			AdditionalPower:SetAlpha(1)
		end
	end

	-- portrait
	if (C.UnitFrames.Portrait == true and C["UF: Player"]["PortraitStyle"]["Value"] == "Side") then
		Portrait:ClearAllPoints()
		Portrait:SetParent(self)
		Portrait.Backdrop:SetOutside(Portrait)
		Portrait.Backdrop:CreateShadow()
		PortraitShadow:Kill()
	elseif (C.UnitFrames.Portrait == true and C["UF: Player"]["PortraitStyle"]["Value"] == "ClassIcon") then
		Portrait:ClearAllPoints()
		Portrait:SetParent(self)
		--Portrait.Backdrop:SetOutside(Portrait)
		--Portrait.Backdrop:CreateShadow()
		--PortraitShadow:Kill()
	end

	-- castbar
	if C["UF: Player"]["CastBar"] == true then
		CastBar.Spark:Kill()

		CastBar:ClearAllPoints()
		CastBar:SetAllPoints(Power)
		CastBar:SetFrameStrata("MEDIUM")
		CastBar:SetFrameLevel(4)
		CastBar:SetStatusBarTexture(CastBarTexture)
		CastBar.Background:SetTexture(0, 0, 0, 1)
		CastBar:CreateBackdrop()
		CastBar.Backdrop:SetOutside()

		if C["UF: Player"]["CastBarIcon"] == true then
			CastBar.Button:ClearAllPoints()
			CastBar.Button.Shadow:Kill()
			CastBar.Button.Backdrop:CreateShadow()
			CastBar.Button.Backdrop:SetOutside()
			if C["General"]["ClassShadowExcludeUF"] then
				CastBar.Button.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
			end
			CastBar.Icon:SetInside()
			CastBar.Icon:SetTexCoord(unpack(T.IconCoord))
		else	
			CastBar.Button:Hide()
		end

		if C["UF: Player"]["CastBarTime"] == true then
			CastBar.Time:ClearAllPoints()
			CastBar.Time:SetFontObject(CastFont)
			CastBar.Time:SetScale(CastFontSize)
			CastBar.Time:SetJustifyH("RIGHT")
		else	
			CastBar.Time:Hide()
		end

		if C["UF: Player"]["CastBarText"] == true then
			CastBar.Text:ClearAllPoints()
			CastBar.Text:SetFontObject(CastFont)
			CastBar.Text:SetScale(CastFontSize)
			CastBar.Text:SetJustifyH("RIGHT")
		else	
			CastBar.Text:Hide()
		end

		-- unlink from UF
		if C["UF: Player"]["CastBarUnlink"] == true then
			CastBar:ClearAllPoints()
			CastBar:SetOrientation("HORIZONTAL")
			CastBar:SetParent(UIParent)
			CastBar:SetAlpha(1)
			CastBar:SetWidth(CastWidth)
			CastBar:SetHeight(CastHeight)
			
			CastBar.Backdrop:CreateShadow()
			if C["General"]["ClassShadowExcludeUF"] then
				CastBar.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
			end	

			Movers:RegisterFrame(CastBar, "Castbar Player")
		
			if C["UF: Player"]["CastBarIcon"] == true then
				CastBar.Button:SetWidth(CastHeight + 4 + C["UF: Player"]["CastFontSize"])
				CastBar.Button:SetHeight(CastHeight + 4 + C["UF: Player"]["CastFontSize"])
			
				CastBar:SetWidth(CastWidth-(CastHeight + 8 + C["UF: Player"]["CastFontSize"]))
				CastBar:SetPoint("TOPRIGHT", CastBar.Button, "TOPLEFT", -4, 0)
			else
				CastBar:SetPoint("TOPRIGHT", Power.Value, "TOPLEFT", -4, 0)
			end
			
			if C["UF: Player"]["CastBarText"] == true then
				CastBar.Text:SetPoint("TOPRIGHT", CastBar, "BOTTOMRIGHT", 0, -4)
				CastBar.Text:SetWidth(CastWidth)
				CastBar.Text:SetHeight(C["UF: Player"]["CastFontSize"])
				CastBar.Text:SetJustifyH("RIGHT")
			end

			if C["UF: Player"]["CastBarTime"] == true then
				CastBar.Time:SetPoint("RIGHT", CastBar, "RIGHT", -4, 0)
				CastBar.Time:SetHeight(C["UF: Player"]["CastFontSize"])
			end	
		end

		-- çompletely centered standalone player actionbar
		if C["UF: Player"]["StandAloneCastBar"] == true then
			CastBar:ClearAllPoints()
			CastBar:SetOrientation("HORIZONTAL")
			CastBar:SetParent(UIParent)
			CastBar:SetAlpha(1)
			CastBar:SetWidth(CastWidth)
			CastBar:SetHeight(CastHeight+4)
			CastBar:SetPoint("TOP", UIParent, "CENTER", 0, -100) 

			CastBar:CreateBackdrop()
			CastBar.Backdrop:SetOutside()
			CastBar.Backdrop:CreateShadow()
			if C["General"]["ClassShadowExcludeUF"] then
				CastBar.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
			end	

			Movers:RegisterFrame(CastBar, "StandAlone Player Castbar")

			if C["UF: Player"]["CastBarIcon"] == true then
				CastBar.Button:SetPoint("RIGHT", CastBar, "LEFT", -8, 0)
				CastBar.Button:SetWidth(CastHeight+4)
				CastBar.Button:SetHeight(CastHeight+4)
			end

			if C["UF: Player"]["CastBarText"] == true then
				CastBar.Text:ClearAllPoints()
				CastBar.Text:SetPoint("LEFT", CastBar, "LEFT", 4, C["UF: Player"]["StandAloneCastBarTextOffsetV"])
				CastBar.Text:SetWidth(CastWidth*0.57)
				CastBar.Text:SetHeight(C["UF: Player"]["CastFontSize"])
				CastBar.Text:SetJustifyH("LEFT")
			end

			if C["UF: Player"]["CastBarTime"] == true then
				CastBar.Time:ClearAllPoints()
				CastBar.Time:SetPoint("RIGHT", CastBar, "RIGHT", -4, C["UF: Player"]["StandAloneCastBarTimeOffsetV"])
				CastBar.Time:SetHeight(C["UF: Player"]["CastFontSize"])
			end	
		end
	else
		CastBar:Kill()
	end	

	-- Aurabars
	if C.UnitFrames.PlayerAuraBars then
		AuraBars:ClearAllPoints()
		AuraBars:SetHeight(AuraBarsHeight)
		AuraBars:SetWidth(AuraBarsWidth+AuraBarsHeight+AuraBars.gap)
		
		--AuraBars.auraBarTexture = HealthTexture
		--AuraBars.PostCreateBar = UnitFrames.PostCreateAuraBar
		AuraBars.width = AuraBarsWidth
		AuraBars.height = AuraBarsHeight
		AuraBars.gap = 4
		AuraBars.spacing = AuraBarsSpacing
		AuraBars.spellNameObject = CastFont
		AuraBars.spellTimeObject = CastFont
		
		if C["UF: Player"]["AuraBarsGrowDirection"].Value == "UP" then
			AuraBars.initialAnchor = AuraBars.initialAnchor or 'BOTTOMLEFT'
			AuraBars.growth = AuraBars.growth or 'UP'
		else
			AuraBars.initialAnchor = AuraBars.initialAnchor or 'TOPLEFT'
			AuraBars.growth = AuraBars.growth or 'DOWN'
		end

		Debuffs = CreateFrame("Frame", self:GetName().."Debuffs", self)
		self.Debuffs = Debuffs
	end

	-- buffs
	if C["UnitFrames"]["PlayerBuffs"] == true and C.UnitFrames.PlayerAuraBars == false then
		Buffs:ClearAllPoints()
		Buffs:SetFrameStrata(self:GetFrameStrata())
		Buffs:SetParent(Health)

		-- Buffs icons
		Buffs.size = C["UF: Player"]["BuffSize"]
		Buffs.num = C["UF: Player"]["BuffNumber"]
		Buffs.numRow = C["UF: Player"]["BuffNumberRows"]
		Buffs.spacing = C["UF: Player"]["BuffSpacing"]
		--Buffs.PostCreateIcon = UnitFrames.PostCreateAura
		--Buffs.PostUpdateIcon = UnitFrames.PostUpdateAura
		Buffs.PostUpdate = UnitFrames.UpdateBuffsHeaderPosition
		Buffs.onlyShowPlayer = C["UF: Player"]["OnlySelfBuffs"]
		Movers:RegisterFrame(Buffs, "Player Buffs")

		-- In Combat State
		if C["UF: Player"]["BuffsPlayerCombatState"]["Value"] == "Show" then
			RegisterStateDriver(Buffs, "visibility", "[combat] show;hide")
		end	

		if C["UF: Player"]["BuffsPlayerCombatState"]["Value"] == "Hide" then
			RegisterStateDriver(Buffs, "visibility", "[combat] hide;show")
		end	
	end

	-- debuffs
	if C["UnitFrames"]["PlayerDebuffs"] == true then
		Debuffs = self.Debuffs

		-- Debuffs anchorframe
		Debuffs:ClearAllPoints()
		Debuffs:SetFrameStrata(self:GetFrameStrata())
		Debuffs:SetParent(Health)

		-- Debuffs icons
		Debuffs.size = C["UF: Player"]["DebuffSize"]
		Debuffs.num = C["UF: Player"]["DebuffNumber"]
		Debuffs.numRow = C["UF: Player"]["DebuffNumberRows"]
		Debuffs.spacing = C["UF: Player"]["DebuffSpacing"]
		Debuffs.PostCreateIcon = UnitFrames.PostCreateAura
		Debuffs.PostUpdateIcon = UnitFrames.PostUpdateAura
		Debuffs.onlyShowPlayer = false
		Movers:RegisterFrame(Debuffs, "Player Debuffs")
	end

	-- combat feedback text
	if (C.UnitFrames.CombatLog) then
		CombatFeedbackText = Health:CreateFontString(nil, "OVERLAY")
		CombatFeedbackText:SetFontObject(HealthFont)
		CombatFeedbackText:SetScale(HealthFontSize)
		
		if C["UF: Player"]["CombatLog"] == false then
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

	-- raidicon
	if C["UF: Player"]["RaidIcon"] then
		RaidIcon:ClearAllPoints()
		RaidIcon:SetWidth(RaidIconSize)
		RaidIcon:SetHeight(RaidIconSize)
	else
		RaidIcon:Kill()
	end

	-- roleicon
	if T.Retail then
		if C["UF: Player"]["RoleIcon"] == true then
			GroupRoleIndicator = self:CreateTexture(nil, "OVERLAY")
			GroupRoleIndicator:SetWidth(RoleIconSize)
			GroupRoleIndicator:SetHeight(RoleIconSize)
			if C["UnitFrames"]["Roles"]["Value"] == "MaxUI Style" or C["UnitFrames"]["Roles"]["Value"] == "Elvui Style" then
				GroupRoleIndicator.Override = UnitFrames.SetGridGroupRole
			end
			self.GroupRoleIndicator = GroupRoleIndicator
		end
	end

	-- combat indicator
	if C["UF: Player"]["CombatIcon"] then
		Combat:ClearAllPoints()
		Combat:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cCallToArms.tga]])
		Combat:SetSize(C["UF: Player"]["CombatIconSize"], C["UF: Player"]["CombatIconSize"]-1)
		Combat:SetVertexColor(unpack(C["UF: Player"]["CombatIconColor"]))
	else
		Combat:Kill()
	end

	-- leader
	if C["UF: Player"]["LeaderIcon"] then
		Leader:SetSize(C["UF: Player"]["LeaderIconSize"], C["UF: Player"]["LeaderIconSize"])
		Leader:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Role\MaxLeader.tga]])
	else
		Leader:Kill()
	end
	
	-- master looter
	if C["UF: Player"]["MasterLooterIcon"] then
		MasterLooter:SetSize(C["UF: Player"]["MasterLooterIconSize"], C["UF: Player"]["MasterLooterIconSize"])
	else
		MasterLooter:Kill()
	end
	
	-- status pvp
	if C["UF: Player"]["PVPIcon"] then
		Status:ClearAllPoints()
		Status:SetSize(C["UF: Player"]["PVPIconSize"], C["UF: Player"]["PVPIconSize"])
		Status:SetPoint("LEFT", Health, "RIGHT", 2, 0)
		Status:Show()
	else
		Status:Kill()
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
		if C["UF: Player"]["CastBar"] == true then
			if C["UF: Player"]["CastBarUnlink"] == true then
				CastBar:CreateMaxUIFilter()
			end	
			if C["UF: Player"]["StandAloneCastBar"] == true then
				CastBar:CreateMaxUIFilter()
			end	
			if C["UF: Player"]["CastBarIcon"] == true then
				CastBar.Button:CreateMaxUIFilter()
			end
		end

		if (C.UnitFrames.Portrait == true and C["UF: Player"]["PortraitStyle"]["Value"] == "Side") then
			Portrait.Backdrop:CreateMaxUIFilter()
			Portrait.Backdrop.Filter:SetDrawLayer("OVERLAY", 5)
		end
	end

------------------------------------------------------------------------------------------
-- MaxUI UF STYLE HORIZONTAL
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["HorVer"]["Value"] == "Horizontal" then
		-- health value
		Health.Value:SetPoint("LEFT", Health, "LEFT", 2, 0)
		Health.Value:SetJustifyH("LEFT")

		-- hp percentage	
		if C["UF: Player"]["PercentageTags"] == true then
			HPpercentage:SetPoint("RIGHT", Health, "LEFT", -3, 0)
			HPpercentage:SetJustifyH("RIGHT")
		end

		-- healcomm
		if C.UnitFrames.HealComm then
			myBar:SetWidth(HealthWidth)
			otherBar:SetWidth(HealthWidth)
			absorbBar:SetWidth(HealthWidth)
		end

		-- power
		Power:SetPoint("RIGHT", Health, "BOTTOMRIGHT", -10, 0)
		Power:SetHeight(PowerHeight)
		Power:SetWidth(PowerWidth)

		-- power value
		Power.Value:SetPoint("RIGHT", Power, "RIGHT", -2, 0)
		Power.Value:SetJustifyH("RIGHT")

		-- mp percentage
		if C["UF: Player"]["PercentageTags"] == true then
			MPpercentage:SetPoint("RIGHT", Power, "LEFT", -2, 0)
			MPpercentage:SetJustifyH("RIGHT")
		end

		-- additional power
		if T.Retail then
			AdditionalPower:SetPoint("RIGHT", Health, "TOPRIGHT", -10, 0)
			AdditionalPower:SetHeight(PowerHeight-4)
			AdditionalPower:SetWidth(PowerWidth)
		end

		-- portrait
		if (C.UnitFrames.Portrait == true and C["UF: Player"]["PortraitStyle"]["Value"] == "Side") then
			Portrait:SetPoint("LEFT", Health, "RIGHT", 10, 0)
			Portrait:SetWidth(HealthHeight)
			Portrait:SetHeight(HealthHeight-2)
		elseif (C.UnitFrames.Portrait == true and C["UF: Player"]["PortraitStyle"]["Value"] == "ClassIcon") then
			Portrait:SetPoint("LEFT", Health, "RIGHT", 10, 0)
		end

		-- castbar
		if (C["UF: Player"]["CastBar"] == true and C["UF: Player"]["StandAloneCastBar"] == false) then
			if C["UF: Player"]["CastBarUnlink"] == false then

				if C["UF: Player"]["CastBarIcon"] == true then
					CastBar.Button:SetWidth(HealthHeight-2)
					CastBar.Button:SetHeight(HealthHeight-2)
					CastBar.Button:SetPoint("LEFT", Health, "RIGHT", 10, 0)
				end

				if C["UF: Player"]["CastBarTime"] == true then
					CastBar.Time:SetPoint("RIGHT", CastBar, "RIGHT", -4, 0)
					CastBar.Time:SetJustifyH("RIGHT")
				end

				if C["UF: Player"]["CastBarText"] == true then
					CastBar.Text:SetSize(HealthWidth, 10)
					CastBar.Text:SetJustifyH("RIGHT")
					if C["UF: Player"]["DescriptionTag"]["Value"] ~= "" then
						CastBar.Text:SetPoint("TOPRIGHT", PlayerDesc, "BOTTOMRIGHT", 0, -4)
					else
						CastBar.Text:SetPoint("TOPRIGHT", Playername, "BOTTOMRIGHT", 0, -4)
					end
				end
			else
				if C["UF: Player"]["CastBarIcon"] == true then

					if C["UF: Player"]["DescriptionTag"]["Value"] ~= "" then
						CastBar.Button:SetPoint("TOPRIGHT", PlayerDesc, "BOTTOMRIGHT", 0, -4)
					else
						CastBar.Button:SetPoint("TOPRIGHT", Playername, "BOTTOMRIGHT", 0, -4)
					end
				else
					if C["UF: Player"]["DescriptionTag"]["Value"] ~= "" then
						CastBar:SetPoint("TOPRIGHT", PlayerDesc, "BOTTOMRIGHT", 0, -4)
					else
						CastBar:SetPoint("TOPRIGHT", Playername, "BOTTOMRIGHT", 0, -4)
					end
				end	
			end	
		end

		-- aurabars
		if C.UnitFrames.PlayerAuraBars then
			AuraBars:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", 0, 40)
		end		

		-- debuffs
		if C["UnitFrames"]["PlayerDebuffs"] == true then
			Debuffs:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", 2, 28)
			Debuffs:SetHeight(C["UF: Player"]["DebuffSize"]*C["UF: Player"]["DebuffNumberRows"])
			Debuffs:SetWidth(HealthWidth)

			Debuffs.initialAnchor = "BOTTOMLEFT"
			Debuffs["growth-y"] = "UP"
			Debuffs["growth-x"] = "RIGHT"
		end

		-- buffs
		if C["UnitFrames"]["PlayerBuffs"] == true and C.UnitFrames.PlayerAuraBars == false then
			if C["UnitFrames"]["PlayerDebuffs"] == true then
				Buffs:SetPoint("BOTTOMRIGHT", Debuffs, "TOPRIGHT", 0, 16)
			else
				Buffs:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", 2, 42)
			end
			Buffs:SetHeight(C["UF: Player"]["BuffSize"]*C["UF: Player"]["BuffNumberRows"])
			Buffs:SetWidth(HealthWidth)
			
			Buffs.initialAnchor = "BOTTOMRIGHT"
			Buffs["growth-y"] = "UP"
			Buffs["growth-x"] = "LEFT"
		end

		-- combatfeedback text
		if (C.UnitFrames.CombatLog) then
			CombatFeedbackText:SetPoint("BOTTOM", Health, "TOP", 0, 5)
		end

		-- raid icon
		if C["UF: Player"]["RaidIcon"] then
			RaidIcon:SetPoint("RIGHT", Playername, "LEFT", -26, 0)
		end

		-- group role indicator
		if T.Retail then
			if C["UF: Player"]["RoleIcon"] == true then
				GroupRoleIndicator:SetPoint("RIGHT", Playername, "LEFT", -2, 0)
			end
		end

		-- combat icon
		if C["UF: Player"]["CombatIcon"] then
			Combat:SetPoint("RIGHT", Health, "RIGHT", -4, 0)
		end

		-- filter
		if C["Skins"]["UnitFramesFilter"] == true then 
			Health:CreateMaxUIFilter()
			Power:CreateMaxUIFilter()
			if T.Retail then
				AdditionalPower:CreateMaxUIFilter()
			end
			if C["UF: Player"]["CastBar"] == true and C["UF: Player"]["StandAloneCastBar"] == false then
				if C["UF: Player"]["CastBarUnlink"] == false then
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

		-- health value
		Health.Value:SetJustifyH("RIGHT")
		if C["UF: Player"]["DescriptionTag"]["Value"] ~= "" then
			Health.Value:SetPoint("TOPRIGHT", PlayerDesc, "BOTTOMRIGHT", 0, -4)
		else
			Health.Value:SetPoint("TOPRIGHT", Playername, "BOTTOMRIGHT", 0, -4)
		end

		-- hp percentage
		if C["UF: Player"]["PercentageTags"] == true then
			HPpercentage:SetJustifyH("CENTER")
			HPpercentage:SetPoint("BOTTOM", Health, "TOP", 2, 4)
		end

		-- power
		Power:SetPoint("BOTTOM", Health, "BOTTOMLEFT", 0, 10)
		Power:SetHeight(PowerWidth)
		Power:SetWidth(PowerHeight)
		Power:SetOrientation("VERTICAL")

		-- power prediction
		PowerPrediction:ClearAllPoints()
		PowerPrediction:SetOrientation("VERTICAL")
		PowerPrediction:SetWidth(PowerHeight)
		PowerPrediction:SetPoint("BOTTOM")
		PowerPrediction:SetPoint("TOP")
		PowerPrediction:SetPoint("TOP", Power:GetStatusBarTexture(), "TOP")
		
		-- power value
		Power.Value:SetPoint("TOPRIGHT", Health.Value, "BOTTOMRIGHT", -0, -4)
		Power.Value:SetJustifyH("RIGHT")

		-- mp percentage
		if C["UF: Player"]["PercentageTags"] == true then
			MPpercentage:SetPoint("BOTTOM", Power, "TOP", 0, 4)
			MPpercentage:SetJustifyH("CENTER")
		end

		-- additional power
		if T.Retail then
			AdditionalPower:SetPoint("BOTTOM", Health, "BOTTOMRIGHT", 0, 10)
			AdditionalPower:SetHeight(PowerWidth)
			AdditionalPower:SetWidth(PowerHeight-4)
			AdditionalPower:SetOrientation("VERTICAL")
		end

		-- portrait
		if (C.UnitFrames.Portrait == true and C["UF: Player"]["PortraitStyle"]["Value"] == "Side") then
			Portrait:SetPoint("TOP", Health, "BOTTOM", 0, -10)
			Portrait:SetWidth(HealthHeight-2)
			
			if C["UF: Player"]["DescriptionTag"]["Value"] ~= "" then
				Portrait:SetHeight(12 + C["UF: Player"]["NameFontSize"] + C["UF: Player"]["DescFontSize"] + C["UF: Player"]["HealthFontSize"] +C["UF: Player"]["PowerFontSize"])
				if C.UnitFrames.Portrait2D then
					Portrait:SetHeight(HealthHeight-2)
				end	
			else
				Portrait:SetHeight(8 + C["UF: Player"]["NameFontSize"] + C["UF: Player"]["HealthFontSize"] +C["UF: Player"]["PowerFontSize"])
				if C.UnitFrames.Portrait2D then
					Portrait:SetHeight(HealthHeight-2)
				end	
			end

			Playername:ClearAllPoints()
			Playername:SetPoint("TOPRIGHT", Portrait, "TOPLEFT", -4, 0)
		
		elseif (C.UnitFrames.Portrait == true and C["UF: Player"]["PortraitStyle"]["Value"] == "ClassIcon") then
			Portrait:SetPoint("TOP", Health, "BOTTOM", 0, -10)

			Playername:ClearAllPoints()
			Playername:SetPoint("TOPRIGHT", Portrait, "TOPLEFT", -4, 0)		
		end

		-- Castbar
		if (C["UF: Player"]["CastBar"] == true and C["UF: Player"]["StandAloneCastBar"] == false) then
			if C["UF: Player"]["CastBarIcon"] == true then
				if (C.UnitFrames.Portrait == true and C["UF: Player"]["PortraitStyle"]["Value"] == "Side") then
					CastBar.Button:SetPoint("TOPRIGHT", Portrait, "BOTTOMRIGHT", 0, -8)
				else
					CastBar.Button:SetPoint("TOPRIGHT", Power.Value, "BOTTOMRIGHT", 0, -8)
				end	
			end	

			if C["UF: Player"]["CastBarUnlink"] == false then
				CastBar:SetOrientation("VERTICAL")
				if C["UF: Player"]["CastBarIcon"] == true then
					CastBar.Button:SetWidth(HealthHeight)
					CastBar.Button:SetHeight(HealthHeight)

					CastBar.Text:SetPoint("TOPRIGHT", CastBar.Button, "TOPLEFT", -4, 0)
					CastBar.Time:SetPoint("TOPRIGHT", CastBar.Text, "BOTTOMRIGHT", 0, -4)
				else
					CastBar.Text:SetPoint("TOPRIGHT", Power.Value or Health.value or Playername, "BOTTOMRIGHT", 0, -4)
					CastBar.Time:SetPoint("TOPRIGHT", CastBar.Text, "BOTTOMRIGHT", 0, -4)
				end	
			end	
		end	

		-- Aurabars
		if C.UnitFrames.PlayerAuraBars then
			AuraBars:SetPoint("BOTTOMRIGHT", self, "BOTTOMLEFT", -32, 0)
		end

		-- debuffs
		if C["UnitFrames"]["PlayerDebuffs"] == true then
			Debuffs:SetHeight(HealthWidth)
			Debuffs:SetWidth(C["UF: Player"]["DebuffSize"]*C["UF: Player"]["DebuffNumberRows"])
			Debuffs:SetPoint("BOTTOMLEFT", self, "BOTTOMRIGHT", 20, 0)
			
			Debuffs.initialAnchor = "BOTTOMRIGHT"
			Debuffs["growth-y"] = "RIGHT"
			Debuffs["growth-x"] = "UP"
		end

		-- buffs
		if C["UnitFrames"]["PlayerBuffs"] == true and C.UnitFrames.PlayerAuraBars == false then
			Buffs:SetHeight(HealthWidth)
			Buffs:SetWidth(C["UF: Player"]["BuffSize"]*C["UF: Player"]["BuffNumberRows"])
			Buffs:SetPoint("BOTTOMRIGHT", self, "BOTTOMLEFT", -20, 0)
			
			Buffs.initialAnchor = "BOTTOMRIGHT"
			Buffs["growth-y"] = "LEFT"
			Buffs["growth-x"] = "UP"
		end

		-- combat feedback text
		if (C.UnitFrames.CombatLog) then
			CombatFeedbackText:SetPoint("BOTTOM", Health, "TOP", 0, 18)
		end

		-- resting indicator
		if C["UF: Player"]["RestedIcon"] == true then
			RestingIndicator:ClearAllPoints()
			RestingIndicator:SetPoint("BOTTOM", Health, "TOP", 0, 20)
		end

		-- raid marker
		if C["UF: Player"]["RaidIcon"] then
			RaidIcon:SetPoint("BOTTOM", Power, "TOP", 0, 16)
		end

		-- roleicon
		if T.Retail then
			if C["UF: Player"]["RoleIcon"] == true then
				if (C.UnitFrames.Portrait == true and C["UF: Player"]["PortraitStyle"]["Value"] == "Side") then
					GroupRoleIndicator:SetPoint("LEFT", Portrait, "RIGHT", 4, 0)
				else
					GroupRoleIndicator:SetPoint("TOP", Health, "BOTTOM", 0, -4)
				end	
			end	
		end

		-- combat indicator
		if C["UF: Player"]["CombatIcon"] then
			Combat:SetPoint("TOP", Health, "TOP", 0, -10)
		end
		
		-- filter
		if C["Skins"]["UnitFramesFilter"] == true then 
			Health:CreateMaxUIVerticalFilter()
			Power:CreateMaxUIVerticalFilter()
			if T.Retail then
				AdditionalPower:CreateMaxUIVerticalFilter()
			end
			if C["UF: Player"]["CastBar"] == true then
				if C["UF: Player"]["CastBarUnlink"] == false then
					CastBar:CreateMaxUIVerticalFilter()
				end	
			end
		end
	end
end