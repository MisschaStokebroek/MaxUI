------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 10-01-2023
------------------------------------------------------------------------------------------

-- extending the configuration menu for Tukui and MaxUI, additional options and settings.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local GUI = T["GUI"]

-- MaxUI Welcome
T.version = GetAddOnMetadata("Tukui", "Version")
T.MaxUIversion = GetAddOnMetadata("MaxUI", "Version")
local MaxUIVersion = "|cffFFFF99version:|r "..T.MaxUIversion..""
local TukuiVersion = "|cffFFFF99version:|r "..T.version..""
local GameVersion
if T.Retail then
	GameVersion	= "|cffFFFF99Retail|r" 
elseif T.BCC then
	GameVersion	= "|cffFFFF99The Burning Crusade Classic|r" 
elseif T.WotLK then	
	GameVersion	= "|cffFFFF99Wrath of the Lich King Classic|r" 
elseif T.Classic then	
	GameVersion	= "|cffFFFF99Classic Era / Season of Mastery|r" 
else
	GameVersion	= "|cffFFFF99World of Warcraft|r" 
end
local version, build, date, tocversion = GetBuildInfo()

------------------------------------------------------------------------------------------
-- WELCOME WINDOW
------------------------------------------------------------------------------------------
local MaxUIWelcome = function(self)
	local Window = self:CreateWindow("MaxUI", true)

	Window:CreateWindowLogo("All", GameVersion)
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Thank you for using MaxUI. Check the HELP section for slash commands.")
	Window:CreateExplanationText("All", 7, "For more information, support or feedback, go to www.tukui.org,")
	Window:CreateExplanationText("All", 8, "join the Tukui Discord or MaxUI Discord: |cff2299ffhttps://discord.gg/vzUFmUm|r")
	Window:CreateExplanationText("All", 9, "|cffFFFF99colored items|r only work with the MaxUI Theme, Style or Unitframes.")
	Window:CreateSpacer("All", 10)
	
	local GameVersionArt = CreateFrame("Frame", "GameVersionArt", Window)
	GameVersionArt:SetPoint("BOTTOM", Window, "BOTTOM", 0, 48)
	GameVersionArt:SetSize(Window:GetWidth()-48, Window:GetWidth()-48)
	GameVersionArt:CreateBackdrop("Transparent")
	GameVersionArt:EnableMouse(false)
	GameVersionArt:CreateShadow()

	GameVersionArt.ArtBG = GameVersionArt:CreateTexture(nil, "ARTWORK")
	GameVersionArt.ArtBG:SetInside(GameVersionArt)
	GameVersionArt.ArtBG:SetAlpha(0.7)

	GameVersionArt.logo = GameVersionArt:CreateTexture(nil, "OVERLAY")
	GameVersionArt.logo:SetPoint("TOP", GameVersionArt, "TOP")
	GameVersionArt.logo:SetSize(200, 100)
	GameVersionArt.logo:SetAlpha(1)

		GameVersionArt.WoWVersiontext = GameVersionArt:CreateFontString(nil, "OVERLAY")
		GameVersionArt.WoWVersiontext:SetFont(C.Medias.Font, 12)
		GameVersionArt.WoWVersiontext:SetPoint("TOP", GameVersionArt.logo, "BOTTOM", 0, 4)
		GameVersionArt.WoWVersiontext:SetTextColor(1, 1, 1)
		GameVersionArt.WoWVersiontext:SetShadowColor(0, 0, 0)
		GameVersionArt.WoWVersiontext:SetShadowOffset(1, -1)
		GameVersionArt.WoWVersiontext:SetText(version)	
		
		if tocversion >= 10000 and tocversion <= 19999 then
			GameVersionArt.logo:SetTexture(T.GetTexture("yLogoClassic"))
		elseif tocversion >= 20000 and tocversion <= 29999 then
			GameVersionArt.logo:SetTexture(T.GetTexture("yLogoBurningCrusade"))
		elseif tocversion >= 30000 and tocversion <= 39999 then
			GameVersionArt.logo:SetTexture(T.GetTexture("yLogoWotLK"))
		elseif tocversion >= 40000 and tocversion <= 49999 then
			GameVersionArt.logo:SetTexture(T.GetTexture("yLogoCataclysm"))
		elseif tocversion >= 50000 and tocversion <= 59999 then
			GameVersionArt.logo:SetTexture(T.GetTexture("yLogoMistsOfPandaria"))
		elseif tocversion >= 60000 and tocversion <= 69999 then
			GameVersionArt.logo:SetTexture(T.GetTexture("yLogoWarlordsOfDraenor"))
		elseif tocversion >= 70000 and tocversion <= 79999 then
			GameVersionArt.logo:SetTexture(T.GetTexture("yLogoLegion"))
		elseif tocversion >= 80000 and tocversion <= 89999 then
			GameVersionArt.logo:SetTexture(T.GetTexture("yLogoBattleForAzeroth"))
		elseif tocversion >= 90000 and tocversion <= 99999 then
			GameVersionArt.logo:SetTexture(T.GetTexture("yLogoShadowlands"))
		elseif tocversion >= 100000 and tocversion <= 109999 then
			GameVersionArt.logo:SetTexture(T.GetTexture("yLogoDragonflight"))
		end

	if C["ConfigMenu"]["EnableCustomBG"] == false then
		if tocversion >= 10000 and tocversion <= 19999 then
			GameVersionArt.ArtBG:SetTexture(T.GetTexture("zClassicBG"))
		elseif tocversion >= 20000 and tocversion <= 29999 then
			GameVersionArt.ArtBG:SetTexture(T.GetTexture("zBurningCrusadeBG"))
		elseif tocversion >= 30000 and tocversion <= 39999 then
			GameVersionArt.ArtBG:SetTexture(T.GetTexture("zWotLKBG"))
		elseif tocversion >= 40000 and tocversion <= 49999 then
			GameVersionArt.ArtBG:SetTexture(T.GetTexture("zCataclysmBG"))
		elseif tocversion >= 50000 and tocversion <= 59999 then
			GameVersionArt.ArtBG:SetTexture(T.GetTexture("zMistsOfPandariaBG"))
		elseif tocversion >= 60000 and tocversion <= 69999 then
			GameVersionArt.ArtBG:SetTexture(T.GetTexture("zWarlordsOfDraenorBG"))
		elseif tocversion >= 70000 and tocversion <= 79999 then
			GameVersionArt.ArtBG:SetTexture(T.GetTexture("zLegionBG"))
		elseif tocversion >= 80000 and tocversion <= 89999 then
			GameVersionArt.ArtBG:SetTexture(T.GetTexture("zBattleForAzerothBG"))
		elseif tocversion >= 90000 and tocversion <= 99999 then
			GameVersionArt.ArtBG:SetTexture(T.GetTexture("zShadowlandsBG"))
		elseif tocversion >= 100000 and tocversion <= 109999 then
			GameVersionArt.ArtBG:SetTexture(T.GetTexture("zDragonFlightBG"))
		else
			GameVersionArt.ArtBG:SetTexture(0.11, 0.11, 0.11)
		end
	else
		GameVersionArt.ArtBG:SetTexture(T.GetTexture(C["ConfigMenu"]["CustomBG"]))
	end	

	GameVersionArt.LogoMaxUI = GameVersionArt:CreateTexture(nil, "OVERLAY")
	GameVersionArt.LogoMaxUI:SetWidth(150)
	GameVersionArt.LogoMaxUI:SetHeight(75)
	GameVersionArt.LogoMaxUI:SetPoint("BOTTOMLEFT", GameVersionArt, "BOTTOMLEFT", 12, 32)
	GameVersionArt.LogoMaxUI:SetTexture([[Interface\AddOns\MaxUI\Medias\MaxUI\MaxUI_LOGO.tga]])

		GameVersionArt.MaxUIVersiontext = GameVersionArt:CreateFontString(nil, "OVERLAY")
		GameVersionArt.MaxUIVersiontext:SetFont(C.Medias.Font, 12)
		GameVersionArt.MaxUIVersiontext:SetPoint("TOP", GameVersionArt.LogoMaxUI, "BOTTOM", 0, -4)
		GameVersionArt.MaxUIVersiontext:SetTextColor(1, 1, 1)
		GameVersionArt.MaxUIVersiontext:SetShadowColor(0, 0, 0)
		GameVersionArt.MaxUIVersiontext:SetShadowOffset(1, -1)
		GameVersionArt.MaxUIVersiontext:SetText(MaxUIVersion)	

	GameVersionArt.Logotukui = GameVersionArt:CreateTexture(nil, "OVERLAY")
	GameVersionArt.Logotukui:SetWidth(100)
	GameVersionArt.Logotukui:SetHeight(100)
	GameVersionArt.Logotukui:SetPoint("BOTTOMRIGHT", GameVersionArt, "BOTTOMRIGHT", -32, 32)
	GameVersionArt.Logotukui:SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\logo.blp]])

		GameVersionArt.TukuiVersiontext = GameVersionArt:CreateFontString(nil, "OVERLAY")
		GameVersionArt.TukuiVersiontext:SetFont(C.Medias.Font, 12)
		GameVersionArt.TukuiVersiontext:SetPoint("TOP", GameVersionArt.Logotukui, "BOTTOM", 0, -4)
		GameVersionArt.TukuiVersiontext:SetTextColor(1, 1, 1)
		GameVersionArt.TukuiVersiontext:SetShadowColor(0, 0, 0)
		GameVersionArt.TukuiVersiontext:SetShadowOffset(1, -1)
		GameVersionArt.TukuiVersiontext:SetText(TukuiVersion)	
end
GUI:AddWidgets(MaxUIWelcome)

------------------------------------------------------------------------------------------
-- CHANGELOG
------------------------------------------------------------------------------------------

-- seperate LUA file

------------------------------------------------------------------------------------------
-- HELP WINDOW
------------------------------------------------------------------------------------------
L.Help.Grid = "|cff00ff00/tukui grid|r or |cff00ff00/tukui grid 128|r : Display a grid which allow you to better align frames."
L.Help.Status = "|cff00ff00/tukui status|r or |cff00ff00/tukui debug|r : Show a debug window with information about debugging the UI"

L.MaxUIHelp = {} -- /maxui help
L.MaxUIHelp.Print = "|cffffff99/maxui|r : Print the MaxUI commands in chat"
L.MaxUIHelp.DataCenter = "|cffffff99/maxui datacenter|r or |cffffff99/maxui dc|r : Open the MaxUI data center"
L.MaxUIHelp.GameMenu = "|cffffff99/maxui gamemenu|r or |cffffff99/maxui gm|r : Open the MaxUI game menu"
L.MaxUIHelp.RaidTools = "|cffffff99/maxui raidtools|r or |cffffff99/maxui rt|r : Open the MaxUI raid tools"
L.MaxUIHelp.BuffTracker = "|cffffff99/maxui bufftracker|r or |cffffff99/maxui bt|r : Open the MaxUI buff tracker"


local MaxUIHelp = function(self)
	local Window = self:CreateWindow("Help", false)

	Window:CreateWindowLogo("All", "|cffFFFF99Help Section|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Several slash commands are integrated in the config section.")
	Window:CreateSpacer("All", 7)
	
	Window:CreateSection("All", "MaxUI slash commands")
	Window:CreateTextLine("All", L.MaxUIHelp.Print)
	Window:CreateTextLine("All", L.MaxUIHelp.GameMenu)
	Window:CreateTextLine("All", L.MaxUIHelp.RaidTools)
	Window:CreateTextLine("All", L.MaxUIHelp.BuffTracker)
	Window:CreateTextLine("All", L.MaxUIHelp.DataCenter)
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Tukui slash commands")
	Window:CreateTextLine("All", L.Help.Config)
	Window:CreateSpacerNoPos("All")

	Window:CreateTextLine("All", "INSTALL OR RESET:")
	Window:CreateTextLine("All", L.Help.Install)
	Window:CreateTextLine("All", "|cff00ff00/tukui reset blizzard|r : to reset the blizzard ui to default (Edit mode reset)")
	Window:CreateTextLine("All", L.Help.Chat)
	Window:CreateSpacerNoPos("All")

	Window:CreateTextLine("All", "SETTINGS:")
	Window:CreateTextLine("All", L.Help.Keybinds)
	Window:CreateTextLine("All", L.Help.Move)
	Window:CreateSpacerNoPos("All")

	Window:CreateTextLine("All", "DATATEXTS:")
	Window:CreateTextLine("All", L.Help.Datatexts)
	Window:CreateTextLine("All", L.Help.Gold)
	Window:CreateTextLine("All", "|cff00ff00/tukui dt reset|r : reset the datatexts to default settings.")
	Window:CreateSpacerNoPos("All")

	Window:CreateTextLine("All", "TOOLS:")
	Window:CreateTextLine("All", L.Help.MicroMenu)
	Window:CreateTextLine("All", L.Help.ObjectiveTracker)
	Window:CreateTextLine("All", L.Help.Profiles)
	Window:CreateTextLine("All", L.Help.RaidUtilities)
	Window:CreateTextLine("All", L.Help.Tracking)
	Window:CreateSpacerNoPos("All")

	Window:CreateTextLine("All", "DEBUG:")
	Window:CreateTextLine("All", L.Help.Test)
	Window:CreateTextLine("All", L.Help.Status)
	Window:CreateTextLine("All", "|cff00ff00/tukui fn|r : to get the global frame name for mouseover frame.")
	Window:CreateSpacerNoPos("All")

	Window:CreateTextLine("All", "ADDONS:")
	Window:CreateTextLine("All", L.Help.Load)
	Window:CreateSpacerNoPos("All")
end
GUI:AddWidgets(MaxUIHelp)

------------------------------------------------------------------------------------------
-- CONFIGURATION SECTION
------------------------------------------------------------------------------------------
local MaxUIConfig = function(self)
	local Window = self:CreateWindow("Config")

	Window:CreateWindowLogo("All", "|cffFFFF99Configuration|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Most of these options are also accessable as slash commands,")
	Window:CreateExplanationText("All", 7, "check the Help section for more info.")
	Window:CreateSpacer("All", 8)

	Window:CreateSection("All", "Mode")
	Window:CreateDropdown("All", "ConfigMenu", "Style", "Set configuration mode")
	Window:CreateSwitch("All", "ConfigMenu", "EnableCustomBG", "Enable custom art settings for main window")
	Window:CreateDropdown("All", "ConfigMenu", "CustomBG", "Set custom art", "Texture")
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Tukui/MaxUI settings")
	Window:CreateSectionButton("All", "Default Blizzard", "Reset BLizzard and Edit Mode to default settings to prevent bug", GUI.TotalResetBLizzard)	
	Window:CreateSectionButton("All", "Default", "Reset Tukui/MaxUI to default settings", GUI.TotalReset)	
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Unitframes")
	Window:CreateSectionButton("All", "Test", "Run test mode", GUI.TukuiTest)	
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Loot modules")
	Window:CreateSectionButton("All", "Test", "Run grouploot test mode", GUI.TukuiGroupLootTest)	
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Chat settings")
	Window:CreateSectionButton("All", "Default", "Reset chat to default settings by theme (Tukui / MaxUI)", GUI.ChatSetupReset)	
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Datatext settings")
	Window:CreateSectionButton("All", "Default", "Set all datatexts to default by theme (Tukui / MaxUI)", GUI.DatatextSetupDefault)	
	Window:CreateSectionButton("All", "Config", "Open datatext configuration mode", GUI.DatatextSetupConfig)	
	Window:CreateSectionButton("All", "Gold Reset", "Reset gold datatext", GUI.DatatextSetupGoldReset)	
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Tukui/MaxUI tools")
	Window:CreateSectionButton("All", "Keybinds", "Open hover keybinds", GUI.TukuiKeybinds)	
	Window:CreateSectionButton("All", "Debuff tracking", "Open raid debuff tracking tool", GUI.TukuiDebuffTracking)	
	Window:CreateSectionButton("All", "Markers", "Open Tukui markers", GUI.TukuiMarkers)	
	Window:CreateSectionButton("All", "Micromenu", "Open Tukui Micromenu", GUI.TukuiMicroMenu)	
	Window:CreateSectionButton("All", "AFK", "Run afk mode", GUI.AFK)	
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Move & Grid settings")
	Window:CreateSectionButton("All", "Move", "Enable movable elements", GUI.TukuiMove)	
	Window:CreateSectionButton("All", "Standard", "Standard alignment grid", GUI.TukuiGrid)	
	Window:CreateSectionButton("All", "24", "Square grid", GUI.TukuiGrid24)	
	Window:CreateSectionButton("All", "48", "Square grid", GUI.TukuiGrid48)	
	Window:CreateSectionButton("All", "64", "Square grid", GUI.TukuiGrid64)	
	Window:CreateSectionButton("All", "96", "Square grid", GUI.TukuiGrid96)	
	Window:CreateSectionButton("All", "128", "Square grid", GUI.TukuiGrid128)	
	Window:CreateSpacerNoPos("All")

	if C["ConfigMenu"]["Style"]["Value"] == "Developer" then
		Window:CreateSection("All", "Developer settings")
		Window:CreateSectionButton("All", "Help", "Print Tukui help in chat", GUI.TukuiPrint)	
		Window:CreateSectionButton("All", "Status", "Tukui status report", GUI.TukuiStatus)	
		Window:CreateSectionButton("All", "Frame Stack", "Run frame stack tool", GUI.FStack)	
		Window:CreateSectionButton("All", "Trace Events", "Tukui trace events (chat)", GUI.TukuiTraceEvents)	
	end
end
GUI:AddWidgets(MaxUIConfig)

------------------------------------------------------------------------------------------
-- GENERAL
------------------------------------------------------------------------------------------
local General = function(self)
	local Window = self:GetWindow("General")
	
	Window:CreateWindowLogo("All", "|cffFFFF99General options|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "General UI options for color, fonts and more.")
	Window:CreateExplanationText("All", 7, "The global font only sets fonts for texts that aren't adjustable in other sections.")
	Window:CreateExplanationText("All", 8, "It will change the fonts for the GUI, the tooltip descriptions,")
	Window:CreateExplanationText("All", 9, "several blizzard frames and more.")
	Window:CreateSpacer("All", 10)
	
	if (Locale ~= "koKR" or Locale ~= "zhTW" or Locale ~= "zhCN") then
		Window:CreateSpacer("All", 13)
		Window:CreateSpacer("All", 16)
		Window:CreateSpacer("All", 19)
		Window:CreateSpacer("All", 25)
		Window:CreateSlider("All", "General", "FontSize", "Set global font size", 6, 32, 1)
		Window:CreateSpacerNoPos("All")
	else	
		Window:CreateSpacer("All", 13)
		Window:CreateSpacer("All", 16)
		Window:CreateSpacer("All", 19)
		Window:CreateSpacer("All", 25)
	end

	Window:CreateSection("All", "Fader Animation")
	Window:CreateSlider("All", "General", "FaderTime", "|cffFFFFFFSet fade duration for animated elements|r", 0, 2, 0.1)
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "MAXUI Frames")
	Window:CreateSlider("All", "General", "GeneralPanelAlpha", "|cffFFFF99Set line/panel transparency|r", 0, 1, 0.05)
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "MAXUI Edges & Borders")
	Window:CreateSlider("All", "General", "thickness", "|cffFFFF99Set line/panel thickness|r", 1, 40, 1)
	Window:CreateSlider("All", "General", "ABLineThickness", "|cffFFFF99Set actionbar edge thickness|r", 1, 40, 1)
	--Window:CreateSwitch("All", "General", "TopEdgeText", "Enable text on top edge/border")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "MAXUI Headers")
	Window:CreateSlider("All", "General", "HeaderHeight", "Set height for headers", 0, 100, 1)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "MAXUI Buttons")
	Window:CreateDropdown("All", "General", "ButtonStyle", "Set style for button icons")
	Window:CreateSwitch("All", "General", "IconDesaturate", "Enable desaturation of button icons")
	Window:CreateSlider("All", "General", "ButtonSize", "Set button size", 10, 40, 1)
	--Window:CreateDropdown("All", "General", "ButtonFont", "Set button font", "Font")
	Window:CreateSlider("All", "General", "ButtonFontSize", "|cffFFFFFFSet button font size|r", 6, 32, 1)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Texture")
	Window:CreateDropdown("All", "General", "HeaderTexture", "|cffFFFF99Set general header texture|r", "Texture")
	Window:CreateDropdown("All", "General", "LineTexture", "|cffFFFF99Set general line/panel texture|r", "Texture")
	Window:CreateDropdown("All", "General", "TextureButton", "|cffFFFF99Set general button texture|r", "Texture")
	Window:CreateDropdown("All", "General", "StatusBarTexture", "|cffFFFF99Set general statusbar texture|r", "Texture")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Colors")
	Window:CreateDropdown("All", "General", "ClassColorHeaders", "|cffFFFF99Set header color|r")
	Window:CreateDropdown("All", "General", "ButtonColor", "|cffFFFF99Set button color|r")
	Window:CreateDropdown("All", "General", "ClassColorLines", "|cffFFFF99Set line/panel color|r")
	Window:CreateDropdown("All", "General", "ClassColorActionBarLines", "|cffFFFF99Set actionbar edge color|r")
	Window:CreateDropdown("All", "General", "ClassShadow", "|cffFFFF99Set shadow color|r")
	Window:CreateSwitch("All", "General", "ClassShadowExcludeUF", "|cffFFFF99Exclude unitframes from shadow color|r")
	Window:CreateColorSelection("All", "General", "CustomColor", "|cffFFFF99Set custom color|r")
	Window:CreateSpacerNoPos("All")
end
GUI:AddWidgets(General)

------------------------------------------------------------------------------------------
-- QUICK SETUP	
------------------------------------------------------------------------------------------
local QuickSetup = function(self)
	local Window = self:CreateWindow("Quick Setup")

	Window:CreateWindowLogo("All", "|cffFFFF99Quick Setup|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Options for a quick basic setup using several fixed settings or layouts.")
	Window:CreateExplanationText("All", 7, "When step 3 is set to 'locked', actionbars can not be modified in the actionbar section.")
	Window:CreateExplanationText("All", 8, "The Tukui layout doesn't have actionbar adjustments.")
	Window:CreateExplanationText("All", 9, "For more customization options go to the appropiate section.")
	Window:CreateSpacer("All", 10)

	Window:CreateSection("All", "Step 0: General theme")
	Window:CreateDropdown("All", "General", "Themes", "Set UI theme")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Step 1: Role / Playstyle (actionbars)")
	Window:CreateDropdown("All", "Layout", "LayoutRole", "Set role / playstyle")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Step 2:Positioning (actionbars)")
	Window:CreateDropdown("All", "Layout", "LayoutAB", "Set predefined position(s) for certain actionbars")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Step 3: Customize layout (actionbars)")
	Window:CreateDropdown("All", "Layout", "LayoutCustomize", "Set customize state for layouts / actionbars")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Step 4: Units Style")
	Window:CreateDropdown("All", "UnitFrames", "Style", "Set unitframes style")
	Window:CreateDropdown("All", "ClassOptions", "ClassPowerStyle", "Set class power style")
	Window:CreateDropdown("All", "Raid", "Style", "Set raid unit style")
	Window:CreateDropdown("All", "Party", "Style", "Set party unit style")
	Window:CreateDropdown("All", "NamePlates", "Style", "Set nameplates style")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Step 5: Unitframes orientation")
	Window:CreateDropdown("All", "UnitFrames", "HorVer", "|cffFFFF99Set unitframes orientation|r")
	Window:CreateDropdown("All", "ClassOptions", "ClassResourcesOrientation", "|cffFFFF99Set class resources orientation|r")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Step 6: Unitframes anchoring")
	Window:CreateSlider("All", "UnitFrames", "MaxUIAnchorWidth", "|cffFFFFFFSet horizontal offset for player and target|r", -1000, 1000, 1)
	Window:CreateSlider("All", "UnitFrames", "MaxUIAnchorVertical", "|cffFFFFFFSet vertical offset for player and target|r", -1000, 1000, 1)
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Step 7: Unitframes customization")
	Window:CreateDropdown("All", "UnitFrames", "Colorstyle", "Set color style for all unitframes")
	Window:CreateDropdown("All", "UnitFrames", "Roles", "Set style for role icons used on all unitframes")
end
GUI:AddWidgets(QuickSetup)

------------------------------------------------------------------------------------------
-- PROFILES
------------------------------------------------------------------------------------------
local Profiles = function(self)
	local Profiles = T.Profiles
	local BrightColor = {0.35, 0.35, 0.35}
	local baseProfilesEnable = Profiles.Enable
	local EditBox = Profiles:GetParent().EditBox
	
	local Window = self:CreateWindow("Profiles")
	Window:HookScript("OnShow", GUI.ProfilesShow)
	Window:HookScript("OnHide", GUI.ProfilesHide)

	Window:CreateWindowLogo("All", "|cffFFFF99Profiles|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Quickly copy a profile from another character or import/export with a textstring.")
	Window:CreateSpacer("All", 7)

	Window:CreateSection("All", "Profiles")
	local Profile = Window:CreateDropdown("All", "General", "Profiles", "Import a profile from another character")
	Profile.Menu:HookScript("OnHide", GUI.SetProfile)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "IMPORT/EXPORT")

	function Profiles:Enable()
		baseProfilesEnable(self)

		self.Logo:Kill()
		self.Backdrop:Kill()
		self.Shadow:Kill()
		self.Close:Kill()

		self:ClearAllPoints()
		self:SetParent(Window)
		self:SetPoint("BOTTOM", Window, "BOTTOM", 0, 0)
	
		self.Status:SetFont(C.Medias.Font, 12, "")
		self.Status:SetTextColor(1, 1, 1)
		self.Status:ClearAllPoints()
		self.Status:SetPoint("TOP", Window, "TOP", 0, -264)

		self.Title:SetFont(C.Medias.Font, 12, "")
		self.Title:ClearAllPoints()
		self.Title:SetPoint("TOP", self.Status, "BOTTOM", 0, -12)
		
		self.Description:SetFont(C.Medias.Font, 12, "")
		
		self.ScrollArea:ClearAllPoints()
		self.ScrollArea:SetPoint("TOPLEFT", Window, "TOPLEFT", 24, -340)
		self.ScrollArea:SetPoint("BOTTOMRIGHT", Window, "BOTTOMRIGHT", -46, 80)
		
		self.ScrollArea.Backdrop:SetBorderColor(0, 0, 0)
		self.ScrollArea.Backdrop:SetAlpha(0.7)
		self.ScrollArea.Backdrop:CreateShadow()
		
		self.EditBox:SetWidth(self.ScrollArea:GetWidth())
		self.EditBox:SetHeight(self.ScrollArea:GetHeight())
		
		self.Reset:ClearAllPoints()
		self.Reset:SetPoint("BOTTOMRIGHT", Window, "BOTTOM", -4, 24)
		self.Reset:SetHeight(20)
		self.Reset:SetWidth(244)

		self.Apply:ClearAllPoints()
		self.Apply:SetPoint("BOTTOMLEFT", Window, "BOTTOM", 4, 24)
		self.Apply:SetHeight(20)
		self.Apply:SetWidth(244)
	end
end
GUI:AddWidgets(Profiles)

------------------------------------------------------------------------------------------
-- FILTERS/MASKS
------------------------------------------------------------------------------------------
local MaxUIFilters = function(self)
	local Window = self:CreateWindow("Masks")

	Window:CreateWindowLogo("All", "|cffFFFF99Masks|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Extra visual masks/filters for")
	Window:CreateExplanationText("All", 7, "MaxUI and Tukui elements.")
	Window:CreateSpacer("All", 8)

	Window:CreateSection("All", "Settings")
	Window:CreateDropdown("All", "Skins", "SkinTexture", "|cffFFFF99Set texture for the mask overlay|r", "Texture")
	Window:CreateDropdown("All", "Skins", "SkinVerticalTexture", "|cffFFFF99Set texture for the mask overlay for vertical unitframes|r", "Texture")
	Window:CreateSlider("All", "Skins", "FilterAlpha", "|cffFFFF99Set mask alpha|r", 0, 1, 0.1)
	Window:CreateColorSelection("All", "Skins", "CustomFilterColor", "|cffFFFF99Set custom color|r")
	Window:CreateSpacerNoPos("All")
	Window:CreateSection("All", "Mask: General")
	Window:CreateSwitch("All", "Skins", "ButtonFilter", "|cffFFFF99Enable a mask for buttons|r")
	Window:CreateSwitch("All", "Skins", "HeaderFilter", "|cffFFFF99Enable a mask for headers|r")
	Window:CreateSwitch("All", "Skins", "BackdropFilter", "|cffFFFF99Enable a mask for standard frames/backdrops|r")
	Window:CreateSpacerNoPos("All")
	Window:CreateSection("All", "Mask: Unitframes")
	Window:CreateSwitch("All", "Skins", "NamePlatesFilter", "|cffFFFF99Enable a mask for the nameplates|r")
	Window:CreateSwitch("All", "Skins", "UnitFramesFilter", "|cffFFFF99Enable a mask for the individual unitframes|r")
	Window:CreateSwitch("All", "Skins", "GroupRaidFilter", "|cffFFFF99Enable a mask for the group or raid unitframes|r")
	Window:CreateSpacerNoPos("All")
	Window:CreateSection("All", "Mask: Icons (actionbars and auras)")
	Window:CreateSwitch("All", "Skins", "ActionBarButtonFilter", "|cffFFFF99Enable a mask for the actionbar buttons|r")
	Window:CreateSwitch("All", "Skins", "AurasFilter", "|cffFFFF99Enable a mask for the auras|r")
	Window:CreateSpacerNoPos("All")
	Window:CreateSection("All", "Mask: Elements")
	Window:CreateSwitch("All", "Skins", "BattlegroundTrackerFilter", "|cffFFFF99Enable a mask for battleground tracker |r")
	Window:CreateSwitch("All", "Skins", "ChatFilter", "|cffFFFF99Enable a mask for the chat panels|r")
	Window:CreateSwitch("All", "Skins", "DataBarFilter", "|cffFFFF99Enable a mask for the databars|r")
	Window:CreateSwitch("All", "Skins", "DataCenterFilter", "|cffFFFF99Enable a mask for the data center panel|r")
	Window:CreateSwitch("All", "Skins", "DataTextFilter", "|cffFFFF99Enable a mask for the datatexts|r")
	--Window:CreateSwitch("All", "Skins", "InventoryFilter", "|cffFFFF99Enable a mask for the inventory elements|r")
	--Window:CreateSwitch("All", "Skins", "InventoryBGFilter", "|cffFFFF99Enable a mask for the inventory backdrops|r")
	Window:CreateSwitch("All", "Skins", "MinimapFilter", "|cffFFFF99Enable a mask for the minimap|r")
	Window:CreateSwitch("All", "Skins", "MinimapElementsFilter", "|cffFFFF99Enable a mask for the minimap elements|r")
	Window:CreateSwitch("All", "Skins", "ObjectiveTrackerFilter", "|cffFFFF99Enable a mask for objective tracker elements|r")
	Window:CreateSwitch("All", "Skins", "TooltipFilter", "|cffFFFF99Enable a mask for the tooltip|r")
	Window:CreateSwitch("All", "Skins", "TooltipHealthFilter", "|cffFFFF99Enable a mask for the tooltip health bar|r")
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Mask: Screen and AFK")
	Window:CreateSwitch("All", "Skins", "UIParentFilter", "|cffFFFF99Enable a shadowy mask for the screen|r")
	Window:CreateSwitch("All", "Skins", "AFKFilter", "|cffFFFF99Enable a mask for the afk screen|r")
	Window:CreateSlider("All", "Skins", "FilterSize", "|cffFFFF99Set screen mask size|r", 0, 300, 2)
	Window:CreateSlider("All", "Skins", "ScreenFilterAlpha", "|cffFFFF99Set screen mask alpha|r", 0, 1, 0.1)
	Window:CreateColorSelection("All", "Skins", "ScreenFilterColor", "|cffFFFF99Set screen mask color|r")
	Window:CreateSpacerNoPos("All")
end
GUI:AddWidgets(MaxUIFilters)

------------------------------------------------------------------------------------------
-- SKINS	
------------------------------------------------------------------------------------------
local MaxUISkins = function(self)
	local Window = self:CreateWindow("Skins")

	Window:CreateWindowLogo("All", "|cffFFFF99Skinning|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Skinning frames and addons in MaxUI style")
	Window:CreateExplanationText("All", 7, "mostly Retail, some for Classic or Classic Era")
	Window:CreateExplanationText("All", 8, "Use at own discretion, no support at the moment")
	Window:CreateSpacer("All", 9)
	
	Window:CreateSection("All", "MaxUI Skinning")
	Window:CreateSwitch("All", "Skins", "MaxUISkinsBlizzard", "Enable MaxUI's own style and skinning for Blizzard frames. (WIP)")
	Window:CreateSwitch("All", "Skins", "MaxUISkinsAddons", "Enable MaxUI's own style and skinning for (some) Addons. (WIP)")
	Window:CreateSwitch("All", "Skins", "MaxUIPositioningBlizzardFrames", "Enable MaxUI alternate (centered) positions for frames.")
	Window:CreateSpacerNoPos("All")

	if C.Skins.MaxUISkinsBlizzard then
		Window:CreateSection("All", "MaxUI Blizzard Skinning")
		Window:CreateDoubleSwitch("All", "Skins", "GameMenu", "Enable skin Game Menu", "Skins", "Character", "Enable skin Character")
		Window:CreateDoubleSwitch("All", "Skins", "CustomerSupport", "Enable skin Customer Support", "Skins", "Talents", "Enable skin Talents")
		Window:CreateDoubleSwitch("All", "Skins", "WhatsNew", "Enable skin What's New?", "Skins", "Spellbook", "Enable skin Spellbook")
		Window:CreateDoubleSwitch("All", "Skins", "Report", "Enable skin Report", "Skins", "DressingRoom", "Enable skin DressingRoom")
		Window:CreateSwitch("All", "Skins", "SettingsPanel", "Enable skin Settings Panel")
		Window:CreateSpacerNoPos("All")

		Window:CreateDoubleSwitch("All", "Skins", "AddOns", "Enable skin Addon Manager", "Skins", "WorldMapQuestlog", "Enable skin World map and Questlog")
		Window:CreateDoubleSwitch("All", "Skins", "Keybinds", "Enable skin Keybinds", "Skins", "QuestGossip", "Enable skin Quest & Gossip")
		Window:CreateDoubleSwitch("All", "Skins", "Macros", "Enable skin Macro's", "Skins", "Flightmap", "Enable skin Flightmap")
		Window:CreateDoubleSwitch("All", "Skins", "Popups", "Enable skin Popups ", "Skins", "DungeonJournal", "Enable skin Dungeon Journal")
		Window:CreateDoubleSwitch("All", "Skins", "ColorPicker", "Enable skin Colorpicker ", "Skins", "MissionsRenown", "Enable skin Missions & Renown")
		Window:CreateSpacerNoPos("All")

		Window:CreateDoubleSwitch("All", "Skins", "Social", "Enable skin Social: Friends, Who, Raid", "Skins", "Merchant", "Enable skin Merchant")
		Window:CreateDoubleSwitch("All", "Skins", "LFG", "Enable skin PVE, PVP & LFG/LFD", "Skins", "Tradeskill", "Enable skin Tradeskills")
		Window:CreateDoubleSwitch("All", "Skins", "Guild", "Enable skin Guild", "Skins", "Trainer", "Enable skin Trainer")
		Window:CreateDoubleSwitch("All", "Skins", "Communities", "Enable skin Communities", "Skins", "AuctionHouse", "Enable skin Auction House")
		Window:CreateDoubleSwitch("All", "Skins", "EventCalendar", "Enable skin Event Calendar", "Skins", "Loot", "Enable skin Loot and grouploot")
		Window:CreateDoubleSwitch("All", "Skins", "Mail", "Enable skin Mail", "Skins", "Inventory", "Enable skin Bank and Bags")
		Window:CreateSpacerNoPos("All")

		Window:CreateDoubleSwitch("All", "Skins", "Voice", "Enable skin Voice", "Skins", "Achievements", "Enable skin Achievements")
		Window:CreateDoubleSwitch("All", "Skins", "StopWatch", "Enable skin StopWatch", "Skins", "Collections", "Enable skin Collections")
		Window:CreateSwitch("All", "Skins", "Other", "Enable skin Other")
		Window:CreateSpacerNoPos("All")
	end

	if C.Skins.MaxUISkinsAddons then
		Window:CreateSection("All", "MaxUI Addon Skinning")
		if IsAddOnLoaded('BugSack') then 
			Window:CreateSwitch("All", "AddOns", "BugSackSkin", "Enable skin BugSack")
		end
		if IsAddOnLoaded('Clique') then 
			Window:CreateSwitch("All", "AddOns", "CliqueSkin", "Enable skin Clique")
		end
		if IsAddOnLoaded('ColorPickerPlus') then 
			Window:CreateSwitch("All", "AddOns", "ColorPickerPlusSkin", "Enable skin ColorPickerPlus")
		end
		if IsAddOnLoaded('DBM-Core') then 
			Window:CreateSwitch("All", "AddOns", "DBMSkin", "Enable skin DBM")
		end
		if IsAddOnLoaded('Hekili') then 
			Window:CreateSwitch("All", "AddOns", "HekiliSkin", "Enable skin Hekili")
		end
		if IsAddOnLoaded('Immersion') then 
			Window:CreateSwitch("All", "AddOns", "ImmersionSkin", "Enable skin Immersion")
		end
		--if IsAddOnLoaded('Pawn') then 
		--	Window:CreateSwitch("All", "AddOns", "PawnSkin", "Enable skin Pawn")
		--end
		if IsAddOnLoaded('ProjectAzilroka') then 
			Window:CreateSwitch("All", "AddOns", "ProjectAzilrokaSkin", "Enable skin ProjectAzilroka: Square Minimap Button Bar")
		end
		if IsAddOnLoaded('Simulationcraft') then 
			Window:CreateSwitch("All", "AddOns", "SimulationcraftSkin", "Enable skin Simulationcraft")
		end
	end
end
GUI:AddWidgets(MaxUISkins)

------------------------------------------------------------------------------------------
-- ADDONS	
------------------------------------------------------------------------------------------
local AddOns = function(self)
	local Window = self:CreateWindow("AddOns")

	Window:CreateWindowLogo("All", "|cffFFFF99Loaded Addons|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Shortcuts to other enabled addons and their configuration.")
	Window:CreateExplanationText("All", 7, "Only most common addons / addons used by Maximvs.")
	Window:CreateSpacer("All", 8)

	Window:CreateSection("All", "Loaded AddOns")
	if IsAddOnLoaded('AddOnSkins') then 
		Window:CreateSectionButton("All", "open", "AddonSkins", GUI.OpenConfigAddOnSkins)	
	end

	if IsAddOnLoaded('AdvancedInterfaceOptions') then 
		Window:CreateSectionButton("All", "open", "Advanced Interface Options", GUI.OpenConfigAdvancedInterfaceOptions)
	end

	if IsAddOnLoaded('AstralKeys') then 
		Window:CreateSectionButton("All", "open", "Astral Keys", GUI.OpenConfigAstralKeys)
	end

	if IsAddOnLoaded('Auctionator') then 
		Window:CreateSectionButton("All", "open", "Auctionator", GUI.OpenConfigAuctionator)
	end
	
	if IsAddOnLoaded('BugSack') then 
		Window:CreateSectionButton("All", "open", "BugSack", GUI.OpenConfigBugSack)
	end
	
	if IsAddOnLoaded('Clique') then 
		Window:CreateSectionButton("All", "open", "Clique", GUI.OpenConfigClique)
	end

	if IsAddOnLoaded('DBM-Core') then 
		Window:CreateSectionButton("All", "open", "Deadly Boss Mods", GUI.OpenConfigDBM)	
	end
	
	if IsAddOnLoaded('Details') then 
		Window:CreateSectionButton("All", "open", "Details!", GUI.OpenConfigDetails)	
	end

	if IsAddOnLoaded('Hekili') then 
		Window:CreateSectionButton("All", "open", "Hekili", GUI.OpenConfigHekili)	
	end

	if IsAddOnLoaded('Immersion') then 
		Window:CreateSectionButton("All", "open", "Immersion", GUI.OpenConfigImmersion)	
	end

	if IsAddOnLoaded('Leatrix_Plus') then 
		Window:CreateSectionButton("All", "open", "Leatrix Plus", GUI.OpenConfigLeatrixPlus)
	end

	if IsAddOnLoaded('ls_Toasts') then 
		Window:CreateSectionButton("All", "open", "LS: Toasts", GUI.OpenConfigLSToasts)	
	end

	--if IsAddOnLoaded('Pawn') then 
	--	Window:CreateSectionButton("All", "open", "Pawn", GUI.OpenConfigPawn)
	--end

	if IsAddOnLoaded('ProjectAzilroka') then 
		Window:CreateSectionButton("All", "open", "Project Azilroka", GUI.OpenConfigProjectAzilroka)
	end

	if IsAddOnLoaded('Questie') then 
		Window:CreateSectionButton("All", "open", "Questie", GUI.OpenConfigQuestie)	
	end

	if IsAddOnLoaded('RSA') then 
		Window:CreateSectionButton("All", "open", "Raelli's Spell Announcer", GUI.OpenConfigRSA)	
	end
	
	if IsAddOnLoaded('Simulationcraft') then 
		Window:CreateSectionButton("All", "open", "SimCraft", GUI.OpenConfigSimCraft)	
	end

	if IsAddOnLoaded('WeakAuras') then 
		Window:CreateSectionButton("All", "open", "WeakAuras", GUI.OpenConfigWeakAuras)	
	end

	if IsAddOnLoaded('WorldQuestsList') then 
		Window:CreateSectionButton("All", "open", "World Quest List", GUI.OpenConfigWorldQuestList)
	end
	
	if IsAddOnLoaded('WorldQuestTab') then 
		Window:CreateSectionButton("All", "open", "World Quest Tab", GUI.OpenConfigWorldQuestTab)
	end
	Window:CreateSpacerNoPos("All")

	if IsAddOnLoaded('BugSack') and C.Skins.MaxUISkinsAddons and C.AddOns.BugSackSkin then 
		Window:CreateSection("All", "Bugsack")
		--Window:CreateSlider("All", "AddOns", "BugSackWidth", "Set width", 500, 1000, 1)
		Window:CreateSlider("All", "AddOns", "BugSackHeight", "Set height", 310, 1000, 1)
		Window:CreateSpacerNoPos("All")
	end

	if IsAddOnLoaded('ColorPickerPlus') and C.Skins.MaxUISkinsAddons and C.AddOns.ColorPickerPlusSkin then 
		Window:CreateSection("All", "ColorPickerPlus")
		Window:CreateSpacerNoPos("All")
	end

	if IsAddOnLoaded('DBM-Core') and C.Skins.MaxUISkinsAddons and C.AddOns.DBMSkin then 
		Window:CreateSection("All", "Deadly Boss mods")
		Window:CreateSwitch("All", "AddOns", "DBMSkinEdge", "Set top border/edge for DBM infoframes")
		Window:CreateDropdown("All", "AddOns", "DBMBarTextPosition", "Set position for DBM bar texts")
		Window:CreateSlider("All", "AddOns", "DBMBarBackdropAlpha", "Set alpha for the bar backdrop", 0, 1, 0.1)
		Window:CreateSlider("All", "AddOns", "DBMIconBarSpacing", "Set icon spacing", -50, 50, 1)
		Window:CreateSpacerNoPos("All")
	end

	if IsAddOnLoaded('Immersion') and C.Skins.MaxUISkinsAddons and C.AddOns.ImmersionSkin then 
		Window:CreateSection("All", "Immersion")
		Window:CreateSwitch("All", "AddOns", "ImmersionTopEdge", "Enable a small colored top border")
		Window:CreateSpacerNoPos("All")
	end
end
GUI:AddWidgets(AddOns)