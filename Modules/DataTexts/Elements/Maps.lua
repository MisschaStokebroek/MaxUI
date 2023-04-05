------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- setting up MAPS DATATEXT.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local DataText = T["DataTexts"]
local Misc = T["Miscellaneous"]

------------------------------------------------------------------------------------------
-- MAPS DATATEXT
------------------------------------------------------------------------------------------
local Update = function(self)
	
	self.Text:SetFormattedText("%s", DataText.NameColor .. "Map|r")
	if C["DataTexts"]["Icons"] == true then
		self.icon = self:CreateTexture(nil, "OVERLAY")
		self.icon:SetWidth(20)
		self.icon:SetHeight(20)
		self.icon:SetPoint("LEFT", self, "CENTER", 32, 0)
		self.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cLocation.tga]])
		self.icon:SetVertexColor(unpack(C["DataTexts"].ValueColor))
	end
	
	self:SetScript("OnEnter", function(self)
		self.Text:SetFormattedText("%s", DataText.HighlightColor .. "Map|r")
		if C["DataTexts"]["Icons"] == true then
			self.icon:SetVertexColor(unpack(C["DataTexts"].HighlightColor))
		end
		GameTooltip:SetOwner(self:GetTooltipAnchor())
		GameTooltip:AddLine("Map:")
		GameTooltip:AddDoubleLine("Toggle the minimap:", "Left-click", 1, 1, 1)
		GameTooltip:AddDoubleLine("Toggle the worldmap:", "Right-click", 1, 1, 1)
		GameTooltip:Show()
	end)
	
	self:SetScript("OnLeave", function(self)
		self.Text:SetFormattedText("%s", DataText.NameColor .. "Map|r")
		if C["DataTexts"]["Icons"] == true then
			self.icon:SetVertexColor(unpack(C["DataTexts"].ValueColor))
		end
		GameTooltip:Hide()
	end)
end

local OnMouseDown = function(self, button)
	if button == "LeftButton" then
		if InCombatLockdown() then
			T.Print(ERR_NOT_IN_COMBAT)

			return
		end
		
		Minimap:fadeToggle()
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
