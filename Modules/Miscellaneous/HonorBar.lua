------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up HONOR BAR

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()

if not T.Retail then return end

local Movers = T["Movers"]
local DataText = T["DataTexts"]
local Honor = CreateFrame("Frame", nil, UIParent)
local HideTooltip = GameTooltip_Hide
local Bars = 20
Honor.NumBars = 1

local Class = select(2, UnitClass("player"))
local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
Honor.HNColor = {222/255, 22/255, 22/255}

local HonorFrameHolder = CreateFrame("Frame", "HonorFrameHolder", UIParent)
HonorFrameHolder:SetHeight(22) 
HonorFrameHolder:SetWidth(200)

------------------------------------------------------------------------------------------
-- HONOR TOOLTIP
------------------------------------------------------------------------------------------
function Honor:SetTooltip()
	local BarType = self.BarType
	local Current, Max, Pts
	local Level = UnitHonorLevel("player")
	Current, Max = Honor:GetHonor()

	GameTooltip:SetOwner(self, "ANCHOR_CURSOR", 0, 8)

	GameTooltip:AddLine("Honor & Prestige:")
	if Max == 0 then
		GameTooltip:AddLine(PVP_HONOR_PRESTIGE_AVAILABLE)
		GameTooltip:AddLine(PVP_HONOR_XP_BAR_CANNOT_PRESTIGE_HERE)
	else
		GameTooltip:AddLine("|cffcccccc"..RANK..": " .. Level .. "|r")
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine("|cffee2222"..HONOR..": " .. Current .. " / " .. Max .. " (" .. floor(Current / Max * 100) .. "% - " .. floor(Bars - (Bars * (Max - Current) / Max)) .. "/" .. Bars .. ")|r")
	end
	
	GameTooltip:Show()
end

------------------------------------------------------------------------------------------
-- HONOR CREATE 
------------------------------------------------------------------------------------------
function Honor:GetHonor()
	return UnitHonor("player"), UnitHonorMax("player")
end

function Honor:Create()
	for i = 1, self.NumBars do
		local HonorBar = CreateFrame("StatusBar", nil, UIParent)

		local BarHeight = C["Misc"]["HONORBarHeight"]
		local BarWidth = C["Misc"]["HONORBarWidth"]
		local BarTexture = C["Misc"]["HONORBarTexture"]

		HonorBar:EnableMouse()
		HonorBar:SetFrameStrata("BACKGROUND")
		HonorBar:CreateBackdrop()
		HonorBar.Backdrop:CreateShadow()
		HonorBar.Backdrop:SetOutside()
		HonorBar:SetScript("OnEnter", Honor.SetTooltip)
		HonorBar:SetScript("OnLeave", HideTooltip)
		
		HonorBar:ClearAllPoints()
		HonorBar:SetParent(HonorFrameHolder)
		HonorBar:SetPoint("CENTER", HonorFrameHolder, "CENTER", 0, 0)
		HonorBar:SetWidth(BarWidth)
		HonorBar:SetHeight(BarHeight)
		
		HonorBar:SetOrientation'HORIZONTAL'
		HonorBar:SetFrameLevel(11)
		HonorBar:SetStatusBarTexture(T.GetTexture(BarTexture))
		
		--HonorBar:SetScript("OnMouseDown", function(self)
		--	TogglePVPUI()
		--end)

		local Honortext = HonorBar:CreateFontString(nil, "OVERLAY")
		Honortext:SetFontObject(T.GetFont(C["DataTexts"].Font))
		Honortext:SetScale(C.DataTexts.FontSize/10)
		Honortext:SetPoint("RIGHT", HonorBar, "LEFT", -6, 0)
		Honortext:SetText("Honor")

		Honorpercenttext = HonorBar:CreateFontString(nil, "OVERLAY")
		if C["Misc"]["PercentageTag"] == true then
			Honorpercenttext:SetFontObject(T.GetFont(C["DataTexts"].Font))
			Honorpercenttext:SetScale(C.DataTexts.FontSize/10)
			Honorpercenttext:SetPoint("LEFT", HonorBar, "RIGHT", 6, 0)
		end	

		HonorBar:HookScript("OnEnter", function(self)
			HonorBar.Backdrop:SetBorderColor(HonorBar:GetStatusBarColor())
		end)

		HonorBar:HookScript("OnLeave", function(self)
			HonorBar.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
		end)
	
		self["HonorBar"..i] = HonorBar
	end	
		
	self:RegisterEvent("PLAYER_XP_UPDATE")
	self:RegisterEvent("PLAYER_LEVEL_UP")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("UNIT_INVENTORY_CHANGED")
	self:RegisterEvent("HONOR_XP_UPDATE")
	self:RegisterEvent("HONOR_LEVEL_UPDATE")
	self:SetScript("OnEvent", self.Update)
end

------------------------------------------------------------------------------------------
-- HONOR UPDATE 
------------------------------------------------------------------------------------------
function Honor:Update()
	for i = 1, self.NumBars do
		local Bar = self["HonorBar"..i]
		
		Bar.BarType = "HONOR"
		local Current, Max = self:GetHonor()
		local BarType = Bar.BarType

		Bar:SetMinMaxValues(0, Max)
		Bar:SetValue(Current)
		Bar:SetStatusBarColor(unpack(self.HNColor))
		
		if C["Misc"]["PercentageTag"] == true then
			Honorpercenttext:SetText("".. floor(Current / Max * 100) .."%")
		end	
	end	
end

------------------------------------------------------------------------------------------
-- HONOR ENABLE/DISABLE 
------------------------------------------------------------------------------------------
function Honor:Enable()
	if not C["Misc"]["HONORBarEnable"] then return end

	if not self.IsCreated then
		self:Create()
		self.IsCreated = true
	end
	
	for i = 1, self.NumBars do
		if not self["HonorBar"..i]:IsShown() then
			self["HonorBar"..i]:Show()
		end
	end
end

function Honor:Disable()
	for i = 1, self.NumBars do
		if self["HonorBar"..i]:IsShown() then
			self["HonorBar"..i]:Hide()
		end
	end	
end

function Honor:OnEvent(event)
	self:Enable()
end

Honor:RegisterEvent("PLAYER_LOGIN")
Honor:SetScript("OnEvent", Honor.OnEvent)

T.Miscellaneous.Honor = Honor

------------------------------------------------------------------------------------------
-- HONOR DATATEXT 
------------------------------------------------------------------------------------------
local Update = function(self)
	if not C["Misc"]["HONORBarEnable"] then return end
	HonorFrameHolder:ClearAllPoints()
	HonorFrameHolder:SetPoint("CENTER", self, "CENTER", 0, 0)
	HonorFrameHolder:SetParent(self)
end

local OnMouseDown = function()
	if InCombatLockdown() then
		T.Print(ERR_NOT_IN_COMBAT)

		return
	end
	TogglePVPUI()
end

local Enable = function(self)
	if not C["Misc"]["HONORBarEnable"] then return end
	self:Update()
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:SetScript("OnMouseDown", OnMouseDown)
	self:SetScript("OnEvent", self.Update)
end

local Disable = function(self)
	if not C["Misc"]["HONORBarEnable"] then return end
	self.Text:SetText("")
	self:SetScript("OnMouseDown", nil)
	self:SetScript("OnUpdate", nil)
end

DataText:Register("|cffFFFF99Honor|r", Enable, Disable, Update)