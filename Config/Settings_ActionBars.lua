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
-- ACTIONBARS
------------------------------------------------------------------------------------------
-- enable
C["ActionBars"]["Enable"] = true
-- C["Layout"]["LayoutCustomize"]["Value"] = "Fixed"
C["ActionBars"]["MultiCastBar"] = true

-- styling
C["ActionBars"]["ABAlpha"] = 0.7
C["ActionBars"]["EquipBorder"] = true
C["ActionBars"]["AutoAddNewSpell"] = false

-- proc anim
C["ActionBars"]	["ProcAnim"] = false
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

--font
C["ActionBars"]["Font"] = "MaxUI Outlined"
C["ActionBars"]["ABFontSize"] = 10

-- cooldown text
C["ActionBars"]["CooldownFlash"] = false
C["ActionBars"]["CoolDown"] = true
C["Cooldowns"]["Font"] = "MaxUI Outlined"
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
C["ActionBars"]["HotKey"] = true
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
C["ActionBars"]["Macro"] = false
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

------------------------------------------------------------------------------------------
-- BAR 1-8
------------------------------------------------------------------------------------------
-- general
C["ActionBars"]["ButtonSpacing"] = 4

-- actionbar 1
C["ActionBars"]["SwitchBarOnStance"] = true
C["ActionBars"]["Bar1ButtonsPerRow"] = 4
C["ActionBars"]["Bar1NumButtons"] = 12
C["ActionBars"]["ActionBar1ButtonSize"] = 26
C["ActionBars"]["Actionbar1"] = {
	["Options"] = {
		["Show"] = "Show",
		["Hide"] = "Hide",	
		["Mouseover"] = "Mouseover",
	},
	["Value"] = "Show",
}
C["ActionBars"]["ActionBar1Alpha"] = 0.4
C["ActionBars"]["ActionBar1CombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}
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
C["ActionBars"]["ActionBar1Backdrop"] = true

-- actionbar 2
C["ActionBars"]["BottomLeftBar"] = true
C["ActionBars"]["Bar2ButtonsPerRow"] = 6
C["ActionBars"]["Bar2NumButtons"] = 12
C["ActionBars"]["ActionBar2ButtonSize"] = 26
C["ActionBars"]["Actionbar2"] = {
	["Options"] = {
		["Show"] = "Show",
		["Hide"] = "Hide",	
		["Mouseover"] = "Mouseover",
	},
	["Value"] = "Show",
}
C["ActionBars"]["ActionBar2Alpha"] = 0.4
C["ActionBars"]["ActionBar2CombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
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
C["ActionBars"]["ActionBar2Backdrop"] = true

-- actionbar 3
C["ActionBars"]["BottomRightBar"] = true
C["ActionBars"]["Bar3ButtonsPerRow"] = 4
C["ActionBars"]["Bar3NumButtons"] = 12
C["ActionBars"]["ActionBar3ButtonSize"] = 26
C["ActionBars"]["Actionbar3"] = {
	["Options"] = {
		["Show"] = "Show",
		["Hide"] = "Hide",	
		["Mouseover"] = "Mouseover",
	},
	["Value"] = "Show",
}
C["ActionBars"]["ActionBar3Alpha"] = 0.4
C["ActionBars"]["ActionBar3CombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
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
C["ActionBars"]["ActionBar3Backdrop"] = true

-- actionbar 4
C["ActionBars"]["RightBar"] = true
C["ActionBars"]["Bar4ButtonsPerRow"] = 6
C["ActionBars"]["Bar4NumButtons"] = 12
C["ActionBars"]["ActionBar4ButtonSize"] = 26
C["ActionBars"]["Actionbar4"] = {
	["Options"] = {
		["Show"] = "Show",
		["Hide"] = "Hide",	
		["Mouseover"] = "Mouseover",
	},
	["Value"] = "Show",
}
C["ActionBars"]["ActionBar4Alpha"] = 0.4
C["ActionBars"]["ActionBar4CombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
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
C["ActionBars"]["ActionBar4Backdrop"] = true

-- actionbar 5
C["ActionBars"]["LeftBar"] = true
C["ActionBars"]["Bar5ButtonsPerRow"] = 6
C["ActionBars"]["Bar5NumButtons"] = 12
C["ActionBars"]["ActionBar5ButtonSize"] = 26
C["ActionBars"]["Actionbar5"] = {
	["Options"] = {
		["Show"] = "Show",
		["Hide"] = "Hide",	
		["Mouseover"] = "Mouseover",
	},
	["Value"] = "Show",
}
C["ActionBars"]["ActionBar5Alpha"] = 0.4
C["ActionBars"]["ActionBar5CombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
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
C["ActionBars"]["ActionBar5Backdrop"] = true

-- actionbar 6
C["ActionBars"]["Bar6"] = false
C["ActionBars"]["Bar6ButtonsPerRow"] = 1
C["ActionBars"]["Bar6NumButtons"] = 12
C["ActionBars"]["ActionBar6ButtonSize"] = 26
C["ActionBars"]["Actionbar6"] = {
	["Options"] = {
		["Show"] = "Show",
		["Hide"] = "Hide",	
		["Mouseover"] = "Mouseover",
	},
	["Value"] = "Show",
}
C["ActionBars"]["ActionBar6Alpha"] = 0.4
C["ActionBars"]["ActionBar6CombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
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
C["ActionBars"]["ActionBar6Backdrop"] = true

-- actionbar 7
C["ActionBars"]["Bar7"] = false
C["ActionBars"]["Bar7ButtonsPerRow"] = 1
C["ActionBars"]["Bar7NumButtons"] = 12
C["ActionBars"]["ActionBar7ButtonSize"] = 26
C["ActionBars"]["Actionbar7"] = {
	["Options"] = {
		["Show"] = "Show",
		["Hide"] = "Hide",	
		["Mouseover"] = "Mouseover",
	},
	["Value"] = "Show",
}
C["ActionBars"]["ActionBar7Alpha"] = 0.4
C["ActionBars"]["ActionBar7CombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
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
C["ActionBars"]["ActionBar7Backdrop"] = true

-- actionbar 8
C["ActionBars"]["Bar8"] = false
C["ActionBars"]["Bar8ButtonsPerRow"] = 1
C["ActionBars"]["Bar8NumButtons"] = 12
C["ActionBars"]["ActionBar8ButtonSize"] = 26
C["ActionBars"]["Actionbar8"] = {
	["Options"] = {
		["Show"] = "Show",
		["Hide"] = "Hide",	
		["Mouseover"] = "Mouseover",
	},
	["Value"] = "Show",
}
C["ActionBars"]["ActionBar8Alpha"] = 0.4
C["ActionBars"]["ActionBar8CombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
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
C["ActionBars"]["ActionBar8Backdrop"] = true

------------------------------------------------------------------------------------------
-- SPECIAL BARS
------------------------------------------------------------------------------------------
-- general
-- same general buttonspacing option

-- pet
C["ActionBars"]["Pet"] = true
C["ActionBars"]["BarPetButtonsPerRow"] = 10
C["ActionBars"]["PetButtonSize"] = 30
C["ActionBars"]["PetBarButtonSize"] = 30 -- not used in gui?
C["ActionBars"]["Petbar"] = {
	["Options"] = {
		["Show"] = "Show",
		["Hide"] = "Hide",	
		["Mouseover"] = "Mouseover",
	},
	["Value"] = "Show",
}
C["ActionBars"]["PetBarAlpha"] = 0.4
C["ActionBars"]["ActionBarPetCombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
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
C["ActionBars"]["PetBarBackdrop"] = true

-- stance
C["ActionBars"]["ShapeShift"] = true
C["ActionBars"]["StancebarLayout"] = {
	["Options"] = {
		["Horizontal"] = "Horizontal",
		["Vertical"] = "Vertical",
	},
	["Value"] = "Horizontal",
}
C["ActionBars"]["StanceBarButtonSize"] = 30
C["ActionBars"]["Stancebar"] = {
	["Options"] = {
		["Show"] = "Show",
		["Hide"] = "Hide",	
		["Mouseover"] = "Mouseover",
	},
	["Value"] = "Show",
}
C["ActionBars"]["StanceBarAlpha"] = 0.4

C["ActionBars"]["ActionBarStanceCombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
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
C["ActionBars"]["StanceBarBackdrop"] = true

-- extra bar / zone bar
C["ActionBars"]["ExtraBarEnable"] = true
C["ActionBars"]["ExtraBarButtonSize"] = 48
C["ActionBars"]["Extrabar"] = {
	["Options"] = {
		["Show"] = "Show",
		["Hide"] = "Hide",	
		["Mouseover"] = "Mouseover",
	},
	["Value"] = "Show",
}
C["ActionBars"]["ExtraBarAlpha"] = 1
C["ActionBars"]["ActionBarExtraCombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
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
C["ActionBars"]["ExtraBarBackdrop"] = true

-- trinketbar
C["ActionBars"]["TrinketBarEnable"] = false
C["ActionBars"]["TrinketBarLayout"] = {
	["Options"] = {
		["Horizontal"] = "Horizontal",
		["Vertical"] = "Vertical",
	},
	["Value"] = "Horizontal",
}
C["ActionBars"]["TrinketBarButtonSize"] = 36
C["ActionBars"]["TrinketBar"] = {
	["Options"] = {
		["Show"] = "Show",
		["Hide"] = "Hide",	
		["Mouseover"] = "Mouseover",
	},
	["Value"] = "Show",
}
C["ActionBars"]["TrinketBarAlpha"] = 1
C["ActionBars"]["TrinketBarCombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
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
C["ActionBars"]["TrinketBarBackdrop"] = true