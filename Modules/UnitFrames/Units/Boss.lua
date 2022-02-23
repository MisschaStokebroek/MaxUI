------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
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

	if C["UnitFrames"]["Boss"] ~= true then
		Boss:Kill()
	end	

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
					Boss[i]:SetPoint("BOTTOMLEFT", UIParent, "CENTER", 600, -200)
				else
					Boss[i]:SetPoint("BOTTOM", Boss[i-1], "TOP", 0, C["UF: Boss"]["Spacing"])             
				end
			end
		end
	end
end
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- BOSS FRAME MAXUI THEME
------------------------------------------------------------------------------------------
function UnitFrames:Boss()
	-- Tukui
	baseBoss(self)

	-- MaxUI/Additional Options
	local Health = self.Health
	local Power = self.Power
	local Castbar = self.Castbar
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs
	local AltPower = self.AlternativePower
	local Name = self.Name
	local RaidIcon = self.RaidTargetIndicator
	--local myBar = self.HealthPrediction.myBar
	--local otherBar = self.HealthPrediction.otherBar
	--local absorbBar = self.HealthPrediction.absorbBar
	
	local HealthHeight = C["UF: Boss"]["HealthHeight"]
	local HealthWidth = C["UF: Boss"]["HealthWidth"]
	local PowerHeight = C["UF: Boss"]["PowerHeight"]
	local PowerWidth = C["UF: Boss"]["PowerWidth"]
	local CastFont = T.GetFont(C["UF: Boss"]["CastFont"])
	local HealthFont = T.GetFont(C["UF: Boss"]["HealthFont"])
	local NameFont = T.GetFont(C["UF: Boss"]["NameFont"])
	local PowerFont = T.GetFont(C["UF: Boss"]["PowerFont"])
	local CastFontSize = C["UF: Boss"]["CastFontSize"]/10
	local HealthFontSize = C["UF: Boss"]["HealthFontSize"]/10
	local NameFontSize = C["UF: Boss"]["NameFontSize"]/10
	local PowerFontSize = C["UF: Boss"]["PowerFontSize"]/10
	local HealthTexture = T.GetTexture(C["UF: Boss"]["HealthTexture"])
	local PowerTexture = T.GetTexture(C["UF: Boss"]["PowerTexture"])
	local CastTexture = T.GetTexture(C["UF: Boss"]["CastTexture"])
	local Blank = C.Medias.Blank
	local RaidIconSize = C["UF: Boss"]["RaidIconSize"]
	
------------------------------------------------------------------------------------------
-- PORTRAIT STYLE
------------------------------------------------------------------------------------------
	local Portrait = CreateFrame("PlayerModel", nil, Health)
	self.Portrait = Portrait

	if C["UF: Boss"]["PortraitStyle"]["Value"] == "None" then

	elseif C["UF: Boss"]["PortraitStyle"]["Value"] == "Side" then
		Portrait:SetPoint("RIGHT", Health, "LEFT", -8, 0)
		Portrait:SetWidth(HealthHeight)
		Portrait:SetHeight(HealthHeight-2)
		Portrait:CreateBackdrop()
		Portrait.Backdrop:SetOutside(Portrait)
		Portrait.Backdrop:CreateShadow()
			
	elseif C["UF: Boss"]["PortraitStyle"]["Value"] == "Overlay" then
		Portrait:SetAllPoints()
		Portrait:SetFrameLevel(3)
		Portrait:SetAlpha(C["UF: Boss"]["PortraitOverlayAlpha"])
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
-- HEALCOMM
------------------------------------------------------------------------------------------
	--if C.UnitFrames.HealComm then
	--	myBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
	--	otherBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
	--	absorbBar:SetAlpha(C["UnitFrames"]["HealCommAlpha"])
	--end

------------------------------------------------------------------------------------------
-- MaxUI UF STYLE
------------------------------------------------------------------------------------------
	if C["General"]["ClassShadowExcludeUF"] then
		self.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
	end

	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then

		-- health
		Health:ClearAllPoints()
		Health:SetInside(self)
		Health:SetStatusBarTexture(HealthTexture)
		
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
		
		-- power
		Power:ClearAllPoints()
		Power:SetPoint("LEFT", Health, "BOTTOMLEFT", 6, 0)
		Power:SetHeight(PowerHeight)
		Power:SetWidth(PowerWidth)
		Power:SetFrameLevel(5)
		Power:SetStatusBarTexture(PowerTexture)
		
		Power:CreateBackdrop()
		Power.Backdrop:CreateShadow()
		Power.Backdrop:SetFrameLevel(5)
		if C["General"]["ClassShadowExcludeUF"] then
			Power.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
		end
		Power.Backdrop:SetOutside(Power)

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

		Power.Value = Power:CreateFontString(nil, "OVERLAY")
		Power.Value:SetPoint("RIGHT", Power, "RIGHT", -4, 0)
		Power.Value:SetFontObject(PowerFont)
		Power.Value:SetScale(PowerFontSize)
		Power.Value:SetJustifyH("RIGHT")
		--self:Tag(Power.Value, C["UF: Boss"]["PowerTag"]["Value"])
		
		Power.PostUpdate = nil
		
		-- AltPower NEED TO CHECK THIS.
		--AltPower:ClearAllPoints()
		--AltPower:SetPoint("TOP", Power, "BOTTOM", 0, -4)
		--AltPower:SetWidth(Power:GetWidth())
		--AltPower:SetHeight(Power:GetHeight())
		--AltPower:SetFrameLevel(5)
		--AltPower:SetFrameStrata("HIGH")
		--AltPower.Backdrop:CreateShadow()
		--if C["General"]["ClassShadowExcludeUF"] then
		--	AltPower.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
		--end
		--AltPower.Backdrop:SetOutside(Power)
	
		-- Name
		Name:ClearAllPoints()
		Name:SetJustifyH("LEFT")
		Name:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", 0, 2)
		Name:SetFontObject(NameFont)
		Name:SetScale(NameFontSize)
		self:Tag(Name, C["UF: Boss"]["NameTag"]["Value"]) 

		-- CastBar
		if (C.UnitFrames.CastBar) then
			if C["UF: Boss"]["CastBar"] == true then
				Castbar.Spark:Kill()
				
				Castbar:ClearAllPoints()
				Castbar:SetFrameLevel(Power:GetFrameLevel()+3)
				Castbar:SetInside(Power)
				Castbar:SetStatusBarTexture(CastTexture)
				Castbar.Backdrop:CreateShadow()
				if C["General"]["ClassShadowExcludeUF"] then
					Castbar.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
				end
			
				if C["UF: Boss"]["CastIcon"] == true then
					Castbar.Button:ClearAllPoints()
					Castbar.Button:SetPoint("TOPLEFT", Castbar, "BOTTOMLEFT", 0, -4)
					Castbar.Button:SetWidth(14)
					Castbar.Button:SetHeight(14)
					Castbar.Button:CreateBackdrop()
					Castbar.Button:CreateShadow()
					if C["General"]["ClassShadowExcludeUF"] then
						Castbar.Button.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
					end
				end
			
				--Castbar.Time:ClearAllPoints()
				--Castbar.Time:SetPoint("RIGHT", Castbar, "RIGHT", -4, 0)
				--Castbar.Time:SetFontObject(CastFont)
				--Castbar.Time:SetScale(CastFontSize)
				
				Castbar.Text:ClearAllPoints()
				Castbar.Text:SetWidth(250)
				Castbar.Text:SetJustifyH("LEFT")
				Castbar.Text:SetFontObject(CastFont)
				Castbar.Text:SetScale(CastFontSize)
				if C["UF: Boss"]["CastIcon"] == true then
					Castbar.Text:SetPoint("TOPLEFT", Castbar, "BOTTOMLEFT", 18, -4)
				else
					Castbar.Text:SetPoint("TOPLEFT", Castbar, "BOTTOMLEFT", 2, -4)
				end
			else
				Castbar:Kill()
			end
		end	

--[[
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
]]
		-- Buffs
		if (C.UnitFrames.BossAuras) then
			if C["UF: Boss"]["Buffs"] == true then
				Buffs:SetWidth(200)
				Buffs:SetHeight(20)
				Buffs:ClearAllPoints()
				Buffs:SetPoint("BOTTOMRIGHT", Health, "TOPRIGHT", 0, 10)
				
				Buffs.size = 22
				Buffs.spacing = 4
				Buffs.num = 3
				Buffs.initialAnchor = "RIGHT"
				Buffs["growth-x"] = "LEFT"
			else
				Buffs.num = 0
			end
			
			-- Debuffs
			if C["UF: Boss"]["Debuffs"] == true then
				Debuffs:SetWidth(200)
				Debuffs:SetHeight(8)
				Debuffs:ClearAllPoints()
				if C["UF: Boss"]["PortraitStyle"]["Value"] == "Side" then
					Debuffs:SetPoint("RIGHT", Health, "LEFT", -(8 + HealthHeight), 0)
				else
					Debuffs:SetPoint("RIGHT", Health, "LEFT", -8, 0)
				end
				Debuffs.size = HealthHeight-2
				Debuffs.spacing = 4
				Debuffs.num = 3
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
	end
end