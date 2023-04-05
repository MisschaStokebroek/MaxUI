------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 29-11-2022
------------------------------------------------------------------------------------------

-- setting up BOSS FRAMES.
-- to do alternative power bar on boss frames

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T.UnitFrames
local baseBoss = UnitFrames.Boss

------------------------------------------------------------------------------------------
-- BOSS FRAME SETUP POSITION AND BASIC SIZE
------------------------------------------------------------------------------------------
local function CreateUnits()
	local Boss = UnitFrames.Units.Boss

	if not C["UnitFrames"]["Enable"] == true then return end
	if C["UnitFrames"]["Boss"] ~= true then return end

------------------------------------------------------------------------------------------
-- BOSS FRAME SIZE
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		if (C.UnitFrames.Boss) then
			for i = 1, 5 do
				Boss[i]:SetHeight(C["UF: Boss"]["HealthHeight"])
				Boss[i]:SetWidth(C["UF: Boss"]["HealthWidth"])
			end
		end
	end
	
------------------------------------------------------------------------------------------
-- BOSS FRAME POSITION
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		if (C.UnitFrames.Boss) then
			for i = 1, 5 do
				if (i == 1) then
					Boss[i]:ClearAllPoints()
					Boss[i]:SetPoint("BOTTOMRIGHT", UIParent, "RIGHT", -400, -200)
				else
					if C["UF: Boss"]["CastBarUnlink"] == true then
						Boss[i]:SetPoint("BOTTOM", Boss[i-1], "TOP", 0, (C["UF: Boss"]["Spacing"] + C["UF: Boss"]["CastFontSize"] + 4 + C["UF: Boss"]["CastHeight"]))
					else
						Boss[i]:SetPoint("BOTTOM", Boss[i-1], "TOP", 0, C["UF: Boss"]["Spacing"])
					end	           
				end
			end
		end
	end
end
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- BOSS FRAME GENERAL (MAXUI AND TUKUI)
------------------------------------------------------------------------------------------
function UnitFrames:Boss()
	baseBoss(self)
	if not C.UnitFrames.Boss then return end

	-- wow

	-- elements
	local Name = self.Name
	local Health = self.Health
	local Power = self.Power
	local AltPower = self.AlternativePower
	local CastBar = self.Castbar
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs
	local RaidIcon = self.RaidTargetIndicator
	local Portrait
	local PortraitBackdrop
	local PortraitShadow

	-- settings
	local HealthHeight = C["UF: Boss"]["HealthHeight"]
	local HealthWidth = C["UF: Boss"]["HealthWidth"]
	local PowerHeight = C["UF: Boss"]["PowerHeight"]
	local PowerWidth = C["UF: Boss"]["PowerWidth"]
	local CastHeight = C["UF: Boss"]["CastHeight"]
	local RaidIconSize = C["UF: Boss"]["RaidIconSize"]

	-- font
	local NameFont = T.GetFont(C["UF: Boss"]["NameFont"])
	local HealthFont = T.GetFont(C["UF: Boss"]["HealthFont"])
	local PowerFont = T.GetFont(C["UF: Boss"]["PowerFont"])
	local CastFont = T.GetFont(C["UF: Boss"]["CastFont"])
	local NameFontSize = C["UF: Boss"]["NameFontSize"]/10
	local HealthFontSize = C["UF: Boss"]["HealthFontSize"]/10
	local PowerFontSize = C["UF: Boss"]["PowerFontSize"]/10
	local CastFontSize = C["UF: Boss"]["CastFontSize"]/10

	-- textures
	local HealthTexture = T.GetTexture(C["UF: Boss"]["HealthTexture"])
	local PowerTexture = T.GetTexture(C["UF: Boss"]["PowerTexture"])
	local CastTexture = T.GetTexture(C["UF: Boss"]["CastTexture"])

	-- Maxui

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

		if (C.UnitFrames.Portrait == true and C["UF: Boss"]["PortraitStyle"]["Value"] == "None") then
			Portrait:Kill()
			PortraitBackdrop:Kill()
			PortraitShadow:Kill()

		elseif C["UF: Boss"]["PortraitStyle"]["Value"] == "Overlay" then
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
			Portrait:SetAlpha(C["UF: Boss"]["PortraitOverlayAlpha"])
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
		Health.colorThreat = C["UF: Boss"]["ColorThreat"]
	elseif C["UnitFrames"]["Colorstyle"]["Value"] == "Gradient" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = false
		Health.colorReaction = false
		Health.colorSmooth = true
		Health.colorThreat = C["UF: Boss"]["ColorThreat"]
	elseif C["UnitFrames"]["Colorstyle"]["Value"] == "Class" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = true
		Health.colorReaction = true
		Health.colorThreat = C["UF: Boss"]["ColorThreat"]
	elseif C["UnitFrames"]["Colorstyle"]["Value"] == "Custom" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = false
		Health.colorReaction = false
		Health.colorThreat = C["UF: Boss"]["ColorThreat"]
	end	
	Health.PreUpdate = UnitFrames.PreUpdateHealth

------------------------------------------------------------------------------------------
-- EXCLUDE SHADOW COLOR
------------------------------------------------------------------------------------------
	if C["General"]["ClassShadowExcludeUF"] then
		self.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
	end

------------------------------------------------------------------------------------------
-- MaxUI UF STYLE BASIC
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] ~= "MaxUI" then return end

	-- Name
	Name:ClearAllPoints()
	Name:SetPoint("TOPLEFT", Health, "BOTTOMLEFT", 0, -8)
	Name:SetJustifyH("LEFT")
	Name:SetFontObject(NameFont)
	Name:SetScale(NameFontSize)
	self:Tag(Name, C["UF: Boss"]["NameTag"]["Value"]) 

	-- health
	Health:SetFrameStrata("MEDIUM")
	Health:SetFrameLevel(1)
	Health:SetStatusBarTexture(HealthTexture)
	Health:SetInside(self)
	
	Health:CreateBackdrop()
	Health.Backdrop:SetBackdropColor(0, 0, 0, 0)
	Health.Backdrop:SetOutside(Health)
	
	Health.Value:ClearAllPoints()
	Health.Value:SetPoint("RIGHT", Health, "RIGHT", -2, 0)
	Health.Value:SetFontObject(HealthFont)
	Health.Value:SetScale(HealthFontSize)
	Health.Value:SetJustifyH("RIGHT")
	self:Tag(Health.Value, C["UnitFrames"]["BossHealthTag"]["Value"])

	-- HPpercentage tag
	if C["UF: Boss"]["PercentageTags"] == true then
		local HPpercentage = Health:CreateFontString(nil, "OVERLAY")
		HPpercentage:SetPoint("LEFT", Health, "RIGHT", 8, 0)
		HPpercentage:SetAlpha(1)
		HPpercentage:SetJustifyH("LEFT")
		HPpercentage:SetFontObject(HealthFont)
		HPpercentage:SetScale(HealthFontSize)
		self:Tag(HPpercentage, "[perhp]%")
	end
	
	-- Healcomm
	if C["UF: Boss"]["HealComm"] then
		local myBar = CreateFrame("StatusBar", nil, Health)
		local otherBar = CreateFrame("StatusBar", nil, Health)
		local absorbBar = CreateFrame("StatusBar", nil, Health)

		myBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
		otherBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
		absorbBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])

		myBar:SetFrameLevel(Health:GetFrameLevel())
		myBar:SetStatusBarTexture(HealthTexture)
		myBar:SetPoint("TOP")
		myBar:SetPoint("BOTTOM")
		myBar:SetPoint("LEFT", Health:GetStatusBarTexture(), "RIGHT")
		myBar:SetWidth(HealthWidth)
		myBar:SetStatusBarColor(unpack(C.UnitFrames.HealCommSelfColor))
		myBar:SetMinMaxValues(0, 1)
		myBar:SetValue(0)

		otherBar:SetFrameLevel(Health:GetFrameLevel())
		otherBar:SetPoint("TOP")
		otherBar:SetPoint("BOTTOM")
		otherBar:SetPoint("LEFT", myBar:GetStatusBarTexture(), "RIGHT")
		otherBar:SetWidth(HealthWidth)
		otherBar:SetStatusBarTexture(HealthTexture)
		otherBar:SetStatusBarColor(unpack(C.UnitFrames.HealCommOtherColor))
		otherBar:SetMinMaxValues(0, 1)
		otherBar:SetValue(0)

		absorbBar:SetFrameLevel(Health:GetFrameLevel())
		absorbBar:SetPoint("TOP")
		absorbBar:SetPoint("BOTTOM")
		absorbBar:SetPoint("LEFT", otherBar:GetStatusBarTexture(), "RIGHT")
		absorbBar:SetWidth(HealthWidth)
		absorbBar:SetStatusBarTexture(HealthTexture)
		absorbBar:SetStatusBarColor(unpack(C.UnitFrames.HealCommAbsorbColor))
		absorbBar:SetMinMaxValues(0, 1)
		absorbBar:SetValue(0)

		local HealthPrediction = {
			myBar = myBar,
			otherBar = otherBar,
			absorbBar = absorbBar,
			maxOverflow = 1,
		}

		self.HealthPrediction = HealthPrediction
	end

	-- power
	Power:ClearAllPoints()
	Power:SetFrameStrata("MEDIUM")
	Power:SetFrameLevel(3)
	Power:SetPoint("LEFT", Health, "BOTTOMLEFT", 6, 0)
	Power:SetHeight(PowerHeight)
	Power:SetWidth(PowerWidth)
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
	self:Tag(Power.Value, C["UF: Boss"]["PowerTag"]["Value"])
	
	Power.PostUpdate = nil

	-- mp percentage
	if C["UF: Boss"]["PercentageTags"] == true then
		local MPpercentage = Power:CreateFontString(nil, "OVERLAY")
		MPpercentage:SetPoint("LEFT", Power, "RIGHT", 2, 0)
		MPpercentage:SetAlpha(1)
		MPpercentage:SetJustifyH("LEFT")
		MPpercentage:SetFontObject(PowerFont)
		MPpercentage:SetScale(PowerFontSize)
		self:Tag(MPpercentage, "[perpp]%")
	end

	-- portrait
	if (C.UnitFrames.Portrait == true and C["UF: Boss"]["PortraitStyle"]["Value"] == "Side") then
		Portrait:ClearAllPoints()
		Portrait:SetParent(Health)
		
		Portrait:SetPoint("RIGHT", Health, "LEFT", -6, 0)
		Portrait:SetWidth(HealthHeight)
		Portrait:SetHeight(HealthHeight-2)
		
		Portrait.Backdrop:SetOutside(Portrait)
		Portrait.Backdrop:CreateShadow()
		PortraitShadow:Kill()
	end

	-- CastBar
	if (C.UnitFrames.CastBar) then
		if C["UF: Boss"]["CastBar"] == true then
			CastBar.Spark:Kill()
			
			CastBar:SetFrameStrata("MEDIUM")
			CastBar:SetFrameLevel(5)
			CastBar:SetStatusBarTexture(CastTexture)
			
			CastBar.Background = CastBar:CreateTexture(nil, "BORDER")
			CastBar.Background:SetAllPoints(CastBar)
			CastBar.Background:SetVertexColor(0.15, 0.15, 0.15)
			CastBar.Background:SetTexture(0,0,0,1)
			
			CastBar:CreateBackdrop()
			CastBar.Backdrop:SetOutside()

			if C["UF: Boss"]["CastIcon"] == true then
				CastBar.Button:ClearAllPoints()
				if C["General"]["ClassShadowExcludeUF"] then
					CastBar.Button.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
				end
				CastBar.Icon:SetInside()
				CastBar.Icon:SetTexCoord(unpack(T.IconCoord))
			end
		
			if C["UF: Boss"]["CastBarText"] == true then
				CastBar.Text:ClearAllPoints()
				CastBar.Text:SetHeight(C["UF: Boss"]["CastFontSize"])
				CastBar.Text:SetJustifyH("LEFT")
				CastBar.Text:SetFontObject(CastFont)
				CastBar.Text:SetScale(CastFontSize)
			else 
				CastBar.Text:Hide()
			end

			if C["UF: Boss"]["CastBarTime"] == true then
				CastBar.Time = CastBar:CreateFontString(nil, "OVERLAY")
				CastBar.Time:SetHeight(C["UF: Boss"]["CastFontSize"])
				CastBar.Time:SetJustifyH("RIGHT")
				CastBar.Time:SetFontObject(CastFont)
				CastBar.Time:SetScale(CastFontSize)
				CastBar.Time:SetTextColor(0.84, 0.75, 0.65)
			end

			-- unlink / link
			if C["UF: Boss"]["CastBarUnlink"] == true then
				CastBar:ClearAllPoints()
				CastBar:SetOrientation("HORIZONTAL")
				CastBar:SetParent(UIParent)
				CastBar:SetAlpha(1)
				CastBar:SetWidth(HealthWidth)
				CastBar:SetHeight(CastHeight)

				CastBar.Backdrop:CreateShadow()
				if C["General"]["ClassShadowExcludeUF"] then
					CastBar.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
				end	

				if C["UF: Boss"]["CastBarIcon"] == true then
					CastBar.Button:ClearAllPoints()
					CastBar.Button:SetPoint("TOPLEFT", Name, "BOTTOMLEFT", 0, -4)
					CastBar.Button:SetWidth(CastHeight + 4 + C["UF: Boss"]["CastFontSize"])
					CastBar.Button:SetHeight(CastHeight + 4 + C["UF: Boss"]["CastFontSize"])
				
					CastBar:SetWidth(HealthWidth-(CastHeight + 8 + C["UF: Boss"]["CastFontSize"]))
					CastBar:SetPoint("TOPLEFT", CastBar.Button, "TOPRIGHT", 4, 0)
				else
					CastBar:SetPoint("TOPLEFT", Name, "BOTTOMLEFT", 0, -4)
				end
				
				if C["UF: Boss"]["CastBarText"] == true then
					CastBar.Text:SetPoint("TOPLEFT", CastBar, "BOTTOMLEFT", 0, -4)
					CastBar.Text:SetWidth(HealthWidth-(CastHeight + 4 + C["UF: Boss"]["CastFontSize"]))
				end

				if C["UF: Boss"]["CastBarTime"] == true then
					CastBar.Time:SetPoint("RIGHT", CastBar, "RIGHT", -4, 0)
				end
			else
				if C["UF: Boss"]["CastBarIcon"] == true then
					CastBar.Button:SetPoint("RIGHT", Health, "LEFT", -6, 0)
					CastBar.Button:SetWidth(HealthHeight-2)
					CastBar.Button:SetHeight(HealthHeight-2)
				end
			
				if C["UF: Boss"]["CastBarText"] == true then
					CastBar.Text:SetPoint("TOPLEFT", Name, "BOTTOMLEFT", 0, -4)
					CastBar.Text:SetWidth(HealthWidth)
				end

				if C["UF: Boss"]["CastBarTime"] == true then
					CastBar.Time:SetPoint("RIGHT", CastBar, "RIGHT", 0, 0)
				end
			end
		else
			CastBar:Kill()
		end
	end	

	-- Buffs
	if (C.UnitFrames.BossAuras) then
		if C["UF: Boss"]["Buffs"] == true then
			Buffs:SetWidth((C["UF: Boss"]["NumberOfBuffsShown"]*22) + ((C["UF: Boss"]["NumberOfBuffsShown"]-1)*4))
			Buffs:SetHeight(22)
			Buffs:ClearAllPoints()
			Buffs:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", 0, 6)
			Buffs.size = 22
			Buffs.spacing = 4
			Buffs.num = C["UF: Boss"]["NumberOfBuffsShown"]
			Buffs.initialAnchor = "LEFT"
			Buffs["growth-x"] = "RIGHT"
		else
			Buffs.num = 0
		end
	end
		
		-- Debuffs
	if (C.UnitFrames.BossAuras) then
		if C["UF: Boss"]["Debuffs"] == true then
			Debuffs:SetWidth((C["UF: Boss"]["NumberOfDebuffsShown"]*(HealthHeight-2)) + ((C["UF: Boss"]["NumberOfDebuffsShown"] -1)*4))
			Debuffs:SetHeight(HealthHeight)
			Debuffs:ClearAllPoints()
			if (C.UnitFrames.Portrait == true and C["UF: Boss"]["PortraitStyle"]["Value"] == "Side") or C["UF: Boss"]["CastBarUnlink"] == false then
				Debuffs:SetPoint("RIGHT", Health, "LEFT", -(12 + HealthHeight), 0)
			else
				Debuffs:SetPoint("RIGHT", Health, "LEFT", -8, 0)
			end
			Debuffs.size = HealthHeight-2
			Debuffs.spacing = 4
			Debuffs.num = C["UF: Boss"]["NumberOfDebuffsShown"]
			Debuffs.initialAnchor = "RIGHT"
			Debuffs["growth-x"] = "LEFT"
		else
			Debuffs.num = 0
		end
	end

	-- raid icon
	RaidIcon:ClearAllPoints()
	RaidIcon:SetWidth(RaidIconSize)
	RaidIcon:SetHeight(RaidIconSize)
	RaidIcon:SetPoint("CENTER", Health, "BOTTOMRIGHT", 2, -2)	

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
	if C["Skins"]["UnitFramesFilter"] == true then 
		Health:CreateMaxUIFilter()
		Power:CreateMaxUIFilter()
		CastBar:CreateMaxUIFilter()
		if C["UF: Player"]["CastBarIcon"] == true then
			CastBar.Button:CreateMaxUIFilter()
		end
	end
end