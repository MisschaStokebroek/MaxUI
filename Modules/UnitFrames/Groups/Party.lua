------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-10-2022
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
function UnitFrames:GetPartyFramesAttributes()
	if (C.Party.Enable) then
		if C["Party"]["Style"]["Value"] == "Tukui" then

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
			"yOffset", -C["Party"]["VerticalSpacing"]
		
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
			"initial-width", (C["Party"]["HealthWidth"]),
			"initial-height", (C["Party"]["HealthHeight"]),
			"showSolo", C["Party"]["ShowSolo"],
			"showParty", true,
			"showPlayer", C["Party"].ShowPlayer,
			"showRaid", true,
			"groupFilter", "1,2,3,4,5,6,7,8",
			"groupingOrder", "1,2,3,4,5,6,7,8",
			"groupBy", "GROUP",
			"yOffset", -C["Party"]["VerticalSpacing"]
		end
	end
end

function UnitFrames:GetPetPartyFramesAttributes()
	if (C.Party.Enable) then
		if C["Party"]["Style"]["Value"] == "Tukui" then
		
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
			"yOffset", -C["Party"]["VerticalSpacing"]

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
			"initial-width", (C["Party"]["HealthWidth"]*C["Party"]["PetSizeScale"]/100),
			"initial-height", (C["Party"]["HealthHeight"]*C["Party"]["PetSizeScale"]/100),
			"showSolo", C["Party"]["ShowSolo"],
			"showParty", true,
			"showPlayer", C["Party"].ShowPlayer,
			"showRaid", true,
			"groupFilter", "1,2,3,4,5,6,7,8",
			"groupingOrder", "1,2,3,4,5,6,7,8",
			"groupBy", "GROUP",
			"yOffset", -C["Party"]["VerticalSpacing"]
		end	
	end
end

------------------------------------------------------------------------------------------
-- PARTY FRAME POSITION
------------------------------------------------------------------------------------------
local function CreateUnits()	
	local Party = UnitFrames.Headers.Party

	if not C["UnitFrames"]["Enable"] == true then return end

	if (C.Party.Enable) and C["Party"]["Style"]["Value"] == "MaxUI" then
		Party:ClearAllPoints()
		if (C.UnitFrames.Portrait == true and C["Party"]["PortraitStyle"]["Value"] == "Side") or (C["Party"]["CastBar"] and C["Party"]["CastBarIcon"]) then
			Party:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 54, -130)
		else
			Party:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 20, -130)
		end

		if C["Party"]["ShowPets"] == true then
			TukuiPartyPet:ClearAllPoints()
			TukuiPartyPet:SetPoint("TOPLEFT", Party, "BOTTOMLEFT", 0, -100)	
		end
	end	
end	
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- PARTY FRAMES BASIC (MAXUI AND TUKUI)
------------------------------------------------------------------------------------------
function UnitFrames:Party()
	baseParty(self)
	
	-- wow

	-- elements
	local Health = self.Health
	local Power = self.Power
	local myBar = self.HealthPrediction.myBar
	local otherBar = self.HealthPrediction.otherBar
	local absorbBar = self.HealthPrediction.absorbBar
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs
	local Name = self.Name
	local RaidIcon = self.RaidTargetIndicator
	local Leader = self.LeaderIndicator
	local MasterLooter = self.MasterLooterIndicator
	local ReadyCheck = self.ReadyCheckIndicator
	local Portrait
	local PortraitBackdrop
	local PortraitShadow

	-- settings
	local Petscale = C["Party"]["PetSizeScale"]/100
	
	local HealthHeight
	local HealthWidth
	local PowerHeight
	local PowerWidth
	if TukuiPartyPet then
		HealthHeight = C["Party"]["HealthHeight"]*Petscale
		HealthWidth = C["Party"]["HealthWidth"]*Petscale
		PowerHeight = C["Party"]["PowerHeight"]*Petscale
		PowerWidth = C["Party"]["PowerWidth"]*Petscale
	else
		HealthHeight = C["Party"]["HealthHeight"]
		HealthWidth = C["Party"]["HealthWidth"]
		PowerHeight = C["Party"]["PowerHeight"]
		PowerWidth = C["Party"]["PowerWidth"]
	end
	local CastHeight = C["Party"]["CastHeight"]
	local CastWidth = C["Party"]["CastWidth"]

	-- font
	local HealthFont = T.GetFont(C["Party"]["HealthFont"])
	local NameFont = T.GetFont(C["Party"]["Font"])
	local PowerFont = T.GetFont(C["Party"]["PowerFont"])
	local HealthFontSize = C["Party"]["HealthFontSize"]/10
	local NameFontSize = C["Party"]["NameFontSize"]/10
	local PowerFontSize = C["Party"]["PowerFontSize"]/10
	local CastFont = T.GetFont(C["Party"]["CastFont"])
	local CastFontSize = C["Party"]["CastFontSize"]/10

	-- texture
	local CastBarTexture = T.GetTexture(C["Party"]["CastTexture"])

	-- MaxUI
	local GroupRoleIndicator = Health:CreateTexture(nil, "OVERLAY")
	local CastBar = CreateFrame("StatusBar", "PartyCastBar", self)
	CastBar.Text = CastBar:CreateFontString(nil, "OVERLAY")
	CastBar.Button = CreateFrame("Frame", nil, CastBar)

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

		Portrait:SetSize(57, 57)
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

		if (C.UnitFrames.Portrait == true and C["Party"]["PortraitStyle"]["Value"] == "None") then
			Portrait:Kill()
			PortraitBackdrop:Kill()
			PortraitShadow:Kill()

		elseif C["Party"]["PortraitStyle"]["Value"] == "Overlay" then
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
			Portrait:SetAlpha(C["Party"]["PortraitOverlayAlpha"])
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
-- SHADOW
------------------------------------------------------------------------------------------
	if C["General"]["ClassShadowExcludeUF"] then
		self.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
	end
	
------------------------------------------------------------------------------------------
-- MaxUI UF STYLE - BASIC (UNITFRAME AND PET)
------------------------------------------------------------------------------------------
	if C["Party"]["Style"]["Value"] ~= "MaxUI" then return end
	
		self.Backdrop:SetBackdrop(nil)

		-- Name
		Name:ClearAllPoints()
		Name:SetAlpha(1)
		Name:SetFontObject(NameFont)
		Name:SetScale(NameFontSize)
		self:Tag(Name, "[Tukui:GetNameColor][Tukui:NameLong] [Tukui:DiffColor][level] [shortclassification][pvp]")

		-- health
		Health:SetFrameStrata("MEDIUM")
		Health:SetFrameLevel(1)
		Health:ClearAllPoints()
		Health:SetInside(self)
		
		Health:CreateBackdrop()
		Health.Backdrop:SetBackdropColor(0, 0, 0, 0)
		Health.Backdrop:SetOutside(Health)

		-- health percentage
		local HPpercentage
		if C["Party"]["PercentageTags"] == true then
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

		-- Power
		Power:ClearAllPoints()
		Power:SetFrameStrata("MEDIUM")
		Power:SetFrameLevel(3)
		Power:SetParent(Health)
		
		Power:CreateBackdrop()
		Power.Backdrop:SetOutside(Power)
		Power.Backdrop:CreateShadow()
		if C["General"]["ClassShadowExcludeUF"] then
			Power.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
		end
		
		-- power percentage
		local MPpercentage
		if C["Party"]["PercentageTags"] == true then
			MPpercentage = Power:CreateFontString(nil, "OVERLAY")
			MPpercentage:SetAlpha(1)
			MPpercentage:SetFontObject(PowerFont)
			MPpercentage:SetScale(PowerFontSize)
			self:Tag(MPpercentage, "[perpp]%")
		end	
		
		if C.UnitFrames.Portrait == true and C["Party"]["PortraitStyle"]["Value"] == "Side" then
			Portrait:ClearAllPoints()
			Portrait:SetParent(Health)
			
			Portrait:CreateBackdrop()
			Portrait.Backdrop:SetOutside(Portrait)
			Portrait.Backdrop:CreateShadow()
			PortraitShadow:Kill()
		end

		-- debuffs
		if C.Party.Debuffs == true then
			Debuffs:ClearAllPoints()
			Debuffs:SetPoint("LEFT", Health, "RIGHT", 44, 0)
			Debuffs:SetParent(Health)
			
			Debuffs:SetHeight(HealthHeight)
			Debuffs:SetWidth((HealthHeight*C["Party"]["NumberOfDebuffsShown"]) + (5*(C["Party"]["NumberOfDebuffsShown"]-1)))
			Debuffs.size = HealthHeight
			Debuffs.num = C["Party"]["NumberOfDebuffsShown"]
			Debuffs.spacing = 5
		else
			Debuffs.num = 0
		end

		-- buffs
		if C.Party.Buffs == true then
			Buffs:ClearAllPoints()
			Buffs:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", -1, 8)
			Buffs:SetHeight(20)
			Buffs:SetWidth((20*C["Party"]["NumberOfBuffsShown"]) + (5*(C["Party"]["NumberOfBuffsShown"]-1)))
			Buffs.size = 20
			Buffs.num = C["Party"]["NumberOfBuffsShown"]
			Buffs.numRow = 1
			Buffs.spacing = 5
		else
			Buffs.num = 0
		end

		-- raidicon
		RaidIcon:ClearAllPoints()
		RaidIcon:SetWidth(C["Party"]["RaidIconSize"])
		RaidIcon:SetHeight(C["Party"]["RaidIconSize"])

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

		-- filter
		if C["Skins"]["GroupRaidFilter"] == true then 
			Health:CreateMaxUIFilter()
			Power:CreateMaxUIFilter()
		end

------------------------------------------------------------------------------------------
-- PARTY PLAYER UNITFRAMES
------------------------------------------------------------------------------------------
	if self ~= TukuiPartyPet then

		--self:SetHeight(HealthHeight)
		--self:SetWidth(HealthWidth)

		-- health value
		if C.Party.ShowHealthText then
			Health.Value:ClearAllPoints()
			Health.Value:SetPoint("RIGHT", -4, 0)
			Health.Value:SetFontObject(HealthFont)
			Health.Value:SetScale(HealthFontSize)
			self:Tag(Health.Value, C["Party"]["HealthTag"]["Value"])
		end

		-- power
		Power:SetHeight(PowerHeight)
		Power:SetWidth(PowerWidth)

		-- power value
		if C.Party.ShowManaText then
			Power.Value:ClearAllPoints()
			Power.Value:SetPoint("RIGHT", Power, "RIGHT", -2, 0)
			Power.Value:SetFontObject(PowerFont)
			Power.Value:SetScale(PowerFontSize)
			self:Tag(Power.Value, C["Party"]["PowerTag"]["Value"])
			Power.PostUpdate = nil
		end

		if C.UnitFrames.Portrait == true and C["Party"]["PortraitStyle"]["Value"] == "Side" then
			Portrait:SetWidth(HealthHeight)
			Portrait:SetHeight(HealthHeight-2)
		end

		-- castbar
		if (C.UnitFrames.CastBar) then
			if C["Party"]["CastBar"] == true then
				CastBar:SetFrameStrata("MEDIUM")
				CastBar:SetFrameLevel(4)
				CastBar:SetStatusBarTexture(CastBarTexture)
				CastBar:SetAllPoints(Power)

				CastBar.Background = CastBar:CreateTexture(nil, "BORDER")
				CastBar.Background:SetAllPoints(CastBar)
				CastBar.Background:SetVertexColor(0.15, 0.15, 0.15)
				CastBar.Background:SetTexture(0, 0, 0, 1)

				CastBar:CreateBackdrop()
				CastBar.Backdrop:SetOutside()

				if C["Party"]["CastBarTime"] then
					CastBar.Time = CastBar:CreateFontString(nil, "OVERLAY")
					CastBar.Time:SetFontObject(CastFont)
					CastBar.Time:SetPoint("RIGHT", CastBar, "RIGHT", -4, 0)
					CastBar.Time:SetTextColor(0.84, 0.75, 0.65)
					CastBar.Time:SetJustifyH("RIGHT")
				end

				if C["Party"]["CastBarText"] then
					CastBar.Text:SetFontObject(CastFont)
					CastBar.Text:SetTextColor(0.84, 0.75, 0.65)
					CastBar.Text:SetWidth(166)
				end

				if C["Party"]["CastBarIcon"] then
					CastBar.Button:SetSize(HealthHeight-2, HealthHeight-2)
					CastBar.Button:CreateBackdrop()
					CastBar.Button.Backdrop:CreateShadow()

					CastBar.Icon = CastBar.Button:CreateTexture(nil, "ARTWORK")
					CastBar.Icon:SetInside()
					CastBar.Icon:SetTexCoord(unpack(T.IconCoord))
				end

				CastBar.CustomTimeText = UnitFrames.CustomCastTimeText
				CastBar.CustomDelayText = UnitFrames.CustomCastDelayText
				CastBar.PostCastStart = UnitFrames.CheckCast
				CastBar.PostChannelStart = UnitFrames.CheckChannel

				self.Castbar = CastBar
			end	
		end
		
		-- roll icon
		if T.Retail then
			if C["Party"]["RoleIcon"] == true then
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
		
		-- filter
		if C["Skins"]["GroupRaidFilter"] == true then 
			if (C.UnitFrames.CastBar) then
				if C["Party"]["CastBar"] == true then
					CastBar:CreateMaxUIFilter()
					if C["Party"]["CastBarIcon"] == true then
						CastBar.Button:CreateMaxUIFilter()
					end
				end
			end
		end

------------------------------------------------------------------------------------------
-- PARTY PET UNITFRAMES
------------------------------------------------------------------------------------------
	elseif self == TukuiPartyPet then
		--self:SetHeight(HealthHeight)
		--self:SetWidth(HealthWidth)

		-- health value
		if C.Party.ShowHealthText then
			Health.Value:Hide()
		end

		-- power
		Power:SetHeight(PowerHeight)
		Power:SetWidth(PowerWidth)

		-- power value
		if C.Party.ShowManaText then
			Power.Value:Hide()
		end

		if C.UnitFrames.Portrait == true and C["Party"]["PortraitStyle"]["Value"] == "Side" then
			Portrait:SetWidth(HealthHeight)
			Portrait:SetHeight(HealthHeight-2)
		end

		-- debuffs
		if C["Party"]["ShowDebuffs"] == true then
			Debuffs:SetHeight(HealthHeight)
			Debuffs:SetWidth((HealthHeight*C["Party"]["NumberOfDebuffsShown"]) + (5*(C["Party"]["NumberOfDebuffsShown"]-1)))
			Debuffs.size = HealthHeight
		end
	end

------------------------------------------------------------------------------------------
-- PARTY UNITFRAME - ALIGNMENT
------------------------------------------------------------------------------------------
	-- LEFT ORIENTATION
------------------------------------------------------------------------------------------
	if C["Party"]["ElementAnchored"]["Value"] == "LEFT" then
		Name:SetPoint("TOPLEFT", Health, "BOTTOMLEFT", 0, -6)
		Name:SetJustifyH("LEFT")
		
		if C["Party"]["PercentageTags"] == true then
			HPpercentage:SetPoint("LEFT", Health, "RIGHT", 6, 0)
			HPpercentage:SetJustifyH("LEFT")
		end

		Power:SetPoint("LEFT", Health, "BOTTOMLEFT", 10, 0)

		if C["Party"]["PercentageTags"] == true then
			MPpercentage:SetPoint("LEFT", Power, "RIGHT", 4, -1)
			MPpercentage:SetJustifyH("RIGHT")
		end	

		if (C.UnitFrames.CastBar) then
			if C["Party"]["CastBar"] == true then
				if C["Party"]["CastBarText"] then
					CastBar.Text:SetPoint("TOPLEFT", Name, "BOTTOMLEFT", 0, -4)
					CastBar.Text:SetJustifyH("LEFT")
				end
				if C["Party"]["CastBarIcon"] then
					CastBar.Button:SetPoint("RIGHT", Health, "LEFT", -8, 0)
				end	
			end	
		end

		if C.UnitFrames.Portrait == true and C["Party"]["PortraitStyle"]["Value"] == "Side" then
			Portrait:SetPoint("RIGHT", Health, "LEFT", -8, 0)
		end
		
		RaidIcon:SetPoint("LEFT", Name, "RIGHT", 26, 0)
	
		if T.Retail then
			if C["Party"]["RoleIcon"] == true then
				GroupRoleIndicator:SetPoint("RIGHT", Name, 20, 0)
			end	
		end
		
		Leader:SetPoint("LEFT", Name, "RIGHT", 52, 0)

------------------------------------------------------------------------------------------
	-- CENTER ORIENTATION
------------------------------------------------------------------------------------------
	elseif C["Party"]["ElementAnchored"]["Value"] == "CENTER" then
		Name:SetPoint("TOP", Health, "BOTTOM", 0, -6)
		Name:SetJustifyH("CENTER")
		
		if C["Party"]["PercentageTags"] == true then
			HPpercentage:SetPoint("LEFT", Health, "RIGHT", 6, 0)
			HPpercentage:SetJustifyH("LEFT")
		end

		Power:SetPoint("CENTER", Health, "BOTTOM", 0, 0)

		if C["Party"]["PercentageTags"] == true then
			MPpercentage:SetPoint("LEFT", Power, "RIGHT", 4, -1)
			MPpercentage:SetJustifyH("RIGHT")
		end	
		
		if (C.UnitFrames.CastBar) then
			if C["Party"]["CastBar"] == true then
				if C["Party"]["CastBarText"] then
					CastBar.Text:SetPoint("TOP", Name, "BOTTOM", 0, -4)
					CastBar.Text:SetJustifyH("CENTER")
				end
				if C["Party"]["CastBarIcon"] then
					CastBar.Button:SetPoint("RIGHT", Health, "LEFT", -8, 0)
				end	
			end	
		end

		if C.UnitFrames.Portrait == true and C["Party"]["PortraitStyle"]["Value"] == "Side" then
			Portrait:SetPoint("RIGHT", Health, "LEFT", -8, 0)
		end

		RaidIcon:SetPoint("LEFT", Name, "RIGHT", 6, 0)

		if T.Retail then
			if C["Party"]["RoleIcon"] == true then
				GroupRoleIndicator:SetPoint("RIGHT", Name, "LEFT", -6, 0)
			end
		end
		
		Leader:SetPoint("LEFT", Name, "RIGHT", 26, 0)

------------------------------------------------------------------------------------------
	-- RIGHT ORIENTATION
------------------------------------------------------------------------------------------
	elseif C["Party"]["ElementAnchored"]["Value"] == "RIGHT" then
		Name:SetPoint("TOPRIGHT", Health, "BOTTOMRIGHT", 0, -6)
		Name:SetJustifyH("RIGHT")
		
		if C["Party"]["PercentageTags"] == true then
			HPpercentage:SetPoint("RIGHT", Health, "LEFT", -6, 0)
			HPpercentage:SetJustifyH("RIGHT")
		end

		Power:SetPoint("RIGHT", Health, "BOTTOMRIGHT", -10, 0)

		if C["Party"]["PercentageTags"] == true then
			MPpercentage:SetPoint("RIGHT", Power, "LEFT", -4, -1)
			MPpercentage:SetJustifyH("LEFT")
		end

		if (C.UnitFrames.CastBar) then
			if C["Party"]["CastBar"] == true then
				if C["Party"]["CastBarText"] then
					CastBar.Text:SetPoint("TOPRIGHT", Name, "BOTTOMRIGHT", 0, -4)
					CastBar.Text:SetJustifyH("RIGHT")
				end
				if C["Party"]["CastBarIcon"] then
					CastBar.Button:SetPoint("LEFT", Health, "RIGHT", 8, 0)
				end	
			end	
		end

		if C.UnitFrames.Portrait == true and C["Party"]["PortraitStyle"]["Value"] == "Side" then
			Portrait:SetPoint("LEFT", Health, "RIGHT", 8, 0)
		end

		RaidIcon:SetPoint("RIGHT", Name, "LEFT", -26, 0)

		if T.Retail then
			if C["Party"]["RoleIcon"] == true then
				GroupRoleIndicator:SetPoint("RIGHT", Name, 20, 0)
			end
		end
		
		Leader:SetPoint("RIGHT", Name, "LEFT", -52, 0)
	end
end