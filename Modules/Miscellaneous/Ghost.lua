------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
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
local Texture = T.GetTexture(C.General.HeaderTexture)

------------------------------------------------------------------------------------------
-- GHOST Button
------------------------------------------------------------------------------------------
local function MaxUIGhost()
	local Button = Ghost.Button

	Button.Backdrop:SetOutside()
	Button.Text:SetFontTemplate(C.Medias.MaxUIFont, 12)
	Button.Text:SetTextColor(1, 1, 1)
	
	-- texture
	Button.Texture = Button:CreateTexture(nil, "ART")
	Button.Texture:SetInside(Button)
	Button.Texture:SetTexture(Texture)
	Button.Texture:SetVertexColor(unpack(C["General"]["BackdropColor"]))
	
	--button mouseaction (mousover or click)
	Ghost:SetScript("OnEnter", function(self)
		Button.Text:SetTextColor(unpack(ClassColor))
		Button.Backdrop:SetBorderColor(unpack(ClassColor))
	end)
	
	Ghost:SetScript("OnLeave", function(self)
		Button.Text:SetTextColor(1, 1, 1)
		Button.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
	end)
end

function Ghost:CreateButton()
	-- Tukui
	baseGhostCreateButton(self)
	
	-- Then my stuff
	if not (C.General.Themes.Value == "MaxUI") then return end
	MaxUIGhost()
end