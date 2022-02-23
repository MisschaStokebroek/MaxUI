------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up PARTY FRAMES.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
T, C, L = Tukui:unpack()
local UnitFrames = T.UnitFrames
local baseParty = UnitFrames.Party

------------------------------------------------------------------------------------------
-- PARTY ATTRIBUTES
------------------------------------------------------------------------------------------
-- Party
function UnitFrames:GetPartyFramesAttributes()
	if (C.Party.Enable) and C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		
	return
		"TukuiParty",
		nil,
		"custom [@raid6,exists] hide;show",
		"oUF-initialConfigFunction", [[
			local header = self:GetParent()
			self:SetWidth(header:GetAttribute("initial-width"))
			self:SetHeight(header:GetAttribute("initial-height"))
		]],
		"initial-width", (C["Party"]["HealthWidth"]+120),
		"initial-height", (54+20),
		"showSolo", C["Party"]["ShowSolo"],
		"showParty", true,
		"showPlayer", C["Party"].ShowPlayer,
		"showRaid", true,
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"yOffset", C["Party"]["VerticalSpacing"]-72
		
	else

	return
		"TukuiParty",
		nil,
		"custom [@raid6,exists] hide;show",
		"oUF-initialConfigFunction", [[
			local header = self:GetParent()
			self:SetWidth(header:GetAttribute("initial-width"))
			self:SetHeight(header:GetAttribute("initial-height"))
		]],
		"initial-width", 180,
		"initial-height", 24,
		"showSolo", C["Party"]["ShowSolo"],
		"showParty", true,
		"showPlayer", C["Party"].ShowPlayer,
		"showRaid", true,
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"yOffset", -50
	end
end

-- Pets for Party
function UnitFrames:GetPetPartyFramesAttributes()
	if (C.Party.Enable) and C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		
	return
		"TukuiPartyPet",
		"SecureGroupPetHeaderTemplate",
		"custom [@raid6,exists] hide;show",
		"oUF-initialConfigFunction", [[
			local header = self:GetParent()
			self:SetWidth(header:GetAttribute("initial-width"))
			self:SetHeight(header:GetAttribute("initial-height"))
		]],
		"initial-width", (C["Party"]["HealthWidth"]+120),
		"initial-height", (54+20),
		"showSolo", C["Party"]["ShowSolo"],
		"showParty", true,
		"showPlayer", C["Party"].ShowPlayer,
		"showRaid", true,
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"yOffset", -60
		
	else

	return
		"TukuiPartyPet",
		"SecureGroupPetHeaderTemplate",
		"custom [@raid6,exists] hide;show",
		"oUF-initialConfigFunction", [[
			local header = self:GetParent()
			self:SetWidth(header:GetAttribute("initial-width"))
			self:SetHeight(header:GetAttribute("initial-height"))
		]],
		"initial-width", 180,
		"initial-height", 24,
		"showSolo", C["Party"]["ShowSolo"],
		"showParty", true,
		"showPlayer", C["Party"].ShowPlayer,
		"showRaid", true,
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"yOffset", -50
	end
end

------------------------------------------------------------------------------------------
-- PARTY FRAME SETUP POSITION AND BASIC SIZE
------------------------------------------------------------------------------------------
local function CreateUnits()	
	local Party = UnitFrames.Headers.Party

	if not C["UnitFrames"]["Enable"] == true then return end

	if (C.Party.Enable) and C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		Party:ClearAllPoints()
		Party:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 20, -(UIParent:GetHeight() / 5))
	
	-- sort the portrait side position
		if C["Party"]["PortraitStyle"]["Value"] == "Side" then
			Party:ClearAllPoints()
			Party:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 50, -(UIParent:GetHeight() / 5))
		end
	end
end	
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- PARTY FRAMES
------------------------------------------------------------------------------------------
function UnitFrames:Party()
	-- Call the base function first
	baseParty(self)
	
	-- Then my stuff
	local Health = self.Health
	local Power = self.Power
	local myBar = self.HealthPrediction.myBar
	local otherBar = self.HealthPrediction.otherBar
	local absorbBar = self.HealthPrediction.absorbBar
	
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
-- MaxUI UF STYLE
------------------------------------------------------------------------------------------
	if C["General"]["ClassShadowExcludeUF"] then
		self.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
	end
	
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then

		local Buffs = self.Buffs
		local Debuffs = self.Debuffs
		local Name = self.Name
		local RaidIcon = self.RaidTargetIndicator
		local Leader = self.LeaderIndicator
		local MasterLooter = self.MasterLooterIndicator
		local ReadyCheck = self.ReadyCheckIndicator
		local Blank = C.Medias.Blank

		local HealthHeight = C["Party"]["HealthHeight"]
		local HealthWidth = C["Party"]["HealthWidth"]
		local PowerHeight = C["Party"]["PowerHeight"]
		local PowerWidth = C["Party"]["PowerWidth"]
		local HealthFont = T.GetFont(C["Party"]["HealthFont"])
		local NameFont = T.GetFont(C["Party"]["Font"])
		local PowerFont = T.GetFont(C["Party"]["PowerFont"])
		local HealthFontSize = C["Party"]["HealthFontSize"]/10
		local NameFontSize = C["Party"]["NameFontSize"]/10
		local PowerFontSize = C["Party"]["PowerFontSize"]/10

		-- panel and self
		self.Backdrop:SetBackdrop(nil)
		self:SetHeight(HealthHeight)
		self:SetWidth(HealthWidth)

		-- health
		Health:ClearAllPoints()
		Health:SetInside(self)
		
		Health:CreateBackdrop()
		Health.Backdrop:SetBackdropColor(0, 0, 0, 0)
		Health.Backdrop:SetOutside(Health)
		
		if C.Party.ShowHealthText then
			Health.Value:ClearAllPoints()
			Health.Value:SetPoint("RIGHT", -4, 0)
			Health.Value:SetFontObject(HealthFont)
			Health.Value:SetScale(HealthFontSize)
			self:Tag(Health.Value, C["Party"]["HealthTag"]["Value"])
		end

		-- HPpercentage tag
		if C["Party"]["PercentageTags"] == true then
			local HPpercentage = Health:CreateFontString(nil, "OVERLAY")
			HPpercentage:SetPoint("LEFT", Health, "RIGHT", 6, 0)
			HPpercentage:SetAlpha(1)
			HPpercentage:SetJustifyH("LEFT")
			HPpercentage:SetFontObject(HealthFont)
			HPpercentage:SetScale(HealthFontSize)
			self:Tag(HPpercentage, "[perhp]%")
		end
		
		-- Power
		Power:ClearAllPoints()
		Power:SetParent(Health)
		Power:SetPoint("LEFT", Health, "BOTTOMLEFT", 10, 0)
		Power:SetHeight(PowerHeight)
		Power:SetWidth(PowerWidth)
		Power:SetFrameLevel(8)
		Power:SetFrameStrata("MEDIUM")
		Power:CreateBackdrop()
		Power.Backdrop:SetOutside(Power)
		Power.Backdrop:CreateShadow()
		if C["General"]["ClassShadowExcludeUF"] then
			Power.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
		end

		if C.Party.ShowManaText then
			Power.Value:ClearAllPoints()
			Power.Value:SetPoint("RIGHT", Power, "RIGHT", -2, 0)
			Power.Value:SetFontObject(PowerFont)
			Power.Value:SetScale(PowerFontSize)
			Power.PostUpdate = UnitFrames.PostUpdatePower
			--self:Tag(Power.Value, C["Party"]["PowerTag"]["Value"])
		end
		
		if C["Party"]["PercentageTags"] == true then
			local MPpercentage = Power:CreateFontString(nil, "OVERLAY")
			MPpercentage:SetPoint("LEFT", Power, "RIGHT", 4, -1)
			MPpercentage:SetAlpha(1)
			MPpercentage:SetJustifyH("RIGHT")
			MPpercentage:SetFontObject(PowerFont)
			MPpercentage:SetScale(PowerFontSize)
			self:Tag(MPpercentage, "[perpp]%")
		end	
		
		-- Name
		Name:ClearAllPoints()
		Name:SetPoint("TOPLEFT", Health, "BOTTOMLEFT", 0, -8)
		Name:SetAlpha(1)
		Name:SetJustifyH("LEFT")
		Name:SetFontObject(NameFont)
		Name:SetScale(NameFontSize)
		self:Tag(Name, "[Tukui:GetNameColor][Tukui:NameLong] |cffFFFFFF[level]|r")

		-- portrait	
		local Portrait = CreateFrame("PlayerModel", nil, Health)
		self.Portrait = Portrait

		if C["Party"]["PortraitStyle"]["Value"] == "None" then

		elseif C["Party"]["PortraitStyle"]["Value"] == "Side" then
			Portrait:SetPoint("RIGHT", Health, "LEFT", -8, 0)
			Portrait:SetWidth(HealthHeight)
			Portrait:SetHeight(HealthHeight-2)
			Portrait:CreateBackdrop()
			Portrait.Backdrop:SetOutside(Portrait)
			Portrait.Backdrop:CreateShadow()
				
		elseif C["Party"]["PortraitStyle"]["Value"] == "Overlay" then
			Portrait:SetAllPoints(Health)
			Portrait:SetAlpha(C["Party"]["PortraitOverlayAlpha"])
		end

		-- raidicon
		RaidIcon:ClearAllPoints()
		RaidIcon:SetWidth(C["Party"]["RaidIconSize"])
		RaidIcon:SetHeight(C["Party"]["RaidIconSize"])
		RaidIcon:SetPoint("LEFT", Name, "RIGHT", 26, 0)

		-- roll icon
		if T.Retail then
			if C["Party"]["RoleIcon"] == true then
				local GroupRoleIndicator = Health:CreateTexture(nil, "OVERLAY")
				GroupRoleIndicator:SetPoint("RIGHT", Name, 20, 0)
				GroupRoleIndicator:SetSize(20, 20)
				
				if C["UnitFrames"]["Roles"]["Value"] == "MaxUI Style" or C["UnitFrames"]["Roles"]["Value"] == "Elvui Style" then
					GroupRoleIndicator.Override = UnitFrames.SetGridGroupRole
				end
				self.GroupRoleIndicator = GroupRoleIndicator
			end
		end
		
		-- leader icon
		Leader:ClearAllPoints()
		Leader:SetPoint("LEFT", Name, "RIGHT", 52, 0)

		--master looter

		--ready check

		-- highlighting
		self:HookScript("OnEnter", function(self)
			Health.Backdrop:SetBorderColor(Health:GetStatusBarColor())
			Power.Backdrop:SetBorderColor(Power:GetStatusBarColor())
		end)

		self:HookScript("OnLeave", function(self)
			Health.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
			Power.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
		end)

		if C["Party"]["ShowBuffs"] == true then
			Buffs:ClearAllPoints()
			Buffs:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", -1, 8)
			
			Buffs:SetHeight(20)
			Buffs:SetWidth(HealthWidth)
			Buffs.size = 20
			Buffs.num = 8
			Buffs.numRow = 1
			Buffs.spacing = 6
		else
			Buffs.num = 0
		end	
		
		if C["Party"]["ShowDebuffs"] == true then
			Debuffs:ClearAllPoints()
			Debuffs:SetPoint("LEFT", Health, "RIGHT", 44, 0)
			Debuffs:SetParent(Health)
			
			Debuffs:SetHeight(HealthHeight)
			Debuffs:SetWidth(240)
			Debuffs.size = HealthHeight
			Debuffs.num = 3
			Debuffs.spacing = 5
		else
			Debuffs.num = 0
		end
		
		-- Healcomm Bars adjustments
		if C.UnitFrames.HealComm then
			myBar:SetWidth(HealthWidth)
			otherBar:SetWidth(HealthWidth)
			absorbBar:SetWidth(HealthWidth)
		end
	end	
end