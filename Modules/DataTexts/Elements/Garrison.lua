------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 30-12-2022
------------------------------------------------------------------------------------------

-- Setting up datatext for Garrison.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local DataText = T["DataTexts"]

if not T.Retail then return end

------------------------------------------------------------------------------------------
-- GARRISON DATATEXT
------------------------------------------------------------------------------------------
local Update = function(self)
	self.Text:SetText(format(DataText.NameColor.."Missions / Renown|r"))
	
	if C["DataTexts"]["Icons"] == true then
		self.icon = self:CreateTexture(nil, "OVERLAY")
		self.icon:SetWidth(20)
		self.icon:SetHeight(20)
		self.icon:SetPoint("LEFT", self, "CENTER", 40, 0)
		self.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cGarrison.tga]])
		self.icon:SetVertexColor(unpack(C["DataTexts"].ValueColor))
	end

	self:SetScript("OnEnter", function(self)
		self.Text:SetText(format(DataText.HighlightColor.."Missions / Renown|r"))
		if C["DataTexts"]["Icons"] == true then
			self.icon:SetVertexColor(unpack(C["DataTexts"].HighlightColor))
		end
		GameTooltip:SetOwner(self:GetTooltipAnchor())
		--GameTooltip:ClearLines()
		GameTooltip:AddLine("Missions and Renown:")
		GameTooltip:AddLine("Toggle the current expansion's Missions, previously table for Garrison, Class Hall, War Campaign or Covenant content", 1, 1, 1, 1, 1, 1)
		GameTooltip:AddLine(" ")
		GameTooltip:AddDoubleLine("Dragonflight Renown:", "Left-click", 1, 1, 1)
		GameTooltip:AddDoubleLine("Older expansions:", "Right-click", 1, 1, 1)
		GameTooltip:Show()
	end)
		
	self:SetScript("OnLeave", function(self)
		self.Text:SetText(format(DataText.NameColor.."Missions / Renown|r"))
		if C["DataTexts"]["Icons"] == true then
			self.icon:SetVertexColor(unpack(C["DataTexts"].ValueColor))
		end
		GameTooltip:Hide()
	end)
end

local OnMouseDown = function(...)
	local _, button = ...
 	if button == "LeftButton" then
		if ExpansionLandingPageMinimapButton and ExpansionLandingPageMinimapButton:IsShown() then
			if InCombatLockdown() then
				T.Print("["..GARRISON_MISSIONS_TITLE.."] "..ERR_NOT_IN_COMBAT)
			else
				ExpansionLandingPageMinimapButton:ToggleLandingPage()
			end
		end
	else
		GarrisonLandingPage_Toggle()
	end	
end

local Enable = function(self)
	self:Update()
	self:SetScript("OnMouseDown", OnMouseDown)
end

local Disable = function(self)
	self.Text:SetText("")
	self:UnregisterAllEvents()
	self:SetScript("OnEvent", nil)
	self:SetScript("OnMouseDown", nil)
	self:SetScript("OnEnter", nil)
	self:SetScript("OnLeave", nil)
end

DataText:Register("|cffFFFF99Missions|r", Enable, Disable, Update)