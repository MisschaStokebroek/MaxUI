------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up ANIMA BAR

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()

if not T.Retail then return end

local Movers = T["Movers"]
local DataText = T["DataTexts"]
local Anima = CreateFrame("Frame", nil, UIParent)
local HideTooltip = GameTooltip_Hide
local Bars = 20
Anima.NumBars = 1

local Class = select(2, UnitClass("player"))
local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
Anima.AnimaColor = {153 / 255, 204 / 255, 255 / 255}

local AnimaFrameHolder = CreateFrame("Frame", "AnimaFrameHolder", UIParent)
AnimaFrameHolder:SetHeight(22) 
AnimaFrameHolder:SetWidth(200)

------------------------------------------------------------------------------------------
-- AZERITE TOOLTIP
------------------------------------------------------------------------------------------
function Anima:SetTooltip()
	local BarType = self.BarType
	local Current, Max, Pts
	Current, Max = Anima:GetAnima()

	GameTooltip:SetOwner(self, "ANCHOR_CURSOR", 0, 8)

	if Max == 0 then
		return
	end

	local Level = C_CovenantSanctumUI.GetRenownLevel()

	GameTooltip:AddLine("Anima:")
	GameTooltip:AddLine("Current tracked Anima and Renown state", 1, 1, 1, 1, 1, 1)
	GameTooltip:AddLine(" ")
	if Current == 0 then
		GameTooltip:AddLine("|cff99CCFFNo anima collected yet|r")
	else
		GameTooltip:AddLine("|cffFF3333"..COVENANT_SANCTUM_TAB_RENOWN.." "..LEVEL..": " .. Level)
		GameTooltip:AddLine("|cff99CCFF"..ANIMA_DIVERSION_CURRENCY_TOOLTIP_TITLE..": " .. Current .. " / " .. Max .. " (" .. floor(Current / Max * 100) .. "%)")
	end
	GameTooltip:Show()
end

------------------------------------------------------------------------------------------
-- ANIMA CREATE
------------------------------------------------------------------------------------------
function Anima:GetAnima()
	local CurrencyID, MaxDisplayableValue = C_CovenantSanctumUI.GetAnimaInfo()
	local CurrencyInfo = C_CurrencyInfo.GetCurrencyInfo(CurrencyID)
	local Current = CurrencyInfo.quantity 
	local Max = CurrencyInfo.maxQuantity
	
	return Current, Max
end

function Anima:Create()
	for i = 1, self.NumBars do
		local AnimaBar = CreateFrame("StatusBar", nil, UIParent)

		local BarHeight = C["Misc"]["ANIMABarHeight"]
		local BarWidth = C["Misc"]["ANIMABarWidth"]
		local BarTexture = C["Misc"]["ANIMABarTexture"]

		AnimaBar:EnableMouse()
		AnimaBar:SetFrameStrata("BACKGROUND")
		AnimaBar:CreateBackdrop()
		AnimaBar.Backdrop:CreateShadow()
		AnimaBar.Backdrop:SetOutside()
		AnimaBar:SetScript("OnEnter", Anima.SetTooltip)
		AnimaBar:SetScript("OnLeave", HideTooltip)
		
		AnimaBar:ClearAllPoints()
		AnimaBar:SetParent(AnimaFrameHolder)
		AnimaBar:SetPoint("CENTER", AnimaFrameHolder, "CENTER", 0, 0)
		AnimaBar:SetWidth(BarWidth)
		AnimaBar:SetHeight(BarHeight)
		
		AnimaBar:SetOrientation'HORIZONTAL'
		AnimaBar:SetFrameLevel(11)
		AnimaBar:SetStatusBarTexture(T.GetTexture(BarTexture))
		
		--AnimaBar:SetScript("OnMouseUp", function(self) GarrisonLandingPage_Toggle() end)
		
		local Animatext = AnimaBar:CreateFontString(nil, "OVERLAY")
		Animatext:SetFontObject(T.GetFont(C["DataTexts"].Font))
		Animatext:SetScale(C.DataTexts.FontSize/10)
		Animatext:SetPoint("RIGHT", AnimaBar, "LEFT", -6, 0)
		Animatext:SetText("Anima")

		NoAnimatext = self:CreateFontString(nil, "OVERLAY")
		NoAnimatext:SetFontObject(T.GetFont(C["DataTexts"].Font))
		NoAnimatext:SetScale(C.DataTexts.FontSize/10)
		NoAnimatext:SetPoint("CENTER", AnimaBar, "CENTER", 0, 0)
		NoAnimatext:Hide()

		Animapercenttext = AnimaBar:CreateFontString(nil, "OVERLAY")
		if C["Misc"]["PercentageTag"] == true then
			Animapercenttext:SetFontObject(T.GetFont(C["DataTexts"].Font))
			Animapercenttext:SetScale(C.DataTexts.FontSize/10)
			Animapercenttext:SetPoint("LEFT", AnimaBar, "RIGHT", 6, 0)
		end	

		AnimaBar:HookScript("OnEnter", function(self)
			AnimaBar.Backdrop:SetBorderColor(AnimaBar:GetStatusBarColor())
		end)

		AnimaBar:HookScript("OnLeave", function(self)
			AnimaBar.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
		end)
	
		self["AnimaBar"..i] = AnimaBar
	end	
		
	self:RegisterEvent("PLAYER_XP_UPDATE")
	self:RegisterEvent("PLAYER_UPDATE_RESTING")
	self:RegisterEvent("UPDATE_FACTION")
	self:RegisterEvent("PLAYER_LEVEL_UP")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("CURRENCY_DISPLAY_UPDATE")

	self:SetScript("OnEvent", self.Update)
end

------------------------------------------------------------------------------------------
-- ANIMA UPDATE
------------------------------------------------------------------------------------------
function Anima:Update()
	for i = 1, self.NumBars do
		local AnimaCurrency = C_CovenantSanctumUI.GetAnimaInfo()
		local AnimaCurrencyInfo = C_CurrencyInfo.GetCurrencyInfo(AnimaCurrency)

		local Bar = self["AnimaBar"..i]
		if AnimaCurrency then
			Bar.BarType = "ANIMA"
			local Current, Max = Anima:GetAnima()

			Bar:SetMinMaxValues(0, Max)
			Bar:SetValue(Current)
			Bar:SetStatusBarColor(unpack(self.AnimaColor))
			
			if C["Misc"]["PercentageTag"] == true and Current ~= 0 then
				Animapercenttext:SetText("".. floor(Current / Max * 100) .."%")
			end
		else
			Bar:Hide()
			NoAnimatext:SetText("No Anima")
			NoAnimatext:Show() -- showing in combat
		end	
	end	
end

------------------------------------------------------------------------------------------
-- ANIMA ENABLE / DISABLE
------------------------------------------------------------------------------------------
function Anima:Enable()
	if not C["Misc"]["ANIMABarEnable"] then return end

	if not self.IsCreated then
		self:Create()
		self.IsCreated = true
	end
	
	for i = 1, self.NumBars do
		if not self["AnimaBar"..i]:IsShown() then
			self["AnimaBar"..i]:Show()
		end
	end
end

function Anima:Disable()
	for i = 1, self.NumBars do
		if self["AnimaBar"..i]:IsShown() then
			self["AnimaBar"..i]:Hide()
		end
	end	
end

function Anima:OnEvent(event)
	self:Enable()
end

Anima:RegisterEvent("PLAYER_LOGIN")
Anima:SetScript("OnEvent", Anima.OnEvent)

T.Miscellaneous.Anima = Anima

------------------------------------------------------------------------------------------
-- ANIMA DATATEXT 
------------------------------------------------------------------------------------------
local Update = function(self)
	if not C["Misc"]["ANIMABarEnable"] then return end
	AnimaFrameHolder:ClearAllPoints()
	AnimaFrameHolder:SetPoint("CENTER", self, "CENTER", 0, 0)
	AnimaFrameHolder:SetParent(self)
end

local OnMouseDown = function()
	if InCombatLockdown() then
		T.Print(ERR_NOT_IN_COMBAT)

		return
	end
	GarrisonLandingPage_Toggle()
end

local Enable = function(self)
	if not C["Misc"]["ANIMABarEnable"] then return end
	self:Update()
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:SetScript("OnEvent", self.Update)
	self:SetScript("OnMouseDown", OnMouseDown)
end

local Disable = function(self)
	if not C["Misc"]["ANIMABarEnable"] then return end
	self.Text:SetText("")
	self:SetScript("OnUpdate", nil)
	self:SetScript("OnMouseDown", nil)
end

DataText:Register("|cffFFFF99Anima|r", Enable, Disable, Update)