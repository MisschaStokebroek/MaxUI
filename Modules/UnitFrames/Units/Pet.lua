------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up PET FRAMES.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T.UnitFrames	
local basePet = UnitFrames.Pet
local Movers = T["Movers"]

------------------------------------------------------------------------------------------
-- PET FRAME SETUP POSITION AND BASIC SIZE
------------------------------------------------------------------------------------------
local function CreateUnits()	
	local Pet = UnitFrames.Units.Pet
	local Player = UnitFrames.Units.Player
	
	if not C["UnitFrames"]["Enable"] == true then return end

	if C["UF: Pet"]["Enable"] ~= true then
		Pet:Kill()
	end	

------------------------------------------------------------------------------------------
-- PET FRAME SIZE
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		Pet:SetHeight(C["UF: Pet"]["HealthHeight"])
		Pet:SetWidth(C["UF: Pet"]["HealthWidth"])
		
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
			Pet:SetHeight(C["UF: Pet"]["HealthWidth"])
			Pet:SetWidth(C["UF: Pet"]["HealthHeight"])
		end	
	end	
		
------------------------------------------------------------------------------------------
-- PET FRAME POSITION 
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		Pet:ClearAllPoints()
		Pet:SetPoint("TOP", MaxUIUnitframesAnchor, "BOTTOM", 0, -24)

		-- tukui
		if C["Layout"]["LayoutRole"]["Value"] == "Tukui" then

		-- melee or tank
		elseif (C["Layout"]["LayoutRole"]["Value"] == "Melee") or (C["Layout"]["LayoutRole"]["Value"] == "Tank") then 
			Pet:ClearAllPoints()
			if C["UF: Pet"]["PortraitStyle"]["Value"] == "Side" then
				Pet:SetPoint("TOPRIGHT", Player, "TOPLEFT", -82, 0)
			else
				Pet:SetPoint("TOPRIGHT", Player, "TOPLEFT", -60, 0)
			end	
		
		-- healing 
		elseif C["Layout"]["LayoutRole"]["Value"] == "Healer" then 
			Pet:ClearAllPoints()
			if C["UF: Pet"]["PortraitStyle"]["Value"] == "Side" then
				Pet:SetPoint("TOPRIGHT", Player, "TOPLEFT", -82, 0)
			else
				Pet:SetPoint("TOPRIGHT", Player, "TOPLEFT", -60, 0)
			end	
			
		-- range
		elseif C["Layout"]["LayoutRole"]["Value"] == "Range" then 
			
			if C["Layout"]["LayoutAB"]["Value"] == "Single" or C["Layout"]["LayoutAB"]["Value"] == "Double" then
				Pet:ClearAllPoints()
				if C["UF: Pet"]["PortraitStyle"]["Value"] == "Side" then
					Pet:SetPoint("TOPRIGHT", Player, "TOPLEFT", -82, 0)
				else
					Pet:SetPoint("TOPRIGHT", Player, "TOPLEFT", -60, 0)
				end	
			end
			
		-- center chat
		elseif C["Layout"]["LayoutRole"]["Value"] == "CenterChat" then 

		end
		
		-- Vertical UnitFrames
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" and C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
			Pet:ClearAllPoints()
			Pet:SetPoint("RIGHT", Player, "LEFT", -70, 10)
		end
	end	
end	
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- PET FRAME
------------------------------------------------------------------------------------------
function UnitFrames:Pet()
	-- Tukui
	basePet(self)
	
	-- MaxUI
	local Health = self.Health
	local Power = self.Power
	local myBar = self.HealthPrediction.myBar
	local otherBar = self.HealthPrediction.otherBar
	local absorbBar = self.HealthPrediction.absorbBar
	local HealthHeight = C["UF: Pet"]["HealthHeight"]
	local CastBar = self.Castbar
	local Name = self.Name
	local Panel = self.Panel
	local RaidIcon = self.RaidTargetIndicator
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs

	local HealthWidth = C["UF: Pet"]["HealthWidth"]
	local PowerHeight = C["UF: Pet"]["PowerHeight"]
	local PowerWidth = C["UF: Pet"]["PowerWidth"]
	local CastHeight = C["UF: Pet"]["CastHeight"]
	local CastWidth = C["UF: Pet"]["CastWidth"]
	local NameFont = T.GetFont(C["UF: Pet"]["NameFont"])
	local HealthFont = T.GetFont(C["UF: Pet"]["HealthFont"])
	local PowerFont = T.GetFont(C["UF: Pet"]["PowerFont"])
	local CastFont = T.GetFont(C["UF: Pet"]["CastFont"])
	local HealthFontSize = C["UF: Pet"]["HealthFontSize"]/10
	local NameFontSize = C["UF: Pet"]["NameFontSize"]/10
	local PowerFontSize = C["UF: Pet"]["PowerFontSize"]/10
	local CastFontSize = C["UF: Pet"]["CastFontSize"]/10
	local HealthTexture = T.GetTexture(C["UF: Pet"]["HealthTexture"])
	local PowerTexture = T.GetTexture(C["UF: Pet"]["PowerTexture"])
	local CastBarTexture = T.GetTexture(C["UF: Pet"]["CastTexture"])

------------------------------------------------------------------------------------------
-- PORTRAIT STYLE
------------------------------------------------------------------------------------------
	local Portrait = CreateFrame("PlayerModel", nil, Health)
	self.Portrait = Portrait

	if C["UF: Pet"]["PortraitStyle"]["Value"] == "None" then

	elseif C["UF: Pet"]["PortraitStyle"]["Value"] == "Side" then
		Portrait:SetPoint("LEFT", Health, "RIGHT", 8, 0)
		Portrait:SetWidth(HealthHeight)
		Portrait:SetHeight(HealthHeight-2)
		Portrait:CreateBackdrop()
		Portrait.Backdrop:SetOutside(Portrait)
		Portrait.Backdrop:CreateShadow()
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
			Portrait:Kill()
		end
			
	elseif C["UF: Pet"]["PortraitStyle"]["Value"] == "Overlay" then
		Portrait:SetAllPoints()
		Portrait:SetFrameLevel(3)
		Portrait:SetAlpha(C["UF: Pet"]["PortraitOverlayAlpha"])
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
		Health.colorThreat = C["UF: Target"]["ColorThreat"]
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
	Health.PostUpdate = nil

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
	if C["UF: Pet"]["NonCombatAlphaEnable"] == true then 
		self:HookScript("OnUpdate", function(self)
			if InCombatLockdown() then
				self:SetAlpha(1)
				Health.Background:SetAlpha(1)
			elseif MouseIsOver(self) then
				self:SetAlpha(1)
				Health.Background:SetAlpha(1)
			else
				self:SetAlpha(C["UF: Pet"]["NonCombatAlpha"])
				Health.Background:SetAlpha(C["UF: Pet"]["NonCombatAlpha"])
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
		Health:SetInside(self)
		Health:SetStatusBarTexture(HealthTexture)
		
		Health:CreateBackdrop()
		Health.Backdrop:SetBackdropColor(0, 0, 0, 0)
		Health.Backdrop:SetOutside(Health)

		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
			Health:SetOrientation("VERTICAL")
		end

		Health.Value = Health:CreateFontString(nil, "OVERLAY")
		Health.Value:SetPoint("LEFT", Health, "LEFT", 2, 0)
		Health.Value:SetJustifyH("LEFT")
		Health.Value:SetFontObject(HealthFont)
		Health.Value:SetScale(HealthFontSize)
		self:Tag(Health.Value, C["UF: Pet"]["HealthTag"]["Value"])

		-- power
		Power:ClearAllPoints()
		Power:SetPoint("RIGHT", Health, "BOTTOMRIGHT", -6, 0)
		Power:SetParent(Health)
		Power:SetHeight(PowerHeight)
		Power:SetWidth(PowerWidth)
		Power:SetFrameLevel(8)
		Power:SetFrameStrata("MEDIUM")
		Power:SetStatusBarTexture(PowerTexture)
		Power:CreateBackdrop()
		Power.Backdrop:SetOutside(Power)
		Power.Backdrop:CreateShadow()
		if C["General"]["ClassShadowExcludeUF"] then
			Power.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
		end
	
		Power.Value = Power:CreateFontString(nil, "OVERLAY")
		Power.Value:SetPoint("RIGHT", Power, "RIGHT", -4, 0)
		Power.Value:SetFontObject(PowerFont)
		Power.Value:SetScale(PowerFontSize)
		Power.Value:SetJustifyH("RIGHT")
		self:Tag(Power.Value, C["UF: Pet"]["PowerTag"]["Value"])
		
		Power.colorPower = true
		Power.PostUpdate = nil

		-- infopanel
		Panel:Hide()

		-- Name Pet
		Name:SetParent(Health)
		Name:SetAlpha(1)
		Name:SetFontObject(NameFont)
		Name:SetScale(NameFontSize)
		Name:ClearAllPoints()
		Name:SetPoint("TOPRIGHT", Health, "BOTTOMRIGHT", 0, -10)
		Name:SetJustifyH("RIGHT")
		self:Tag(Name, "[Tukui:GetNameColor][Tukui:NameMedium] [Tukui:DiffColor][level] [classification][pvp]")

		-- percentage tag adjustments
		if C["UF: Pet"]["PercentageTags"] == true then
			local HPpercentage = Health:CreateFontString(nil, "OVERLAY")
			HPpercentage:SetPoint("RIGHT", Health, "LEFT", -2, 0)
			HPpercentage:SetAlpha(1)
			HPpercentage:SetJustifyH("LEFT")
			HPpercentage:SetFontObject(HealthFont)
			HPpercentage:SetScale(HealthFontSize)
			self:Tag(HPpercentage, "[perhp]%")
			
			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
				HPpercentage:ClearAllPoints()
				HPpercentage:SetPoint("BOTTOM", Health, "TOP", 2, 4)
				HPpercentage:SetJustifyH("CENTER")
			end
			
			local MPpercentage = Power:CreateFontString(nil, "OVERLAY")
			MPpercentage:SetPoint("RIGHT", Power, "LEFT", -2, 0)
			MPpercentage:SetAlpha(1)
			MPpercentage:SetJustifyH("LEFT")
			MPpercentage:SetFontObject(PowerFont)
			MPpercentage:SetScale(PowerFontSize)
			self:Tag(MPpercentage, "[perpp]%")
			
			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
				MPpercentage:ClearAllPoints()
				MPpercentage:SetPoint("BOTTOM", Power, "TOP", 2, 4)
				MPpercentage:SetJustifyH("CENTER")
			end
		end

		-- raid icon
		if C["UF: Pet"]["RaidIcon"] == true then
			RaidIcon:ClearAllPoints()
			RaidIcon:SetWidth(C["UF: Pet"]["RaidIconSize"])
			RaidIcon:SetHeight(C["UF: Pet"]["RaidIconSize"])
			RaidIcon:SetPoint("RIGHT", Name, "LEFT", -2, 0)
		else
			RaidIcon:Hide()
		end
	
		-- adjustments for Vertical Unitframes
		if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
			Power:ClearAllPoints()
			Power:SetPoint("BOTTOM", Health, "BOTTOMLEFT", 0, 10)
			Power:SetHeight(PowerWidth)
			Power:SetWidth(PowerHeight)
			Power:SetOrientation("VERTICAL")
			
			Name:ClearAllPoints()
			Name:SetPoint("TOPRIGHT", Health, "BOTTOMRIGHT", 0, -10)
			
			RaidIcon:ClearAllPoints()
			RaidIcon:SetPoint("BOTTOM", Power, "TOP", 0, 16)
			
			Health.Value:ClearAllPoints()
			Health.Value:SetPoint("TOPRIGHT", Name, "BOTTOMRIGHT", -4, -4)
			Health.Value:SetJustifyH("RIGHT")
			Power.Value:ClearAllPoints()
			Power.Value:SetPoint("TOPRIGHT", Health.Value, "BOTTOMRIGHT", -0, -4)
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
		
		-- castbar
		if C["UF: Pet"]["CastBar"] == true then
			CastBar.Spark:Kill()

			CastBar:ClearAllPoints()
			CastBar:SetAllPoints(Power)
			CastBar:SetFrameStrata("MEDIUM")
			CastBar:SetFrameLevel(20)
			CastBar:SetStatusBarTexture(CastBarTexture)
			CastBar.Background:SetTexture(0,0,0,1)
			CastBar:CreateBackdrop()
			if C["General"]["ClassShadowExcludeUF"] then
				CastBar:CreateShadow()
				CastBar.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
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

			if C["UF: Pet"]["CastBarText"] == false then
				CastBar.Text:Hide()
				CastBar.Time:Hide()
			end
		
			-- unlink from UF
			if C["UF: Pet"]["CastBarUnlink"] == true then
				Movers:RegisterFrame(CastBar)
				CastBar:SetOrientation("HORIZONTAL")

				CastBar:ClearAllPoints()
				CastBar:SetWidth(CastWidth)
				CastBar:SetHeight(CastHeight)
				CastBar.Backdrop:SetOutside()
				CastBar:SetPoint("TOPRIGHT", Name, "BOTTOMRIGHT", 0, -4)
				
				CastBar.Text:ClearAllPoints()
				CastBar.Text:SetPoint("TOPRIGHT", CastBar, "BOTTOMRIGHT", 0, -2)
				CastBar.Text:SetWidth(CastWidth)
				CastBar.Text:SetHeight(12)
				
				CastBar.Time:ClearAllPoints()
				CastBar.Time:SetPoint("RIGHT", CastBar, "RIGHT", -4, 0)
			end
			
			-- Vertical Unitframes
			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then

				if C["UF: Pet"]["CastBarUnlink"] == false then
					CastBar:SetOrientation("VERTICAL")
					CastBar.Text:SetWidth(250)
					CastBar.Text:SetHeight(12)
					CastBar.Text:ClearAllPoints()
					CastBar.Text:SetPoint("TOPRIGHT", Power.Value, "BOTTOMRIGHT", 0, -4)
					CastBar.Time:ClearAllPoints()
					CastBar.Time:SetPoint("TOPRIGHT", CastBar.Text, "BOTTOMRIGHT", 0, -4)
				else
					CastBar.Backdrop:SetOutside()
					--if C["UF: Pet"]["HealthPowerValue"] == true then						
						CastBar:SetPoint("TOPRIGHT", Power.Value, "BOTTOMRIGHT", 0, -4)
						CastBar.Text:ClearAllPoints()
						CastBar.Text:SetPoint("TOPRIGHT", CastBar, "BOTTOMRIGHT", 0, -4)
					--else
					--	CastBar:SetPoint("TOPRIGHT", Name, "BOTTOMRIGHT", 0, -4)
					--	CastBar.Text:ClearAllPoints()
					--	CastBar.Text:SetPoint("TOPRIGHT", CastBar, "BOTTOMRIGHT", 0, -4)
					--end
				end
			end
		else
			CastBar:Kill()
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
				myBar:SetWidth(HealthHeight-2)
				myBar:SetHeight(HealthWidth)
				myBar:SetStatusBarTexture(HealthTexture)
				myBar:ClearAllPoints()
				myBar:SetPoint("BOTTOM", Health:GetStatusBarTexture(), "TOP", 0, 0)

				otherBar:SetOrientation("VERTICAL")
				otherBar:SetWidth((HealthHeight-2))
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
		
		-- Buffs and Debuffs
		if (C.UnitFrames.PetAuras) then
		
			-- Debuffs
			if C["UF: Pet"]["Debuffs"] == true then
				-- Debuffs anchorframe
				Debuffs:ClearAllPoints()
				Debuffs:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", 2, 14)
				Debuffs:SetParent(Health)
				Debuffs:SetHeight(C["UF: Pet"]["DebuffSize"]*C["UF: Pet"]["DebuffNumberRows"])
				Debuffs:SetWidth(HealthWidth)
				
				-- Debuffs icons
				Debuffs.size = C["UF: Pet"]["DebuffSize"]
				Debuffs.num = C["UF: Pet"]["DebuffNumber"]
				Debuffs.numRow = C["UF: Pet"]["DebuffNumberRows"]
				Debuffs.spacing = C["UF: Pet"]["DebuffSpacing"]
				Debuffs.initialAnchor = "TOPLEFT"
				Debuffs["growth-y"] = "UP"
				Debuffs["growth-x"] = "RIGHT"
				Debuffs.PostCreateIcon = UnitFrames.PostCreateAura
				Debuffs.PostUpdateIcon = UnitFrames.PostUpdateAura
				Movers:RegisterFrame(Debuffs, "Pet Debuffs")

				if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
					Debuffs.initialAnchor = "BOTTOMRIGHT"
					Debuffs["growth-y"] = "LEFT"
					Debuffs["growth-x"] = "UP"
					Debuffs:ClearAllPoints()
					Debuffs:SetHeight(HealthWidth)
					Debuffs:SetWidth(C["UF: Pet"]["DebuffSize"]*C["UF: Pet"]["DebuffNumberRows"])
					Debuffs:SetPoint("BOTTOMRIGHT", Health, "BOTTOMLEFT", -14, 0)
				end
			else
				Debuffs.num = 0
			end
			
			-- Buffs
			if C["UF: Pet"]["Buffs"] == true then
				Buffs:ClearAllPoints()
				Buffs:SetFrameStrata(self:GetFrameStrata())
				Buffs:SetParent(Health)
				Buffs:SetHeight(C["UF: Pet"]["BuffSize"]*C["UF: Pet"]["BuffNumberRows"])
				Buffs:SetWidth(HealthWidth)
				
				-- Buffs icons
				Buffs.size = C["UF: Pet"]["BuffSize"]
				Buffs.num = C["UF: Pet"]["BuffNumber"]
				Buffs.numRow = C["UF: Pet"]["BuffNumberRows"]
				Buffs.spacing = C["UF: Pet"]["BuffSpacing"]
				Buffs.initialAnchor = "TOPLEFT"
				Buffs["growth-y"] = "UP"
				Buffs["growth-x"] = "RIGHT"
				Buffs.PostCreateIcon = UnitFrames.PostCreateAura
				Buffs.PostUpdateIcon = UnitFrames.PostUpdateAura
				Buffs.PostUpdate = UnitFrames.UpdateBuffsHeaderPosition
				Buffs.onlyShowPlayer = C["UF: Pet"]["OnlySelfBuffs"]

				-- Buffs anchorframe
				if C["UF: Pet"]["Debuffs"] == true then
					Buffs:SetPoint("BOTTOMLEFT", Debuffs, "TOPLEFT", 0, 14)
				else
					Buffs:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", 2, 42)
				end

				if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
					Buffs.initialAnchor = "BOTTOMRIGHT"
					Buffs["growth-y"] = "LEFT"
					Buffs["growth-x"] = "UP"
					Buffs:ClearAllPoints()
					Buffs:SetHeight(HealthWidth)
					Buffs:SetWidth(C["UF: Pet"]["BuffSize"]*C["UF: Pet"]["BuffNumberRows"])
					
					-- Buffs anchorframe
					if C["UF: Pet"]["Debuffs"] == true then
						Buffs:SetPoint("BOTTOMRIGHT", Debuffs, "BOTTOMLEFT", -8, 0)
					else
						Buffs:SetPoint("BOTTOMRIGHT", Health, "BOTTOMLEFT", -14, 0)
					end
				end
				
				Movers:RegisterFrame(Buffs, "Pet Buffs")
				
				if C["UF: Pet"]["BuffsPetCombatState"]["Value"] == "Show" then
					RegisterStateDriver(Buffs, "visibility", "[combat] show;hide")
				end	
				
				if C["UF: Pet"]["BuffsPetCombatState"]["Value"] == "Hide" then
					RegisterStateDriver(Buffs, "visibility", "[combat] hide;show")
				end	
			else
				Buffs.num = 0
			end
		end
	end
end