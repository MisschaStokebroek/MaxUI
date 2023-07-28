------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 10-01-2023
------------------------------------------------------------------------------------------

-- setting up CONFIGURATION MAXUI, additional options and settings.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local ClassTextColor = T.RGBToHex(unpack(T.Colors.class[select(2, UnitClass("player"))]))

------------------------------------------------------------------------------------------
-- CONFIG MENU
------------------------------------------------------------------------------------------
C["AddOns"] = {

	["HekiliSkin"] = true,

	["BugSackSkin"] = true,
	["BugSackWidth"] = 800,
	["BugSackHeight"] = 420,

	["SimulationcraftSkin"] = true,

	["ImmersionSkin"] = true,
	["ImmersionTopEdge"] = true,

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

	["ColorPickerPlusSkin"] = true,
	
	["CliqueSkin"] = false,
	
	["ProjectAzilrokaSkin"] = true,
	["MBBMaxUIFrameStyle"] = false,
	
	--["PawnSkin"] = false,

}

------------------------------------------------------------------------------------------
-- CONFIG MENU
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
}

------------------------------------------------------------------------------------------
-- LAYOUT = QUICK SETUP
------------------------------------------------------------------------------------------
C["Layout"] = {
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
	
	["LayoutAB"] = {
		["Options"] = {
			["0 Basic"] = "Basic",
			["1 Centered Bar"] = "Single",	
			["2 Centered Bars"] = "Double",
		},
		["Value"] = "Basic",
	},
	
	["LayoutCustomize"] = {
		["Options"] = {
			["Locked"] = "Fixed",
			["Custom"] = "Custom",	
		},
		["Value"] = "Fixed",
	},
}

------------------------------------------------------------------------------------------	
-- GENERAL
------------------------------------------------------------------------------------------
-- themes
C["General"]["Themes"]["Options"]["|cffFFFF99MaxUI|r"] = "MaxUI"
C["General"]["Themes"]["Value"] = "MaxUI"

-- API 
C["General"]["FaderTime"] = 1

-- fonts
C["General"]["FontSize"] = 12 

C["General"]["GlobalFont"]["Options"]["Bold"] = "Interface\\AddOns\\MaxUI\\Medias\\Fonts\\Bold.ttf"
C["General"]["GlobalFont"]["Options"]["Cartoon"] = "Interface\\AddOns\\MaxUI\\Medias\\Fonts\\cartoon.ttf"
C["General"]["GlobalFont"]["Options"]["Comic"] = "Interface\\AddOns\\MaxUI\\Medias\\Fonts\\comic.ttf"
C["General"]["GlobalFont"]["Options"]["Warcraft"] = "Interface\\AddOns\\MaxUI\\Medias\\Fonts\\LifeCraft.ttf"
C["General"]["GlobalFont"]["Options"]["MaxUI"] = "Interface\\AddOns\\MaxUI\\Medias\\Fonts\\MaxUI.ttf"
C["General"]["GlobalFont"]["Options"]["MaxUI It."] = "Interface\\AddOns\\MaxUI\\Medias\\Fonts\\MaxUIitalic.ttf"
C["General"]["GlobalFont"]["Options"]["Morpheus"] = "Interface\\AddOns\\MaxUI\\Medias\\Fonts\\Morpheus.ttf"

C["General"]["GlobalFont"]["Value"] = "Interface\\AddOns\\MaxUI\\Medias\\Fonts\\MaxUI.ttf"

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

-- panels and frames
C["General"]["GeneralPanelAlpha"] = 0.8
C["General"]["thickness"] = 1
C["General"]["ABLineThickness"] = 1
C["General"]["HeaderHeight"] = 22
C["General"]["TopEdgeText"] = false

-- move to datatexts
C["General"]["ScreenSpacing"] = 6

-- buttons
C["General"]["ButtonStyle"] = {
	["Options"] = {
		["Blizzard"] = "Blizzard",
		["MaxUI"] = "MaxUI",
	},	
	["Value"] = "MaxUI",
}

C["General"]["IconDesaturate"] = true
C["General"]["ButtonSize"] = 24

C["General"]["ButtonFont"] = "MaxUI Outlined"
C["General"]["ButtonFontSize"] = 12

-- textures
C["General"]["HeaderTexture"] = "Tukui" 
C["General"]["LineTexture"] = "Tukui"
C["General"]["TextureButton"] = "Tukui"
C["General"]["StatusBarTexture"] = "Tukui"

-- colors
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

C["General"]["CustomColor"] = {1, 0, 0}

C["General"]["ClassShadowExcludeUF"] = false

------------------------------------------------------------------------------------------
-- ACTIONBARS
------------------------------------------------------------------------------------------
-- options
C["ActionBars"]["ABAlpha"] = 0.7

C["ActionBars"]["ABFontSize"] = 10


-- proc anim
C["ActionBars"]["ProcAnim+"] = {
	["Options"] = {
		["No proc animation"] = "Hide",
		["Border"] = "Border",
		["Backdrop"] = "Backdrop",
		["Border"] = "Border",
		["Overlay"] = "Overlay",
		["Border & Backdrop"] = "BorderAndBackdrop",
		["Border & Overlay"] = "BorderAndOverlay",
	},
	["Value"] = "BorderAndBackdrop",
}
C["ActionBars"]["ProcAnimColor"] = {1, 1, 0} 


-- cooldown text
C["ActionBars"]["CooldownFlash"] = false
C["ActionBars"]["CoolDown"] = true
--C["ActionBars"]["CDFontSize"] = 12
C["ActionBars"]["CoolDownFontSize"] = 10
C["ActionBars"]["CoolDownColor"] = {1, 0, 0} 
C["ActionBars"]["CoolDownPosition"] = {
	["Options"] = {
		["topleft"] = "TOPLEFT",
		["top"] = "TOP",
		["topright"] = "TOPRIGHT",
		["left"] = "LEFT",
		["center"] = "CENTER",
		["right"] = "RIGHT",
		["bottomleft"] = "BOTTOMLEFT",
		["bottom"] = "BOTTOM",
		["bottomright"] = "BOTTOMRIGHT",
	},
	["Value"] = "CENTER",
}

C["ActionBars"]["CoolDownOffsetH"] = 0 
C["ActionBars"]["CoolDownOffsetV"] = 0 
C["ActionBars"]["CoolDownJustifyH"] = {
	["Options"] = {
		["left"] = "LEFT",
		["center"] = "CENTER",
		["right"] = "RIGHT",
	},
	["Value"] = "CENTER",
}

-- hotkey text
--C["ActionBars"]["HotKey"] = true
C["ActionBars"]["HotKeyFont"] = "MaxUI Outlined"
C["ActionBars"]["HotKeyFontSize"] = 10
C["ActionBars"]["HotKeyColor"] = {1, 1, 1} 
C["ActionBars"]["HotKeyPosition"] = {
	["Options"] = {
		["topleft"] = "TOPLEFT",
		["top"] = "TOP",
		["topright"] = "TOPRIGHT",
		["left"] = "LEFT",
		["center"] = "CENTER",
		["right"] = "RIGHT",
		["bottomleft"] = "BOTTOMLEFT",
		["bottom"] = "BOTTOM",
		["bottomright"] = "BOTTOMRIGHT",
	},
	["Value"] = "TOPLEFT",
}

C["ActionBars"]["HotKeyOffsetH"] = 2 
C["ActionBars"]["HotKeyOffsetV"] = -2 
C["ActionBars"]["HotKeyJustifyH"] = {
	["Options"] = {
		["left"] = "LEFT",
		["center"] = "CENTER",
		["right"] = "RIGHT",
	},
	["Value"] = "LEFT",
}

-- count text
C["ActionBars"]["Count"] = true
C["ActionBars"]["CountFont"] = "MaxUI Outlined"
C["ActionBars"]["CountFontSize"] = 10
C["ActionBars"]["CountColor"] = {1, 1, 0} 
C["ActionBars"]["CountPosition"] = {
	["Options"] = {
		["topleft"] = "TOPLEFT",
		["top"] = "TOP",
		["topright"] = "TOPRIGHT",
		["left"] = "LEFT",
		["center"] = "CENTER",
		["right"] = "RIGHT",
		["bottomleft"] = "BOTTOMLEFT",
		["bottom"] = "BOTTOM",
		["bottomright"] = "BOTTOMRIGHT",
	},
	["Value"] = "TOPRIGHT",
}

C["ActionBars"]["CountOffsetH"] = 0
C["ActionBars"]["CountOffsetV"] = -2
C["ActionBars"]["CountJustifyH"] = {
	["Options"] = {
		["left"] = "LEFT",
		["center"] = "CENTER",
		["right"] = "RIGHT",
	},
	["Value"] = "RIGHT",
}

-- macro text
--C["ActionBars"]["Macro"] = false
C["ActionBars"]["MacroFont"] = "MaxUI Outlined"
C["ActionBars"]["MacroFontSize"] = 10
C["ActionBars"]["MacroColor"] = {1, 1, 153/255} 
C["ActionBars"]["MacroPosition"] = {
	["Options"] = {
		["topleft"] = "TOPLEFT",
		["top"] = "TOP",
		["topright"] = "TOPRIGHT",
		["left"] = "LEFT",
		["center"] = "CENTER",
		["right"] = "RIGHT",
		["bottomleft"] = "BOTTOMLEFT",
		["bottom"] = "BOTTOM",
		["bottomright"] = "BOTTOMRIGHT",
	},
	["Value"] = "BOTTOM",
}

C["ActionBars"]["MacroOffsetH"] = 0 
C["ActionBars"]["MacroOffsetV"] = 2
C["ActionBars"]["MacroJustifyH"] = {
	["Options"] = {
		["left"] = "LEFT",
		["center"] = "CENTER",
		["right"] = "RIGHT",
	},
	["Value"] = "CENTER",
}


-- enable
C["ActionBars"]["ExtraBarEnable"] = true
C["ActionBars"]["TrinketBarEnable"] = false

-- layout
C["ActionBars"]["StancebarLayout"] = {
	["Options"] = {
		["Horizontal"] = "Horizontal",
		["Vertical"] = "Vertical",
	},
	["Value"] = "Horizontal",
}

C["ActionBars"]["TrinketBarLayout"] = {
	["Options"] = {
		["Horizontal"] = "Horizontal",
		["Vertical"] = "Vertical",
	},
	["Value"] = "Horizontal",
}

-- Actionbars Button Size settings 
C["ActionBars"]["ActionBar1ButtonSize"] = 26
C["ActionBars"]["ActionBar2ButtonSize"] = 26
C["ActionBars"]["ActionBar3ButtonSize"] = 26
C["ActionBars"]["ActionBar4ButtonSize"] = 26
C["ActionBars"]["ActionBar5ButtonSize"] = 26
C["ActionBars"]["ActionBar6ButtonSize"] = 26
C["ActionBars"]["ActionBar7ButtonSize"] = 26
C["ActionBars"]["ActionBar8ButtonSize"] = 26
C["ActionBars"]["PetBarButtonSize"] = 30
C["ActionBars"]["StanceBarButtonSize"] = 30
C["ActionBars"]["ExtraBarButtonSize"] = 48
C["ActionBars"]["TrinketBarButtonSize"] = 36

-- visibility settings
C["ActionBars"]["Actionbar1"] = {
	["Options"] = {
		["Show"] = "Show",
		["Hide"] = "Hide",	
		["Mouseover"] = "Mouseover",
	},
	["Value"] = "Show",
}

C["ActionBars"]["Actionbar2"] = {
	["Options"] = {
		["Show"] = "Show",
		["Hide"] = "Hide",	
		["Mouseover"] = "Mouseover",
	},
	["Value"] = "Show",
}

C["ActionBars"]["Actionbar3"] = {
	["Options"] = {
		["Show"] = "Show",
		["Hide"] = "Hide",	
		["Mouseover"] = "Mouseover",
	},
	["Value"] = "Show",
}

C["ActionBars"]["Actionbar4"] = {
	["Options"] = {
		["Show"] = "Show",
		["Hide"] = "Hide",	
		["Mouseover"] = "Mouseover",
	},
	["Value"] = "Show",
}

C["ActionBars"]["Actionbar5"] = {
	["Options"] = {
		["Show"] = "Show",
		["Hide"] = "Hide",	
		["Mouseover"] = "Mouseover",
	},
	["Value"] = "Show",
}

C["ActionBars"]["Actionbar6"] = {
	["Options"] = {
		["Show"] = "Show",
		["Hide"] = "Hide",	
		["Mouseover"] = "Mouseover",
	},
	["Value"] = "Show",
}

C["ActionBars"]["Actionbar7"] = {
	["Options"] = {
		["Show"] = "Show",
		["Hide"] = "Hide",	
		["Mouseover"] = "Mouseover",
	},
	["Value"] = "Show",
}

C["ActionBars"]["Actionbar8"] = {
	["Options"] = {
		["Show"] = "Show",
		["Hide"] = "Hide",	
		["Mouseover"] = "Mouseover",
	},
	["Value"] = "Show",
}

C["ActionBars"]["Petbar"] = {
	["Options"] = {
		["Show"] = "Show",
		["Hide"] = "Hide",	
		["Mouseover"] = "Mouseover",
	},
	["Value"] = "Show",
}

C["ActionBars"]["Stancebar"] = {
	["Options"] = {
		["Show"] = "Show",
		["Hide"] = "Hide",	
		["Mouseover"] = "Mouseover",
	},
	["Value"] = "Show",
}

C["ActionBars"]["Extrabar"] = {
	["Options"] = {
		["Show"] = "Show",
		["Hide"] = "Hide",	
		["Mouseover"] = "Mouseover",
	},
	["Value"] = "Show",
}

C["ActionBars"]["TrinketBar"] = {
	["Options"] = {
		["Show"] = "Show",
		["Hide"] = "Hide",	
		["Mouseover"] = "Mouseover",
	},
	["Value"] = "Show",
}

-- alpha settings bars
C["ActionBars"]["ActionBar1Alpha"] = 0.4
C["ActionBars"]["ActionBar2Alpha"] = 0.4
C["ActionBars"]["ActionBar3Alpha"] = 0.4
C["ActionBars"]["ActionBar4Alpha"] = 0.4
C["ActionBars"]["ActionBar5Alpha"] = 0.4
C["ActionBars"]["ActionBar6Alpha"] = 0.4
C["ActionBars"]["ActionBar7Alpha"] = 0.4
C["ActionBars"]["ActionBar8Alpha"] = 0.4
C["ActionBars"]["PetBarAlpha"] = 0.4
C["ActionBars"]["StanceBarAlpha"] = 0.4
C["ActionBars"]["ExtraBarAlpha"] = 1
C["ActionBars"]["TrinketBarAlpha"] = 1

-- actionbar combat state
C["ActionBars"]["ActionBar1CombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}
		
C["ActionBars"]["ActionBar2CombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
	}
	
C["ActionBars"]["ActionBar3CombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}
	
C["ActionBars"]["ActionBar4CombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}

C["ActionBars"]["ActionBar5CombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}
	
C["ActionBars"]["ActionBar6CombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}

C["ActionBars"]["ActionBar7CombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}

C["ActionBars"]["ActionBar8CombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}
	
C["ActionBars"]["ActionBarPetCombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}

C["ActionBars"]["ActionBarStanceCombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}


C["ActionBars"]["ActionBarExtraCombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}

C["ActionBars"]["TrinketBarCombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}

-- actionbar Art/Edges
C["ActionBars"]["ActionBar1Edges"] = {
	["Options"] = {
		["Top"] = "Top",
		["Bottom"] = "Bottom",	
		["Left"] = "Left",	
		["Right"] = "Right",	
		["Top & Bottom"] = "TopBottom",	
		["Left & Right"] = "LeftRight",	
		["All"] = "All",
		["None"] = "None",
	},
	["Value"] = "None",
}
		
C["ActionBars"]["ActionBar2Edges"] = {
	["Options"] = {
		["Top"] = "Top",
		["Bottom"] = "Bottom",	
		["Left"] = "Left",	
		["Right"] = "Right",	
		["Top & Bottom"] = "TopBottom",	
		["Left & Right"] = "LeftRight",	
		["All"] = "All",
		["None"] = "None",
	},
	["Value"] = "None",
}
	
C["ActionBars"]["ActionBar3Edges"] = {
	["Options"] = {
		["Top"] = "Top",
		["Bottom"] = "Bottom",	
		["Left"] = "Left",	
		["Right"] = "Right",	
		["Top & Bottom"] = "TopBottom",	
		["Left & Right"] = "LeftRight",	
		["All"] = "All",
		["None"] = "None",
	},
	["Value"] = "None",
}
	
C["ActionBars"]["ActionBar4Edges"] = {
	["Options"] = {
		["Top"] = "Top",
		["Bottom"] = "Bottom",	
		["Left"] = "Left",	
		["Right"] = "Right",	
		["Top & Bottom"] = "TopBottom",	
		["Left & Right"] = "LeftRight",	
		["All"] = "All",
		["None"] = "None",
	},
	["Value"] = "None",
}
	
C["ActionBars"]["ActionBar5Edges"] = {
	["Options"] = {
		["Top"] = "Top",
		["Bottom"] = "Bottom",	
		["Left"] = "Left",	
		["Right"] = "Right",	
		["Top & Bottom"] = "TopBottom",	
		["Left & Right"] = "LeftRight",	
		["All"] = "All",
		["None"] = "None",
	},
	["Value"] = "None",
}

C["ActionBars"]["ActionBar6Edges"] = {
	["Options"] = {
		["Top"] = "Top",
		["Bottom"] = "Bottom",	
		["Left"] = "Left",	
		["Right"] = "Right",	
		["Top & Bottom"] = "TopBottom",	
		["Left & Right"] = "LeftRight",	
		["All"] = "All",
		["None"] = "None",
	},
	["Value"] = "None",
}

C["ActionBars"]["ActionBar7Edges"] = {
	["Options"] = {
		["Top"] = "Top",
		["Bottom"] = "Bottom",	
		["Left"] = "Left",	
		["Right"] = "Right",	
		["Top & Bottom"] = "TopBottom",	
		["Left & Right"] = "LeftRight",	
		["All"] = "All",
		["None"] = "None",
	},
	["Value"] = "None",
}

C["ActionBars"]["ActionBar8Edges"] = {
	["Options"] = {
		["Top"] = "Top",
		["Bottom"] = "Bottom",	
		["Left"] = "Left",	
		["Right"] = "Right",	
		["Top & Bottom"] = "TopBottom",	
		["Left & Right"] = "LeftRight",	
		["All"] = "All",
		["None"] = "None",
	},
	["Value"] = "None",
}
	
C["ActionBars"]["ActionBarPetEdges"] = {
	["Options"] = {
		["Top"] = "Top",
		["Bottom"] = "Bottom",	
		["Left"] = "Left",	
		["Right"] = "Right",	
		["Top & Bottom"] = "TopBottom",	
		["Left & Right"] = "LeftRight",	
		["All"] = "All",
		["None"] = "None",
	},
	["Value"] = "None",
}

C["ActionBars"]["ActionBarStanceEdges"] = {
	["Options"] = {
		["Top"] = "Top",
		["Bottom"] = "Bottom",	
		["Left"] = "Left",	
		["Right"] = "Right",	
		["Top & Bottom"] = "TopBottom",	
		["Left & Right"] = "LeftRight",	
		["All"] = "All",
		["None"] = "None",
	},
	["Value"] = "None",
}

C["ActionBars"]["ActionBarExtraEdges"] = {
	["Options"] = {
		["Top"] = "Top",
		["Bottom"] = "Bottom",	
		["Left"] = "Left",	
		["Right"] = "Right",	
		["Top & Bottom"] = "TopBottom",	
		["Left & Right"] = "LeftRight",	
		["All"] = "All",
		["None"] = "None",
	},
	["Value"] = "None",
}

C["ActionBars"]["TrinketBarEdges"] = {
	["Options"] = {
		["Top"] = "Top",
		["Bottom"] = "Bottom",	
		["Left"] = "Left",	
		["Right"] = "Right",	
		["Top & Bottom"] = "TopBottom",	
		["Left & Right"] = "LeftRight",	
		["All"] = "All",
		["None"] = "None",
	},
	["Value"] = "None",
}

-- backdrop for each bar
C["ActionBars"]["ActionBar1Backdrop"] = true
C["ActionBars"]["ActionBar2Backdrop"] = true
C["ActionBars"]["ActionBar3Backdrop"] = true
C["ActionBars"]["ActionBar4Backdrop"] = true
C["ActionBars"]["ActionBar5Backdrop"] = true
C["ActionBars"]["ActionBar6Backdrop"] = true
C["ActionBars"]["ActionBar7Backdrop"] = true
C["ActionBars"]["ActionBar8Backdrop"] = true
C["ActionBars"]["PetBarBackdrop"] = true
C["ActionBars"]["StanceBarBackdrop"] = true
C["ActionBars"]["ExtraBarBackdrop"] = true
C["ActionBars"]["TrinketBarBackdrop"] = true

------------------------------------------------------------------------------------------
-- AURAS
------------------------------------------------------------------------------------------
C["Auras"]["AurasFontSize"] = 12
C["Auras"]["AurasBarSize"] = 8
C["Auras"]["AurasSize"] = 100

-- duration
C["Auras"]["Duration"] = true
C["Auras"]["DurationFont"] = "MaxUI Outlined"
C["Auras"]["DurationFontSize"] = 12
--C["Auras"]["DurationColor"] = {1, 1, 1} 
C["Auras"]["DurationPosition"] = {
	["Options"] = {
		["topleft"] = "TOPLEFT",
		["top"] = "TOP",
		["topright"] = "TOPRIGHT",
		["left"] = "LEFT",
		["center"] = "CENTER",
		["right"] = "RIGHT",
		["bottomleft"] = "BOTTOMLEFT",
		["bottom"] = "BOTTOM",
		["bottomright"] = "BOTTOMRIGHT",
	},
	["Value"] = "BOTTOM",
}

C["Auras"]["DurationOffsetH"] = 0 
C["Auras"]["DurationOffsetV"] = -10 
C["Auras"]["DurationJustifyH"] = {
	["Options"] = {
		["left"] = "LEFT",
		["center"] = "CENTER",
		["right"] = "RIGHT",
	},
	["Value"] = "CENTER",
}

-- count
C["Auras"]["Count"] = true
C["Auras"]["CountFont"] = "MaxUI Outlined"
C["Auras"]["CountFontSize"] = 12
C["Auras"]["CountColor"] = {1, 1, 0} 
C["Auras"]["CountPosition"] = {
	["Options"] = {
		["topleft"] = "TOPLEFT",
		["top"] = "TOP",
		["topright"] = "TOPRIGHT",
		["left"] = "LEFT",
		["center"] = "CENTER",
		["right"] = "RIGHT",
		["bottomleft"] = "BOTTOMLEFT",
		["bottom"] = "BOTTOM",
		["bottomright"] = "BOTTOMRIGHT",
	},
	["Value"] = "TOPLEFT",
}

C["Auras"]["CountOffsetH"] = 0 
C["Auras"]["CountOffsetV"] = -2 
C["Auras"]["CountJustifyH"] = {
	["Options"] = {
		["left"] = "LEFT",
		["center"] = "CENTER",
		["right"] = "RIGHT",
	},
	["Value"] = "LEFT",
}

C["Auras"]["Position"] = {
	["Options"] = {
		["Top left"] = "Left",
		["Center"] = "Center",	
		["Top right"] = "Right",
	},
	["Value"] = "Center",
}

C["Auras"]["AurasBuffCombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}
	
C["Auras"]["AurasDebuffCombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}

------------------------------------------------------------------------------------------
-- BAGS
------------------------------------------------------------------------------------------
-- fonts
C["Bags"]["Font"] = "MaxUI Outlined"
C["Bags"]["FontSize"] = 12 

C["Bags"]["PositionReagentBag"] = {
	["Options"] = {
		["Top"] = "TOP",
		["Bottom"] = "BOTTOM",
		["Topleft"] = "TOPLEFT",
	},
	["Value"] = "BOTTOM",
}

------------------------------------------------------------------------------------------	
-- CHARACTER INFO	
------------------------------------------------------------------------------------------
C["CharacterInfo"] = {
	["Itemlevel"] = true
}

------------------------------------------------------------------------------------------
-- CHAT
------------------------------------------------------------------------------------------
C["Chat"]["TabFontSize"] = 12

-- headers
C["Chat"]["Headers"] = false
C["Chat"]["TabDividers"] = false

-- Position
C["Chat"]["Position"] = {
	["Options"] = {
		["Top Corners"] = "Top",
		["Bottom Corners"] = "Bottom",
	},
	["Value"] = "Bottom",
}

C["Chat"]["UnlinkEditBox"] = false

-- Background
C["Chat"]["BackgroundOptions"] = {
	["Options"] = {
		["Logo"] = "Logo",
		["Class"] = "Class",
		["Texture"] = "Texture",	
		["Basic"] = "Blank",
		["Character"] = "Character",
		["None"] = "None",
	},
	["Value"] = "Class",
}
C["Chat"]["ShowRightChat"] = true

-- Texture
C["Chat"]["Chattexture"] = "sRainbow2"
C["Chat"]["ChattextureAlpha"] = 0.6
C["Chat"]["ChattextureColor"] = {0.11, 0.11, 0.11}

-- Combat state
C["Chat"]["CompleteChatBox"] = false

C["Chat"]["LeftChatBGCombatState"] = {
	["Options"] = {
		--["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}

C["Chat"]["RightChatBGCombatState"] = {
	["Options"] = {
		--["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}

------------------------------------------------------------------------------------------
-- DATATEXTS
------------------------------------------------------------------------------------------
C["DataTexts"]["FontSize"] = 12

-- maxUI settings
C["DataTexts"]["Bottomline"] = true	
C["DataTexts"]["AmountBottomDataTexts"] = 9

C["DataTexts"]["Topline"] = true
C["DataTexts"]["AmountTopDataTexts"] = 9

C["DataTexts"]["DataCenter"] = true
C["DataTexts"]["AmountDataCenterDataTexts"] = 10
C["DataTexts"]["DataCenterAlpha"] = 0.7

C["DataTexts"]["TooltipAnchor"] = {
	["Options"] = {
		["Right"] = "ANCHOR_RIGHT",
		["Left"] = "ANCHOR_LEFT",	
		["Top Right"] = "ANCHOR_TOPRIGHT",
		["Top Left"] = "ANCHOR_TOPLEFT",	
		["Bottom Right"] = "ANCHOR_BOTTOMRIGHT",	
		["Bottom Left"] = "ANCHOR_BOTTOMLEFT",	
		["Mouse Cursor"] = "ANCHOR_CURSOR",	
	},
	["Value"] = "ANCHOR_RIGHT",
}
C["DataTexts"]["DataCenterClassLogo"] = true

C["DataTexts"]["Icons"] = false

-- Combat state
C["DataTexts"]["ToplineCombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}
	
C["DataTexts"]["BottomlineCombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}

C["DataTexts"]["DataCenterCombatState"] = {
	["Options"] = {
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}

------------------------------------------------------------------------------------------
-- LOOT
------------------------------------------------------------------------------------------
C["Loot"]["FontSize"] = 12

C["Loot"]["GroupLootHeaderHeight"] = 10
C["Loot"]["GroupLootSpacing"] = 30


------------------------------------------------------------------------------------------	
-- MINIMAP	
------------------------------------------------------------------------------------------
C["Location"] = {
	-- locator
	["EnableLocator"] = true,
	["AlwaysDark"] = false,
	["LocatorWidth"] = 350,
	["LocatorCombatState"] = {
		["Options"] = {
			["Hide in Combat"] = "Hide",	
			["Nothing"] = "Nothing",
		},
		["Value"] = "Nothing",
	},

	-- minimap
	["MinimapEnable"] = true,
	["MinimapRectangular"] = false,
	["Compass"] = false,
	["Position"] = {
		["Options"] = {
			["Top Left"] = "Topleft",
			["Top Center"] = "Center",
			["Top Right"] = "Topright",
			["Bottom Left"] = "BottomLeft",
			["Bottom Right"] = "BottomRight",
			["Embed Chat Right"] = "EmbedChatRight",
			["Bottom Center"] = "Bottom",
		},	
		["Value"] = "Topright",
	},
	
	["MinimapCombatState"] = {
		["Options"] = {
			["Show in Combat"] = "Show",
			["Hide in Combat"] = "Hide",	
			["Nothing"] = "Nothing",
		},
		["Value"] = "Nothing",
	},
	
	-- world map
	["FadeWorldMapWhileMoving"] = false,
	["WorldmapCombatState"] = {
		["Options"] = {
			["Hide in Combat"] = "Hide",	
			["Nothing"] = "Nothing",
		},
		["Value"] = "Nothing",
	},
}

------------------------------------------------------------------------------------------
-- MISC
------------------------------------------------------------------------------------------
--C["Misc"]["MicroStyle"]["Options"]["|cffFFFF99Micro Game Menu|r"] = "MaxUI Micro Menu"
--C["Misc"]["MicroStyle"]["Value"] = "MaxUI Micro Menu"

C["Misc"]["ErrorSpeechEnable"] = true
C["Misc"]["ErrorSpeechCombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}

C["Misc"]["ObjectiveFontSize"] = 12
C["Misc"]["PercentageTag"] = true

-- experience
C["Misc"]["XPBarEnable"] = true
C["Misc"]["XPBarDTEnable"] = true
C["Misc"]["XPBarHeight"] = 12
C["Misc"]["XPBarWidth"] = 200
C["Misc"]["XPBarTexture"] = "Tukui"
C["Misc"]["XPBarBackdrop"] = true
C["Misc"]["XPBarAlpha"] = 0.7
C["Misc"]["XPBarTextPlacement"] = {
	["Options"] = {
		["Inside"] = "Inside",
		["Outside"] = "Outside",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Inside",
}
C["Misc"]["XPBarCombatState"] = {
	["Options"] = {
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}

-- reputation
C["Misc"]["REPBarEnable"] = true
C["Misc"]["REPBarDTEnable"] = true
C["Misc"]["REPBarHeight"] = 12
C["Misc"]["REPBarWidth"] = 200
C["Misc"]["REPBarTexture"] = "Tukui"
C["Misc"]["REPBarBackdrop"] = true
C["Misc"]["REPBarAlpha"] = 0.7
C["Misc"]["REPBarTextPlacement"] = {
	["Options"] = {
		["Inside"] = "Inside",
		["Outside"] = "Outside",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Inside",
}
C["Misc"]["REPBarCombatState"] = {
	["Options"] = {
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}

-- honor
C["Misc"]["HONORBarEnable"] = true
C["Misc"]["HONORBarDTEnable"] = true
C["Misc"]["HONORBarHeight"] = 12
C["Misc"]["HONORBarWidth"] = 200
C["Misc"]["HONORBarTexture"] = "Tukui"
C["Misc"]["HONORBarBackdrop"] = true
C["Misc"]["HONORBarAlpha"] = 0.7
C["Misc"]["HONORBarTextPlacement"] = {
	["Options"] = {
		["Inside"] = "Inside",
		["Outside"] = "Outside",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Inside",
}
C["Misc"]["HONORBarCombatState"] = {
	["Options"] = {
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}

-- azerite
C["Misc"]["AZERITEBarEnable"] = false
C["Misc"]["AZERITEBarDTEnable"] = true
C["Misc"]["AZERITEBarHeight"] = 12
C["Misc"]["AZERITEBarWidth"] = 200
C["Misc"]["AZERITEBarTexture"] = "Tukui"
C["Misc"]["AZERITEBarBackdrop"] = true
C["Misc"]["AZERITEBarAlpha"] = 0.7
C["Misc"]["AZERITEBarTextPlacement"] = {
	["Options"] = {
		["Inside"] = "Inside",
		["Outside"] = "Outside",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Inside",
}
C["Misc"]["AZERITEBarCombatState"] = {
	["Options"] = {
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}

-- anima
C["Misc"]["ANIMABarEnable"] = true
C["Misc"]["ANIMABarDTEnable"] = true
C["Misc"]["ANIMABarHeight"] = 12
C["Misc"]["ANIMABarWidth"] = 200
C["Misc"]["ANIMABarTexture"] = "Tukui"
C["Misc"]["ANIMABarBackdrop"] = true
C["Misc"]["ANIMABarAlpha"] = 0.7
C["Misc"]["ANIMABarTextPlacement"] = {
	["Options"] = {
		["Inside"] = "Inside",
		["Outside"] = "Outside",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Inside",
}
C["Misc"]["ANIMABarCombatState"] = {
	["Options"] = {
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}

-- threatbar
C["Misc"]["ThreatBarHeight"] = 20
C["Misc"]["ThreatBarWidth"] = 300
C["Misc"]["ThreatBarTexture"] = "Tukui"

-- Alternative power
C["Misc"]["AlternativePowerBarEnable"] = true
C["Misc"]["AlternativePowerBarHeight"] = 20
C["Misc"]["AlternativePowerBarWidth"] = 350
C["Misc"]["AlternativePowerBarTexture"] = "Tukui"

-- other
C["Misc"]["OtherBarEnable"] = true
C["Misc"]["BarHeight"] = 20
C["Misc"]["BarWidth"] = 300
C["Misc"]["BarTexture"] = "Tukui"


------------------------------------------------------------------------------------------
-- NAMEPLATES
------------------------------------------------------------------------------------------
-- settings
C["NamePlates"]["MaxDistance"] = 60
C["NamePlates"]["CombatOnly"] = true

-- style
C["NamePlates"]["Style"] = {
	["Options"] = {
		["|cffFFFF99MaxUI|r"] = "MaxUI",
		["Tukui"] = "Tukui",
	},
	["Value"] = "MaxUI",
}

C["NamePlates"]["ElementAnchored"] = {
	["Options"] = {
		["|cffFFFF99Left|r"] = "LEFT",
		["|cffFFFF99Centered|r"] = "CENTER",
		["|cffFFFF99Right|r"] = "RIGHT",
	},
	["Value"] = "CENTER",
}

-- health
C["NamePlates"]["HealthFontSize"] = 10
C["NamePlates"]["HealthBars"] = true
C["NamePlates"]["HealthPrediction"] = false
C["NamePlates"]["HealthTag"] = {
	["Options"] = {
		["None"] = "",
		["Current"] = "[MaxUI:HealthColor][MaxUI:CurHP]",
		["Percent"] = "[MaxUI:HealthColor][perhp]%",
		["Current - Percent"] = "[MaxUI:HealthColor][MaxUI:CurHP] - [perhp]%",
		["Missing"] = "[MaxUI:HealthColor]-[MaxUI:MisHP]|r",
		["Current | Max"] = "[MaxUI:HealthColor][MaxUI:CurHP] | [MaxUI:MaxHP]",
	},
	["Value"] = "[MaxUI:HealthColor][MaxUI:CurHP]",
}

-- power	
C["NamePlates"]["PowerTag"] = {
	["Options"] = {
		["None"] = "",
		["Current"] = "[MaxUI:PowerColor][MaxUI:CurPP]",
		["Percent"] = "[MaxUI:PowerColor][perpp]%",
		["Current - Percent"] = "[MaxUI:PowerColor][MaxUI:CurPP] - [perpp]%",
		["Missing"] = "[MaxUI:PowerColor]-[MaxUI:MisPP]|r",
		["Current | Max"] = "[MaxUI:PowerColor][MaxUI:CurPP] | [MaxUI:MaxPP]",
	},
	["Value"] = "[MaxUI:PowerColor][MaxUI:CurPP]",
}

-- name
C["NamePlates"]["FontSize"] = 12
C["NamePlates"]["NameTag"] = {
	["Options"] = {
		["None"] = "",
		
		["Lvl Name:Full 100%"] = "[Tukui:DiffColor][level]|r[Tukui:Classification] [Tukui:GetNameColor][name]|r [perhp]%",
		["Lvl Name:Abbrev 100%"] = "[Tukui:DiffColor][level]|r[Tukui:Classification] [Tukui:GetNameColor][name:abbrev]|r [perhp]%",
		["Lvl Name:Long 100%"] = "[Tukui:DiffColor][level]|r[Tukui:Classification] [Tukui:GetNameColor][Tukui:NameLong]|r [perhp]%",
		["Lvl Name:Medium 100%"] = "[Tukui:DiffColor][level]|r[Tukui:Classification] [Tukui:GetNameColor][Tukui:NameMedium]|r [perhp]%",
		["Lvl Name:Short 100%"] = "[Tukui:DiffColor][level]|r[Tukui:Classification] [Tukui:GetNameColor][Tukui:NameShort]|r [perhp]%",

		["Lvl Name:Full"] = "[Tukui:DiffColor][level]|r[Tukui:Classification] [Tukui:GetNameColor][name]|r",
		["Lvl Name:Abbrev"] = "[Tukui:DiffColor][level]|r[Tukui:Classification] [Tukui:GetNameColor][name:abbrev]|r",
		["Lvl Name:Long"] = "[Tukui:DiffColor][level]|r[Tukui:Classification] [Tukui:GetNameColor][Tukui:NameLong]|r",
		["Lvl Name:Medium"] = "[Tukui:DiffColor][level]|r[Tukui:Classification] [Tukui:GetNameColor][Tukui:NameMedium]|r",
		["Lvl Name:Short"] = "[Tukui:DiffColor][level]|r Tukui:Classification] [Tukui:GetNameColor][Tukui:NameShort]|r",

		["Name:Full 100%"] = "[Tukui:GetNameColor][name]|r [perhp]%",
		["Name:Abbreviated 100%"] = "[Tukui:GetNameColor][name:abbrev]|r [perhp]%",
		["Name:Long 100%"] = "[Tukui:GetNameColor][Tukui:NameLong]|r [perhp]%",
		["Name:Medium 100%"] = "[Tukui:GetNameColor][Tukui:NameMedium]|r [perhp]%",
		["Name:Short 100%"] = "[Tukui:GetNameColor][Tukui:NameShort]|r [perhp]%",

		["Name:Full"] = "[Tukui:GetNameColor][name]|r",
		["Name:Abbreviated"] = "[Tukui:GetNameColor][name:abbrev]|r",
		["Name:Long"] = "[Tukui:GetNameColor][Tukui:NameLong]|r",
		["Name:Medium"] = "[Tukui:GetNameColor][Tukui:NameMedium]|r",
		["Name:Short"] = "[Tukui:GetNameColor][Tukui:NameShort]|r",
	},
	["Value"] = "[Tukui:DiffColor][level]|r[Tukui:Classification] [Tukui:GetNameColor][name:abbrev]|r [perhp]%",
}

-- castbar
C["NamePlates"]["CastTexture"] = "Tukui"
C["NamePlates"]["CastbarFullNameplateOverlap"] = false
C["NamePlates"]["CastHeight"] = 4

-- buffs
C["NamePlates"]["StealableBuffs"] = true
C["NamePlates"]["NumberStealableBuffs"] = 3
C["NamePlates"]["StealableBuffsSize"] = 20

-- debuffs
C["NamePlates"]["Debuffs"] = true
C["NamePlates"]["DebuffSize"] = 20
C["NamePlates"]["DebuffAnchorSpace"] = 4
C["NamePlates"]["DebuffsOnTop"] = false

-- quests
C["NamePlates"]["QuestIconSize"] = 40

-- threat
C["NamePlates"]["ThreatIndicator"] = true

-- marking
C["NamePlates"]["MarkerSize"] = 40
C["NamePlates"]["TargetIndicator"] = true
C["NamePlates"]["TargetHighlight"] = true

-- Scale Targeted Nameplate
C["NamePlates"]["CurrentTargetGrow"] = false
C["NamePlates"]["CurrentTargetScale"] = 1.2
C["NamePlates"]["NonCurrentTargetScale"] = 1

-- transparency Targeted Nameplate
C["NamePlates"]["SetAlpha"] = false
C["NamePlates"]["CurrentTargetAlpha"] = 1
C["NamePlates"]["NonTargetedAlpha"] = 0.5

-- Nameplate Spacing
C["NamePlates"]["Stacking"] = true
C["NamePlates"]["HorizontalSpacing"] = 1
C["NamePlates"]["VerticalSpacing"] = 1

C["NamePlates"]["RoleIndicator"] = false
C["NamePlates"]["PvPIndicator"] = false
C["NamePlates"]["Badge"] = false
C["NamePlates"]["PvPClassificationIndicator"] = false

------------------------------------------------------------------------------------------
-- PARTY
------------------------------------------------------------------------------------------
-- settings
C["Party"]["VerticalSpacing"] = 70
C["Party"]["PetSizeScale"] = 70
C["Party"]["ShowSolo"] = true
C["Party"]["PercentageTags"] = true

-- style
C["Party"]["Style"] = {
	["Options"] = {
		["|cffFFFF99MaxUI|r"] = "MaxUI",
		["Tukui"] = "Tukui",
	},
	["Value"] = "MaxUI",
}

C["Party"]["Orientation"] = {
	["Options"] = {
		["|cffFFFF99Vertical|r"] = "Vertical",
		["|cffFFFF99Horizontal|r"] = "Horizontal",
	},
	["Value"] = "Horizontal",
}

C["Party"]["ElementAnchored"] = {
	["Options"] = {
		["|cffFFFF99Left|r"] = "LEFT",
		["|cffFFFF99Centered|r"] = "CENTER",
		["|cffFFFF99Right|r"] = "RIGHT",
	},
	["Value"] = "LEFT",
}

-- health
C["Party"]["HealthHeight"] = 32
C["Party"]["HealthWidth"] = 200
C["Party"]["HealthFontSize"] = 12
C["Party"]["HealthTag"] = {
	["Options"] = {
		["None"] = "",
		["Current"] = "|cff549654[MaxUI:CurHP]|r",
		["Percent"] = "|cff549654[perhp]%|r",
		["Current - Percent"] = "|cff549654[MaxUI:CurHP] - [perhp]%|r",
		["Missing"] = "|cff549654-[MaxUI:MisHP]|r",
		["Current | Max"] = "|cff549654[MaxUI:CurHP] | [MaxUI:MaxHP]|r",
	},
	["Value"] = "|cff549654[MaxUI:CurHP] | [MaxUI:MaxHP]|r",
}
	
-- power
C["Party"]["PowerHeight"] = 12
C["Party"]["PowerWidth"] = 130
C["Party"]["PowerFont"] = "MaxUI Outlined"
C["Party"]["PowerFontSize"] = 10
C["Party"]["PowerTag"] = {
	["Options"] = {
		["None"] = "",
		["Current"] = "[MaxUI:PowerColor][MaxUI:CurPP]",
		["Percent"] = "[MaxUI:PowerColor][perpp]%",
		["Current - Percent"] = "[MaxUI:PowerColor][MaxUI:CurPP] - [perpp]%",
		["Missing"] = "[MaxUI:PowerColor]-[MaxUI:MisPP]",
		["Current | Max"] = "[MaxUI:PowerColor][MaxUI:CurPP] | [MaxUI:MaxPP]",
	},
	["Value"] = "[MaxUI:PowerColor][MaxUI:CurPP] | [MaxUI:MaxPP]",
}

-- name
C["Party"]["NameFontSize"] = 14
	
-- castbar
C["Party"]["CastBar"] = false
C["Party"]["CastBarIcon"] = true
C["Party"]["CastBarText"] = true
C["Party"]["CastBarTime"] = true
C["Party"]["CastFont"] = "MaxUI Outlined"
C["Party"]["CastFontSize"] = 10
C["Party"]["CastTexture"] = "Tukui"
C["Party"]["CastBarUnlink"] = false
C["Party"]["CastHeight"] = 10
C["Party"]["CastWidth"] = 160
C["Party"]["CastTexture"] = "Tukui"

-- marking/role
C["Party"]["RaidIconSize"] = 20
C["Party"]["RoleIcon"] = true

-- buufs/debuffs
C["Party"]["ShowBuffs"] = true
C["Party"]["ShowDebuffs"] = true
C["Party"]["NumberOfDebuffsShown"] = 3
C["Party"]["NumberOfBuffsShown"] = 8

-- portrait
C["Party"]["PortraitOverlayAlpha"] = 0.5
C["Party"]["PortraitStyle"] = {
	["Options"] = {
		["None"] = "None",
		["Outside"] = "Side",
		["Overlay"] = "Overlay",
	},	
	["Value"] = "None",
}

------------------------------------------------------------------------------------------
-- PET BATTLE
------------------------------------------------------------------------------------------
C["PetBattle"] = {
	["Style"] = {
		["Options"] = {
			["Basic"] = "Basic",
			["MaxUI"] = "MaxUI",	
		},
		["Value"] = "MaxUI",
	},
}

------------------------------------------------------------------------------------------
-- QUESTS	
------------------------------------------------------------------------------------------
C["Quests"] = {
	-- objective tracker
	["TrackerFixed"] = true,
	["TrackerCollapsedOnLogin"] = false,
	["QuestProgressTexture"] = "Tukui",
	["QuestHeaderLines"] = true,

	-- tracking
	["FilterTracking"] = {
		["Options"] = {
			["All quests"] = "All",	
			["Only current zone quests"] = "Zone",
		},
		["Value"] = "All",
	},

	-- combat state
	["QuestTrackerCombatState"] = {
		["Options"] = {
			["Hide in Combat"] = "Hide",	
			["Nothing"] = "Nothing",
		},
		["Value"] = "Nothing",
	},
}

------------------------------------------------------------------------------------------
-- RAID
------------------------------------------------------------------------------------------
-- Settings
C["Raid"]["ShowSolo"] = true
C["Raid"]["GroupNumber"] = true
C["Raid"]["BGAlpha"] = 0.2

C["Raid"]["Style"] = {
	["Options"] = {
		["|cffFFFF99MaxUI|r"] = "MaxUI",
		["|cffFFFF99Alternative|r"] = "Alternative",
		["Tukui"] = "Tukui",
	},
	["Value"] = "MaxUI",
}

C["Raid"]["ElementAnchored"] = {
	["Options"] = {
		["|cffFFFF99Left|r"] = "LEFT",
		["|cffFFFF99Centered|r"] = "CENTER",
		["|cffFFFF99Right|r"] = "RIGHT",
	},
	["Value"] = "CENTER",
}

C["Raid"]["Orientation"] = {
	["Options"] = {
		["|cffFFFF99Vertical|r"] = "Vertical",
		["|cffFFFF99Horizontal|r"] = "Horizontal",
	},
	["Value"] = "Horizontal",
}

-- health
C["Raid"]["HealthFontSize"] = 10
C["Raid"]["HealthPercentageFont"] = "MaxUI Outlined"
C["Raid"]["ShowMissingHealth"] = false
C["Raid"]["ShowPercentageHealth"] = false

-- power
C["Raid"]["PowerVertical"] = false

-- name
C["Raid"]["FontSize"] = 10
C["Raid"]["PercentageFontSize"] = 10
C["Raid"]["NameColor"] = {
	["Options"] = {
		["Class"] = "Class",
		["Custom"] = "Custom",
	},
	["Value"] = "Class",
}
C["Raid"]["CustomNameColor"] = {1, 1, 0}

-- buffs	
C["Raid"]["DeBuffsOnRight"] = false
C["Raid"]["BuffsPosition"] = {
	["Options"] = {
		["Inside Top"] = "InsideTop",
		["Inside Bottom"] = "InsideBottom",
		["Top"] = "Top",
		["Bottom"] = "Bottom",
	},
	["Value"] = "Inside",
}

-- Sizing and Spacing
C["Raid"]["HorSpacing"] = 4
C["Raid"]["VerSpacing"] = 10

-- Growth Direction
C["Raid"]["GrowDirection"] = {
	["Options"] = {
		["Horizontal Up"] = "HorizontalUp",
		["Horizontal Down"] = "HorizontalDown",
		["Vertical Up"] = "VerticalUp",
		["Vertical Down"] = "VerticalDown",
	},
	["Value"] = "VerticalDown",	
}

-- Marking and Role
C["Raid"]["MarkerSize"] = 16
C["Raid"]["RoleIconSize"] = 16
--C["Raid"]["AssignmentIcon"] = true

------------------------------------------------------------------------------------------
-- Scrolling Combat Text
------------------------------------------------------------------------------------------
C["Scrolling Text"] = {
	-- Font
	["Scale"] = 0.5,
	["YOffset"] = 0.03,
	["Direction"] = false,
	
	-- Healing
	["Healing"] = {
		["Options"] = {
			["Show"] = "Show",
			["Hide"] = "Hide",
		},
		["Value"] = "Show",
	},
	
	["Shields"] = {
		["Options"] = {
			["Show"] = "Show",
			["Hide"] = "Hide",
		},
		["Value"] = "Show",
	},

	-- Damage
	["Damage"] = {
		["Options"] = {
			["Show"] = "Show",
			["Hide"] = "Hide",
		},
		["Value"] = "Show",
	},
	
	["Pet"] = {
		["Options"] = {
			["Show"] = "Show",
			["Hide"] = "Hide",
		},
		["Value"] = "Show",
	},
	
	["FloatMode"] = {
		["Options"] = {
			["Up"] = "Up",
			["Down"] = "Down",
		},
		["Value"] = "Up",
	},
}

------------------------------------------------------------------------------------------
-- MaxUI Skins
------------------------------------------------------------------------------------------
C["Skins"] = {
	
-- Skin options
	["MaxUIPositioningBlizzardFrames"] = false,

	--["MaxUIAddOnSkins"] = false,
	--["MaxUISkins"] = false,
	["MaxUISkinsBlizzard"] = true,
	["MaxUISkinsAddons"] = true,
	
	-- system
	["GameMenu"] = true,
	["CustomerSupport"] = false,
	["WhatsNew"] = true,
	["Report"] = false,
	["SettingsPanel"] = false,
	["Popups"] = true,
	["Keybinds"] = false,
	["Macros"] = false,
	["AddOns"] = true,
	["ColorPicker"] = true,

	-- character
	["Character"] = false,
	["Talents"] = false,
	["Spellbook"] = false,
	["DressingRoom"] = false,
	
	-- social
	["Social"] = false,
	["LFG"] = false,
	["Guild"] = false,
	["EventCalendar"] = false,
	["Communities"] = false,

	-- maps and quest
	["WorldMapQuestlog"] = false,
	["QuestGossip"] = false,
	["Flightmap"] = false,
	["DungeonJournal"] = false,
	["MissionsRenown"] = false,
	
	-- merchant and vendors
	["Merchant"] = false,
	["Tradeskill"] = false,
	["Trainer"] = false,
	["AuctionHouse"] = false,
	["Inventory"] = true,
	["Loot"] = true,
	
	-- support
	
	["Voice"] = false,
	["StopWatch"] = false,

	-- uncategorised
	["Mail"] = true,
	["Other"] = false,
	["Achievements"] = false,
	["Collections"] = false,
	
-- filters
	["MinimapFilter"] = false,
	["MinimapElementsFilter"] = false,
	["ChatFilter"] = false,
	["DataCenterFilter"] = false,
	["DataTextFilter"] = false,
	["DataBarFilter"] = false,
	--["InventoryFilter"] = false,
	--["InventoryBGFilter"] = false,
	["TooltipFilter"] = false,
	["TooltipHealthFilter"] = false,
	["ObjectiveTrackerFilter"] = false,
	["BattlegroundTrackerFilter"] = false,
	
	["HeaderFilter"] = false,
	["ButtonFilter"] = false,
	["BackdropFilter"] = false,
	
	["ActionBarButtonFilter"] = false,
	["AurasFilter"] = false,
	
	["UnitFramesFilter"] = false,
	["NamePlatesFilter"] = false,
	["GroupRaidFilter"] = false,

	["SkinTexture"] = "Rounded",
	["SkinVerticalTexture"] = "Rounded Vert Left",
	["FilterAlpha"] = 0.8,
	["CustomFilterColor"] = {1, 1, 1},
	
	-- screen filter
	["AFKFilter"] = false,
	["UIParentFilter"] = false,
	["ScreenFilterAlpha"] = 0.8,
	["ScreenFilterColor"] = {0, 0, 0},
	["FilterSize"] = 48,
	
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
}

------------------------------------------------------------------------------------------
-- TOOLS
------------------------------------------------------------------------------------------
C["Tools"] = {
	-- options
	--["ToolButtonSize"] = 24,
	--["Font"] = "MaxUI Outlined",
	--["FontSize"] = 12,
	--["ButtonStyle"] = {
		--["Options"] = {
			--["Blizzard"] = "Blizzard",
			--["MaxUI"] = "MaxUI",
		--},	
		--["Value"] = "MaxUI",
	--},

	-- tools
	["UIConfig"] = true,
	["ChatShortcuts"] = true,
	["ChatShortcutsPosition"] = {
		["Options"] = {
			["Topleft"] = "Topleft",
			["Topright"] = "Topright",
		},	
		["Value"] = "Topright",
	},

	["Meters"] = true,
	["RaidBuffTracking"] = true,
	["RaidTools"] = true,
	["GameMenu"] = true,
	
	["InterruptAnnounceSolo"] = false,
	["InterruptAnnounce"] = {
		["Options"] = {
			["say"] = "say",
			["|cffFF0000yell|r"] = "yell",	
			["|cff69CCF0party|r"] = "party",
			["|cffFF7D0Araid|r"] = "raid",
			["none"] = "none",
		},
		["Value"] = "none",
	},
}

------------------------------------------------------------------------------------------
-- TOOLTIPS
------------------------------------------------------------------------------------------
C["Tooltips"]["HealthFontSize"] = 12
C["Tooltips"]["TooltipAlpha"] = 0.7

--C["Tooltips"]["MythicPlusInfo"] = true
--C["Tooltips"]["TooltipSpellInfo"] = true

------------------------------------------------------------------------------------------
-- UNITFRAMES
------------------------------------------------------------------------------------------
-- Settings
C["UnitFrames"]["HealCommAlpha"] = 0.6 

--C["UnitFrames"]["AurasFont"] = "MaxUI Outlined"

C["UnitFrames"]["Count"] = true 
C["UnitFrames"]["CountFont"] = "MaxUI Outlined"
C["UnitFrames"]["CountSize"] = 10 
C["UnitFrames"]["CountColor"] = {1, 1, 0} 
C["UnitFrames"]["CountPosition"] = {
	["Options"] = {
		["topleft"] = "TOPLEFT",
		["top"] = "TOP",
		["topright"] = "TOPRIGHT",
		["left"] = "LEFT",
		["center"] = "CENTER",
		["right"] = "RIGHT",
		["bottomleft"] = "BOTTOMLEFT",
		["bottom"] = "BOTTOM",
		["bottomright"] = "BOTTOMRIGHT",
	},
	["Value"] = "TOPLEFT",
}

C["UnitFrames"]["CountOffsetH"] = 1 
C["UnitFrames"]["CountOffsetV"] = -1 
C["UnitFrames"]["CountJustifyH"] = {
	["Options"] = {
		["left"] = "LEFT",
		["center"] = "CENTER",
		["right"] = "RIGHT",
	},
	["Value"] = "LEFT",
}

C["UnitFrames"]["RemainingTime"] = true 
C["UnitFrames"]["RemainingTimeFont"] = "MaxUI Outlined"
C["UnitFrames"]["RemainingTimeSize"] = 10 
C["UnitFrames"]["RemainingTimeColor"] = {1, 0, 0} 
C["UnitFrames"]["RemainingTimePosition"] = {
	["Options"] = {
		["topleft"] = "TOPLEFT",
		["top"] = "TOP",
		["topright"] = "TOPRIGHT",
		["left"] = "LEFT",
		["center"] = "CENTER",
		["right"] = "RIGHT",
		["bottomleft"] = "BOTTOMLEFT",
		["bottom"] = "BOTTOM",
		["bottomright"] = "BOTTOMRIGHT",
	},
	["Value"] = "BOTTOM",
}

C["UnitFrames"]["RemainingTimeOffsetH"] = 1 
C["UnitFrames"]["RemainingTimeOffsetV"] = -6 
C["UnitFrames"]["RemainingTimeJustifyH"] = {
	["Options"] = {
		["left"] = "LEFT",
		["center"] = "CENTER",
		["right"] = "RIGHT",
	},
	["Value"] = "CENTER",
}

-- Horizontal or vertical
C["UnitFrames"]["HorVer"] = {
	["Options"] = {
		["Vertical"] = "Vertical",
		["Horizontal"] = "Horizontal",
	},
	["Value"] = "Horizontal",
}

-- style
C["UnitFrames"]["Style"] = {
	["Options"] = {
		["|cffFFFF99MaxUI|r"] = "MaxUI",
		["Tukui"] = "Tukui",
	},
	["Value"] = "MaxUI",
}

-- values and tags
C["UnitFrames"]["TagFormat"] = {
	["Options"] = {
		["Full 1900"] = "Full",
		["Short 1.9k"] = "Short",
	},
	["Value"] = "Short",	
}

C["UnitFrames"]["HealthValueColors"] = {
	["Options"] = {
		["|cff549654Standard|r"] = "GradientColor",
		["" ..ClassTextColor .."Class".. "|r"] = "ClassColor",
		["Custom"] = "Custom",
	},
	["Value"] = "GradientColor",	
}
C["UnitFrames"]["CustomHealthValueColors"] = {1, 0, 0}

C["UnitFrames"]["PowerValueColors"] = {
	["Options"] = {
		["Power Type"] = "PowerColor",
		["" ..ClassTextColor .."Class".. "|r"] = "ClassColor",
		["Custom"] = "Custom",
	},
	["Value"] = "PowerColor",	
}
C["UnitFrames"]["CustomPowerValueColors"] = {0, 0, 1}

-- Marking and Role
C["UnitFrames"]["Roles"] = {
	["Options"] = {
		["MaxUI Role Icons"] = "MaxUI Style",
		["ElvUI Role Icons"] = "Elvui Style",
		["Blizzard Role Icons"] = "Blizzard Style",
		["None"] = "No Icons",	
	},
	["Value"] = "MaxUI Style",	
}

-- UnitFrame anchor options
C["UnitFrames"]["MaxUIAnchor"] = false
C["UnitFrames"]["MaxUIAnchorWidth"] = 0
C["UnitFrames"]["MaxUIAnchorVertical"] = 0

C["UnitFrames"]["Colorstyle"] = {
	["Options"] = {
		["|cff202020Dark|r"] = "Dark",
		["|cff00FF00G|r|cff80FF00r|r|cff80FF00a|r|cffFFFF00d|r|cffFFFF00i|r|cffFF8000e|r|cffFF8000n|r|cffFF0000t|r"] = "Gradient",
		["" ..ClassTextColor .."Class".. "|r and |cff00FF00reaction|r"] = "Class",
		["Custom"] = "Custom",	
	},
	["Value"] = "Class",	
}

--C["UnitFrames"]["BGAlpha"] = 1
C["UnitFrames"]["StatusBarColor"] = {.2, .2, .2}
C["UnitFrames"]["ColorTexture"] = {233/255, 0, 18/255}

------------------------------------------------------------------------------------------	
-- UNITFRAMES CLASS OPTIONS	
------------------------------------------------------------------------------------------
C["ClassOptions"] = {

	["ClassPowerStyle"] = {
		["Options"] = {
			["|cffFFFF99MaxUI|r"] = "MaxUI",
			["Tukui"] = "Tukui",
		},
		["Value"] = "MaxUI",
	},

	-- settings
	["ClassPowerMover"] = true,
	["ClassPowerBackdrop"] = false,

	["ClassResourcesOrientation"] = {
		["Options"] = {
			["Vertical"] = "Vertical",
			["Horizontal"] = "Horizontal",
		},
		["Value"] = "Horizontal",
	},

	-- resource ticker	
	["MaxUITicker"] = false,
	["MaxUITickerLength"] = 140,
	["OrientationTicker"] = {
		["Options"] = {
			["Vertical"] = "Vertical",
			["Horizontal"] = "Horizontal",
		},
		["Value"] = "Horizontal",
	},

	-- customization
	["ClassPowerWidth"] = 12,
	["ClassPowerHeight"] = 12,
	["ClassPowerSpace"] = 10,
	["ClassPowerTexture"] = "Tukui",	
	
	-- combat state
	["ClassResourcesCombatState"] = {
		["Options"] = {
			["Show in Combat"] = "Show",
			["Nothing"] = "Nothing",
		},
		["Value"] = "Nothing",
	},
	
	["ComboBar"] = true,
	
	-- class specific
	["Deathknight"] = true,
	["Demonhunter"] = true,
	["Evoker"] = true,
	["Druid"] = true,
	["DruidAdditionalPower"] = true,
	["Hunter"] = true,
	["Mage"] = true,
	["Monk"] = true,
	["Paladin"] = true,
	["PriestAtonement"] = true,
	["PriestAdditionalPower"] = true,
	["Rogue"] = true,
	["ShamanAdditionalPower"] = true,
	["ShamanTotemSize"] = 32,
	["ShamanTotemSpace"] = 4,
	["Warlock"] = true,
	["Warrior"] = true,
}

C["UnitFrames"]["TotemBarStyle"] = {
	["Options"] = {
		["Totem bar"] = "On Screen",
		["Status bars"] = "On Player",
	},

	["Value"] = "On Screen",
}

------------------------------------------------------------------------------------------
-- UF: SPECIFIC
------------------------------------------------------------------------------------------
-- UF: Player

-- health
C["UnitFrames"]["PlayerHealthTag"] = {
	["Options"] = {
		["None"] = "",
		["current"] = "[MaxUI:HealthColor][MaxUI:CurHP]",
		["percent"] = "[MaxUI:HealthColor][perhp]%",
		["current - percent"] = "[MaxUI:HealthColor][MaxUI:CurHP] - [perhp]%",
		["missing"] = "[MaxUI:HealthColor]-[MaxUI:MisHP]",
		["current | max"] = "[MaxUI:HealthColor][MaxUI:CurHP] | [MaxUI:MaxHP]",
	},
	["Value"] = "[MaxUI:HealthColor][MaxUI:CurHP] | [MaxUI:MaxHP]",
}

C["UF: Player"] = {

	-- settings
	["Enable"] = true,
	["PercentageTags"] = true,
	["CombatLog"] = true,

	-- health
	["HealthHeight"] = 36,
	["HealthWidth"] = 200,
	["HealthFont"] = "MaxUI Outlined",
	["HealthFontSize"] = 12,
	["HealthTexture"] = "Tukui",

	-- power
	["PowerHeight"] = 12,
	["PowerWidth"] = 140,
	["PowerFont"] = "MaxUI Outlined",
	["PowerFontSize"] = 10,
	["PowerTexture"] = "Tukui",
	["PowerTag"] = {
		["Options"] = {
			["None"] = "",
			["current"] = "[MaxUI:PowerColor][MaxUI:CurPP]",
			["percent"] = "[MaxUI:PowerColor][perpp]%",
			["current - percent"] = "[MaxUI:PowerColor][MaxUI:CurPP] - [perpp]%",
			["missing"] = "[MaxUI:PowerColor]-[MaxUI:MisPP]",
			["current | max"] = "[MaxUI:PowerColor][MaxUI:CurPP] | [MaxUI:MaxPP]",
		},
		["Value"] = "[MaxUI:PowerColor][MaxUI:CurPP] | [MaxUI:MaxPP]",
	},
	
	-- name
	["NameFont"] = "MaxUI Outlined",
	["NameFontSize"] = 14,
	["DescFontSize"] = 12,
	["NameTag"] = {
		["Options"] = {
			["None"] = "",
			["Create-your-own-in-lua"] = "[name] [name] [name] [name]",

			["name:Full+lvl+status"] = "[Tukui:GetNameColor][name] [Tukui:DiffColor][level] [classification][pvp]",
			["name:Abbrev+lvl+status"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level] [classification][pvp]",
			["name:Long+ lvl+status"] = "[Tukui:GetNameColor][Tukui:NameLong] [Tukui:DiffColor][level] [classification][pvp]",
			["name:Medium+lvl+status"] = "[Tukui:GetNameColor][Tukui:NameMedium] [Tukui:DiffColor][level] [classification][pvp]",
			["name:Short+lvl+status"] = "[Tukui:GetNameColor][Tukui:NameShort] [Tukui:DiffColor][level] [classification][pvp]",
			
			["name:Full+lvl"] = "[Tukui:GetNameColor][name] [Tukui:DiffColor][level]",
			["name:Abbreviated+lvl"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level]",
			["name:Long+lvl"] = "[Tukui:GetNameColor][Tukui:NameLong] [Tukui:DiffColor][level]",
			["name:Medium+lvl"] = "[Tukui:GetNameColor][Tukui:NameMedium] [Tukui:DiffColor][level]",
			["name:Short+lvl"] = "[Tukui:GetNameColor][Tukui:NameShort] [Tukui:DiffColor][level]",
			
			["name:Full"] = "[Tukui:GetNameColor][name]",
			["name:Abbreviated"] = "[Tukui:GetNameColor][name:abbrev]",
			["name:Long"] = "[Tukui:GetNameColor][Tukui:NameLong]",
			["name:Medium"] = "[Tukui:GetNameColor][Tukui:NameMedium]",
			["name:Short"] = "[Tukui:GetNameColor][Tukui:NameShort]",
			
			["name:Full+status"] = "[Tukui:GetNameColor][name] [classification][pvp]",
			["name:Abbreviated+status"] = "[Tukui:GetNameColor][name:abbrev] [classification][pvp]",
			["name:Long+status"] = "[Tukui:GetNameColor][Tukui:NameLong] [classification][pvp]",
			["name:Medium+status"] = "[Tukui:GetNameColor][Tukui:NameMedium] [classification][pvp]",
			["name:Short+status"] = "[Tukui:GetNameColor][Tukui:NameShort] [classification][pvp]",
		},
		["Value"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level] [classification][pvp]",
	},

	["DescriptionTag"] = {
		["Options"] = {
			["None"] = "",
			["Create-your-own-in-lua"] = "[name] [name] [name] [name]",
			
			["Preset 1"] = "[faction] [race] [arenaspec] [smartclass]",
			["Preset 2"] = "[group] [leader] [status] [offline] [resting]",
			["Preset 3"] = "[sex] [race] [creature]",
			["Preset 4"] = "[threatcolor] [threat]",
			
			["creature"] = "[creature]",
			["sex"] = "[sex]",
			["name"] = "[name]",
			["faction"] = "[faction]",
			["race"] = "[race]",
			
			["group"] = "[group]",
			["threat"] = "[threat]",
			
			["arenaspec"] = "[arenaspec]",
			["smartlevel"] = "[smartlevel]",
			["smartclass"] = "[smartclass]",
			
			["offline"] = "[offline]",
			["resting"] = "[resting]",
			["status"] = "[status]",
			["pvp"] = "[pvp]",
			["leader"] = "[leader]",
			["leaderlong"] = "[leaderlong]",
			["dead"] = "[dead]",
			["level"] = "[level]",
			
			["affix"] = "[affix]",
			["shortclassification"] = "[shortclassification]",
			["classification"] = "[classification]",
			["plus"] = "[plus]",
			["rare"] = "[rare]",

			["arcanecharges"] = "[arcanecharges]",
			["chi"] = "[chi]",
			["cpoints"] = "[cpoints]",
			["holypower"] = "[holypower]",
			["runes"] = "[runes]",
			["soulshards"] = "[soulshards]",
		},
		["Value"] = "",
	},

	-- castbar
	["CastBar"] = true,
	["CastBarIcon"] = true,
	["CastBarText"] = true,
	["CastBarTime"] = true,
	["CastBarUnlink"] = true,
	["StandAloneCastBar"] = false,
	["StandAloneCastBarTimeOffsetV"] = -16,
	["StandAloneCastBarTextOffsetV"] = -16,
	["CastHeight"] = 12,
	["CastWidth"] = 200,
	["CastFont"] = "MaxUI Outlined",
	["CastFontSize"] = 12,
	["CastTexture"] = "Tukui",
	
	-- aurabars
	["AuraBarsHeight"] = 17,
	["AuraBarsWidth"] = 200,
	["AuraBarsSpacing"] = 2,
	["AuraBarsAlignment"] = {
		["Options"] = {
			["Left"] = "LEFT",
			["Right"] = "RIGHT",	
		},
		["Value"] = "LEFT",
	},
	["AuraBarsGrowDirection"] = {
		["Options"] = {
			["Up"] = "UP",
			["Down"] = "DOWN",	
		},
		["Value"] = "UP",
	},

	-- buffs
	["OnlySelfBuffs"] = true,
	["BuffSize"] = 22,
	["BuffNumber"] = 8,
	["BuffNumberRows"] = 1,
	["BuffSpacing"] = 6,
	["BuffsPlayerCombatState"] = {
		["Options"] = {
			["Show in Combat"] = "Show",
			["Hide in Combat"] = "Hide",	
			["Nothing"] = "Nothing",
		},
		["Value"] = "Nothing",
	},
	
	-- debuffs
	["OnlySelfDeBuffs"] = false,
	["DebuffSize"] = 40,
	["DebuffNumber"] = 31,
	["DebuffNumberRows"] = 1,
	["DebuffSpacing"] = 3,
	
	-- Portrait
	["PortraitOverlayAlpha"] = 0.5,
	["PortraitStyle"] = {
		["Options"] = {
			["None"] = "None",
			["Outside"] = "Side",
			["Class Icon"] = "ClassIcon",
			["Overlay"] = "Overlay",
		},	
		["Value"] = "None",
	},
	
	-- icons
	["RestedIcon"] = true,
	["RestedText"] = false,
	["RoleIcon"] = true,
	["RoleIconSize"] = 24,
	["RaidIcon"] = true,
	["RaidIconSize"] = 24,
	["CombatIcon"] = true,
	["CombatIconSize"] = 14,
	["CombatIconColor"] = {1, 1, 0},
	["LeaderIcon"] = true,
	["LeaderIconSize"] = 14,
	["MasterLooterIcon"] = true,
	["MasterLooterIconSize"] = 14,
	["PVPIcon"] = false,
	["PVPIconSize"] = 48,
	
	-- combat state
	["NonCombatAlphaEnable"] = false,
	["OnlyFullHP"] = true,
	["NonCombatAlpha"] = 1,
}

-- UF: Target
C["UnitFrames"]["TargetHealthTag"] = {
	["Options"] = {
		["None"] = "",
		["current"] = "[MaxUI:HealthColor][MaxUI:CurHP]",
		["percent"] = "[MaxUI:HealthColor][perhp]%",
		["current - percent"] = "[MaxUI:HealthColor][MaxUI:CurHP] - [perhp]%",
		["missing"] = "[MaxUI:HealthColor]-[MaxUI:MisHP]",
		["current | max"] = "[MaxUI:HealthColor][MaxUI:CurHP] | [MaxUI:MaxHP]",
	},
	["Value"] = "[MaxUI:HealthColor][MaxUI:CurHP] | [MaxUI:MaxHP]",
}

C["UF: Target"] = {

	-- settings
	["Enable"] = true,
	["ColorThreat"] = false, 
	["ColorGradient"] = false, 
	["PercentageTags"] = true,
	["CombatLog"] = true,
	

	-- health
	["HealthHeight"] = 36,
	["HealthWidth"] = 200,
	["HealthFont"] = "MaxUI Outlined",
	["HealthFontSize"] = 12,
	["HealthTexture"] = "Tukui",

	-- power
	["PowerHeight"] = 12,
	["PowerWidth"] = 140,
	["PowerFont"] = "MaxUI Outlined",
	["PowerFontSize"] = 10,
	["PowerTexture"] = "Tukui",
	["PowerTag"] = {
		["Options"] = {
			["None"] = "",
			["current"] = "[MaxUI:PowerColor][MaxUI:CurPP]",
			["percent"] = "[MaxUI:PowerColor][perpp]%",
			["current - percent"] = "[MaxUI:PowerColor][MaxUI:CurPP] - [perpp]%",
			["missing"] = "[MaxUI:PowerColor]-[MaxUI:MisPP]",
			["current | max"] = "[MaxUI:PowerColor][MaxUI:CurPP] | [MaxUI:MaxPP]",
		},
		["Value"] = "[MaxUI:PowerColor][MaxUI:CurPP] | [MaxUI:MaxPP]",
	},

	-- name
	["NameFont"] = "MaxUI Outlined",
	["NameFontSize"] = 14,
	["DescFontSize"] = 12,
	["NameTag"] = {
		["Options"] = {
			["None"] = "",
			["Create-your-own-in-lua"] = "[name] [name] [name] [name]",
		
			["Name:Full+lvl+status"] = "[Tukui:GetNameColor][name] [Tukui:DiffColor][level] [classification][pvp]",
			["Name:Abbrev+lvl+status"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level] [classification][pvp]",
			["Name:Long+ lvl+status"] = "[Tukui:GetNameColor][Tukui:NameLong] [Tukui:DiffColor][level] [classification][pvp]",
			["Name:Medium+lvl+status"] = "[Tukui:GetNameColor][Tukui:NameMedium] [Tukui:DiffColor][level] [classification][pvp]",
			["Name:Short+lvl+status"] = "[Tukui:GetNameColor][Tukui:NameShort] [Tukui:DiffColor][level] [classification][pvp]",
			
			["Name:Full+lvl"] = "[Tukui:GetNameColor][name] [Tukui:DiffColor][level]",
			["Name:Abbreviated+lvl"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level]",
			["Name:Long+lvl"] = "[Tukui:GetNameColor][Tukui:NameLong] [Tukui:DiffColor][level]",
			["Name:Medium+lvl"] = "[Tukui:GetNameColor][Tukui:NameMedium] [Tukui:DiffColor][level]",
			["Name:Short+lvl"] = "[Tukui:GetNameColor][Tukui:NameShort] [Tukui:DiffColor][level]",
			
			["Name:Full"] = "[Tukui:GetNameColor][name]",
			["Name:Abbreviated"] = "[Tukui:GetNameColor][name:abbrev]",
			["Name:Long"] = "[Tukui:GetNameColor][Tukui:NameLong]",
			["Name:Medium"] = "[Tukui:GetNameColor][Tukui:NameMedium]",
			["Name:Short"] = "[Tukui:GetNameColor][Tukui:NameShort]",
			
			["Name:Full+status"] = "[Tukui:GetNameColor][name] [classification][pvp]",
			["Name:Abbreviated+status"] = "[Tukui:GetNameColor][name:abbrev] [classification][pvp]",
			["Name:Long+status"] = "[Tukui:GetNameColor][Tukui:NameLong] [classification][pvp]",
			["Name:Medium+status"] = "[Tukui:GetNameColor][Tukui:NameMedium] [classification][pvp]",
			["Name:Short+status"] = "[Tukui:GetNameColor][Tukui:NameShort] [classification][pvp]",
		},
		["Value"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level] [classification][pvp]",
	},
	
	["DescriptionTag"] = {
		["Options"] = {
			["None"] = "",
			["Create-your-own-in-lua"] = "[name] [name] [name] [name]",
			
			["Preset 1"] = "[faction][race][arenaspec][smartclass]",
			["Preset 2"] = "[group][leader][status][offline][resting]",
			["Preset 3"] = "[sex][race][creature]",
			["Preset 4"] = "[threatcolor][threat]",
			
			["creature"] = "[creature]",
			["sex"] = "[sex]",
			["name"] = "[name]",
			["faction"] = "[faction]",
			["race"] = "[race]",
			
			["group"] = "[group]",
			["threat"] = "[threat]",
			
			["arenaspec"] = "[arenaspec]",
			["smartlevel"] = "[smartlevel]",
			["smartclass"] = "[smartclass]",
			
			["offline"] = "[offline]",
			["resting"] = "[resting]",
			["status"] = "[status]",
			["pvp"] = "[pvp]",
			["leader"] = "[leader]",
			["leaderlong"] = "[leaderlong]",
			["dead"] = "[dead]",
			["level"] = "[level]",
			
			["affix"] = "[affix]",
			["shortclassification"] = "[shortclassification]",
			["classification"] = "[classification]",
			["plus"] = "[plus]",
			["rare"] = "[rare]",

			["arcanecharges"] = "[arcanecharges]",
			["chi"] = "[chi]",
			["cpoints"] = "[cpoints]",
			["holypower"] = "[holypower]",
			["runes"] = "[runes]",
			["soulshards"] = "[soulshards]",
		},
		["Value"] = "",
	},

	-- castbar
	["CastBar"] = true,
	["CastBarIcon"] = true,
	["CastBarText"] = true,
	["CastBarTime"] = true,
	["CastBarUnlink"] = true,
	["CastHeight"] = 12,
	["CastWidth"] = 200,
	["CastFont"] = "MaxUI Outlined",
	["CastFontSize"] = 12,
	["CastTexture"] = "Tukui",

	-- buffs
	["OnlySelfBuffs"] = true,
	["BuffSize"] = 22,
	["BuffNumber"] = 8,
	["BuffNumberRows"] = 1,
	["BuffSpacing"] = 6,
	["BuffsTargetCombatState"] = {
		["Options"] = {
			["Show in Combat"] = "Show",
			["Hide in Combat"] = "Hide",	
			["Nothing"] = "Nothing",
		},
		["Value"] = "Nothing",
	},
	
	-- debuffs
	["OnlySelfDebuffs"] = true,
	["DebuffSize"] = 40,
	["DebuffNumber"] = 31,
	["DebuffNumberRows"] = 1,
	["DebuffSpacing"] = 3,
	
	-- portrait
	["PortraitOverlayAlpha"] = 0.5,
	["PortraitStyle"] = {
		["Options"] = {
			["None"] = "None",
			["Outside"] = "Side",
			--["Class Icon"] = "ClassIcon",
			["Overlay"] = "Overlay",
		},	
		["Value"] = "None",
	},

	-- icons
	["RoleIcon"] = true,
	["RoleIconSize"] = 24,
	["RaidIcon"] = true,
	["RaidIconSize"] = 24,
	
	-- combat state
	["NonCombatAlphaEnable"] = false,
	["NonCombatAlpha"] = 1,
}

-- UF:PET
C["UF: Pet"] = {

	-- settings
	["Enable"] = true,
	["PercentageTags"] = true,

	-- health
	["HealthHeight"] = 30,
	["HealthWidth"] = 160,
	["HealthFont"] = "MaxUI Outlined",
	["HealthFontSize"] = 12,
	["HealthTexture"] = "Tukui",
	["HealthTag"] = {
		["Options"] = {
			["None"] = "",
			["Current"] = "[MaxUI:HealthColor][MaxUI:CurHP]",
			["Percent"] = "[MaxUI:HealthColor][perhp]%",
			["Current - Percent"] = "[MaxUI:HealthColor][MaxUI:CurHP] - [perhp]%",
			["Missing"] = "[MaxUI:HealthColor]-[MaxUI:MisHP]",
			["Current | Max"] = "[MaxUI:HealthColor][MaxUI:CurHP] | [MaxUI:MaxHP]",
		},
		["Value"] = "[MaxUI:HealthColor][MaxUI:CurHP]",
	},

	-- power	
	["PowerHeight"] = 8,
	["PowerWidth"] = 100,
	["PowerFont"] = "MaxUI Outlined",
	["PowerFontSize"] = 10,
	["PowerTexture"] = "Tukui",
	["PowerTag"] = {
		["Options"] = {
			["None"] = "",
			["Current"] = "[MaxUI:PowerColor][MaxUI:CurPP]",
			["Percent"] = "[MaxUI:PowerColor][perpp]%",
			["Current - Percent"] = "[MaxUI:PowerColor][MaxUI:CurPP] - [perpp]%",
			["Missing"] = "[MaxUI:PowerColor]-[MaxUI:MisPP]",
			["Current | Max"] = "[MaxUI:PowerColor][MaxUI:CurPP] | [MaxUI:MaxPP]",
		},
		["Value"] = "[MaxUI:PowerColor][MaxUI:CurPP]",
	},

	-- name	
	["NameFont"] = "MaxUI Outlined",
	["NameFontSize"] = 12,
	["NameTag"] = {
		["Options"] = {
			["None"] = "",
			["Name:Full"] = "[Tukui:GetNameColor][name] [Tukui:DiffColor][level] [classification][pvp]",
			["Name:Abbreviated"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level] [classification][pvp]",
			["Name:Long"] = "[Tukui:GetNameColor][Tukui:NameLong] [Tukui:DiffColor][level] [classification][pvp]",
			["Name:Medium"] = "[Tukui:GetNameColor][Tukui:NameMedium] [Tukui:DiffColor][level] [classification][pvp]",
			["Name:Short"] = "[Tukui:GetNameColor][Tukui:NameShort] [Tukui:DiffColor][level] [classification][pvp]",
		},
		["Value"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level] [classification][pvp]",
	},

	-- castbar
	["CastBar"] = true,
	["CastBarText"] = true,
	["CastBarTime"] = true,
	["CastBarUnlink"] = false,
	["CastHeight"] = 10,
	["CastWidth"] = 160,
	["CastFont"] = "MaxUI Outlined",
	["CastFontSize"] = 10,
	["CastTexture"] = "Tukui",

	-- buffs
	["Buffs"] = true,
	["OnlySelfBuffs"] = true,
	["BuffSize"] = 22,
	["BuffNumber"] = 8,
	["BuffNumberRows"] = 1,
	["BuffSpacing"] = 6,
	["BuffsPetCombatState"] = {
		["Options"] = {
			["Show in Combat"] = "Show",
			["Hide in Combat"] = "Hide",	
			["Nothing"] = "Nothing",
		},
		["Value"] = "Nothing",
	},
	
	-- debuffs
	["Debuffs"] = true,
	["DebuffSize"] = 28,
	["DebuffNumber"] = 6,
	["DebuffNumberRows"] = 1,
	["DebuffSpacing"] = 3,

	-- portrait
	["PortraitOverlayAlpha"] = 0.5,
	["PortraitStyle"] = {
		["Options"] = {
			["None"] = "None",
			["Outside"] = "Side",
			["Overlay"] = "Overlay",
		},	
		["Value"] = "None",
	},

	-- icons
	["RaidIcon"] = true,
	["RaidIconSize"] = 24,

	-- combat state
	["NonCombatAlpha"] = 1,
	["NonCombatAlphaEnable"] = false,
}

-- UF:TARGETOFTARGET 
C["UF: ToT"] = {

	-- settings
	["Enable"] = true,
	["ColorThreat"] = false, 

	-- health
	["HealthHeight"] = 30,
	["HealthWidth"] = 160,
	["HealthFont"] = "MaxUI Outlined",
	["HealthFontSize"] = 12,
	["HealthTexture"] = "Tukui",
	["HealthTag"] = {
		["Options"] = {
			["None"] = "",
			["Current"] = "[MaxUI:HealthColor][MaxUI:CurHP]",
			["Percent"] = "[MaxUI:HealthColor][perhp]%",
			["Current - Percent"] = "[MaxUI:HealthColor][MaxUI:CurHP] - [perhp]%",
			["Missing"] = "[MaxUI:HealthColor]-[MaxUI:MisHP]",
			["Current | Max"] = "[MaxUI:HealthColor][MaxUI:CurHP] | [MaxUI:MaxHP]",
		},
		["Value"] = "[MaxUI:HealthColor][MaxUI:CurHP]",
	},
	
	-- power
	["PowerHeight"] = 8,
	["PowerWidth"] = 100,
	["PowerFont"] = "MaxUI Outlined",
	["PowerFontSize"] = 10,
	["PowerTexture"] = "Tukui",
	["PowerTag"] = {
		["Options"] = {
			["None"] = "",
			["Current"] = "[MaxUI:PowerColor][MaxUI:CurPP]",
			["Percent"] = "[MaxUI:PowerColor][perpp]%",
			["Current - Percent"] = "[MaxUI:PowerColor][MaxUI:CurPP] - [perpp]%",
			["Missing"] = "[MaxUI:PowerColor]-[MaxUI:MisPP]",
			["Current | Max"] = "[MaxUI:PowerColor][MaxUI:CurPP] | [MaxUI:MaxPP]",
		},
		["Value"] = "[MaxUI:PowerColor][MaxUI:CurPP]",
	},

	-- name
	["NameFont"] = "MaxUI Outlined",
	["NameFontSize"] = 12,
	["NameTag"] = {
		["Options"] = {
			["None"] = "",
			["Name:Full"] = "[Tukui:GetNameColor][name] [Tukui:DiffColor][level] [classification][pvp]",
			["Name:Abbreviated"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level] [classification][pvp]",
			["Name:Long"] = "[Tukui:GetNameColor][Tukui:NameLong] [Tukui:DiffColor][level] [classification][pvp]",
			["Name:Medium"] = "[Tukui:GetNameColor][Tukui:NameMedium] [Tukui:DiffColor][level] [classification][pvp]",
			["Name:Short"] = "[Tukui:GetNameColor][Tukui:NameShort] [Tukui:DiffColor][level] [classification][pvp]",
		},
		["Value"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level] [classification][pvp]",
	},
	
	-- buffs
	["Buffs"] = true,
	["OnlySelfBuffs"] = true,
	["BuffSize"] = 22,
	["BuffNumber"] = 8,
	["BuffNumberRows"] = 1,
	["BuffSpacing"] = 6,
	["BuffsToTCombatState"] = {
		["Options"] = {
			["Show in Combat"] = "Show",
			["Hide in Combat"] = "Hide",	
			["Nothing"] = "Nothing",
		},
		["Value"] = "Nothing",
	},
	
	-- debuffs
	["Debuffs"] = true,
	["OnlySelfDebuffs"] = false,
	["DebuffSize"] = 28,
	["DebuffNumber"] = 6,
	["DebuffNumberRows"] = 1,
	["DebuffSpacing"] = 3,
	
	-- portrait
	["PortraitOverlayAlpha"] = 0.5,
	["PortraitStyle"] = {
		["Options"] = {
			["None"] = "None",
			["Outside"] = "Side",
			["Overlay"] = "Overlay",
		},	
		["Value"] = "None",
	},
	
	-- icons
	["PercentageTags"] = true,
	["RoleIcon"] = true,
	["RoleIconSize"] = 24,
	["RaidIcon"] = true,
	["RaidIconSize"] = 24,

	-- combat state
	["NonCombatAlpha"] = 1,
	["NonCombatAlphaEnable"] = false,
}

-- UF:FOCUS	
C["UnitFrames"]["FocusHealthTag"] = {
	["Options"] = {
		["None"] = "",
		["Current"] = "[MaxUI:HealthColor][MaxUI:CurHP]",
		["Percent"] = "[MaxUI:HealthColor][perhp]%",
		["Current - Percent"] = "[MaxUI:HealthColor][MaxUI:CurHP] - [perhp]%",
		["Missing"] = "[MaxUI:HealthColor]-[MaxUI:MisHP]",
		["Current | Max"] = "[MaxUI:HealthColor][MaxUI:CurHP] | [MaxUI:MaxHP]",
	},
	["Value"] = "[MaxUI:HealthColor][MaxUI:CurHP]",
}

C["UF: Focus"] = {

	-- settings
	["Enable"] = true,
	["EnableFT"] = true,
	["PercentageTags"] = false,
	["ColorThreat"] = false, 
	
	-- health
	["HealthHeight"] = 30,
	["HealthWidth"] = 160,
	["HealthFont"] = "MaxUI Outlined",
	["HealthFontSize"] = 10,
	["HealthTexture"] = "Tukui",

	-- power
	["PowerHeight"] = 10,
	["PowerWidth"] = 100,
	["PowerFont"] = "MaxUI Outlined",
	["PowerFontSize"] = 10,
	["PowerTexture"] = "Tukui",
	["PowerTag"] = {
		["Options"] = {
			["None"] = "",
			["Current"] = "[MaxUI:PowerColor][MaxUI:CurPP]",
			["Percent"] = "[MaxUI:PowerColor][perpp]%",
			["Current - Percent"] = "[MaxUI:PowerColor][MaxUI:CurPP] - [perpp]%",
			["Missing"] = "[MaxUI:PowerColor]-[MaxUI:MisPP]",
			["Current | Max"] = "[MaxUI:PowerColor][MaxUI:CurPP] | [MaxUI:MaxPP]",
		},
		["Value"] = "[MaxUI:PowerColor][MaxUI:CurPP]",
	},
	
	-- name
	["NameFont"] = "MaxUI Outlined",
	["NameFontSize"] = 12,
	["FocusNameTag"] = {
		["Options"] = {
			["None"] = "",
			["Name:Full"] = "[Tukui:GetNameColor][name] [Tukui:DiffColor][level] [classification][pvp]",
			["Name:Abbreviated"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level] [classification][pvp]",
			["Name:Long"] = "[Tukui:GetNameColor][Tukui:NameLong] [Tukui:DiffColor][level] [classification][pvp]",
			["Name:Medium"] = "[Tukui:GetNameColor][Tukui:NameMedium] [Tukui:DiffColor][level] [classification][pvp]",
			["Name:Short"] = "[Tukui:GetNameColor][Tukui:NameShort] [Tukui:DiffColor][level] [classification][pvp]",
		},
		["Value"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level] [classification][pvp]",
	},

	-- castbar
	["CastBar"] = true,
	["CastBarIcon"] = false,
	["CastBarText"] = true,
	["CastBarTime"] = true,
	["CastBarUnlink"] = false,
	["CastHeight"] = 10,
	["CastWidth"] = 160,
	["CastFont"] = "MaxUI Outlined",
	["CastFontSize"] = 10,
	["CastTexture"] = "Tukui",

	-- buffs
	["Buffs"] = true,
	["NumberOfBuffsShown"] = 3,
	
	-- debuffs
	["Debuffs"] = true,
	["NumberOfDebuffsShown"] = 3,
	
	-- portrait
	["PortraitOverlayAlpha"] = 0.5,
	["PortraitStyle"] = {
		["Options"] = {
			["None"] = "None",
			["Outside"] = "Side",
			["Overlay"] = "Overlay",
		},	
		["Value"] = "None",
	},

	-- icons
	["RoleIcon"] = true,
	["RoleIconSize"] = 24,
	["RoleIcon"] = true,
	["RaidIconSize"] = 24,
	
	-- combat state
	["NonCombatAlpha"] = 1,
	["NonCombatAlphaEnable"] = false,
}

-- UF:BOSS
C["UnitFrames"]["BossHealthTag"] = {
	["Options"] = {
		["None"] = "",
		["Current"] = "[MaxUI:HealthColor][MaxUI:CurHP]",
		["Percent"] = "[MaxUI:HealthColor][perhp]%",
		["Current - Percent"] = "[MaxUI:HealthColor][MaxUI:CurHP] - [perhp]%",
		["Missing"] = "[MaxUI:HealthColor]-[MaxUI:MisHP]",
		["Current | Max"] = "[MaxUI:HealthColor][MaxUI:CurHP] | [MaxUI:MaxHP]",
	},
	["Value"] = "[MaxUI:HealthColor][MaxUI:CurHP] | [MaxUI:MaxHP]",
}

C["UF: Boss"] = {

	-- settings 

	["ColorThreat"] = false, 
	["PercentageTags"] = true,
	["Spacing"] = 50,

	-- health
	["HealthHeight"] = 32,
	["HealthWidth"] = 180,
	["HealthFont"] = "MaxUI Outlined",
	["HealthFontSize"] = 12,
	["HealthTexture"] = "Tukui",
	["HealComm"] = false,

	-- power
	["PowerHeight"] = 10,
	["PowerWidth"] = 130,
	["PowerFont"] = "MaxUI Outlined",
	["PowerFontSize"] = 10,
	["PowerTexture"] = "Tukui",
	["PowerTag"] = {
		["Options"] = {
			["None"] = "",
			["Current"] = "[MaxUI:PowerColor][MaxUI:CurPP]",
			["Percent"] = "[MaxUI:PowerColor][perpp]%",
			["Current - Percent"] = "[MaxUI:PowerColor][MaxUI:CurPP] - [perpp]%",
			["Missing"] = "[MaxUI:PowerColor]-[MaxUI:MisPP]",
			["Current | Max"] = "[MaxUI:PowerColor][MaxUI:CurPP] | [MaxUI:MaxPP]",
		},
		["Value"] = "[MaxUI:PowerColor][MaxUI:CurPP] | [MaxUI:MaxPP]",
	},

	-- name
	["NameFont"] = "MaxUI Outlined",
	["NameFontSize"] = 12,
	["NameTag"] = {
		["Options"] = {
			["None"] = "",
			["Name:Full"] = "[Tukui:GetNameColor][name] [Tukui:DiffColor][level] [classification][pvp]",
			["Name:Abbreviated"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level] [classification][pvp]",
			["Name:Long"] = "[Tukui:GetNameColor][Tukui:NameLong] [Tukui:DiffColor][level] [classification][pvp]",
			["Name:Medium"] = "[Tukui:GetNameColor][Tukui:NameMedium] [Tukui:DiffColor][level] [classification][pvp]",
			["Name:Short"] = "[Tukui:GetNameColor][Tukui:NameShort] [Tukui:DiffColor][level] [classification][pvp]",
		},
		["Value"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level] [classification][pvp]",
	},

	-- castbar
	["CastBar"] = true,
	["CastBarIcon"] = false,
	["CastBarText"] = true,
	["CastBarTime"] = true,
	["CastBarUnlink"] = false,
	["CastHeight"] = 10,
	--["CastWidth"] = 160,
	["CastFont"] = "MaxUI Outlined",
	["CastFontSize"] = 12,
	["CastTexture"] = "Tukui",
	
	-- buffs
	["Buffs"] = true,
	["NumberOfBuffsShown"] = 3,
	
	-- debuffs
	["Debuffs"] = true,
	["NumberOfDebuffsShown"] = 3,
	
	-- portrait
	["PortraitOverlayAlpha"] = 0.5,
	["PortraitStyle"] = {
		["Options"] = {
			["None"] = "None",
			["Outside"] = "Side",
			["Overlay"] = "Overlay",
		},	
		["Value"] = "None",
	},

	-- icon
	["RoleIcon"] = true,
	["RaidIconSize"] = 24,
}

-- UF:ARENA
C["UF: Arena"] = {

	-- settings
	["Enable"] = true,
	["PercentageTags"] = true,
	["Spacing"] = 50,

	-- health
	["HealthHeight"] = 32,
	["HealthWidth"] = 180,
	["HealthFont"] = "MaxUI Outlined",
	["HealthFontSize"] = 12,
	["HealthTexture"] = "Tukui",
	["HealComm"] = false,
	["HealthTag"] = {
		["Options"] = {
			["None"] = "",
			["Current"] = "[MaxUI:HealthColor][MaxUI:CurHP]",
			["Percent"] = "[MaxUI:HealthColor][perhp]%",
			["Current - Percent"] = "[MaxUI:HealthColor][MaxUI:CurHP] - [perhp]%",
			["Missing"] = "[MaxUI:HealthColor]-[MaxUI:MisHP]",
			["Current | Max"] = "[MaxUI:HealthColor][MaxUI:CurHP] | [MaxUI:MaxHP]",
		},
		["Value"] = "[MaxUI:HealthColor][MaxUI:CurHP] | [MaxUI:MaxHP]",
	},

	-- power	
	["PowerHeight"] = 10,
	["PowerWidth"] = 130,
	["PowerFont"] = "MaxUI Outlined",
	["PowerFontSize"] = 10,
	["PowerTexture"] = "Tukui",
	["PowerTag"] = {
		["Options"] = {
			["None"] = "",
			["Current"] = "[MaxUI:PowerColor][MaxUI:CurPP]",
			["Percent"] = "[MaxUI:PowerColor][perpp]%",
			["Current - Percent"] = "[MaxUI:PowerColor][MaxUI:CurPP] - [perpp]%",
			["Missing"] = "[MaxUI:PowerColor]-[MaxUI:MisPP]",
			["Current | Max"] = "[MaxUI:PowerColor][MaxUI:CurPP] | [MaxUI:MaxPP]",
		},
		["Value"] = "[MaxUI:PowerColor][MaxUI:CurPP] | [MaxUI:MaxPP]",
	},

	-- name
	["NameFont"] = "MaxUI Outlined",
	["NameFontSize"] = 12,
	["NameTag"] = {
		["Options"] = {
			["None"] = "",
			["Name:Full"] = "[Tukui:GetNameColor][name] [Tukui:DiffColor][level] [classification][pvp]",
			["Name:Abbreviated"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level] [classification][pvp]",
			["Name:Long"] = "[Tukui:GetNameColor][Tukui:NameLong] [Tukui:DiffColor][level] [classification][pvp]",
			["Name:Medium"] = "[Tukui:GetNameColor][Tukui:NameMedium] [Tukui:DiffColor][level] [classification][pvp]",
			["Name:Short"] = "[Tukui:GetNameColor][Tukui:NameShort] [Tukui:DiffColor][level] [classification][pvp]",
		},
		["Value"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level] [classification][pvp]",
	},	
	-- castbar
	["CastBar"] = true,
	["CastBarIcon"] = false,
	["CastBarText"] = true,
	["CastBarTime"] = true,
	["CastBarUnlink"] = false,
	["CastHeight"] = 10,
	["CastWidth"] = 160,
	["CastFont"] = "MaxUI Outlined",
	["CastFontSize"] = 12,
	["CastTexture"] = "Tukui",

	-- buffs
	["Buffs"] = true,
	["NumberOfBuffsShown"] = 3,
	
	-- debuffs
	["Debuffs"] = true,
	["NumberOfDebuffsShown"] = 3,
	
	-- portrait
	["PortraitOverlayAlpha"] = 0.5,
	["PortraitStyle"] = {
		["Options"] = {
			["None"] = "None",
			["Outside"] = "Side",
			["Overlay"] = "Overlay",
		},	
		["Value"] = "None",
	},

	-- icon
	["RaidIcon"] = true,
	["RaidIconSize"] = 24,
	--["RoleIcon"] = true,
	["SpecIcon"] = true,
	["Trinket"] = true,
	
	-- combat state
	["NonCombatAlpha"] = 1,
	["NonCombatAlphaEnable"] = false,
}