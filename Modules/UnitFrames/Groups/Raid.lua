------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

--setting up RAID UNIT FRAMES.

-- to do: set leader, masterlooter, resurrection icons

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T.UnitFrames
local Class = select(2, UnitClass("player"))
local baseCreateUnits = UnitFrames.CreateUnits
local baseRaid = UnitFrames.Raid

------------------------------------------------------------------------------------------
-- RAID FRAME SETUP POSITION AND BASIC SIZE
------------------------------------------------------------------------------------------
local function CreateUnits()	
	local Raid = UnitFrames.Headers.Raid
	local Raid40 = UnitFrames.Headers.Raid40
	local MaxUIUnitframesAnchor	= UnitFrames.MaxUIUnitframesAnchor

	if not C["UnitFrames"]["Enable"] == true then return end
	if not C.Raid.Enable then return end
	if InCombatLockdown() then return end -- taint problem for anchoring?

	Raid:ClearAllPoints()
	Raid:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 20, -100)
	Raid40:ClearAllPoints()
	Raid40:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 20, -100)
	
	if C["Raid"]["Style"]["Value"] == "MaxUI" then
		if C["General"]["Themes"]["Value"] == "MaxUI" then
			if C["Layout"]["LayoutRole"]["Value"] == "Healer" then
				if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
					Raid:ClearAllPoints()
					Raid:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 80)
					Raid40:ClearAllPoints()
					Raid40:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 80)
				elseif C["Layout"]["LayoutAB"]["Value"] == "Single" then 
					Raid:ClearAllPoints()
					Raid:SetPoint("TOP", MaxUIUnitframesAnchor, "BOTTOM", 0, -32)
					Raid40:ClearAllPoints()
					Raid40:SetPoint("TOP", MaxUIUnitframesAnchor, "BOTTOM", 0, -32)
				elseif C["Layout"]["LayoutAB"]["Value"] == "Double" then
					Raid:ClearAllPoints()
					Raid:SetPoint("TOP", MaxUIUnitframesAnchor, "BOTTOM", 0, -32)
					Raid40:ClearAllPoints()
					Raid40:SetPoint("TOP", MaxUIUnitframesAnchor, "BOTTOM", 0, -32)
				end	
			end	
		else -- other themes
			if C["Layout"]["LayoutRole"]["Value"] == "Healer" then
				if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
					Raid:ClearAllPoints()
					Raid:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 40)
					Raid40:ClearAllPoints()
					Raid40:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 40)
				elseif C["Layout"]["LayoutAB"]["Value"] == "Single" or C["Layout"]["LayoutAB"]["Value"] == "Double" then
					Raid:ClearAllPoints()
					Raid:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 244)
					Raid40:ClearAllPoints()
					Raid40:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 244)
				end	
			end
		end
	else -- other raid styles
		if C["General"]["Themes"]["Value"] == "MaxUI" then
			if C["Layout"]["LayoutRole"]["Value"] == "Healer" then
				if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
					Raid:ClearAllPoints()
					Raid:SetPoint("BOTTOM",  UIParent, "BOTTOM", 0, 80)
					Raid40:ClearAllPoints()
					Raid40:SetPoint("BOTTOM",  UIParent, "BOTTOM", 0, 80)
				elseif C["Layout"]["LayoutAB"]["Value"] == "Single" then
					Raid:ClearAllPoints()
					Raid:SetPoint("TOP", MaxUIUnitframesAnchor, "BOTTOM", 0, -32)
					Raid40:ClearAllPoints()
					Raid40:SetPoint("TOP", MaxUIUnitframesAnchor, "BOTTOM", 0, -32)
				elseif C["Layout"]["LayoutAB"]["Value"] == "Double" then
					Raid:ClearAllPoints()
					Raid:SetPoint("TOP", MaxUIUnitframesAnchor, "BOTTOM", 0, -56)
					Raid40:ClearAllPoints()
					Raid40:SetPoint("TOP", MaxUIUnitframesAnchor, "BOTTOM", 0, -56)
				end	
			end	
		else -- other themes
			if C["Layout"]["LayoutRole"]["Value"] == "Healer" then
				if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
					Raid:ClearAllPoints()
					Raid:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 40)
					Raid40:ClearAllPoints()
					Raid40:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 40)
				elseif C["Layout"]["LayoutAB"]["Value"] == "Single" or C["Layout"]["LayoutAB"]["Value"] == "Double" then
					Raid:ClearAllPoints()
					Raid:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 244)
					Raid40:ClearAllPoints()
					Raid40:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 244)
				end	
			end
		end
	end
end	
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- RAID FRAMES - GENERAL
------------------------------------------------------------------------------------------
function UnitFrames:Raid()
	baseRaid(self)
	
	-- wow
	local IsInGroup = IsInGroup
	local UnitIsUnit = UnitIsUnit

	-- elements
	local Panel = self.Panel
	local Health = self.Health
	local Power = self.Power
	local Name = self.Name
	local ReadyCheck = self.ReadyCheckIndicator
	local RaidIcon = self.RaidTargetIndicator
	local ResurrectIcon = self.ResurrectIndicator
	local Atonement = self.Atonement
	local myBar = self.HealthPrediction.myBar
	local otherBar = self.HealthPrediction.otherBar
	local absorbBar = self.HealthPrediction.absorbBar
	local Buffs = self.Buffs
	local RaidDebuffs = self.RaidDebuffs
	local AuraTrack = self.AuraTrack
	local Highlight = self.Highlight

	-- settings
	local RoleIconSize = C["Raid"]["RoleIconSize"]

	-- font
	local RaidFont = T.GetFont(C["Raid"].Font)
	local HealthPercentageFont = T.GetFont(C["Raid"]["HealthPercentageFont"])

	-- textures

	-- MaxUI
	
------------------------------------------------------------------------------------------
-- RAID FRAME - GROUP ROLE INDICATOR
------------------------------------------------------------------------------------------
	if T.Retail then
		local GroupRoleIndicator = Health:CreateTexture(nil, "OVERLAY")
		GroupRoleIndicator:SetDrawLayer("OVERLAY", 5)

		RaidIcon:ClearAllPoints()
		
		if C["UnitFrames"]["Roles"]["Value"] == "MaxUI Style" or 
		C["UnitFrames"]["Roles"]["Value"] == "Elvui Style" or 
		C["UnitFrames"]["Roles"]["Value"] == "Blizzard Style" then
			
			-- name, remove the coloring by role
			--self:Tag(Name, "[Tukui:GetNameColor][Tukui:NameShort]")
			
			-- actual icon
			GroupRoleIndicator:SetWidth(RoleIconSize)
			GroupRoleIndicator:SetHeight(RoleIconSize)
			GroupRoleIndicator:SetPoint("RIGHT", Health, "TOP", -8, -1)
			self.GroupRoleIndicator = GroupRoleIndicator

			if C["UnitFrames"]["Roles"]["Value"] == "MaxUI Style" or C["UnitFrames"]["Roles"]["Value"] == "Elvui Style" then
				GroupRoleIndicator.Override = UnitFrames.SetGridGroupRole
			end
		end	
	end
------------------------------------------------------------------------------------------
-- RAID FRAME - GROUP NUMBER
------------------------------------------------------------------------------------------
	local GroupBG
	local Grouptext
	local unit = self.unit

	local function ToggleGroupNumber(IsInGroup)
		if IsInGroup then
			if C["Raid"]["GroupNumber"] == true then
				GroupBG:Show()
				Grouptext:Show()
				if UnitIsUnit(unit, "raidpet") then
					Health.GroupBG:Hide()
				end
			end
		else
			GroupBG:Hide()
			Grouptext:Hide()
		end
	end

	Health.GroupBG = Health:CreateTexture(nil, "OVERLAY")
	Health.GroupBG:SetDrawLayer("OVERLAY", 5)
	Health.GroupBG:SetHeight(16)
	Health.GroupBG:SetWidth(16)
	Health.GroupBG:SetPoint("LEFT", Health, "TOPLEFT", 0, 0)
	Health.GroupBG:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Custom\OrbBlack.tga]])
	Health.GroupBG:SetVertexColor(0.1, 0.1, 0.1, .6)
	Health.GroupBG:Hide()
	GroupBG = Health.GroupBG
	
	Grouptext = Health:CreateFontString(nil, "OVERLAY")
	Grouptext:SetPoint("CENTER", Health.GroupBG, "CENTER", 1, 0)
	Grouptext:SetFontObject(HealthPercentageFont)
	Grouptext:SetJustifyH("RIGHT")
	self:Tag(Grouptext, "[group]")
	Grouptext:Hide()

	ToggleGroupNumber(IsInGroup()) --Set or unset Group

	--Update
	local EventHandler = CreateFrame("Frame")
	EventHandler:RegisterEvent("PLAYER_ENTERING_WORLD")
	EventHandler:RegisterEvent("PLAYER_REGEN_ENABLED")
	EventHandler:RegisterEvent("RAID_ROSTER_UPDATE")
	EventHandler:SetScript("OnEvent", function()
		ToggleGroupNumber(IsInGroup())
	end)

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
	Health.PostUpdateHealth = UnitFrames.PostUpdateHealth
	
------------------------------------------------------------------------------------------
-- HEALCOMM
------------------------------------------------------------------------------------------
	if C.UnitFrames.HealComm then
		myBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
		otherBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
		absorbBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
	end

------------------------------------------------------------------------------------------
-- SHADOW
------------------------------------------------------------------------------------------
	if C["General"]["ClassShadowExcludeUF"] then
		self.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
	end

------------------------------------------------------------------------------------------
-- RAID FRAME - MAXUI THEME
------------------------------------------------------------------------------------------
	if C["Raid"]["Style"]["Value"] ~= "MaxUI" then return end
	
	--self.Backdrop:SetBackdrop(nil)
	self.Shadow:Hide()
	self.Backdrop:SetAlpha(C["Raid"]["BGAlpha"])	

	Panel:Hide()

	-- Name	
	Name:ClearAllPoints()
	Name:SetParent(Health)
	Name:SetFontObject(RaidFont)
	Name:SetScale(C["Raid"]["FontSize"]/10)
	
	if C["Raid"]["PowerVertical"] then
		Name:SetPoint("BOTTOM", Health, "BOTTOM", 0, 2)
	else
		Name:SetPoint("BOTTOM", self, "BOTTOM", 0, 0)
	end

	if self:GetWidth() <= 87 then
		self:Tag(Name, "[MaxUI:GetNameColor][Tukui:NameShort]")
	elseif self:GetWidth() >= 88 then
		self:Tag(Name, "[MaxUI:GetNameColor][Tukui:NameMedium]")
	elseif self:GetWidth() >= 121 then
		self:Tag(Name, "[MaxUI:GetNameColor][Tukui:NameLong]")
	end

	-- health
	Health:ClearAllPoints()
	Health:CreateBackdrop()
	Health.Backdrop:SetBackdropColor(0, 0, 0, 0)
	Health.Backdrop:SetOutside(Health)
	Health.Backdrop:CreateShadow()

	if C["Raid"]["ShowMissingHealth"] == true then 
		Health.Value:ClearAllPoints()
		Health.Value:SetPoint("TOP", Health, "TOP", 0, -3)
		Health.Value:SetScale(C["Raid"]["HealthFontSize"]/10)
	else
		Health.Value:Hide()
	end
	
	if C["Raid"]["ShowPercentageHealth"] == true then 
		local HPpercentage = Health:CreateFontString(nil, "OVERLAY")
		HPpercentage:SetPoint("RIGHT", Health, "TOPRIGHT", 1, 0)
		HPpercentage:SetAlpha(1)
		HPpercentage:SetJustifyH("RIGHT")
		HPpercentage:SetFontObject(HealthPercentageFont)
		HPpercentage:SetScale(C["Raid"]["PercentageFontSize"]/10)
		self:Tag(HPpercentage, "[perhp]%")
		self.HPpercentage = HPpercentage
	end
	
	if C["Raid"]["PowerVertical"] then
		Health:SetPoint("TOPLEFT", self, "TOPLEFT", 9, 0)
		Health:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, 0)
	else
		Health:SetPoint("TOPLEFT", self, "TOPLEFT", 0, 0)
		Health:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, 14)
	end
	
	if C.UnitFrames.HealComm then
		if "custom [@raid26,exists]" then
			myBar:SetWidth(C["Raid"]["Raid40WidthSize"])
			myBar:SetHeight(C["Raid"]["Raid40HeightSize"])

			otherBar:SetWidth((C["Raid"]["Raid40WidthSize"]))
			otherBar:SetHeight(C["Raid"]["Raid40HeightSize"])

			absorbBar:SetWidth((C["Raid"]["Raid40WidthSize"]))
			absorbBar:SetHeight(C["Raid"]["Raid40HeightSize"])
		else
			myBar:SetWidth(C["Raid"]["WidthSize"])
			myBar:SetHeight(C["Raid"]["HeightSize"])

			otherBar:SetWidth((C["Raid"]["WidthSize"]))
			otherBar:SetHeight(C["Raid"]["HeightSize"])

			absorbBar:SetWidth((C["Raid"]["WidthSize"]))
			absorbBar:SetHeight(C["Raid"]["HeightSize"])
		end
	end

	-- power
	Power:ClearAllPoints()
	Power:SetFrameLevel(8)
	Power:SetFrameStrata("MEDIUM")
	Power:CreateBackdrop()
	Power.Backdrop:SetOutside(Power)

	if C["Raid"]["PowerVertical"] then
		Power:SetPoint("LEFT", self, "LEFT", 0, 0)
		Power:SetHeight(self:GetHeight())
		Power:SetWidth(6)
		Power:SetOrientation("VERTICAL")
	else
		Power:SetPoint("CENTER", Health, "BOTTOM", 0, 0)
		Power:SetHeight(6)
		Power:SetWidth(self:GetWidth()*0.6)
		Power.Backdrop:CreateShadow()
		if C["General"]["ClassShadowExcludeUF"] then
			Power.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
		end
	end

	-- buffs
	if C.Raid.RaidBuffsStyle.Value == "Aura Track" then
		AuraTrack.Texture = C["Textures"]["UFRaidHealthTexture"]
		AuraTrack:ClearAllPoints()
		if C.Raid.AuraTrackIcons then 
			AuraTrack:SetInside(Health, 0, 14, 8, -0)
		else
			AuraTrack:SetInside(Health, 2, 2, -2, -2)
		end
		
	elseif C.Raid.RaidBuffsStyle.Value == "Standard" then

		-- adjustments
		Buffs.disableCooldown = false
		Buffs.size = 16
		Buffs.num = C.Raid.WidthSize / Buffs.size
		Buffs.numRow = 1
		Buffs.spacing = 0
		Buffs:SetHeight(Buffs.size)
		Buffs:SetWidth(C.Raid.WidthSize)

		-- positioning
		if C["Raid"]["BuffsPosition"]["Value"] == "Bottom" then 
			Buffs:ClearAllPoints()
			Buffs:SetPoint("TOPLEFT", Health, "BOTTOMLEFT", 0, -3)
		elseif C["Raid"]["BuffsPosition"]["Value"] == "Top" then 
			Buffs:ClearAllPoints()
			Buffs:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", -1, 1)
		elseif C["Raid"]["BuffsPosition"]["Value"] == "InsideBottom" then 
			Buffs:ClearAllPoints()
			Buffs:SetPoint("BOTTOMLEFT", Health, "BOTTOMLEFT", 0, 0)
		end
	end

	-- debuffs
	if C.Raid.DebuffWatch then
		RaidDebuffs:SetHeight(C["Raid"]["Raid40HeightSize"]-8)
		RaidDebuffs:SetWidth(C["Raid"]["Raid40HeightSize"]-8)
		RaidDebuffs:SetFrameStrata("MEDIUM")
		RaidDebuffs:SetFrameLevel(Power:GetFrameLevel() + 10)
		RaidDebuffs.time:SetDrawLayer("OVERLAY")
		if C["Raid"]["DeBuffsOnRight"] == true then 
			RaidDebuffs:ClearAllPoints()
			RaidDebuffs:SetPoint("LEFT", Health, "RIGHT", 3, 0)
		end
	end
	
	-- Ready check V	
	ReadyCheck:ClearAllPoints()
	ReadyCheck:SetHeight(24)
	ReadyCheck:SetWidth(24)
	ReadyCheck:SetPoint("CENTER", Health, 0, 0)
	ReadyCheck:SetDrawLayer("OVERLAY", 5)	

	-- raidicon
	RaidIcon:ClearAllPoints()
	RaidIcon:SetPoint("LEFT", Health, "TOP", 0, 0)
	RaidIcon:SetWidth(C["Raid"]["MarkerSize"])
	RaidIcon:SetHeight(C["Raid"]["MarkerSize"])
	RaidIcon:SetDrawLayer("OVERLAY", 5)	
	
	-- resurrect Icon
	--ResurrectIcon:SetSize(24)
	--ResurrectIcon:SetPoint("TOP")

	-- Position and size
	local SummonIndicator = Health:CreateTexture(nil, 'OVERLAY')
	SummonIndicator:SetSize(32, 32)
	SummonIndicator:SetPoint('LEFT', Health)
	SummonIndicator:SetDrawLayer("OVERLAY", 5)	
	self.SummonIndicator = SummonIndicator

	-- Leader
	local LeaderIndicator = Health:CreateTexture(nil, 'OVERLAY')
	LeaderIndicator:SetSize(12, 12)
	LeaderIndicator:SetPoint("RIGHT", Power, 'LEFT', -4, 1)
	LeaderIndicator:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Role\MaxLeader.tga]])
	LeaderIndicator:SetDrawLayer("OVERLAY", 5)	
	self.LeaderIndicator = LeaderIndicator

	-- Assistant
	local AssistantIndicator = Health:CreateTexture(nil, 'OVERLAY')
	AssistantIndicator:SetSize(12, 12)
	AssistantIndicator:SetPoint("RIGHT", Power, 'LEFT', -4, 1)
	AssistantIndicator:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Role\MaxLeaderWhite.tga]])
	AssistantIndicator:SetVertexColor(0.5, 0.5, 1)
	AssistantIndicator:SetDrawLayer("OVERLAY", 5)	
	self.AssistantIndicator = AssistantIndicator

	Highlight:SetOutside(Health, C.Raid.HighlightSize, C.Raid.HighlightSize)

	-- Highlight
	self:HookScript("OnEnter", function(self)
		Health.Backdrop:SetBorderColor(Health:GetStatusBarColor())
		Power.Backdrop:SetBorderColor(Power:GetStatusBarColor())
	end)

	self:HookScript("OnLeave", function(self)
		Health.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
		Power.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
	end)

	-- filter
	if C["Skins"]["GroupRaidFilter"] == true then 
		Health:CreateMaxUIFilter()
		Power:CreateMaxUIFilter()
	end

	-- LEFT ALIGNMENT
	if C["Raid"]["ElementAnchored"]["Value"] == "LEFT" then
		Name:ClearAllPoints()
		Name:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 4, 0)
		Name:SetJustifyH("LEFT")
		
		Power:ClearAllPoints()
		Power:SetPoint("LEFT", Health, "BOTTOMLEFT", 4, 0)

		LeaderIndicator:ClearAllPoints()
		LeaderIndicator:SetPoint("LEFT", Power, 'RIGHT', 4, 1)

		AssistantIndicator:ClearAllPoints()
		AssistantIndicator:SetPoint("LEFT", Power, 'RIGHT', 4, 1)

	-- RIGHT ALIGNMENT
	elseif C["Raid"]["ElementAnchored"]["Value"] == "RIGHT" then
		Name:ClearAllPoints()
		Name:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -4, 0)
		Name:SetJustifyH("RIGHT")
		
		Power:ClearAllPoints()
		Power:SetPoint("RIGHT", Health, "BOTTOMRIGHT", -4, 0)

		LeaderIndicator:ClearAllPoints()
		LeaderIndicator:SetPoint("RIGHT", Power, 'LEFT', -4, 1)

		AssistantIndicator:ClearAllPoints()
		AssistantIndicator:SetPoint("RIGHT", Power, 'LEFT', -4, 1)
	end

------------------------------------------------------------------------------------------
-- RAID FRAME - MAXUI THEME VERTICAL
------------------------------------------------------------------------------------------
	if C["Raid"]["Orientation"]["Value"] == "Vertical" then
		
		self.Backdrop:SetAlpha(C["Raid"]["BGAlpha"])
		
		-- force setting
		C["Raid"]["VerticalHealth"] = true
		
		-- name
		Name:ClearAllPoints()
		
		-- health
		Health:ClearAllPoints()
		Health:SetSize(12, self:GetHeight())

		if C["Raid"]["ShowPercentageHealth"] == true then 
			local HPpercentage = self.HPpercentage
			HPpercentage:ClearAllPoints()
		end

		-- power
		Power:ClearAllPoints()
		Power:SetHeight(self:GetHeight()-10)
		Power:SetWidth(4)
		Power:SetOrientation("VERTICAL")

		-- role indicator
		if T.Retail then
			local GroupRoleIndicator = self.GroupRoleIndicator
			GroupRoleIndicator:ClearAllPoints()
		end

		-- group number
		Health.GroupBG:ClearAllPoints()
	
		-- buffs
		if C.Raid.RaidBuffsStyle.Value == "Aura Track" then
			AuraTrack.Texture = C["Textures"]["UFRaidHealthTexture"]
			AuraTrack:ClearAllPoints()
			if C.Raid.AuraTrackIcons then 
				AuraTrack:SetInside(self, 0, 14, 8, -0)
			else
				AuraTrack:SetInside(self, 2, 2, -2, -2)
			end
			
		elseif C.Raid.RaidBuffsStyle.Value == "Standard" then

			-- adjustments
			Buffs.disableCooldown = false
			Buffs.size = 16
			Buffs.num = C.Raid.WidthSize / Buffs.size
			Buffs.numRow = 1
			Buffs.spacing = 0
			Buffs:SetHeight(Buffs.size)
			Buffs:SetWidth(C.Raid.WidthSize)

			-- positioning
			if C["Raid"]["BuffsPosition"]["Value"] == "Bottom" then 
				Buffs:ClearAllPoints()
				Buffs:SetPoint("TOPLEFT", Health, "BOTTOMLEFT", 0, -3)
			elseif C["Raid"]["BuffsPosition"]["Value"] == "Top" then 
				Buffs:ClearAllPoints()
				Buffs:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", -1, 1)
			elseif C["Raid"]["BuffsPosition"]["Value"] == "InsideBottom" then 
				Buffs:ClearAllPoints()
				Buffs:SetPoint("BOTTOMLEFT", Health, "BOTTOMLEFT", 0, 0)
			end
		end
		
		-- debuffs
		RaidDebuffs:ClearAllPoints()
		RaidDebuffs:SetPoint("CENTER", self, "CENTER", 0, 0)

		-- readycheck
		ReadyCheck:ClearAllPoints()
		ReadyCheck:SetPoint("CENTER", self, 0, 0)

		-- raidicon
		RaidIcon:ClearAllPoints()

		-- leader
		LeaderIndicator:ClearAllPoints()

		-- assistant
		AssistantIndicator:ClearAllPoints()

		-- LEFT ORIENTATION
		if C["Raid"]["ElementAnchored"]["Value"] == "LEFT" then
			Name:SetPoint("TOPLEFT", Health, "TOPRIGHT", 4, 0)
			Name:SetJustifyH("LEFT")

			Health:SetPoint("LEFT", self, "LEFT", 5, 0)

			if C["Raid"]["ShowPercentageHealth"] == true then 
				local HPpercentage = self.HPpercentage
				HPpercentage:SetPoint("TOPLEFT", Name, "BOTTOMLEFT", 0, -4)
				HPpercentage:SetJustifyH("LEFT")
			end

			Power:SetPoint("BOTTOM", Health, "BOTTOMLEFT", 0, 2)

			if T.Retail then
				local GroupRoleIndicator = self.GroupRoleIndicator
				GroupRoleIndicator:SetPoint("BOTTOMLEFT", Health, "BOTTOMRIGHT", 18, 0)
			end

			Health.GroupBG:SetPoint("BOTTOMLEFT", Health, "BOTTOMRIGHT", 4, 0)

			RaidIcon:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -18, 0)

			LeaderIndicator:SetPoint("BOTTOMRIGHT", self, 'BOTTOMRIGHT', -2, 16)

			AssistantIndicator:SetPoint("BOTTOMRIGHT", self, 'BOTTOMRIGHT', -2, 16)
		
		-- RIGHT ORIENTATION
		elseif C["Raid"]["ElementAnchored"]["Value"] == "RIGHT" then
			Name:SetPoint("TOPRIGHT", Health, "TOPLEFT", -4, 0)
			Name:SetJustifyH("RIGHT")

			Health:SetPoint("RIGHT", self, "RIGHT", -5, 0)

			if C["Raid"]["ShowPercentageHealth"] == true then 
				local HPpercentage = self.HPpercentage
				HPpercentage:SetPoint("TOPRIGHT", Name, "BOTTOMRIGHT", 0, -4)
				HPpercentage:SetJustifyH("RIGHT")
			end

			Power:SetPoint("BOTTOM", Health, "BOTTOMRIGHT", 0, 2)

			if T.Retail then
				local GroupRoleIndicator = self.GroupRoleIndicator
				GroupRoleIndicator:SetPoint("BOTTOMRIGHT", Health, "BOTTOMLEFT", -18, 0)
			end

			Health.GroupBG:SetPoint("BOTTOMRIGHT", Health, "BOTTOMLEFT", -4, 0)

			RaidIcon:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 18, 0)

			LeaderIndicator:SetPoint("BOTTOMLEFT", self, 'BOTTOMLEFT', 2, 16)

			AssistantIndicator:SetPoint("BOTTOMLEFT", self, 'BOTTOMLEFT', 2, 16)
		end
	end
end