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
		--Popup.Border:Kill()
	end

	-- Game Menu (ESC)
	GameMenuFrameHeader:Kill()
	GameMenuFrameHeader.Backdrop:Kill()
	for i = 1, GameMenuFrame:GetNumRegions() do
		local Region = select(i, GameMenuFrame:GetRegions())
		Region:Kill()
	end
	GameMenuFrame.Backdrop:SetAlpha(0.75)
	GameMenuFrame.Backdrop:CreateShadow()
	GameMenuFrame:CreateMaxUIHeader("Game Menu")
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