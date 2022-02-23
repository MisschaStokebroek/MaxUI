------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up DATA TEXT FIELDS.
-- NOTE: overwriting Tukui code instead of adding to it. Can't figure out another way to do it so far.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Chat = T["Chat"]
local DataTexts = T["DataTexts"]
local Minimap = T.Maps.Minimap

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
	
	local AmountBottom
	if C["DataTexts"]["Bottomline"] == false then 
		AmountBottom = 0
	else
		AmountBottom = C["DataTexts"]["AmountBottomDataTexts"]
	end	
	
	local AmountTop
	if C["DataTexts"]["Topline"] == false then 
		AmountTop = 0
	else
		AmountTop = C["DataTexts"]["AmountTopDataTexts"]
	end
	
	local AmountDataCenter
	if C["DataTexts"]["DataCenter"] == false then 
		AmountDataCenter = 0
	else
		AmountDataCenter = C["DataTexts"]["AmountDataCenterDataTexts"]	
	end
	
	local TotalAmount = AmountBottom + AmountTop + AmountDataCenter
	self.NumAnchors = AmountBottom + AmountTop + AmountDataCenter
	
	if C["DataTexts"]["DataCenter"] == false then 
		local AmountDataCenter = 0
	end

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
	local Panels = T.DataTexts.Panels
	local BottomLine = BottomLine
	local TopLine = TopLine
	local DataCenter = DataCenter

	local Spacing = 1
	local PanelSize = 20
	
	-- Tukui
	if C["General"]["Themes"]["Value"] ~= "MaxUI" then 
		DataTextLeft = T.DataTexts.Panels.Left
		DataTextRight = T.DataTexts.Panels.Right
		MinimapDataText = T.DataTexts.Panels.Minimap

		if (MinimapDataText) then
			self.NumAnchors = self.NumAnchors + 1
		end
		
		for i = 1, self.NumAnchors do
			local Frame = CreateFrame("Button", nil, UIParent)
			local DataWidth = (DataTextLeft:GetWidth() / 3) - 1

			if i >= 4 and i <= 6 then
				DataWidth = (DataTextRight:GetWidth() / 3) - 1
			end

			Frame:SetWidth(DataWidth)
			Frame:SetHeight(DataTextLeft:GetHeight() - 2)
			Frame:SetFrameLevel(DataTextLeft:GetFrameLevel() + 1)
			Frame:SetFrameStrata("HIGH")
			Frame:EnableMouse(false)
			Frame.SetData = SetData
			Frame.RemoveData = RemoveData
			Frame.Num = i

			Frame.Tex = Frame:CreateTexture()
			Frame.Tex:SetAllPoints()
			Frame.Tex:SetColorTexture(0.2, 1, 0.2, 0)

			self.Anchors[i] = Frame

			if (i == 1) then
				Frame:SetPoint("LEFT", DataTextLeft, 1, 0)
			elseif (i == 4) then
				Frame:SetPoint("LEFT", DataTextRight, 1, 0)
			elseif (i == 7) then
				Frame:SetPoint("CENTER", MinimapDataText, 0, 0)
				Frame:SetWidth(MinimapDataText:GetWidth() - 2)	
				Frame:SetHeight(MinimapDataText:GetHeight() - 2)	
			else
				Frame:SetPoint("LEFT", self.Anchors[i-1], "RIGHT", 1, 0)
			end
		end
	
	-- MaxUI
	elseif C["General"]["Themes"]["Value"] == "MaxUI" then 
		
		local AmountBottom
		if C["DataTexts"]["Bottomline"] == false then 
			AmountBottom = 0
		else
			AmountBottom = C["DataTexts"]["AmountBottomDataTexts"]
		end	
		
		local AmountTop
		if C["DataTexts"]["Topline"] == false then 
			AmountTop = 0
		else
			AmountTop = C["DataTexts"]["AmountTopDataTexts"]
		end
		
		local AmountDataCenter
		if C["DataTexts"]["DataCenter"] == false then 
			AmountDataCenter = 0
		else
			AmountDataCenter = C["DataTexts"]["AmountDataCenterDataTexts"]	
		end
		
		local TotalAmount = AmountBottom + AmountTop + AmountDataCenter
		self.NumAnchors = AmountBottom + AmountTop + AmountDataCenter
		
		for i = 1, self.NumAnchors do
			local Frame = CreateFrame("Button", nil, UIParent)
			Frame:SetHeight(20)
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
				Frame:SetFrameLevel(BottomLine:GetFrameLevel() -1)
				Frame:SetWidth((BottomLine:GetWidth() / AmountBottom) -1)
				if (i == 1) then
					Frame:SetPoint("LEFT", BottomLine, "LEFT", 0, 0)
				elseif (i >= 2 and i <= AmountBottom) then
					Frame:SetPoint("LEFT", self.Anchors[i-1], "RIGHT", 1, 0)
				end	
			
			-- toppanel
			elseif ((i >= (AmountBottom + 1) and i <= (AmountBottom + AmountTop)) and (C["DataTexts"]["Topline"]== true)) then
				Frame:SetFrameLevel(TopLine:GetFrameLevel() +1)
				Frame:SetWidth((TopLine:GetWidth() / AmountTop) -1)
				if (i == AmountBottom + 1) then
					Frame:SetPoint("LEFT", TopLine, "LEFT", 0, 0)
				elseif (i >= (AmountBottom + 2) and i <= (AmountBottom + AmountTop)) then
					Frame:SetPoint("LEFT", self.Anchors[i-1], "RIGHT", 1, 0)
				end
			
			-- DataCenter
			elseif ((i >= AmountBottom + AmountTop + 1) and (C["DataTexts"]["DataCenter"] == true)) then
				Frame:SetFrameLevel(DataCenter:GetFrameLevel() +1)
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
	local BottomLine = BottomLine
	local TopLine = TopLine
	local From
	
	local AmountBottom
	if C["DataTexts"]["Bottomline"] == false then 
		AmountBottom = 0
	else
		AmountBottom = C["DataTexts"]["AmountBottomDataTexts"]
	end	
	
	local AmountTop
	if C["DataTexts"]["Topline"] == false then 
		AmountTop = 0
	else
		AmountTop = C["DataTexts"]["AmountTopDataTexts"]
	end
	
	local AmountDataCenter
	if C["DataTexts"]["DataCenter"] == false then 
		AmountDataCenter = 0
	else
		AmountDataCenter = C["DataTexts"]["AmountDataCenterDataTexts"]	
	end
	
	local TotalAmount = AmountBottom + AmountTop + AmountDataCenter
	self.NumAnchors = AmountBottom + AmountTop + AmountDataCenter
	
	if C["DataTexts"]["DataCenter"] == false then 
		local AmountDataCenter = 0
	end

	if (C.General.Themes.Value == "MaxUI") then
		local AmountBottom = C["DataTexts"]["AmountBottomDataTexts"]
		local AmountTop = C["DataTexts"]["AmountTopDataTexts"]
		 local AmountDataCenter = C["DataTexts"]["AmountDataCenterDataTexts"]

		if (Position >= 1 and Position <= AmountBottom) then
			Anchor = "ANCHOR_CURSOR"
			From = BottomLine
		elseif (Position >= (AmountBottom +1) and Position <= (AmountBottom + AmountTop) ) then
			Anchor = "ANCHOR_CURSOR"
			From = TopLine
		elseif (Position >= (AmountBottom + AmountTop +1) and Position <= (TotalAmount) ) then
			Anchor = C["DataTexts"]["TooltipAnchor"]["Value"]
			From = DataCenter
--			Y = -20
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
			Anchor = "ANCHOR_BOTTOMLEFT"
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
	
	local AmountBottom
	if C["DataTexts"]["Bottomline"] == false then 
		AmountBottom = 0
	else
		AmountBottom = C["DataTexts"]["AmountBottomDataTexts"]
	end	
	
	local AmountTop
	if C["DataTexts"]["Topline"] == false then 
		AmountTop = 0
	else
		AmountTop = C["DataTexts"]["AmountTopDataTexts"]
	end
	
	local AmountDataCenter
	if C["DataTexts"]["DataCenter"] == false then 
		AmountDataCenter = 0
	else
		AmountDataCenter = C["DataTexts"]["AmountDataCenterDataTexts"]	
	end
	
	local TotalAmount = AmountBottom + AmountTop + AmountDataCenter
	
	-- MaxUI
	if C["General"]["Themes"]["Value"] == "MaxUI" then 
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts = {}
		
		-- bottomline 1-9
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Guild"] = {true, 1}
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Friends"] = {true, 2}
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Voice Chat"] = {true, 3}
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Game Menu|r"] = {true, 5}
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Buff Tracker|r"] = {true, 7}
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Raid Tools|r"] = {true, 8}
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Gold"] = {true, 9}
		
		-- topline 10-18
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Data Center|r"] = {true, 10}
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Quests|r"] = {true, 11}
		if T.Retail then
			TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Missions|r"] = {true, 12}
		end
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99X Coordinate|r"] = {true, 13}
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Location|r"] = {true, 14}
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Y Coordinate|r"] = {true, 15}
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Move Speed|r"] = {true, 16}
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Time"] = {true, 17}
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["System"] = {true, 18}
	
		-- datacenter 19-27
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Character"] = {true, 19}
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Talents|r"] = {true, 20}
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Armor"] = {true, 21}
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Crit"] = {true, 22}
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Power"] = {true, 23}
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Regen"] = {true, 24}
		--TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["DPS"] = {true, 25}
		--TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["HPS"] = {true, 26}
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Experience|r"] = {true, 27}
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Reputation|r"] = {true, 28}
		
		if T.Retail then
			TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Honor|r"] = {true, 29}
			TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["|cffFFFF99Anima|r"] = {true, 30}
		end

	-- Tukui
	else
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts = {}

		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Guild"] = {true, 1}
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Character"] = {true, 2}
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Friends"] = {true, 3}
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["System"] = {true, 4}
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["MicroMenu"] = {true, 5}
		TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Gold"] = {true, 6}
		
		if UnitLevel("player") == MAX_PLAYER_LEVEL then
			TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Time"] = {true, 7}
		else
			-- Better as default for xp'ing fast
			TukuiDatabase.Variables[GetRealmName()][UnitName("player")].DataTexts["Coords"] = {true, 7}
		end
	end	
end