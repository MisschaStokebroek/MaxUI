------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-07-2021
------------------------------------------------------------------------------------------

-- setting up AZERITE BAR

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()

if not T.Retail then return end

local Movers = T["Movers"]
local DataText = T["DataTexts"]
local Azerite = CreateFrame("Frame", nil, UIParent)
local HideTooltip = GameTooltip_Hide
local Bars = 20
Azerite.NumBars = 1

local Class = select(2, UnitClass("player"))
local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
Azerite.AZColor = {229 / 255, 204 / 255, 127 / 255}

local AzeriteFrameHolder = CreateFrame("Frame", "AzeriteFrameHolder", UIParent)
AzeriteFrameHolder:SetHeight(22) 
AzeriteFrameHolder:SetWidth(200)

------------------------------------------------------------------------------------------
-- AZERITE TOOLTIP
------------------------------------------------------------------------------------------
function Azerite:SetTooltip()
	local AzeriteItems = C_AzeriteItem.FindActiveAzeriteItem()
	
	if not AzeriteItems then return end

	GameTooltip:SetOwner(self, "ANCHOR_CURSOR", 0, 8)

	Current, Max, Level, Items = Azerite:GetAzerite()

	if Max == 0 then
		return
	end

	local RemainingXP = Max - Current
	local AzeriteItem = Item:CreateFromItemLocation(Items)
	local ItemName = AzeriteItem:GetItemName()

	GameTooltip:AddLine("Azerite:")
	GameTooltip:AddLine(AZERITE_POWER_TOOLTIP_BODY:format(ItemName), 1, 1, 1, 1, 1, 1)
	GameTooltip:AddLine(' ')
	GameTooltip:AddDoubleLine(ItemName..' ('..Level..')', format(ISLANDS_QUEUE_WEEKLY_QUEST_PROGRESS, Current, Max), 0.90, 0.80, 0.50)
	
	GameTooltip:Show()
end

------------------------------------------------------------------------------------------
-- AZERITE CREATE
------------------------------------------------------------------------------------------
function Azerite:GetAzerite()
	local AzeriteItems = C_AzeriteItem.FindActiveAzeriteItem()
	
	if not AzeriteItems then return end
	
	local XP, TotalXP = C_AzeriteItem.GetAzeriteItemXPInfo(AzeriteItems)
	local Level = C_AzeriteItem.GetPowerLevel(AzeriteItems)

	return XP, TotalXP, Level, AzeriteItems
end

function Azerite:Create()
	for i = 1, self.NumBars do
		local AzeriteBar = CreateFrame("StatusBar", nil, UIParent)

		local BarHeight = C["Misc"]["AZERITEBarHeight"]
		local BarWidth = C["Misc"]["AZERITEBarWidth"]
		local BarTexture = C["Misc"]["AZERITEBarTexture"]

		AzeriteBar:EnableMouse()
		AzeriteBar:SetFrameStrata("BACKGROUND")
		AzeriteBar:CreateBackdrop()
		AzeriteBar.Backdrop:CreateShadow()
		AzeriteBar.Backdrop:SetOutside()
		AzeriteBar:SetScript("OnEnter", Azerite.SetTooltip)
		AzeriteBar:SetScript("OnLeave", HideTooltip)
		
		AzeriteBar:ClearAllPoints()
		AzeriteBar:SetParent(AzeriteFrameHolder)
		AzeriteBar:SetPoint("CENTER", AzeriteFrameHolder, "CENTER", 0, 0)
		AzeriteBar:SetWidth(BarWidth)
		AzeriteBar:SetHeight(BarHeight)
		
		AzeriteBar:SetOrientation'HORIZONTAL'
		AzeriteBar:SetFrameLevel(11)
		AzeriteBar:SetStatusBarTexture(T.GetTexture(BarTexture))
		
		local Azeritetext = AzeriteBar:CreateFontString(nil, "OVERLAY")
		Azeritetext:SetFontObject(T.GetFont(C["DataTexts"].Font))
		Azeritetext:SetScale(C.DataTexts.FontSize/10)
		Azeritetext:SetPoint("RIGHT", AzeriteBar, "LEFT", -6, 0)
		Azeritetext:SetText("Azerite")

		NoAzeritetext = self:CreateFontString(nil, "OVERLAY")
		NoAzeritetext:SetFontObject(T.GetFont(C["DataTexts"].Font))
		NoAzeritetext:SetScale(C.DataTexts.FontSize/10)
		NoAzeritetext:SetPoint("CENTER", AzeriteBar, "CENTER", 0, 0)
		NoAzeritetext:Hide()

		Azeritepercenttext = AzeriteBar:CreateFontString(nil, "OVERLAY")
		if C["Misc"]["PercentageTag"] == true then
			Azeritepercenttext:SetFontObject(T.GetFont(C["DataTexts"].Font))
			Azeritepercenttext:SetScale(C.DataTexts.FontSize/10)
			Azeritepercenttext:SetPoint("LEFT", AzeriteBar, "RIGHT", 6, 0)
		end	

		AzeriteBar:HookScript("OnEnter", function(self)
			AzeriteBar.Backdrop:SetBorderColor(AzeriteBar:GetStatusBarColor())
		end)

		AzeriteBar:HookScript("OnLeave", function(self)
			AzeriteBar.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
		end)
	
		self["AzeriteBar"..i] = AzeriteBar
	end	
		
	self:RegisterEvent("PLAYER_XP_UPDATE")
	self:RegisterEvent("PLAYER_LEVEL_UP")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("UNIT_INVENTORY_CHANGED")
	self:RegisterEvent("AZERITE_EMPOWERED_ITEM_SELECTION_UPDATED")
	self:RegisterEvent("RESPEC_AZERITE_EMPOWERED_ITEM_CLOSED")

	self:SetScript("OnEvent", self.Update)
end

------------------------------------------------------------------------------------------
-- AZERITE UPDATE
------------------------------------------------------------------------------------------
function Azerite:Update()
	local AzeriteItem = C_AzeriteItem.FindActiveAzeriteItem()
	for i = 1, self.NumBars do

		local Bar = self["AzeriteBar"..i]
		if AzeriteItem then
			Bar.BarType = "AZERITE"
			Current, Max, Level, Items = Azerite:GetAzerite()
			local BarType = Bar.BarType

			Bar:SetMinMaxValues(0, Max)
			Bar:SetValue(Current)
			Bar:SetStatusBarColor(unpack(self.AZColor))
			
			if C["Misc"]["PercentageTag"] == true then
				Azeritepercenttext:SetText("".. floor(Current / Max * 100) .."%")
			end
		else
			Bar:Hide()
			NoAzeritetext:SetText("No Azerite")
			NoAzeritetext:Show() -- showing in combat
		end	
	end	
end

------------------------------------------------------------------------------------------
-- AZERITE ENABLE / DISABLE
------------------------------------------------------------------------------------------
function Azerite:Enable()
	if not C["Misc"]["AZERITEBarEnable"] then return end

	if not self.IsCreated then
		self:Create()
		self.IsCreated = true
	end
	
	for i = 1, self.NumBars do
		if not self["AzeriteBar"..i]:IsShown() then
			self["AzeriteBar"..i]:Show()
		end
	end
end

function Azerite:Disable()
	for i = 1, self.NumBars do
		if self["AzeriteBar"..i]:IsShown() then
			self["AzeriteBar"..i]:Hide()
		end
	end	
end

function Azerite:OnEvent(event)
	self:Enable()
end

Azerite:RegisterEvent("PLAYER_LOGIN")
Azerite:SetScript("OnEvent", Azerite.OnEvent)

T.Miscellaneous.Azerite = Azerite

------------------------------------------------------------------------------------------
-- AZERITE DATATEXT 
------------------------------------------------------------------------------------------
local Update = function(self)
	if not C["Misc"]["AZERITEBarEnable"] then return end
	AzeriteFrameHolder:ClearAllPoints()
	AzeriteFrameHolder:SetPoint("CENTER", self, "CENTER", 0, 0)
	AzeriteFrameHolder:SetParent(self)
end

local Enable = function(self)
	if not C["Misc"]["AZERITEBarEnable"] then return end
	self:Update()
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:SetScript("OnEvent", self.Update)
end

local Disable = function(self)
	if not C["Misc"]["AZERITEBarEnable"] then return end
	self.Text:SetText("")
	self:SetScript("OnUpdate", nil)
end

DataText:Register("|cffFFFF99Azerite|r", Enable, Disable, Update)