------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up SPEED DATATEXT.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local TukuiDT = T["DataTexts"]
local format = format
local tslu = 0.5

------------------------------------------------------------------------------------------
-- Current Speed datatext - thanks to Tukz
------------------------------------------------------------------------------------------
local Update = function(self, t)
	tslu = tslu - t
	
	if (tslu > 0) then
		return
	end
	
	CurrentSpeed = GetUnitSpeed("player") / 7 * 100
	self.Text:SetText(format(TukuiDT.NameColor.."Speed: |r"..TukuiDT.ValueColor.."%d%%".."|r", CurrentSpeed))
	tslu = 0.5
end

local OnEnter = function(self)
	tslu = 3
	self.Text:SetText(format(TukuiDT.HighlightColor.."Speed: |r"..TukuiDT.HighlightColor.."%d%%".."|r", CurrentSpeed))
	GameTooltip:SetOwner(self:GetTooltipAnchor())
	GameTooltip:ClearLines()
	GameTooltip:AddLine("Speed:")
	GameTooltip:AddLine("Show current movement speed", 1, 1, 1, 1, 1, 1)
	GameTooltip:Show()
end

local OnLeave = function(self)
	self.Text:SetText(format(TukuiDT.NameColor.."Speed: |r"..TukuiDT.ValueColor.."%d%%".."|r", CurrentSpeed))
	GameTooltip:Hide()
end

local Enable = function(self)
	self:SetScript("OnUpdate", Update)
	self:Update(1)
	self:SetScript("OnEnter", OnEnter)
	self:SetScript("OnLeave", OnLeave)
end

local Disable = function(self)
	self.Text:SetText("")
	self:SetScript("OnUpdate", nil)
	self:SetScript("OnEnter", nil)
	self:SetScript("OnLeave", nil)
end

TukuiDT:Register("|cffFFFF99Move Speed|r", Enable, Disable, Update)