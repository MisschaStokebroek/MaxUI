------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up ARENA FRAMES.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T.UnitFrames
local baseArena = UnitFrames.Arena

------------------------------------------------------------------------------------------
-- ARENA FRAME SETUP POSITION AND BASIC SIZE
------------------------------------------------------------------------------------------
local function CreateUnits()
	if not C["UnitFrames"]["Enable"] == true then return end

	local Arena = UnitFrames.Units.Arena
	
------------------------------------------------------------------------------------------
-- ARENA FRAME SIZE
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		if (C.UnitFrames.Arena) then
			for i = 1, 5 do
				Arena[i]:SetHeight(C["UF: Arena"]["HealthHeight"])
				Arena[i]:SetWidth(C["UF: Arena"]["HealthWidth"])
			end
		end
	end

------------------------------------------------------------------------------------------
-- ARENA FRAME POSITION
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		if (C.UnitFrames.Arena) then
			for i = 1, 5 do
				if (i == 1) then
					Arena[i]:ClearAllPoints()
					Arena[i]:SetPoint("BOTTOMLEFT", UIParent, "CENTER", 560, -200)
				else	
					Arena[i]:SetPoint("BOTTOM", Arena[i-1], "TOP", 0, C["UF: Arena"]["Spacing"])              
				end
			end
		end
	end	
end
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- BOSS FRAME MAXUI THEME
------------------------------------------------------------------------------------------
function UnitFrames:Arena()
	-- Tukui
	baseArena(self)
	
	if not C.UnitFrames.Arena then return end

	-- MaxUI/Additional Options
	local Health = self.Health
	local Power = self.Power
	local Castbar = self.Castbar
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs
	local SpecIcon = self.PVPSpecIcon
	local Trinket = self.Trinket
	local Name = self.Name
	local RaidIcon = self.RaidTargetIndicator
	
	local HealthHeight = C["UF: Arena"]["HealthHeight"]
	local HealthWidth = C["UF: Arena"]["HealthWidth"]
	local PowerHeight = C["UF: Arena"]["PowerHeight"]
	local PowerWidth = C["UF: Arena"]["PowerWidth"]
	local CastFont = T.GetFont(C["UF: Arena"]["CastFont"])
	local HealthFont = T.GetFont(C["UF: Arena"]["HealthFont"])
	local NameFont = T.GetFont(C["UF: Arena"]["NameFont"])
	local PowerFont = T.GetFont(C["UF: Arena"]["PowerFont"])
	local CastFontSize = C["UF: Arena"]["CastFontSize"]/10
	local HealthFontSize = C["UF: Arena"]["HealthFontSize"]/10
	local NameFontSize = C["UF: Arena"]["NameFontSize"]/10
	local PowerFontSize = C["UF: Arena"]["PowerFontSize"]/10
	local HealthTexture = T.GetTexture(C["UF: Arena"]["HealthTexture"])
	local PowerTexture = T.GetTexture(C["UF: Arena"]["PowerTexture"])
	local CastTexture = T.GetTexture(C["UF: Arena"]["CastTexture"])
	local Blank = C.Medias.Blank
	local RaidIconSize = C["UF: Arena"]["RaidIconSize"]
	
------------------------------------------------------------------------------------------
-- PORTRAIT STYLE
------------------------------------------------------------------------------------------
	local Portrait = CreateFrame("PlayerModel", nil, Health)
	self.Portrait = Portrait

	if C["UF: Arena"]["PortraitStyle"]["Value"] == "None" then

	elseif C["UF: Arena"]["PortraitStyle"]["Value"] == "Side" then
		Portrait:SetPoint("RIGHT", Health, "LEFT", -8, 0)
		Portrait:SetWidth(HealthHeight)
		Portrait:SetHeight(HealthHeight-2)
		Portrait:CreateBackdrop()
		Portrait.Backdrop:SetOutside(Portrait)
		Portrait.Backdrop:CreateShadow()
			
	elseif C["UF: Arena"]["PortraitStyle"]["Value"] == "Overlay" then
		Portrait:SetAllPoints()
		Portrait:SetFrameLevel(3)
		Portrait:SetAlpha(C["UF: Arena"]["PortraitOverlayAlpha"])
	end

------------------------------------------------------------------------------------------
-- COLOR THEME
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Colorstyle"]["Value"] == "Dark" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = false
		Health.colorReaction = false
		Health.colorThreat = C["UF: Arena"]["ColorThreat"]
	elseif C["UnitFrames"]["Colorstyle"]["Value"] == "Gradient" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = false
		Health.colorReaction = false
		Health.colorSmooth = true
		Health.colorThreat = C["UF: Arena"]["ColorThreat"]
	elseif C["UnitFrames"]["Colorstyle"]["Value"] == "Class" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = true
		Health.colorReaction = true
		Health.colorThreat = C["UF: Arena"]["ColorThreat"]
	elseif C["UnitFrames"]["Colorstyle"]["Value"] == "Custom" then
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = false
		Health.colorReaction = false
		Health.colorThreat = C["UF: Arena"]["ColorThreat"]
	end	
	Health.PreUpdate = UnitFrames.PreUpdateHealth

------------------------------------------------------------------------------------------
-- MOUSEOVER COMBAT ALPHA
------------------------------------------------------------------------------------------
	if C["UF: Arena"]["NonCombatAlphaEnable"] == true then 
		self:HookScript("OnUpdate", function(self)
			if InCombatLockdown() then
				self:SetAlpha(1)
				Health.Background:SetAlpha(1)
			elseif MouseIsOver(self) then
				self:SetAlpha(1)
				Health.Background:SetAlpha(1)
			else
				self:SetAlpha(C["UF: Arena"]["NonCombatAlpha"])
				Health.Background:SetAlpha(C["UF: Arena"]["NonCombatAlpha"])
			end
		end)
	end	

------------------------------------------------------------------------------------------
-- EXCLUDE SHADOW COLOR
------------------------------------------------------------------------------------------
	if C["General"]["ClassShadowExcludeUF"] then
		self.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
	end
	
------------------------------------------------------------------------------------------
-- MaxUI UF STYLE
------------------------------------------------------------------------------------------
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then

		-- health
		Health:ClearAllPoints()
		Health:SetInside(self)
		Health:SetStatusBarTexture(HealthTexture)
		
		Health:CreateBackdrop()
		Health.Backdrop:SetBackdropColor(0, 0, 0, 0)
		Health.Backdrop:SetOutside(Health)
		
		Health.Value = Health:CreateFontString(nil, "OVERLAY")
		Health.Value:SetPoint("RIGHT", Health, "RIGHT", -2, 0)
		Health.Value:SetFontObject(HealthFont)
		Health.Value:SetScale(HealthFontSize)
		Health.Value:SetJustifyH("RIGHT")
		self:Tag(Health.Value, C["UF: Arena"]["HealthTag"]["Value"])

		-- HPpercentage tag
		if C["UF: Arena"]["PercentageTags"] == true then
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
		Power.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
		if C["General"]["ClassShadowExcludeUF"] then
			Power.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
		end
		Power.Backdrop:SetOutside(Power)

		-- mp percentage
		if C["UF: Arena"]["PercentageTags"] == true then
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
		self:Tag(Power.Value, C["UF: Arena"]["PowerTag"]["Value"])
		
		Power.PostUpdate = nil

		-- Name
		Name:ClearAllPoints()
		Name:SetJustifyH("LEFT")
		Name:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", 0, 2)
		Name:SetFontObject(NameFont)
		Name:SetScale(NameFontSize)

		-- CastBar
		if C["UF: Arena"]["CastBar"] == true then
			Castbar.Spark:Kill()

			Castbar:ClearAllPoints()
			Castbar:SetInside(Power)
			Castbar:SetStatusBarTexture(CastTexture)
			Castbar.Backdrop:CreateShadow()
			if C["General"]["ClassShadowExcludeUF"] then
				Castbar.Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
			end
		
			if C["UF: Arena"]["CastIcon"] == true then
				Castbar.Button:ClearAllPoints()
				Castbar.Button:SetPoint("LEFT", Castbar, "RIGHT", 8, 0)
				Castbar.Button:SetWidth(Castbar:GetHeight()-4)
				Castbar.Button:SetHeight(Castbar:GetHeight()-4)
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
			Castbar.Text:SetPoint("TOPLEFT", Castbar, "BOTTOMLEFT", 2, -4)
		else
			Castbar:Kill()
		end

		if (C.UnitFrames.ArenaAuras) then
			if C["UF: Arena"]["Buffs"] == true then
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
			if C["UF: Arena"]["Debuffs"] == true then
				Debuffs:SetWidth(200)
				Debuffs:SetHeight(8)
				Debuffs:ClearAllPoints()
				if C["UF: Arena"]["PortraitStyle"]["Value"] == "Side" then
					Debuffs:SetPoint("RIGHT", Health, "LEFT", -(8 + HealthHeight), 0)
				else
					Debuffs:SetPoint("RIGHT", Health, "LEFT", -8, 0)
				end
				Debuffs.size = HealthHeight-2
				Debuffs.spacing = 4
				Debuffs.num = 5
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

		-- spec icon (to be done)	
		--if C["UF: Arena"]["SpecIcon"] == true then
		--	SpecIcon:SetHeight(24)
		--	SpecIcon:SetWidth(24)
		--	SpecIcon:ClearAllPoints()
		--	SpecIcon:SetPoint("BOTTOMRIGHT", Health, "TOPRIGHT", 0, 8)
		--else
		--	SpecIcon:Hide()
		--end
		
		-- trinket (to be done)	
		--if C["UF: Arena"]["Trinket"] == true then
		--	Trinket:Size(24)
		--	Trinket:ClearAllPoints()
		--	Trinket:SetPoint("BOTTOMRIGHT", Health, "TOPRIGHT", -28, 8)
		--	Trinket:CreateShadow()
		--else
		--	Trinket:Hide()
		--end
		
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