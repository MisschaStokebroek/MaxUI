------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- setting up LOCATION DATATEXT.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()

local DataText = T["DataTexts"]
local Unknown = UNKNOWN

local ZoneColors = {
	["friendly"] = {0.1, 1.0, 0.1},
	["sanctuary"] = {0.41, 0.8, 0.94},
	["arena"] = {1.0, 0.1, 0.1},
	["hostile"] = {1.0, 0.1, 0.1},
	["contested"] = {1.0, 0.7, 0},
	["combat"] = {1.0, 0.1, 0.1},
	["else"] = {1.0, 0.9294, 0.7607}
}

local Update = function(self)
	local MinimapText = GetMinimapZoneText()
	local PVPType = GetZonePVPInfo()
	local Color

	if ZoneColors[PVPType] then
		Color = ZoneColors[PVPType]
	else
		Color = ZoneColors["else"]
	end

	self.Text:SetText(MinimapText)
	self.Text:SetTextColor(Color[1], Color[2], Color[3])
end

local OnEnter = function(self)
	local UnitMap = C_Map.GetBestMapForUnit("player")

	if not UnitMap or InCombatLockdown() then
		return
	end

	GameTooltip:SetOwner(self:GetTooltipAnchor())
	GameTooltip:ClearLines()

	local GetPlayerMapPosition = C_Map.GetPlayerMapPosition(UnitMap, "player")
	local MinimapText = GetMinimapZoneText()
	local PVPType, IsSubZonePvP, FactionName = GetZonePVPInfo()
	local X, Y, XText, YText, Label, Color
	
	if GetPlayerMapPosition then
		X, Y = C_Map.GetPlayerMapPosition(UnitMap, "player"):GetXY()
	end

	if ZoneColors[PVPType] then
		Color = ZoneColors[PVPType]
	else
		Color = ZoneColors["else"]
	end

	if X and Y then
		X = floor(100 * X)
		Y = floor(100 * Y)
	end

	local Location = format("|cffFFFF00%s|r %s |cffFFFFFF(%s, %s)|r", LOCATION_COLON, MinimapText or Unknown, X or "?", Y or "?")

	GameTooltip:AddLine(LOCATION_COLON)

	if (PVPType == "sanctuary") then
		Label = SANCTUARY_TERRITORY
	elseif (PVPType == "arena") then
		Label = FREE_FOR_ALL_TERRITORY
	elseif (PVPType == "friendly") then
		Label = format(FACTION_CONTROLLED_TERRITORY, FactionName)
	elseif (PVPType == "hostile") then
		Label = format(FACTION_CONTROLLED_TERRITORY, FactionName)
	elseif (PVPType == "contested") then
		Label = CONTESTED_TERRITORY
	elseif (PVPType == "combat") then
		Label = COMBAT_ZONE
	end

	GameTooltip:AddLine("Click to open the world map ", 1, 1, 1, 1, 1, 1)
	GameTooltip:AddLine(" ", 1, 1, 1, 1, 1, 1)
	GameTooltip:AddDoubleLine(Location, Label, Color[1], Color[2], Color[3], Color[1], Color[2], Color[3])

	self.Text:SetFormattedText("%s", DataText.HighlightColor .. MinimapText .. "|r")
	GameTooltip:Show()
end

local OnLeave = function(self)
	self:Update()
	GameTooltip_Hide()
end

local OnMouseUp = function()
	if InCombatLockdown() then
		T.Print(ERR_NOT_IN_COMBAT)

		return
	end
	
	if WorldMapFrame:IsShown() then
		WorldMapFrame:Hide()
	else
		WorldMapFrame:Show()
	end
end

local Enable = function(self)
	self:RegisterEvent("ZONE_CHANGED")
	self:RegisterEvent("ZONE_CHANGED_INDOORS")
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:SetScript("OnEvent", Update)
	self:SetScript("OnEnter", OnEnter)
	self:SetScript("OnLeave", OnLeave)
	self:SetScript("OnMouseUp", OnMouseUp)
	self:Update()
end

local Disable = function(self)
	self.Text:SetText("")
	self:UnregisterAllEvents()
	self:SetScript("OnUpdate", nil)
	self:SetScript("OnEnter", nil)
	self:SetScript("OnLeave", nil)
	self:SetScript("OnMouseUp", nil)
end

DataText:Register("|cffFFFF99Location|r", Enable, Disable, Update)