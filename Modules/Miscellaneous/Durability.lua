------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up DURABILITY.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Durability = T.Miscellaneous.Durability
local baseDurabilityEnable = Durability.Enable

------------------------------------------------------------------------------------------
-- Durability Warning
------------------------------------------------------------------------------------------
local function MaxUIDurability()
	Durability.Warning:Hide()
	Durability.Warning:ClearAllPoints()
	Durability.Warning:SetPoint("TOPLEFT", UIParent, "TOP", 280, -40)
	Durability.Warning:SetFontTemplate(C.Medias.MaxUIFont, 14)
	Durability.Warning:SetText("WARNING:\nYou need to do a repair of\nyour equipment as soon as possible.")
end

function Durability:Enable()
	-- Tukui
	baseDurabilityEnable(self)
	
	-- MaxUI
	if not (C.General.Themes.Value == "MaxUI") then return end
	MaxUIDurability()	
end