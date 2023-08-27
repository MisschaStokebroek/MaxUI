------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-08-2023
------------------------------------------------------------------------------------------

-- setting up CONFIGURATION MAXUI, additional options and settings.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local ClassTextColor = T.RGBToHex(unpack(T.Colors.class[select(2, UnitClass("player"))]))

------------------------------------------------------------------------------------------
-- MAXUI
------------------------------------------------------------------------------------------
-- no settings

------------------------------------------------------------------------------------------
-- CHANGELOG
------------------------------------------------------------------------------------------
-- no settings, seperate textfile

------------------------------------------------------------------------------------------
-- HELP
------------------------------------------------------------------------------------------
-- no settings

------------------------------------------------------------------------------------------
-- CONFIG
------------------------------------------------------------------------------------------
C["ConfigMenu"] = {
	["Style"] = {
		["Options"] = {
			["Standard"] = "Extended",	
			["Developer Tools"] = "Developer",	
		},
		["Value"] = "Extended",
	},
	["EnableCustomBG"] = false,
	["CustomBG"] = "",

	["OldTukuiGUIEnable"] = false,
}

------------------------------------------------------------------------------------------	
-- GENERAL
------------------------------------------------------------------------------------------
-- profiles
--C["General"]["Profiles"]["Value"] = ""

-- themes
C["General"]["Themes"]["Options"]["|cffFFFF99MaxUI|r"] = "MaxUI"
C["General"]["Themes"]["Value"] = "MaxUI"

-- scaling
C["General"]["UIScale"] = T.PerfectScale

-- border and backdrop
C["General"]["BackdropColor"] = {0.11, 0.11, 0.11}
C["General"]["BorderColor"] = {0, 0, 0}
C["General"]["ClassColorBorder"] = false
C["General"]["HideShadows"] = false

-- fonts
C["General"]["GlobalFont"]["Options"]["Bold"] = "Interface\\AddOns\\MaxUI\\Medias\\Fonts\\Bold.ttf"
C["General"]["GlobalFont"]["Options"]["Cartoon"] = "Interface\\AddOns\\MaxUI\\Medias\\Fonts\\cartoon.ttf"
C["General"]["GlobalFont"]["Options"]["Comic"] = "Interface\\AddOns\\MaxUI\\Medias\\Fonts\\comic.ttf"
C["General"]["GlobalFont"]["Options"]["Warcraft"] = "Interface\\AddOns\\MaxUI\\Medias\\Fonts\\LifeCraft.ttf"
C["General"]["GlobalFont"]["Options"]["MaxUI"] = "Interface\\AddOns\\MaxUI\\Medias\\Fonts\\MaxUI.ttf"
C["General"]["GlobalFont"]["Options"]["MaxUI It."] = "Interface\\AddOns\\MaxUI\\Medias\\Fonts\\MaxUIitalic.ttf"
C["General"]["GlobalFont"]["Options"]["Morpheus"] = "Interface\\AddOns\\MaxUI\\Medias\\Fonts\\Morpheus.ttf"

C["General"]["GlobalFont"]["Value"] = "Interface\\AddOns\\MaxUI\\Medias\\Fonts\\MaxUI.ttf"
C["General"]["FontSize"] = 12 

-- not used atm.
C["General"]["FontFlag"] = {
	["Options"] = {
		["Thin Outline"] = "THINOUTLINE" ,
		["Outline"] = "OUTLINE",
		["Thick Outline"] = "THICKOUTLINE" ,
		["Monochrome"] = "MONOCHROME" ,
		["none"] = "",	
	},
	["Value"] = "OUTLINE" ,
}

-- fader animation
C["General"]["FaderTime"] = 1

-- maxui frames
C["General"]["GeneralPanelAlpha"] = 0.8

-- maxui edges and borders
C["General"]["thickness"] = 1
C["General"]["ABLineThickness"] = 1

-- maxui headers
C["General"]["HeaderHeight"] = 22
C["General"]["TopEdgeText"] = false

-- maxui buttons
C["General"]["ButtonStyle"] = {
	["Options"] = {
		["Blizzard"] = "Blizzard",
		["MaxUI"] = "MaxUI",
	},	
	["Value"] = "MaxUI",
}
C["General"]["IconDesaturate"] = true
C["General"]["ButtonSize"] = 24

C["General"]["ButtonFont"] = "MaxUI Outlined" -- not in GUI
C["General"]["ButtonFontSize"] = 12

-- general textures
C["General"]["HeaderTexture"] = "Tukui" 
C["General"]["LineTexture"] = "Tukui"
C["General"]["TextureButton"] = "Tukui"
C["General"]["StatusBarTexture"] = "Tukui"

-- colors
C["General"]["ClassColorLines"] = {
	["Options"] = {
		["|cff202020Dark|r"] = "Dark",
		["Standard"] = "Standard",
		["Backdrop"] = "BackdropColor",
		["|cffC0C0C0Grey|r"] = "Grey",
		["" ..ClassTextColor .."Class".. "|r"] = "ClassColor",	
		["Custom"] = "Custom",
	},
	["Value"] = "Grey",
}
C["General"]["ClassColorActionBarLines"] = {
	["Options"] = {
		["|cff202020Dark|r"] = "Dark",
		["Standard"] = "Standard",
		["Backdrop"] = "BackdropColor",
		["|cffC0C0C0Grey|r"] = "Grey",
		["" ..ClassTextColor .."Class".. "|r"] = "ClassColor",	
		["Custom"] = "Custom",
	},
	["Value"] = "Grey",
}
C["General"]["ClassColorHeaders"] = {
	["Options"] = {
		["|cff202020Dark|r"] = "Dark",
		["Backdrop"] = "BackdropColor",
		["|cffC0C0C0Grey|r"] = "Grey",
		["" ..ClassTextColor .."Class".. "|r"] = "ClassColor",	
		["Custom"] = "Custom",
	},
	["Value"] = "Grey",
}
C["General"]["ButtonColor"] = {
	["Options"] = {
		["|cff202020Dark|r"] = "Dark",
		["Standard"] = "Standard",
		["Backdrop"] = "BackdropColor",
		["|cffC0C0C0Grey|r"] = "Grey",
		["" ..ClassTextColor .."Class".. "|r"] = "ClassColor",	
		["Custom"] = "Custom",
	},
	["Value"] = "Standard",
}

-- not working through api
C["General"]["ClassShadow"] = {
	["Options"] = {
		["|cff202020Dark|r"] = "Dark",
		["Standard"] = "Standard",
		["Backdrop"] = "BackdropColor",
		["|cffC0C0C0Grey|r"] = "Grey",
		["" ..ClassTextColor .."Class".. "|r"] = "ClassColor",	
		["Custom"] = "Custom",
	},
	["Value"] = "Standard",
}
C["General"]["ClassShadowExcludeUF"] = false

C["General"]["CustomColor"] = {1, 0, 0}

------------------------------------------------------------------------------------------
-- LAYOUT = QUICK SETUP
------------------------------------------------------------------------------------------
-- general theme
-- C["General"]["Themes"]["Value"] = "MaxUI"

C["Layout"] = {
	
	-- step 1: playstyle
	["LayoutRole"] = {
		["Options"] = {
			["|cffFFFFFFHealer|r"] = "Healer",
			["|cffFFFFFFMelee|r"] = "Melee",	
			["|cffFFFFFFTank|r"] = "Tank",
			["|cffFFFFFFRange|r"] = "Range",
			["Tukui"] = "Tukui",
		},
		["Value"] = "Melee",
	},
	
	-- step 2: positioning ab
	["LayoutAB"] = {
		["Options"] = {
			["0 Basic"] = "Basic",
			["1 Centered Bar"] = "Single",	
			["2 Centered Bars"] = "Double",
		},
		["Value"] = "Basic",
	},
	
	-- step 3: customize state ab
	["LayoutCustomize"] = {
		["Options"] = {
			["Locked"] = "Fixed",
			["Custom"] = "Custom",	
		},
		["Value"] = "Fixed",
	},
}

-- step 4: units style
-- options from several unitframe sections

-- step 5: unit orientation
-- options from several unitframe sections

-- step 6: unitframe anchoring
-- options from Unitframes section

-- step 7: unit customization
-- options from Unitframes section

------------------------------------------------------------------------------------------
-- PROFILES
------------------------------------------------------------------------------------------
-- no settings used
-- C["General"]["Profiles"]["Value"] = ""
-- anchored the tukui profiles popupframe here

------------------------------------------------------------------------------------------
-- MASKS - SKINS
------------------------------------------------------------------------------------------
C["Skins"] = {
	
-- MASKS
	-- settings
	["SkinTexture"] = "Rounded",
	["SkinVerticalTexture"] = "Rounded Vert Left",
	["FilterAlpha"] = 0.8,
	["CustomFilterColor"] = {1, 1, 1},

	-- general
	["ButtonFilter"] = false,
	["HeaderFilter"] = false,
	["BackdropFilter"] = false,

	-- unitframes
	["NamePlatesFilter"] = false,
	["UnitFramesFilter"] = false,
	["GroupRaidFilter"] = false,

	-- icons/actionbars/auras
	["ActionBarButtonFilter"] = false,
	["AurasFilter"] = false,

	-- elements
	["BattlegroundTrackerFilter"] = false,
	["ChatFilter"] = false,
	["DataBarFilter"] = false,
	["DataCenterFilter"] = false,
	["DataTextFilter"] = false,
	["MinimapFilter"] = false,
	["MinimapElementsFilter"] = false,
	--["InventoryFilter"] = false,
	--["InventoryBGFilter"] = false,
	["ObjectiveTrackerFilter"] = false,
	["TooltipFilter"] = false,
	["TooltipHealthFilter"] = false,
		
	-- screen filter
	["UIParentFilter"] = false,
	["AFKFilter"] = false,
	["FilterSize"] = 48,
	["ScreenFilterAlpha"] = 0.8,
	["ScreenFilterColor"] = {0, 0, 0},
	
	-- used for??
	["Color"] = {
		["Options"] = {
			["|cff202020Dark|r"] = "Dark",
			["Backdrop"] = "BackdropColor",
			["|cffC0C0C0Grey|r"] = "Grey",
			["" ..ClassTextColor .."Class".. "|r"] = "ClassColor",	
			["Custom"] = "Custom",	
		},
	["Value"] = "Grey",
	["CustomSkinsColor"] = {1, 0, 0},
	},


-- Skins
	["MaxUISkinsBlizzard"] = true,
	["MaxUISkinsAddons"] = true,
	["MaxUIPositioningBlizzardFrames"] = false,
	--["MaxUIAddOnSkins"] = false,
	--["MaxUISkins"] = false,
	
	-- system (left 1)
	["GameMenu"] = true,
	["CustomerSupport"] = false,
	["WhatsNew"] = true,
	["Report"] = false,
	["SettingsPanel"] = false,
	
	-- character (right 1)
	["Character"] = false,
	["Talents"] = false,
	["Spellbook"] = false,
	["DressingRoom"] = false,

	-- blizzard tools (left 2)
	["AddOns"] = true,
	["Keybinds"] = false,
	["Macros"] = false,
	["Popups"] = true,
	["ColorPicker"] = true,

	-- maps and quest (right 2)
	["WorldMapQuestlog"] = false,
	["QuestGossip"] = false,
	["Flightmap"] = false,
	["DungeonJournal"] = false,
	["MissionsRenown"] = false,
	
	-- social (left 3)
	["Social"] = false,
	["LFG"] = false,
	["Guild"] = false,
	["Communities"] = false,
	["EventCalendar"] = false,
	["Mail"] = true,

	-- merchant and vendors (right 3)
	["Merchant"] = false,
	["Tradeskill"] = false,
	["Trainer"] = false,
	["AuctionHouse"] = false,
	["Loot"] = true,
	["Inventory"] = true,
	
	-- support (left 4)
	["Voice"] = false,
	["StopWatch"] = false,
	["Other"] = false,

	-- uncategorised (right 4)
	["Achievements"] = false,
	["Collections"] = false,
}

------------------------------------------------------------------------------------------
-- ADDONS
------------------------------------------------------------------------------------------
C["AddOns"] = {

	--bugsack
	["BugSackSkin"] = true,
	["BugSackWidth"] = 800,
	["BugSackHeight"] = 420,
	
	-- clique
	["CliqueSkin"] = false,

	-- Colorpickerplus
	["ColorPickerPlusSkin"] = true,

	-- DBM
	["DBMSkin"] = true,
	["DBMSkinEdge"] = true,
	["DBMBarBackdropAlpha"] = 0.8,
	["DBMIconBarSpacing"] = 6,
	["DBMBarTextPosition"] = {
		["Options"] = {
			["Above"] = "Above",	
			["Inside"] = "Inside",	
			["Below"] = "Below",	
		},
		["Value"] = "Inside",
	},

	-- hekili
	["HekiliSkin"] = true,

	-- Immersion
	["ImmersionSkin"] = true,
	["ImmersionTopEdge"] = true,

	-- pawn
	--["PawnSkin"] = false,

	-- projectazilroka (elements)
	["ProjectAzilrokaSkin"] = true,
	["MBBMaxUIFrameStyle"] = false,

	-- simcraft
	["SimulationcraftSkin"] = true,
}