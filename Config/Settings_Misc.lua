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
-- AURAS
------------------------------------------------------------------------------------------
-- enable
C["Auras"]["Enable"] = true

-- styling
C["Auras"]["Flash"] = false
C["Auras"]["ClassicTimer"] = true
C["Auras"]["HideBuffs"] = false
C["Auras"]["HideDebuffs"] = false
C["Auras"]["Animation"] = false
C["Auras"]["BuffsPerRow"] = 10

-- font
C["Auras"]["Font"] = "MaxUI Outlined"
C["Auras"]["AurasFontSize"] = 12

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

-- position
C["Auras"]["Position"] = {
	["Options"] = {
		["Top left"] = "Left",
		["Center"] = "Center",	
		["Top right"] = "Right",
	},
	["Value"] = "Center",
}

-- sizing
C["Auras"]["AurasBarSize"] = 8
C["Auras"]["AurasSize"] = 100 -- not working correctly/updating

-- combat state
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
-- enable
C["Bags"]["Enable"] = true
--C["Bags"]["ReagentInsideBag"] = false
C["Bags"]["ItemLevel"] = true

-- styling
C["Bags"]["IdentifyQuestItems"] = true
C["Bags"]["FlashNewItems"] = true
C["Bags"]["ReagentBagColor"] = {0.68, 0.83, 0.51}

-- sizing
C["Bags"]["ButtonSize"] = 30
C["Bags"]["Spacing"] = 4
C["Bags"]["ItemsPerRow"] = 11

-- sorting
C["Bags"]["SortToBottom"] = true

-- reagent bag
C["Bags"]["ReagentInsideBag"] = false
C["Bags"]["PositionReagentBag"] = {
	["Options"] = {
		["Top"] = "TOP",
		["Bottom"] = "BOTTOM",
		["Topleft"] = "TOPLEFT",
	},
	["Value"] = "BOTTOM",
}

-- fonts
C["Bags"]["Font"] = "MaxUI Outlined"
C["Bags"]["FontSize"] = 12

-- auto sell and repair
C["Misc"]["AutoSellJunk"] = true
C["Misc"]["AutoRepair"] = true

------------------------------------------------------------------------------------------	
-- CHARACTER INFO	
------------------------------------------------------------------------------------------
C["CharacterInfo"] = {
	["Itemlevel"] = true
}

------------------------------------------------------------------------------------------
-- CHAT
------------------------------------------------------------------------------------------
-- enable
C["Chat"]["Enable"] = true
C["Chat"]["WhisperSound"] = true

-- fading and logging
C["Chat"]["TextFading"] = false
C["Chat"]["TextFadingTimer"] = 60
C["Chat"]["LogMax"] = 10

-- bubbles
C["Chat"]["Bubbles"]["Value"] = "All"
C["Chat"]["SkinBubbles"] = true
C["Chat"]["BubblesNames"] = true
C["Chat"]["BubblesTextSize"] = 10

-- size
C["Chat"]["LeftWidth"] = 392
C["Chat"]["LeftHeight"] = 183
C["Chat"]["RightWidth"] = 392
C["Chat"]["RightHeight"] = 183

-- styling
C["Chat"]["ShortChannelName"] = true
C["Chat"]["ScrollByX"] = 3
C["Chat"]["LinkBrackets"] = true
C["Chat"]["LinkColor"] = {0.08, 1, 0.36}
C["Chat"]["RightChatAlignRight"] = true

-- font
C["Chat"]["TabFont"] = "MaxUI Outlined"
C["Chat"]["ChatFont"] = "MaxUI"
C["Chat"]["TabFontSize"] = 12

-- background & textures
C["Chat"]["BackgroundAlpha"] = 70
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
C["Chat"]["Chattexture"] = "sRainbow2"
C["Chat"]["ChattextureAlpha"] = 0.6
C["Chat"]["ChattextureColor"] = {0.11, 0.11, 0.11}

-- headers
C["Chat"]["Headers"] = false
C["Chat"]["TabDividers"] = false

-- position
C["Chat"]["Position"] = {
	["Options"] = {
		["Top Corners"] = "Top",
		["Bottom Corners"] = "Bottom",
	},
	["Value"] = "Bottom",
}
C["Chat"]["UnlinkEditBox"] = false

-- chat tools
C["Chat"]["ChatShortcuts"] = true
C["Chat"]["ChatShortcutsPosition"] = {
	["Options"] = {
		["Topleft"] = "Topleft",
		["Topright"] = "Topright",
		["Unanchored / movable"] = "Unanchored",
	},	
	["Value"] = "Topright",
}
C["Chat"]["ChatShortcutsButtonHeight"] = 14
C["Chat"]["ChatShortcutsButtonWidth"] = 14
C["Chat"]["ChatAndEmoteIcon"] = true

-- combat state
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
-- DATABARS
------------------------------------------------------------------------------------------
-- Misc should be converted to databars...

-- settings
C["Misc"]["PercentageTag"] = true

-- threatbar
C["Misc"]["ThreatBar"] = true
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

-- experience
C["Misc"]["XPBarEnable"] = true
C["Misc"]["XPBarDTEnable"] = true
C["Misc"]["XPBarHeight"] = 12
C["Misc"]["XPBarWidth"] = 200
C["Misc"]["XPBarTextPlacement"] = {
	["Options"] = {
		["Inside"] = "Inside",
		["Outside"] = "Outside",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Inside",
}
C["Misc"]["XPBarTexture"] = "Tukui"
C["Misc"]["XPBarBackdrop"] = true
C["Misc"]["XPBarAlpha"] = 0.7
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
C["Misc"]["REPBarTextPlacement"] = {
	["Options"] = {
		["Inside"] = "Inside",
		["Outside"] = "Outside",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Inside",
}
C["Misc"]["REPBarTexture"] = "Tukui"
C["Misc"]["REPBarBackdrop"] = true
C["Misc"]["REPBarAlpha"] = 0.7
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
C["Misc"]["HONORBarTextPlacement"] = {
	["Options"] = {
		["Inside"] = "Inside",
		["Outside"] = "Outside",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Inside",
}
C["Misc"]["HONORBarTexture"] = "Tukui"
C["Misc"]["HONORBarBackdrop"] = true
C["Misc"]["HONORBarAlpha"] = 0.7
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
C["Misc"]["AZERITEBarTextPlacement"] = {
	["Options"] = {
		["Inside"] = "Inside",
		["Outside"] = "Outside",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Inside",
}
C["Misc"]["AZERITEBarTexture"] = "Tukui"
C["Misc"]["AZERITEBarBackdrop"] = true
C["Misc"]["AZERITEBarAlpha"] = 0.7
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
C["Misc"]["ANIMABarTextPlacement"] = {
	["Options"] = {
		["Inside"] = "Inside",
		["Outside"] = "Outside",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Inside",
}
C["Misc"]["ANIMABarTexture"] = "Tukui"
C["Misc"]["ANIMABarBackdrop"] = true
C["Misc"]["ANIMABarAlpha"] = 0.7
C["Misc"]["ANIMABarCombatState"] = {
	["Options"] = {
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}

------------------------------------------------------------------------------------------
-- DATATEXTS
------------------------------------------------------------------------------------------
-- enable
C["DataTexts"]["Battleground"] = true
C["DataTexts"]["HideFriendsNotPlaying"] = true

-- color
C["DataTexts"]["NameColor"] = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
C["DataTexts"]["ValueColor"] = {1, 1, 1}
C["DataTexts"]["HighlightColor"] = {1, 1, 0}
C["DataTexts"]["ClassColor"] = false

-- font
C["DataTexts"]["Font"] = "MaxUI Outlined"
C["DataTexts"]["FontSize"] = 12

-- maxui settings
C["DataTexts"]["Icons"] = false
C["DataTexts"]["ScreenSpacing"] = 6

-- top dt
C["DataTexts"]["Topline"] = true
C["DataTexts"]["AmountTopDataTexts"] = 9
C["DataTexts"]["ToplineCombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}

-- bottom dt
C["DataTexts"]["Bottomline"] = true	
C["DataTexts"]["AmountBottomDataTexts"] = 9
C["DataTexts"]["BottomlineCombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}

-- dt center
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
-- enable
C["Loot"]["Enable"] = true

-- font
C["Loot"]["Font"] = "MaxUI Outlined"
C["Loot"]["FontSize"] = 12

-- group loot module
C["Loot"]["GroupLootHeaderHeight"] = 10
C["Loot"]["GroupLootSpacing"] = 30


------------------------------------------------------------------------------------------	
-- MAPS
------------------------------------------------------------------------------------------
-- minimap
C["Location"] = {}

-- minimap
C["Location"]["MinimapEnable"] = true
C["Maps"]["MinimapCoords"] = false
C["Location"]["Compass"] = false
C["Maps"]["MinimapTracking"] = false
C["Location"]["MinimapRectangular"] = false
C["Location"]["Position"] = {
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
}
C["General"]["MinimapScale"] = 120
C["Location"]["MinimapCombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}	

-- worldmap
C["Misc"]["WorldMapEnable"] = true
C["Misc"]["FadeWorldMapAlpha"] = 100
C["General"]["WorldMapScale"] = 60
C["Location"]["WorldmapCombatState"] = {
	["Options"] = {
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}


-- objective tracker
C["Quests"] = {}

C["Misc"]["ObjectiveTracker"] = true
C["Quests"]["QuestHeaderLines"] = true
C["Quests"]["TrackerCollapsedOnLogin"] = false
C["Quests"]["TrackerFixed"] = true
C["Quests"]["FilterTracking"] = {
	["Options"] = {
		["All quests"] = "All",	
		["Only current zone quests"] = "Zone",
	},
	["Value"] = "All",
}
C["Quests"]["QuestTrackerCombatState"] = {
	["Options"] = {
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}
C["Misc"]["ObjectiveFontSize"] = 12
C["Quests"]["QuestProgressTexture"] = "Tukui"

------------------------------------------------------------------------------------------
-- MISC
------------------------------------------------------------------------------------------
C["Tools"] = {}

-- widgets
C["Misc"]["DisplayWidgetPowerBar"] = true

-- micro menu
--C["Misc"]["BlizzardMicroMenu"] = false -- use?
C["Misc"]["MicroStyle"]["Value"] = "Game Menu"
C["Misc"]["MicroToggle"]["Value"] = "ALT-M"
--C["Misc"]["MicroStyle"]["Options"]["|cffFFFF99Micro Game Menu|r"] = "MaxUI Micro Menu"
--C["Misc"]["MicroStyle"]["Value"] = "MaxUI Micro Menu"

-- game menu
C["Tools"]["GameMenu"] = true

-- meters
C["Tools"]["Meters"] = true

-- buff tracker
C["Tools"]["RaidBuffTracking"] = true

-- raid tools
C["Tools"]["RaidTools"] = true

-- item level
C["Misc"]["ItemLevel"] = true

-- screen saver
C["Misc"]["AFKSaver"] = true

-- UI Error frame
C["Misc"]["ErrorSpeechEnable"] = true
C["Misc"]["UIErrorFont"] = "MaxUI Outlined"
C["Misc"]["UIErrorSize"] = 16
C["Misc"]["ErrorSpeechCombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}

-- Talking head
C["Misc"]["TalkingHeadEnable"] = true

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
-- Scrolling Combat Text
------------------------------------------------------------------------------------------
C["Scrolling Text"] = {
	
	-- Healing
	["Healing"] = {
		["Options"] = {
			["Show"] = "Show",
			["Hide"] = "Hide",
		},
		["Value"] = "Show",
	},
	-- absorb / shields
	["Shields"] = {
		["Options"] = {
			["Show"] = "Show",
			["Hide"] = "Hide",
		},
		["Value"] = "Show",
	},
	-- damage
	["Damage"] = {
		["Options"] = {
			["Show"] = "Show",
			["Hide"] = "Hide",
		},
		["Value"] = "Show",
	},
	-- pet
	["Pet"] = {
		["Options"] = {
			["Show"] = "Show",
			["Hide"] = "Hide",
		},
		["Value"] = "Show",
	},
	-- customize
	["Direction"] = false,
	["FloatMode"] = {
		["Options"] = {
			["Up"] = "Up",
			["Down"] = "Down",
		},
		["Value"] = "Up",
	},
	["Scale"] = 0.5,
	["YOffset"] = 0.03,
}

-- from the unitframes section: floating text on self
C["UnitFrames"]["ScrollingCombatText"] = false
C["UnitFrames"]["ScrollingCombatTextFont"] = "MaxUI Outlined"
C["UnitFrames"]["ScrollingCombatTextFontSize"] = 32
C["UnitFrames"]["ScrollingCombatTextIcon"] = true
C["UnitFrames"]["ScrollingCombatTextRadius"] = 120
C["UnitFrames"]["ScrollingCombatTextDisplayTime"] = 1.5
C["UnitFrames"]["ScrollingCombatTextAnim"]["Value"] = "fountain"

------------------------------------------------------------------------------------------
-- TOOLTIPS
------------------------------------------------------------------------------------------
C["Tooltips"]["Enable"] = true
C["Tooltips"]["DisplayTitle"] = false
C["Tooltips"]["UnitHealthText"] = true
C["Tooltips"]["AlwaysCompareItems"] = true

C["Tooltips"]["ItemBorderColor"] = true
C["Tooltips"]["UnitBorderColor"] = true
C["Tooltips"]["HideInCombat"] = false
C["Tooltips"]["MouseOver"] = false

C["Tooltips"]["HealthFont"] = "MaxUI Outlined"
C["Tooltips"]["HealthFontSize"] = 12

C["Tooltips"]["TooltipAlpha"] = 0.7

--C["Tooltips"]["MythicPlusInfo"] = true
--C["Tooltips"]["TooltipSpellInfo"] = true