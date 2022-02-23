------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
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
-- RAID FRAMES - GENERAL
------------------------------------------------------------------------------------------
function UnitFrames:Raid()
	
	-- Tukui
	baseRaid(self)
	
	-- MaxUI
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
	
	local RoleIconSize = C["Raid"]["RoleIconSize"]
	local RaidFont = T.GetFont(C["Raid"].Font)
	local HealthPercentageFont = T.GetFont(C["Raid"]["HealthPercentageFont"])
	local Blank = C.Medias.Blank
	local IsInGroup = IsInGroup
	local UnitIsUnit = UnitIsUnit

	if C.Raid.Alternative == false then return end

------------------------------------------------------------------------------------------
-- RAID FRAME - GROUP ROLE INDICATOR
------------------------------------------------------------------------------------------
	if T.Retail then
		local GroupRoleIndicator = Health:CreateTexture(nil, "ART")

		RaidIcon:ClearAllPoints()
		
		if C["UnitFrames"]["Roles"]["Value"] == "MaxUI Style" or 
		C["UnitFrames"]["Roles"]["Value"] == "Elvui Style" or 
		C["UnitFrames"]["Roles"]["Value"] == "Blizzard Style" then
			
			-- actuel icon
			GroupRoleIndicator:SetWidth(24)
			GroupRoleIndicator:SetHeight(24)
			GroupRoleIndicator:SetPoint("TOPRIGHT", Health, "BOTTOMRIGHT", 0, -2)
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
	Health.GroupBG:SetHeight(22)
	Health.GroupBG:SetWidth(22)
	Health.GroupBG:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 2, -2)
	Health.GroupBG:SetTexture([[Interface\AddOns\MaxUI\Medias\MaxUI\threat.tga]])
	Health.GroupBG:SetVertexColor(0.1, 0.1, 0.1, 0.8)
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
	
------------------------------------------------------------------------------------------
-- HEALCOMM
------------------------------------------------------------------------------------------
	if C.UnitFrames.HealComm then
		myBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
		otherBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
		absorbBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
	end

------------------------------------------------------------------------------------------
-- RAID FRAME - MAXUI THEME
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		
		self.Shadow:Hide()
		self.Backdrop:SetAlpha(0.2)
		
		-- health
		Health:ClearAllPoints()
		Health:SetPoint("TOPLEFT", self, "TOPLEFT", 10, 0)
		Health:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", 0, -10)
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
			HPpercentage:SetPoint("TOPLEFT", Name, "BOTTOMLEFT", 0, -4)
			HPpercentage:SetAlpha(1)
			HPpercentage:SetJustifyH("LEFT")
			HPpercentage:SetFontObject(HealthPercentageFont)
			HPpercentage:SetScale(C["Raid"]["PercentageFontSize"]/10)
			self:Tag(HPpercentage, "[perhp]%")
		end
		
		-- power
		Power:ClearAllPoints()
		Power:SetPoint("LEFT", self, "LEFT", 0, 0)
		Power:SetHeight(self:GetHeight())
		Power:SetWidth(6)
		Power:SetOrientation("VERTICAL")
		Power:SetFrameLevel(8)
		Power:SetFrameStrata("MEDIUM")
		Power:CreateBackdrop()
		Power.Backdrop:CreateShadow()
		if C["General"]["ClassShadowExcludeUF"] then
			Power.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
		end
		Power.Backdrop:SetOutside(Power)

		-- Name	
		Name:ClearAllPoints()
		Name:SetPoint("TOPLEFT", Health, "BOTTOMLEFT", 0, -4)
		Name:SetParent(Health)
		Name:SetFontObject(RaidFont)
		Name:SetScale(C["Raid"]["FontSize"]/10)
		self:Tag(Name, "[MaxUI:GetNameColor][Tukui:NameLong]")
		
		-- Ready check V	
		ReadyCheck:ClearAllPoints()
		ReadyCheck:SetHeight(24)
		ReadyCheck:SetWidth(24)
		ReadyCheck:SetPoint("CENTER", self, 0, 0)
		
		-- raidicon
		RaidIcon:ClearAllPoints()
		RaidIcon:SetPoint("BOTTOM", self, "BOTTOM", 0, 0)
		RaidIcon:SetWidth(C["Raid"]["MarkerSize"])
		RaidIcon:SetHeight(C["Raid"]["MarkerSize"])
		
		-- resurrect Icon
		--ResurrectIcon:SetSize(24)
		--ResurrectIcon:SetPoint("TOP")

		-- Position and size
		local SummonIndicator = Health:CreateTexture(nil, 'OVERLAY')
		SummonIndicator:SetSize(32, 32)
		SummonIndicator:SetPoint('CENTER', self)
		self.SummonIndicator = SummonIndicator

		-- Leader
		local LeaderIndicator = Health:CreateTexture(nil, 'OVERLAY')
		LeaderIndicator:SetSize(12, 12)
		LeaderIndicator:SetPoint("BOTTOMRIGHT", self, 'BOTTOMRIGHT', -16, 1)
		LeaderIndicator:SetTexture([[Interface\AddOns\MaxUI\Medias\roleicons\MaxLeader.tga]])
		self.LeaderIndicator = LeaderIndicator

		-- Assistant
		local AssistantIndicator = Health:CreateTexture(nil, 'OVERLAY')
		AssistantIndicator:SetSize(12, 12)
		AssistantIndicator:SetPoint("BOTTOMRIGHT", self, 'BOTTOMRIGHT', -16, 1)
		AssistantIndicator:SetTexture([[Interface\AddOns\MaxUI\Medias\roleicons\MaxLeader.tga]])
		AssistantIndicator:SetVertexColor(0.5, 0.5, 1)
		self.AssistantIndicator = AssistantIndicator

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
		
		-- buffs
		if C.Raid.RaidBuffsStyle.Value == "Aura Track" then
			AuraTrack.Texture = C["Textures"]["UFRaidHealthTexture"]
			--AuraTrack:CreateBackdrop()

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
			RaidDebuffs:SetHeight(C["Raid"]["Raid40HeightSize"])
			RaidDebuffs:SetWidth(C["Raid"]["Raid40HeightSize"])
			RaidDebuffs.time:SetDrawLayer("OVERLAY")
			RaidDebuffs:ClearAllPoints()
			RaidDebuffs:SetPoint("CENTER", self, "CENTER", 0, 0)
		end
		
		-- Highlight
		self:HookScript("OnEnter", function(self)
			Health.Backdrop:SetBorderColor(Health:GetStatusBarColor())
			Power.Backdrop:SetBorderColor(Power:GetStatusBarColor())
		end)

		self:HookScript("OnLeave", function(self)
			Health.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
			Power.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
		end)
	end
end