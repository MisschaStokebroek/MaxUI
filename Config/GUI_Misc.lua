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
-- AURAS
------------------------------------------------------------------------------------------
local Auras = function(self)
	local Window = self:GetWindow("Auras")

	Window:CreateWindowLogo("All", "|cffFFFF99Auras|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Settings for the global buffs & debuffs.")
	Window:CreateSpacer("All", 7)

	Window:CreateSpacer("All", 10)
	Window:CreateSpacer("All", 18)

	Window:CreateSlider("All", "Auras", "AurasFontSize", "|cffFFFFFFSet auras font size|r", 6, 32, 1)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Count")
	Window:CreateSwitch("All", "Auras", "Count", "Enable count text")
	Window:CreateDropdown("All", "Auras", "CountFont", "Set count font", "Font")
	Window:CreateSlider("All", "Auras", "CountFontSize", "|cffFFFFFFSet count font size|r", 6, 32, 1)
	Window:CreateColorSelection("All", "Auras", "CountColor", "Set font color for count")
	Window:CreateDropdown("All", "Auras", "CountPosition", "Set position for count")
	Window:CreateSlider("All", "Auras", "CountOffsetH", "Set horizontal offset for count", -20, 20, 1)
	Window:CreateSlider("All", "Auras", "CountOffsetV", "Set vertical offset for count", -20, 20, 1)
	Window:CreateDropdown("All", "Auras", "CountJustifyH", "Set alignment for count")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Duration")
	Window:CreateSwitch("All", "Auras", "Duration", "Enable duration text")
	Window:CreateDropdown("All", "Auras", "DurationFont", "Set duration font", "Font")
	Window:CreateSlider("All", "Auras", "DurationFontSize", "|cffFFFFFFSet duration font size|r", 6, 32, 1)
	--Window:CreateColorSelection("All", "Auras", "DurationColor", "Set font color for duration")
	Window:CreateDropdown("All", "Auras", "DurationPosition", "Set position for duration")
	Window:CreateSlider("All", "Auras", "DurationOffsetH", "Set horizontal offset for duration", -20, 20, 1)
	Window:CreateSlider("All", "Auras", "DurationOffsetV", "Set vertical offset for duration", -20, 20, 1)
	Window:CreateDropdown("All", "Auras", "DurationJustifyH", "Set alignment for duration")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Position")
	Window:CreateDropdown("All", "Auras", "Position", "Set position on screen")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Sizing")
	Window:CreateSlider("All", "Auras", "AurasSize", "Set scale in % for the aura icons", 50, 400, 1)
	Window:CreateSlider("All", "Auras", "AurasBarSize", "Set height for the aura bar style", 2, 20, 1)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Combat State")
	Window:CreateDropdown("All", "Auras", "AurasBuffCombatState", "Set combat state for aura buffs")
	Window:CreateDropdown("All", "Auras", "AurasDebuffCombatState", "Set combat state for aura debuffs")
end
GUI:AddWidgets(Auras)

------------------------------------------------------------------------------------------
-- BAGS
------------------------------------------------------------------------------------------
local Bags = function(self)
	local Window = self:GetWindow("Bags")

	Window:CreateWindowLogo("All", "|cffFFFF99Bags & Inventory|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Settings for bags & inventory.")
	Window:CreateSpacer("All", 7)

	if T.Retail then
		Window:CreateSpacer("All", 12)
		Window:CreateSpacer("All", 17)
		Window:CreateSpacer("All", 22)
		Window:CreateSpacer("All", 25)
	else
		Window:CreateSpacer("All", 11)
		Window:CreateSpacer("All", 15)
		Window:CreateSpacer("All", 20)
		Window:CreateSpacer("All", 23)
	end

	Window:CreateSection("Retail", "Reagent Bag")
	Window:CreateSwitch("Retail", "Bags", "ReagentInsideBag", "Put reagent bag inside the main bag")
	Window:CreateDropdown("Retail", "Bags", "PositionReagentBag", "Set anchorpoint for seperate reagent bag.")
	Window:CreateSpacerNoPos("Retail")
	
	Window:CreateSection("All", "Fonts (WIP)")
	Window:CreateDropdown("All", "Bags", "Font", "|cffFFFFFFSet bags font|r", "Font")
	Window:CreateSlider("All", "Bags", "FontSize", "|cffFFFFFFSet bags font size|r", 6, 32, 1)
end
GUI:AddWidgets(Bags)

------------------------------------------------------------------------------------------
-- CHAT
------------------------------------------------------------------------------------------
local Chat = function(self)
	local Window = self:GetWindow("Chat")

	Window:CreateWindowLogo("All", "|cffFFFF99Chat & Bubbles|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Settings for chat.")
	Window:CreateExplanationText("All", 7, "When using Combat State 'Hide in combat',")
	Window:CreateExplanationText("All", 8, "you can't hide the chat panel with the mouseover buttons.")
	Window:CreateSpacer("All", 9)

	Window:CreateSpacer("All", 17)
	Window:CreateSpacer("All", 20)
	Window:CreateTextLinePos("All", 22, "*Also works for MaxUI theme, Tukz theme excluded")
	Window:CreateSpacer("All", 27)
	Window:CreateSpacer("All", 37)

	Window:CreateSlider("All", "Chat", "TabFontSize", "|cffFFFFFFSet chat tab font size|r", 6, 32, 1)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Background & Textures")
	Window:CreateDropdown("All", "Chat", "BackgroundOptions", "Set background style")
	Window:CreateDropdown("All", "Chat", "Chattexture", "Set texture if style 'Texture' is chosen", "Texture")
	Window:CreateSlider("All", "Chat", "ChattextureAlpha", "Set texture alpha if style 'Texture' is chosen", 0, 1, 0.1)
	Window:CreateColorSelection("All", "Chat", "ChattextureColor", "Set texture color if style 'Texture' is chosen")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Headers")
	Window:CreateSwitch("All", "Chat", "Headers", "|cffFFFF99Enable styled chat headers/tabs|r")
	Window:CreateSwitch("All", "Chat", "TabDividers", "|cffFFFF99Enable chat tab separators|r")
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Position")
	Window:CreateDropdown("All", "Chat", "Position", "|cffFFFF99Set position on screen|r")
	Window:CreateSwitch("All", "Chat", "UnlinkEditBox", "|cffFFFF99Unlink the chat inputbox|r")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Combat State")
	Window:CreateSwitch("All", "Chat", "CompleteChatBox", "|cffFFFF99Apply Combat State to all Chatbox elements including text and tabs|r")
	Window:CreateDropdown("All", "Chat", "LeftChatBGCombatState", "Set combat state for left chat panel")
	Window:CreateDropdown("All", "Chat", "RightChatBGCombatState", "Set combat state for right chat panel")
end
GUI:AddWidgets(Chat)

------------------------------------------------------------------------------------------
-- DATATEXTS
------------------------------------------------------------------------------------------
local DataTexts = function(self)
	local Window = self:GetWindow("DataTexts")
	
	Window:CreateWindowLogo("All", "|cffFFFF99Datatext system|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Settings for the datatext system.")
	Window:CreateSpacer("All", 7)

	Window:CreateSpacer("All", 11)
	Window:CreateSpacer("All", 17)

	Window:CreateSlider("All", "DataTexts", "FontSize", "|cffFFFFFFSet datatext font size|r", 6, 32, 1)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "MaxUI Settings")
	Window:CreateSwitch("All", "DataTexts", "Icons", "|cffFFFF99Enable datatext icons|r")
	Window:CreateSlider("All", "General", "ScreenSpacing", "|cffFFFF99Set spacing for datapanels near the edge of the screen|r", 0, 40, 1)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Top Datatexts")
	Window:CreateSwitch("All", "DataTexts", "Topline", "|cffFFFF99Enable top panel & datatexts|r")
	Window:CreateSlider("All", "DataTexts", "AmountTopDataTexts", "|cffFFFF99Set datatext amount|r", 1, 21, 1)
	Window:CreateDropdown("All", "DataTexts", "ToplineCombatState", "|cffFFFF99Set combat state for top datatexts|r")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Bottom Datatexts")
	Window:CreateSwitch("All", "DataTexts", "Bottomline", "|cffFFFF99Enable bottom panel & datatexts|r")
	Window:CreateSlider("All", "DataTexts", "AmountBottomDataTexts", "|cffFFFF99Set datatext amount|r", 1, 21, 1)
	Window:CreateDropdown("All", "DataTexts", "BottomlineCombatState", "|cffFFFF99Set combat state for bottom datatexts|r")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Data center Datatexts")
	Window:CreateSwitch("All", "DataTexts", "DataCenter", "|cffFFFF99Enable datacenter panel & datatexts|r")
	Window:CreateSwitch("All", "DataTexts", "DataCenterClassLogo", "|cffFFFF99Enable datacenter class art|r")
	Window:CreateSlider("All", "DataTexts", "AmountDataCenterDataTexts", "|cffFFFF99Set datatext amount|r", 1, 60, 1)
	Window:CreateSlider("All", "DataTexts", "DataCenterAlpha", "|cffFFFF99Set datacenter backdrop alpha|r", 0, 1, 0.1)
	Window:CreateDropdown("All", "DataTexts", "TooltipAnchor", "|cffFFFF99Set anchor for tooltips|r")
	Window:CreateDropdown("All", "DataTexts", "DataCenterCombatState", "|cffFFFF99Set combat state for datacenter panel & datatexts|r")
	Window:CreateSpacerNoPos("All")
end
GUI:AddWidgets(DataTexts)

------------------------------------------------------------------------------------------
-- DATABARS
------------------------------------------------------------------------------------------
local DataBars = function(self)
	local Window = self:CreateWindow("DataBars")
	
	Window:CreateWindowLogo("All", "|cffFFFF99Databars system|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Settings for the databars system.")
	Window:CreateSpacer("All", 7)
	
	Window:CreateSection("All", "Databar Settings")
	Window:CreateSwitch("All", "Misc", "PercentageTag", "|cffFFFF99Set percentage tag(s) for databars|r")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Threat")
	Window:CreateSwitch("All", "Misc", "ThreatBar", "Enable threat bar")
	Window:CreateSlider("All", "Misc", "ThreatBarHeight", "|cffFFFF99Set bar height|r", 1, 40, 1)
	Window:CreateSlider("All", "Misc", "ThreatBarWidth", "|cffFFFF99Set bar width|r", 10, 500, 1)
	Window:CreateDropdown("All", "Misc", "ThreatBarTexture", "|cffFFFF99Set bar texture|r", "Texture")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Alternative Power")
	Window:CreateSwitch("All", "Misc", "AlternativePowerBarEnable", "|cffFFFF99Enable alternative power bar|r")
	Window:CreateSlider("All", "Misc", "AlternativePowerBarHeight", "|cffFFFF99Set bar height|r", 1, 40, 1)
	Window:CreateSlider("All", "Misc", "AlternativePowerBarWidth", "|cffFFFF99Set bar width|r", 10, 500, 1)
	Window:CreateDropdown("All", "Misc", "AlternativePowerBarTexture", "|cffFFFF99Set bar texture|r", "Texture")
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Other Bars - Mirror bars etc.")
	Window:CreateSwitch("All", "Misc", "OtherBarEnable", "|cffFFFF99Enable other bars|r")
	Window:CreateSlider("All", "Misc", "BarHeight", "|cffFFFF99Set bar height|r", 1, 40, 1)
	Window:CreateSlider("All", "Misc", "BarWidth", "|cffFFFF99Set bar width|r", 10, 500, 1)
	Window:CreateDropdown("All", "Misc", "BarTexture", "|cffFFFF99Set bar texture|r", "Texture")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Experience")
	Window:CreateSwitch("All", "Misc", "XPBarEnable", "|cffFFFF99Enable experience bar|r")
	Window:CreateSwitch("All", "Misc", "XPBarDTEnable", "|cffFFFF99Enable experience bar as datatext|r")
	Window:CreateSpacerNoPos("All")
	Window:CreateSlider("All", "Misc", "XPBarHeight", "|cffFFFF99Set bar height|r", 1, 30, 1)
	Window:CreateSlider("All", "Misc", "XPBarWidth", "|cffFFFF99Set bar width|r", 10, 500, 1)
	Window:CreateDropdown("All", "Misc", "XPBarTextPlacement", "|cffFFFF99Set text position|r")
	Window:CreateDropdown("All", "Misc", "XPBarTexture", "|cffFFFF99Set bar texture|r", "Texture")
	Window:CreateSpacerNoPos("All")
	Window:CreateSwitch("All", "Misc", "XPBarBackdrop", "|cffFFFF99Enable a backdrop for the non datatext experience bar|r")
	Window:CreateSlider("All", "Misc", "XPBarAlpha", "|cffFFFF99Set backdrop alpha|r", 0, 1, 0.1)
	Window:CreateDropdown("All", "Misc", "XPBarCombatState", "|cffFFFF99Combat State|r")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Reputation")
	Window:CreateSwitch("All", "Misc", "REPBarEnable", "|cffFFFF99Enable reputation bar|r")
	Window:CreateSwitch("All", "Misc", "REPBarDTEnable", "|cffFFFF99Enable reputation bar as datatext|r")
	Window:CreateSpacerNoPos("All")
	Window:CreateSlider("All", "Misc", "REPBarHeight", "|cffFFFF99Set bar height|r", 1, 30, 1)
	Window:CreateSlider("All", "Misc", "REPBarWidth", "|cffFFFF99Set bar width|r", 10, 500, 1)
	Window:CreateDropdown("All", "Misc", "REPBarTextPlacement", "|cffFFFF99Set text position|r")
	Window:CreateDropdown("All", "Misc", "REPBarTexture", "|cffFFFF99Set bar texture|r", "Texture")
	Window:CreateSpacerNoPos("All")
	Window:CreateSwitch("All", "Misc", "REPBarBackdrop", "|cffFFFF99Enable a backdrop for the non datatext reputation bar|r")
	Window:CreateSlider("All", "Misc", "REPBarAlpha", "|cffFFFF99Set backdrop alpha|r", 0, 1, 0.1)
	Window:CreateDropdown("All", "Misc", "REPBarCombatState", "|cffFFFF99Combat State|r")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Honor")
	Window:CreateSwitch("All", "Misc", "HONORBarEnable", "|cffFFFF99Enable honor bar|r")
	Window:CreateSwitch("All", "Misc", "HONORBarDTEnable", "|cffFFFF99Enable honor bar as datatext|r")
	Window:CreateSpacerNoPos("All")
	Window:CreateSlider("All", "Misc", "HONORBarHeight", "|cffFFFF99Set bar height|r", 1, 30, 1)
	Window:CreateSlider("All", "Misc", "HONORBarWidth", "|cffFFFF99Set bar width|r", 10, 500, 1)
	Window:CreateDropdown("All", "Misc", "HONORBarTextPlacement", "|cffFFFF99Set text position|r")
	Window:CreateDropdown("All", "Misc", "HONORBarTexture", "|cffFFFF99Set bar texture|r", "Texture")
	Window:CreateSpacerNoPos("All")
	Window:CreateSwitch("All", "Misc", "HONORBarBackdrop", "|cffFFFF99Enable a backdrop for the non datatext honor bar|r")
	Window:CreateSlider("All", "Misc", "HONORBarAlpha", "|cffFFFF99Set backdrop alpha|r", 0, 1, 0.1)
	Window:CreateDropdown("All", "Misc", "HONORBarCombatState", "|cffFFFF99Combat State|r")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("Retail", "Azerite (Battle for Azeroth)")
	Window:CreateSwitch("Retail", "Misc", "AZERITEBarEnable", "|cffFFFF99Enable azerite bar|r")
	Window:CreateSwitch("Retail", "Misc", "AZERITEBarDTEnable", "|cffFFFF99Enable azerite as bar datatext|r")
	Window:CreateSpacerNoPos("All")
	Window:CreateSlider("Retail", "Misc", "AZERITEBarHeight", "|cffFFFF99Set bar height|r", 1, 30, 1)
	Window:CreateSlider("Retail", "Misc", "AZERITEBarWidth", "|cffFFFF99Set bar width|r", 10, 500, 1)
	Window:CreateDropdown("Retail", "Misc", "AZERITEBarTextPlacement", "|cffFFFF99Set text position|r")
	Window:CreateDropdown("Retail", "Misc", "AZERITEBarTexture", "|cffFFFF99Set bar texture|r", "Texture")
	Window:CreateSpacerNoPos("All")
	Window:CreateSwitch("Retail", "Misc", "AZERITEBarBackdrop", "|cffFFFF99Enable a backdrop for the non datatext azerite bar|r")
	Window:CreateSlider("Retail", "Misc", "AZERITEBarAlpha", "|cffFFFF99Set backdrop alpha|r", 0, 1, 0.1)
	Window:CreateDropdown("Retail", "Misc", "AZERITEBarCombatState", "|cffFFFF99Combat State|r")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("Retail", "Anima (Shadowlands)")
	Window:CreateSwitch("Retail", "Misc", "ANIMABarEnable", "|cffFFFF99Enable anima bar|r")
	Window:CreateSwitch("Retail", "Misc", "ANIMABarDTEnable", "|cffFFFF99Enable anima bar as datatext|r")
	Window:CreateSpacerNoPos("All")
	Window:CreateSlider("Retail", "Misc", "ANIMABarHeight", "|cffFFFF99Set bar height|r", 1, 30, 1)
	Window:CreateSlider("Retail", "Misc", "ANIMABarWidth", "|cffFFFF99Set bar width|r", 10, 500, 1)
	Window:CreateDropdown("Retail", "Misc", "ANIMABarTextPlacement", "|cffFFFF99Set text position|r")
	Window:CreateDropdown("Retail", "Misc", "ANIMABarTexture", "|cffFFFF99Set bar texture|r", "Texture")
	Window:CreateSpacerNoPos("All")
	Window:CreateSwitch("Retail", "Misc", "ANIMABarBackdrop", "|cffFFFF99Enable a backdrop for the non datatext anima bar|r")
	Window:CreateSlider("Retail", "Misc", "ANIMABarAlpha", "|cffFFFF99Set backdrop alpha|r", 0, 1, 0.1)
	Window:CreateDropdown("Retail", "Misc", "ANIMABarCombatState", "|cffFFFF99Combat State|r")

end
GUI:AddWidgets(DataBars)

------------------------------------------------------------------------------------------
-- LOOT
------------------------------------------------------------------------------------------
local Loot = function(self)
	local Window = self:GetWindow("Loot")
	
	Window:CreateWindowLogo("All", "|cffFFFF99Loot system|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Settings for the loot system.")
	Window:CreateSpacer("All", 7)

	Window:CreateSpacer("All", 10)
	
	Window:CreateSlider("All", "Loot", "FontSize", "|cffFFFFFFSet font size|r", 6, 32, 1)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Group Loot Module")
	Window:CreateSlider("All", "Loot", "GroupLootHeaderHeight", "|cffFFFFFFSet height for the item header|r", 0, 32, 1)
	Window:CreateSlider("All", "Loot", "GroupLootSpacing", "|cffFFFFFFSet spacing between items|r", 0, 100, 1)
	Window:CreateSectionButton("All", "Test", "Run grouploot test mode, reload to remove the testframes.", GUI.TukuiGroupLootTest)	
	Window:CreateSpacerNoPos("All")
end
GUI:AddWidgets(Loot)

------------------------------------------------------------------------------------------	
-- MINIMAP & LOCATION
------------------------------------------------------------------------------------------
local Maps = function(self)
	local Window = self:GetWindow("Maps")

	Window:CreateWindowLogo("All", "|cffFFFF99Maps|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Settings for the worldmap, minimap & location.")
	Window:CreateSpacer("All", 7)

	Window:CreateSpacer("All", 11)
	
	Window:CreateDropdown("All", "Location", "WorldmapCombatState", "Set combat state")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Minimap Extended")
	Window:CreateSwitch("All", "Location", "MinimapEnable", "Enable minimap")
	Window:CreateSwitch("All", "Location", "MinimapRectangular", "Make the minimap rectangular")
	Window:CreateSwitch("All", "Location", "Compass", "Enable compass")
	Window:CreateDropdown("All", "Location", "Position", "Set position on screen")
	Window:CreateDropdown("All", "Location", "MinimapCombatState", "Set combat state")
	Window:CreateSpacerNoPos("All")
end
GUI:AddWidgets(Maps)

------------------------------------------------------------------------------------------
-- MISC
------------------------------------------------------------------------------------------
local Misc = function(self)
	local Window = self:GetWindow("Misc")

	Window:CreateWindowLogo("All", "|cffFFFF99Miscellaneous|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "All uncategorized options.")
	Window:CreateSpacer("All", 7)

if T.Retail then
	Window:CreateSpacer("All", 10)
	Window:CreateSpacer("All", 14)
	Window:CreateSpacer("All", 17)
	Window:CreateSpacer("All", 20)
	Window:CreateSpacer("All", 23)
	Window:CreateSpacer("All", 26)
	Window:CreateSpacer("All", 30)
	Window:CreateSpacer("All", 34)
	Window:CreateSpacer("All", 37)
	Window:CreateSpacer("All", 40)	
else
	Window:CreateSpacer("All", 11)
	Window:CreateSpacer("All", 14)
	Window:CreateSpacer("All", 17)
	Window:CreateSpacer("All", 20)
	Window:CreateSpacer("All", 23)
	Window:CreateSpacer("All", 27)
	Window:CreateSpacer("All", 31)
	Window:CreateSpacer("All", 34)
end

	Window:CreateSection("All", "UI Error Frame Extended")
	Window:CreateSwitch("All", "Misc", "ErrorSpeechEnable", "Enable error speech frame")
	Window:CreateDropdown("All", "Misc", "ErrorSpeechCombatState", "Set combat state for error speech frame")
	Window:CreateSpacerNoPos("All")
end
GUI:AddWidgets(Misc)

------------------------------------------------------------------------------------------
-- QUESTS	
------------------------------------------------------------------------------------------
local Quests = function(self)
	local Window = self:CreateWindow("Quests")
	
	Window:CreateWindowLogo("All", "|cffFFFF99Quests|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Settings for quests, questlog & questtracker")
	Window:CreateSpacer("All", 7)

	Window:CreateSection("All", "Enable")
	Window:CreateSwitch("All", "Misc", "ObjectiveTracker", "Enable the objective tracker")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Style")
	Window:CreateSwitch("All", "Quests", "QuestHeaderLines", "|cffFFFF99Add a header line/panel for the objective tracker sections|r")
	Window:CreateDropdown("All", "Textures", "QuestProgressTexture", "Set progress bar texture", "Texture")
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("Retail", "Settings")
	Window:CreateSwitch("Retail", "Quests", "TrackerFixed", "|cffFFFF99Anchor the objective tracker to the quest datatext|r")
	Window:CreateSwitch("Retail", "Quests", "TrackerCollapsedOnLogin", "|cffFFFF99Start with a closed objective tracker|r")
	Window:CreateDropdown("Retail", "Quests", "FilterTracking", "|cffFFFF99Set filter for quests tracked in the objective tracker|r")
	Window:CreateSpacerNoPos("Retail")
	
	Window:CreateSection("All", "Combat State")
	Window:CreateDropdown("All", "Quests", "QuestTrackerCombatState", "Set combat state for tracker")
end
GUI:AddWidgets(Quests)

------------------------------------------------------------------------------------------
-- Scrolling Combat Text
------------------------------------------------------------------------------------------
local ScrollingCombatText = function(self)
	local Window = self:CreateWindow("Scrolling Text")

	Window:CreateWindowLogo("All", "|cffFFFF99Scrolling Combat Text|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Settings for scrolling combat text for self and world.")
	Window:CreateSpacer("All", 7)

	Window:CreateSection("All", "World / Nameplates: Enable")
	Window:CreateDropdown("All", "Scrolling Text", "Healing", "Enable healing numbers")
	Window:CreateDropdown("All", "Scrolling Text", "Shields", "Enable absorb numbers")
	Window:CreateDropdown("All", "Scrolling Text", "Damage", "Enable damage numbers")
	Window:CreateDropdown("All", "Scrolling Text", "Pet", "Enable Pet damage numbers")
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "World / Nameplates: Customize")
	Window:CreateSwitch("All", "Scrolling Text", "Direction", "Enable dynamic/directional combat text")
	Window:CreateDropdown("All", "Scrolling Text", "FloatMode", "Set direction for combat text")
	Window:CreateSlider("All", "Scrolling Text", "Scale", "Set scale", 0, 2, 0.1)
	Window:CreateSlider("All", "Scrolling Text", "YOffset", "Set vertical offset", -0.1, 0.1, 0.01)
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Self / Player")
	Window:CreateSwitch("All", "UnitFrames", "ScrollingCombatText", "Enable scrolling text for self")
	Window:CreateDropdown("All", "UnitFrames", "ScrollingCombatTextFont", "Set scrolling text font", "Font")
	Window:CreateSlider("All", "UnitFrames", "ScrollingCombatTextFontSize", "Set scrolling text font size", 10, 80, 1)
	Window:CreateSwitch("All", "UnitFrames", "ScrollingCombatTextIcon", "Display icon on on scrolling combat text")
	Window:CreateSlider("All", "UnitFrames", "ScrollingCombatTextRadius", "Area size of the scrolling combat text", 50, 500, 10)
	Window:CreateSlider("All", "UnitFrames", "ScrollingCombatTextDisplayTime", "Number of seconds the text remain to be seen", .5, 3, .1)
	Window:CreateDropdown("All", "UnitFrames", "ScrollingCombatTextAnim", "Which animation you want to use?")
end
GUI:AddWidgets(ScrollingCombatText)

------------------------------------------------------------------------------------------
-- TEXTURES
------------------------------------------------------------------------------------------
local Textures = function(self)
	local Window = self:GetWindow("Textures")

	Window:CreateWindowLogo("All", "|cffFFFF99Textures|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "These texture settings are re-used by options in other sections.")
	Window:CreateSpacer("All", 7)

	Window:CreateSpacer("All", 12)
	Window:CreateSpacer("All", 16)
	Window:CreateSpacer("All", 20)
	Window:CreateSpacer("All", 25)
end
GUI:AddWidgets(Textures)

------------------------------------------------------------------------------------------
-- TOOLS
------------------------------------------------------------------------------------------
local Tools = function(self)
	local Window = self:CreateWindow("Tools")

	Window:CreateWindowLogo("All", "|cffFFFF99Tools|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Several options for cumstomizing certain tools added by MaxUI.")
	Window:CreateSpacer("All", 7)

	--Window:CreateSection("All", "Settings")
	--Window:CreateDropdown("All", "Tools", "ButtonStyle", "Set style for button icons")
	--Window:CreateSlider("All", "Tools", "ToolButtonSize", "Set button size", 10, 40, 1)
	--Window:CreateDropdown("All", "Tools", "Font", "Set tools font", "Font")
	--Window:CreateSlider("All", "Tools", "FontSize", "|cffFFFFFFSet tools font size|r", 6, 32, 1)
	--Window:CreateSpacerNoPos("All")

	--Window:CreateSection("All", "UI Configuration")
	--Window:CreateSwitch("All", "Tools", "UIConfig", "Enable the UI config tool & datatext")
	--Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Chat")
	Window:CreateSwitch("All", "Tools", "ChatShortcuts", "Enable chat button shortcuts")
	Window:CreateDropdown("All", "Tools", "ChatShortcutsPosition", "Set anchorpoint for the chat tool")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Meters")
	Window:CreateSwitch("All", "Tools", "Meters", "Enable the meters tool & datatext")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Buff Tracker")
	Window:CreateSwitch("All", "Tools", "RaidBuffTracking", "Enable the buff tracker & datatext")
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Raid Tools")
	Window:CreateSwitch("All", "Tools", "RaidTools", "Enable the raid tools & datatext")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Game Menu")
	Window:CreateSwitch("All", "Tools", "GameMenu", "Enable the game menu & datatext")
	Window:CreateSpacerNoPos("All")
end
GUI:AddWidgets(Tools)

------------------------------------------------------------------------------------------
-- TOOLTIPS
------------------------------------------------------------------------------------------
local Tooltips = function(self)
	local Window = self:GetWindow("Tooltips")

	Window:CreateWindowLogo("All", "|cffFFFF99Tooltips|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6,  "Customize the tooltip.")
	Window:CreateSpacer("All", 7)

	Window:CreateSpacer("All", 13)
	Window:CreateSpacer("All", 19)

	Window:CreateSlider("All", "Tooltips", "HealthFontSize", "|cffFFFF99Set tooltip health font size|r", 6, 40, 1)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Texture")
	Window:CreateDropdown("All", "Textures", "TTHealthTexture", "Set texture for tooltip health", "Texture")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Settings")
	Window:CreateSlider("All", "Tooltips", "TooltipAlpha", "|cffFFFF99Set tooltip transparency|r", 0, 1, 0.1)
end
GUI:AddWidgets(Tooltips)