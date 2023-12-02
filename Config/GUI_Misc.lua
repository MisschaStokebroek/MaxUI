------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-08-2023
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
	
	Window:CreateSection("All", "Fonts (WIP)")
	Window:CreateDropdown("All", "Bags", "Font", "|cffFFFFFFSet bags font|r", "Font")
	Window:CreateSlider("All", "Bags", "FontSize", "|cffFFFFFFSet bags font size|r", 6, 32, 1)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("Retail", "Reagent Bag")
	Window:CreateSwitch("Retail", "Bags", "ReagentInsideBag", "Put reagent bag inside the main bag")
	Window:CreateDropdown("Retail", "Bags", "PositionReagentBag", "|cffFFFF99Set anchorpoint for seperate reagent bag.|r")
	Window:CreateSpacerNoPos("Retail")

	Window:CreateSection("All", "Auto Sell and repair")
	Window:CreateSwitch("All", "Misc", "AutoSellJunk", "Sell junk automatically when visiting a vendor")
	Window:CreateSwitch("All", "Misc", "AutoRepair", "Auto repair your equipment when visiting a vendor")
	Window:CreateSpacerNoPos("All")
end
GUI:AddWidgets(Bags)

------------------------------------------------------------------------------------------
-- CHAT
------------------------------------------------------------------------------------------
local MaxUIChat = function(self)
	local Window = self:CreateWindow("MaxUIChat")

	Window:CreateWindowLogo("All", "|cffFFFF99Chat & Bubbles|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Settings for chat and chat bubbles.")
	Window:CreateExplanationText("All", 7, "When using Combat State 'Hide in combat',")
	Window:CreateExplanationText("All", 8, "you can't hide the chat panel with the mouseover buttons.")
	Window:CreateSpacer("All", 9)

	Window:CreateSection("All", "Enable")
	Window:CreateSwitch("All", "Chat", "Enable", "Enable chat module")
	Window:CreateSwitch("All", "Chat", "WhisperSound", "Enable whisper sound")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Fading and logging")
	Window:CreateSwitch("All", "Chat", "TextFading", "Fade the chat message after inactivity?")
	Window:CreateSlider("All", "Chat", "TextFadingTimer", "Timer that chat text should fade?", 10, 600, 10)
	Window:CreateSlider("All", "Chat", "LogMax", "Amount of chat line you wish to save into log history", 0, 500, 10)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Bubbles")
	Window:CreateDropdown("All", "Chat", "Bubbles", "Chat bubbles")
	Window:CreateSwitch("All", "Chat", "SkinBubbles", "Skin bubbles")
	Window:CreateSlider("All", "Chat", "BubblesTextSize", "Set bubbles text size", 6, 16, 1)
	Window:CreateSwitch("All", "Chat", "BubblesNames", "Display name in bubbles")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Size (not for Tukz theme)")
	Window:CreateSlider("All", "Chat", "LeftWidth", "Set left chat width", 300, 600, 1)
	Window:CreateSlider("All", "Chat", "LeftHeight", "Set left chat height", 150, 600, 1)
	Window:CreateSpacerNoPos("All")
	Window:CreateSlider("All", "Chat", "RightWidth", "Set right chat width", 300, 600, 1)
	Window:CreateSlider("All", "Chat", "RightHeight", "Set right chat height", 150, 600, 1)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Styling")
	Window:CreateSwitch("All", "Chat", "ShortChannelName", "Shorten channel names")
	Window:CreateSlider("All", "Chat", "ScrollByX", "Set lines to scroll", 1, 6, 1)
	Window:CreateSwitch("All", "Chat", "LinkBrackets", "Display URL links in brackets")
	Window:CreateColorSelection("All", "Chat", "LinkColor", "Link color")
	Window:CreateSwitch("All", "Chat", "RightChatAlignRight", "Align text to right on right chat frame")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Font")
	Window:CreateDropdown("All", "Chat", "ChatFont", "Set chat font", "Font")
	Window:CreateDropdown("All", "Chat", "TabFont", "Set chat tab font", "Font")
	Window:CreateSlider("All", "Chat", "TabFontSize", "|cffFFFFFFSet chattab font size|r", 6, 32, 1)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Background & Textures")
	Window:CreateSlider("All", "Chat", "BackgroundAlpha", "Set chat background alpha", 40, 100, 1)
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
	Window:CreateSwitch("All", "Chat", "ShowRightChat", "|cffFFFF99Show the right chat box|r")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Chat tool")
	Window:CreateSwitch("All", "Chat", "ChatShortcuts", "Enable chat button shortcuts")
	Window:CreateDropdown("All", "Chat", "ChatShortcutsPosition", "Set anchorpoint for the chat tool")
	Window:CreateSpacerNoPos("All")
	Window:CreateSlider("All", "Chat", "ChatShortcutsButtonHeight", "Set button height", 2, 200, 1)
	Window:CreateSlider("All", "Chat", "ChatShortcutsButtonWidth", "Set button width", 2, 200, 1)
	Window:CreateSwitch("All", "Chat", "ChatAndEmoteIcon", "Enable icon on emote button")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Combat State")
	Window:CreateSwitch("All", "Chat", "CompleteChatBox", "|cffFFFF99Apply Combat State to all Chatbox elements including text and tabs|r")
	Window:CreateDropdown("All", "Chat", "LeftChatBGCombatState", "Set combat state for left chat panel")
	Window:CreateDropdown("All", "Chat", "RightChatBGCombatState", "Set combat state for right chat panel")

	self.WindowCount = self.WindowCount -1
end
GUI:AddWidgets(MaxUIChat)

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

	Window:CreateSection("All", "Settings")
	Window:CreateSwitch("All", "DataTexts", "Icons", "|cffFFFF99Enable datatext icons|r")
	Window:CreateSlider("All", "DataTexts", "ScreenSpacing", "|cffFFFF99Set spacing for datapanels near the edge of the screen|r", 0, 40, 1)
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
	--Window:CreateSectionButton("All", "Test", "Run grouploot test mode, reload to remove the testframes.", GUI.TukuiGroupLootTest)	
	Window:CreateSpacerNoPos("All")
end
GUI:AddWidgets(Loot)

------------------------------------------------------------------------------------------	
-- MINIMAP & LOCATION
------------------------------------------------------------------------------------------
local MaxUIMaps = function(self)
	local Window = self:CreateWindow("MaxUIMaps")
	
	Window:CreateWindowLogo("All", "|cffFFFF99Maps and Quests|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Settings for the worldmap, minimap & location,")
	Window:CreateExplanationText("All", 7, "for the objective tracker and the questlog.")
	Window:CreateSpacer("All", 8)

	Window:CreateSection("All", "Minimap")
	Window:CreateSwitch("All", "Location", "MinimapEnable", "Enable minimap")
	Window:CreateSpacerNoPos("All")
	Window:CreateSwitch("All", "Maps", "MinimapCoords", "Enable minimap coordinate on mouseover")
	Window:CreateSwitch("All", "Location", "Compass", "Enable compass")
	Window:CreateSwitch("WOTLK", "Maps", "MinimapTracking", "Enable minimap tracking icon")
	Window:CreateSwitch("All", "Location", "MinimapRectangular", "Make the minimap rectangular")
	Window:CreateSpacerNoPos("All")
	Window:CreateSwitch("All", "Location", "MinimapFixedSizeDT", "Enable fixed size for the minimap matching the top dt panels")
	Window:CreateDropdown("All", "Location", "Position", "Set position on screen")
	Window:CreateSlider("All", "General", "MinimapScale", "Set minimap scale (%)", 50, 200, 1)
	Window:CreateDropdown("All", "Location", "MinimapCombatState", "Set combat state")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Worldmap")
	Window:CreateSwitch("All", "Misc", "WorldMapEnable", "Enable our custom world map")
	Window:CreateSpacerNoPos("All")
	Window:CreateSlider("All", "Misc", "FadeWorldMapAlpha", "Worldmap opacity while moving", 0, 100, 1)
	Window:CreateSlider("All", "General", "WorldMapScale", "Set world map scale (%)", 40, 100, 1)
	Window:CreateDropdown("All", "Location", "WorldmapCombatState", "Set combat state")
	Window:CreateSpacerNoPos("All")

	--Window:CreateSection("All", "Battleground map")
	--Window:CreateSpacerNoPos("All")

	--Window:CreateSection("All", "Locator")
	--Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Objective tracker")
	Window:CreateSwitch("All", "Misc", "ObjectiveTracker", "Enable the objective tracker")
	Window:CreateSpacerNoPos("All")
	Window:CreateDropdown("All", "Quests", "TrackerPosition", "Set default starting position for the tracker|r")
	Window:CreateSwitch("Retail", "Quests", "TrackerMovableHeader", "|cffFFFF99Add a mouseover header for the tracker when movable|r")
	Window:CreateSwitch("Retail", "Quests", "TrackerCollapsedOnLogin", "|cffFFFF99Start with a closed objective tracker|r")
	Window:CreateSpacerNoPos("All")
	Window:CreateSwitch("All", "Quests", "QuestHeaderLines", "|cffFFFF99Add a header line/panel for the objective tracker sections|r")
	Window:CreateDropdown("All", "Textures", "QuestProgressTexture", "Set progress bar texture", "Texture")
	Window:CreateSpacerNoPos("All")
	Window:CreateDropdown("Retail", "Quests", "FilterTracking", "|cffFFFF99Set filter for quests tracked in the objective tracker|r")
	Window:CreateDropdown("All", "Quests", "QuestTrackerCombatState", "Set combat state for tracker")
	Window:CreateSpacerNoPos("All")

	self.WindowCount = self.WindowCount -1
end
GUI:AddWidgets(MaxUIMaps)

------------------------------------------------------------------------------------------
-- MISC
------------------------------------------------------------------------------------------
local MaxUIMisc = function(self)
	local Window = self:CreateWindow("MaxUIMisc")
	
	Window:CreateWindowLogo("All", "|cffFFFF99Miscellaneous|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "All uncategorized options.")
	Window:CreateSpacer("All", 7)

	Window:CreateSection("Retail", "Widgets")
	Window:CreateSwitch("Retail", "Misc", "DisplayWidgetPowerBar", "Display dragon riding power bar widget")
	Window:CreateSpacerNoPos("Retail")

	Window:CreateSection("All", "Micro Menu")
	Window:CreateDropdown("All", "Misc", "MicroStyle", "Select the micromenu style you want to use")
	Window:CreateDropdown("All", "Misc", "MicroToggle", "Select a keybind for toggling micro menu")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "MaxUI Micro Menu")
	Window:CreateSwitch("All", "Tools", "GameMenu", "Enable the MaxUI Micro Menu & datatext")
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

	Window:CreateSection("All", "Item Level")
	Window:CreateSwitch("All", "Misc", "ItemLevel", "Display items level on character and inspect frames")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Screen Saver")
	Window:CreateSwitch("All", "Misc", "AFKSaver", "Enable AFK screensaver")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "UI Error Frame")
	Window:CreateSwitch("All", "Misc", "ErrorSpeechEnable", "Enable error text frame")
	Window:CreateDropdown("All", "Misc", "UIErrorFont", "Set ui error text font", "Font")
	Window:CreateSlider("All", "Misc", "UIErrorSize", "Set ui error text font size", 12, 24, 1)
	Window:CreateDropdown("All", "Misc", "ErrorSpeechCombatState", "Set combat state for error speech frame")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Talking Head")
	Window:CreateSwitch("Retail", "Misc", "TalkingHeadEnable", "Enable Talking Head")
	Window:CreateSpacerNoPos("All")

	self.WindowCount = self.WindowCount -1

end
GUI:AddWidgets(MaxUIMisc)

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