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

------------------------------------------------------------------------------------------
-- NAMEPLATES
------------------------------------------------------------------------------------------
local NamePlates = function(self)
	local Window = self:GetWindow("NamePlates")

	Window:CreateWindowLogo("All", "|cffFFFF99Unitframes: Nameplates|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Settings for the nameplates on NPC's, mobs and other characters.")
	Window:CreateSpacer("All", 7)

	if T.Retail then 
		Window:CreateSpacer("All", 13)
		Window:CreateSpacer("All", 19)
		Window:CreateSpacer("All", 26)
		Window:CreateSpacer("All", 31)
		Window:CreateSpacer("All", 34)
		Window:CreateSpacer("All", 37)
	else
		Window:CreateSpacer("All", 13 -1)
		Window:CreateSpacer("All", 19 -1)
		Window:CreateSpacer("All", 26 -1)
		Window:CreateSpacer("All", 31 -1)
		Window:CreateSpacer("All", 34 -1)
		Window:CreateSpacer("All", 37 -1)
	end	

	Window:CreateSection("All", "Style")
	Window:CreateDropdown("All", "NamePlates", "Style", "Set nameplates style")
	Window:CreateDropdown("All", "NamePlates", "ElementAnchored", "Set nameplates element alignment (for MaxUI style)")
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Settings")
	Window:CreateSlider("All", "NamePlates", "MaxDistance", "Set max visible distance", 2, 60, 1)
	Window:CreateSwitch("All", "NamePlates", "CombatOnly", "Show nameplates only in combat")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Health")
	Window:CreateSwitch("All", "NamePlates", "HealthBars", "Show health and power bars")
	Window:CreateDropdown("All", "NamePlates", "HealthTag", "Set health tag format")
	Window:CreateSwitch("All", "NamePlates", "HealthPrediction", "Enable health prediction for nameplates")
	Window:CreateDropdown("All", "Textures", "NPHealthTexture", "Set health texture", "Texture")
	Window:CreateSlider("All", "NamePlates", "HealthFontSize", "|cffFFFFFFSet nameplate health font size|r", 6, 32, 1)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Power")
	Window:CreateDropdown("All", "NamePlates", "Font", "Set power font", "Font")
	Window:CreateDropdown("All", "Textures", "NPPowerTexture", "Set power texture", "Texture")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Name")
	Window:CreateDropdown("All", "NamePlates", "NameTag", "|cffFFFFFFSet name tag format|r")
	Window:CreateSlider("All", "NamePlates", "FontSize", "|cffFFFFFFSet nameplate font size|r", 6, 32, 1)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Castbar")
	Window:CreateSwitch("All", "NamePlates", "NameplateCastBar", "Enable nameplate castbar")
	Window:CreateSlider("All", "NamePlates", "CastHeight", "|cffFFFF99Set castbar height|r", 2, 32, 1)
	Window:CreateSwitch("All", "NamePlates", "CastbarFullNameplateOverlap", "|cffFFFF99Use the entire nameplate when casting|r")
	Window:CreateDropdown("All", "Textures", "NPCastTexture", "Set cast texture", "Texture")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Buffs")
	Window:CreateSwitch("All", "NamePlates", "StealableBuffs", "|cffFFFF99Enable stealable buffs|r")
	Window:CreateSlider("All", "NamePlates", "NumberStealableBuffs", "|cffFFFF99Set number of stealable buffs|r", 1, 3, 1)
	Window:CreateSlider("All", "NamePlates", "StealableBuffsSize", "|cffFFFF99Set size for stealable buffs|r", 10, 40, 1)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Debuffs")
	Window:CreateSwitch("All", "NamePlates", "Debuffs", "Enable debuffs")
	Window:CreateSwitch("All", "NamePlates", "OnlySelfDebuffs", "Display only our debuffs")
	Window:CreateSwitch("All", "NamePlates", "DebuffsOnTop", "Enable debuffs on top")
	Window:CreateSlider("All", "NamePlates", "DebuffSize", "Set debuff size", 2, 40, 1)
	Window:CreateSlider("All", "NamePlates", "DebuffAnchorSpace", "Set spacing between nameplate and debuffs", 2, 40, 1)
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Marking and Icons (WIP)")
	Window:CreateSlider("All", "NamePlates", "MarkerSize", "Set raid marker size", 2, 80, 1)
	Window:CreateSlider("All", "NamePlates", "QuestIconSize", "Set quest icon size", 2, 80, 1)
	Window:CreateSwitch("All", "NamePlates", "RoleIndicator", "Enable Role indicator")
	Window:CreateSwitch("All", "NamePlates", "PvPIndicator", "Enable PvP indicator (right)")
	Window:CreateSwitch("All", "NamePlates", "Badge", "Enable Pvp badge {right)")
	Window:CreateSwitch("All", "NamePlates", "PvPClassificationIndicator", "Enable PvP Classification indicator (top)")
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Threat")
	Window:CreateSwitch("All", "NamePlates", "ThreatIndicator", "Enable a personal threat indicator (like threatbar)")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Current target highlighting")
	Window:CreateSwitch("All", "NamePlates", "TargetIndicator", "Enable current target indicator")
	Window:CreateSwitch("All", "NamePlates", "TargetHighlight", "Enable current target highlight")
	Window:CreateSlider("All", "NamePlates", "HighlightSize", "Set nameplate highlight size", 2, 16, 1)
	Window:CreateColorSelection("All", "NamePlates", "HighlightColor", "Highlight/Indicator color")
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Current target scale")
	Window:CreateSlider("All", "NamePlates", "SelectedScale", "Set scaling of selected plate (%)", 100, 200, 1)
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Current target transparency")
	Window:CreateSlider("All", "NamePlates", "NotSelectedAlpha", "Set not selected nameplate alpha (%)", 0, 100, 1)
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Stacking / Overlapping options")
	Window:CreateSwitch("All", "NamePlates", "Stacking", "Enable stacking")
	Window:CreateSlider("All", "NamePlates", "HorizontalSpacing", "Set horizontal spacing", 0, 5, 0.1)
	Window:CreateSlider("All", "NamePlates", "VerticalSpacing", "Set vertical spacing", 0, 5, 0.1)
end
GUI:AddWidgets(NamePlates)

------------------------------------------------------------------------------------------
-- PARTY
------------------------------------------------------------------------------------------
local Party = function(self)
	local Window = self:GetWindow("Party")

	Window:CreateWindowLogo("All", "|cffFFFF99Unitframes: Party|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Settings for Party frames, for groups up to 5 players")
	Window:CreateSpacer("All", 7)

	Window:CreateSpacer("All", 11)
	Window:CreateSpacer("All", 21)
	Window:CreateSpacer("All", 24)
	Window:CreateSpacer("All", 28)

	Window:CreateSection("All", "Style")
	Window:CreateDropdown("All", "Party", "Style", "Set party unit style")
	Window:CreateDropdown("All", "Party", "Orientation", "Set party unit orientation (for MaxUI style) (not available yet)")
	Window:CreateDropdown("All", "Party", "ElementAnchored", "Set party frame element alignment (for MaxUI style)")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Settings")
	Window:CreateSwitch("All", "Party", "ShowSolo", "Show when solo")
	Window:CreateSlider("All", "Party", "VerticalSpacing", "|cffFFFF99Set spacing between partyunits|r", 0, 200, 1)
	Window:CreateSlider("All", "Party", "PetSizeScale", "|cffFFFF99Set party pet size/scale in %|r", 0, 100, 1)
	Window:CreateSwitch("All", "Party", "PercentageTags", "|cffFFFF99Enable percentages|r") -- still needed? tag system?
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Health")
	Window:CreateSlider("All", "Party", "HealthHeight", "|cffFFFF99Set health height|r", 10, 50, 1)
	Window:CreateSlider("All", "Party", "HealthWidth", "|cffFFFF99Set health width|r", 50, 400, 1)
	Window:CreateSwitch("All", "Party", "ShowHealthText", "Display health text values")
	Window:CreateDropdown("All", "Party", "HealthTag", "Health tag party unit")
	Window:CreateDropdown("All", "Party", "HealthFont", "Set party health font", "Font")
	Window:CreateSlider("All", "Party", "HealthFontSize", "|cffFFFF99Set health font size|r", 6, 40, 1)
	Window:CreateDropdown("All", "Textures", "UFPartyHealthTexture", "|cffFFFFFFSet health texture|r", "Texture")
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Power")
	Window:CreateSlider("All", "Party", "PowerHeight", "|cffFFFF99Set power height|r", 4, 30, 1)
	Window:CreateSlider("All", "Party", "PowerWidth", "|cffFFFF99Set power width|r", 20, 200, 1)
	Window:CreateSwitch("All", "Party", "ShowManaText", "Display mana text values")
	Window:CreateDropdown("All", "Party", "PowerTag", "|cffFFFF99Set power tag format|r")
	Window:CreateDropdown("All", "Party", "PowerFont", "|cffFFFF99Set power font|r", "Font")
	Window:CreateSlider("All", "Party", "PowerFontSize", "|cffFFFF99Set power font size|r", 6, 40, 1)
	Window:CreateDropdown("All", "Textures", "UFPartyPowerTexture", "|cffFFFFFFSet power texture|r", "Texture")
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Name")
	Window:CreateDropdown("All", "Party", "Font", "Set party font", "Font")
	Window:CreateSlider("All", "Party", "NameFontSize", "|cffFFFF99Set name font size|r", 6, 40, 1)
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Castbar")
	Window:CreateSwitch("All", "Party", "CastBar", "|cffFFFF99Enable castbar|r")
	Window:CreateSwitch("All", "Party", "CastBarIcon", "|cffFFFF99Enable castbar icon|r")
	Window:CreateSwitch("All", "Party", "CastBarText", "|cffFFFF99Enable castbar text|r")
	Window:CreateSwitch("All", "Party", "CastBarTime", "|cffFFFF99Enable castbar time|r")
	Window:CreateDropdown("All", "Party", "CastFont", "|cffFFFF99Set castbar font|r", "Font")
	Window:CreateSlider("All", "Party", "CastFontSize", "|cffFFFF99Set castbar font size|r", 6, 40, 1)
	Window:CreateDropdown("All", "Party", "CastTexture", "|cffFFFF99Set castbar texture|r", "Texture")
	Window:CreateSpacerNoPos("All")
	Window:CreateSwitch("All", "Party", "CastBarUnlink", "|cffFFFF99Unlink castbar|r")
	Window:CreateSlider("All", "Party", "CastHeight", "|cffFFFF99Set unlinked castbar height|r", 2, 20, 1)
	Window:CreateSlider("All", "Party", "CastWidth", "|cffFFFF99Set unlinked castbar width|r", 40, 400, 1)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Buffs")
	Window:CreateSwitch("All", "Party", "Buffs", "|cffFFFF99Show buffs|r")
	Window:CreateSlider("All", "Party", "NumberOfBuffsShown", "|cffFFFF99Set number of buffs shown|r", 1, 10, 1)
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Debuffs")
	Window:CreateSwitch("All", "Party", "Debuffs", "|cffFFFF99Show debuffs|r")
	Window:CreateSlider("All", "Party", "NumberOfDebuffsShown", "|cffFFFF99Set number of debuffs shown|r", 1, 20, 1)
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Marking")
	Window:CreateSlider("All", "Party", "RaidIconSize", "|cffFFFF99Set raid icon size|r", 10, 40, 1)
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Portrait")
	Window:CreateDropdown("All", "Party", "PortraitStyle", "|cffFFFF99Set portrait style|r")
	Window:CreateSlider("All", "Party", "PortraitOverlayAlpha", "|cffFFFF99Set transparency|r", 0, 1, 0.1)
end
GUI:AddWidgets(Party)

------------------------------------------------------------------------------------------
-- RAID
------------------------------------------------------------------------------------------
local Raid = function(self)
	local Window = self:GetWindow("Raid")

	Window:CreateWindowLogo("All", "|cffFFFF99Unitframes: Raid|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Settings for the raidframes. Also used for part when partyframes are disabled.")
	Window:CreateSpacer("All", 7)
	
	Window:CreateSpacer("All", 12)
	Window:CreateSpacer("All", 18)
	Window:CreateSpacer("All", 24)

	if C.Raid.RaidBuffsStyle.Value == "None" then
		Window:CreateSpacer("All", 27)
		Window:CreateSpacer("All", 31)
		Window:CreateSpacer("All", 34)
		Window:CreateSpacer("All", 38)
		Window:CreateSpacer("All", 42)
		Window:CreateSpacer("All", 44)

	elseif C.Raid.RaidBuffsStyle.Value == "Standard" then
		Window:CreateSpacer("All", 29)
		Window:CreateSpacer("All", 33)
		Window:CreateSpacer("All", 36)
		Window:CreateSpacer("All", 40)
		Window:CreateSpacer("All", 44)
		Window:CreateSpacer("All", 46)

	elseif C.Raid.RaidBuffsStyle.Value == "Aura Track" then
		Window:CreateSpacer("All", 31)
		Window:CreateSpacer("All", 35) 
		Window:CreateSpacer("All", 38)
		Window:CreateSpacer("All", 42)
		Window:CreateSpacer("All", 46)
		Window:CreateSpacer("All", 48)
	end

	Window:CreateSection("All", "Style")
	Window:CreateDropdown("All", "Raid", "Style", "Set raid unit style")
	Window:CreateDropdown("All", "Raid", "Orientation", "Set raid unit orientation (for MaxUI style)")
	Window:CreateDropdown("All", "Raid", "ElementAnchored", "Set raid frame element alignment (for MaxUI style)")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Settings")
	Window:CreateSwitch("All", "Raid", "ShowSolo", "Show when solo (Not working atm)")
	Window:CreateSwitch("All", "Raid", "GroupNumber", "Enable a group number indicator")
	Window:CreateSlider("All", "Raid", "BGAlpha", "Set background opacity", 0, 1, 0.1)
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Direction")
	Window:CreateDropdown("All", "Raid", "GrowDirection", "Set grow direction")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Spacing")
	Window:CreateSlider("All", "Raid", "HorSpacing", "Set horizontal spacing", 4, 40, 1)
	Window:CreateSlider("All", "Raid", "VerSpacing", "Set vertical spacing", 4, 40, 1)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Marking and Icons")
	Window:CreateDropdown("All", "UnitFrames", "Roles", "Set style for role icons (all unitframes)")
	Window:CreateSlider("All", "Raid", "RoleIconSize", "|cffFFFF99Set role icon size|r", 4, 40, 1)
	Window:CreateSlider("All", "Raid", "MarkerSize", "|cffFFFF99Set raid marker size|r", 4, 40, 1)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Health")
	Window:CreateSlider("All", "Raid", "HealthFontSize", "|cffFFFF99Set health font size|r", 6, 32, 1)
	Window:CreateSwitch("All", "Raid", "VerticalHealth", "Enable vertical health")
	Window:CreateDropdown("All", "Raid", "HealthTag", "Health tag raid unit")
	Window:CreateSwitch("All", "Raid", "ShowPercentageHealth", "Enable a health percentage tag")
	Window:CreateDropdown("All", "Raid", "HealthPercentageFont", "Set font for raid info tags", "Font")
	Window:CreateSlider("All", "Raid", "PercentageFontSize", "|cffFFFF99Set tag font size|r", 6, 32, 1)
	Window:CreateDropdown("All", "Textures", "UFRaidHealthTexture", "|cffFFFFFFSet health texture|r", "Texture")
	Window:CreateSpacerNoPos("All")
			
	Window:CreateSection("All", "Power")
	Window:CreateDropdown("All", "Textures", "UFRaidPowerTexture", "|cffFFFFFFSet power texture|r", "Texture")
	Window:CreateSwitch("All", "Raid", "PowerVertical", "Enable a vertical powerbar to the side")
	Window:CreateSpacerNoPos("All")
			
	Window:CreateSection("All", "Name")
	Window:CreateSlider("All", "Raid", "FontSize", "|cffFFFF99Set name font size|r", 6, 32, 1)
	Window:CreateDropdown("All", "Raid", "NameColor", "Set name color")
	Window:CreateColorSelection("All", "Raid", "CustomNameColor", "Set custom name color if style 'Custom' is chosen")
	Window:CreateSpacerNoPos("All")
			
	Window:CreateSection("All", "Buffs extended")
	Window:CreateDropdown("All", "Raid", "RaidBuffs", "Set style for raid buffs")
	Window:CreateDropdown("All", "Raid", "BuffsPosition", "|cffFFFF99Set position for raid buffs icons|r")
	Window:CreateSection("All", "Debuffs extended")
	Window:CreateSectionButton("All", "tracking", "Open the debuff tracking tool", GUI.TukuiDebuffTracking)
	Window:CreateSwitch("All", "Raid", "DeBuffsOnRight", "|cffFFFF99Anchor debuffs to the right|r")
end
GUI:AddWidgets(Raid)

------------------------------------------------------------------------------------------
-- UNITFRAMES - GENERAL
------------------------------------------------------------------------------------------
local UnitFramesMore = function(self)
	local Window = self:CreateWindow("Unitfr. ALL")

	Window:CreateWindowLogo("All", "|cffFFFF99Unitframes: General settings|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6,  "Settings and options that apply to all types of unitframes.")
	Window:CreateSpacer("All", 7)

	Window:CreateSection("All", "Enable")
	Window:CreateSwitch("All", "UnitFrames", "Enable", "Enable all unitframe modules")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Style")
	Window:CreateDropdown("All", "UnitFrames", "Style", "Set style for all individual unitframes")
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Orientation")
	Window:CreateDropdown("All", "UnitFrames", "HorVer", "|cffFFFF99Set unitframes orientation|r")
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Styling")
	Window:CreateSwitch("All", "UnitFrames", "Smoothing", "Animate health and power bars")
	Window:CreateSwitch("All", "UnitFrames", "Smooth", "Enable smooth health transitions")
	Window:CreateSlider("All", "UnitFrames", "StatusBarBackgroundMultiplier", "Health and Power background % opacity", 0, 50, 1)
	Window:CreateSlider("All", "UnitFrames", "RangeAlpha", "Set out of range alpha (focus/arena/boss)", 0, 1, 0.1)
	Window:CreateSwitch("All", "UnitFrames", "TargetEnemyHostileColor", "Enemy health bar colored by hostile reaction color instead of class")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Anchors")
	Window:CreateSwitch("All", "UnitFrames", "MaxUIAnchor", "|cffFFFFFFShow unitframes anchor|r")
	Window:CreateSlider("All", "UnitFrames", "MaxUIAnchorWidth", "|cffFFFFFFSet horizontal offset for player and target|r", -1000, 1000, 1)
	Window:CreateSlider("All", "UnitFrames", "MaxUIAnchorVertical", "|cffFFFFFFSet vertical offset for player and target|r", -1000, 1000, 1)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Health color")
	Window:CreateDropdown("All", "UnitFrames", "Colorstyle", "Set color style for all unitframes")
	Window:CreateColorSelection("All", "UnitFrames", "StatusBarColor", "Set custom health bar color")
	Window:CreateColorSelection("All", "UnitFrames", "ColorTexture", "Set custom backdrop color")
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Values / Tag color")
	Window:CreateDropdown("All", "UnitFrames", "TagFormat", "Set value/tag format (full or short)")
	Window:CreateDropdown("All", "UnitFrames", "HealthValueColors", "Set preset color for all unitframe health values")
	Window:CreateColorSelection("All", "UnitFrames", "CustomHealthValueColors", "Set custom health value color")
	Window:CreateDropdown("All", "UnitFrames", "PowerValueColors", "Set preset color for all unitframe power values")
	Window:CreateColorSelection("All", "UnitFrames", "CustomPowerValueColors", "Set custom power value color")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Healcomm")
	Window:CreateSwitch("All", "UnitFrames", "HealComm", "Enable HealComm for all available unitframes")
	Window:CreateSlider("All", "UnitFrames", "HealCommAlpha", "Set healcomm bars alpha", 0, 1, 0.1)
	Window:CreateColorSelection("All", "UnitFrames", "HealCommSelfColor", "HealComm - my heals")
	Window:CreateColorSelection("All", "UnitFrames", "HealCommOtherColor", "HealComm - others heals")
	Window:CreateColorSelection("Retail", "UnitFrames", "HealCommAbsorbColor", "HealComm - absorbs")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Buffs & Debuffs")
	Window:CreateSwitch("All", "UnitFrames", "AurasBelow", "Move auras below unitframes")
	Window:CreateSpacerNoPos("All")
	Window:CreateSwitch("All", "UnitFrames", "OnlySelfBuffs", "Display only our buffs on unitframes")
	Window:CreateSwitch("All", "UnitFrames", "OnlySelfDebuffs", "Display only our debuffs on target")
	Window:CreateSwitch("All", "UnitFrames", "DesaturateDebuffs", "Desaturate debuffs that are not by me")
	Window:CreateSwitch("All", "UnitFrames", "FlashRemovableBuffs", "Flash enemy buffs that can be dispelled/purged/stealed")
	--Window:CreateSpacerNoPos("All")
	--Window:CreateDropdown("All", "UnitFrames", "AurasFont", "Set font for buffs and debuffs", "Font")
	Window:CreateSpacerNoPos("All")
	Window:CreateSwitch("All", "UnitFrames", "RemainingTime", "|cffFFFF99Enable remaining time for buffs/debuffs|r")
	Window:CreateDropdown("All", "UnitFrames", "RemainingTimeFont", "Set font for remaining time", "Font")
	Window:CreateSlider("All", "UnitFrames", "RemainingTimeSize", "|cffFFFF99Set remaining time font size|r", 6, 40, 1)
	Window:CreateColorSelection("All", "UnitFrames", "RemainingTimeColor", "Set font color for remaining time")
	Window:CreateDropdown("All", "UnitFrames", "RemainingTimePosition", "Set position for remaining time")
	Window:CreateSlider("All", "UnitFrames", "RemainingTimeOffsetH", "Set horizontal offset for remaining time", -20, 20, 1)
	Window:CreateSlider("All", "UnitFrames", "RemainingTimeOffsetV", "Set vertical offset for remaining time", -20, 20, 1)
	Window:CreateDropdown("All", "UnitFrames", "RemainingTimeJustifyH", "Set alignment for remaining time")
	Window:CreateSpacerNoPos("All")
	Window:CreateSwitch("All", "UnitFrames", "Count", "|cffFFFF99Enable count for buffs/debuffs|r")
	Window:CreateDropdown("All", "UnitFrames", "CountTimeFont", "Set font for count", "Font")
	Window:CreateSlider("All", "UnitFrames", "CountSize", "|cffFFFF99Set count font size|r", 6, 40, 1)
	Window:CreateColorSelection("All", "UnitFrames", "CountColor", "Set font color for count")
	Window:CreateDropdown("All", "UnitFrames", "CountPosition", "Set position for count")
	Window:CreateSlider("All", "UnitFrames", "CountOffsetH", "Set horizontal offset for count", -20, 20, 1)
	Window:CreateSlider("All", "UnitFrames", "CountOffsetV", "Set vertical offset for count", -20, 20, 1)
	Window:CreateDropdown("All", "UnitFrames", "CountJustifyH", "Set alignment for count")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Castbar")
	Window:CreateColorSelection("All", "UnitFrames", "CastingColor", "Cast bar casting color")
	Window:CreateColorSelection("All", "UnitFrames", "ChannelingColor", "Cast bar channeling color")
	Window:CreateColorSelection("Retail", "UnitFrames", "NotInterruptibleColor", "Cast bar not interruptible color")
	Window:CreateSwitch("All", "UnitFrames", "CastBarLatency", "Display castbar latency")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Role icon")
	Window:CreateDropdown("All", "UnitFrames", "Roles", "Set style for role icons used on all unitframes")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Portrait")
	Window:CreateSwitch("All", "UnitFrames", "Portrait", "Enable portrait settings for all unitframes")
	Window:CreateSwitch("All", "UnitFrames", "Portrait2D", "Use 2D Portrait")
end
GUI:AddWidgets(UnitFramesMore)

------------------------------------------------------------------------------------------	
-- UNIT CLASS OPTIONS	
------------------------------------------------------------------------------------------
local ClassOptions = function(self)
	local Window = self:CreateWindow("Unitfr. Class")
	
	Window:CreateWindowLogo("All", "|cffFFFF99Unitframes: Classes|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6,  "Settings and options that are class specific.")
	Window:CreateSpacer("All", 7)
	
	Window:CreateSection("All", "Style")
	Window:CreateDropdown("All", "ClassOptions", "ClassPowerStyle", "Set style for class power")
	Window:CreateSwitch("All", "ClassOptions", "ClassPowerBackdrop", "|cffFFFF99Enable a class power backdrop|r")
	Window:CreateSwitch("All", "ClassOptions", "ClassPowerMover", "|cffFFFF99Enable movable class power|r")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Settings")
	Window:CreateDropdown("All", "ClassOptions", "ClassResourcesOrientation", "|cffFFFF99Set orientation|r")
	Window:CreateSlider("All", "ClassOptions", "ClassPowerWidth", "|cffFFFF99Set width|r", 4, 60, 1)
	Window:CreateSlider("All", "ClassOptions", "ClassPowerHeight", "|cffFFFF99Set height|r", 4, 60, 1)
	Window:CreateSlider("All", "ClassOptions", "ClassPowerSpace", "|cffFFFF99Set spacing|r", 0, 30, 1)
	Window:CreateDropdown("All", "ClassOptions", "ClassPowerTexture", "|cffFFFF99Set texture|r", "Texture")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("WOTLK", "Custom Mana / Energy Regen Ticker")
	Window:CreateSwitch("WOTLK", "UnitFrames", "PowerTick", "|cffFFFF99Enable Mana/Energy Ticker|r")
	Window:CreateSwitch("WOTLK", "ClassOptions", "MaxUITicker", "|cffFFFF99Enable Standalone Mana/Energy Ticker|r")
	Window:CreateSlider("WOTLK", "ClassOptions", "MaxUITickerLength", "|cffFFFF99Set Length for the custom Ticker|r", 30, 300, 1)
	Window:CreateDropdown("WOTLK", "ClassOptions", "OrientationTicker", " |cffFFFF99Orientation custom Ticker|r")
	Window:CreateSpacerNoPos("WOTLK")

	Window:CreateSection("All", "Combat State")
	Window:CreateDropdown("All", "ClassOptions", "ClassResourcesCombatState", "|cffFFFF99Set combat state for class resources|r")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("Retail" or "WOTLK", "|cffC41F3BDeathknight|r")
	Window:CreateSwitch("Retail" or "WOTLK", "ClassOptions", "Deathknight", "|cffC41F3BEnable runes for all specs|r")
	Window:CreateTextureWidget("Retail" or "WOTLK", "vectorDK")
	
	Window:CreateSection("Retail", "|cffA330C9Demonhunter|r")
	Window:CreateSwitch("Retail", "ClassOptions", "Demonhunter", "|cffA330C9No option available|r")
	Window:CreateTextureWidget("Retail", "vectorDH")
	
	Window:CreateSection("All", "|cffFF7D0ADruid|r")
	Window:CreateSwitch("All", "ClassOptions", "DruidAdditionalPower", "|cffFF7D0AEnable mana (additional powerbar) for Balance|r")
	Window:CreateSwitch("All", "ClassOptions", "Druid", "|cffFF7D0AEnable mana bar for Ferals (WIP)|r")
	Window:CreateSwitch("All", "UnitFrames", "ComboBar", "|cffFF7D0AEnable combo bar|r")
	Window:CreateTextureWidget("All", "vectorDR")
	
	Window:CreateSection("Retail", "|cff33937FEvoker|r")
	Window:CreateSwitch("Retail", "ClassOptions", "Evoker", "|cff33937FEnable essence|r")
	Window:CreateTextureWidget("Retail", "vectorEV")
	
	Window:CreateSection("All", "|cffABD473Hunter|r")
	Window:CreateSwitch("All", "ClassOptions", "Hunter", "|cffABD473No option available|r")
	Window:CreateTextureWidget("All", "vectorHU")
	
	Window:CreateSection("All", "|cff69CCF0Mage|r")
	Window:CreateSwitch("CLASSIC", "ClassOptions", "Mage", "|cff69CCF0No option available|r")
	Window:CreateSwitch("BCC", "ClassOptions", "Mage", "|cff69CCF0No option available|r")
	Window:CreateSwitch("WOTLK", "ClassOptions", "Mage", "|cff69CCF0No option available|r")
	Window:CreateSwitch("Retail", "ClassOptions", "Mage", "|cff69CCF0Enable arcane charges|r")
	Window:CreateTextureWidget("All", "vectorMA")

	Window:CreateSection("Retail", "|cff00FF96Monk|r")
	Window:CreateSwitch("Retail", "ClassOptions", "Monk", "|cff00FF96Enable harmony/chi|r")
	Window:CreateTextureWidget("Retail", "vectorMO")
	
	Window:CreateSection("All", "|cffF58CBAPaladin|r")
	Window:CreateSwitch("CLASSIC", "ClassOptions", "Paladin", "|cff69CCF0No option available|r")
	Window:CreateSwitch("BCC", "ClassOptions", "Paladin", "|cff69CCF0No option available|r")
	Window:CreateSwitch("WOTLK", "ClassOptions", "Paladin", "|cff69CCF0No option available|r")
	Window:CreateSwitch("Retail", "ClassOptions", "Paladin", "|cffF58CBAEnable holy power charges|r")
	Window:CreateTextureWidget("All", "vectorPA")
	
	Window:CreateSection("All", "|cffFCFCFCPriest|r")
	Window:CreateSwitch("CLASSIC", "ClassOptions", "PriestAdditionalPower", "|cffFCFCFCNo option available|r")
	Window:CreateSwitch("BCC", "ClassOptions", "PriestAdditionalPower", "|cffFCFCFCNo option available|r")
	Window:CreateSwitch("WOTLK", "ClassOptions", "PriestAdditionalPower", "|cffFCFCFCNo option available|r")
	Window:CreateSwitch("Retail", "ClassOptions", "PriestAdditionalPower", "|cffFCFCFCEnable mana (additional powerbar) for Shadow|r")
	Window:CreateSwitch("Retail", "ClassOptions", "PriestAtonement", "|cffFCFCFCEnable atonement for Discipline|r")
	Window:CreateTextureWidget("All", "vectorPR")
	
	Window:CreateSection("All", "|cffFFF569Rogue|r")
	Window:CreateSwitch("All", "UnitFrames", "ComboBar", "|cffFFF569Enable combo bar|r")
	Window:CreateTextureWidget("All", "vectorRO")
	
	Window:CreateSection("All", "|cff0070DEShaman|r")
	Window:CreateSwitch("All", "UnitFrames", "TotemBar", "|cff0070DEEnable totem bar|r")
	Window:CreateDropdown("All", "UnitFrames", "TotemBarStyle", "|cff0070DESet totems style|r")
	Window:CreateSlider("All", "ClassOptions", "ShamanTotemSize", "|cff0070DESet totem size (totem bar)|r", 0, 160, 1)
	Window:CreateSlider("All", "ClassOptions", "ShamanTotemSpace", "|cff0070DESet totem spacing|r", 0, 20, 1)
	Window:CreateTextLine("All", "|cff0070DE* Use the general width and height sliders for statusbars|r")
	Window:CreateSwitch("Retail", "ClassOptions", "ShamanAdditionalPower", "|cff0070DEEnable mana (additional powerbar) for Elemental|r")
	Window:CreateTextureWidget("All", "vectorSH")
	
	Window:CreateSection("All", "|cff9482C9Warlock|r")
	Window:CreateSwitch("CLASSIC", "ClassOptions", "Warlock", "|cff9482C9No option available|r")
	Window:CreateSwitch("BCC", "ClassOptions", "Warlock", "|cff9482C9No option available|r")
	Window:CreateSwitch("WOTLK", "ClassOptions", "Warlock", "|cff9482C9No option available|r")
	Window:CreateSwitch("Retail", "ClassOptions", "Warlock", "|cff9482C9Enable soul shards|r")
	Window:CreateTextureWidget("All", "vectorWL")

	Window:CreateSection("All", "|cffC79C6EWarrior|r")
	Window:CreateSwitch("All", "ClassOptions", "Warrior", "|cffC79C6ENo option available|r")
	Window:CreateTextureWidget("All", "vectorWA")
end
GUI:AddWidgets(ClassOptions)

------------------------------------------------------------------------------------------
-- UF - SPECIFIC
------------------------------------------------------------------------------------------
-- PLAYER UNITFRAME
------------------------------------------------------------------------------------------
local Player = function(self)
	local Window = self:CreateWindow("Unitfr. Player")
	
	Window:CreateWindowLogo("All", "|cffFFFF99Unitframes: Player|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6,  "Settings and options for the Player unitframe.")
	Window:CreateSpacer("All", 7)

	Window:CreateSection("All", "Enable")
	Window:CreateSwitch("All", "UF: Player", "Enable", "Enable PLAYER unitframe")
	Window:CreateSpacerNoPos("All")

	if C["UF: Player"]["Enable"] == true then 
		Window:CreateSection("All", "Styling")
		Window:CreateSwitch("All", "UF: Player", "PercentageTags", "|cffFFFF99Enable percentages|r")
		Window:CreateSwitch("All", "UF: Player", "CombatLog", "|cffFFFF99Enable combat feedback|r")
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Health")
		Window:CreateSlider("All", "UF: Player", "HealthHeight", "|cffFFFF99Set health horizontal height / vertical width|r", 10, 80, 1)
		Window:CreateSlider("All", "UF: Player", "HealthWidth", "|cffFFFF99Set health horizontal width / vertical height|r", 40, 400, 1)
		Window:CreateDropdown("All", "UnitFrames", "PlayerHealthTag", "|cffFFFF99Set health tag format|r")
		Window:CreateDropdown("All", "UF: Player", "HealthFont", "|cffFFFF99Set health font|r", "Font")
		Window:CreateSlider("All", "UF: Player", "HealthFontSize", "|cffFFFF99Set health font size|r", 6, 40, 1)
		Window:CreateDropdown("All", "UF: Player", "HealthTexture", "|cffFFFF99Set health texture|r", "Texture")
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Power")
		Window:CreateSlider("All", "UF: Player", "PowerHeight", "|cffFFFF99Set power horizontal height / vertical width|r", 2, 20, 1)
		Window:CreateSlider("All", "UF: Player", "PowerWidth", "|cffFFFF99Set power horizontal width / vertical height|r", 30, 300, 1)
		Window:CreateDropdown("All", "UF: Player", "PowerTag", "|cffFFFF99Set power tag format|r")
		Window:CreateDropdown("All", "UF: Player", "PowerFont", "|cffFFFF99Set power font|r", "Font")
		Window:CreateSlider("All", "UF: Player", "PowerFontSize", "|cffFFFF99Set power font size|r", 6, 40, 1)
		Window:CreateDropdown("All", "UF: Player", "PowerTexture", "|cffFFFF99Set power texture|r", "Texture")
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Name")
		Window:CreateDropdown("All", "UF: Player", "NameTag", "|cffFFFF99Set name tag format|r")
		Window:CreateDropdown("All", "UF: Player", "DescriptionTag", "|cffFFFF99Set description tag format|r")
		Window:CreateDropdown("All", "UF: Player", "NameFont", "|cffFFFF99Set name and description font|r", "Font")
		Window:CreateSlider("All", "UF: Player", "NameFontSize", "|cffFFFF99Set name font size|r", 6, 40, 1)
		Window:CreateSlider("All", "UF: Player", "DescFontSize", "|cffFFFF99Set description font size|r", 6, 40, 1)
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Castbar")
		Window:CreateSwitch("All", "UF: Player", "CastBar", "|cffFFFF99Enable castbar|r")
		Window:CreateSwitch("All", "UF: Player", "CastBarIcon", "|cffFFFF99Enable castbar icon|r")
		Window:CreateSwitch("All", "UF: Player", "CastBarText", "|cffFFFF99Enable castbar text|r")
		Window:CreateSwitch("All", "UF: Player", "CastBarTime", "|cffFFFF99Enable castbar time|r")
		Window:CreateDropdown("All", "UF: Player", "CastFont", "|cffFFFF99Set castbar font|r", "Font")
		Window:CreateSlider("All", "UF: Player", "CastFontSize", "|cffFFFF99Set castbar font size|r", 6, 40, 1)
		Window:CreateDropdown("All", "UF: Player", "CastTexture", "|cffFFFF99Set castbar texture|r", "Texture")
		Window:CreateSpacerNoPos("All")
		Window:CreateSwitch("All", "UF: Player", "CastBarUnlink", "|cffFFFF99Unlink player castbar|r")
		Window:CreateSlider("All", "UF: Player", "CastHeight", "|cffFFFF99Set unlinked castbar height|r", 2, 20, 1)
		Window:CreateSlider("All", "UF: Player", "CastWidth", "|cffFFFF99Set unlinked castbar width|r", 40, 400, 1)
		Window:CreateSpacerNoPos("All")
		Window:CreateSwitch("All", "UF: Player", "StandAloneCastBar", "|cffFFFF99Enable standalone castbar|r")
		Window:CreateSlider("All", "UF: Player", "StandAloneCastBarTimeOffsetV", "|cffFFFF99Set vertical offset for cast time|r", -100, 100, 1)
		Window:CreateSlider("All", "UF: Player", "StandAloneCastBarTextOffsetV", "|cffFFFF99Set vertical offset for cast text|r", -100, 100, 1)
		Window:CreateSlider("All", "UF: Player", "CastHeight", "|cffFFFF99Set standalone castbar height|r", 2, 20, 1)
		Window:CreateSlider("All", "UF: Player", "CastWidth", "|cffFFFF99Set standalone castbar width|r", 40, 400, 1)
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Buffs")
		Window:CreateSwitch("All", "UnitFrames", "PlayerBuffs", "|cffFFFF99Enable buffs|r")
		Window:CreateSwitch("All", "UF: Player", "OnlySelfBuffs", "|cffFFFF99Enable only self created buffs|r")
		Window:CreateSlider("All", "UF: Player", "BuffSize", "|cffFFFF99Set buffs size|r", 10, 40, 1)
		Window:CreateSlider("All", "UF: Player", "BuffNumber", "|cffFFFF99Set number of buffs displayed|r", 1, 40, 1)
		Window:CreateSlider("All", "UF: Player", "BuffNumberRows", "|cffFFFF99Set amount of rows displayed|r", 1, 5, 1)
		Window:CreateSlider("All", "UF: Player", "BuffSpacing", "|cffFFFF99Set buffs spacing|r", 0, 20, 1)
		Window:CreateDropdown("All", "UF: Player", "BuffsPlayerCombatState", "|cffFFFF99Set combat state|r")
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Debuffs")
		Window:CreateSwitch("All", "UnitFrames", "PlayerDebuffs", "|cffFFFF99Enable debuffs|r")
		Window:CreateSlider("All", "UF: Player", "DebuffSize", "|cffFFFF99Set debuff size|r", 10, 60, 1)
		Window:CreateSlider("All", "UF: Player", "DebuffNumber", "|cffFFFF99Set number of debuffs displayed|r", 1, 40, 1)
		Window:CreateSlider("All", "UF: Player", "DebuffNumberRows", "|cffFFFF99Set amount of rows displayed|r", 1, 5, 1)
		Window:CreateSlider("All", "UF: Player", "DebuffSpacing", "|cffFFFF99Set debuffs spacing|r", 0, 20, 1)
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Aurabars")
		Window:CreateSwitch("All", "UnitFrames", "PlayerAuraBars", "|cffFFFF99Convert to aurabars|r")
		Window:CreateDropdown("All", "UF: Player", "AuraBarsGrowDirection", "|cffFFFF99Set aurabars grow direction|r")
		Window:CreateDropdown("All", "UF: Player", "AuraBarsAlignment", "|cffFFFF99Set aligment for aurabars|r")
		Window:CreateSlider("All", "UF: Player", "AuraBarsHeight", "|cffFFFF99Set aurabars height|r", 10, 80, 1)
		Window:CreateSlider("All", "UF: Player", "AuraBarsWidth", "|cffFFFF99Set aurabars width|r", 40, 400, 1)
		Window:CreateSlider("All", "UF: Player", "AuraBarsSpacing", "|cffFFFF99Set aurabars spacing|r", 2, 20, 1)
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Rested icon")
		Window:CreateSwitch("All", "UF: Player", "RestedIcon", "Enable rested icon")
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("Retail", "Role icon")
		Window:CreateSwitch("Retail", "UF: Player", "RoleIcon", "|cffFFFF99Enable role icon|r")
		Window:CreateSlider("Retail", "UF: Player", "RoleIconSize", "|cffFFFF99Set role icon size|r", 2, 64, 1)
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Raid icon")
		Window:CreateSwitch("All", "UF: Player", "RaidIcon", "|cffFFFF99Enable raid marker|r")
		Window:CreateSlider("All", "UF: Player", "RaidIconSize", "|cffFFFF99Set raid marker size|r", 2, 64, 1)
		Window:CreateSpacerNoPos("All")
	
		Window:CreateSection("All", "Combat icon")
		Window:CreateSwitch("All", "UF: Player", "CombatIcon", "|cffFFFF99Enable combat icon|r")
		Window:CreateSlider("All", "UF: Player", "CombatIconSize", "|cffFFFF99Set combat icon size|r", 2, 64, 1)
		Window:CreateColorSelection("All", "UF: Player", "CombatIconColor", "|cffFFFF99Set combat icon color|r")
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Leader icon")
		Window:CreateSwitch("All", "UF: Player", "LeaderIcon", "|cffFFFF99Enable leader icon|r")
		Window:CreateSlider("All", "UF: Player", "LeaderIconSize", "|cffFFFF99Set leader icon size|r", 2, 64, 1)
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Master looter icon")
		Window:CreateSwitch("All", "UF: Player", "MasterLooterIcon", "|cffFFFF99Enable master looter icon|r")
		Window:CreateSlider("All", "UF: Player", "MasterLooterIconSize", "|cffFFFF99Set master looter icon size|r", 2, 64, 1)
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "PVP status icon")
		Window:CreateSwitch("All", "UF: Player", "PVPIcon", "|cffFFFF99Enable PVP icon|r")
		Window:CreateSlider("All", "UF: Player", "PVPIconSize", "|cffFFFF99Set pvp icon size|r", 2, 64, 1)
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Portrait")
		Window:CreateDropdown("All", "UF: Player", "PortraitStyle", "Set portrait style")
		Window:CreateSlider("All", "UF: Player", "PortraitOverlayAlpha", "Set portrait alpha", 0, 1, 0.1)
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Combat state")
		Window:CreateSwitch("All", "UF: Player", "NonCombatAlphaEnable", "Enable alpha settings for non-combat")
		Window:CreateSwitch("All", "UF: Player", "OnlyFullHP", "Enable only at full HP")
		Window:CreateSlider("All", "UF: Player", "NonCombatAlpha", "Set out of combat alpha", 0, 1, 0.1)
	end
end
GUI:AddWidgets(Player)

------------------------------------------------------------------------------------------
-- TARGET UNITFRAME
------------------------------------------------------------------------------------------
local Target = function(self)
	local Window = self:CreateWindow("Unitfr. Target")

	Window:CreateWindowLogo("All", "|cffFFFF99Unitframes: Target|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6,  "Settings and options for the Target unitframe.")
	Window:CreateSpacer("All", 7)

	Window:CreateSection("All", "Enable")
	Window:CreateSwitch("All", "UF: Target", "Enable", "Enable TARGET unitframe")
	Window:CreateSpacerNoPos("All")

	if C["UF: Target"]["Enable"] == true then 
		Window:CreateSection("All", "Color")
		Window:CreateSwitch("All", "UF: Target", "ColorThreat", "Enable threat colored health")
		Window:CreateSwitch("All", "UF: Target", "ColorGradient", "|cffFFFFFFEnable gradient colored health|r")
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Styling")
		Window:CreateSwitch("All", "UF: Target", "PercentageTags", "|cffFFFF99Enable percentages|r")
		Window:CreateSwitch("All", "UF: Target", "CombatLog", "|cffFFFF99Enable combat feedback|r")
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Health")
		Window:CreateSlider("All", "UF: Target", "HealthHeight", "|cffFFFF99Set health horizontal height / vertical width|r", 10, 80, 1)
		Window:CreateSlider("All", "UF: Target", "HealthWidth", "|cffFFFF99Set health horizontal width / vertical height|r", 40, 400, 1)
		Window:CreateDropdown("All", "UnitFrames", "TargetHealthTag", "|cffFFFF99Set health tag format|r")
		Window:CreateDropdown("All", "UF: Target", "HealthFont", "|cffFFFF99Set health font|r", "Font")
		Window:CreateSlider("All", "UF: Target", "HealthFontSize", "|cffFFFF99Set health font size|r", 6, 40, 1)
		Window:CreateDropdown("All", "UF: Target", "HealthTexture", "|cffFFFF99Set health texture|r", "Texture")
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Power")
		Window:CreateSlider("All", "UF: Target", "PowerHeight", "|cffFFFF99Set power horizontal height / vertical width|r", 2, 20, 1)
		Window:CreateSlider("All", "UF: Target", "PowerWidth", "|cffFFFF99Set power horizontal width / vertical height|r", 30, 300, 1)
		Window:CreateDropdown("All", "UF: Target", "PowerTag", "|cffFFFF99Set power tag format|r")
		Window:CreateDropdown("All", "UF: Target", "PowerFont", "|cffFFFF99Set power font|r", "Font")
		Window:CreateSlider("All", "UF: Target", "PowerFontSize", "|cffFFFF99Set power font size|r", 6, 40, 1)
		Window:CreateDropdown("All", "UF: Target", "PowerTexture", "|cffFFFF99Set power texture|r", "Texture")
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Name")
		Window:CreateDropdown("All", "UF: Target", "NameTag", "|cffFFFF99Set name tag format|r")
		Window:CreateDropdown("All", "UF: Target", "DescriptionTag", "|cffFFFF99Set description tag format|r")
		Window:CreateDropdown("All", "UF: Target", "NameFont", "|cffFFFF99Set name font|r", "Font")
		Window:CreateSlider("All", "UF: Target", "NameFontSize", "|cffFFFF99Set name font size|r", 6, 40, 1)
		Window:CreateSlider("All", "UF: Target", "DescFontSize", "|cffFFFF99Set description font size|r", 6, 40, 1)
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Castbar")
		Window:CreateSwitch("All", "UF: Target", "CastBar", "|cffFFFF99Enable castbar|r")
		Window:CreateSwitch("All", "UF: Target", "CastBarIcon", "|cffFFFF99Enable castbar icon|r")
		Window:CreateSwitch("All", "UF: Target", "CastBarText", "|cffFFFF99Enable castbar text|r")
		Window:CreateSwitch("All", "UF: Target", "CastBarTime", "|cffFFFF99Enable castbar time|r")
		Window:CreateDropdown("All", "UF: Target", "CastFont", "|cffFFFF99Set castbar font|r", "Font")
		Window:CreateSlider("All", "UF: Target", "CastFontSize", "|cffFFFF99Set castbar font size|r", 6, 40, 1)
		Window:CreateDropdown("All", "UF: Target", "CastTexture", "|cffFFFF99Set castbar texture|r", "Texture")
		Window:CreateSpacerNoPos("All")
		Window:CreateSwitch("All", "UF: Target", "CastBarUnlink", "|cffFFFF99Unlink target castbar|r")
		Window:CreateSlider("All", "UF: Target", "CastHeight", "|cffFFFF99Set unlinked castbar height|r", 2, 20, 1)
		Window:CreateSlider("All", "UF: Target", "CastWidth", "|cffFFFF99Set unlinked castbar width|r", 40, 400, 1)
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Buffs")
		Window:CreateSwitch("All", "UnitFrames", "TargetBuffs", "|cffFFFF99Enable buffs|r")
		Window:CreateSwitch("All", "UF: Target", "OnlySelfBuffs", "|cffFFFF99Enable only self created buffs|r")
		Window:CreateSlider("All", "UF: Target", "BuffSize", "|cffFFFF99Set buffs size|r", 10, 40, 1)
		Window:CreateSlider("All", "UF: Target", "BuffNumber", "|cffFFFF99Set number of buffs displayed|r", 1, 40, 1)
		Window:CreateSlider("All", "UF: Target", "BuffNumberRows", "|cffFFFF99Set amount of rows displayed|r", 1, 5, 1)
		Window:CreateSlider("All", "UF: Target", "BuffSpacing", "|cffFFFF99Set buffs spacing|r", 0, 20, 1)
		Window:CreateDropdown("All", "UF: Target", "BuffsTargetCombatState", "|cffFFFF99Set combat state|r")
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Debuffs")
		Window:CreateSwitch("All", "UnitFrames", "TargetDebuffs", "|cffFFFF99Enable debuffs|r")
		Window:CreateSwitch("All", "UF: Target", "OnlySelfDebuffs", "|cffFFFF99Enable only self created debuffs|r")
		Window:CreateSlider("All", "UF: Target", "DebuffSize", "|cffFFFF99Set debuffs size|r", 10, 60, 1)
		Window:CreateSlider("All", "UF: Target", "DebuffNumber", "|cffFFFF99Set number of debuffs displayed|r", 1, 40, 1)
		Window:CreateSlider("All", "UF: Target", "DebuffNumberRows", "|cffFFFF99Set amount of rows displayed|r", 1, 5, 1)
		Window:CreateSlider("All", "UF: Target", "DebuffSpacing", "|cffFFFF99Set debuffs spacing|r", 0, 20, 1)
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("Retail", "Role icon")
		Window:CreateSwitch("Retail", "UF: Target", "RoleIcon", "|cffFFFF99Enable role icon|r")
		Window:CreateSlider("Retail", "UF: Target", "RoleIconSize", "|cffFFFF99Set role icon size|r", 2, 64, 1)
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Raid icon")
		Window:CreateSwitch("All", "UF: Target", "RaidIcon", "|cffFFFF99Enable raid marker|r")
		Window:CreateSlider("All", "UF: Target", "RaidIconSize", "|cffFFFF99Set raid marker size|r", 2, 64, 1)
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Portrait")
		Window:CreateDropdown("All", "UF: Target", "PortraitStyle", "Set portrait style")
		Window:CreateSlider("All", "UF: Target", "PortraitOverlayAlpha", "Set portrait alpha", 0, 1, 0.1)
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Combat state")
		Window:CreateSwitch("All", "UF: Target", "NonCombatAlphaEnable", "Enable alpha settings for non-combat")
		Window:CreateSlider("All", "UF: Target", "NonCombatAlpha", "Set out of combat alpha", 0, 1, 0.1)
	end
end
GUI:AddWidgets(Target)

------------------------------------------------------------------------------------------
-- PET UNITFRAME
------------------------------------------------------------------------------------------
local Pet = function(self)
	local Window = self:CreateWindow("Unitfr. Pet")
	
	Window:CreateWindowLogo("All", "|cffFFFF99Unitframes: Pet|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6,  "Settings and options for the Pet unitframe.")
	Window:CreateSpacer("All", 7)

	Window:CreateSection("All", "Enable")
	Window:CreateSwitch("All", "UF: Pet", "Enable", "Enable PET unitframe")
	Window:CreateSpacerNoPos("All")
	
	if C["UF: Pet"]["Enable"] == true then 
		Window:CreateSection("All", "Styling")
		Window:CreateSwitch("All", "UnitFrames", "PetAuras", "Enable pet auras")

		Window:CreateSwitch("All", "UF: Pet", "PercentageTags", "|cffFFFF99Enable percentages|r")
		Window:CreateSpacerNoPos("All")
	
		Window:CreateSection("All", "Health")
		Window:CreateSlider("All", "UF: Pet", "HealthHeight", "|cffFFFF99Set health horizontal height / vertical width|r", 10, 80, 1)
		Window:CreateSlider("All", "UF: Pet", "HealthWidth", "|cffFFFF99Set health horizontal width / vertical height|r", 40, 400, 1)
		Window:CreateDropdown("All", "UF: Pet", "HealthTag", "|cffFFFF99Set health tag format|r")
		Window:CreateDropdown("All", "UF: Pet", "HealthFont", "|cffFFFF99Set health font|r", "Font")
		Window:CreateSlider("All", "UF: Pet", "HealthFontSize", "|cffFFFF99Set health font size|r", 6, 40, 1)
		Window:CreateDropdown("All", "UF: Pet", "HealthTexture", "|cffFFFF99Set health texture|r", "Texture")
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Power")
		Window:CreateSlider("All", "UF: Pet", "PowerHeight", "|cffFFFF99Set power horizontal height / vertical width|r", 2, 20, 1)
		Window:CreateSlider("All", "UF: Pet", "PowerWidth", "|cffFFFF99Set power horizontal width / vertical height|r", 30, 300, 1)
		Window:CreateDropdown("All", "UF: Pet", "PowerTag", "|cffFFFF99Set power tag format|r")
		Window:CreateDropdown("All", "UF: Pet", "PowerFont", "|cffFFFF99Set power font|r", "Font")
		Window:CreateSlider("All", "UF: Pet", "PowerFontSize", "|cffFFFF99Set power font size|r", 6, 40, 1)
		Window:CreateDropdown("All", "UF: Pet", "PowerTexture", "|cffFFFF99Set power texture|r", "Texture")
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Name")
		Window:CreateDropdown("All", "UF: Pet", "NameTag", "|cffFFFF99Set name tag format|r")
		Window:CreateDropdown("All", "UF: Pet", "NameFont", "|cffFFFF99Set name font|r", "Font")
		Window:CreateSlider("All", "UF: Pet", "NameFontSize", "|cffFFFF99Set name font size|r", 6, 40, 1)
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Castbar")
		Window:CreateSwitch("All", "UF: Pet", "CastBar", "|cffFFFF99Enable castbar|r")
		Window:CreateSwitch("All", "UF: Pet", "CastBarText", "|cffFFFF99Enable castbar text|r")
		Window:CreateSwitch("All", "UF: Pet", "CastBarTime", "|cffFFFF99Enable castbar time|r")
		Window:CreateDropdown("All", "UF: Pet", "CastFont", "|cffFFFF99Set castbar font|r", "Font")
		Window:CreateSlider("All", "UF: Pet", "CastFontSize", "|cffFFFF99Set castbar font size|r", 6, 40, 1)
		Window:CreateDropdown("All", "UF: Pet", "CastTexture", "|cffFFFF99Set castbar texture|r", "Texture")
		Window:CreateSpacerNoPos("All")
		Window:CreateSwitch("All", "UF: Pet", "CastBarUnlink", "|cffFFFF99Unlink castbar|r")
		Window:CreateSlider("All", "UF: Pet", "CastHeight", "|cffFFFF99Set unlinked castbar height|r", 2, 20, 1)
		Window:CreateSlider("All", "UF: Pet", "CastWidth", "|cffFFFF99Set unlinked castbar width|r", 40, 400, 1)
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Buffs")
		Window:CreateSwitch("All", "UF: Pet", "Buffs", "|cffFFFF99Enable buffs|r")
		Window:CreateSwitch("All", "UF: Pet", "OnlySelfBuffs", "|cffFFFF99Enable only self created buffs|r")
		Window:CreateSlider("All", "UF: Pet", "BuffSize", "|cffFFFF99Set buffs size|r", 10, 40, 1)
		Window:CreateSlider("All", "UF: Pet", "BuffNumber", "|cffFFFF99Set number of buffs displayed|r", 1, 40, 1)
		Window:CreateSlider("All", "UF: Pet", "BuffNumberRows", "|cffFFFF99Set amount of rows displayed|r", 1, 5, 1)
		Window:CreateSlider("All", "UF: Pet", "BuffSpacing", "|cffFFFF99Set buffs spacing|r", 0, 20, 1)
		Window:CreateDropdown("All", "UF: Pet", "BuffsPetCombatState", "|cffFFFF99Set combat state|r")
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Debuffs")
		Window:CreateSwitch("All", "UF: Pet", "Debuffs", "|cffFFFF99Enable debuffs|r")
		Window:CreateSlider("All", "UF: Pet", "DebuffSize", "|cffFFFF99Set debuffs Size|r", 10, 60, 1)
		Window:CreateSlider("All", "UF: Pet", "DebuffNumber", "|cffFFFF99Set number of debuffs displayed|r", 1, 40, 1)
		Window:CreateSlider("All", "UF: Pet", "DebuffNumberRows", "|cffFFFF99Set amount of rows displayed|r", 1, 5, 1)
		Window:CreateSlider("All", "UF: Pet", "DebuffSpacing", "|cffFFFF99Set debuffs spacing|r", 0, 20, 1)
		Window:CreateSpacerNoPos("All")
	
		Window:CreateSection("All", "Raid icon")
		Window:CreateSwitch("All", "UF: Pet", "RoleIcon", "|cffFFFF99Enable a raid marker icon|r")
		Window:CreateSlider("All", "UF: Pet", "RaidIconSize", "|cffFFFF99Set raid marker size|r", 2, 64, 1)
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Portrait")
		Window:CreateDropdown("All", "UF: Pet", "PortraitStyle", "Set portrait style")
		Window:CreateSlider("All", "UF: Pet", "PortraitOverlayAlpha", "Set portrait alpha", 0, 1, 0.1)
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Combat state")
		Window:CreateSwitch("All", "UF: Pet", "NonCombatAlphaEnable", "Enable alpha settings for non-combat")
		Window:CreateSlider("All", "UF: Pet", "NonCombatAlpha", "Set out of combat alpha", 0, 1, 0.1)
	end
end
GUI:AddWidgets(Pet)

------------------------------------------------------------------------------------------
-- TARGET OF TARGET UNITFRAME
------------------------------------------------------------------------------------------
local TargetOfTarget = function(self)
	local Window = self:CreateWindow("Unitfr. ToT")
	
	Window:CreateWindowLogo("All", "|cffFFFF99Unitframes: Target of target|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6,  "Settings and options for the Target of target unitframe.")
	Window:CreateSpacer("All", 7)

	Window:CreateSection("All", "Enable")
	Window:CreateSwitch("All", "UF: ToT", "Enable", "Enable TARGET OF TARGET unitframe")
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Styling")
	Window:CreateSwitch("All", "UnitFrames", "TOTAuras", "Enable target of target auras")
	Window:CreateSwitch("All", "UF: ToT", "ColorThreat", "Enable threat colored health")
	
	if C["UF: ToT"]["Enable"] == true then 
		Window:CreateSwitch("All", "UF: ToT", "PercentageTags", "|cffFFFF99Enable percentages|r")
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Health")
		Window:CreateSlider("All", "UF: ToT", "HealthHeight", "|cffFFFF99Set health horizontal height / vertical width|r", 10, 80, 1)
		Window:CreateSlider("All", "UF: ToT", "HealthWidth", "|cffFFFF99Set health horizontal width / vertical height|r", 40, 400, 1)
		Window:CreateDropdown("All", "UF: ToT", "HealthTag", "|cffFFFF99Set health tag format|r")
		Window:CreateDropdown("All", "UF: ToT", "HealthFont", "|cffFFFF99Set health font|r", "Font")
		Window:CreateSlider("All", "UF: ToT", "HealthFontSize", "|cffFFFF99Set health font size|r", 6, 40, 1)
		Window:CreateDropdown("All", "UF: ToT", "HealthTexture", "|cffFFFF99Set health texture|r", "Texture")
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Power")
		Window:CreateSlider("All", "UF: ToT", "PowerHeight", "|cffFFFF99Set power horizontal height / vertical width|r", 2, 20, 1)
		Window:CreateSlider("All", "UF: ToT", "PowerWidth", "|cffFFFF99Set power horizontal width / vertical height|r", 30, 300, 1)
		Window:CreateDropdown("All", "UF: ToT", "PowerTag", "|cffFFFF99Set power tag format|r")
		Window:CreateDropdown("All", "UF: ToT", "PowerFont", "|cffFFFF99Set power font|r", "Font")
		Window:CreateSlider("All", "UF: ToT", "PowerFontSize", "|cffFFFF99Set power font size|r", 6, 40, 1)
		Window:CreateDropdown("All", "UF: ToT", "PowerTexture", "|cffFFFF99Set power texture|r", "Texture")
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Name")
		Window:CreateDropdown("All", "UF: ToT", "NameTag", "|cffFFFF99Set name tag format|r")
		Window:CreateDropdown("All", "UF: ToT", "NameFont", "|cffFFFF99Set name font|r", "Font")
		Window:CreateSlider("All", "UF: ToT", "NameFontSize", "|cffFFFF99Set name font size|r", 6, 40, 1)
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Castbar")
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Buffs")
		Window:CreateSwitch("All", "UF: ToT", "Buffs", "|cffFFFF99Enable buffs|r")
		Window:CreateSwitch("All", "UF: ToT", "OnlySelfBuffs", "|cffFFFF99Enable only self created buffs|r")
		Window:CreateSlider("All", "UF: ToT", "BuffSize", "|cffFFFF99Set buffs size|r", 10, 40, 1)
		Window:CreateSlider("All", "UF: ToT", "BuffNumber", "|cffFFFF99Set number of buffs displayed|r", 1, 40, 1)
		Window:CreateSlider("All", "UF: ToT", "BuffNumberRows", "|cffFFFF99Set amount of rows displayed|r", 1, 5, 1)
		Window:CreateSlider("All", "UF: ToT", "BuffSpacing", "|cffFFFF99Set buffs spacing|r", 0, 20, 1)
		Window:CreateDropdown("All", "UF: ToT", "BuffsToTCombatState", "|cffFFFF99Set combat state|r")
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Debuffs")
		Window:CreateSwitch("All", "UF: ToT", "Debuffs", "|cffFFFF99Enable debuffs|r")
		Window:CreateSwitch("All", "UF: ToT", "OnlySelfDebuffs", "|cffFFFF99Enable only self created debuffs|r")
		Window:CreateSlider("All", "UF: ToT", "DebuffSize", "|cffFFFF99Set debuffs size|r", 10, 60, 1)
		Window:CreateSlider("All", "UF: ToT", "DebuffNumber", "|cffFFFF99Set number of debuffs displayed|r", 1, 40, 1)
		Window:CreateSlider("All", "UF: ToT", "DebuffNumberRows", "|cffFFFF99Set amount of rows displayed|r", 1, 5, 1)
		Window:CreateSlider("All", "UF: ToT", "DebuffSpacing", "|cffFFFF99Set debuffs spacing|r", 0, 20, 1)
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("Retail", "Role icon")
		Window:CreateSwitch("Retail", "UF: ToT", "RoleIcon", "|cffFFFF99Enable role icon|r")
		Window:CreateSlider("Retail", "UF: ToT", "RoleIconSize", "|cffFFFF99Set role icon size|r", 2, 64, 1)
		Window:CreateSpacerNoPos("Retail")
		
		Window:CreateSection("All", "Raid icon")
		Window:CreateSwitch("All", "UF: ToT", "RoleIcon", "|cffFFFF99Enable a raid marker icon|r")
		Window:CreateSlider("All", "UF: ToT", "RaidIconSize", "|cffFFFF99Set raid marker size|r", 2, 64, 1)
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Portrait")
		Window:CreateDropdown("All", "UF: ToT", "PortraitStyle", "Set portrait style")
		Window:CreateSlider("All", "UF: ToT", "PortraitOverlayAlpha", "Set portrait alpha", 0, 1, 0.1)
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Combat state")
		Window:CreateSwitch("All", "UF: ToT", "NonCombatAlphaEnable", "Enable alpha settings for non-combat")
		Window:CreateSlider("All", "UF: ToT", "NonCombatAlpha", "Set out of combat alpha", 0, 1, 0.1)
	end
end
GUI:AddWidgets(TargetOfTarget)

------------------------------------------------------------------------------------------
-- FOCUS UNITFRAME
------------------------------------------------------------------------------------------
local Focus = function(self)
	local Window = self:CreateWindow("Unitfr. Focus")
	
	Window:CreateWindowLogo("All", "|cffFFFF99Unitframes: Focus & Focus target|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6,  "Settings and options for the Focus unitframe and Focus' target.")
	Window:CreateExplanationText("All", 7,  "The target frame is mostly mirrored from the Focus frame.")
	Window:CreateSpacer("All", 8)

	Window:CreateSection("All", "Enable")
	Window:CreateSwitch("All", "UF: Focus", "Enable", "Enable FOCUS unitframe")
	Window:CreateSwitch("All", "UF: Focus", "EnableFT", "Enable FOCUS TARGET unitframe (All settings are mirrored)")
	Window:CreateSpacerNoPos("All")
	
	if C["UF: Focus"]["Enable"] == true then 
		Window:CreateSection("All", "Color")
		Window:CreateSwitch("All", "UF: Focus", "ColorThreat", "Enable threat colored health")
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Styling")
		Window:CreateSwitch("All", "UF: Focus", "PercentageTags", "|cffFFFF99Enable percentages|r")
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Health")
		Window:CreateSlider("All", "UF: Focus", "HealthHeight", "|cffFFFF99Set health height|r", 10, 80, 1)
		Window:CreateSlider("All", "UF: Focus", "HealthWidth", "|cffFFFF99Set health width|r", 40, 400, 1)
		Window:CreateDropdown("All", "UnitFrames", "FocusHealthTag", "|cffFFFF99Set health tag format for Focus|r")
		Window:CreateDropdown("All", "UF: Focus", "HealthFont", "|cffFFFF99Set health font|r", "Font")
		Window:CreateSlider("All", "UF: Focus", "HealthFontSize", "|cffFFFF99Set health font size|r", 6, 40, 1)
		Window:CreateDropdown("All", "UF: Focus", "HealthTexture", "|cffFFFF99Set health texture|r", "Texture")
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Power")
		Window:CreateSlider("All", "UF: Focus", "PowerHeight", "|cffFFFF99Set power height|r", 2, 20, 1)
		Window:CreateSlider("All", "UF: Focus", "PowerWidth", "|cffFFFF99Set power width|r", 30, 300, 1)
		Window:CreateDropdown("All", "UF: Focus", "PowerTag", "|cffFFFF99Set power tag format|r")
		Window:CreateDropdown("All", "UF: Focus", "PowerFont", "|cffFFFF99Set power font|r", "Font")
		Window:CreateSlider("All", "UF: Focus", "PowerFontSize", "|cffFFFF99Set power font size|r", 6, 40, 1)
		Window:CreateDropdown("All", "UF: Focus", "PowerTexture", "|cffFFFF99Set power texture|r", "Texture")
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Name")
		Window:CreateDropdown("All", "UF: Focus", "FocusNameTag", "|cffFFFF99Set name tag format for Focus|r")
		Window:CreateDropdown("All", "UF: Focus", "NameFont", "|cffFFFF99Set name font|r", "Font")
		Window:CreateSlider("All", "UF: Focus", "NameFontSize", "|cffFFFF99Set name font size|r", 6, 40, 1)
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Castbar")
		Window:CreateSwitch("All", "UF: Focus", "CastBar", "|cffFFFF99Enable castbar|r")
		Window:CreateSwitch("All", "UF: Focus", "CastBarIcon", "|cffFFFF99Enable castbar icon|r")
		Window:CreateSwitch("All", "UF: Focus", "CastBarText", "|cffFFFF99Enable castbar text|r")
		Window:CreateSwitch("All", "UF: Focus", "CastBarTime", "|cffFFFF99Enable castbar time|r")
		Window:CreateDropdown("All", "UF: Focus", "CastFont", "|cffFFFF99Set castbar font|r", "Font")
		Window:CreateSlider("All", "UF: Focus", "CastFontSize", "|cffFFFF99Set castbar font size|r", 6, 40, 1)
		Window:CreateDropdown("All", "UF: Focus", "CastTexture", "|cffFFFF99Set castbar texture|r", "Texture")
		Window:CreateSpacerNoPos("All")
		Window:CreateSwitch("All", "UF: Focus", "CastBarUnlink", "|cffFFFF99Unlink castbar|r")
		Window:CreateSlider("All", "UF: Focus", "CastHeight", "|cffFFFF99Set unlinked castbar height|r", 2, 20, 1)
		Window:CreateSlider("All", "UF: Focus", "CastWidth", "|cffFFFF99Set unlinked castbar width|r", 40, 400, 1)
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Buffs")
		Window:CreateSwitch("All", "UF: Focus", "Buffs", "|cffFFFF99Enable buffs|r")
		Window:CreateSlider("All", "UF: Focus", "NumberOfBuffsShown", "|cffFFFF99Set number of buffs shown|r", 0, 10, 1)
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Debuffs")
		Window:CreateSwitch("All", "UF: Focus", "Debuffs", "|cffFFFF99Enable debuffs|r")
		Window:CreateSlider("All", "UF: Focus", "NumberOfDebuffsShown", "|cffFFFF99Set number of debuffs shown|r", 0, 20, 1)
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("Retail", "Role icon")
		Window:CreateSwitch("Retail", "UF: Focus", "RoleIcon", "|cffFFFF99Enable role icon|r")
		Window:CreateSlider("Retail", "UF: Focus", "RoleIconSize", "|cffFFFF99Set role icon size|r", 2, 64, 1)
		Window:CreateSpacerNoPos("Retail")
		
		Window:CreateSection("All", "Raid icon")
		Window:CreateSwitch("All", "UF: Focus", "RaidIcon", "|cffFFFF99Enable raid marker|r")
		Window:CreateSlider("All", "UF: Focus", "RaidIconSize", "|cffFFFF99Set raid marker size|r", 2, 64, 1)
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Portrait")
		Window:CreateDropdown("All", "UF: Focus", "PortraitStyle", "Set portrait style")
		Window:CreateSlider("All", "UF: Focus", "PortraitOverlayAlpha", "Set portrait alpha", 0, 1, 0.1)
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Combat state")
		Window:CreateSwitch("All", "UF: Focus", "NonCombatAlphaEnable", "Enable alpha settings for non-combat")
		Window:CreateSlider("All", "UF: Focus", "NonCombatAlpha", "Set out of combat alpha", 0, 1, 0.1)
	end
end
GUI:AddWidgets(Focus)

------------------------------------------------------------------------------------------
-- BOSS UNITFRAME
------------------------------------------------------------------------------------------
local Boss = function(self)
	local Window = self:CreateWindow("Unitfr. Boss")
	
	Window:CreateWindowLogo("All", "|cffFFFF99Unitframes: Boss|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6,  "Settings and options for the Boss unitframes.")
	Window:CreateSpacer("All", 7)

	Window:CreateSection("All", "Enable")
	Window:CreateSwitch("All", "UnitFrames", "Boss", "Enable BOSS unitframe(s)")
	Window:CreateSpacerNoPos("All")
	
	if C["UnitFrames"]["Boss"] == true then 
		Window:CreateSection("All", "Color")
		Window:CreateSwitch("All", "UF: Boss", "ColorThreat", "Enable threat colored health")
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Styling")
		Window:CreateSwitch("All", "UF: Boss", "PercentageTags", "|cffFFFF99Enable percentages|r")
		Window:CreateSlider("All", "UF: Boss", "Spacing", "|cffFFFF99Set spacing|r", 50, 300, 1)
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Health")
		Window:CreateSlider("All", "UF: Boss", "HealthHeight", "|cffFFFF99Set health height|r", 10, 80, 1)
		Window:CreateSlider("All", "UF: Boss", "HealthWidth", "|cffFFFF99Set health width|r", 40, 400, 1)
		Window:CreateDropdown("All", "UnitFrames", "BossHealthTag", "|cffFFFF99Set health tag format|r")
		Window:CreateDropdown("All", "UF: Boss", "HealthFont", "|cffFFFF99Set health font|r", "Font")
		Window:CreateSlider("All", "UF: Boss", "HealthFontSize", "|cffFFFF99Set health font size|r", 6, 40, 1)
		Window:CreateDropdown("All", "UF: Boss", "HealthTexture", "|cffFFFF99Set health texture|r", "Texture")
		Window:CreateSpacerNoPos("All")
		Window:CreateSwitch("All", "UF: Boss", "HealComm", "|cffFFFF99Enable health prediction for boss unitframes|r")
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Power")
		Window:CreateSlider("All", "UF: Boss", "PowerHeight", "|cffFFFF99Set power height|r", 2, 20, 1)
		Window:CreateSlider("All", "UF: Boss", "PowerWidth", "|cffFFFF99Set power width|r", 30, 300, 1)
		Window:CreateDropdown("All", "UF: Boss", "PowerTag", "|cffFFFF99Set power tag format|r")
		Window:CreateDropdown("All", "UF: Boss", "PowerFont", "|cffFFFF99Set power font|r", "Font")
		Window:CreateSlider("All", "UF: Boss", "PowerFontSize", "|cffFFFF99Set power font size|r", 6, 40, 1)
		Window:CreateDropdown("All", "UF: Boss", "PowerTexture", "|cffFFFF99Set power texture|r", "Texture")
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Name")
		Window:CreateDropdown("All", "UF: Boss", "NameTag", "|cffFFFF99Set name tag format|r")
		Window:CreateDropdown("All", "UF: Boss", "NameFont", "|cffFFFF99Set name font|r", "Font")
		Window:CreateSlider("All", "UF: Boss", "NameFontSize", "|cffFFFF99Set name font size|r", 6, 40, 1)
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Castbar")
		Window:CreateSwitch("All", "UF: Boss", "CastBar", "|cffFFFF99Enable castbar|r")
		Window:CreateSwitch("All", "UF: Boss", "CastBarIcon", "|cffFFFF99Enable castbar icon|r")
		Window:CreateSwitch("All", "UF: Boss", "CastBarText", "|cffFFFF99Enable castbar text|r")
		Window:CreateSwitch("All", "UF: Boss", "CastBarTime", "|cffFFFF99Enable castbar time|r")
		Window:CreateDropdown("All", "UF: Boss", "CastFont", "|cffFFFF99Set castbar font|r", "Font")
		Window:CreateSlider("All", "UF: Boss", "CastFontSize", "|cffFFFF99Set for castbar font size|r", 6, 40, 1)
		Window:CreateDropdown("All", "UF: Boss", "CastTexture", "|cffFFFF99Set castbar texture|r", "Texture")
		Window:CreateSpacerNoPos("All")
		Window:CreateSwitch("All", "UF: Boss", "CastBarUnlink", "|cffFFFF99Unlink castbar|r")
		Window:CreateSlider("All", "UF: Boss", "CastHeight", "|cffFFFF99Set unlinked castbar height|r", 2, 20, 1)
		--Window:CreateSlider("All", "UF: Boss", "CastWidth", "|cffFFFF99Set unlinked castbar width|r", 40, 400, 1)		
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Buffs")
		Window:CreateSwitch("All", "UF: Boss", "Buffs", "|cffFFFF99Enable buffs|r")
		Window:CreateSlider("All", "UF: Boss", "NumberOfBuffsShown", "|cffFFFF99Set number of buffs shown|r", 0, 8, 1)
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Debuffs")
		Window:CreateSwitch("All", "UF: Boss", "Debuffs", "|cffFFFF99Enable debuffs|r")
		Window:CreateSlider("All", "UF: Boss", "NumberOfDebuffsShown", "|cffFFFF99Set number of debuffs shown|r", 0, 20, 1)
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Raid icon")
		Window:CreateSwitch("All", "UF: Boss", "RaidIcon", "|cffFFFF99Enable raid marker|r")
		Window:CreateSlider("All", "UF: Boss", "RaidIconSize", "|cffFFFF99Set raid marker size|r", 2, 64, 1)
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Portrait")
		Window:CreateDropdown("All", "UF: Boss", "PortraitStyle", "Set portrait style")
		Window:CreateSlider("All", "UF: Boss", "PortraitOverlayAlpha", "Set portrait alpha", 0, 1, 0.1)
	end
end
GUI:AddWidgets(Boss)

------------------------------------------------------------------------------------------
-- ARENA UNITFRAME
------------------------------------------------------------------------------------------
local Arena = function(self)
	local Window = self:CreateWindow("Unitfr. Arena")
	
	Window:CreateWindowLogo("All", "|cffFFFF99Unitframes: Arena|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6,  "Settings and options for the Arena unitframes.")
	Window:CreateSpacer("All", 7)

	Window:CreateSection("All", "Enable")
	Window:CreateSwitch("All", "UnitFrames", "Arena", "Enable ARENA unitframe(s)")
	Window:CreateSpacerNoPos("All")
	
	if C["UnitFrames"]["Arena"] == true then 
		Window:CreateSection("All", "Color")
		Window:CreateSwitch("All", "UF: Arena", "ColorThreat", "Enable threat colored health")
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Styling")
		Window:CreateSwitch("All", "UF: Arena", "PercentageTags", "|cffFFFF99Enable percentages|r")
		Window:CreateSwitch("All", "UF: Arena", "SpecIcon", "|cffFFFF99Enable spec icon|r")
		Window:CreateSwitch("All", "UF: Arena", "Trinket", "|cffFFFF99Enable trinket display|r")
		Window:CreateSlider("All", "UF: Arena", "Spacing", "|cffFFFF99Set spacing|r", 50, 300, 1)
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Health")
		Window:CreateSlider("All", "UF: Arena", "HealthHeight", "|cffFFFF99Set health height|r", 10, 80, 1)
		Window:CreateSlider("All", "UF: Arena", "HealthWidth", "|cffFFFF99Set health width|r", 40, 400, 1)
		Window:CreateDropdown("All", "UF: Arena", "HealthTag", "|cffFFFF99Set health tag format|r")
		Window:CreateDropdown("All", "UF: Arena", "HealthFont", "|cffFFFF99Set health font|r", "Font")
		Window:CreateSlider("All", "UF: Arena", "HealthFontSize", "|cffFFFF99Set health font size|r", 6, 40, 1)
		Window:CreateDropdown("All", "UF: Arena", "HealthTexture", "|cffFFFF99Set health texture|r", "Texture")
		Window:CreateSpacerNoPos("All")
		Window:CreateSwitch("All", "UF: Arena", "HealComm", "|cffFFFF99Enable health prediction for arena unitframes|r")
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Power")
		Window:CreateSlider("All", "UF: Arena", "PowerHeight", "|cffFFFF99Set power height|r", 2, 20, 1)
		Window:CreateSlider("All", "UF: Arena", "PowerWidth", "|cffFFFF99Set power width|r", 30, 300, 1)
		Window:CreateDropdown("All", "UF: Arena", "PowerTag", "|cffFFFF99Set power tag format|r")
 		Window:CreateDropdown("All", "UF: Arena", "PowerFont", "|cffFFFF99Set power font|r", "Font")
		Window:CreateSlider("All", "UF: Arena", "PowerFontSize", "|cffFFFF99Set power font size|r", 6, 40, 1)
		Window:CreateDropdown("All", "UF: Arena", "PowerTexture", "|cffFFFF99Set power texture|r", "Texture")
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Name")
		Window:CreateDropdown("All", "UF: Arena", "NameTag", "|cffFFFF99Set name tag format|r")
		Window:CreateDropdown("All", "UF: Arena", "NameFont", "|cffFFFF99Set name font|r", "Font")
		Window:CreateSlider("All", "UF: Arena", "NameFontSize", "|cffFFFF99Set name font size|r", 6, 40, 1)
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Castbar")
		Window:CreateSwitch("All", "UF: Arena", "CastBar", "|cffFFFF99Enable castbar|r")
		Window:CreateSwitch("All", "UF: Arena", "CastBarIcon", "|cffFFFF99Enable castbar icon|r")
		Window:CreateSwitch("All", "UF: Arena", "CastBarText", "|cffFFFF99Enable castbar text|r")
		Window:CreateSwitch("All", "UF: Arena", "CastBarTime", "|cffFFFF99Enable castbar time|r")
		Window:CreateDropdown("All", "UF: Arena", "CastFont", "|cffFFFF99Set castbar font|r", "Font")
		Window:CreateSlider("All", "UF: Arena", "CastFontSize", "|cffFFFF99Set castbar font size|r", 6, 40, 1)
		Window:CreateDropdown("All", "UF: Arena", "CastTexture", "|cffFFFF99Set castbar texture|r", "Texture")
		Window:CreateSpacerNoPos("All")
		Window:CreateSwitch("All", "UF: Arena", "CastBarUnlink", "|cffFFFF99Unlink castbar|r")
		Window:CreateSlider("All", "UF: Arena", "CastHeight", "|cffFFFF99Set unlinked castbar height|r", 2, 20, 1)
		Window:CreateSlider("All", "UF: Arena", "CastWidth", "|cffFFFF99Set unlinked castbar width|r", 40, 400, 1)		
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Buffs")
		Window:CreateSwitch("All", "UF: Arena", "Buffs", "|cffFFFF99Enable buffs|r")
		Window:CreateSlider("All", "UF: Arena", "NumberOfBuffsShown", "|cffFFFF99Set number of buffs shown|r", 0, 10, 1)
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Debuffs")
		Window:CreateSwitch("All", "UF: Arena", "Debuffs", "|cffFFFF99Enable debuffs|r")
		Window:CreateSlider("All", "UF: Arena", "NumberOfDebuffsShown", "|cffFFFF99Set number of debuffs shown|r", 0, 20, 1)
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Raid icon")
		Window:CreateSwitch("All", "UF: Arena", "RaidIcon", "|cffFFFF99Enable raid marker|r")
		Window:CreateSlider("All", "UF: Arena", "RaidIconSize", "|cffFFFF99Set raid marker size|r", 2, 64, 1)
		Window:CreateSpacerNoPos("All")
		
		Window:CreateSection("All", "Spec icon")
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Trinket icon")
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Portrait")
		Window:CreateDropdown("All", "UF: Arena", "PortraitStyle", "Set portrait style")
		Window:CreateSlider("All", "UF: Arena", "PortraitOverlayAlpha", "Set portrait alpha", 0, 1, 0.1)
		Window:CreateSpacerNoPos("All")

		Window:CreateSection("All", "Combat state")
		Window:CreateSwitch("All", "UF: Arena", "NonCombatAlphaEnable", "Enable alpha settings for non-combat")
		Window:CreateSlider("All", "UF: Arena", "NonCombatAlpha", "Set out of combat alpha", 0, 1, 0.1)
	end
end
GUI:AddWidgets(Arena)