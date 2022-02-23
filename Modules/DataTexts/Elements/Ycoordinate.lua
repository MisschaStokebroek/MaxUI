------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up LOCATION DATATEXT.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local DataText = T["DataTexts"]
local tonumber = tonumber
local format = format
local date = date
local Interval = 1
local Timer = 0

------------------------------------------------------------------------------------------
-- Current Y coordinate datatext
------------------------------------------------------------------------------------------
local Update = function(self, Elapsed)
	Timer = Timer - Elapsed

	if Timer < 0 then
		local UnitMap = C_Map.GetBestMapForUnit("player")
		local X, Y = 0, 0

		if UnitMap then
			local GetPlayerMapPosition = C_Map.GetPlayerMapPosition(UnitMap, "player")

			if GetPlayerMapPosition then
				X, Y = C_Map.GetPlayerMapPosition(UnitMap, "player"):GetXY()
			end
		end

		if X == 0 and Y == 0 then
			local Name = "--"

			self.Text:SetText(DataText.ValueColor..Name.."|r")
		else
			X = 100 * math.floor(X * 1000) / 1000
			Y = 100 * math.floor(Y * 1000) / 1000
			
			self.Text:SetText(DataText.ValueColor..Y.."|r")
		end

		Timer = Interval
	end
end

local Enable = function(self)
	self:SetScript("OnUpdate", Update)
end

local Disable = function(self)
	self.Text:SetText("")
	self:SetScript("OnUpdate", nil)
end

DataText:Register("|cffFFFF99Y Coordinate|r", Enable, Disable, Update)