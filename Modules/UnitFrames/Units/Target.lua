------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
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
		-- size
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
-- TARGET FRAME
------------------------------------------------------------------------------------------
function UnitFrames:Target()
	-- Tukui
	baseTarget(self)
	
	-- MaxUI
	local Panel = self.Panel
	local Health = self.Health
	local myBar = self.HealthPrediction.myBar
	local otherBar = self.HealthPrediction.otherBar
	local absorbBar = self.HealthPrediction.absorbBar
	local Power = self.Power
	local AltPower = self.AlternativePower
	local Castbar = self.Castbar
	local Name = self.Name
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs
	local Portrait = self.Portrait
	local PortraitBackdrop = self.Portrait.Backdrop
	local PortraitShadow = self.Portrait.Shadow
	local CombatFeedbackText = self.CombatFeedbackText
	
	local RaidIcon = self.RaidTargetIndicator
	local Leader = self.LeaderIndicator
	local MasterLooter = self.MasterLooterIndicator 

	local HealthHeight = C["UF: Target"]["HealthHeight"]
	local HealthWidth = C["UF: Target"]["HealthWidth"]
	local PowerHeight = C["UF: Target"]["PowerHeight"]
	local PowerWidth = C["UF: Target"]["PowerWidth"]
	local CastHeight = C["UF: Target"]["CastHeight"]
	local CastWidth = C["UF: Target"]["CastWidth"]
	local CastFont = T.GetFont(C["UF: Target"]["CastFont"])
	local HealthFont = T.GetFont(C["UF: Target"]["HealthFont"])
	local NameFont = T.GetFont(C["UF: Target"]["NameFont"])
	local PowerFont = T.GetFont(C["UF: Target"]["PowerFont"])
	local CastFontSize = C["UF: Target"]["CastFontSize"]/10
	local HealthFontSize = C["UF: Target"]["HealthFontSize"]/10
	local NameFontSize = C["UF: Target"]["NameFontSize"]/10
	local PowerFontSize = C["UF: Target"]["PowerFontSize"]/10
	local HealthTexture = T.GetTexture(C["UF: Target"]["HealthTexture"])
	local PowerTexture = T.GetTexture(C["UF: Target"]["PowerTexture"])
	local CastBarTexture = T.GetTexture(C["UF: Target"]["CastTexture"])
	local ClassPowerTexture = T.GetTexture(C["ClassOptions"]["ClassPowerTexture"])
	local RoleIconSize = C["UF: Target"]["RoleIconSize"]
	local RaidIconSize = C["UF: Target"]["RaidIconSize"]
	local UnitIsEnemy = UnitIsEnemy
	
------------------------------------------------------------------------------------------
-- PORTRAIT STYLE
------------------------------------------------------------------------------------------
	if (C.UnitFrames.Portrait == true and C["UF: Target"]["PortraitStyle"]["Value"] == "None") then
		Portrait:Kill()
		PortraitBackdrop:Kill()
		PortraitShadow:Kill()

	elseif (C.UnitFrames.Portrait == true and C["UF: Target"]["PortraitStyle"]["Value"] == "Side") then
		if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
			Portrait:ClearAllPoints()
			Portrait:SetParent(Health)
			Portrait:SetPoint("RIGHT", Health, "LEFT", -10, 0)
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
	end

------------------------------------------------------------------------------------------
-- BUFFS AND DEBUFFS
------------------------------------------------------------------------------------------
	if (C.UnitFrames.TargetBuffs) then
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
-- MaxUI UF STYLE
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then

		-- healthbar
		Health:SetStatusBarTexture(HealthTexture)
		Health:SetInside(self)
		
		Health:CreateBackdrop()
		Health.Backdrop:SetBackdropColor(0, 0, 0, 0)
		Health.Backdrop:SetOutside(Health)

		Health.Value:ClearAllPoints()
		Health.Value:SetPoint("RIGHT", Health, "RIGHT", -2, 0)
		Health.Value:SetFontObject(HealthFont)
		Health.Value:SetScale(HealthFontSize)
		self:Tag(Health.Value, C["UnitFrames"]["TargetHealthTag"]["Value"])
	
		-- hp percentage
		if C["UF: Target"]["PercentageTags"] == true then
			local HPpercentage = Health:CreateFontString(nil, "OVERLAY")
			HPpercentage:SetPoint("LEFT", Health, "RIGHT", 5, 0)
			HPpercentage:SetAlpha(1)
			HPpercentage:SetJustifyH("LEFT")
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
		Power:SetPoint("LEFT", Health, "BOTTOMLEFT", 10, 0)
		Power:SetHeight(PowerHeight)
		Power:SetWidth(PowerWidth)
		Power:SetFrameLevel(15)
		Power:SetFrameStrata("MEDIUM")
		Power:SetStatusBarTexture(PowerTexture)
		Power:CreateBackdrop("Default")
		Power.Backdrop:CreateShadow()
		if C["General"]["ClassShadowExcludeUF"] then
			Power.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
		end
		Power.Backdrop:SetOutside(Power)

		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
			Power:ClearAllPoints()
			Power:SetPoint("BOTTOM", Health, "BOTTOMRIGHT", 0, 10)
			Power:SetHeight(PowerWidth)
			Power:SetWidth(PowerHeight)
			Power:SetOrientation("VERTICAL")
		end
		
		Power.Value = Power:CreateFontString(nil, "OVERLAY")
		Power.Value:SetFontObject(PowerFont)
		Power.Value:SetScale(PowerFontSize)
		Power.Value:SetPoint("RIGHT", Power, "RIGHT", -2, 0)
		Power.Value:SetJustifyH("RIGHT")
		self:Tag(Power.Value, C["UF: Target"]["PowerTag"]["Value"])
		
		Power.PostUpdate = nil
		
		-- MPpercentage tag
		if C["UF: Target"]["PercentageTags"] == true then
			local MPpercentage = Power:CreateFontString(nil, "OVERLAY")
			MPpercentage:SetPoint("LEFT", Power, "RIGHT", 4, 0)
			MPpercentage:SetAlpha(1)
			MPpercentage:SetJustifyH("LEFT")
			MPpercentage:SetFontObject(PowerFont)
			MPpercentage:SetScale(PowerFontSize)
			self:Tag(MPpercentage, "[perpp]%")
			
			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
				MPpercentage:ClearAllPoints()
				MPpercentage:SetPoint("BOTTOM", Power, "TOP", 0, 4)
			end
		end

		-- AltPower (boss)
		if T.Retail then
			AltPower:ClearAllPoints()
			AltPower:SetPoint("LEFT", Health, "TOPLEFT", 10, 0)
			AltPower:SetStatusBarTexture(PowerTexture)
			AltPower:SetParent(Health)
			AltPower:SetFrameLevel(15)
			AltPower:SetFrameStrata("MEDIUM")
			AltPower.Backdrop:CreateShadow()
			if C["General"]["ClassShadowExcludeUF"] then
				AltPower.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
			end
			AltPower:SetHeight(PowerHeight-4)
			AltPower:SetWidth(PowerWidth)

			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
				AltPower:ClearAllPoints()
				AltPower:SetPoint("BOTTOM", Health, "BOTTOMLEFT", 0, 10)
				AltPower:SetHeight(PowerWidth)
				AltPower:SetWidth(PowerHeight-4)
				AltPower:SetOrientation("VERTICAL")
			end
		end

		-- panel
		Panel:Hide()
			
		-- name
		Name:ClearAllPoints()
		Name:SetParent(Health)
		Name:SetPoint("TOPLEFT", Health, "BOTTOMLEFT", 4, -10)
		Name:SetAlpha(1)
		Name:SetJustifyH("LEFT")
		Name:SetFontObject(NameFont)
		Name:SetScale(NameFontSize)
		self:Tag(Name, C["UF: Target"]["NameTag"]["Value"]) 

		-- vertical frame adjustments
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
			Health:SetOrientation("VERTICAL")
			Health.Value:ClearAllPoints()
			Health.Value:SetPoint("TOPLEFT", Name, "BOTTOMLEFT", 0, -4)
			Health.Value:SetJustifyH("LEFT")
			Power.Value:ClearAllPoints()
			Power.Value:SetPoint("TOPLEFT", Health.Value, "BOTTOMLEFT", -0, -4)
			Power.Value:SetJustifyH("LEFT")
		end

		-- castbar
		if C["UF: Target"]["CastBar"] == true then
			Castbar.Spark:Kill()

			Castbar:ClearAllPoints()
			Castbar:SetAllPoints(Power)
			Castbar:SetFrameStrata("MEDIUM")
			Castbar:SetFrameLevel(20)
			Castbar:SetStatusBarTexture(CastBarTexture)
			Castbar.Background:SetTexture(0,0,0,1)
			Castbar:CreateBackdrop()
			if C["General"]["ClassShadowExcludeUF"] then
				Castbar.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
			end

			if C["UF: Target"]["CastBarIcon"] == true then
				Castbar.Button:ClearAllPoints()
				Castbar.Button:SetWidth(PowerHeight+4)
				Castbar.Button:SetHeight(PowerHeight+4)
				Castbar.Button:SetPoint("LEFT", Castbar, "RIGHT", 8, 0)
				Castbar.Button:CreateShadow()
				if C["General"]["ClassShadowExcludeUF"] then
					Castbar.Button.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
				end

				Castbar.Icon:SetInside()
				Castbar.Icon:SetTexCoord(unpack(T.IconCoord))
			else
				Castbar.Button:Hide()
			end
			
			Castbar.Text:ClearAllPoints()
			Castbar.Text:SetPoint("BOTTOMLEFT", Castbar, "TOPLEFT", 0, 4)
			Castbar.Text:SetWidth(PowerWidth, 10)
			Castbar.Text:SetJustifyH("LEFT")
			Castbar.Text:SetFontObject(CastFont)
			Castbar.Text:SetScale(CastFontSize)
			
			Castbar.Time:ClearAllPoints()
			Castbar.Time:SetPoint("RIGHT", Castbar, "RIGHT", -4, 0)
			Castbar.Time:SetJustifyH("RIGHT")
			Castbar.Time:SetFontObject(CastFont)
			Castbar.Time:SetScale(CastFontSize)
		
			-- unlink from UF
			if C["UF: Target"]["CastBarUnlink"] == true then
				Movers:RegisterFrame(Castbar)
				Castbar:SetOrientation("HORIZONTAL")

				Castbar:ClearAllPoints()
				Castbar:SetWidth(CastWidth)
				Castbar:SetHeight(CastHeight)
				Castbar.Backdrop:SetOutside()
				Castbar:SetPoint("TOPLEFT", Name, "BOTTOMLEFT", 0, -4)
				
				if C["UF: Target"]["CastBarIcon"] == true then
					Castbar.Button:ClearAllPoints()
					Castbar.Button:SetWidth(CastHeight + 4 + 12)
					Castbar.Button:SetHeight(CastHeight + 4 + 12)
					Castbar.Button:SetPoint("TOPLEFT", Name, "BOTTOMLEFT", -4, -4)
					
					Castbar:ClearAllPoints()
					Castbar:SetWidth(CastWidth-32)
					Castbar:SetPoint("TOPLEFT", Castbar.Button, "TOPRIGHT", 4, -1)
				end
				
				Castbar.Text:ClearAllPoints()
				Castbar.Text:SetPoint("TOPLEFT", Castbar, "BOTTOMLEFT", 0, -2)
				Castbar.Text:SetWidth(CastWidth)
				Castbar.Text:SetHeight(12)
				
				Castbar.Time:ClearAllPoints()
				Castbar.Time:SetPoint("RIGHT", Castbar, "RIGHT", -4, 0)
			end
			
			-- Vertical Unitframes
			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then

				if C["UF: Target"]["CastBarIcon"] == true then
					Castbar.Button:ClearAllPoints()
					Castbar.Button:SetWidth(HealthHeight)
					Castbar.Button:SetHeight(HealthHeight)
					Castbar.Button:SetPoint("TOPLEFT", Power.Value or Health.Value or Playername, "BOTTOMLEFT", -4, -4)
				end
				
				if C["UF: Target"]["CastBarUnlink"] == false then
					Castbar:SetOrientation("VERTICAL")
					Castbar.Text:SetWidth(250)
					Castbar.Text:SetHeight(12)

					if C["UF: Target"]["CastBarIcon"] == true then
						Castbar.Text:ClearAllPoints()
						Castbar.Text:SetPoint("TOPLEFT", Castbar.Button, "TOPRIGHT", 4, 0)
						Castbar.Time:ClearAllPoints()
						Castbar.Time:SetPoint("TOPLEFT", Castbar.Text, "BOTTOMLEFT", 0, -4)
					else
						Castbar.Time:ClearAllPoints()
						Castbar.Text:ClearAllPoints()
						
						if C["UF: Target"]["HealthPowerValue"] == true then						
							Castbar.Text:SetPoint("TOPLEFT", Power.Value, "BOTTOMLEFT", 0, -4)
							Castbar.Time:SetPoint("TOPLEFT", Castbar.Text, "BOTTOMLEFT", 0, -4)
						else
							Castbar.Text:SetPoint("TOPLEFT", Name, "BOTTOMLEFT", 0, -4)
							Castbar.Time:SetPoint("TOPLEFT", Castbar.Text, "BOTTOMLEFT", 0, -4)
						end
					end
				else
					Castbar.Backdrop:SetOutside()
					if C["UF: Target"]["CastBarIcon"] == true then
						Castbar:SetPoint("TOPLEFT", Castbar.Button, "TOPRIGHT", 4, -1)
					else
						if C["UF: Target"]["HealthPowerValue"] == true then						
							Castbar:SetPoint("TOPLEFT", Power.Value, "BOTTOMLEFT", 0, -4)
							Castbar.Text:SetPoint("TOPLEFT", Castbar, "BOTTOMLEFT", 0, -4)
						else
							Castbar:SetPoint("TOPLEFT", Name, "BOTTOMLEFT", 0, -4)
							Castbar.Text:SetPoint("TOPLEFT", Castbar, "BOTTOMLEFT", 0, -4)
						end
					end					
				end
			end
		else
			Castbar:Kill()
		end

		-- raid icon
		if C["UF: Target"]["RaidIcon"] == true then
			RaidIcon:ClearAllPoints()
			RaidIcon:SetWidth(RaidIconSize)
			RaidIcon:SetHeight(RaidIconSize)
			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
				RaidIcon:SetPoint("BOTTOM", Power, "TOP", 0, 16)
			else
				RaidIcon:SetPoint("LEFT", Name, "RIGHT", 26, 0)
			end
		else
			RaidIcon:ClearAllPoints()
		end
		
		-- roll icon
		if T.Retail then
			if C["UF: Target"]["RoleIcon"] == true then
				local GroupRoleIndicator = Health:CreateTexture(nil, "OVERLAY")
				
				if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
					GroupRoleIndicator:SetPoint("TOP", Health, "BOTTOM", 0, -4)
					GroupRoleIndicator:SetWidth(RoleIconSize)
					GroupRoleIndicator:SetHeight(RoleIconSize)
				else
					GroupRoleIndicator:SetPoint("LEFT", Name, "RIGHT", -0, 0)
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

		-- highlighting
		self:HookScript("OnEnter", function(self)
			Health.Backdrop:SetBorderColor(Health:GetStatusBarColor())
			Power.Backdrop:SetBorderColor(Power:GetStatusBarColor())
			if C.UnitFrames.Portrait then
				Portrait:SetBorderColor(Health:GetStatusBarColor())
			end	
		end)

		self:HookScript("OnLeave", function(self)
			Health.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
			Power.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
			if C.UnitFrames.Portrait then
				Portrait:SetBorderColor(unpack(C["General"]["BorderColor"]))
			end
		end)

		-- Debuffs
		if C["UnitFrames"]["TargetDebuffs"] == true then
			
			-- Debuffs anchorframe
			Debuffs:ClearAllPoints()
			Debuffs:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", -2, 28)
			Debuffs:SetParent(Health)
			Debuffs:SetHeight(C["UF: Target"]["DebuffSize"]*C["UF: Target"]["DebuffNumberRows"])
			Debuffs:SetWidth(HealthWidth)
			
			-- debuffs icons
			Debuffs.size = C["UF: Target"]["DebuffSize"]
			Debuffs.num = C["UF: Target"]["DebuffNumber"]
			Debuffs.numRow = C["UF: Target"]["DebuffNumberRows"]
			Debuffs.spacing = C["UF: Target"]["DebuffSpacing"]
			Debuffs.onlyShowPlayer = C["UF: Target"].OnlySelfDebuffs
			Debuffs.initialAnchor = "TOPLEFT"
			Debuffs["growth-y"] = "UP"
			Debuffs["growth-x"] = "RIGHT"
			Movers:RegisterFrame(Debuffs, "Target Debuffs")

			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
				Debuffs.initialAnchor = "BOTTOMRIGHT"
				Debuffs["growth-y"] = "LEFT"
				Debuffs["growth-x"] = "UP"
				Debuffs:SetHeight(HealthWidth)
				Debuffs:SetWidth(C["UF: Target"]["DebuffSize"]*C["UF: Target"]["DebuffNumberRows"])
				Debuffs:ClearAllPoints()
				Debuffs:SetPoint("BOTTOMRIGHT", Health, "BOTTOMLEFT", -20, 0)
			end
		end

		-- Buffs
		if C["UnitFrames"]["TargetBuffs"] == true then
			
			-- Buffs  anchorframe
			Buffs:ClearAllPoints()
			if C["UnitFrames"]["TargetDebuffs"] == true then
				Buffs:SetPoint("BOTTOMLEFT", Debuffs, "TOPLEFT", 0, 16)
			else
				Buffs:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", -2, 42)
			end
			Buffs:SetParent(Health)
			Buffs:SetHeight(C["UF: Target"]["BuffSize"]*C["UF: Target"]["BuffNumberRows"])
			Buffs:SetWidth(HealthWidth)
			
			-- Buffs icons
			Buffs.size = C["UF: Target"]["BuffSize"]
			Buffs.num = C["UF: Target"]["BuffNumber"]
			Buffs.numRow = C["UF: Target"]["BuffNumberRows"]
			Buffs.spacing = C["UF: Target"]["BuffSpacing"]
			Buffs.initialAnchor = "TOPLEFT"
			Buffs["growth-y"] = "UP"
			Buffs["growth-x"] = "RIGHT"
			Buffs.onlyShowPlayer = C["UF: Target"].OnlySelfBuffs
			Buffs.PostUpdate = UnitFrames.UpdateBuffsHeaderPosition
			Movers:RegisterFrame(Buffs, "Target Buffs")

			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
				Buffs.initialAnchor = "BOTTOMLEFT"
				Buffs["growth-y"] = "RIGHT"
				Buffs["growth-x"] = "UP"
				Buffs:SetHeight(HealthWidth)
				Buffs:SetWidth(C["UF: Target"]["BuffSize"]*C["UF: Target"]["BuffNumberRows"])
				Buffs:SetPoint("BOTTOMLEFT", Health, "BOTTOMRIGHT", 20, 0)
			end
			
			-- In Combat State
			if C["UF: Target"]["BuffsTargetCombatState"]["Value"] == "Show" then
				RegisterStateDriver(Buffs, "visibility", "[combat] show;hide")
			end	
			
			if C["UF: Target"]["BuffsTargetCombatState"]["Value"] == "Hide" then
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