------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up PLAYER FRAMES.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T.UnitFrames
local ActionBars = T.ActionBars
local Class = select(2, UnitClass("player"))
local Movers = T["Movers"]
local basePlayer = UnitFrames.Player
local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}

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
-- PLAYER FRAME
------------------------------------------------------------------------------------------
function UnitFrames:Player()
	-- Tukui
	basePlayer(self)
	
	-- MaxUI
	local Panel = self.Panel
	local Health = self.Health
	local myBar = self.HealthPrediction.myBar
	local otherBar = self.HealthPrediction.otherBar
	local absorbBar = self.HealthPrediction.absorbBar
	local Power = self.Power
	local PowerPrediction = self.PowerPrediction.mainBar
	local AdditionalPower = self.AdditionalPower
	local CastBar = self.Castbar
	local Portrait = self.Portrait
	local PortraitBackdrop = self.Portrait.Backdrop
	local PortraitShadow = self.Portrait.Shadow
	local CombatFeedbackText = self.CombatFeedbackText
	
	local Combat = self.CombatIndicator 
	local Status = self.Status
	local Leader = self.LeaderIndicator
	local MasterLooter = self.MasterLooterIndicator 
	local RaidIcon = self.RaidTargetIndicator
	local RestingIndicator = self.RestingIndicator
	
	local TotemBar = self.Totems
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs
	local AuraBars = self.AuraBars
	local ActionBar1 = ActionBars.Bars.Bar1
	local ActionBar4 = ActionBars.Bars.Bar4

	
	local HealthHeight = C["UF: Player"]["HealthHeight"]
	local HealthWidth = C["UF: Player"]["HealthWidth"]
	local PowerHeight = C["UF: Player"]["PowerHeight"]
	local PowerWidth = C["UF: Player"]["PowerWidth"]
	local CastHeight = C["UF: Player"]["CastHeight"]
	local CastWidth = C["UF: Player"]["CastWidth"]
	local AuraBarsHeight = C["UF: Player"]["AuraBarsHeight"]
	local AuraBarsWidth = C["UF: Player"]["AuraBarsWidth"]
	local AuraBarsSpacing = C["UF: Player"]["AuraBarsSpacing"]
	local CastFont = T.GetFont(C["UF: Player"]["CastFont"])
	local HealthFont = T.GetFont(C["UF: Player"]["HealthFont"])
	local NameFont = T.GetFont(C["UF: Player"]["NameFont"])
	local PowerFont = T.GetFont(C["UF: Player"]["PowerFont"])
	local CastFontSize = C["UF: Player"]["CastFontSize"]/10
	local HealthFontSize = C["UF: Player"]["HealthFontSize"]/10
	local NameFontSize = C["UF: Player"]["NameFontSize"]/10
	local PowerFontSize = C["UF: Player"]["PowerFontSize"]/10
	local HealthTexture = T.GetTexture(C["UF: Player"]["HealthTexture"])
	local PowerTexture = T.GetTexture(C["UF: Player"]["PowerTexture"])
	local CastBarTexture = T.GetTexture(C["UF: Player"]["CastTexture"])
	local ClassPowerTexture = T.GetTexture(C["ClassOptions"]["ClassPowerTexture"])
	local ClassPowerTexture = T.GetTexture(C["ClassOptions"]["ClassPowerTexture"])
	local RoleIconSize = C["UF: Player"]["RoleIconSize"]
	local RaidIconSize = C["UF: Player"]["RaidIconSize"]

------------------------------------------------------------------------------------------
-- PORTRAIT STYLE
------------------------------------------------------------------------------------------
	if (C.UnitFrames.Portrait == true and C["UF: Player"]["PortraitStyle"]["Value"] == "None") then
		Portrait:Kill()
		PortraitBackdrop:Kill()
		PortraitShadow:Kill()

	elseif (C.UnitFrames.Portrait == true and C["UF: Player"]["PortraitStyle"]["Value"] == "Side") then
		if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
			Portrait:ClearAllPoints()
			Portrait:SetParent(Health)
			Portrait:SetPoint("LEFT", Health, "RIGHT", 10, 0)
			Portrait:SetWidth(HealthHeight)
			Portrait:SetHeight(HealthHeight-2)
			
			Portrait.Backdrop:ClearAllPoints()
			Portrait.Backdrop:SetOutside(Portrait)
			Portrait.Backdrop:CreateShadow()

			PortraitShadow:Kill()
			
			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
				Portrait:Kill()
				PortraitBackdrop:Kill()
				PortraitShadow:Kill()
			end
		end
		
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
	end

------------------------------------------------------------------------------------------
-- RESTING ICON
------------------------------------------------------------------------------------------
    -- Position and size
    RestingIndicator:ClearAllPoints()
    RestingIndicator:SetSize(32, 32)
	RestingIndicator:SetPoint("BOTTOM", Health, "TOP", 20, 4)
	RestingIndicator:SetTexture([[Interface\AddOns\MaxUI\Medias\MaxUI\RestedIcon.tga]])
	
	if C["UF: Player"]["RestedIcon"] == true then
		RestingIndicator:Show()
	else
		RestingIndicator:Hide()
	end

 	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		RestingIndicator:ClearAllPoints()
		RestingIndicator:SetPoint("BOTTOM", Health, "TOP", 0, 4)

		if C["UF: Player"]["PortraitStyle"]["Value"] == "Side" then
			RestingIndicator:ClearAllPoints()
			RestingIndicator:SetPoint("BOTTOMLEFT", Portrait, "TOPLEFT", 10, 4)

			if C["UF: Player"]["PortraitStyle"]["Value"] == "Overlay" then
				RestingIndicator:ClearAllPoints()
				RestingIndicator:SetPoint("BOTTOM", Health, "TOP", 0, 4)
			end
		end
		
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
			RestingIndicator:ClearAllPoints()
			RestingIndicator:SetPoint("BOTTOM", Health, "TOP", 0, 20)
		end
		
	else
	
		RestingIndicator:ClearAllPoints()
		RestingIndicator:SetPoint("BOTTOM", Health, "TOP", 0, 4)
	
		if C["UF: Player"]["PortraitStyle"]["Value"] == "Side" then
			RestingIndicator:ClearAllPoints()
			RestingIndicator:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", -10, 4)

			if C["UF: Player"]["PortraitStyle"]["Value"] == "Overlay" then
				RestingIndicator:ClearAllPoints()
				RestingIndicator:SetPoint("BOTTOM", Health, "TOP", 0, 4)
			end
		end
	end

------------------------------------------------------------------------------------------
-- BUFFS AND DEBUFFS
------------------------------------------------------------------------------------------
	if C.UnitFrames.PlayerBuffs and C.UnitFrames.PlayerAuraBars then

	elseif (C.UnitFrames.PlayerBuffs) then
		Buffs:ClearAllPoints()
		Buffs:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 12)
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
			if InCombatLockdown() then
				self:SetAlpha(1)
				Health.Background:SetAlpha(1)
			elseif MouseIsOver(self) then
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
-- MaxUI UF STYLE
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		-- health
		Health:SetStatusBarTexture(HealthTexture)
		Health:SetInside(self)
		
		Health:CreateBackdrop()
		Health.Backdrop:SetBackdropColor(0, 0, 0, 0)
		Health.Backdrop:SetOutside(Health)
		
		Health.Value:ClearAllPoints()
		Health.Value:SetPoint("LEFT", Health, "LEFT", 2, 0)
		Health.Value:SetFontObject(HealthFont)
		Health.Value:SetScale(HealthFontSize)
		self:Tag(Health.Value, C["UnitFrames"]["PlayerHealthTag"]["Value"])
		
		-- hp percentage
		if C["UF: Player"]["PercentageTags"] == true then

			local HPpercentage = Health:CreateFontString(nil, "OVERLAY")
			HPpercentage:SetPoint("RIGHT", Health, "LEFT", -3, 0)
			HPpercentage:SetAlpha(1)
			HPpercentage:SetJustifyH("RIGHT")
			HPpercentage:SetFontObject(HealthFont)
			HPpercentage:SetScale(HealthFontSize)
			self:Tag(HPpercentage, "[perhp]%")
			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
				HPpercentage:ClearAllPoints()
				HPpercentage:SetJustifyH("CENTER")
				HPpercentage:SetPoint("BOTTOM", Health, "TOP", 2, 4)
			end
		end

		-- power
		Power:ClearAllPoints()
		Power:SetParent(Health)
		Power:SetPoint("RIGHT", Health, "BOTTOMRIGHT", -10, 0)
		Power:SetHeight(PowerHeight)
		Power:SetWidth(PowerWidth)
		Power:SetFrameLevel(15)
		Power:SetFrameStrata("MEDIUM")
		Power:SetStatusBarTexture(PowerTexture)
		Power:CreateBackdrop()
		Power.Backdrop:CreateShadow()
		if C["General"]["ClassShadowExcludeUF"] then
			Power.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
		end
		Power.Backdrop:SetOutside(Power)

		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
			Power:ClearAllPoints()
			Power:SetPoint("BOTTOM", Health, "BOTTOMLEFT", 0, 10)
			Power:SetHeight(PowerWidth)
			Power:SetWidth(PowerHeight)
			Power:SetOrientation("VERTICAL")
			
			PowerPrediction:SetOrientation("VERTICAL")
			PowerPrediction:SetWidth(PowerHeight)
			PowerPrediction:ClearAllPoints()
			PowerPrediction:SetPoint("BOTTOM")
			PowerPrediction:SetPoint("TOP")
			PowerPrediction:SetPoint("TOP", Power:GetStatusBarTexture(), "TOP")
		end
		
		-- power value
		Power.Value:ClearAllPoints()
		Power.Value:SetParent(Power)
		Power.Value:SetPoint("RIGHT", Power, "RIGHT", -2, 0)
		Power.Value:SetFontObject(PowerFont)
		Power.Value:SetScale(PowerFontSize)
		Power.Value:SetJustifyH("RIGHT")
		self:Tag(Power.Value, C["UF: Player"]["PowerTag"]["Value"])
		
		Power.PostUpdate = nil

		-- mp percentage
		if C["UF: Player"]["PercentageTags"] == true then
			local MPpercentage = Power:CreateFontString(nil, "OVERLAY")
			MPpercentage:SetPoint("RIGHT", Power, "LEFT", -2, 0)
			MPpercentage:SetAlpha(1)
			MPpercentage:SetJustifyH("RIGHT")
			MPpercentage:SetFontObject(PowerFont)
			MPpercentage:SetScale(PowerFontSize)
			self:Tag(MPpercentage, "[perpp]%")
			
			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
				MPpercentage:ClearAllPoints()
				MPpercentage:SetPoint("BOTTOM", Power, "TOP", 0, 4)
			end
		end

		-- additional power
		if T.Retail then
			AdditionalPower:ClearAllPoints()
			AdditionalPower:SetAlpha(0)
			AdditionalPower:SetPoint("RIGHT", Health, "TOPRIGHT", -10, 0)
			AdditionalPower:SetStatusBarTexture(PowerTexture)
			AdditionalPower:SetParent(Health)
			AdditionalPower:SetFrameLevel(15)
			AdditionalPower:SetFrameStrata("MEDIUM")
			AdditionalPower.Backdrop:CreateShadow()
			if C["General"]["ClassShadowExcludeUF"] then
				AdditionalPower.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
			end
			AdditionalPower:SetHeight(PowerHeight-4)
			AdditionalPower:SetWidth(PowerWidth)
			
			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
				AdditionalPower:ClearAllPoints()
				AdditionalPower:SetPoint("BOTTOM", Health, "BOTTOMRIGHT", 0, 10)
				AdditionalPower:SetHeight(PowerWidth)
				AdditionalPower:SetWidth(PowerHeight-4)
				AdditionalPower:SetOrientation("VERTICAL")
			end
			
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
		
		-- panel
		Panel:Hide()
	
		-- name
		local Playername = Health:CreateFontString(nil, "OVERLAY")
		Playername:SetPoint("TOPRIGHT", Health, "BOTTOMRIGHT", 0, -10)
		Playername:SetAlpha(1)
		Playername:SetJustifyH("RIGHT")
		Playername:SetFontObject(NameFont)
		Playername:SetScale(NameFontSize)
		self:Tag(Playername, "[Tukui:GetNameColor][Tukui:NameLong] [Tukui:DiffColor][level] [shortclassification][pvp]")

		-- vertical Frame adjustments
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
			Playername:ClearAllPoints()
			Playername:SetPoint("TOPRIGHT", Health, "BOTTOMRIGHT", 0, -10)
			Health:SetOrientation("VERTICAL")
			Health.Value:ClearAllPoints()
			Health.Value:SetPoint("TOPRIGHT", Playername, "BOTTOMRIGHT", -4, -4)
			Health.Value:SetJustifyH("RIGHT")
			Power.Value:ClearAllPoints()
			Power.Value:SetPoint("TOPRIGHT", Health.Value, "BOTTOMRIGHT", -0, -4)
		end

		-- castbar
		if C["UF: Player"]["CastBar"] == true then
			CastBar.Spark:Kill()

			CastBar:ClearAllPoints()
			CastBar:SetAllPoints(Power)
			CastBar:SetFrameStrata("MEDIUM")
			CastBar:SetFrameLevel(20)
			CastBar:SetStatusBarTexture(CastBarTexture)
			CastBar.Background:SetTexture(0,0,0,1)
			CastBar:CreateBackdrop()
			if C["General"]["ClassShadowExcludeUF"] then
				CastBar.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
			end

			if C["UF: Player"]["CastBarIcon"] == true then
				CastBar.Button:ClearAllPoints()
				CastBar.Button:SetWidth(PowerHeight+4)
				CastBar.Button:SetHeight(PowerHeight+4)
				CastBar.Button:SetPoint("RIGHT", CastBar, "LEFT", -8, 0)
				CastBar.Button:CreateShadow()
				if C["General"]["ClassShadowExcludeUF"] then
					CastBar.Button.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
				end
				
				CastBar.Icon:SetInside()
				CastBar.Icon:SetTexCoord(unpack(T.IconCoord))
			else
				CastBar.Button:Hide()
			end
			
			CastBar.Text:ClearAllPoints()
			CastBar.Text:SetPoint("BOTTOMRIGHT", CastBar, "TOPRIGHT", 0, 4)
			CastBar.Text:SetWidth(PowerWidth, 10)
			CastBar.Text:SetJustifyH("RIGHT")
			CastBar.Text:SetFontObject(CastFont)
			CastBar.Text:SetScale(CastFontSize)
			
			CastBar.Time:ClearAllPoints()
			CastBar.Time:SetPoint("RIGHT", CastBar, "RIGHT", -4, 0)
			CastBar.Time:SetJustifyH("RIGHT")
			CastBar.Time:SetFontObject(CastFont)
			CastBar.Time:SetScale(CastFontSize)

			-- unlink from UF
			if C["UF: Player"]["CastBarUnlink"] == true then
				Movers:RegisterFrame(CastBar)
				CastBar:SetOrientation("HORIZONTAL")

				CastBar:ClearAllPoints()
				CastBar:SetWidth(CastWidth)
				CastBar:SetHeight(CastHeight)
				CastBar.Backdrop:SetOutside()
				CastBar:SetPoint("TOPRIGHT", Playername, "BOTTOMRIGHT", 0, -4)
				
				if C["UF: Player"]["CastBarIcon"] == true then
					CastBar.Button:ClearAllPoints()
					CastBar.Button:SetWidth(CastHeight + 4 + 12)
					CastBar.Button:SetHeight(CastHeight + 4 + 12)
					CastBar.Button:SetPoint("TOPRIGHT", Playername, "BOTTOMRIGHT", 0, -4)
				
					CastBar:ClearAllPoints()
					CastBar:SetWidth(CastWidth-32)
					CastBar:SetPoint("TOPRIGHT", CastBar.Button, "TOPLEFT", -4, -1)
				end
				
				CastBar.Text:ClearAllPoints()
				CastBar.Text:SetPoint("TOPRIGHT", CastBar, "BOTTOMRIGHT", 0, -2)
				CastBar.Text:SetWidth(CastWidth)
				CastBar.Text:SetHeight(12)
				
				CastBar.Time:ClearAllPoints()
				CastBar.Time:SetPoint("RIGHT", CastBar, "RIGHT", -4, 0)
			end
			
			-- Vertical Unitframes
			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then

				if C["UF: Player"]["CastBarIcon"] == true then
					CastBar.Button:ClearAllPoints()
					CastBar.Button:SetWidth(HealthHeight)
					CastBar.Button:SetHeight(HealthHeight)
					CastBar.Button:SetPoint("TOPRIGHT", Power.Value or Health.Value or Playername, "BOTTOMRIGHT", 4, -4)
				end

				if C["UF: Player"]["CastBarUnlink"] == false then
					CastBar:SetOrientation("VERTICAL")
					CastBar.Text:SetWidth(250)
					CastBar.Text:SetHeight(12)

					if C["UF: Player"]["CastBarIcon"] == true then
						CastBar.Text:ClearAllPoints()
						CastBar.Text:SetPoint("TOPRIGHT", CastBar.Button, "TOPLEFT", -4, 0)
						CastBar.Time:ClearAllPoints()
						CastBar.Time:SetPoint("TOPRIGHT", CastBar.Text, "BOTTOMRIGHT", 0, -4)
					else
						CastBar.Text:ClearAllPoints()
						CastBar.Time:ClearAllPoints()
						
						if C["UF: Player"]["HealthPowerValue"] == true then						
							CastBar.Text:SetPoint("TOPRIGHT", Power.Value, "BOTTOMRIGHT", 0, -4)
							CastBar.Time:SetPoint("TOPRIGHT", CastBar.Text, "BOTTOMRIGHT", 0, -4)
						else
							CastBar.Text:SetPoint("TOPRIGHT", Playername, "BOTTOMRIGHT", 0, -4)
							CastBar.Time:SetPoint("TOPRIGHT", CastBar.Text, "BOTTOMRIGHT", 0, -4)
						end
					end	
				else
					CastBar.Backdrop:SetOutside()
					if C["UF: Player"]["CastBarIcon"] == true then
						CastBar:SetPoint("TOPRIGHT", CastBar.Button, "TOPLEFT", -4, -1)
					else
						if C["UF: Player"]["HealthPowerValue"] == true then						
							CastBar:SetPoint("TOPRIGHT", Power.Value, "BOTTOMRIGHT", 0, -4)
							CastBar.Text:ClearAllPoints()
							CastBar.Text:SetPoint("TOPRIGHT", CastBar, "BOTTOMRIGHT", 0, -4)
						else
							CastBar:SetPoint("TOPRIGHT", Playername, "BOTTOMRIGHT", 0, -4)
							CastBar.Text:ClearAllPoints()
							CastBar.Text:SetPoint("TOPRIGHT", CastBar, "BOTTOMRIGHT", 0, -4)
						end
					end
				end
			end

			-- actionbar linked player castbar in Healer layout
			if C["UF: Player"]["CenteredHealer"] == true and C["Layout"]["LayoutRole"]["Value"] == "Healer" and C["UF: Player"]["CastBarUnlink"] == true then
				CastBar:ClearAllPoints()
				
				CastBar:SetPoint("BOTTOMLEFT", ActionBar1, "TOPLEFT", 23, 6)
				CastBar:SetPoint("BOTTOMRIGHT", ActionBar1, "TOPRIGHT", 0, 6)
				CastBar:SetWidth(CastWidth)
				CastBar:SetHeight(CastHeight)
				CastBar.Backdrop:SetOutside()
			
				CastBar.Text:ClearAllPoints()
				CastBar.Text:SetPoint("LEFT", CastBar, "LEFT", 4, 0)
				CastBar.Text:SetJustifyH("LEFT")
				
				if C["UF: Player"]["CastBarIcon"] == true then
					CastBar.Button:ClearAllPoints()
					CastBar.Button:SetWidth(CastHeight+2)
					CastBar.Button:SetHeight(CastHeight+2)
					CastBar.Button:SetPoint("RIGHT", CastBar, "LEFT", -8, 0)
				end
				
				if C["Layout"]["LayoutAB"]["Value"] == "Single" then
					CastBar.Text:ClearAllPoints()
					CastBar.Text:SetPoint("BOTTOMLEFT", CastBar, "TOPLEFT", 0, 2)
					CastBar.Text:SetJustifyH("LEFT")
					CastBar.Text:SetWidth(CastBar:GetWidth())
				end

				if C["Layout"]["LayoutAB"]["Value"] == "Double" then
					CastBar:SetPoint("BOTTOMLEFT", ActionBar1, "TOPLEFT", 23, 6)
					CastBar:SetPoint("BOTTOMRIGHT", ActionBar4, "TOPRIGHT", 0, 6)
				end
			end
		else
			CastBar:Kill()
		end	
		
		-- raidicon
		if C["UF: Player"]["RaidIcon"] then
			RaidIcon:ClearAllPoints()
			RaidIcon:SetWidth(RaidIconSize)
			RaidIcon:SetHeight(RaidIconSize)
			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
				RaidIcon:SetPoint("BOTTOM", Power, "TOP", 0, 16)
			else
				RaidIcon:SetPoint("RIGHT", Playername, "LEFT", -26, 0)
			end
		else
			RaidIcon:Kill()
		end

		-- roleicon
		if T.Retail then
			if C["UF: Player"]["RoleIcon"] == true then
				local GroupRoleIndicator = Health:CreateTexture(nil, "OVERLAY")
				
				if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
					GroupRoleIndicator:SetPoint("TOP", Health, "BOTTOM", 0, -4)
					GroupRoleIndicator:SetWidth(RoleIconSize)
					GroupRoleIndicator:SetHeight(RoleIconSize)
				else
					GroupRoleIndicator:SetPoint("RIGHT", Playername, "LEFT", -2, 0)
					GroupRoleIndicator:SetHeight(RoleIconSize)
					GroupRoleIndicator:SetWidth(RoleIconSize)
				end
				
				if C["UnitFrames"]["Roles"]["Value"] == "MaxUI Style" or C["UnitFrames"]["Roles"]["Value"] == "Elvui Style" then
					GroupRoleIndicator.Override = UnitFrames.SetGridGroupRole
				end
				self.GroupRoleIndicator = GroupRoleIndicator
			end
		end
		
		-- combat feedback text
		if (C.UnitFrames.CombatLog) then
			local CombatFeedbackText = Health:CreateFontString(nil, "OVERLAY", 7)
			CombatFeedbackText:SetFontObject(HealthFont)
			CombatFeedbackText:SetScale(HealthFontSize)
			
			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
				CombatFeedbackText:SetPoint("BOTTOM", Health, "TOP", 0, 18)
			else
				CombatFeedbackText:SetPoint("BOTTOM", Health, "TOP", 0, 5)
			end
			
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

		-- combat indicator
		if C["UF: Player"]["CombatIcon"] then
			Combat:ClearAllPoints()
			Combat:SetTexture([[Interface\AddOns\MaxUI\Medias\MaxUI\combaticonv3.tga]])
			Combat:SetSize(C["UF: Player"]["CombatIconSize"], C["UF: Player"]["CombatIconSize"]-1)
			Combat:SetVertexColor(unpack(C["UF: Player"]["CombatIconColor"]))
			Combat:SetPoint("RIGHT", Health, "RIGHT", -4, 0)
			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
				Combat:ClearAllPoints()
				Combat:SetPoint("TOP", Health, "TOP", 0, -10)
			end
		else
			Combat:Kill()
		end
		
		-- leader
		if C["UF: Player"]["LeaderIcon"] then
			Leader:SetSize(C["UF: Player"]["LeaderIconSize"], C["UF: Player"]["LeaderIconSize"])
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
			Status:Hide()
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

		-- Buffs and Debuffs
		if C.UnitFrames.PlayerBuffs and C.UnitFrames.PlayerAuraBars then
			AuraBars:ClearAllPoints()
			AuraBars:SetPoint("BOTTOMRIGHT", Health, "TOPRIGHT", 0, 40)
			AuraBars:SetHeight(AuraBarsHeight)
			AuraBars:SetWidth(AuraBarsWidth+AuraBarsHeight+AuraBars.gap)
			
			AuraBars.auraBarTexture = HealthTexture
			AuraBars.PostCreateBar = UnitFrames.PostCreateAuraBar
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
			
			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
				AuraBars:ClearAllPoints()
				AuraBars:SetPoint("BOTTOMRIGHT", Health, "BOTTOMLEFT", -32, 0)
			end
			
			-- Debuffs anchorframe
			local Debuffs = CreateFrame("Frame", self:GetName().."Debuffs", self)
			Debuffs:SetFrameStrata(self:GetFrameStrata())
			Debuffs:ClearAllPoints()
			Debuffs:SetPoint("BOTTOMRIGHT", Health, "TOPRIGHT", 2, 28)
			Debuffs:SetParent(Health)
			Debuffs:SetHeight(C["UF: Player"]["DebuffSize"]*C["UF: Player"]["DebuffNumberRows"])
			Debuffs:SetWidth(HealthWidth)
			
			-- Debuffs icons
			Debuffs.size = C["UF: Player"]["DebuffSize"]
			Debuffs.num = C["UF: Player"]["DebuffNumber"]
			Debuffs.numRow = C["UF: Player"]["DebuffNumberRows"]
			Debuffs.spacing = C["UF: Player"]["DebuffSpacing"]
			Debuffs.initialAnchor = "TOPRIGHT"
			Debuffs["growth-y"] = "UP"
			Debuffs["growth-x"] = "LEFT"
			Debuffs.PostCreateIcon = UnitFrames.PostCreateAura
			Debuffs.PostUpdateIcon = UnitFrames.PostUpdateAura
			Debuffs.onlyShowPlayer = false
			Movers:RegisterFrame(Debuffs, "Player Debuffs")

			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
				Debuffs.initialAnchor = "BOTTOMLEFT"
				Debuffs["growth-y"] = "RIGHT"
				Debuffs["growth-x"] = "UP"
				Debuffs:ClearAllPoints()
				Debuffs:SetHeight(HealthWidth)
				Debuffs:SetWidth(C["UF: Player"]["DebuffSize"]*C["UF: Player"]["DebuffNumberRows"])
				Debuffs:SetPoint("BOTTOMLEFT", Health, "BOTTOMRIGHT", 20, 0)
			end
		end

		-- debuffs
		if C["UnitFrames"]["PlayerDebuffs"] == true and C.UnitFrames.PlayerAuraBars == false then
			
			-- Debuffs anchorframe
			Debuffs:ClearAllPoints()
			Debuffs:SetPoint("BOTTOMRIGHT", Health, "TOPRIGHT", 2, 28)
			Debuffs:SetParent(Health)
			Debuffs:SetHeight(C["UF: Player"]["DebuffSize"]*C["UF: Player"]["DebuffNumberRows"])
			Debuffs:SetWidth(HealthWidth)
			
			-- Debuffs icons
			Debuffs.size = C["UF: Player"]["DebuffSize"]
			Debuffs.num = C["UF: Player"]["DebuffNumber"]
			Debuffs.numRow = C["UF: Player"]["DebuffNumberRows"]
			Debuffs.spacing = C["UF: Player"]["DebuffSpacing"]
			Debuffs.initialAnchor = "TOPRIGHT"
			Debuffs["growth-y"] = "UP"
			Debuffs["growth-x"] = "LEFT"
			Debuffs.PostCreateIcon = UnitFrames.PostCreateAura
			Debuffs.PostUpdateIcon = UnitFrames.PostUpdateAura
			Debuffs.onlyShowPlayer = false
			Movers:RegisterFrame(Debuffs, "Player Debuffs")

			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
				Debuffs.initialAnchor = "BOTTOMLEFT"
				Debuffs["growth-y"] = "RIGHT"
				Debuffs["growth-x"] = "UP"
				Debuffs:ClearAllPoints()
				Debuffs:SetHeight(HealthWidth)
				Debuffs:SetWidth(C["UF: Player"]["DebuffSize"]*C["UF: Player"]["DebuffNumberRows"])
				Debuffs:SetPoint("BOTTOMLEFT", Health, "BOTTOMRIGHT", 20, 0)
			end
		end

		-- buffs
		if C["UnitFrames"]["PlayerBuffs"] == true and C.UnitFrames.PlayerAuraBars == false then
			Buffs:ClearAllPoints()
			Buffs:SetFrameStrata(self:GetFrameStrata())
			Buffs:SetParent(Health)
			Buffs:SetHeight(C["UF: Player"]["BuffSize"]*C["UF: Player"]["BuffNumberRows"])
			Buffs:SetWidth(HealthWidth)
			
			-- Buffs icons
			Buffs.size = C["UF: Player"]["BuffSize"]
			Buffs.num = C["UF: Player"]["BuffNumber"]
			Buffs.numRow = C["UF: Player"]["BuffNumberRows"]
			Buffs.spacing = C["UF: Player"]["BuffSpacing"]
			Buffs.initialAnchor = "TOPRIGHT"
			Buffs["growth-y"] = "UP"
			Buffs["growth-x"] = "LEFT"
			Buffs.PostCreateIcon = UnitFrames.PostCreateAura
			Buffs.PostUpdateIcon = UnitFrames.PostUpdateAura
			Buffs.PostUpdate = UnitFrames.UpdateBuffsHeaderPosition
			Buffs.onlyShowPlayer = C["UF: Player"]["OnlySelfBuffs"]

			-- Buffs anchorframe
			if C["UnitFrames"]["PlayerDebuffs"] == true then
				Buffs:SetPoint("BOTTOMRIGHT", Debuffs, "TOPRIGHT", 0, 16)
			else
				Buffs:SetPoint("BOTTOMRIGHT", Health, "TOPRIGHT", 2, 42)
			end

			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
				Buffs.initialAnchor = "BOTTOMRIGHT"
				Buffs["growth-y"] = "LEFT"
				Buffs["growth-x"] = "UP"
				Buffs:SetHeight(HealthWidth)
				Buffs:SetWidth(C["UF: Player"]["BuffSize"]*C["UF: Player"]["BuffNumberRows"])
				Buffs:SetPoint("BOTTOMRIGHT", Health, "BOTTOMLEFT", -20, 0)
			end
			
			Movers:RegisterFrame(Buffs, "Player Buffs")
			
			if C["UF: Player"]["BuffsPlayerCombatState"]["Value"] == "Show" then
				RegisterStateDriver(Buffs, "visibility", "[combat] show;hide")
			end	
			
			if C["UF: Player"]["BuffsPlayerCombatState"]["Value"] == "Hide" then
				RegisterStateDriver(Buffs, "visibility", "[combat] hide;show")
			end	
		end

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
	end
end