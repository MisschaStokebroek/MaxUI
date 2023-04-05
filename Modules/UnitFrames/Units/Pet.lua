------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-10-2022
------------------------------------------------------------------------------------------

-- setting up PET FRAMES.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T.UnitFrames	
local Movers = T["Movers"]
local basePet = UnitFrames.Pet

------------------------------------------------------------------------------------------
-- PET FRAME SETUP
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
			if C.UnitFrames.Portrait == true and C["UF: Pet"]["PortraitStyle"]["Value"] == "Side" then
				Pet:SetPoint("TOPRIGHT", Player, "TOPLEFT", -82, 0)
			else
				Pet:SetPoint("TOPRIGHT", Player, "TOPLEFT", -60, 0)
			end	
		
		-- healing 
		elseif C["Layout"]["LayoutRole"]["Value"] == "Healer" then 
			Pet:ClearAllPoints()
			if C.UnitFrames.Portrait == true and C["UF: Pet"]["PortraitStyle"]["Value"] == "Side" then
				Pet:SetPoint("TOPRIGHT", Player, "TOPLEFT", -82, 0)
			else
				Pet:SetPoint("TOPRIGHT", Player, "TOPLEFT", -60, 0)
			end	
			
		-- range
		elseif C["Layout"]["LayoutRole"]["Value"] == "Range" then 
			
			if C["Layout"]["LayoutAB"]["Value"] == "Single" or C["Layout"]["LayoutAB"]["Value"] == "Double" then
				Pet:ClearAllPoints()
				if C.UnitFrames.Portrait == true and C["UF: Pet"]["PortraitStyle"]["Value"] == "Side" then
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
			Pet:SetPoint("RIGHT", Player, "LEFT", -70, 20)
		end
	end	
end	
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- PET FRAME GENERAL (MAXUI AND TUKUI)
------------------------------------------------------------------------------------------
function UnitFrames:Pet()
	basePet(self)
	
	-- wow

	-- elements
	local Panel = self.Panel
	local Name = self.Name
	local Health = self.Health
	local Power = self.Power
	local myBar = self.HealthPrediction.myBar
	local otherBar = self.HealthPrediction.otherBar
	local absorbBar = self.HealthPrediction.absorbBar
	local CastBar = self.Castbar
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs
	local RaidIcon = self.RaidTargetIndicator
	local Portrait
	local PortraitBackdrop
	local PortraitShadow

	-- settings
	local HealthHeight = C["UF: Pet"]["HealthHeight"]
	local HealthWidth = C["UF: Pet"]["HealthWidth"]
	local PowerHeight = C["UF: Pet"]["PowerHeight"]
	local PowerWidth = C["UF: Pet"]["PowerWidth"]
	local CastHeight = C["UF: Pet"]["CastHeight"]
	local CastWidth = C["UF: Pet"]["CastWidth"]

	-- font
	local NameFont = T.GetFont(C["UF: Pet"]["NameFont"])
	local HealthFont = T.GetFont(C["UF: Pet"]["HealthFont"])
	local PowerFont = T.GetFont(C["UF: Pet"]["PowerFont"])
	local CastFont = T.GetFont(C["UF: Pet"]["CastFont"])
	local HealthFontSize = C["UF: Pet"]["HealthFontSize"]/10
	local NameFontSize = C["UF: Pet"]["NameFontSize"]/10
	local PowerFontSize = C["UF: Pet"]["PowerFontSize"]/10
	local CastFontSize = C["UF: Pet"]["CastFontSize"]/10

	-- texture
	local HealthTexture = T.GetTexture(C["UF: Pet"]["HealthTexture"])
	local PowerTexture = T.GetTexture(C["UF: Pet"]["PowerTexture"])
	local CastBarTexture = T.GetTexture(C["UF: Pet"]["CastTexture"])

	-- MaxUI

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

		Portrait:SetSize(34, 34)
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

		if (C.UnitFrames.Portrait == true and C["UF: Pet"]["PortraitStyle"]["Value"] == "None") then
			Portrait:Kill()
			PortraitBackdrop:Kill()
			PortraitShadow:Kill()

		elseif C["UF: Pet"]["PortraitStyle"]["Value"] == "Overlay" then
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
			Portrait:SetAlpha(C["UF: Pet"]["PortraitOverlayAlpha"])
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
-- MaxUI UF STYLE BASIC
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] ~= "MaxUI" then return end
	
	-- infopanel
	Panel:Hide()
	Panel:SetFrameStrata(self:GetFrameStrata())
	Panel:SetFrameLevel(self:GetFrameLevel()+1)

	-- Name Pet
	Name:ClearAllPoints()
	Name:SetPoint("TOPRIGHT", Health, "BOTTOMRIGHT", 0, -10)
	Name:SetParent(Health)
	Name:SetAlpha(1)
	Name:SetJustifyH("RIGHT")
	Name:SetFontObject(NameFont)
	Name:SetScale(NameFontSize)
	self:Tag(Name, C["UF: Pet"]["NameTag"]["Value"])

	-- health
	Health:SetFrameStrata("MEDIUM")
	Health:SetFrameLevel(1)
	Health:SetStatusBarTexture(HealthTexture)
	Health:SetInside(self)
	
	Health:CreateBackdrop()
	Health.Backdrop:SetBackdropColor(0, 0, 0, 0)
	Health.Backdrop:SetOutside(Health)

	-- health value
	Health.Value = Health:CreateFontString(nil, "OVERLAY")
	Health.Value:SetFontObject(HealthFont)
	Health.Value:SetScale(HealthFontSize)
	self:Tag(Health.Value, C["UF: Pet"]["HealthTag"]["Value"])

	-- health percentage
	local HPpercentage
	if C["UF: Pet"]["PercentageTags"] == true then
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
	Power.Value = Power:CreateFontString(nil, "OVERLAY")
	Power.Value:SetFontObject(PowerFont)
	Power.Value:SetScale(PowerFontSize)
	self:Tag(Power.Value, C["UF: Pet"]["PowerTag"]["Value"])

	Power.colorPower = true
	Power.PostUpdate = nil

	-- power percentage
	local MPpercentage
	if C["UF: Pet"]["PercentageTags"] == true then
		MPpercentage = Power:CreateFontString(nil, "OVERLAY")
		MPpercentage:SetAlpha(1)
		MPpercentage:SetFontObject(PowerFont)
		MPpercentage:SetScale(PowerFontSize)
		self:Tag(MPpercentage, "[perpp]%")
	end

	-- portrait
	if C.UnitFrames.Portrait == true and C["UF: Pet"]["PortraitStyle"]["Value"] == "Side" then
		Portrait:ClearAllPoints()
		Portrait:SetParent(Health)
		Portrait.Backdrop:SetOutside(Portrait)
		Portrait.Backdrop:CreateShadow()
		PortraitShadow:Kill()
	end
	
	-- castbar
	if C["UF: Pet"]["CastBar"] == true then
		CastBar.Spark:Kill()

		CastBar:ClearAllPoints()
		CastBar:SetAllPoints(Power)
		CastBar:SetFrameStrata("MEDIUM")
		CastBar:SetFrameLevel(4)
		CastBar:SetStatusBarTexture(CastBarTexture)
		CastBar.Background:SetTexture(0,0,0,1)
		CastBar:CreateBackdrop()
		CastBar.Backdrop:SetOutside()

		if C["UF: Pet"]["CastBarTime"] == true then
			CastBar.Time:ClearAllPoints()
			CastBar.Time:SetFontObject(CastFont)
			CastBar.Time:SetScale(CastFontSize)
			CastBar.Time:SetJustifyH("RIGHT")
			CastBar.Time:SetHeight(C["UF: Pet"]["CastFontSize"])
		else
			CastBar.Time:Hide()
		end
		
		if C["UF: Pet"]["CastBarText"] == true then
			CastBar.Text:ClearAllPoints()
			CastBar.Text:SetFontObject(CastFont)
			CastBar.Text:SetScale(CastFontSize)
			CastBar.Text:SetJustifyH("RIGHT")
			CastBar.Text:SetHeight(C["UF: Pet"]["CastFontSize"])
		else
			CastBar.Text:Hide()
		end
	
		-- unlink from UF
		if C["UF: Pet"]["CastBarUnlink"] == true then
			CastBar:ClearAllPoints()
			CastBar:SetOrientation("HORIZONTAL")
			CastBar:SetWidth(CastWidth)
			CastBar:SetHeight(CastHeight)

			CastBar.Backdrop:CreateShadow()
			if C["General"]["ClassShadowExcludeUF"] then
				CastBar.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
			end

			Movers:RegisterFrame(CastBar, "Castbar Pet")

			if C["UF: Pet"]["CastBarText"] == true then
				CastBar.Text:SetPoint("TOPRIGHT", CastBar, "BOTTOMRIGHT", 0, -2)
				CastBar.Text:SetWidth(CastWidth)
				CastBar.Text:SetJustifyH("RIGHT")
			end
			
			if C["UF: Pet"]["CastBarTime"] == true then
				CastBar.Time:SetPoint("RIGHT", CastBar, "RIGHT", -4, 0)
			end	
		end
	else
		CastBar:Kill()
	end	
	
	-- Debuffs
	if (C.UnitFrames.PetAuras) then
		if C["UF: Pet"]["Debuffs"] == true then
			-- anchor frame
			Debuffs:ClearAllPoints()
			Debuffs:SetParent(Health)
			
			-- Debuffs icons
			Debuffs.size = C["UF: Pet"]["DebuffSize"]
			Debuffs.num = C["UF: Pet"]["DebuffNumber"]
			Debuffs.numRow = C["UF: Pet"]["DebuffNumberRows"]
			Debuffs.spacing = C["UF: Pet"]["DebuffSpacing"]
			Debuffs.PostCreateIcon = UnitFrames.PostCreateAura
			Debuffs.PostUpdateIcon = UnitFrames.PostUpdateAura
			Movers:RegisterFrame(Debuffs, "Pet Debuffs")
		else
			Debuffs.num = 0
		end
	end
			
	-- Buffs
	if (C.UnitFrames.PetAuras) then
		if C["UF: Pet"]["Buffs"] == true then
			Buffs:ClearAllPoints()
			Buffs:SetFrameStrata(self:GetFrameStrata())
			Buffs:SetParent(Health)
			
			-- Buffs icons
			Buffs.size = C["UF: Pet"]["BuffSize"]
			Buffs.num = C["UF: Pet"]["BuffNumber"]
			Buffs.numRow = C["UF: Pet"]["BuffNumberRows"]
			Buffs.spacing = C["UF: Pet"]["BuffSpacing"]
			Buffs.PostCreateIcon = UnitFrames.PostCreateAura
			Buffs.PostUpdateIcon = UnitFrames.PostUpdateAura
			Buffs.PostUpdate = UnitFrames.UpdateBuffsHeaderPosition
			Buffs.onlyShowPlayer = C["UF: Pet"]["OnlySelfBuffs"]

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
	
	-- raid icon
	if C["UF: Pet"]["RaidIcon"] == true then
		RaidIcon:ClearAllPoints()
		RaidIcon:SetDrawLayer("OVERLAY", 7)
		RaidIcon:SetWidth(C["UF: Pet"]["RaidIconSize"])
		RaidIcon:SetHeight(C["UF: Pet"]["RaidIconSize"])
	else
		RaidIcon:Hide()
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
		if C["UF: Pet"]["CastBar"] == true then
			if C["UF: Pet"]["CastBarUnlink"] == true then
				CastBar:CreateMaxUIFilter()
			end	
		end

		if (C.UnitFrames.Portrait == true and C["UF: Pet"]["PortraitStyle"]["Value"] == "Side") then
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

		-- health percentage
		if C["UF: Pet"]["PercentageTags"] == true then
			HPpercentage:SetPoint("RIGHT", Health, "LEFT", -2, 0)
			HPpercentage:SetJustifyH("LEFT")
		end

		-- power
		Power:SetPoint("RIGHT", Health, "BOTTOMRIGHT", -6, 0)
		Power:SetHeight(PowerHeight)
		Power:SetWidth(PowerWidth)

		-- power value
		Power.Value:SetPoint("RIGHT", Power, "RIGHT", -4, 0)
		Power.Value:SetJustifyH("RIGHT")

		-- power percentage
		if C["UF: Pet"]["PercentageTags"] == true then
			MPpercentage:SetPoint("RIGHT", Power, "LEFT", -2, 0)
			MPpercentage:SetJustifyH("LEFT")
		end

		-- portrait
		if C.UnitFrames.Portrait == true and C["UF: Pet"]["PortraitStyle"]["Value"] == "Side" then
			Portrait:SetPoint("LEFT", Health, "RIGHT", 8, 0)
			Portrait:SetWidth(HealthHeight)
			Portrait:SetHeight(HealthHeight-2)
		end

		-- castbar
		if C["UF: Pet"]["CastBar"] == true then
			if C["UF: Target"]["CastBarUnlink"] == false then
				if C["UF: Pet"]["CastBarTime"] == true then
					CastBar.Time:SetPoint("RIGHT", CastBar, "RIGHT", -4, 0)
					CastBar.Time:SetJustifyH("RIGHT")
				end
				
				if C["UF: Pet"]["CastBarText"] == true then
					CastBar.Text:SetPoint("TOPRIGHT", Name, "BOTTOMRIGHT", 0, -4)
					CastBar.Text:SetSize(HealthWidth, 10)
					CastBar.Text:SetJustifyH("LEFT")
				end
			else
				CastBar:SetPoint("TOPRIGHT", Name, "BOTTOMRIGHT", 0, -4)
			end
		end

		-- Debuffs
		if (C.UnitFrames.PetAuras) then
			if C["UF: Pet"]["Debuffs"] == true then
				Debuffs:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 2, 14)
				Debuffs:SetHeight(C["UF: Pet"]["DebuffSize"]*C["UF: Pet"]["DebuffNumberRows"])
				Debuffs:SetWidth(HealthWidth)
				
				-- Debuffs icons
				Debuffs.initialAnchor = "BOTTOMRIGHT"
				Debuffs["growth-y"] = "UP"
				Debuffs["growth-x"] = "LEFT"
			end	
		end

		-- Buffs
		if (C.UnitFrames.PetAuras) then
			if C["UF: Pet"]["Buffs"] == true then
				if C["UF: Pet"]["Debuffs"] == true then
					Buffs:SetPoint("BOTTOMLEFT", Debuffs, "TOPLEFT", 0, 14)
				else
					Buffs:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 2, 42)
				end
				Buffs:SetHeight(C["UF: Pet"]["BuffSize"]*C["UF: Pet"]["BuffNumberRows"])
				Buffs:SetWidth(HealthWidth)
				
				Buffs.initialAnchor = "BOTTOMRIGHT"
				Buffs["growth-y"] = "UP"
				Buffs["growth-x"] = "LEFT"
			end
		end

		-- raid icon
		if C["UF: Pet"]["RaidIcon"] == true then
			RaidIcon:SetPoint("RIGHT", Name, "LEFT", -2, 0)
		end

		-- filter
		if C["Skins"]["UnitFramesFilter"] == true then 
			Health:CreateMaxUIFilter()
			Power:CreateMaxUIFilter()
			if C["UF: Pet"]["CastBar"] == true then
				if C["UF: Pet"]["CastBarUnlink"] == false then
					CastBar:CreateMaxUIFilter()
				end	
			end
		end
	end

------------------------------------------------------------------------------------------
-- MaxUI UF STYLE VERTICAL
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then

		-- name

		-- health
		Health:SetOrientation("VERTICAL")

		-- health value
		Health.Value:ClearAllPoints()
		Health.Value:SetPoint("TOPRIGHT", Name, "BOTTOMRIGHT", 0, -4)
		Health.Value:SetJustifyH("RIGHT")

		-- health percentage
		if C["UF: Pet"]["PercentageTags"] == true then
			HPpercentage:ClearAllPoints()
			HPpercentage:SetPoint("BOTTOM", Health, "TOP", 2, 4)
			HPpercentage:SetJustifyH("CENTER")
		end

		-- healcomm
		if C.UnitFrames.HealComm then
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

		-- power
		--Power:ClearAllPoints()
		Power:SetPoint("BOTTOM", Health, "BOTTOMLEFT", 0, 10)
		Power:SetHeight(PowerWidth)
		Power:SetWidth(PowerHeight)
		Power:SetOrientation("VERTICAL")

		-- power value
		--Power.Value:ClearAllPoints()
		Power.Value:SetPoint("TOPRIGHT", Health.Value, "BOTTOMRIGHT", -0, -4)

		-- power percentage
		if C["UF: Pet"]["PercentageTags"] == true then
			MPpercentage:SetPoint("BOTTOM", Power, "TOP", 2, 4)
			MPpercentage:SetJustifyH("CENTER")
		end

		-- castbar
		if C["UF: Pet"]["CastBar"] == true then
			if C["UF: Pet"]["CastBarUnlink"] == false then
				CastBar:SetOrientation("VERTICAL")

				if C["UF: Pet"]["CastBarText"] == true then
					CastBar.Text:SetWidth(250)
					CastBar.Text:SetHeight(12)
					CastBar.Text:SetPoint("TOPRIGHT", Name, "TOPLEFT", -4, 0)
				end

				if C["UF: Pet"]["CastBarTime"] == true then
					CastBar.Time:SetPoint("TOPRIGHT", CastBar.Text, "BOTTOMRIGHT", 0, -4)
				end
			else
				if (C.UnitFrames.Portrait == true and C["UF: Pet"]["PortraitStyle"]["Value"] == "Side") then
					CastBar:SetPoint("TOPRIGHT", Portrait, "BOTTOMRIGHT", 0, -8)
				else
					CastBar:SetPoint("TOPRIGHT", Power.Value, "BOTTOMRIGHT", 0, -8)
				end	
			end
		end

		-- portrait
		if C.UnitFrames.Portrait == true and C["UF: Pet"]["PortraitStyle"]["Value"] == "Side" then
			Portrait:SetPoint("TOP", Health, "BOTTOM", 0, -10)
			Portrait:SetWidth(HealthHeight-2)
			if C.UnitFrames.Portrait2D then
				Portrait:SetHeight(HealthHeight-2)
			else
				Portrait:SetHeight(8 + C["UF: Pet"]["NameFontSize"] + C["UF: Pet"]["HealthFontSize"] +C["UF: Pet"]["PowerFontSize"])
			end

			Name:ClearAllPoints()
			Name:SetPoint("TOPRIGHT", Portrait, "TOPLEFT", -4, 0)
		end

		-- Debuffs
		if (C.UnitFrames.PetAuras) then
			if C["UF: Pet"]["Debuffs"] == true then
				Debuffs:SetHeight(HealthWidth)
				Debuffs:SetWidth(C["UF: Pet"]["DebuffSize"]*C["UF: Pet"]["DebuffNumberRows"])
				Debuffs:SetPoint("BOTTOMRIGHT", Health, "BOTTOMLEFT", -14, 0)
				
				Debuffs.initialAnchor = "BOTTOMRIGHT"
				Debuffs["growth-y"] = "LEFT"
				Debuffs["growth-x"] = "UP"
			end	
		end

		-- Buffs
		if (C.UnitFrames.PetAuras) then
			if C["UF: Pet"]["Buffs"] == true then
				if C["UF: Pet"]["Debuffs"] == true then
					Buffs:SetPoint("BOTTOMRIGHT", Debuffs, "BOTTOMLEFT", -8, 0)
				else
					Buffs:SetPoint("BOTTOMRIGHT", self, "BOTTOMLEFT", -14, 0)
				end
				Buffs:SetHeight(HealthWidth)
				Buffs:SetWidth(C["UF: Pet"]["BuffSize"]*C["UF: Pet"]["BuffNumberRows"])

				Buffs.initialAnchor = "BOTTOMRIGHT"
				Buffs["growth-y"] = "LEFT"
				Buffs["growth-x"] = "UP"
			end
		end

		-- raid icon
		if C["UF: Pet"]["RaidIcon"] == true then
			RaidIcon:SetPoint("BOTTOM", Power, "TOP", 0, 16)
		end

		-- roll icon

		-- filter
		if C["Skins"]["UnitFramesFilter"] == true then 
			Health:CreateMaxUIVerticalFilter()
			Power:CreateMaxUIVerticalFilter()
			if C["UF: Pet"]["CastBar"] == true then
				if C["UF: Pet"]["CastBarUnlink"] == false then
					CastBar:CreateMaxUIVerticalFilter()
				end	
			end
		end
	end		
end