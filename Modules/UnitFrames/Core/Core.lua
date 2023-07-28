------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
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

-- tukui functions
local basePreUpdateHealth = UnitFrames.PreUpdateHealth
local basePostUpdateHealth = UnitFrames.PostUpdateHealth
local basePostUpdatePower = UnitFrames.PostUpdatePower
local basePostCreateAura = UnitFrames.PostCreateAura
local basePostCreateAuraBar = UnitFrames.PostCreateAuraBar
local baseDisplayPlayerAndPetNames = UnitFrames.DisplayPlayerAndPetNames
local baseDisplayNameplatePowerAndCastBar = UnitFrames.DisplayNameplatePowerAndCastBar
local baseUpdateNameplateClassIcon = UnitFrames.UpdateNameplateClassIcon
local baseShowWarMode = UnitFrames.ShowWarMode
local baseUFEnable = UnitFrames.Enable

local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}


------------------------------------------------------------------------------------------
-- EVOKER ESSENCE
------------------------------------------------------------------------------------------
function UnitFrames:UpdateMaxEssence(cur, max, hasmaxchanged, powertype, ...)
	return
end

function UnitFrames:EmpoweredCastBarOverlay()
	local CastBar = self.Castbar
	local CastHeight = C["UF: Player"]["CastHeight"]
	local CastWidth = C["UF: Player"]["CastWidth"]
	local CastFont = T.GetFont(C["UF: Player"]["CastFont"])
	local CastFontSize = C["UF: Player"]["CastFontSize"]/10
	local CastBarTexture = T.GetTexture(C["UF: Player"]["CastTexture"])

	if not CastBar.stage4 then
		CastBar.stage4 = CastBar:CreateTexture(nil, "ARTWORK")
		CastBar.stage4:SetDrawLayer("ARTWORK", 5)
		CastBar.stage4:SetPoint("TOPRIGHT", CastBar, "TOPRIGHT", 0, 0)
		CastBar.stage4:SetPoint("BOTTOMRIGHT", CastBar, "BOTTOMRIGHT", 0, 0)
		CastBar.stage4:SetWidth(CastWidth*0.27)
		CastBar.stage4:SetTexture(CastBarTexture)
		CastBar.stage4:SetVertexColor(0, 1, 0)
		CastBar.stage4:SetAlpha(0.4)
		CastBar.stage4:Hide()
		
		CastBar.stage4text = CastBar:CreateFontString(nil, "OVERLAY")
		CastBar.stage4text:SetFont(C.Medias.Font, 14)
		CastBar.stage4text:SetJustifyH("CENTER")
		CastBar.stage4text:SetPoint("CENTER", CastBar.stage4, "CENTER", 0, 0)
		CastBar.stage4text:SetTextColor(0, 0, 0)
		CastBar.stage4text:SetText("IV")	
		CastBar.stage4text:SetAlpha(0.3)
		CastBar.stage4text:Hide()
	end

	if not CastBar.stage3 then
		CastBar.stage3 = CastBar:CreateTexture(nil, "ARTWORK")
		CastBar.stage3:SetDrawLayer("ARTWORK", 5)
		CastBar.stage3:SetPoint("TOPRIGHT", CastBar.stage4, "TOPLEFT", 0, 0)
		CastBar.stage3:SetPoint("BOTTOMRIGHT", CastBar.stage4, "BOTTOMLEFT", 0, 0)
		CastBar.stage3:SetWidth(CastWidth*0.17)
		CastBar.stage3:SetTexture(CastBarTexture)
		CastBar.stage3:SetVertexColor(1, 1, 0)
		CastBar.stage3:SetAlpha(0.4)
		CastBar.stage3:Hide()

		CastBar.stage3text = CastBar:CreateFontString(nil, "OVERLAY")
		CastBar.stage3text:SetFont(C.Medias.Font, 14)
		CastBar.stage3text:SetJustifyH("CENTER")
		CastBar.stage3text:SetPoint("CENTER", CastBar.stage3, "CENTER", 0, 0)
		CastBar.stage3text:SetTextColor(0, 0, 0)
		CastBar.stage3text:SetText("III")	
		CastBar.stage3text:SetAlpha(0.3)
		CastBar.stage3text:Hide()
	end

	if not CastBar.stage2 then
		CastBar.stage2 = CastBar:CreateTexture(nil, "ARTWORK")
		CastBar.stage2:SetDrawLayer("ARTWORK", 5)
		CastBar.stage2:SetPoint("TOPRIGHT", CastBar.stage3, "TOPLEFT", 0, 0)
		CastBar.stage2:SetPoint("BOTTOMRIGHT", CastBar.stage3, "BOTTOMLEFT", 0, 0)
		CastBar.stage2:SetWidth(CastWidth*0.17)
		CastBar.stage2:SetTexture(CastBarTexture)
		CastBar.stage2:SetVertexColor(1, .5, 0)
		CastBar.stage2:SetAlpha(0.4)
		CastBar.stage2:Hide()

		CastBar.stage2text = CastBar:CreateFontString(nil, "OVERLAY")
		CastBar.stage2text:SetFont(C.Medias.Font, 14)
		CastBar.stage2text:SetJustifyH("CENTER")
		CastBar.stage2text:SetPoint("CENTER", CastBar.stage2, "CENTER", 0, 0)
		CastBar.stage2text:SetTextColor(0, 0, 0)
		CastBar.stage2text:SetText("II")	
		CastBar.stage2text:SetAlpha(0.3)
		CastBar.stage2text:Hide()
	end

	if not CastBar.stage1 then
		CastBar.stage1 = CastBar:CreateTexture(nil, "ARTWORK")
		CastBar.stage1:SetDrawLayer("ARTWORK", 5)
		CastBar.stage1:SetPoint("TOPRIGHT", CastBar.stage2, "TOPLEFT", 0, 0)
		CastBar.stage1:SetPoint("BOTTOMRIGHT", CastBar.stage2, "BOTTOMLEFT", 0, 0)
		CastBar.stage1:SetWidth(CastWidth*0.17)
		CastBar.stage1:SetTexture(CastBarTexture)
		CastBar.stage1:SetVertexColor(1, 0, 0)
		CastBar.stage1:SetAlpha(0.4)
		CastBar.stage1:Hide()

		CastBar.stage1text = CastBar:CreateFontString(nil, "OVERLAY")
		CastBar.stage1text:SetFont(C.Medias.Font, 14)
		CastBar.stage1text:SetJustifyH("CENTER")
		CastBar.stage1text:SetPoint("CENTER", CastBar.stage1, "CENTER", 0, 0)
		CastBar.stage1text:SetTextColor(0, 0, 0)
		CastBar.stage1text:SetText("I")	
		CastBar.stage1text:SetAlpha(0.3)
		CastBar.stage1text:Hide()
	end	
end

function UnitFrames:EmpoweredCastBarUpdate(event)
	if event == "UNIT_SPELLCAST_EMPOWER_START" then
		CastBar.stage4:Show()
		CastBar.stage4text:Show()

		CastBar.stage3:Show()
		CastBar.stage3text:Show()

		CastBar.stage2:Show()
		CastBar.stage2text:Show()

		CastBar.stage1:Show()
		CastBar.stage1text:Show()
	else	
		CastBar.stage4:Hide()
		CastBar.stage4text:Hide()

		CastBar.stage3:Hide()
		CastBar.stage3text:Hide()

		CastBar.stage2:Hide()
		CastBar.stage2text:Hide()

		CastBar.stage1:Hide()
		CastBar.stage1text:Hide()
	end	
end

------------------------------------------------------------------------------------------
-- Death Icon
------------------------------------------------------------------------------------------
local function CreateDeathIcon(self)
	self.Deathicon = self:CreateTexture(nil, "ARTWORK")
	self.Deathicon:SetPoint("CENTER", self, "CENTER", 0, 0)
	self.Deathicon:SetWidth(28)
	self.Deathicon:SetHeight(28)
	self.Deathicon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Custom\DeathIcon.tga]])
	self.Deathicon:SetAlpha(0)
end

------------------------------------------------------------------------------------------
-- DARK THEME
------------------------------------------------------------------------------------------
function UnitFrames:PreUpdateHealth(unit)
	basePreUpdateHealth(self, unit)	
	
	local Dark = C["UnitFrames"]["Colorstyle"]["Value"] == "Dark"
	local Gradient = C["UnitFrames"]["Colorstyle"]["Value"] == "Gradient"
	local Class = C["UnitFrames"]["Colorstyle"]["Value"] == "Class"
	local Custom = C["UnitFrames"]["Colorstyle"]["Value"] == "Custom"

	--CreateDeathIcon(self, unit)

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

	--if (UnitIsDead(unit) or UnitIsGhost(unit)) then
	--	self.Deathicon:SetAlpha(1)
	--else	
	--	self.Deathicon:SetAlpha(0)
	--end
end

------------------------------------------------------------------------------------------
-- HP/MAXHP Value adjustment
------------------------------------------------------------------------------------------
function UnitFrames:PostUpdateHealth(unit, min, max)
	if (not self.Value) then return	end
	basePostUpdateHealth(self, unit, min, max)
	
	-- Added
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

	--if (UnitIsDead(unit) or UnitIsGhost(unit)) then
	--	self.Deathicon:SetAlpha(1)
	--else	
	--	self.Deathicon:SetAlpha(0)
	--end
end

------------------------------------------------------------------------------------------
-- MP/MAXMP Value adjustment
------------------------------------------------------------------------------------------
-- this one I need to check with tags usage and if it is still needed, now often Power.PostUpdate set to nil.

function UnitFrames:PostUpdatePower(unit, current, min, max)
	if (not self.Value) then return	end
	basePostUpdatePower(self, unit, current, min, max)

	--if (max and max == 0) then
	--	self.Value:SetText("")
	--	return
	--end

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

------------------------------------------------------------------------------------------
-- NAMEPLATES CLASS ICON MAXUI STYLE
------------------------------------------------------------------------------------------
function UnitFrames:UpdateNameplateClassIcon()
	if C["NamePlates"]["Style"]["Value"] == "MaxUI" then
		if UnitIsPlayer(self.unit) then
			local Class = select(2, UnitClass(self.unit))

			if Class then
				if Class == "DRUID" then
					self.ClassIcon.Texture:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\vector style\Druid.tga]])
				elseif Class == "EVOKER" then
					self.ClassIcon.Texture:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\vector style\Evoker.tga]])
				elseif Class == "MONK" then
					self.ClassIcon.Texture:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\vector style\Monk.tga]])
				elseif Class == "ROGUE" then
					self.ClassIcon.Texture:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\vector style\Rogue.tga]])
				elseif Class == "MAGE" then
					self.ClassIcon.Texture:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\vector style\Mage.tga]])
				elseif Class == "PRIEST" then
					self.ClassIcon.Texture:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\vector style\Priest.tga]])
				elseif Class == "WARLOCK" then
					self.ClassIcon.Texture:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\vector style\Warlock.tga]])
				elseif Class == "SHAMAN" then
					self.ClassIcon.Texture:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\vector style\Shaman.tga]])
				elseif Class == "HUNTER" then
					self.ClassIcon.Texture:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\vector style\Hunter.tga]])
				elseif Class == "DEATHKNIGHT" then
					self.ClassIcon.Texture:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\vector style\DeathKnight.tga]])
				elseif Class == "WARRIOR" then
					self.ClassIcon.Texture:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\vector style\Warrior.tga]])
				elseif Class == "PALADIN" then
					self.ClassIcon.Texture:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\vector style\Paladin.tga]])
				elseif Class == "DEMONHUNTER" then
					self.ClassIcon.Texture:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\vector style\DemonHunter.tga]])
				end
				self.ClassIcon:SetAlpha(1)
			end	
		else
			self.ClassIcon:SetAlpha(0)
		end
	else
		baseUpdateNameplateClassIcon(self)
	end
end

------------------------------------------------------------------------------------------
-- NAMEPLATES MAXUI STYLE
------------------------------------------------------------------------------------------
function UnitFrames:DisplayNameplatePowerAndCastBar(unit, cur, min, max)
	if C["NamePlates"]["Style"]["Value"] == "MaxUI" then
		if not unit then
			unit = self:GetParent().unit
		end

		if not unit then return	end

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
	else
		baseDisplayNameplatePowerAndCastBar(self, unit, cur, min, max)
	end
end

------------------------------------------------------------------------------------------
-- NAME REPLACEMENT DISABLE FOR MAXUI UNITFRAMES
------------------------------------------------------------------------------------------
function UnitFrames:DisplayPlayerAndPetNames(event)
	baseDisplayPlayerAndPetNames(self, event)

	if C["UnitFrames"]["Style"]["Value"] ~= "Tukui" then
		self.Power.Value:SetAlpha(1)
		self.Name:SetAlpha(0)
		self.Health.Value:SetAlpha(1)
	end	
end

------------------------------------------------------------------------------------------
-- BUFF AND DEBUFF ICONS ADJUSTMENT
------------------------------------------------------------------------------------------
function UnitFrames:PostCreateAura(button, unit)
	basePostCreateAura(self, button, unit)
	
	local Cooldown = button.Cooldown or button.cd
	local Icon = button.Icon or button.icon
	local Count = button.Count or button.count

	if Cooldown then
		Cooldown.noOCC = true
		Cooldown.noCooldownCount = true
		Cooldown:SetReverse(true)
		Cooldown:ClearAllPoints()
		Cooldown:SetInside()
		
		if T.Retail and C["UnitFrames"]["RemainingTime"] == true then
			local NumRegions = Cooldown:GetNumRegions()

			for i = 1, NumRegions do
				local Region = select(i, Cooldown:GetRegions())

				if Region.GetText then
					local Font = T.GetFont(C["UnitFrames"]["RemainingTimeFont"])

					Font = _G[Font]:GetFont()

					Region:ClearAllPoints()
					Region:SetFont(Font, 10, "OUTLINE")
					Region:SetPoint(C["UnitFrames"]["RemainingTimePosition"]["Value"], button, C["UnitFrames"]["RemainingTimePosition"]["Value"], C["UnitFrames"]["RemainingTimeOffsetH"], C["UnitFrames"]["RemainingTimeOffsetV"])
					Region:SetScale(C["UnitFrames"]["RemainingTimeSize"]/10)
					Region:SetJustifyH(C["UnitFrames"]["RemainingTimeJustifyH"]["Value"])
					Region:SetTextColor(unpack(C["UnitFrames"]["RemainingTimeColor"]))
				end
			end
		else
			Cooldown:SetHideCountdownNumbers(true)
		end			

		if C["UnitFrames"]["RemainingTime"] == true then
			local Font = T.GetFont(C["UnitFrames"]["RemainingTimeFont"])
			Font = _G[Font]:GetFont()
			
			button.Remaining:ClearAllPoints()
			button.Remaining:SetFont(Font, 10, "OUTLINE")
			button.Remaining:SetPoint(C["UnitFrames"]["RemainingTimePosition"]["Value"], button, C["UnitFrames"]["RemainingTimePosition"]["Value"], C["UnitFrames"]["RemainingTimeOffsetH"], C["UnitFrames"]["RemainingTimeOffsetV"])
			button.Remaining:SetScale(C["UnitFrames"]["RemainingTimeSize"]/10)
			button.Remaining:SetJustifyH(C["UnitFrames"]["RemainingTimeJustifyH"]["Value"])
			button.Remaining:SetTextColor(unpack(C["UnitFrames"]["RemainingTimeColor"]))
		end
	end	

	if Count and C["UnitFrames"]["Count"] then
		local Font = T.GetFont(C["UnitFrames"]["CountFont"])
		Font = _G[Font]:GetFont()
		
		Count:ClearAllPoints()
		Count:SetPoint(C["UnitFrames"]["CountPosition"]["Value"], button, C["UnitFrames"]["CountPosition"]["Value"], C["UnitFrames"]["CountOffsetH"], C["UnitFrames"]["CountOffsetV"])
		Count:SetFont(Font, 10, "OUTLINE")
		Count:SetScale(C["UnitFrames"]["CountSize"]/10)
		Count:SetJustifyH(C["UnitFrames"]["CountJustifyH"]["Value"])
		Count:SetTextColor(unpack(C["UnitFrames"]["CountColor"]))		
	else
		Count:Hide()
	end

	if C["Skins"]["AurasFilter"] == true then 
		button:CreateMaxUIFilterInside()
	end
end

function UnitFrames:PostCreateAuraBar(bar)
	basePostCreateAuraBar(self, bar)
	
	local AuraBarsHeight = C["UF: Player"]["AuraBarsHeight"]
	
	bar.Backdrop:SetOutside()
	bar.spark:Kill()
	
	barIconBG = CreateFrame("Frame", barIconBG, bar)
	barIconBG:SetWidth(AuraBarsHeight)
	barIconBG:SetHeight(AuraBarsHeight)
	barIconBG:SetFrameLevel(0)
	barIconBG:SetFrameStrata("LOW")
	barIconBG:CreateBackdrop()
	barIconBG.Backdrop:CreateShadow()
	barIconBG.Backdrop:SetOutside()

	if C["UF: Player"]["AuraBarsAlignment"]["Value"] == "LEFT" then
		barIconBG:SetPoint("BOTTOMRIGHT", bar, "BOTTOMLEFT", -6, 0)
		bar:SetReverseFill(true)
	else
		barIconBG:SetPoint("BOTTOMLEFT", bar, "BOTTOMRIGHT", 6, 0)
	end

	bar.icon:ClearAllPoints()
	bar.icon:SetInside(barIconBG)
	bar.IconBackdrop:Hide()
		
	if C["Skins"]["AurasFilter"] == true then 
		bar:CreateMaxUIFilter()
		barIconBG:CreateMaxUIFilterInside()
	end
end

------------------------------------------------------------------------------------------
-- Status Warmode adjustments
------------------------------------------------------------------------------------------
function UnitFrames:ShowWarMode()
	baseShowWarMode(self)
	self.RestingIndicator:SetAlpha(1)
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
				GroupRoleIndicator:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\Icons\\Role\\Maxtank.tga")
			elseif C["UnitFrames"]["Roles"]["Value"] == "Elvui Style" then
				GroupRoleIndicator:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\Icons\\Role\\Elvtank.tga")
			end
			GroupRoleIndicator:Show()

		elseif Role == "HEALER" then
			if C["UnitFrames"]["Roles"]["Value"] == "MaxUI Style" then
				GroupRoleIndicator:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\Icons\\Role\\Maxhealer.tga")
			elseif C["UnitFrames"]["Roles"]["Value"] == "Elvui Style" then
				GroupRoleIndicator:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\Icons\\Role\\Elvhealer.tga")
			end
			GroupRoleIndicator:Show()

		elseif Role == "DAMAGER" then
			if C["UnitFrames"]["Roles"]["Value"] == "MaxUI Style" then
				GroupRoleIndicator:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\Icons\\Role\\Maxdps.tga")
			elseif C["UnitFrames"]["Roles"]["Value"] == "Elvui Style" then
				GroupRoleIndicator:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\Icons\\Role\\Elvdps.tga")
			end
			GroupRoleIndicator:Show()

		else
			GroupRoleIndicator:Hide()
		end
	end
end

------------------------------------------------------------------------------------------
-- UnitFrames Anchor
------------------------------------------------------------------------------------------
function UnitFrames:MaxUIAnchors()
	local UFanchorwidth = C["UnitFrames"]["MaxUIAnchorWidth"]
	local UFverticaladjust = C["UnitFrames"]["MaxUIAnchorVertical"]
	local thickness = C["General"]["thickness"] 

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
	self:MaxUIAnchors()
	baseUFEnable(self)
end