------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up MAPS DATATEXT.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local DataText = T["DataTexts"]
local Misc = T["Miscellaneous"]
local Movers = T["Movers"]

------------------------------------------------------------------------------------------
-- GAME MENU DATATEXT
------------------------------------------------------------------------------------------
local Update = function(self)
	--if C["DataTexts"]["DataCenter"] == false then return end
	
	self.Text:SetFormattedText("%s", DataText.NameColor .. "Map|r")
	
	self:SetScript("OnEnter", function(self)
		self.Text:SetFormattedText("%s", DataText.HighlightColor .. "Map|r")
		GameTooltip:SetOwner(self:GetTooltipAnchor())
		GameTooltip:AddLine("Map:")
		GameTooltip:AddDoubleLine("Toggle the minimap:", "Left-click", 1, 1, 1)
		GameTooltip:AddDoubleLine("Toggle the worldmap:", "Right-click", 1, 1, 1)
		GameTooltip:Show()
	end)
	
	self:SetScript("OnLeave", function(self)
		self.Text:SetFormattedText("%s", DataText.NameColor .. "Map|r")
		GameTooltip:Hide()
	end)
end

local OnMouseDown = function(self, button)
	if button == "LeftButton" then
		if InCombatLockdown() then
			T.Print(ERR_NOT_IN_COMBAT)

			return
		end
		
		MinimapFadeToggle()
	end
	
	if button == "RightButton" then
		if WorldMapFrame:IsShown() then
			WorldMapFrame:Hide()
		else
			WorldMapFrame:Show()
		end
	end
end

local Enable = function(self)
	if C["DataTexts"]["DataCenter"] == false then return end
	self:SetScript("OnMouseDown", OnMouseDown)
	self:Update()
end

local Disable = function(self)
	self:SetScript("OnMouseDown", nil)
end

DataText:Register("|cffFFFF99Maps|r", Enable, Disable, Update)
