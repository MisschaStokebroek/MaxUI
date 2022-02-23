------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 01-08-2021
------------------------------------------------------------------------------------------

-- setting up CONFIGURATION MAXUI, additional options and settings.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local ClassTextColor = T.RGBToHex(unpack(T.Colors.class[select(2, UnitClass("player"))]))
local BackdropTextColor = T.RGBToHex(unpack(C.General.BackdropColor))

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

C["General"]["GlobalFont"]["Options"]["Cartoon"] = "Interface\\AddOns\\MaxUI\\Medias\\Fonts\\cartoon.ttf"
C["General"]["GlobalFont"]["Options"]["Comic"] = "Interface\\AddOns\\MaxUI\\Medias\\Fonts\\comic.ttf"
C["General"]["GlobalFont"]["Options"]["MaxUI"] = "Interface\\AddOns\\MaxUI\\Medias\\Fonts\\MaxUI.ttf"
C["General"]["GlobalFont"]["Options"]["Bold"] = "Interface\\AddOns\\MaxUI\\Medias\\Bold\\MaxUI.ttf"
C["General"]["GlobalFont"]["Options"]["Warcraft"] = "Interface\\AddOns\\MaxUI\\Medias\\Fonts\\LifeCraft.ttf"
C["General"]["GlobalFont"]["Options"]["Morpheus"] = "Interface\\AddOns\\MaxUI\\Medias\\Fonts\\Morpheus.ttf"
C["General"]["GlobalFont"]["Options"]["Kimberley"] = "Interface\\AddOns\\MaxUI\\Medias\\Fonts\\kimberley.ttf"
C["General"]["GlobalFont"]["Value"] = "Interface\\AddOns\\MaxUI\\Medias\\Fonts\\MaxUI.ttf"

C["General"]["FontFlag"] = {
	["Options"] = {
		["Thin Outline"] = "THINOUTLINE",
		["Outline"] = "OUTLINE",
		["Thick Outline"] = "THICKOUTLINE",
		["Monochrome"] = "MONOCHROME",
		["none"] = "",	
	},
	["Value"] = "THINOUTLINE",
}

-- panels and frames
C["General"]["GeneralPanelAlpha"] = 1
C["General"]["thickness"] = 1

-- textures
C["General"]["HeaderTexture"] = "Tukui" 
C["General"]["LineTexture"] = "Tukui"
C["General"]["TextureButton"] = "Tukui"

-- colors
C["General"]["ClassColorHeaders"] = {
	["Options"] = {
		["|cff202020Dark|r"] = "Dark",
		["Backdrop"] = "BackdropColor",
		["|cffC0C0C0Grey|r"] = "Grey",
		["" ..ClassTextColor .."Class".. "|r"] = "ClassColor",	
	},
	["Value"] = "Grey",
}
C["General"]["ClassColorLines"] = {
	["Options"] = {
		["|cff202020Dark|r"] = "Dark",
		["Backdrop"] = "BackdropColor",
		["|cffC0C0C0Grey|r"] = "Grey",
		["" ..ClassTextColor .."Class".. "|r"] = "ClassColor",	
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
	},
	["Value"] = "Standard",
}

C["General"]["ClassShadowExcludeUF"] = false

------------------------------------------------------------------------------------------
-- ACTIONBARS
------------------------------------------------------------------------------------------
-- options
C["ActionBars"]["ABAlpha"] = 0.7

C["ActionBars"]["ABFontSize"] = 10
C["ActionBars"]["CDFontSize"] = 12

C["ActionBars"]["CooldownFlash"] = false

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
C["ActionBars"]["PetBarButtonSize"] = 26
C["ActionBars"]["StanceBarButtonSize"] = 26
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
		
C["ActionBars"]	["ActionBar2Edges"] = {
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
	
C["ActionBars"]	["ActionBar3Edges"] = {
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
	
C["ActionBars"]	["ActionBar4Edges"] = {
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
	
C["ActionBars"]	["ActionBar5Edges"] = {
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
	
C["ActionBars"]	["ActionBarPetEdges"] = {
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

C["ActionBars"]	["ActionBarStanceEdges"] = {
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

C["ActionBars"]	["ActionBarExtraEdges"] = {
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

C["ActionBars"]	["TrinketBarEdges"] = {
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
C["ActionBars"]["PetBarBackdrop"] = true
C["ActionBars"]["StanceBarBackdrop"] = true
C["ActionBars"]["ExtraBarBackdrop"] = true
C["ActionBars"]["TrinketBarBackdrop"] = true

------------------------------------------------------------------------------------------
-- AURAS
------------------------------------------------------------------------------------------
C["Auras"]["AurasFontSize"] = 12

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
C["Bags"]["BagsAlpha"] = 0.7 
C["Bags"]["Art"] = false 

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

-- Background
C["Chat"]["BackgroundOptions"] = {
	["Options"] = {
		["Logo"] = "Logo",
		["Class"] = "Class",
		["Texture"] = "Texture",	
		["Blank"] = "Blank",
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
C["Chat"]["ChatBGCombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
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
C["DataTexts"]["AmountDataCenterDataTexts"] = 12
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

C["DataTexts"]["Icons"] = true

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
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}

-- maxUI experimental
C["DataTexts"]["Slidable"] = false	

------------------------------------------------------------------------------------------
-- LOOT
------------------------------------------------------------------------------------------
C["Loot"]["FontSize"] = 12

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
C["Misc"]["XPBarHeight"] = 6
C["Misc"]["XPBarWidth"] = 110
C["Misc"]["XPBarTexture"] = "Tukui"

-- reputation
C["Misc"]["REPBarEnable"] = true
C["Misc"]["REPBarHeight"] = 6
C["Misc"]["REPBarWidth"] = 110
C["Misc"]["REPBarTexture"] = "Tukui"

-- honor
C["Misc"]["HONORBarEnable"] = true
C["Misc"]["HONORBarHeight"] = 6
C["Misc"]["HONORBarWidth"] = 110
C["Misc"]["HONORBarTexture"] = "Tukui"

-- azerite
C["Misc"]["AZERITEBarEnable"] = false
C["Misc"]["AZERITEBarHeight"] = 6
C["Misc"]["AZERITEBarWidth"] = 110
C["Misc"]["AZERITEBarTexture"] = "Tukui"

-- anima
C["Misc"]["ANIMABarEnable"] = true
C["Misc"]["ANIMABarHeight"] = 6
C["Misc"]["ANIMABarWidth"] = 110
C["Misc"]["ANIMABarTexture"] = "Tukui"

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
-- font
C["NamePlates"]["FontSize"] = 12
C["NamePlates"]["HealthFontSize"] = 10

-- textures
C["NamePlates"]["CastTexture"] = "Tukui"

-- settings
C["NamePlates"]["HealthBars"] = true
C["NamePlates"]["GradientColor"] = true

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

C["NamePlates"]["CastbarFullNameplateOverlap"] = false
C["NamePlates"]["HealthPrediction"] = false
C["NamePlates"]["MaxDistance"] = 60
C["NamePlates"]["CombatOnly"] = true

-- sizing
C["NamePlates"]["CastHeight"] = 4

-- debuffs
C["NamePlates"]["Debuffs"] = true
C["NamePlates"]["DebuffSize"] = 20
C["NamePlates"]["DebuffsOnTop"] = true

-- quests
C["NamePlates"]["QuestIconSize"] = 40

-- threat
C["NamePlates"]["ThreatIndicator"] = true
--C["NamePlates"]["ThreatOnHealth"] = false
C["NamePlates"]["ThreatGlow"] = false
--C["NamePlates"]["ThreatSolo"] = true

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
-- styling
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
	
-- sizing
C["Party"]["HealthHeight"] = 32
C["Party"]["HealthWidth"] = 200
C["Party"]["PowerHeight"] = 12
C["Party"]["PowerWidth"] = 130
C["Party"]["VerticalSpacing"] = 0

-- fonts
C["Party"]["PowerFont"] = "MaxUI Outlined"
	
C["Party"]["HealthFontSize"] = 12
C["Party"]["PowerFontSize"] = 10
C["Party"]["NameFontSize"] = 14
	
-- textures
C["Party"]["CastTexture"] = "Tukui"

-- settings
C["Party"]["ShowSolo"] = true
C["Party"]["PercentageTags"] = true

-- marking/role
C["Party"]["RaidIconSize"] = 20
C["Party"]["RoleIcon"] = true

-- buufs/debuffs
C["Party"]["ShowBuffs"] = true
C["Party"]["ShowDebuffs"] = true

-- portrait
C["Party"]["PortraitOverlayAlpha"] = 0.5
C["Party"]["PortraitStyle"] = {
	["Options"] = {
		["None"] = "None",
		["Side"] = "Side",
		["Overlay"] = "Overlay",
	},	
	["Value"] = "None",
}

-- Combat State

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
--	["QuestSpacing"] = 6,
	["QuestProgressTexture"] = "Tukui",
	["QuestHeaderBackdrops"] = false,
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
C["Raid"]["Alternative"] = false

-- Fonts
C["Raid"]["FontSize"] = 10
C["Raid"]["HealthFontSize"] = 10
C["Raid"]["PercentageFontSize"] = 10
C["Raid"]["HealthPercentageFont"] = "MaxUI Outlined"

-- Settings
C["Raid"]["PowerVertical"] = false
C["Raid"]["ShowSolo"] = true
C["Raid"]["ShowMissingHealth"] = false
C["Raid"]["ShowPercentageHealth"] = false
C["Raid"]["GroupNumber"] = true
	
C["Raid"]["BuffsPosition"] = {
	["Options"] = {
		["Inside Top"] = "InsideTop",
		["Inside Bottom"] = "InsideBottom",
		["Top"] = "Top",
		["Bottom"] = "Bottom",
	},
	["Value"] = "Inside",
}

-- Name coloring
C["Raid"]["NameColor"] = {
	["Options"] = {
		["Class"] = "Class",
		["Custom"] = "Custom",
	},
	["Value"] = "Class",
}
C["Raid"]["CustomNameColor"] = {1, 1, 0}

C["Raid"]["DeBuffsOnRight"] = false

-- Sizing and Spacing
C["Raid"]["HorSpacing"] = 4
C["Raid"]["VerSpacing"] = 10

-- Marking and Role
C["Raid"]["MarkerSize"] = 16
C["Raid"]["RoleIconSize"] = 16
--C["Raid"]["AssignmentIcon"] = true

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

-- Combat State

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
	
	["MaxUIAddOnSkins"] = false,
	["MaxUISkins"] = false,
	["MinimapFilter"] = false,
	["ChatFilter"] = false,
	["AFKFilter"] = false,
	["UIParentFilter"] = false,
	["ScreenFilterAlpha"] = 0.8,
	["ScreenFilterColor"] = {0, 0, 0},
	["FilterAlpha"] = 0.6,
	["FilterSize"] = 48,
	
	["Color"] = {
		["Options"] = {
			["|cff202020Dark|r"] = "Dark",
			["Backdrop"] = "BackdropColor",
			["|cffC0C0C0Grey|r"] = "Grey",
			["" ..ClassTextColor .."Class".. "|r"] = "ClassColor",	
		},
	["Value"] = "Grey",
}

--[[
	-- system
	["GameMenu"] = false,
	["CustomerSupport"] = false,
	["WhatsNew"] = false,
	["Report"] = false,
	["System"] = false,
	["Interface"] = false,
	["Keybinds"] = false,
	["Macros"] = false,
	["AddOns"] = false,

	-- character
	["Character"] = false,
	["Talents"] = false,
	["Spellbook"] = false,
	["DressingRoom"] = false,
	
	-- social
	["Social"] = false,
	["PVE"] = false,
	["Guild"] = false,
	["EventCalendar"] = false,
	["Communities"] = false,

	-- maps and quest
	["WorldMap"] = false,
	["QuestGossip"] = false,
	["Flightmap"] = false,
	["DungeonJournal"] = false,
	
	-- merchant and vendors
	["Merchant"] = false,
	["Tradeskill"] = false,
	["Trainer"] = false,
	["AuctionHouse"] = false,
	
	-- support
	
	["Voice"] = false,
	["StopWatch"] = false,

	-- uncategorised
	["Mail"] = false,
	["Other"] = false,
	["Achievements"] = false,
	["Collections"] = false,
	
--]]	
}

------------------------------------------------------------------------------------------
-- TOOLS
------------------------------------------------------------------------------------------
C["Tools"] = {
	-- options
	["ToolButtonSize"] = 24,
	["Font"] = "MaxUI Outlined",
	["FontSize"] = 12,

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
--C["Tooltips"]["TooltipsCombatState"] = {
--	["Options"] = {
--		["Hide in Combat"] = "Hide",	
--		["Nothing"] = "Nothing",
--	},
--	["Value"] = "Nothing",
--}

C["Tooltips"]["HealthFontSize"] = 12
C["Tooltips"]["TooltipAlpha"] = 0.7

--C["Tooltips"]["MythicPlusInfo"] = true
--C["Tooltips"]["TooltipSpellInfo"] = true

------------------------------------------------------------------------------------------
-- UNITFRAMES
------------------------------------------------------------------------------------------
-- Settings
C["UnitFrames"]["HealCommAlpha"] = 0.6 
C["UnitFrames"]["RemainingTime"] = false 
C["UnitFrames"]["IconCountSize"] = 10 
C["UnitFrames"]["IconRemainingSize"] = 10 

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

-- Dark/Customizable UnitFrames
--C["UnitFrames"]["DarkEnable"] = false
--C["UnitFrames"]["GradientEnable"] = false

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
	-- settings
	["ComboBar"] = true,

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
	
	-- class specific
	["Deathknight"] = true,
	["Demonhunter"] = true,
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
	["ShamanTotemBackdrop"] = true,
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
C["UnitFrames"]["PlayerHealthTag"] = {
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

C["UF: Player"] = {

	-- Enable
	["Enable"] = true,

	-- styling
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
	
	["PercentageTags"] = true,
	["CombatLog"] = true,
	
	-- castbar
	["CastBar"] = true,
	["CastBarUnlink"] = true,
	["CastBarIcon"] = true,
	["CenteredHealer"] = false,
	
	-- sizing
	["HealthHeight"] = 36,
	["HealthWidth"] = 200,
	["PowerHeight"] = 12,
	["PowerWidth"] = 140,
	["CastHeight"] = 12,
	["CastWidth"] = 200,
	["AuraBarsHeight"] = 17,
	["AuraBarsWidth"] = 200,
	["AuraBarsSpacing"] = 2,
	["AuraBarsGrowDirection"] = {
		["Options"] = {
			["Up"] = "UP",
			["Down"] = "DOWN",	
		},
		["Value"] = "UP",
	},
	
	-- font
	["HealthFont"] = "MaxUI Outlined",
	["PowerFont"] = "MaxUI Outlined",
	["CastFont"] = "MaxUI Outlined",
	["NameFont"] = "MaxUI Outlined",
	
	["HealthFontSize"] = 12,
	["PowerFontSize"] = 10,
	["CastFontSize"] = 12,
	["NameFontSize"] = 14,
	
	-- texture
	["HealthTexture"] = "Tukui",
	["PowerTexture"] = "Tukui",
	["CastTexture"] = "Tukui",

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
			["Side"] = "Side",
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
	["NonCombatAlphaEnable"] = true,
	["NonCombatAlpha"] = 1,
}

-- UF: Target
C["UnitFrames"]["TargetHealthTag"] = {
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

C["UF: Target"] = {

	-- enable
	["Enable"] = true,

	["ColorThreat"] = false, 
	["ColorGradient"] = false, 
	
	-- styling
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
	
	["PercentageTags"] = true,
	["CombatLog"] = true,
	["RoleIcon"] = true,
	["RoleIconSize"] = 24,
	["RaidIcon"] = true,
	["RaidIconSize"] = 24,

	-- castbar
	["CastBar"] = true,
	["CastBarUnlink"] = true,
	["CastBarIcon"] = true,
	
	-- sizing
	["HealthHeight"] = 36,
	["HealthWidth"] = 200,
	["PowerHeight"] = 12,
	["PowerWidth"] = 140,
	["CastHeight"] = 12,
	["CastWidth"] = 200,

	-- font
	["HealthFont"] = "MaxUI Outlined",
	["PowerFont"] = "MaxUI Outlined",
	["CastFont"] = "MaxUI Outlined",
	["NameFont"] = "MaxUI Outlined",
	
	["HealthFontSize"] = 12,
	["PowerFontSize"] = 10,
	["CastFontSize"] = 12,
	["NameFontSize"] = 14,

	-- texture
	["HealthTexture"] = "Tukui",
	["PowerTexture"] = "Tukui",
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
			["Side"] = "Side",
			["Overlay"] = "Overlay",
		},	
		["Value"] = "None",
	},
	
	-- combat state
	["NonCombatAlphaEnable"] = true,
	["NonCombatAlpha"] = 1,
}

-- UF:PET
C["UF: Pet"] = {

	-- enable
	["Enable"] = true,

	-- styling
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
	
	["PercentageTags"] = true,
	["RaidIcon"] = true,
	["RaidIconSize"] = 24,

	-- castbar
	["CastBar"] = true,
	["CastBarText"] = true,
	["CastBarUnlink"] = false,
	["CastHeight"] = 10,
	["CastWidth"] = 160,
	["CastFont"] = "MaxUI Outlined",
	["CastFontSize"] = 10,
	["CastTexture"] = "Tukui",

	-- sizing
	["HealthHeight"] = 30,
	["HealthWidth"] = 160,
	["PowerHeight"] = 8,
	["PowerWidth"] = 100,
	
	-- font
	["HealthFont"] = "MaxUI Outlined",
	["PowerFont"] = "MaxUI Outlined",
	["NameFont"] = "MaxUI Outlined",
	
	["HealthFontSize"] = 12,
	["PowerFontSize"] = 10,
	["NameFontSize"] = 12,

	-- texture
	["HealthTexture"] = "Tukui",
	["PowerTexture"] = "Tukui",
	
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
			["|cffFFFF99Side|r"] = "Side",
			["Overlay"] = "Overlay",
		},	
		["Value"] = "None",
	},

	-- combat state
	["NonCombatAlpha"] = 1,
	["NonCombatAlphaEnable"] = true,
}

-- UF:TARGETOFTARGET 
C["UF: ToT"] = {

	-- enable
	["Enable"] = true,

	-- color
	["ColorThreat"] = false, 

	-- styling
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

	-- icons
	["PercentageTags"] = true,
	["RoleIcon"] = true,
	["RoleIconSize"] = 24,
	["RaidIcon"] = true,
	["RaidIconSize"] = 24,

	-- sizing
	["HealthHeight"] = 30,
	["HealthWidth"] = 160,
	["PowerHeight"] = 8,
	["PowerWidth"] = 100,
	
	-- font
	["HealthFont"] = "MaxUI Outlined",
	["PowerFont"] = "MaxUI Outlined",
	["NameFont"] = "MaxUI Outlined",
	
	-- texture
	["HealthFontSize"] = 12,
	["PowerFontSize"] = 10,
	["NameFontSize"] = 12,

	["HealthTexture"] = "Tukui",
	["PowerTexture"] = "Tukui",
	
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
			["Side"] = "Side",
			["Overlay"] = "Overlay",
		},	
		["Value"] = "None",
	},
	
	-- combat state
	["NonCombatAlpha"] = 1,
	["NonCombatAlphaEnable"] = true,
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

C["UnitFrames"]["FocusTargetHealthTag"] = {
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

	-- enable
	["Enable"] = true,
	["EnableFT"] = true,
	
	-- color
	["ColorThreat"] = false, 

	-- styling
	
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

	["FocusTargetNameTag"] = {
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

	["PercentageTags"] = false,
	["RoleIcon"] = true,
	["RoleIconSize"] = 24,
	["RoleIcon"] = true,
	["RaidIconSize"] = 24,

	-- castbar
	["CastBar"] = true,
	["CastIcon"] = false,

	-- sizing
	["HealthHeight"] = 30,
	["HealthWidth"] = 160,
	["PowerHeight"] = 10,
	["PowerWidth"] = 100,
	
	-- font
	["PowerFont"] = "MaxUI Outlined",
	["HealthFont"] = "MaxUI Outlined",
	["NameFont"] = "MaxUI Outlined",
	["CastFont"] = "MaxUI Outlined",
	
	["HealthFontSize"] = 10,
	["PowerFontSize"] = 10,
	["CastFontSize"] = 10,
	["NameFontSize"] = 12,

	-- texture
	["PowerTexture"] = "Tukui",
	["HealthTexture"] = "Tukui",
	["CastTexture"] = "Tukui",
	
	-- buffs
	["Buffs"] = true,
	
	-- debuffs
	["Debuffs"] = true,
	
	-- portrait
	["PortraitOverlayAlpha"] = 0.5,
	["PortraitStyle"] = {
		["Options"] = {
			["None"] = "None",
			["Side"] = "Side",
			["Overlay"] = "Overlay",
		},	
		["Value"] = "None",
	},
	
	-- combat state
	["NonCombatAlpha"] = 1,
	["NonCombatAlphaEnable"] = true,
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
	-- enable

	-- color
	["ColorThreat"] = false, 

	-- styling
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

	["PercentageTags"] = true,
	["RoleIcon"] = true,
	["RaidIconSize"] = 24,

	-- castbar
	["CastBar"] = true,
	["CastIcon"] = true,
	
	-- sizing
	["HealthHeight"] = 32,
	["HealthWidth"] = 180,
	["PowerHeight"] = 10,
	["PowerWidth"] = 130,
	["Spacing"] = 50,
	
	-- font
	["PowerFont"] = "MaxUI Outlined",
	["HealthFont"] = "MaxUI Outlined",
	["CastFont"] = "MaxUI Outlined",
	["NameFont"] = "MaxUI Outlined",
	
	["HealthFontSize"] = 12,
	["PowerFontSize"] = 10,
	["CastFontSize"] = 12,
	["NameFontSize"] = 12,

	-- texture
	["PowerTexture"] = "Tukui",
	["HealthTexture"] = "Tukui",
	["CastTexture"] = "Tukui",
	
	-- buffs
	["Buffs"] = true,

	-- debuffs
	["Debuffs"] = true,
	
	-- portrait
	["PortraitOverlayAlpha"] = 0.5,
	["PortraitStyle"] = {
		["Options"] = {
			["None"] = "None",
			["Side"] = "Side",
			["Overlay"] = "Overlay",
		},	
		["Value"] = "None",
	},
}

-- UF:ARENA
C["UF: Arena"] = {

	-- enable
	["Enable"] = true,

	-- styling
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

	["PercentageTags"] = true,
	["RaidIcon"] = true,
	["RaidIconSize"] = 24,
	--["RoleIcon"] = true,
	["SpecIcon"] = true,
	["Trinket"] = true,

	-- castbar
	["CastBar"] = true,
	["CastIcon"] = true,

	-- sizing
	["HealthHeight"] = 32,
	["HealthWidth"] = 180,
	["PowerHeight"] = 10,
	["PowerWidth"] = 130,
	["Spacing"] = 50,
	
	-- font
	["PowerFont"] = "MaxUI Outlined",
	["HealthFont"] = "MaxUI Outlined",
	["CastFont"] = "MaxUI Outlined",
	["NameFont"] = "MaxUI Outlined",
	
	["HealthFontSize"] = 12,
	["PowerFontSize"] = 10,
	["CastFontSize"] = 12,
	["NameFontSize"] = 12,

	-- texture
	["PowerTexture"] = "Tukui",
	["HealthTexture"] = "Tukui",
	["CastTexture"] = "Tukui",
	
	-- buffs
	["Buffs"] = true,
	
	-- debuffs
	["Debuffs"] = true,
	
	-- portrait
	["PortraitOverlayAlpha"] = 0.5,
	["PortraitStyle"] = {
		["Options"] = {
			["None"] = "None",
			["Side"] = "Side",
			["Overlay"] = "Overlay",
		},	
		["Value"] = "None",
	},
	
	-- combat state
	["NonCombatAlpha"] = 1,
	["NonCombatAlphaEnable"] = true,
}