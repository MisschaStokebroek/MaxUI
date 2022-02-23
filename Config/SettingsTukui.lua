------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 01-08-2021
------------------------------------------------------------------------------------------

-- setting up BASIC CONFIGURATION for Tukui options and settings.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()

------------------------------------------------------------------------------------------
-- in game configuration base settings (standard TukUI)
------------------------------------------------------------------------------------------

-- General
C["General"]["BackdropColor"] = {0.11, 0.11, 0.11}
C["General"]["BorderColor"] = {0, 0, 0}
C["General"]["ClassColorBorder"] = false
C["General"]["UseGlobal"] = false
C["General"]["HideShadows"] = false
C["General"]["UIScale"] = T.PerfectScale
C["General"]["MinimapScale"] = 120
C["General"]["WorldMapScale"] = 60

-- Actionbars	
C["ActionBars"]["Enable"] = true
C["ActionBars"]["BottomLeftBar"] = true
C["ActionBars"]["BottomRightBar"] = true
C["ActionBars"]["RightBar"] = true
C["ActionBars"]["LeftBar"] = true
C["ActionBars"]["HotKey"] = true
C["ActionBars"]["EquipBorder"] = true
C["ActionBars"]["Macro"] = false
C["ActionBars"]["ShapeShift"] = true
C["ActionBars"]["Pet"] = true
C["ActionBars"]["SwitchBarOnStance"] = true
C["ActionBars"]["Bar1ButtonsPerRow"] = 6
C["ActionBars"]["Bar2ButtonsPerRow"] = 6
C["ActionBars"]["Bar3ButtonsPerRow"] = 6
C["ActionBars"]["Bar4ButtonsPerRow"] = 6
C["ActionBars"]["Bar5ButtonsPerRow"] = 6
C["ActionBars"]["Bar1NumButtons"] = 12
C["ActionBars"]["Bar2NumButtons"] = 12
C["ActionBars"]["Bar3NumButtons"] = 12
C["ActionBars"]["Bar4NumButtons"] = 12
C["ActionBars"]["Bar5NumButtons"] = 12
C["ActionBars"]["BarPetButtonsPerRow"] = 10
C["ActionBars"]["NormalButtonSize"] = 32
C["ActionBars"]["PetButtonSize"] = 26
C["ActionBars"]["ButtonSpacing"] = 4
C["ActionBars"]["ShowBackdrop"] = true
C["ActionBars"]["AutoAddNewSpell"] = false
C["ActionBars"]	["ProcAnim"] = true
C["ActionBars"]["Font"] = "MaxUI Outlined"

-- Auras
C["Auras"]["Enable"] = true
C["Auras"]["Flash"] = false
C["Auras"]["ClassicTimer"] = true
C["Auras"]["HideBuffs"] = false
C["Auras"]["HideDebuffs"] = false
C["Auras"]["Animation"] = false
C["Auras"]["BuffsPerRow"] = 10
C["Auras"]["Font"] = "MaxUI Outlined"

-- Bags
C["Bags"]["Enable"] = true
C["Bags"]["IdentifyQuestItems"] = true
C["Bags"]["FlashNewItems"] = true
C["Bags"]["ItemLevel"] = true
C["Bags"]["SortToBottom"] = true
C["Bags"]["ButtonSize"] = 30
C["Bags"]["Spacing"] = 4
C["Bags"]["ItemsPerRow"] = 11

-- Chat	
C["Chat"]["Enable"] = true
C["Chat"]["Bubbles"]["Value"] = "All"
C["Chat"]["BubblesTextSize"] = 10
C["Chat"]["SkinBubbles"] = true
C["Chat"]["LeftWidth"] = 392
C["Chat"]["LeftHeight"] = 183
C["Chat"]["RightWidth"] = 392
C["Chat"]["RightHeight"] = 183
C["Chat"]["RightChatAlignRight"] = true
C["Chat"]["BackgroundAlpha"] = 70
C["Chat"]["WhisperSound"] = true
C["Chat"]["ShortChannelName"] = true
C["Chat"]["LinkColor"] = {0.08, 1, 0.36}
C["Chat"]["LinkBrackets"] = true
C["Chat"]["ScrollByX"] = 3
C["Chat"]["TextFading"] = false
C["Chat"]["TextFadingTimer"] = 60
C["Chat"]["TabFont"] = "MaxUI Outlined"
C["Chat"]["ChatFont"] = "MaxUI"
C["Chat"]["BubblesNames"] = true
C["Chat"]["LogMax"] = 10

-- Cooldowns
C["Cooldowns"]["Font"] = "MaxUI Outlined"

-- Datatexts	
C["DataTexts"]["Battleground"] = true
C["DataTexts"]["HideFriendsNotPlaying"] = true
C["DataTexts"]["NameColor"] = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
C["DataTexts"]["ValueColor"] = {1, 1, 1}
C["DataTexts"]["ClassColor"] = false
C["DataTexts"]["HighlightColor"] = {1, 1, 0}
C["DataTexts"]["Font"] = "MaxUI Outlined"

-- Loot
C["Loot"]["Enable"] = true
C["Loot"]["Font"] = "MaxUI Outlined"

-- Misc
C["Misc"]["BlizzardMicroMenu"] = false
C["Misc"]["ItemLevel"] = true
C["Misc"]["ThreatBar"] = true
C["Misc"]["WorldMapEnable"] = true
C["Misc"]["FadeWorldMapAlpha"] = 100
C["Misc"]["ExperienceEnable"] = true
C["Misc"]["AutoSellJunk"] = true
C["Misc"]["AutoRepair"] = true
C["Misc"]["AFKSaver"] = true
C["Misc"]["TalkingHeadEnable"] = true
C["Misc"]["UIErrorSize"] = 16
C["Misc"]["UIErrorFont"] = "MaxUI Outlined"
C["Misc"]["MicroToggle"]["Value"] = "ALT-M"
C["Misc"]["MicroStyle"]["Value"] = "Game Menu"

-- maps
C["Maps"]["MinimapTracking"] = false
C["Maps"]["MinimapCoords"] = false

-- Nameplates	
C["NamePlates"]["Enable"] = true
C["NamePlates"]["Width"] = 140
C["NamePlates"]["Height"] = 10
C["NamePlates"]["NotSelectedAlpha"] = 100
C["NamePlates"]["SelectedScale"] = 100
C["NamePlates"]["NameplateCastBar"] = true
C["NamePlates"]["Font"] = "MaxUI Outlined"
C["NamePlates"]["OnlySelfDebuffs"] = true
C["NamePlates"]["QuestIcon"] = true
C["NamePlates"]["ClassIcon"] = true
C["NamePlates"]["HighlightColor"] = {1, 1, 0}
C["NamePlates"]["AggroColor1"] = {98/255, 223/255, 89/255}
C["NamePlates"]["AggroColor2"] = {1, 1, 0.5}
C["NamePlates"]["AggroColor3"] = {1.00, 0.50, 0.00}
C["NamePlates"]["AggroColor4"] = {1, 0.2, 0.2}
C["NamePlates"]["HighlightSize"] = 6
C["NamePlates"]["ColorThreat"] = false

-- Party	
C["Party"]["Enable"] = false
C["Party"]["ShowPets"] = false
C["Party"]["ShowPlayer"] = true
C["Party"]["ShowHealthText"] = true
C["Party"]["ShowManaText"] = true
C["Party"]["RangeAlpha"] = 0.3
C["Party"]["Font"] = "MaxUI Outlined"
C["Party"]["HealthFont"] = "MaxUI Outlined"
C["Party"]["HighlightColor"] = {0, 1, 0}
C["Party"]["HighlightSize"] = 10
C["Party"]["HealthTag"]["Value"] = "|cff549654[perhp]%|r"

-- Raid	
C["Raid"]["Enable"] = true
C["Raid"]["DebuffWatch"] = true
C["Raid"]["DebuffWatchDefault"] = true
C["Raid"]["ShowPets"] = true
C["Raid"]["RangeAlpha"] = 0.3
C["Raid"]["VerticalHealth"] = false
C["Raid"]["MaxUnitPerColumn"] = 5
C["Raid"]["Raid40MaxUnitPerColumn"] = 10
C["Raid"]["Font"] = "MaxUI Outlined"
C["Raid"]["DesaturateBuffs"] = false
C["Raid"]["RaidBuffsStyle"]["Value"] = "Aura Track"
C["Raid"]["RaidBuffs"]["Value"] = "Self"
C["Raid"]["WidthSize"] = 88
C["Raid"]["HeightSize"] = 40
C["Raid"]["Raid40WidthSize"] = 80
C["Raid"]["Raid40HeightSize"] = 32
C["Raid"]["Padding"] = 10
C["Raid"]["Padding40"] = 10
C["Raid"]["HighlightColor"] = {0, 1, 0}
C["Raid"]["HighlightSize"] = 10
C["Raid"]["AuraTrackIcons"] = true
C["Raid"]["AuraTrackSpellTextures"] = true
C["Raid"]["AuraTrackThickness"] = 5
C["Raid"]["GroupBy"]["Value"] = "GROUP"
C["Raid"]["HealthTag"]["Value"] = ""

--C["Raid"]["DesaturateNonPlayerBuffs"] = false
--C["Raid"]["ClassRaidBuffs"] = true
--C["Raid"]["AuraTrack"] = true
--C["Raid"]["AuraTrackIconSize"] = 10
--C["Raid"]["AuraTrackSpacing"] = 4

-- Textures
C["Textures"]["QuestProgressTexture"] = "Tukui"
C["Textures"]["TTHealthTexture"] = "Tukui"
C["Textures"]["UFPowerTexture"] = "Tukui"
C["Textures"]["UFHealthTexture"] = "Tukui"
C["Textures"]["UFCastTexture"] = "Tukui"
C["Textures"]["UFPartyPowerTexture"] = "Tukui"
C["Textures"]["UFPartyHealthTexture"] = "Tukui"
C["Textures"]["UFRaidPowerTexture"] = "Tukui"
C["Textures"]["UFRaidHealthTexture"] = "Tukui"
C["Textures"]["NPHealthTexture"] = "Tukui"
C["Textures"]["NPPowerTexture"] = "Tukui"
C["Textures"]["NPCastTexture"] = "Tukui"

-- Tooltip		
C["Tooltips"]["Enable"] = true
C["Tooltips"]["DisplayTitle"] = false
C["Tooltips"]["HideInCombat"] = false
C["Tooltips"]["AlwaysCompareItems"] = true
C["Tooltips"]["UnitHealthText"] = true
C["Tooltips"]["MouseOver"] = false
C["Tooltips"]["ItemBorderColor"] = true
C["Tooltips"]["UnitBorderColor"] = true
C["Tooltips"]["HealthFont"] = "MaxUI Outlined"

-- Unitframes	
C["UnitFrames"]["Enable"] = true
C["UnitFrames"]["TotemBar"] = T.MyClass == "SHAMAN" and true or false
C["UnitFrames"]["TotemBarStyle"]["Value"] = "On Screen"
C["UnitFrames"]["ClassBar"] = true
C["UnitFrames"]["PlayerAuraBars"] = false
C["UnitFrames"]["ScrollingCombatText"] = false
C["UnitFrames"]["ScrollingCombatTextIcon"] = true
C["UnitFrames"]["ScrollingCombatTextFontSize"] = 32
C["UnitFrames"]["ScrollingCombatTextRadius"] = 120
C["UnitFrames"]["ScrollingCombatTextDisplayTime"] = 1.5
C["UnitFrames"]["ScrollingCombatTextFont"] = "MaxUI Outlined"
C["UnitFrames"]["ScrollingCombatTextAnim"]["Value"] = "fountain"
C["UnitFrames"]["StatusBarBackgroundMultiplier"] = 25
C["UnitFrames"]["PowerTick"] = true
C["UnitFrames"]["Portrait2D"] = false
C["UnitFrames"]["OOCNameLevel"] = false
C["UnitFrames"]["OOCPetNameLevel"] = false
C["UnitFrames"]["Portrait"] = true
C["UnitFrames"]["CastBar"] = true
C["UnitFrames"]["ComboBar"] = true
C["UnitFrames"]["UnlinkCastBar"] = true
C["UnitFrames"]["CastBarIcon"] = true
C["UnitFrames"]["CastBarLatency"] = true
C["UnitFrames"]["Smooth"] = true
C["UnitFrames"]["TargetEnemyHostileColor"] = false
C["UnitFrames"]["CombatLog"] = true
C["UnitFrames"]["PlayerBuffs"] = true
C["UnitFrames"]["PlayerDebuffs"] = true
C["UnitFrames"]["TargetBuffs"] = true
C["UnitFrames"]["TargetDebuffs"] = true
C["UnitFrames"]["DesaturateDebuffs"] = true
C["UnitFrames"]["FlashRemovableBuffs"] = true
C["UnitFrames"]["FocusAuras"] = true
C["UnitFrames"]["BossAuras"] = true
C["UnitFrames"]["ArenaAuras"] = true
C["UnitFrames"]["TOTAuras"] = true
C["UnitFrames"]["PetAuras"] = true
C["UnitFrames"]["AurasBelow"] = false
C["UnitFrames"]["OnlySelfDebuffs"] = true
C["UnitFrames"]["OnlySelfBuffs"] = true
C["UnitFrames"]["Font"] = "MaxUI Outlined"
C["UnitFrames"]["CastingColor"] = {0.29, 0.77, 0.30}
C["UnitFrames"]["ChannelingColor"] = {0.29, 0.77, 0.30}
C["UnitFrames"]["NotInterruptibleColor"] = {0.85, 0.09, 0.09}
C["UnitFrames"]["HealComm"] = true	
C["UnitFrames"]["HealCommSelfColor"] = {0.29, 1, 0.30}
C["UnitFrames"]["HealCommOtherColor"] = {1, .72, 0.30}
C["UnitFrames"]["HealCommAbsorbColor"] = {1, 1, 0.36}
C["UnitFrames"]["RaidIconSize"] = 24
C["UnitFrames"]["Boss"] = true
C["UnitFrames"]["Arena"] = true
C["UnitFrames"]["HighlightSize"] = 10
C["UnitFrames"]["HighlightColor"] = {0, 1, 0}
C["UnitFrames"]["RangeAlpha"] = 0.3
C["UnitFrames"]["Smoothing"] = true