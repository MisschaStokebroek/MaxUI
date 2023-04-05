------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkinsBlizzard

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local GameMenuSkin = CreateFrame("Frame")

local _G = _G

------------------------------------------------------------------------------------------
-- SKIN GameMenu
------------------------------------------------------------------------------------------
local function SkinGameMenuFrame()
	GameMenuFrame:CreateMaxUIHeader("Game Menu")

	if T.Retail then
		GameMenuFrame.Header:Kill()
	else
		GameMenuFrameHeader:Kill()
	end

	GameMenuFrame:SkinMaxUIFrame()
end

local function SkinGameMenuButtons()
	T.Miscellaneous.GameMenu.Tukui:SetText("Tukui/MaxUI")

	for _, Button in pairs({GameMenuFrame:GetChildren()}) do
		if Button.IsObjectType and Button:IsObjectType("Button") then
			Button:SkinMaxUIButton(true)
		end
	end
end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function GameMenuSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsBlizzard then return end

	if C["Skins"]["GameMenu"] then
		SkinGameMenuFrame()
		SkinGameMenuButtons()
	end
	self:UnregisterAllEvents()
end

GameMenuSkin:RegisterEvent("PLAYER_LOGIN")
GameMenuSkin:SetScript("OnEvent", GameMenuSkin.OnEvent)