------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 02-10-2022
------------------------------------------------------------------------------------------

-- setting up GHOST BUTTON.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()

if not T.Retail then return end

local Miscellaneous = T["Miscellaneous"]
local Ghost = Miscellaneous.Ghost
local baseGhostCreateButton = Ghost.CreateButton

------------------------------------------------------------------------------------------
-- GHOST Button
------------------------------------------------------------------------------------------
local function MaxUIGhost()
	local Button = Ghost.Button

	Button:SkinMaxUIButton(true)
	Button.Text:SetTextColor(1, 1, 1)
end

function Ghost:CreateButton()
	baseGhostCreateButton(self)
	
	if not (C.General.Themes.Value == "MaxUI") then return end
	MaxUIGhost()
end