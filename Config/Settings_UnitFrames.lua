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
-- UNITFRAMES
------------------------------------------------------------------------------------------
-- enable
C["UnitFrames"]["Enable"] = true

-- styling
C["UnitFrames"]["Style"] = {
	["Options"] = {
		["|cffFFFF99MaxUI|r"] = "MaxUI",
		["Tukui"] = "Tukui",
	},
	["Value"] = "MaxUI",
}
C["UnitFrames"]["HorVer"] = {
	["Options"] = {
		["Vertical"] = "Vertical",
		["Horizontal"] = "Horizontal",
	},
	["Value"] = "Horizontal",
}

-- Settings
C["UnitFrames"]["Smoothing"] = true
C["UnitFrames"]["Smooth"] = true
C["UnitFrames"]["StatusBarBackgroundMultiplier"] = 25
C["UnitFrames"]["RangeAlpha"] = 0.3

-- UnitFrame anchor options
C["UnitFrames"]["MaxUIAnchor"] = false
C["UnitFrames"]["MaxUIAnchorWidth"] = 0
C["UnitFrames"]["MaxUIAnchorVertical"] = 0

-- health statusbar
C["UnitFrames"]["Colorstyle"] = {
	["Options"] = {
		["|cff202020Dark|r"] = "Dark",
		["|cff00FF00G|r|cff80FF00r|r|cff80FF00a|r|cffFFFF00d|r|cffFFFF00i|r|cffFF8000e|r|cffFF8000n|r|cffFF0000t|r"] = "Gradient",
		["" ..ClassTextColor .."Class".. "|r and |cff00FF00reaction|r"] = "Class",
		["Custom"] = "Custom",	
	},
	["Value"] = "Class",	
}
C["UnitFrames"]["StatusBarColor"] = {.2, .2, .2}
C["UnitFrames"]["ColorTexture"] = {233/255, 0, 18/255}
C["UnitFrames"]["TargetEnemyHostileColor"] = false

-- Healcomm
C["UnitFrames"]["HealComm"] = true
C["UnitFrames"]["HealCommAlpha"] = 0.6 
C["UnitFrames"]["HealCommSelfColor"] = {0.29, 1, 0.30}
C["UnitFrames"]["HealCommOtherColor"] = {1, .72, 0.30}
C["UnitFrames"]["HealCommAbsorbColor"] = {1, 1, 0.36}

-- value / tag color
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

-- names

-- castbar
C["UnitFrames"]["CastBar"] = true -- don't disable!
C["UnitFrames"]["CastingColor"] = {0.29, 0.77, 0.30}
C["UnitFrames"]["ChannelingColor"] = {0.29, 0.77, 0.30}
C["UnitFrames"]["NotInterruptibleColor"] = {0.85, 0.09, 0.09}
C["UnitFrames"]["CastBarLatency"] = true

-- buffs / debuffs
C["UnitFrames"]["AurasBelow"] = false
C["UnitFrames"]["DesaturateDebuffs"] = true
C["UnitFrames"]["FlashRemovableBuffs"] = true

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

-- combat feedback
C["UnitFrames"]["CombatLog"] = true

-- Marking and icons
C["UnitFrames"]["Roles"] = {
	["Options"] = {
		["MaxUI Role Icons"] = "MaxUI Style",
		["ElvUI Role Icons"] = "Elvui Style",
		["Blizzard Role Icons"] = "Blizzard Style",
		["None"] = "No Icons",	
	},
	["Value"] = "MaxUI Style",	
}

-- highlighting
C["UnitFrames"]["HighlightSize"] = 10
C["UnitFrames"]["HighlightColor"] = {0, 1, 0}

-- portraits
C["UnitFrames"]["Portrait"] = true
C["UnitFrames"]["Portrait2D"] = false



------------------------------------------------------------------------------------------	
-- CLASS OPTIONS	
------------------------------------------------------------------------------------------
C["ClassOptions"] = {}

-- enable
C["UnitFrames"]["ClassBar"] = true

-- styling
C["ClassOptions"]["ClassPowerStyle"] = {
	["Options"] = {
		["|cffFFFF99MaxUI|r"] = "MaxUI",
		["Tukui"] = "Tukui",
	},
	["Value"] = "MaxUI",
}
C["ClassOptions"]["ClassPowerBackdrop"] = false
C["ClassOptions"]["ClassPowerTexture"] = "Tukui"	

-- settings
C["ClassOptions"]["ClassResourcesOrientation"] = {
	["Options"] = {
		["Vertical"] = "Vertical",
		["Horizontal"] = "Horizontal",
	},
	["Value"] = "Horizontal",
}
C["ClassOptions"]["ClassPowerWidth"] = 12
C["ClassOptions"]["ClassPowerHeight"] = 12
C["ClassOptions"]["ClassPowerSpace"] = 10
C["ClassOptions"]["ClassPowerMover"] = true

-- resource ticker	
C["UnitFrames"]["PowerTick"] = true
C["ClassOptions"]["MaxUITicker"] = false
C["ClassOptions"]["MaxUITickerLength"] = 140
C["ClassOptions"]["OrientationTicker"] = {
	["Options"] = {
		["Vertical"] = "Vertical",
		["Horizontal"] = "Horizontal",
	},
	["Value"] = "Horizontal",
}
	
-- combat state
C["ClassOptions"]["ClassResourcesCombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}

-- deathknight
C["ClassOptions"]["Deathknight"] = true

-- demonhunter
C["ClassOptions"]["Demonhunter"] = true

-- druid
C["ClassOptions"]["Druid"] = true
C["ClassOptions"]["DruidAdditionalPower"] = true
--C["ClassOptions"]["ComboBar"] = true -- set for rogue

-- evoker
C["ClassOptions"]["Evoker"] = true

-- hunter
C["ClassOptions"]["Hunter"] = true

-- mage
C["ClassOptions"]["Mage"] = true

-- monk
C["ClassOptions"]["Monk"] = true

-- paladin
C["ClassOptions"]["Paladin"] = true

-- priest
C["ClassOptions"]["PriestAtonement"] = true
C["ClassOptions"]["PriestAdditionalPower"] = true

-- rogue
C["ClassOptions"]["Rogue"] = true
C["ClassOptions"]["ComboBar"] = true

-- shaman
C["UnitFrames"]["TotemBar"] = T.MyClass == "SHAMAN" and true or false
C["UnitFrames"]["TotemBarStyle"] = {
	["Options"] = {
		["Totem bar"] = "On Screen",
		["Status bars"] = "On Player",
	},

	["Value"] = "On Screen",
}
C["ClassOptions"]["ShamanTotemSize"] = 32
C["ClassOptions"]["ShamanTotemSpace"] = 4
C["ClassOptions"]["ShamanAdditionalPower"] = true

-- warlock
C["ClassOptions"]["Warlock"] = true

-- warrior
C["ClassOptions"]["Warrior"] = true


------------------------------------------------------------------------------------------
-- PLAYER
------------------------------------------------------------------------------------------
C["UF: Player"] = {}

-- enable
C["UF: Player"]["Enable"] = true

-- settings
C["UF: Player"]["PercentageTags"] = true
C["UF: Player"]["CombatLog"] = true

-- health
C["UF: Player"]["HealthHeight"] = 36
C["UF: Player"]["HealthWidth"] = 200
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
C["UF: Player"]["HealthFont"] = "MaxUI Outlined"
C["UF: Player"]["HealthFontSize"] = 12
C["UF: Player"]["HealthTexture"] = "Tukui"

-- power
C["UF: Player"]["PowerHeight"] = 12
C["UF: Player"]["PowerWidth"] = 140
C["UF: Player"]["PowerTag"] = {
	["Options"] = {
		["None"] = "",
		["current"] = "[MaxUI:PowerColor][MaxUI:CurPP]",
		["percent"] = "[MaxUI:PowerColor][perpp]%",
		["current - percent"] = "[MaxUI:PowerColor][MaxUI:CurPP] - [perpp]%",
		["missing"] = "[MaxUI:PowerColor]-[MaxUI:MisPP]",
		["current | max"] = "[MaxUI:PowerColor][MaxUI:CurPP] | [MaxUI:MaxPP]",
	},
	["Value"] = "[MaxUI:PowerColor][MaxUI:CurPP] | [MaxUI:MaxPP]",
}
C["UF: Player"]["PowerFont"] = "MaxUI Outlined"
C["UF: Player"]["PowerFontSize"] = 10
C["UF: Player"]["PowerTexture"] = "Tukui"
	
-- name
C["UF: Player"]["NameTag"] = {
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
}

C["UF: Player"]["NameFont"] = "MaxUI Outlined"
C["UF: Player"]["NameFontSize"] = 14

	-- description
C["UF: Player"]["DescriptionTag"] = {
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
}
C["UF: Player"]["DescFontSize"] = 12

	-- castbar
C["UF: Player"]["CastBar"] = true
C["UF: Player"]["CastBarIcon"] = true
C["UF: Player"]["CastBarText"] = true
C["UF: Player"]["CastBarTime"] = true
C["UF: Player"]["CastFont"] = "MaxUI Outlined"
C["UF: Player"]["CastFontSize"] = 12
C["UF: Player"]["CastTexture"] = "Tukui"

C["UF: Player"]["CastBarUnlink"] = true
C["UF: Player"]["CastHeight"] = 12
C["UF: Player"]["CastWidth"] = 200

C["UF: Player"]["StandAloneCastBar"] = false
C["UF: Player"]["StandAloneCastBarTimeOffsetV"] = -16
C["UF: Player"]["StandAloneCastBarTextOffsetV"] = -16
--C["UF: Player"]["CastHeight"] = 12
--C["UF: Player"]["CastWidth"] = 200
	
-- buffs
C["UnitFrames"]["PlayerBuffs"] = true
C["UF: Player"]["OnlySelfBuffs"] = true
C["UF: Player"]["BuffSize"] = 22
C["UF: Player"]["BuffNumber"] = 8
C["UF: Player"]["BuffNumberRows"] = 1
C["UF: Player"]["BuffSpacing"] = 6
C["UF: Player"]["BuffsPlayerCombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}

-- debuffs
C["UnitFrames"]["PlayerDebuffs"] = true
C["UF: Player"]["DebuffSize"] = 40
C["UF: Player"]["DebuffNumber"] = 31
C["UF: Player"]["DebuffNumberRows"] = 1
C["UF: Player"]["DebuffSpacing"] = 3


-- aurabars
C["UnitFrames"]["PlayerAuraBars"] = false
C["UF: Player"]["AuraBarsGrowDirection"] = {
	["Options"] = {
		["Up"] = "UP",
		["Down"] = "DOWN",	
	},
	["Value"] = "UP",
}
C["UF: Player"]["AuraBarsAlignment"] = {
	["Options"] = {
		["Left"] = "LEFT",
		["Right"] = "RIGHT",	
	},
	["Value"] = "LEFT",
}
C["UF: Player"]["AuraBarsHeight"] = 17
C["UF: Player"]["AuraBarsWidth"] = 200
C["UF: Player"]["AuraBarsSpacing"] = 2

-- rested icon
C["UF: Player"]["RestedIcon"] = true
C["UF: Player"]["RestedText"] = false -- not in GUI?

-- role icon
C["UF: Player"]["RoleIcon"] = true
C["UF: Player"]["RoleIconSize"] = 24

-- raid icon
C["UF: Player"]["RaidIcon"] = true
C["UF: Player"]["RaidIconSize"] = 24

-- combat icon
C["UF: Player"]["CombatIcon"] = true
C["UF: Player"]["CombatIconSize"] = 14
C["UF: Player"]["CombatIconColor"] = {1, 1, 0}

-- leader icon
C["UF: Player"]["LeaderIcon"] = true
C["UF: Player"]["LeaderIconSize"] = 14

-- master looter icon
C["UF: Player"]["MasterLooterIcon"] = true
C["UF: Player"]["MasterLooterIconSize"] = 14

-- pvp status icon
C["UF: Player"]["PVPIcon"] = false
C["UF: Player"]["PVPIconSize"] = 48

-- Portrait
C["UF: Player"]["PortraitStyle"] = {
	["Options"] = {
		["None"] = "None",
		["Outside"] = "Side",
		["Class Icon"] = "ClassIcon",
		["Overlay"] = "Overlay",
	},	
	["Value"] = "None",
}
C["UF: Player"]["PortraitOverlayAlpha"] = 0.5
	
-- combat state
C["UF: Player"]["NonCombatAlphaEnable"] = false
C["UF: Player"]["OnlyFullHP"] = true
C["UF: Player"]["NonCombatAlpha"] = 1

------------------------------------------------------------------------------------------
-- TARGET
------------------------------------------------------------------------------------------
C["UF: Target"] = {}

-- enable
C["UF: Target"]["Enable"] = true

-- color
C["UF: Target"]["ColorThreat"] = false
C["UF: Target"]["ColorGradient"] = false

-- styling
C["UF: Target"]["PercentageTags"] = true
C["UF: Target"]["CombatLog"] = true

-- health
C["UF: Target"]["HealthHeight"] = 36
C["UF: Target"]["HealthWidth"] = 200
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
C["UF: Target"]["HealthFont"] = "MaxUI Outlined"
C["UF: Target"]["HealthFontSize"] = 12
C["UF: Target"]["HealthTexture"] = "Tukui"

-- power
C["UF: Target"]["PowerHeight"] = 12
C["UF: Target"]["PowerWidth"] = 140
C["UF: Target"]["PowerTag"] = {
	["Options"] = {
		["None"] = "",
		["current"] = "[MaxUI:PowerColor][MaxUI:CurPP]",
		["percent"] = "[MaxUI:PowerColor][perpp]%",
		["current - percent"] = "[MaxUI:PowerColor][MaxUI:CurPP] - [perpp]%",
		["missing"] = "[MaxUI:PowerColor]-[MaxUI:MisPP]",
		["current | max"] = "[MaxUI:PowerColor][MaxUI:CurPP] | [MaxUI:MaxPP]",
	},
	["Value"] = "[MaxUI:PowerColor][MaxUI:CurPP] | [MaxUI:MaxPP]",
}
C["UF: Target"]["PowerFont"] = "MaxUI Outlined"
C["UF: Target"]["PowerFontSize"] = 10
C["UF: Target"]["PowerTexture"] = "Tukui"

-- name
C["UF: Target"]["NameTag"] = {
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
}
C["UF: Target"]["NameFont"] = "MaxUI Outlined"
C["UF: Target"]["NameFontSize"] = 14

-- extra info tag
C["UF: Target"]["DescriptionTag"] = {
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
}
C["UF: Target"]["DescFontSize"] = 12

-- castbar
C["UF: Target"]["CastBar"] = true
C["UF: Target"]["CastBarIcon"] = true
C["UF: Target"]["CastBarText"] = true
C["UF: Target"]["CastBarTime"] = true
C["UF: Target"]["CastFont"] = "MaxUI Outlined"
C["UF: Target"]["CastFontSize"] = 12
C["UF: Target"]["CastTexture"] = "Tukui"
C["UF: Target"]["CastBarUnlink"] = true
C["UF: Target"]["CastHeight"] = 12
C["UF: Target"]["CastWidth"] = 200

-- buffs
C["UnitFrames"]["TargetBuffs"] = true
C["UF: Target"]["OnlySelfBuffs"] = true
C["UF: Target"]["BuffSize"] = 22
C["UF: Target"]["BuffNumber"] = 8
C["UF: Target"]["BuffNumberRows"] = 1
C["UF: Target"]["BuffSpacing"] = 6
C["UF: Target"]["BuffsTargetCombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}
	
-- debuffs
C["UnitFrames"]["TargetDebuffs"] = true
C["UF: Target"]["OnlySelfDebuffs"] = true
C["UF: Target"]["DebuffSize"] = 40
C["UF: Target"]["DebuffNumber"] = 31
C["UF: Target"]["DebuffNumberRows"] = 1
C["UF: Target"]["DebuffSpacing"] = 3

-- role icon
C["UF: Target"]["RoleIcon"] = true
C["UF: Target"]["RoleIconSize"] = 24

-- raid icon
C["UF: Target"]["RaidIcon"] = true
C["UF: Target"]["RaidIconSize"] = 24

-- portrait
C["UF: Target"]["PortraitStyle"] = {
	["Options"] = {
		["None"] = "None",
		["Outside"] = "Side",
		--["Class Icon"] = "ClassIcon",
		["Overlay"] = "Overlay",
	},	
	["Value"] = "None",
}
C["UF: Target"]["PortraitOverlayAlpha"] = 0.5
	
-- combat state
C["UF: Target"]["NonCombatAlphaEnable"] = false
C["UF: Target"]["NonCombatAlpha"] = 1

------------------------------------------------------------------------------------------
-- PET
------------------------------------------------------------------------------------------
C["UF: Pet"] = {}

-- enable
C["UF: Pet"]["Enable"] = true

-- styling
C["UnitFrames"]["PetAuras"] = true
C["UF: Pet"]["PercentageTags"] = true

-- health
C["UF: Pet"]["HealthHeight"] = 30
C["UF: Pet"]["HealthWidth"] = 160
C["UF: Pet"]["HealthTag"] = {
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
C["UF: Pet"]["HealthFont"] = "MaxUI Outlined"
C["UF: Pet"]["HealthFontSize"] = 12
C["UF: Pet"]["HealthTexture"] = "Tukui"

-- power	
C["UF: Pet"]["PowerHeight"] = 8
C["UF: Pet"]["PowerWidth"] = 100
C["UF: Pet"]["PowerTag"] = {
	["Options"] = {
		["None"] = "",
		["Current"] = "[MaxUI:PowerColor][MaxUI:CurPP]",
		["Percent"] = "[MaxUI:PowerColor][perpp]%",
		["Current - Percent"] = "[MaxUI:PowerColor][MaxUI:CurPP] - [perpp]%",
		["Missing"] = "[MaxUI:PowerColor]-[MaxUI:MisPP]",
		["Current | Max"] = "[MaxUI:PowerColor][MaxUI:CurPP] | [MaxUI:MaxPP]",
	},
	["Value"] = "[MaxUI:PowerColor][MaxUI:CurPP]",
}
C["UF: Pet"]["PowerFont"] = "MaxUI Outlined"
C["UF: Pet"]["PowerFontSize"] = 10
C["UF: Pet"]["PowerTexture"] = "Tukui"

-- name	
C["UF: Pet"]["NameTag"] = {
	["Options"] = {
		["None"] = "",
		["Name:Full"] = "[Tukui:GetNameColor][name] [Tukui:DiffColor][level] [classification][pvp]",
		["Name:Abbreviated"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level] [classification][pvp]",
		["Name:Long"] = "[Tukui:GetNameColor][Tukui:NameLong] [Tukui:DiffColor][level] [classification][pvp]",
		["Name:Medium"] = "[Tukui:GetNameColor][Tukui:NameMedium] [Tukui:DiffColor][level] [classification][pvp]",
		["Name:Short"] = "[Tukui:GetNameColor][Tukui:NameShort] [Tukui:DiffColor][level] [classification][pvp]",
	},
	["Value"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level] [classification][pvp]",
}
C["UF: Pet"]["NameFont"] = "MaxUI Outlined"
C["UF: Pet"]["NameFontSize"] = 12

-- castbar
C["UF: Pet"]["CastBar"] = true
C["UF: Pet"]["CastBarText"] = true
C["UF: Pet"]["CastBarTime"] = true
C["UF: Pet"]["CastFont"] = "MaxUI Outlined"
C["UF: Pet"]["CastFontSize"] = 10
C["UF: Pet"]["CastTexture"] = "Tukui"

C["UF: Pet"]["CastBarUnlink"] = false
C["UF: Pet"]["CastHeight"] = 10
C["UF: Pet"]["CastWidth"] = 160

	-- buffs
C["UF: Pet"]["Buffs"] = true
C["UF: Pet"]["OnlySelfBuffs"] = true
C["UF: Pet"]["BuffSize"] = 22
C["UF: Pet"]["BuffNumber"] = 8
C["UF: Pet"]["BuffNumberRows"] = 1
C["UF: Pet"]["BuffSpacing"] = 6
C["UF: Pet"]["BuffsPetCombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}
	
-- debuffs
C["UF: Pet"]["Debuffs"] = true
C["UF: Pet"]["DebuffSize"] = 28
C["UF: Pet"]["DebuffNumber"] = 6
C["UF: Pet"]["DebuffNumberRows"] = 1
C["UF: Pet"]["DebuffSpacing"] = 3

-- icons
C["UF: Pet"]["RaidIcon"] = true
C["UF: Pet"]["RaidIconSize"] = 24

-- portrait
C["UF: Pet"]["PortraitStyle"] = {
	["Options"] = {
		["None"] = "None",
		["Outside"] = "Side",
		["Overlay"] = "Overlay",
	},	
	["Value"] = "None",
}
C["UF: Pet"]["PortraitOverlayAlpha"] = 0.5

-- combat state
C["UF: Pet"]["NonCombatAlpha"] = 1
C["UF: Pet"]["NonCombatAlphaEnable"] = false

------------------------------------------------------------------------------------------
-- TARGET OF TARGET (TOT)
------------------------------------------------------------------------------------------
C["UF: ToT"] = {}

-- enable
C["UF: ToT"]["Enable"] = true

-- styling
C["UnitFrames"]["TOTAuras"] = true
C["UF: ToT"]["ColorThreat"] = false
C["UF: ToT"]["PercentageTags"] = true

-- health
C["UF: ToT"]["HealthHeight"] = 30
C["UF: ToT"]["HealthWidth"] = 160
C["UF: ToT"]["HealthTag"] = {
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
C["UF: ToT"]["HealthFont"] = "MaxUI Outlined"
C["UF: ToT"]["HealthFontSize"] = 12
C["UF: ToT"]["HealthTexture"] = "Tukui"
	
-- power
C["UF: ToT"]["PowerHeight"] = 8
C["UF: ToT"]["PowerWidth"] = 100
C["UF: ToT"]["PowerTag"] = {
	["Options"] = {
		["None"] = "",
		["Current"] = "[MaxUI:PowerColor][MaxUI:CurPP]",
		["Percent"] = "[MaxUI:PowerColor][perpp]%",
		["Current - Percent"] = "[MaxUI:PowerColor][MaxUI:CurPP] - [perpp]%",
		["Missing"] = "[MaxUI:PowerColor]-[MaxUI:MisPP]",
		["Current | Max"] = "[MaxUI:PowerColor][MaxUI:CurPP] | [MaxUI:MaxPP]",
	},
	["Value"] = "[MaxUI:PowerColor][MaxUI:CurPP]",
}
C["UF: ToT"]["PowerFont"] = "MaxUI Outlined"
C["UF: ToT"]["PowerFontSize"] = 10
C["UF: ToT"]["PowerTexture"] = "Tukui"

-- name
C["UF: ToT"]["NameTag"] = {
	["Options"] = {
		["None"] = "",
		["Name:Full"] = "[Tukui:GetNameColor][name] [Tukui:DiffColor][level] [classification][pvp]",
		["Name:Abbreviated"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level] [classification][pvp]",
		["Name:Long"] = "[Tukui:GetNameColor][Tukui:NameLong] [Tukui:DiffColor][level] [classification][pvp]",
		["Name:Medium"] = "[Tukui:GetNameColor][Tukui:NameMedium] [Tukui:DiffColor][level] [classification][pvp]",
		["Name:Short"] = "[Tukui:GetNameColor][Tukui:NameShort] [Tukui:DiffColor][level] [classification][pvp]",
	},
	["Value"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level] [classification][pvp]",
}
C["UF: ToT"]["NameFont"] = "MaxUI Outlined"
C["UF: ToT"]["NameFontSize"] = 12
	
-- buffs
C["UF: ToT"]["Buffs"] = true
C["UF: ToT"]["OnlySelfBuffs"] = true
C["UF: ToT"]["BuffSize"] = 22
C["UF: ToT"]["BuffNumber"] = 8
C["UF: ToT"]["BuffNumberRows"] = 1
C["UF: ToT"]["BuffSpacing"] = 6
C["UF: ToT"]["BuffsToTCombatState"] = {
	["Options"] = {
		["Show in Combat"] = "Show",
		["Hide in Combat"] = "Hide",	
		["Nothing"] = "Nothing",
	},
	["Value"] = "Nothing",
}
	
-- debuffs
C["UF: ToT"]["Debuffs"] = true
C["UF: ToT"]["OnlySelfDebuffs"] = false
C["UF: ToT"]["DebuffSize"] = 28
C["UF: ToT"]["DebuffNumber"] = 6
C["UF: ToT"]["DebuffNumberRows"] = 1
C["UF: ToT"]["DebuffSpacing"] = 3

-- role icons
C["UF: ToT"]["RoleIcon"] = true
C["UF: ToT"]["RoleIconSize"] = 24

-- raid icon
C["UF: ToT"]["RaidIcon"] = true
C["UF: ToT"]["RaidIconSize"] = 24

-- portrait
C["UF: ToT"]["PortraitStyle"] = {
	["Options"] = {
		["None"] = "None",
		["Outside"] = "Side",
		["Overlay"] = "Overlay",
	},	
	["Value"] = "None",
}
C["UF: ToT"]["PortraitOverlayAlpha"] = 0.5

-- combat state
C["UF: ToT"]["NonCombatAlpha"] = 1
C["UF: ToT"]["NonCombatAlphaEnable"] = false

------------------------------------------------------------------------------------------
-- FOCUS and FOCUSTARGET (MIRRORED)
------------------------------------------------------------------------------------------
C["UF: Focus"] = {}

-- enable
C["UF: Focus"]["Enable"] = true
C["UF: Focus"]["EnableFT"] = true
C["UnitFrames"]["FocusAuras"] = true

-- color
C["UF: Focus"]["ColorThreat"] = false

-- styling
C["UF: Focus"]["PercentageTags"] = false

-- health
C["UF: Focus"]["HealthHeight"] = 30
C["UF: Focus"]["HealthWidth"] = 160
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
C["UF: Focus"]["HealthFont"] = "MaxUI Outlined"
C["UF: Focus"]["HealthFontSize"] = 10
C["UF: Focus"]["HealthTexture"] = "Tukui"

-- power
C["UF: Focus"]["PowerHeight"] = 10
C["UF: Focus"]["PowerWidth"] = 100
C["UF: Focus"]["PowerTag"] = {
	["Options"] = {
		["None"] = "",
		["Current"] = "[MaxUI:PowerColor][MaxUI:CurPP]",
		["Percent"] = "[MaxUI:PowerColor][perpp]%",
		["Current - Percent"] = "[MaxUI:PowerColor][MaxUI:CurPP] - [perpp]%",
		["Missing"] = "[MaxUI:PowerColor]-[MaxUI:MisPP]",
		["Current | Max"] = "[MaxUI:PowerColor][MaxUI:CurPP] | [MaxUI:MaxPP]",
	},
	["Value"] = "[MaxUI:PowerColor][MaxUI:CurPP]",
}
C["UF: Focus"]["PowerFont"] = "MaxUI Outlined"
C["UF: Focus"]["PowerFontSize"] = 10
C["UF: Focus"]["PowerTexture"] = "Tukui"
	
-- name
C["UF: Focus"]["FocusNameTag"] = {
	["Options"] = {
		["None"] = "",
		["Name:Full"] = "[Tukui:GetNameColor][name] [Tukui:DiffColor][level] [classification][pvp]",
		["Name:Abbreviated"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level] [classification][pvp]",
		["Name:Long"] = "[Tukui:GetNameColor][Tukui:NameLong] [Tukui:DiffColor][level] [classification][pvp]",
		["Name:Medium"] = "[Tukui:GetNameColor][Tukui:NameMedium] [Tukui:DiffColor][level] [classification][pvp]",
		["Name:Short"] = "[Tukui:GetNameColor][Tukui:NameShort] [Tukui:DiffColor][level] [classification][pvp]",
	},
	["Value"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level] [classification][pvp]",
}
C["UF: Focus"]["NameFont"] = "MaxUI Outlined"
C["UF: Focus"]["NameFontSize"] = 12

-- castbar
C["UF: Focus"]["CastBar"] = true
C["UF: Focus"]["CastBarIcon"] = false
C["UF: Focus"]["CastBarText"] = true
C["UF: Focus"]["CastBarTime"] = true
C["UF: Focus"]["CastFont"] = "MaxUI Outlined"
C["UF: Focus"]["CastFontSize"] = 10
C["UF: Focus"]["CastTexture"] = "Tukui"
C["UF: Focus"]["CastBarUnlink"] = false
C["UF: Focus"]["CastHeight"] = 10
C["UF: Focus"]["CastWidth"] = 160

-- buffs
C["UF: Focus"]["Buffs"] = true
C["UF: Focus"]["NumberOfBuffsShown"] = 3
	
-- debuffs
C["UF: Focus"]["Debuffs"] = true
C["UF: Focus"]["NumberOfDebuffsShown"] = 3
	
-- portrait
C["UF: Focus"]["PortraitStyle"] = {
	["Options"] = {
		["None"] = "None",
		["Outside"] = "Side",
		["Overlay"] = "Overlay",
	},	
	["Value"] = "None",
}
C["UF: Focus"]["PortraitOverlayAlpha"] = 0.5

-- role icon
C["UF: Focus"]["RoleIcon"] = true
C["UF: Focus"]["RoleIconSize"] = 24

-- raid icon
C["UF: Focus"]["RoleIcon"] = true
C["UF: Focus"]["RaidIconSize"] = 24
	
-- combat state
C["UF: Focus"]["NonCombatAlpha"] = 1
C["UF: Focus"]["NonCombatAlphaEnable"] = false

------------------------------------------------------------------------------------------
-- BOSS
------------------------------------------------------------------------------------------
C["UF: Boss"] = {}

-- enable
C["UnitFrames"]["Boss"] = true
C["UnitFrames"]["BossAuras"] = true

-- styling
C["UF: Boss"]["PercentageTags"] = true
C["UF: Boss"]["Spacing"] = 50

-- threat color
C["UF: Boss"]["ColorThreat"] = false 

-- health
C["UF: Boss"]["HealComm"] = false
C["UF: Boss"]["HealthHeight"] = 32
C["UF: Boss"]["HealthWidth"] = 180
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
C["UF: Boss"]["HealthFont"] = "MaxUI Outlined"
C["UF: Boss"]["HealthFontSize"] = 12
C["UF: Boss"]["HealthTexture"] = "Tukui"

-- power
C["UF: Boss"]["PowerHeight"] = 10
C["UF: Boss"]["PowerWidth"] = 130
C["UF: Boss"]["PowerFont"] = "MaxUI Outlined"
C["UF: Boss"]["PowerFontSize"] = 10
C["UF: Boss"]["PowerTexture"] = "Tukui"
C["UF: Boss"]["PowerTag"] = {
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
C["UF: Boss"]["NameTag"] = {
	["Options"] = {
		["None"] = "",
		["Name:Full"] = "[Tukui:GetNameColor][name] [Tukui:DiffColor][level] [classification][pvp]",
		["Name:Abbreviated"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level] [classification][pvp]",
		["Name:Long"] = "[Tukui:GetNameColor][Tukui:NameLong] [Tukui:DiffColor][level] [classification][pvp]",
		["Name:Medium"] = "[Tukui:GetNameColor][Tukui:NameMedium] [Tukui:DiffColor][level] [classification][pvp]",
		["Name:Short"] = "[Tukui:GetNameColor][Tukui:NameShort] [Tukui:DiffColor][level] [classification][pvp]",
	},
	["Value"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level] [classification][pvp]",
}
C["UF: Boss"]["NameFont"] = "MaxUI Outlined"
C["UF: Boss"]["NameFontSize"] = 12

-- castbar
C["UF: Boss"]["CastBar"] = true
C["UF: Boss"]["CastBarIcon"] = false
C["UF: Boss"]["CastBarText"] = true
C["UF: Boss"]["CastBarTime"] = true
C["UF: Boss"]["CastFont"] = "MaxUI Outlined"
C["UF: Boss"]["CastFontSize"] = 12
C["UF: Boss"]["CastTexture"] = "Tukui"
C["UF: Boss"]["CastBarUnlink"] = false
C["UF: Boss"]["CastHeight"] = 10
--C["UF: Boss"]["CastWidth"] = 160
	
-- buffs
C["UF: Boss"]["Buffs"] = true
C["UF: Boss"]["NumberOfBuffsShown"] = 3
	
-- debuffs
C["UF: Boss"]["Debuffs"] = true
C["UF: Boss"]["NumberOfDebuffsShown"] = 3
	
-- icon
C["UF: Boss"]["RaidIcon"] = true
C["UF: Boss"]["RaidIconSize"] = 24

-- portrait
C["UF: Boss"]["PortraitStyle"] = {
	["Options"] = {
		["None"] = "None",
		["Outside"] = "Side",
		["Overlay"] = "Overlay",
	},	
	["Value"] = "None",
}
C["UF: Boss"]["PortraitOverlayAlpha"] = 0.5



------------------------------------------------------------------------------------------
-- ARENA
------------------------------------------------------------------------------------------
C["UF: Arena"] = {}

-- enable
C["UnitFrames"]["Arena"] = true
C["UF: Arena"]["Enable"] = true -- still used ?
C["UnitFrames"]["ArenaAuras"] = true

-- styling
C["UF: Arena"]["PercentageTags"] = true
C["UF: Arena"]["Spacing"] = 50

-- threat color
C["UF: Arena"]["ColorThreat"] = false 

-- health
C["UF: Arena"]["HealComm"] = false
C["UF: Arena"]["HealthHeight"] = 32
C["UF: Arena"]["HealthWidth"] = 180
C["UF: Arena"]["HealthTag"] = {
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
C["UF: Arena"]["HealthFont"] = "MaxUI Outlined"
C["UF: Arena"]["HealthFontSize"] = 12
C["UF: Arena"]["HealthTexture"] = "Tukui"

-- power	
C["UF: Arena"]["PowerHeight"] = 10
C["UF: Arena"]["PowerWidth"] = 130
C["UF: Arena"]["PowerTag"] = {
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
C["UF: Arena"]["PowerFont"] = "MaxUI Outlined"
	C["UF: Arena"]["PowerFontSize"] = 10
C["UF: Arena"]["PowerTexture"] = "Tukui"

-- name
C["UF: Arena"]["NameTag"] = {
	["Options"] = {
		["None"] = "",
		["Name:Full"] = "[Tukui:GetNameColor][name] [Tukui:DiffColor][level] [classification][pvp]",
		["Name:Abbreviated"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level] [classification][pvp]",
		["Name:Long"] = "[Tukui:GetNameColor][Tukui:NameLong] [Tukui:DiffColor][level] [classification][pvp]",
		["Name:Medium"] = "[Tukui:GetNameColor][Tukui:NameMedium] [Tukui:DiffColor][level] [classification][pvp]",
		["Name:Short"] = "[Tukui:GetNameColor][Tukui:NameShort] [Tukui:DiffColor][level] [classification][pvp]",
	},
	["Value"] = "[Tukui:GetNameColor][name:abbrev] [Tukui:DiffColor][level] [classification][pvp]",
}
C["UF: Arena"]["NameFont"] = "MaxUI Outlined"
C["UF: Arena"]["NameFontSize"] = 12

-- castbar
C["UF: Arena"]["CastBar"] = true
C["UF: Arena"]["CastBarIcon"] = false
C["UF: Arena"]["CastBarText"] = true
C["UF: Arena"]["CastBarTime"] = true
C["UF: Arena"]["CastFont"] = "MaxUI Outlined"
C["UF: Arena"]["CastFontSize"] = 12
C["UF: Arena"]["CastTexture"] = "Tukui"
C["UF: Arena"]["CastBarUnlink"] = false
C["UF: Arena"]["CastHeight"] = 10
C["UF: Arena"]["CastWidth"] = 160

-- buffs
C["UF: Arena"]["Buffs"] = true
C["UF: Arena"]["NumberOfBuffsShown"] = 3
	
-- debuffs
C["UF: Arena"]["Debuffs"] = true
C["UF: Arena"]["NumberOfDebuffsShown"] = 3

-- icon
C["UF: Arena"]["RaidIcon"] = true
C["UF: Arena"]["RaidIconSize"] = 24

-- spec icon
C["UF: Arena"]["SpecIcon"] = true

-- trinket icon
C["UF: Arena"]["Trinket"] = true
	
-- portrait
C["UF: Arena"]["PortraitStyle"] = {
	["Options"] = {
		["None"] = "None",
		["Outside"] = "Side",
		["Overlay"] = "Overlay",
	},	
	["Value"] = "None",
	}
C["UF: Arena"]["PortraitOverlayAlpha"] = 0.5
	
-- combat state
C["UF: Arena"]["NonCombatAlpha"] = 1
C["UF: Arena"]["NonCombatAlphaEnable"] = false

------------------------------------------------------------------------------------------
-- NAMEPLATES
------------------------------------------------------------------------------------------
-- enable
C["NamePlates"]["Enable"] = true

-- styling
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

-- font
C["NamePlates"]["Font"] = "MaxUI Outlined"

-- settings
C["NamePlates"]["MaxDistance"] = 60
C["NamePlates"]["CombatOnly"] = true
C["NamePlates"]["HealthBars"] = true

-- sizing
C["NamePlates"]["Width"] = 140
C["NamePlates"]["Height"] = 10


-- health
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
C["NamePlates"]["HealthPrediction"] = false
C["Textures"]["NPHealthTexture"] = "Tukui"
C["NamePlates"]["HealthFontSize"] = 10

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
C["NamePlates"]["Font"] = "MaxUI Outlined" -- same as general font?
C["Textures"]["NPPowerTexture"] = "Tukui"

-- name
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
C["NamePlates"]["FontSize"] = 12

-- castbar
C["NamePlates"]["NameplateCastBar"] = true
C["NamePlates"]["CastHeight"] = 4
C["NamePlates"]["CastbarFullNameplateOverlap"] = false
C["Textures"]["NPCastTexture"] = "Tukui"

-- buffs
C["NamePlates"]["StealableBuffs"] = true
C["NamePlates"]["NumberStealableBuffs"] = 3
C["NamePlates"]["StealableBuffsSize"] = 20

-- debuffs
C["NamePlates"]["Debuffs"] = true
C["NamePlates"]["OnlySelfDebuffs"] = true
C["NamePlates"]["DebuffsOnTop"] = false
C["NamePlates"]["DebuffSize"] = 20
C["NamePlates"]["DebuffAnchorSpace"] = 4

-- marking and icons
C["NamePlates"]["MarkerSize"] = 40

C["NamePlates"]["QuestIcon"] = true
C["NamePlates"]["QuestIconSize"] = 40
C["NamePlates"]["ClassIcon"] = false
C["NamePlates"]["RoleIndicator"] = false
C["NamePlates"]["PvPIndicator"] = false
C["NamePlates"]["Badge"] = false
C["NamePlates"]["PvPClassificationIndicator"] = false

-- threat
C["NamePlates"]["ColorThreat"] = false
C["NamePlates"]["AggroColor1"] = {98/255, 223/255, 89/255}
C["NamePlates"]["AggroColor2"] = {1, 1, 0.5}
C["NamePlates"]["AggroColor3"] = {1.00, 0.50, 0.00}
C["NamePlates"]["AggroColor4"] = {1, 0.2, 0.2}
C["NamePlates"]["ThreatIndicator"] = true

-- target highlighting
C["NamePlates"]["TargetIndicator"] = true
C["NamePlates"]["TargetHighlight"] = true
C["NamePlates"]["HighlightSize"] = 6
C["NamePlates"]["HighlightColor"] = {1, 1, 0}

-- Scale Targeted Nameplate
C["NamePlates"]["SelectedScale"] = 100

-- transparency Targeted Nameplate
C["NamePlates"]["NotSelectedAlpha"] = 100

-- Nameplate Spacing
C["NamePlates"]["Stacking"] = true
C["NamePlates"]["HorizontalSpacing"] = 1
C["NamePlates"]["VerticalSpacing"] = 1

------------------------------------------------------------------------------------------
-- PARTY
------------------------------------------------------------------------------------------
-- enable
C["Party"]["Enable"] = false
C["Party"]["ShowPets"] = false

-- styling
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

-- settings
C["Party"]["ShowSolo"] = true
C["Party"]["ShowPlayer"] = true
C["Party"]["RangeAlpha"] = 0.3
C["Party"]["VerticalSpacing"] = 70
C["Party"]["PetSizeScale"] = 70
C["Party"]["PercentageTags"] = true

-- health
C["Party"]["HealthHeight"] = 32
C["Party"]["HealthWidth"] = 200
C["Party"]["ShowHealthText"] = true
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
C["Party"]["Font"] = "MaxUI Outlined"
C["Party"]["HealthFontSize"] = 12
C["Textures"]["UFPartyHealthTexture"] = "Tukui"
	
-- power
C["Party"]["PowerHeight"] = 12
C["Party"]["PowerWidth"] = 130
C["Party"]["ShowManaText"] = true
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
C["Party"]["PowerFont"] = "MaxUI Outlined"
C["Party"]["PowerFontSize"] = 10
C["Textures"]["UFPartyPowerTexture"] = "Tukui"

-- name
C["Party"]["Font"] = "MaxUI Outlined"
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

-- buffs/debuffs
C["Party"]["ShowBuffs"] = true
C["Party"]["NumberOfBuffsShown"] = 8


C["Party"]["ShowDebuffs"] = true
C["Party"]["NumberOfDebuffsShown"] = 3

-- marking/role
C["Party"]["RoleIcon"] = true
C["Party"]["RaidIconSize"] = 20

-- highlighting
C["Party"]["HighlightColor"] = {0, 1, 0}
C["Party"]["HighlightSize"] = 10


-- portrait
C["Party"]["PortraitStyle"] = {
	["Options"] = {
		["None"] = "None",
		["Outside"] = "Side",
		["Overlay"] = "Overlay",
	},	
	["Value"] = "None",
}
C["Party"]["PortraitOverlayAlpha"] = 0.5

------------------------------------------------------------------------------------------
-- RAID
------------------------------------------------------------------------------------------
-- enable
C["Raid"]["Enable"] = true
C["Raid"]["ShowPets"] = true

-- styling
C["Raid"]["Style"] = {
	["Options"] = {
		["|cffFFFF99MaxUI|r"] = "MaxUI",
		["|cffFFFF99Alternative|r"] = "Alternative",
		["Tukui"] = "Tukui",
	},
	["Value"] = "MaxUI",
}
C["Raid"]["Orientation"] = {
	["Options"] = {
		["|cffFFFF99Vertical|r"] = "Vertical",
		["|cffFFFF99Horizontal|r"] = "Horizontal",
	},
	["Value"] = "Horizontal",
}
C["Raid"]["ElementAnchored"] = {
	["Options"] = {
		["|cffFFFF99Left|r"] = "LEFT",
		["|cffFFFF99Centered|r"] = "CENTER",
		["|cffFFFF99Right|r"] = "RIGHT",
	},
	["Value"] = "CENTER",
}

-- font
C["Raid"]["Font"] = "MaxUI Outlined"

-- settings
C["Raid"]["ShowSolo"] = true
C["Raid"]["GroupNumber"] = true
C["Raid"]["BGAlpha"] = 0.2
C["Raid"]["RangeAlpha"] = 0.3
C["Raid"]["GroupBy"]["Value"] = "GROUP"
C["Raid"]["GrowDirection"] = {
	["Options"] = {
		["Horizontal Up"] = "HorizontalUp",
		["Horizontal Down"] = "HorizontalDown",
		["Vertical Up"] = "VerticalUp",
		["Vertical Down"] = "VerticalDown",
	},
	["Value"] = "VerticalDown",	
}
C["Raid"]["HorSpacing"] = 4 -- are these used or the ones in the small/big raid section?
C["Raid"]["VerSpacing"] = 10

-- settings 1-25
C["Raid"]["MaxUnitPerColumn"] = 5
C["Raid"]["WidthSize"] = 88
C["Raid"]["HeightSize"] = 40
C["Raid"]["Padding"] = 10

-- settings 25-40
C["Raid"]["Raid40MaxUnitPerColumn"] = 10
C["Raid"]["Raid40WidthSize"] = 80
C["Raid"]["Raid40HeightSize"] = 32
C["Raid"]["Padding40"] = 10

-- health
C["Raid"]["VerticalHealth"] = false
C["Raid"]["HealthTag"]["Value"] = ""
C["Raid"]["HealthFont"] = "MaxUI Outlined"
C["Raid"]["HealthFontSize"] = 10
C["Raid"]["ShowPercentageHealth"] = false
C["Raid"]["HealthPercentageFont"] = "MaxUI Outlined"
C["Raid"]["PercentageFontSize"] = 10
C["Textures"]["UFRaidHealthTexture"] = "Tukui"

-- power
C["Raid"]["PowerVertical"] = false
C["Textures"]["UFRaidPowerTexture"] = "Tukui"

-- name
--C["Raid"]["Font"] = "MaxUI Outlined" -- same as general font set for raid?
C["Raid"]["FontSize"] = 10
C["Raid"]["NameColor"] = {
	["Options"] = {
		["Class"] = "Class",
		["Custom"] = "Custom",
	},
	["Value"] = "Class",
}
C["Raid"]["CustomNameColor"] = {1, 1, 0}

-- buffs
C["Raid"]["RaidBuffsStyle"]["Value"] = "Aura Track"
	-- standard
	C["Raid"]["RaidBuffs"]["Value"] = "Self"
	C["Raid"]["DesaturateBuffs"] = false
	-- auratrack
	C["Raid"]["AuraTrackIcons"] = true
	C["Raid"]["AuraTrackSpellTextures"] = true
	C["Raid"]["AuraTrackThickness"] = 5

C["Raid"]["BuffsPosition"] = {
	["Options"] = {
		["Inside Top"] = "InsideTop",
		["Inside Bottom"] = "InsideBottom",
		["Top"] = "Top",
		["Bottom"] = "Bottom",
	},
	["Value"] = "Inside",
}
-- debuffs
C["Raid"]["DebuffWatch"] = true
C["Raid"]["DebuffWatchDefault"] = true
C["Raid"]["DeBuffsOnRight"] = false

-- Marking and Role
C["Raid"]["MarkerSize"] = 16
C["Raid"]["RoleIconSize"] = 16
--C["Raid"]["AssignmentIcon"] = true

-- highlighting
C["Raid"]["HighlightSize"] = 10
C["Raid"]["HighlightColor"] = {0, 1, 0}
