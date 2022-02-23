------------------------------------------------------------------------------------------
-- MaxUI 6 - SHADOWLANDS / TUKUI 20
-- latest update: 27-10-2020
------------------------------------------------------------------------------------------

-- setting up MaxUISkins

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
if not IsAddOnLoaded('AddonSkins') then 
	return
end

local AS, ASL = unpack(AddOnSkins)
if not AS:CheckAddOn('Tukui') then return end
local T, C
local _G = _G

------------------------------------------------------------------------------------------
-- OTHER SKINS
------------------------------------------------------------------------------------------
local AS_Blizzard_Others = AS.Blizzard_Others
function AS:Blizzard_Others()
	AS_Blizzard_Others(self)

	if not Tukui then return end
	if not T then
		T, C = Tukui:unpack()
	end

	if not C["Skins"]["MaxUIAddOnSkins"] then return end

	-- SkinNavBarButtons
	-- LFDRoleCheckPopup
	-- CinematicFrameCloseDialog
	-- MovieFrame
	-- ReportCheatingDialog
	-- ReadyCheckFrame

	-- popup screens
	for i = 1, 4 do
		local Popup = _G["StaticPopup"..i]
		Popup:CreateShadow()
		Popup.Border:Kill()
	end

	-- Game Menu (ESC)
	GameMenuFrame.Header:Kill()
	GameMenuFrame.Backdrop:SetAlpha(0.75)
	GameMenuFrame.Backdrop:CreateShadow()
	GameMenuFrame:CreateMaxUIHeader("Game Menu")
	
	-- What's New SplashScreen
	-- header
	SplashFrame:CreateMaxUIHeader("What's New")
	SplashFrame.Backdrop:CreateShadow()
	
	-- close button
	SplashFrame.TopCloseButton:ClearAllPoints()
	SplashFrame.TopCloseButton:SetFrameLevel(16)
	SplashFrame.TopCloseButton:SetPoint("RIGHT", SplashFrame.MaxUIHeader, "RIGHT", 4, 0)
	SplashFrame.BottomCloseButton:Kill()	

	-- relocate
	SplashFrame:ClearAllPoints()
	SplashFrame:SetPoint("TOP", UIParent, "TOP", 0, -100)
	SplashFrame.ClearAllPoints = function() end
	SplashFrame.SetPoint = function() end
end	
AS:RegisterSkin('Blizzard_Others', AS.Blizzard_Others)

-- set MaxUI to button
local T, C, L = Tukui:unpack()
local GameMenu = T.Miscellaneous.GameMenu
local baseCreateTukuiMenuButton = GameMenu.CreateTukuiMenuButton
function GameMenu:CreateTukuiMenuButton()
	baseCreateTukuiMenuButton(self)
	local Tukui = self.Tukui
	Tukui:SetText("Tukui / MaxUI")
end