------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

--setting up UNITFRAMES SKINS/GENERAL.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T["UnitFrames"]
local Noop = function() end

-- WoW Globals
local UnitIsConnected = UnitIsConnected
local UnitIsDead = UnitIsDead
local UnitIsGhost = UnitIsGhost
local UnitIsTapDenied = UnitIsTapDenied
local UnitPowerType = UnitPowerType

-- tukui functions call
local basePostCreateAura = UnitFrames.PostCreateAura
local basePostUpdateHealth = UnitFrames.PostUpdateHealth
local basePostUpdatePower = UnitFrames.PostUpdatePower
local baseDisplayPlayerAndPetNames = UnitFrames.DisplayPlayerAndPetNames
local basePostCreateAuraBar = UnitFrames.PostCreateAuraBar
local basePreUpdateHealth = UnitFrames.PreUpdateHealth
local baseUFEnable = UnitFrames.Enable

local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}

------------------------------------------------------------------------------------------
-- DARK THEME
------------------------------------------------------------------------------------------
function UnitFrames:PreUpdateHealth(unit)
	basePreUpdateHealth(self, unit)	
	
	local Dark = C["UnitFrames"]["Colorstyle"]["Value"] == "Dark"
	local Gradient = C["UnitFrames"]["Colorstyle"]["Value"] == "Gradient"
	local Class = C["UnitFrames"]["Colorstyle"]["Value"] == "Class"
	local Custom = C["UnitFrames"]["Colorstyle"]["Value"] == "Custom"
	
	if (Gradient == true) then 
		self.colorClass = false
		self.colorReaction = false
		self.colorHealth = false
		self.colorSmooth = true
	end
	
	if (Dark == true) then 
		self.colorClass = false
		self.colorReaction = false
		self.colorHealth = false
		self.colorSmooth = false

		if (not UnitIsConnected(unit) or UnitIsDead(unit) or UnitIsGhost(unit)) then
			if (not UnitIsConnected(unit)) then
				self:SetStatusBarColor(0.45, 0.45, 0.45)
				self.Background:SetVertexColor(0.1, 0.1, 0.1)
			elseif (UnitIsDeadOrGhost(unit)) then
				self:SetStatusBarColor(0.45, 0.45, 0.45)
				self.Background:SetVertexColor(0.1, 0.1, 0.1)
			end
		else
			self:SetStatusBarColor(.2, .2, .2)
			self.Background:SetVertexColor(233/255, 0, 18/255)
		end
	end

	if (Custom == true) then 
		self.colorClass = false
		self.colorReaction = false
		self.colorHealth = false
		self.colorSmooth = false
		self:SetStatusBarColor(unpack(C["UnitFrames"]["StatusBarColor"]))
		self.Background:SetVertexColor(unpack(C["UnitFrames"]["ColorTexture"]))
	end	
end

------------------------------------------------------------------------------------------
-- HP/MAXHP Value adjustment
------------------------------------------------------------------------------------------
function UnitFrames:PostUpdateHealth(unit, min, max)

	if (not self.Value) then
		return
	end
	
	-- Tukui
	basePostUpdateHealth(self, unit, min, max)
	
	-- MaxUI
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then 
		-- Add Darktheme update for state of UF
		local DarkTheme = C["UnitFrames"]["DarkEnable"]
		
		if (DarkTheme == true) then 
			if (not UnitIsConnected(unit) or UnitIsDead(unit) or UnitIsGhost(unit)) then
				if (not UnitIsConnected(unit)) then
					self:SetStatusBarColor(0.45, 0.45, 0.45)
					self.Background:SetVertexColor(0.1, 0.1, 0.1)
				elseif (UnitIsDeadOrGhost(unit)) then
					self:SetStatusBarColor(0.45, 0.45, 0.45)
					self.Background:SetVertexColor(0.1, 0.1, 0.1)
				end
			else
				self:SetStatusBarColor(unpack(C["UnitFrames"]["StatusBarColor"]))
				self.Background:SetVertexColor(unpack(C["UnitFrames"]["ColorTexture"]))
			end
		end	
	end
end

------------------------------------------------------------------------------------------
-- MP/MAXMP Value adjustment
------------------------------------------------------------------------------------------
function UnitFrames:PostUpdatePower(unit, current, min, max)
	basePostUpdatePower(self, unit, current, min, max)

	if (not self.Value) then
		return
	end
	
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then 

		if (max and max == 0) then
			self.Value:SetText("")
			
			return
		end
		
		local Parent = self:GetParent()
		local pType, pToken = UnitPowerType(unit)
		local Colors = T["Colors"]
		local Color = Colors.power[pToken]
		
		if Color then
			if C["UnitFrames"]["PowerValueColors"]["Value"] == "PowerColor" then 
				self.Value:SetTextColor(Color[1], Color[2], Color[3])
			elseif C["UnitFrames"]["PowerValueColors"]["Value"] == "ClassColor" then 
				self.Value:SetTextColor(Color[1], Color[2], Color[3])
			elseif C["UnitFrames"]["PowerValueColors"]["Value"] == "White" then
				self.Value:SetTextColor(1, 1, 1)
			elseif C["UnitFrames"]["PowerValueColors"]["Value"] == "Custom" then
				self.Value:SetTextColor(unpack(C["UnitFrames"]["CustomPowerValueColors"]))
			end
		end
		
		if (UnitIsDead(unit) or UnitIsGhost(unit)) then
			self.Value:SetText("")
		else
			self.Value:SetFormattedText("%s | %s", UnitFrames.ShortValue(current), UnitFrames.ShortValue(max))
		end
	end
end

------------------------------------------------------------------------------------------
-- NAMEPLATES MAXUI STYLE
------------------------------------------------------------------------------------------
function UnitFrames:DisplayNameplatePowerAndCastBar(unit, cur, min, max)
	if not unit then
		unit = self:GetParent().unit
	end

	if not unit then
		return
	end

	if not cur then
		cur, max = UnitPower(unit), UnitPowerMax(unit)
	end

	local CurrentPower = cur
	local MaxPower = max
	local Nameplate = self:GetParent()
	local PowerBar = Nameplate.Power
	local IsPowerHidden = PowerBar.IsHidden

	if (CurrentPower and CurrentPower == 0) and (MaxPower and MaxPower == 0) then
		if (not IsPowerHidden) then
			PowerBar:SetAlpha(0)
			PowerBar.IsHidden = true
		end
	else
		if IsPowerHidden then
			PowerBar:SetAlpha(1)
			PowerBar.IsHidden = false
		end
	end
	
	if C["NamePlates"]["HealthBars"] ~= true then
		PowerBar:SetAlpha(0)
	end
end

------------------------------------------------------------------------------------------
-- NAME REPLACEMENT DISABLE FOR MAXUI UNITFRAMES
------------------------------------------------------------------------------------------
function UnitFrames:DisplayPlayerAndPetNames(event)
	baseDisplayPlayerAndPetNames(self, event)

	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		self.Power.Value:SetAlpha(1)
		self.Name:SetAlpha(0)
		self.Health.Value:SetAlpha(1)
	end
end

------------------------------------------------------------------------------------------
-- BUFF AND DEBUFF ICONS ADJUSTMENT
------------------------------------------------------------------------------------------
function UnitFrames:PostCreateAura(button)
	basePostCreateAura(self, button)

	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
		button.count:ClearAllPoints()
		button.count:SetPoint("TOPLEFT", button, "TOPLEFT", 1, -1)
		button.count:SetJustifyH("LEFT")
		button.count:SetFont(C["Medias"]["Font"], 10, "THINOUTLINE")
		button.count:SetScale(C["UnitFrames"]["IconCountSize"]/10)
		button.count:SetTextColor(1, 1, 0)
			
		button.Remaining:ClearAllPoints()
		if C["UnitFrames"]["RemainingTime"] == true then
			button.Remaining:SetFont(C["Medias"]["Font"], 10, "THINOUTLINE")
			button.Remaining:SetScale(C["UnitFrames"]["IconRemainingSize"]/10)
			button.Remaining:SetPoint("CENTER", button, "BOTTOM", 1, 0)
			button.Remaining:SetJustifyH("CENTER")
		end
	end	
end

function UnitFrames:PostCreateAuraBar(bar)
	basePostCreateAuraBar(self, bar)
	
	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then
	
		local AuraBarsHeight = C["UF: Player"]["AuraBarsHeight"]
		
		bar:SetReverseFill(true)
		bar.Backdrop:SetOutside()
		bar.spark:Kill()
		
		barIconBG = CreateFrame("Frame", barIconBG, bar)
		barIconBG:SetPoint("BOTTOMRIGHT", bar, "BOTTOMLEFT", -6, 0)
		barIconBG:SetWidth(AuraBarsHeight)
		barIconBG:SetHeight(AuraBarsHeight)
		barIconBG:SetFrameLevel(0)
		barIconBG:SetFrameStrata("LOW")
		barIconBG:CreateBackdrop()
		barIconBG.Backdrop:CreateShadow()
		barIconBG.Backdrop:SetOutside()
	
		bar.icon:ClearAllPoints()
		bar.icon:SetInside(barIconBG)
		bar.IconBackdrop:Hide()
	end
end

------------------------------------------------------------------------------------------
-- MaxUI LFDROLE ICONS
------------------------------------------------------------------------------------------
if T.Retail then
	function UnitFrames:SetGridGroupRole()
		local GroupRoleIndicator = self.GroupRoleIndicator
		local Role = UnitGroupRolesAssigned(self.unit)

		if Role == "TANK" then
			if C["UnitFrames"]["Roles"]["Value"] == "MaxUI Style" then
				GroupRoleIndicator:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\roleicons\\Maxtank.tga")
			elseif C["UnitFrames"]["Roles"]["Value"] == "Elvui Style" then
				GroupRoleIndicator:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\roleicons\\Elvtank.tga")
			end
			GroupRoleIndicator:Show()

		elseif Role == "HEALER" then
			if C["UnitFrames"]["Roles"]["Value"] == "MaxUI Style" then
				GroupRoleIndicator:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\roleicons\\Maxhealer.tga")
			elseif C["UnitFrames"]["Roles"]["Value"] == "Elvui Style" then
				GroupRoleIndicator:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\roleicons\\Elvhealer.tga")
			end
			GroupRoleIndicator:Show()

		elseif Role == "DAMAGER" then
			if C["UnitFrames"]["Roles"]["Value"] == "MaxUI Style" then
				GroupRoleIndicator:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\roleicons\\Maxdps.tga")
			elseif C["UnitFrames"]["Roles"]["Value"] == "Elvui Style" then
				GroupRoleIndicator:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\roleicons\\Elvdps.tga")
			end
			GroupRoleIndicator:Show()

		else
			GroupRoleIndicator:Hide()
		end
	end
end

------------------------------------------------------------------------------------------
-- Status Warmode adjustments
------------------------------------------------------------------------------------------
function UnitFrames:ShowWarMode()

end

------------------------------------------------------------------------------------------
-- UnitFrames Anchor
------------------------------------------------------------------------------------------
function UnitFrames:MaxUIAnchors()
	UFanchorwidth = C["UnitFrames"]["MaxUIAnchorWidth"]
	UFverticaladjust = C["UnitFrames"]["MaxUIAnchorVertical"]
	thickness = C["General"]["thickness"] 

	local MaxUIUnitframesAnchor = CreateFrame("StatusBar", "MaxUIUnitframesAnchor", UIParent)
	MaxUIUnitframesAnchor:SetFrameLevel(2)
	MaxUIUnitframesAnchor:SetFrameStrata("BACKGROUND")
	MaxUIUnitframesAnchor:SetAlpha(1)
	MaxUIUnitframesAnchor:CreateBackdrop()
	MaxUIUnitframesAnchor.Backdrop:SetOutside()
	MaxUIUnitframesAnchor.Backdrop:CreateShadow()
	MaxUIUnitframesAnchor:SetStatusBarTexture(T.GetTexture(C.General.LineTexture))
	
	if C["UnitFrames"]["MaxUIAnchor"] == true then
		MaxUIUnitframesAnchor:Show()
	else
		MaxUIUnitframesAnchor:Hide()
	end
	
	if C["General"]["ClassColorLines"]["Value"] == "Dark" then 
		MaxUIUnitframesAnchor:SetStatusBarColor(0.11, 0.11, 0.11)
	elseif C["General"]["ClassColorLines"]["Value"] == "ClassColor" then 
		MaxUIUnitframesAnchor:SetStatusBarColor(unpack(ClassColor))
	elseif C["General"]["ClassColorLines"]["Value"] == "BackdropColor" then 
		MaxUIUnitframesAnchor:SetStatusBarColor(unpack(C.General.BackdropColor))
	else
		MaxUIUnitframesAnchor:SetStatusBarColor(0.43, 0.43, 0.43)
	end
	
	-- tukui
	if C["Layout"]["LayoutRole"]["Value"] == "Tukui" then
		MaxUIUnitframesAnchor:SetPoint("TOP", UIParent, "CENTER", 0,  -335 +UFverticaladjust)
		MaxUIUnitframesAnchor:SetWidth(312 +UFanchorwidth)
		MaxUIUnitframesAnchor:SetHeight(thickness)

	-- melee or tank
	elseif (C["Layout"]["LayoutRole"]["Value"] == "Melee") or (C["Layout"]["LayoutRole"]["Value"] == "Tank") then 
		
		if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
			MaxUIUnitframesAnchor:SetPoint("TOP", UIParent, "CENTER", 0, -297 +UFverticaladjust)
			MaxUIUnitframesAnchor:SetWidth(300 +UFanchorwidth)
			MaxUIUnitframesAnchor:SetHeight(thickness)
		
		elseif C["Layout"]["LayoutAB"]["Value"] == "Single" then
			MaxUIUnitframesAnchor:SetPoint("TOP", UIParent, "CENTER", 0, -203 +UFverticaladjust)
			MaxUIUnitframesAnchor:SetWidth(148 +UFanchorwidth)
			MaxUIUnitframesAnchor:SetHeight(thickness)

		elseif C["Layout"]["LayoutAB"]["Value"] == "Double" then
			MaxUIUnitframesAnchor:SetPoint("TOP", UIParent, "CENTER", 0, -203 +UFverticaladjust)
			MaxUIUnitframesAnchor:SetWidth(260 +UFanchorwidth)
			MaxUIUnitframesAnchor:SetHeight(thickness)
		end
	
	-- healing 
	elseif C["Layout"]["LayoutRole"]["Value"] == "Healer" then 
		
		if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
			MaxUIUnitframesAnchor:SetPoint("TOP", UIParent, "CENTER", 0, -177 +UFverticaladjust)
			MaxUIUnitframesAnchor:SetWidth(400 +UFanchorwidth)
			MaxUIUnitframesAnchor:SetHeight(thickness)
		
		elseif C["Layout"]["LayoutAB"]["Value"] == "Single" then
			MaxUIUnitframesAnchor:SetPoint("TOP", UIParent, "CENTER", 0, -177 +UFverticaladjust)
			MaxUIUnitframesAnchor:SetWidth(400 +UFanchorwidth)
			MaxUIUnitframesAnchor:SetHeight(thickness)

		elseif C["Layout"]["LayoutAB"]["Value"] == "Double" then
			MaxUIUnitframesAnchor:SetPoint("TOP", UIParent, "CENTER", 0, -177 +UFverticaladjust)
			MaxUIUnitframesAnchor:SetWidth(400 +UFanchorwidth)
			MaxUIUnitframesAnchor:SetHeight(thickness)
		end
		
	-- range
	elseif C["Layout"]["LayoutRole"]["Value"] == "Range" then 
		
		if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
			MaxUIUnitframesAnchor:SetPoint("TOP", UIParent, "CENTER", 0, -297 +UFverticaladjust)
			MaxUIUnitframesAnchor:SetWidth(300 +UFanchorwidth)
			MaxUIUnitframesAnchor:SetHeight(thickness)
		
		elseif C["Layout"]["LayoutAB"]["Value"] == "Single" then
			MaxUIUnitframesAnchor:SetPoint("TOP", UIParent, "CENTER", 0, -203 +UFverticaladjust)
			MaxUIUnitframesAnchor:SetWidth(148 +UFanchorwidth)
			MaxUIUnitframesAnchor:SetHeight(thickness)

		elseif C["Layout"]["LayoutAB"]["Value"] == "Double" then
			MaxUIUnitframesAnchor:SetPoint("TOP", UIParent, "CENTER", 0, -203 +UFverticaladjust)
			MaxUIUnitframesAnchor:SetWidth(220 +UFanchorwidth)
			MaxUIUnitframesAnchor:SetHeight(thickness)
		end
		
	-- center chat
	elseif C["Layout"]["LayoutRole"]["Value"] == "CenterChat" then 

	end
	
	-- Vertical Unitframes
	if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
		MaxUIUnitframesAnchor:SetPoint("TOP", UIParent, "CENTER", 0, -203 +UFverticaladjust)
		MaxUIUnitframesAnchor:SetWidth(700 +UFanchorwidth)
		MaxUIUnitframesAnchor:SetHeight(thickness)
	end
	
	if (C["General"]["Themes"]["Value"] ~= "MaxUI") and (C["UnitFrames"]["Style"]["Value"] ~= "MaxUI") and C["Layout"]["LayoutRole"]["Value"] == "Tukui" then
		MaxUIUnitframesAnchor:SetPoint("TOP", UIParent, "CENTER", 0,  -400 +UFverticaladjust)
		MaxUIUnitframesAnchor:SetWidth(280 +UFanchorwidth)
		MaxUIUnitframesAnchor:SetHeight(thickness)
	end
	UnitFrames.MaxUIUnitframesAnchor = MaxUIUnitframesAnchor
end

function UnitFrames:Enable()
	-- MaxUI
	self:MaxUIAnchors()
	-- tukui
	baseUFEnable(self)
end