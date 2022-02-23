------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up REPUTATION BARS.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local DataText = T["DataTexts"]
local Misc = T["Miscellaneous"]
local Movers = T["Movers"]
local Reputation = CreateFrame("Frame", nil, UIParent)
local HideTooltip = GameTooltip_Hide
local Bars = 20
Reputation.NumBars = 1

local Class = select(2, UnitClass("player"))
local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
local RepColors = FACTION_BAR_COLORS

local RepFrameHolder = CreateFrame("Frame", "RepFrameHolder", UIParent)
RepFrameHolder:SetHeight(22) 
RepFrameHolder:SetWidth(200)

------------------------------------------------------------------------------------------
-- REPUTATION TOOLTIP
------------------------------------------------------------------------------------------
function Reputation:SetTooltip()
	if (not GetWatchedFactionInfo()) then
		return
	end

	local Name, ID, Min, Max, Value = GetWatchedFactionInfo()

	GameTooltip:SetOwner(self, "ANCHOR_CURSOR", 0, 8)

	GameTooltip:AddLine("Reputation:")
	GameTooltip:AddLine("Current tracked reputation state", 1, 1, 1, 1, 1, 1)
	GameTooltip:AddLine(" ")
	GameTooltip:AddLine(string.format("%s (%s)", Name, _G["FACTION_STANDING_LABEL" .. ID]))

	if (Min ~= Max) and (Min >= 0) then
		local Val1 = Value - Min
		local Val2 = Max - Min
		local Val3 = (Value - Min) / (Max - Min) * 100
		GameTooltip:AddLine(Val1 .. " / " .. Val2 .. " (" .. floor(Val3) .. "%)", 1, 1, 1, 1, 1, 1)
	end
	GameTooltip:Show()
end

------------------------------------------------------------------------------------------
-- REPUTATION CREATE
------------------------------------------------------------------------------------------
function Reputation:Create()
	for i = 1, self.NumBars do
		local ReputationBar = CreateFrame("StatusBar", nil, UIParent)

		local BarHeight = C["Misc"]["REPBarHeight"]
		local BarWidth = C["Misc"]["REPBarWidth"]
		local BarTexture = C["Misc"]["REPBarTexture"]

		ReputationBar:EnableMouse()
		ReputationBar:SetFrameStrata("BACKGROUND")
		ReputationBar:CreateBackdrop()
		ReputationBar.Backdrop:CreateShadow()
		ReputationBar.Backdrop:SetOutside()
		ReputationBar:SetScript("OnEnter", Reputation.SetTooltip)
		ReputationBar:SetScript("OnLeave", HideTooltip)
		
		ReputationBar:ClearAllPoints()
		ReputationBar:SetParent(RepFrameHolder)
		ReputationBar:SetPoint("CENTER", RepFrameHolder, "CENTER", 0, 0)
		ReputationBar:SetWidth(BarWidth)
		ReputationBar:SetHeight(BarHeight)
		
		ReputationBar:SetOrientation'HORIZONTAL'
		ReputationBar:SetFrameLevel(11)
		ReputationBar:SetStatusBarTexture(T.GetTexture(BarTexture))
		
		ReputationBar:SetScript("OnMouseDown", function(self)
			ToggleCharacter("ReputationFrame")
		end)

		local Reputationtext = ReputationBar:CreateFontString(nil, "OVERLAY")
		Reputationtext:SetFontObject(T.GetFont(C["DataTexts"].Font))
		Reputationtext:SetScale(C.DataTexts.FontSize/10)
		Reputationtext:SetPoint("RIGHT", ReputationBar, "LEFT", -6, 0)
		Reputationtext:SetText("Rep")

		Reputationpercenttext = ReputationBar:CreateFontString(nil, "OVERLAY")
		if C["Misc"]["PercentageTag"] == true then
			Reputationpercenttext:SetFontObject(T.GetFont(C["DataTexts"].Font))
			Reputationpercenttext:SetScale(C.DataTexts.FontSize/10)
			Reputationpercenttext:SetPoint("LEFT", ReputationBar, "RIGHT", 6, 0)
		end	

		ReputationBar:HookScript("OnEnter", function(self)
			ReputationBar.Backdrop:SetBorderColor(ReputationBar:GetStatusBarColor())
		end)

		ReputationBar:HookScript("OnLeave", function(self)
			ReputationBar.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
		end)
	
		self["ReputationBar"..i] = ReputationBar
	end	
	
	self:RegisterEvent("UPDATE_FACTION")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")

	self:SetScript("OnEvent", self.Update)
end

------------------------------------------------------------------------------------------
-- REPUTATION UPDATE
------------------------------------------------------------------------------------------
function Reputation:Update()
	for i = 1, self.NumBars do
		local Name, ID, Min, Max, Value = GetWatchedFactionInfo()

		if C["Misc"]["PercentageTag"] == true then
			if (Min ~= Max) then
				local RepPercentage = ((Value - Min) / (Max - Min) * 100)
				Reputationpercenttext:SetText("".. floor(RepPercentage) .. "%")
			else
				Reputationpercenttext:SetText("max")
			end
		end
		
		if (not GetWatchedFactionInfo()) then
				Reputationpercenttext:SetText("none")
		else	
			self["ReputationBar"..i]:SetMinMaxValues(Min, Max)
			self["ReputationBar"..i]:SetValue(Value)
			self["ReputationBar"..i]:SetStatusBarColor(RepColors[ID].r, RepColors[ID].g, RepColors[ID].b)
		end
	end	
end

------------------------------------------------------------------------------------------
-- REPUTATION ENABLE
------------------------------------------------------------------------------------------
function Reputation:Enable()
	if not C["Misc"]["REPBarEnable"] then return end
	
	if not self.IsCreated then
		self:Create()
		self.IsCreated = true
	end
	
	for i = 1, self.NumBars do
		if not self["ReputationBar"..i]:IsShown() then
			self["ReputationBar"..i]:Show()
		end
	end
end

function Reputation:Disable()
	for i = 1, self.NumBars do
		if self["ReputationBar"..i]:IsShown() then
			self["ReputationBar"..i]:Hide()
		end
	end	
end

function Reputation:OnEvent(event)
	self:Enable()
end

Reputation:RegisterEvent("PLAYER_LOGIN")
Reputation:SetScript("OnEvent", Reputation.OnEvent)

T.Miscellaneous.Reputation = Reputation

------------------------------------------------------------------------------------------
-- REPUTATION DATATEXT
------------------------------------------------------------------------------------------
local Update = function(self)
	if not C["Misc"]["REPBarEnable"] then return end
	RepFrameHolder:ClearAllPoints()
	RepFrameHolder:SetPoint("CENTER", self, "CENTER", 0, 0)
	RepFrameHolder:SetParent(self)
end

local Enable = function(self)
	if not C["Misc"]["REPBarEnable"] then return end
	self:Update()
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:SetScript("OnEvent", self.Update)
end

local Disable = function(self)
	if not C["Misc"]["REPBarEnable"] then return end
	self.Text:SetText("")
	self:SetScript("OnUpdate", nil)
end

DataText:Register("|cffFFFF99Reputation|r", Enable, Disable, Update)