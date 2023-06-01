------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- setting up DATA TEXT FIELDS.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local DataTexts = T["DataTexts"]
local baseDataTextsCreateAnchors = DataTexts.CreateAnchors
local baseDataTextsAddDefaults = DataTexts.AddDefaults
local baseDataTextsToggleDataPositions = DataTexts.ToggleDataPositions

------------------------------------------------------------------------------------------
-- SET DATA FOR DT'S, FUNCTION OVERRRIDES
------------------------------------------------------------------------------------------
local RemoveData = function(self)
	if self.Data then
		self.Data.Position = 0
		self.Data:Disable()
	end
	self.Data = nil
end

local SetData = function(self, object)

	-- Disable the old data text in use
	if self.Data then
		RemoveData(self)
	end
	
	local Panels = T.DataTexts.Panels
	local BottomLine = BottomLine
	local TopLine = TopLine
	local DataCenter = DataCenter

	local Spacing = 1
	local PanelSize = 20
	
	local AmountBottom = C["DataTexts"]["AmountBottomDataTexts"] or 0
	local AmountTop = C["DataTexts"]["AmountTopDataTexts"] or 0
	local AmountDataCenter = C["DataTexts"]["AmountDataCenterDataTexts"] or 0
	local TotalAmount = AmountBottom + AmountTop + AmountDataCenter
	self.NumAnchors = AmountBottom + AmountTop + AmountDataCenter

	-- Set the new data text
	self.Data = object
	self.Data:Enable()
	
	self.Data.Text:SetPoint("RIGHT", self, 0, 0)
	self.Data.Text:SetPoint("LEFT", self, 0, 0)
	self.Data.Text:SetPoint("TOP", self, 0, -1)
	self.Data.Text:SetPoint("BOTTOM", self, 0, -1)
	
	self.Data.Position = self.Num
	self.Data:SetAllPoints(self.Data.Text)
	self.Data.Text:SetFontObject(T.GetFont(C["DataTexts"].Font))
	self.Data.Text:SetScale(C.DataTexts.FontSize /10)

	-- Tukui
	if C["General"]["Themes"]["Value"] ~= "MaxUI" then 
		if (Panels.Left and self.Data.Position >= 1 and self.Data.Position <= 3) then
			self.Data:SetParent(Panels.Left)
		elseif (Panels.Right and self.Data.Position >= 4 and self.Data.Position <= 6) then
			self.Data:SetParent(Panels.Right)
		elseif (Panels.Minimap and self.Data.Position == 7) then
			self.Data:SetParent(Panels.Minimap)
		end
	end

	-- MaxUI 
	if C["General"]["Themes"]["Value"] == "MaxUI" then 
		if ( (C["DataTexts"]["Bottomline"] == true) and (self.Data.Position >= 1 and self.Data.Position <= AmountBottom)) then
			self.Data:SetParent(BottomLine)
		elseif ((C["DataTexts"]["Topline"] == true) and (self.Data.Position >= (AmountBottom +1) and self.Data.Position <= AmountBottom + AmountTop)) then
			self.Data:SetParent(TopLine)
		elseif ((C["DataTexts"]["DataCenter"] == true) and (self.Data.Position >= (AmountBottom + AmountTop +1) and self.Data.Position <= TotalAmount)) then
			self.Data:SetParent(DataCenter)
		end	
	end
end

------------------------------------------------------------------------------------------
-- MAXUI DT'S
------------------------------------------------------------------------------------------
function DataTexts:CreateAnchors()
	local BottomLine = BottomLine
	local TopLine = TopLine
	local DataCenter = DataCenter

	local Spacing = 1
	local PanelSize = 20
	
	-- Tukui
	if C["General"]["Themes"]["Value"] ~= "MaxUI" then 
		baseDataTextsCreateAnchors(self)

	-- MaxUI
	elseif C["General"]["Themes"]["Value"] == "MaxUI" then 
		
		local AmountBottom = C["DataTexts"]["AmountBottomDataTexts"] or 0
		local AmountTop = C["DataTexts"]["AmountTopDataTexts"] or 0
		local AmountDataCenter = C["DataTexts"]["AmountDataCenterDataTexts"] or 0
		local TotalAmount = AmountBottom + AmountTop + AmountDataCenter
		self.NumAnchors = AmountBottom + AmountTop + AmountDataCenter
		
		for i = 1, self.NumAnchors do
			local Frame = CreateFrame("Button", nil, UIParent)
			if C["General"]["thickness"] >= 20 then
				Frame:SetHeight(C["General"]["thickness"])
			else
				Frame:SetHeight(20)
			end
			Frame:SetFrameStrata("HIGH")
			Frame:EnableMouse(false)
			Frame.SetData = SetData
			Frame.RemoveData = RemoveData
			Frame.Num = i
			Frame.Tex = Frame:CreateTexture()
			Frame.Tex:SetAllPoints()
			self.Anchors[i] = Frame

			-- bottom panel
			if ( (i >= 1 and i <= AmountBottom) and (C["DataTexts"]["Bottomline"] == true)) then
				Frame:SetParent(BottomLine)
				Frame:SetFrameLevel(BottomLine:GetFrameLevel() +10)
				Frame:SetWidth((BottomLine:GetWidth() / AmountBottom))
				if (i == 1) then
					Frame:SetPoint("LEFT", BottomLine, "LEFT", 0, 0)
				elseif (i >= 2 and i <= AmountBottom) then
					Frame:SetPoint("LEFT", self.Anchors[i-1], "RIGHT", 0, 0)
				end

				if (C["Skins"]["DataTextFilter"] == true --[[and C["General"]["thickness"] >= 20]]) then 
					Frame:CreateMaxUIFilter()
					Frame.Filter:ClearAllPoints()
					Frame.Filter:SetWidth((BottomLine:GetWidth() / AmountBottom))
					Frame.Filter:SetHeight(C["General"]["thickness"])
					Frame.Filter:SetPoint("CENTER", Frame, "CENTER", 0, 0)
				end
			
			-- toppanel
			elseif ((i >= (AmountBottom + 1) and i <= (AmountBottom + AmountTop)) and (C["DataTexts"]["Topline"]== true)) then
				Frame:SetParent(TopLine)
				Frame:SetFrameLevel(TopLine:GetFrameLevel() +10)
				Frame:SetWidth((TopLine:GetWidth() / AmountTop))
				if (i == AmountBottom + 1) then
					Frame:SetPoint("LEFT", TopLine, "LEFT", 0, 0)
				elseif (i >= (AmountBottom + 2) and i <= (AmountBottom + AmountTop)) then
					Frame:SetPoint("LEFT", self.Anchors[i-1], "RIGHT", 0, 0)
				end
				
				if (C["Skins"]["DataTextFilter"] == true --[[and C["General"]["thickness"] >= 20]]) then 
					Frame:CreateMaxUIFilter()
					Frame.Filter:ClearAllPoints()
					Frame.Filter:SetWidth((TopLine:GetWidth() / AmountBottom))
					Frame.Filter:SetHeight(C["General"]["thickness"])
					Frame.Filter:SetPoint("CENTER", Frame, "CENTER", 0, 0)
				end
			
			-- DataCenter
			elseif ((i >= AmountBottom + AmountTop + 1) and (C["DataTexts"]["DataCenter"] == true)) then
				Frame:SetParent(DataCenter)
				Frame:SetFrameLevel(DataCenter:GetFrameLevel() +10)
				Frame:SetWidth(DataCenter:GetWidth()-2)
				if (i == AmountBottom + AmountTop + 1) then
					Frame:SetPoint("TOPLEFT", DataCenter, "TOPLEFT", 1, -1)
				elseif (i >= (AmountBottom + AmountTop + 2) and i <= (AmountBottom + AmountTop + AmountDataCenter)) then
					Frame:SetPoint("TOP", self.Anchors[i-1], "BOTTOM", 0, -1)
				end
			end
		end
	end
end

------------------------------------------------------------------------------------------
-- DATATEXT tooltip anchoring
------------------------------------------------------------------------------------------
local GetTooltipAnchor = function(self)
	local Position = self.Position
	local MinimapDataText = T.DataTexts.Panels.Minimap
	local BottomLine = BottomLine
	local TopLine = TopLine
	local From
	
	-- MaxUI datatext Tooltip
	if (C.General.Themes.Value == "MaxUI") then
		local AmountBottom = C["DataTexts"]["AmountBottomDataTexts"] or 0
		local AmountTop = C["DataTexts"]["AmountTopDataTexts"] or 0
		local AmountDataCenter = C["DataTexts"]["AmountDataCenterDataTexts"] or 0
		local TotalAmount = AmountBottom + AmountTop + AmountDataCenter

		if (Position >= 1 and Position <= AmountBottom) then
			Anchor = "ANCHOR_CURSOR"
			From = BottomLine
		elseif (Position >= (AmountBottom +1) and Position <= (AmountBottom + AmountTop) ) then
			Anchor = "ANCHOR_CURSOR"
			From = TopLine
		elseif (Position >= (AmountBottom + AmountTop +1) and Position <= (TotalAmount) ) then
			Anchor = C["DataTexts"]["TooltipAnchor"]["Value"]
			From = DataCenter
		end
		
		return From, Anchor, X, Y

	else

	-- Tukui DT anchors
		local Y = (16)

		if (Position >= 1 and Position <= 3) then
			X = -1
			Anchor = "ANCHOR_TOPLEFT"
			From = T.Chat.Panels.LeftChat
		elseif (Position >=4 and Position <= 6) then
			X = 1
			Anchor = "ANCHOR_TOPRIGHT"
			From = T.Chat.Panels.RightChat
		elseif (Position == 7 and MinimapDataText) then
			Anchor = "ANCHOR_BOTTOM"
			Y = (-5)
			From = MinimapDataText
		end

		return From, Anchor, X, Y
	end
end

-- Update the Anchor
for Name, DT in pairs(DataTexts.DataTexts) do
	if DT.GetTooltipAnchor then
		DT.GetTooltipAnchor = GetTooltipAnchor
	end
end

------------------------------------------------------------------------------------------
-- DEFAULTS
------------------------------------------------------------------------------------------
function DataTexts:AddDefaults()
	-- MaxUI
	if C["General"]["Themes"]["Value"] == "MaxUI" then 
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts = {}

		local AmountBottom = C["DataTexts"]["AmountBottomDataTexts"] or 0
		local AmountTop = C["DataTexts"]["AmountTopDataTexts"] or 0
		local AmountDataCenter = C["DataTexts"]["AmountDataCenterDataTexts"] or 0
		local TotalAmount = AmountBottom + AmountTop + AmountDataCenter

		for i = 1, TotalAmount do
			if i == 1 then
				TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Guild"] = {true, i}
			elseif i == 2 then
				TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Friends"] = {true, i}
			elseif i == 3 then
				TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Voice Chat"] = {true, i}
			elseif i == 4 then
				TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Chat / Emotes|r"] = {true, i}
			elseif i == 5 then
				TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99MaxUI Micro Menu|r"] = {true, i}
			elseif i == 6 then
				TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Move Speed|r"] = {true, i}
			elseif i == 7 then
				TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Buff Tracker|r"] = {true, i}
			elseif i == 8 then
				TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Raid Tools|r"] = {true, i}
			elseif i == 9 then
				TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Gold"] = {true, i}
			elseif i == 10 then
				TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Data Center|r"] = {true, i}
			elseif i == 11 then
				TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Quests|r"] = {true, i}
			elseif i == 12 then
				if T.Retail then
					TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Missions|r"] = {true, i}
				end
			elseif i == 13 then
				TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99X Coordinate|r"] = {true, i}
			elseif i == 14 then
				TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Location|r"] = {true, i}
			elseif i == 15 then
				TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Y Coordinate|r"] = {true, i}
			elseif i == 16 then
				TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Time"] = {true, i}
			elseif i == 17 then
				TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["System"] = {true, i}
			elseif i == 18 then
				TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Maps|r"] = {true, i}
			elseif i == 19 then
				TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Character"] = {true, i}
			elseif i == 20 then
				TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Talents|r"] = {true, i}
			elseif i == 21 then

			elseif i == 22 then
				TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Experience|r"] = {true, i}
			elseif i == 23 then
				TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Reputation|r"] = {true, i}
			elseif i == 24 then
				if T.Retail then
					TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Honor|r"] = {true, i}
				end
			elseif i == 25 then
				if T.Retail then
					TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Anima|r"] = {true, i}
				end
			elseif i == 26 then
				if T.Retail then
					TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Azerite|r"] = {true, i}
				end
			end
		end

	-- Tukui
	else
		baseDataTextsAddDefaults(self)
	end	
end

------------------------------------------------------------------------------------------
-- TOGGLE FUNCTION
------------------------------------------------------------------------------------------
local Active = false
local Anchors = DataTexts.Anchors

function DataTexts:ToggleDataPositions()
	baseDataTextsToggleDataPositions(self)

	if Active then
		for i = 1, self.NumAnchors do
			local Frame = Anchors[i]
			Frame.Tex:SetColorTexture(0.2, 1, 0.2, 0)
		end
		Active = false
	else
		for i = 1, self.NumAnchors do
			local Frame = Anchors[i]

			Frame.Tex:SetColorTexture(0.2, 1, 0.2, 0.2)
			
			Frame:SetScript("OnEnter", function(self)
				Frame.Tex:SetColorTexture(1, 1, 0, 0.2)
			end)
			Frame:SetScript("OnLeave", function(self)
				Frame.Tex:SetColorTexture(0.2, 1, 0.2, 0.2)
			end)
		end
		Active = true
	end
end