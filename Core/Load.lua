------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 01-08-2021
------------------------------------------------------------------------------------------

-- setting up LOADING.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local TukuiPopups = T["Popups"]
local GameMenu = T.Miscellaneous.GameMenu
local Menu = GameMenuFrame
local baseGameMenuCreateTukuiMenuButton = GameMenu.CreateTukuiMenuButton

------------------------------------------------------------------------------------------
-- WELCOME MESSAGE
------------------------------------------------------------------------------------------
T.version = GetAddOnMetadata("Tukui", "Version")
T.MaxUIversion = GetAddOnMetadata("MaxUI", "Version")
local HexClassColor = T.RGBToHex(unpack(T.Colors.class[T.MyClass]))
print("|cffFFFC01Welcome |r" ..HexClassColor ..UnitName("Player").."|r|cffFFFC01, entering World of Warcraft.|r |cffFFFF99MaxUI v. "..T.MaxUIversion.."|r |cffFFFC01for|r |cffff8000Tukui v. "..T.version.."|r |cffFFFC01loaded. |r|cffFFFC01Use|r |cffff8000/tukui|r |cffFFFC01or|r |cffFFFF99/maxui|r |cffFFFC01for more command options, check|r |cff69CCF0www.tukui.org|r |cffFFFC01or the MaxUI Discord for more information.|r")

------------------------------------------------------------------------------------------
-- GAME MENU
------------------------------------------------------------------------------------------
function GameMenu:CreateTukuiMenuButton()
	baseGameMenuCreateTukuiMenuButton(self)
	local Tukui = self.Tukui
	Tukui:SetText("Tukui/MaxUI")
	GameMenuFrame:CreateMaxUIHeader("Game Menu")

	for _, Button in pairs({Menu:GetChildren()}) do
		if Button.IsObjectType and Button:IsObjectType("Button") then
			Button:CreateBackdrop(nil, T.GetTexture("Tukui"))
		end
	end
end

------------------------------------------------------------------------------------------
-- Popup reset relocate
------------------------------------------------------------------------------------------
local function MaxUICreatePopups()
	local BrightColor = {0.35, 0.35, 0.35}
	local Texture = T.GetTexture(C.General.TextureButton)
	for i = 1, TukuiPopups.Total do
		local Frames = TukuiPopups.Frames
		Frames[i]:CreateMaxUIHeader()
		
		Frames[i].Button1.Backdrop.Texture = Frames[i].Button1.Backdrop:CreateTexture(nil, "ART")
		Frames[i].Button1.Backdrop.Texture:SetInside(Frames[i].Button1.Backdrop)
		Frames[i].Button1.Backdrop.Texture:SetTexture(T.GetTexture(C["General"]["TextureButton"]))
		Frames[i].Button1.Backdrop.Texture:SetVertexColor(unpack(BrightColor))
		
		Frames[i].Button2.Backdrop.Texture = Frames[i].Button2.Backdrop:CreateTexture(nil, "ART")
		Frames[i].Button2.Backdrop.Texture:SetInside(Frames[i].Button2.Backdrop)
		Frames[i].Button2.Backdrop.Texture:SetTexture(T.GetTexture(C["General"]["TextureButton"]))
		Frames[i].Button2.Backdrop.Texture:SetVertexColor(unpack(BrightColor))

		if (i == 1) then
			Frames[i]:CreateMaxUIHeader()
			Frames[i]:ClearAllPoints()
			Frames[i].Backdrop:SetAlpha(C["General"]["GeneralPanelAlpha"])
			Frames[i]:SetFrameStrata("TOOLTIP")
			Frames[i]:SetFrameLevel(15)
			Frames[i]:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
			Frames[i].Anchor:SetAlpha(0)
		else
			Frames[i]:ClearAllPoints()
			Frames[i].Backdrop:SetAlpha(C["General"]["GeneralPanelAlpha"])
			Frames[i]:SetFrameStrata("TOOLTIP")
			Frames[i]:SetFrameLevel(15)
			Frames[i]:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
		end
	end
end
hooksecurefunc(TukuiPopups, "CreatePopups", MaxUICreatePopups)