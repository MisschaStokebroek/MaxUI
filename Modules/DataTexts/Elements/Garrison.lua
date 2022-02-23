------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
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
	self.Text:SetText(format(DataText.NameColor.."Missions|r"))
	
	self:SetScript("OnEnter", function(self)
		self.Text:SetText(format(DataText.HighlightColor.."Missions|r"))
		GameTooltip:SetOwner(self:GetTooltipAnchor())
		--GameTooltip:ClearLines()
		GameTooltip:AddLine("Missions:")
		GameTooltip:AddLine("Toggle the Missions table for Garrison, Class Hall, War Campaign or Covenant content", 1, 1, 1, 1, 1, 1)
		GameTooltip:Show()
	end)
		
	self:SetScript("OnLeave", function(self)
		self.Text:SetText(format(DataText.NameColor.."Missions|r"))
		GameTooltip:Hide()
	end)
end

local OnMouseDown = function()
	if InCombatLockdown() then
		T.Print(ERR_NOT_IN_COMBAT)

		return
	end
	GarrisonLandingPage_Toggle()
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