------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 01-08-2021
------------------------------------------------------------------------------------------

-- extending the configuration menu for Tukui and MaxUI, additional options and settings.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local GUI = T["GUI"]
local EC = _G.Enhanced_Config

------------------------------------------------------------------------------------------
-- ACTIONBARS
------------------------------------------------------------------------------------------
local ActionBars = function(self)
	local Window = self:GetWindow("Actionbars")

	local ActionBarsWarning = CreateFrame("Frame", "ActionBarsWarning", Window)
	ActionBarsWarning:SetAllPoints(Window)
	ActionBarsWarning:SetFrameStrata("FULLSCREEN")
	ActionBarsWarning:SetFrameLevel(15)
	ActionBarsWarning:CreateBackdrop()
	ActionBarsWarning:EnableMouse(true)

	ActionBarsWarning.Text = ActionBarsWarning:CreateFontString(nil, "OVERLAY")
	ActionBarsWarning.Text:SetFont(C.Medias.Font, 14)
	ActionBarsWarning.Text:SetPoint("CENTER", ActionBarsWarning, "CENTER", 0, 0)
	ActionBarsWarning.Text:SetTextColor(1, 1, 1)
	ActionBarsWarning.Text:SetShadowColor(0, 0, 0)
	ActionBarsWarning.Text:SetShadowOffset(1.25, -1.25)
	ActionBarsWarning.Text:SetText("These settings have been disabled.\nAll settings are reorganized or replaced \nby settings in the new actionbar section.")	

	ActionBarsWarning.Logomaxui = ActionBarsWarning:CreateTexture(nil, "ART")
	ActionBarsWarning.Logomaxui:SetWidth(Window:GetWidth()-4)
	ActionBarsWarning.Logomaxui:SetHeight((Window:GetWidth()-4)/2)
	ActionBarsWarning.Logomaxui:SetPoint("TOP", ActionBarsWarning, "TOP", 0, -4)
	ActionBarsWarning.Logomaxui:SetTexture(T.GetTexture("MaxUI"))

	ActionBarsWarning.Logotukui = ActionBarsWarning:CreateTexture(nil, "OVERLAY")
	ActionBarsWarning.Logotukui:SetWidth(148)
	ActionBarsWarning.Logotukui:SetHeight(148)
	ActionBarsWarning.Logotukui:SetPoint("BOTTOM", ActionBarsWarning, "BOTTOM", 0, 42)
	ActionBarsWarning.Logotukui:SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\logo.blp]])
end
GUI:AddWidgets(ActionBars)

local MaxUIActionBars = function(self)
	local Window = self:CreateWindow("Actionbars*")

	Window:CreateSection("All", "Enable")
	Window:CreateSwitch("All", "ActionBars", "Enable", "Enable actionbar module")
	Window:CreateDropdown("All", "Layout", "LayoutCustomize", "Lock/unlock actionbars customization state")

	Window:CreateSection("All", "Styling")
	Window:CreateSwitch("All", "ActionBars", "ShowBackdrop", "Show the actionbar backdrop")
	Window:CreateSlider("All", "ActionBars", "ABAlpha", "|cffFFFFFFSet actionbar backdrop alpha|r", 0, 1, 0.1)
	Window:CreateSwitch("All", "ActionBars", "ProcAnim", "Enable our own spell flashing proc animation")
	Window:CreateSwitch("All", "ActionBars", "EquipBorder", "Highlight equipped item if they are on action bars")
	Window:CreateSwitch("All", "ActionBars", "HotKey", "Enable hotkeys text")
	Window:CreateSwitch("All", "ActionBars", "Macro", "Enable macro text")
	Window:CreateSwitch("Retail", "ActionBars", "AutoAddNewSpell", "Auto add new spell to actionbars")
	Window:CreateSwitch("All", "ActionBars", "CooldownFlash", "Enable off cooldown flash")

	Window:CreateSection("All", "Font")
	Window:CreateDropdown("All", "ActionBars", "Font", "Set actionbar font", "Font")
	Window:CreateSlider("All", "ActionBars", "ABFontSize", "|cffFFFFFFSet actionbar font size|r", 6, 32, 1)
	Window:CreateDropdown("All", "Cooldowns", "Font", "Set cooldown font", "Font")
	Window:CreateSlider("All", "ActionBars", "CDFontSize", "|cffFFFFFFSet cooldown font size|r", 6, 32, 1)

	Window:CreateSection("All", "Spacing")
	Window:CreateSlider("All", "ActionBars", "ButtonSpacing", "Set button spacing", 0, 8, 1)

	Window:CreateSection("All", "Actionbar 1 - first centered bar/paging bar")
	Window:CreateSwitch("All", "ActionBars", "SwitchBarOnStance", "Switch bar on stance changes")
	Window:CreateSlider("All", "ActionBars", "Bar1ButtonsPerRow", "Set number of buttons per row", 1, 12, 1)
	Window:CreateSlider("All", "ActionBars", "Bar1NumButtons", "Set number of buttons shown", 1, 12, 1)
	Window:CreateSlider("All", "ActionBars", "ActionBar1ButtonSize", "|cffFFFFFFSet button size|r", 12, 60, 1)
	Window:CreateDropdown("All", "ActionBars", "Actionbar1", "Set visibility")
	Window:CreateSlider("All", "ActionBars", "ActionBar1Alpha", "Set mouseover transparency", 0, 1, 0.1)
	Window:CreateDropdown("All", "ActionBars", "ActionBar1CombatState", "Set combat state")
	Window:CreateDropdown("All", "ActionBars", "ActionBar1Edges", "Set edges")
	Window:CreateSwitch("All", "ActionBars", "ActionBar1Backdrop", "Enable backdrop")

	Window:CreateSection("All", "Actionbar 2")
	Window:CreateSwitch("All", "ActionBars", "BottomLeftBar", "Enable actionbar 2")
	Window:CreateSlider("All", "ActionBars", "Bar2ButtonsPerRow", "Set number of buttons per row", 1, 12, 1)
	Window:CreateSlider("All", "ActionBars", "Bar2NumButtons", "Set number of buttons shown", 1, 12, 1)
	Window:CreateSlider("All", "ActionBars", "ActionBar2ButtonSize", "|cffFFFFFFSet button size|r", 12, 60, 1)
	Window:CreateDropdown("All", "ActionBars", "Actionbar2", "Set visibility")
	Window:CreateSlider("All", "ActionBars", "ActionBar2Alpha", "Set mouseover transparency", 0, 1, 0.1)
	Window:CreateDropdown("All", "ActionBars", "ActionBar2CombatState", "Set combat state")
	Window:CreateDropdown("All", "ActionBars", "ActionBar2Edges", "Set edges")
	Window:CreateSwitch("All", "ActionBars", "ActionBar2Backdrop", "Enable backdrop")
	
	Window:CreateSection("All", "Actionbar 3")
	Window:CreateSwitch("All", "ActionBars", "BottomRightBar", "Enable actionbar 3")
	Window:CreateSlider("All", "ActionBars", "Bar3ButtonsPerRow", "Set number of buttons per row", 1, 12, 1)
	Window:CreateSlider("All", "ActionBars", "Bar3NumButtons", "Set number of buttons shown", 1, 12, 1)
	Window:CreateSlider("All", "ActionBars", "ActionBar3ButtonSize", "|cffFFFFFFSet button size|r", 12, 60, 1)
	Window:CreateDropdown("All", "ActionBars", "Actionbar3", "Set visibility")
	Window:CreateSlider("All", "ActionBars", "ActionBar3Alpha", "Set mouseover transparency", 0, 1, 0.1)
	Window:CreateDropdown("All", "ActionBars", "ActionBar3CombatState", "Set combat state")
	Window:CreateDropdown("All", "ActionBars", "ActionBar3Edges", "Set edges")
	Window:CreateSwitch("All", "ActionBars", "ActionBar3Backdrop", "Enable backdrop")
	
	Window:CreateSection("All", "Actionbar 4")
	Window:CreateSwitch("All", "ActionBars", "RightBar", "Enable actionbar 4")
	Window:CreateSlider("All", "ActionBars", "Bar4ButtonsPerRow", "Set number of buttons per row", 1, 12, 1)
	Window:CreateSlider("All", "ActionBars", "Bar4NumButtons", "Set number of buttons shown", 1, 12, 1)
	Window:CreateSlider("All", "ActionBars", "ActionBar4ButtonSize", "|cffFFFFFFSet button size|r", 12, 60, 1)
	Window:CreateDropdown("All", "ActionBars", "Actionbar4", "Set visibility")
	Window:CreateSlider("All", "ActionBars", "ActionBar4Alpha", "Set mouseover transparency", 0, 1, 0.1)
	Window:CreateDropdown("All", "ActionBars", "ActionBar4CombatState", "Set combat state")
	Window:CreateDropdown("All", "ActionBars", "ActionBar4Edges", "Set edges")
	Window:CreateSwitch("All", "ActionBars", "ActionBar4Backdrop", "Enable backdrop")
	
	Window:CreateSection("All", "Actionbar 5")
	Window:CreateSwitch("All", "ActionBars", "LeftBar", "Enable actionbar 5")
	Window:CreateSlider("All", "ActionBars", "Bar5ButtonsPerRow", "Set number of buttons per row", 1, 12, 1)
	Window:CreateSlider("All", "ActionBars", "Bar5NumButtons", "Set number of buttons shown", 1, 12, 1)
	Window:CreateSlider("All", "ActionBars", "ActionBar5ButtonSize", "|cffFFFFFFSet button size|r", 12, 60, 1)
	Window:CreateDropdown("All", "ActionBars", "Actionbar5", "Set visibility")
	Window:CreateSlider("All", "ActionBars", "ActionBar5Alpha", "Set mouseover transparency", 0, 1, 0.1)
	Window:CreateDropdown("All", "ActionBars", "ActionBar5CombatState", "Set combat state")
	Window:CreateDropdown("All", "ActionBars", "ActionBar5Edges", "Set edges")
	Window:CreateSwitch("All", "ActionBars", "ActionBar5Backdrop", "Enable backdrop")

	Window:CreateSection("All", "Pet Bar")
	Window:CreateSwitch("All", "ActionBars", "Pet", "Enable pet bar")
	Window:CreateSlider("All", "ActionBars", "BarPetButtonsPerRow", "Set number of buttons per row", 1, 10, 1)
	Window:CreateSlider("All", "ActionBars", "PetButtonSize", "|cffFFFFFFSet button size|r", 12, 60, 1)
	Window:CreateDropdown("All", "ActionBars", "Petbar", "Set visibility")
	Window:CreateSlider("All", "ActionBars", "PetBarAlpha", "Set mouseover transparency", 0, 1, 0.1)
	Window:CreateDropdown("All", "ActionBars", "ActionBarPetCombatState", "Set combat state")
	Window:CreateDropdown("All", "ActionBars", "ActionBarPetEdges", "Set edges")
	Window:CreateSwitch("All", "ActionBars", "PetBarBackdrop", "Enable backdrop")

	Window:CreateSection("All", "Stance bar")
	Window:CreateSwitch("All", "ActionBars", "ShapeShift", "Enable shapeshift / stancs bar")
	Window:CreateDropdown("All", "ActionBars", "StancebarLayout", "Set layout")
	Window:CreateSlider("All", "ActionBars", "StanceBarButtonSize", "|cffFFFFFFSet button size|r", 12, 60, 1)
	Window:CreateDropdown("All", "ActionBars", "Stancebar", "Set visibility")
	Window:CreateSlider("All", "ActionBars", "StanceBarAlpha", "Set mouseover transparency", 0, 1, 0.1)
	Window:CreateDropdown("All", "ActionBars", "ActionBarStanceCombatState", "Set combat state")
	Window:CreateDropdown("All", "ActionBars", "ActionBarStanceEdges", "Set edges")
	Window:CreateSwitch("All", "ActionBars", "StanceBarBackdrop", "Enable backdrop")

	Window:CreateSection("All", "Extra / Zone bar (To be done, not working)")
	Window:CreateSwitch("All", "ActionBars", "ExtraBarEnable", "Enable Extra / zone bar")
	--Window:CreateDropdown("All", "ActionBars", "ExtrabarLayout", "Set layout")
	Window:CreateSlider("All", "ActionBars", "ExtraBarButtonSize", "|cffFFFFFFSet button size|r", 12, 60, 1)
	Window:CreateDropdown("All", "ActionBars", "Extrabar", "Set visibility")
	Window:CreateSlider("All", "ActionBars", "ExtraBarAlpha", "Set mouseover transparency", 0, 1, 0.1)
	Window:CreateDropdown("All", "ActionBars", "ActionBarExtraCombatState", "Set combat state")
	Window:CreateDropdown("All", "ActionBars", "ActionBarExtraEdges", "Set edges")
	Window:CreateSwitch("All", "ActionBars", "ExtraBarBackdrop", "Enable backdrop")
	
	Window:CreateSection("All", "Trinket bar (Work in progress)")
	Window:CreateSwitch("All", "ActionBars", "TrinketBarEnable", "Enable trinket bar")
	Window:CreateDropdown("All", "ActionBars", "TrinketBarLayout", "Set layout")
	Window:CreateSlider("All", "ActionBars", "TrinketBarButtonSize", "|cffFFFFFFSet button size|r", 12, 60, 1)
	Window:CreateDropdown("All", "ActionBars", "TrinketBar", "Set visibility")
	Window:CreateSlider("All", "ActionBars", "TrinketBarAlpha", "Set mouseover transparency", 0, 1, 0.1)
	Window:CreateDropdown("All", "ActionBars", "TrinketBarCombatState", "Set combat state")
	Window:CreateDropdown("All", "ActionBars", "TrinketBarEdges", "Set edges")
	Window:CreateSwitch("All", "ActionBars", "TrinketBarBackdrop", "Enable backdrop")
end
GUI:AddWidgets(MaxUIActionBars)

------------------------------------------------------------------------------------------
-- AURAS
------------------------------------------------------------------------------------------
local Auras = function(self)
	local Window = self:GetWindow("Auras")

	Window:CreateSlider("All", "Auras", "AurasFontSize", "|cffFFFFFFSet auras font size|r", 6, 32, 1)

	Window:CreateSection("All", "Position")
	Window:CreateDropdown("All", "Auras", "Position", "Set position on screen")

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

	Window:CreateSection("All", "Styling")
	Window:CreateSlider("All", "Bags", "BagsAlpha", "|cffFFFF99Set bags backdrop alpha|r", 0, 1, 0.1)
--	Window:CreateSwitch("All", "Bags", "Art", "|cffFFFF99Add some decorative elements|r")
	
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
	
	Window:CreateSlider("All", "Chat", "TabFontSize", "|cffFFFFFFSet chat tab font size|r", 6, 32, 1)

	Window:CreateSection("All", "Background & Textures")
	Window:CreateSwitch("All", "Chat", "ShowRightChat", "|cffFFFF99Show the right chat box|r")
	Window:CreateDropdown("All", "Chat", "BackgroundOptions", "Set background style")
	Window:CreateDropdown("All", "Chat", "Chattexture", "Set texture if style 'Texture' is chosen", "Texture")
	Window:CreateSlider("All", "Chat", "ChattextureAlpha", "Set texture alpha if style 'Texture' is chosen", 0, 1, 0.1)
	Window:CreateColorSelection("All", "Chat", "ChattextureColor", "Set texture color if style 'Texture' is chosen")

	Window:CreateSection("All", "Headers")
	Window:CreateSwitch("All", "Chat", "Headers", "|cffFFFF99Enable styled chat headers/tabs|r")
	Window:CreateSwitch("All", "Chat", "TabDividers", "|cffFFFF99Enable chat tab separators|r")
	
	Window:CreateSection("All", "Position")
	Window:CreateDropdown("All", "Chat", "Position", "|cffFFFF99Set position on screen|r")

	Window:CreateSection("All", "Combat State")
	Window:CreateDropdown("All", "Chat", "ChatBGCombatState", "Set combat state")
end
GUI:AddWidgets(Chat)

------------------------------------------------------------------------------------------
-- DATATEXTS
------------------------------------------------------------------------------------------
local DataTexts = function(self)
	local Window = self:GetWindow("DataTexts")
	
	Window:CreateSlider("All", "DataTexts", "FontSize", "|cffFFFFFFSet datatext font size|r", 6, 32, 1)
	
	if not (C["General"]["Themes"]["Value"] == "MaxUI") then return end

	Window:CreateSection("All", "MaxUI Settings")
	Window:CreateSwitch("All", "DataTexts", "Icons", "|cffFFFF99Enable datatext icons|r")

	Window:CreateSection("All", "Top Datatexts")
	Window:CreateSwitch("All", "DataTexts", "Topline", "|cffFFFF99Enable top panel & datatexts|r")
	Window:CreateSlider("All", "DataTexts", "AmountTopDataTexts", "|cffFFFF99Set datatext amount|r", 0, 21, 1)

	Window:CreateSection("All", "Bottom Datatexts")
	Window:CreateSwitch("All", "DataTexts", "Bottomline", "|cffFFFF99Enable bottom panel & datatexts|r")
	Window:CreateSlider("All", "DataTexts", "AmountBottomDataTexts", "|cffFFFF99Set datatext amount|r", 0, 21, 1)

	Window:CreateSection("All", "Data center Datatexts")
	Window:CreateSwitch("All", "DataTexts", "DataCenter", "|cffFFFF99Enable datacenter panel & datatexts|r")
	Window:CreateSwitch("All", "DataTexts", "DataCenterClassLogo", "|cffFFFF99Enable datacenter class art|r")
	Window:CreateSlider("All", "DataTexts", "AmountDataCenterDataTexts", "|cffFFFF99Set datatext amount|r", 0, 60, 1)
	Window:CreateSlider("All", "DataTexts", "DataCenterAlpha", "|cffFFFF99Set datacenter backdrop alpha|r", 0, 1, 0.1)
	Window:CreateDropdown("All", "DataTexts", "TooltipAnchor", "|cffFFFF99Set anchor for tooltips|r")

	Window:CreateSection("All", "Combat State")
	Window:CreateDropdown("All", "DataTexts", "BottomlineCombatState", "|cffFFFF99Set combat state for bottom datatexts|r")
	Window:CreateDropdown("All", "DataTexts", "ToplineCombatState", "|cffFFFF99Set combat state for top datatexts|r")

	Window:CreateSection("All", "Databar Settings")
	Window:CreateSwitch("All", "Misc", "PercentageTag", "|cffFFFF99Set percentage tag(s) for databars|r")

	Window:CreateSection("All", "Experience")
	Window:CreateSwitch("All", "Misc", "XPBarEnable", "|cffFFFF99Enable experience bar as datatext|r")
	Window:CreateSlider("All", "Misc", "XPBarHeight", "|cffFFFF99Set bar height|r", 1, 20, 1)
	Window:CreateSlider("All", "Misc", "XPBarWidth", "|cffFFFF99Set bar width|r", 10, 500, 1)
	Window:CreateDropdown("All", "Misc", "XPBarTexture", "|cffFFFF99Set bar texture|r", "Texture")

	Window:CreateSection("All", "Reputation")
	Window:CreateSwitch("All", "Misc", "REPBarEnable", "|cffFFFF99Enable reputation bar as datatext|r")
	Window:CreateSlider("All", "Misc", "REPBarHeight", "|cffFFFF99Set bar height|r", 1, 20, 1)
	Window:CreateSlider("All", "Misc", "REPBarWidth", "|cffFFFF99Set bar width|r", 10, 500, 1)
	Window:CreateDropdown("All", "Misc", "REPBarTexture", "|cffFFFF99Set bar texture|r", "Texture")

	-- only retail?
	Window:CreateSection("All", "Honor")
	Window:CreateSwitch("All", "Misc", "HONORBarEnable", "|cffFFFF99Enable honor bar as datatext|r")
	Window:CreateSlider("All", "Misc", "HONORBarHeight", "|cffFFFF99Set bar height|r", 1, 20, 1)
	Window:CreateSlider("All", "Misc", "HONORBarWidth", "|cffFFFF99Set bar width|r", 10, 500, 1)
	Window:CreateDropdown("All", "Misc", "HONORBarTexture", "|cffFFFF99Set bar texture|r", "Texture")

	Window:CreateSection("Retail", "Azerite")
	Window:CreateSwitch("Retail", "Misc", "AZERITEBarEnable", "|cffFFFF99Enable azerite as bar datatext|r")
	Window:CreateSlider("Retail", "Misc", "AZERITEBarHeight", "|cffFFFF99Set bar height|r", 1, 20, 1)
	Window:CreateSlider("Retail", "Misc", "AZERITEBarWidth", "|cffFFFF99Set bar width|r", 10, 500, 1)
	Window:CreateDropdown("Retail", "Misc", "AZERITEBarTexture", "|cffFFFF99Set bar texture|r", "Texture")

	Window:CreateSection("Retail", "Anima")
	Window:CreateSwitch("Retail", "Misc", "ANIMABarEnable", "|cffFFFF99Enable anima bar as datatext|r")
	Window:CreateSlider("Retail", "Misc", "ANIMABarHeight", "|cffFFFF99Set bar height|r", 1, 20, 1)
	Window:CreateSlider("Retail", "Misc", "ANIMABarWidth", "|cffFFFF99Set bar width|r", 10, 500, 1)
	Window:CreateDropdown("Retail", "Misc", "ANIMABarTexture", "|cffFFFF99Set bar texture|r", "Texture")
end
GUI:AddWidgets(DataTexts)

------------------------------------------------------------------------------------------
-- GENERAL
------------------------------------------------------------------------------------------
local General = function(self)
	local Window = self:GetWindow("General")
	
	Window:CreateSlider("All", "General", "FontSize", "Set global font size", 6, 32, 1)
	
	--Window:CreateSection("All", "Other used fonts")
	--Window:CreateDropdown("All", "General", "FontFlag", "Set font flag for used fonts")

	Window:CreateSection("All", "Fader / Animation")
	Window:CreateSlider("All", "General", "FaderTime", "|cffFFFFFFSet fade duration for animated elements|r", 0, 2, 0.1)
	
	if C["General"]["Themes"]["Value"] == "MaxUI" then 
		Window:CreateSection("All", "MAXUI Panels and Frames")
		Window:CreateSlider("All", "General", "GeneralPanelAlpha", "|cffFFFF99Set line/panel transparency|r", 0, 1, 0.1)
		Window:CreateSlider("All", "General", "thickness", "|cffFFFF99Set line/panel thickness|r", 1, 40, 1)

		Window:CreateSection("All", "Texture")
		Window:CreateDropdown("All", "General", "HeaderTexture", "|cffFFFF99Set header texture|r", "Texture")
		Window:CreateDropdown("All", "General", "LineTexture", "|cffFFFF99Set line/panel texture|r", "Texture")
		Window:CreateDropdown("All", "General", "TextureButton", "|cffFFFF99Set button texture|r", "Texture")

		Window:CreateSection("All", "Colors")
		Window:CreateDropdown("All", "General", "ClassColorHeaders", "|cffFFFF99Set header color|r")
		Window:CreateDropdown("All", "General", "ClassColorLines", "|cffFFFF99Set line/panel color|r")
		Window:CreateDropdown("All", "General", "ClassShadow", "|cffFFFF99Set shadow color|r")
		Window:CreateSwitch("All", "General", "ClassShadowExcludeUF", "|cffFFFF99Exclude unitframes from shadow color|r")
	end
	
	local Explanation = CreateFrame("Frame", "Explanation", Window)
	Explanation:SetPoint("BOTTOMLEFT", Window, "BOTTOMLEFT", 16, 16)
	Explanation:SetPoint("BOTTOMRIGHT", Window, "BOTTOMRIGHT", -16, 16)
	Explanation:SetHeight(120)
	Explanation:SetFrameStrata("FULLSCREEN")
	Explanation:SetFrameLevel(15)
	Explanation:CreateBackdrop("Transparent")
	--Explanation.Backdrop:SetBackdropColor(0, 0, 0, 0)
	Explanation:EnableMouse(true)

	Explanation.Text = Explanation:CreateFontString(nil, "OVERLAY")
	Explanation.Text:SetFont(C.Medias.Font, 12)
	Explanation.Text:SetPoint("LEFT", Explanation, "LEFT", 16, 0)
	Explanation.Text:SetTextColor(1, 1, 1)
	Explanation.Text:SetShadowColor(0, 0, 0)
	Explanation.Text:SetShadowOffset(1.25, -1.25)
	Explanation.Text:SetJustifyH("LEFT")
	Explanation.Text:SetText("|cffFFFF99NOTE:|r \n\nThe global font only sets fonts for texts that aren't adjustable in any of the other\nsections. It will change the fonts for the GUI, the tooltip descriptions,\nall kinds of blizzard frames and more.")	
	
	Explanation.Logomaxui = Explanation:CreateTexture(nil, "ART")
	Explanation.Logomaxui:SetWidth(96)
	Explanation.Logomaxui:SetHeight(48)
	Explanation.Logomaxui:SetPoint("RIGHT", Explanation, "TOPRIGHT", -16, 0)
	Explanation.Logomaxui:SetTexture(T.GetTexture("MaxUI"))

end
GUI:AddWidgets(General)

------------------------------------------------------------------------------------------
-- LOOT
------------------------------------------------------------------------------------------
local Loot = function(self)
	local Window = self:GetWindow("Loot")
	Window:CreateSlider("All", "Loot", "FontSize", "|cffFFFFFFSet font size|r", 6, 32, 1)
end
GUI:AddWidgets(Loot)

------------------------------------------------------------------------------------------	
-- MINIMAP & LOCATION
------------------------------------------------------------------------------------------
local Maps = function(self)
	local Window = self:GetWindow("Maps")

	Window:CreateDropdown("All", "Location", "WorldmapCombatState", "Set combat state")

	Window:CreateSection("All", "Minimap Extended")
	Window:CreateSwitch("All", "Location", "MinimapEnable", "Enable minimap")
	Window:CreateSwitch("All", "Location", "Compass", "Enable compass")
	Window:CreateDropdown("All", "Location", "Position", "Set position on screen")
	Window:CreateDropdown("All", "Location", "MinimapCombatState", "Set combat state")

	Window:CreateSection("All", "Location & Coordinates - to be added again")
	Window:CreateSwitch("All", "Location", "EnableLocator", "Enable location frame")
	Window:CreateSwitch("All", "Location", "AlwaysDark", "Set a dark background")
	Window:CreateSlider("All", "Location", "LocatorWidth", "Set location panel width", 200, 800, 1)
	Window:CreateDropdown("All", "Location", "LocatorCombatState", "Set combat state")

end
GUI:AddWidgets(Maps)

------------------------------------------------------------------------------------------
-- MISC
------------------------------------------------------------------------------------------
local Misc = function(self)
	local Window = self:GetWindow("Misc")

	Window:CreateSection("All", "UI Error Frame Extended")
	Window:CreateSwitch("All", "Misc", "ErrorSpeechEnable", "Enable error speech frame")
	Window:CreateDropdown("All", "Misc", "ErrorSpeechCombatState", "Set combat state for error speech frame")

	Window:CreateSection("All", "Threat")
	Window:CreateSwitch("All", "Misc", "ThreatBar", "Enable threat bar")
	Window:CreateSlider("All", "Misc", "ThreatBarHeight", "|cffFFFF99Set bar height|r", 1, 40, 1)
	Window:CreateSlider("All", "Misc", "ThreatBarWidth", "|cffFFFF99Set bar width|r", 10, 500, 1)
	Window:CreateDropdown("All", "Misc", "ThreatBarTexture", "|cffFFFF99Set bar texture|r", "Texture")

	-- only retail?
	Window:CreateSection("All", "Alternative Power")
	Window:CreateSwitch("All", "Misc", "AlternativePowerBarEnable", "|cffFFFF99Enable alternative power bar|r")
	Window:CreateSlider("All", "Misc", "AlternativePowerBarHeight", "|cffFFFF99Set bar height|r", 1, 40, 1)
	Window:CreateSlider("All", "Misc", "AlternativePowerBarWidth", "|cffFFFF99Set bar width|r", 10, 500, 1)
	Window:CreateDropdown("All", "Misc", "AlternativePowerBarTexture", "|cffFFFF99Set bar texture|r", "Texture")
	
	Window:CreateSection("All", "Other Bar(s) - Mirror bars etc.")
	Window:CreateSwitch("All", "Misc", "OtherBarEnable", "|cffFFFF99Enable other bars|r")
	Window:CreateSlider("All", "Misc", "BarHeight", "|cffFFFF99Set bar height|r", 1, 40, 1)
	Window:CreateSlider("All", "Misc", "BarWidth", "|cffFFFF99Set bar width|r", 10, 500, 1)
	Window:CreateDropdown("All", "Misc", "BarTexture", "|cffFFFF99Set bar texture|r", "Texture")
end
GUI:AddWidgets(Misc)

------------------------------------------------------------------------------------------
-- NAMEPLATES
------------------------------------------------------------------------------------------
local NamePlates = function(self)
	local Window = self:GetWindow("NamePlates")

	Window:CreateSection("All", "Settings")
	Window:CreateSlider("All", "NamePlates", "MaxDistance", "Set max visible distance", 2, 60, 1)
	Window:CreateSwitch("All", "NamePlates", "CombatOnly", "Show nameplates only in combat")

	Window:CreateSection("All", "Health")
	Window:CreateSwitch("All", "NamePlates", "HealthBars", "Show health and power bars")
	Window:CreateDropdown("All", "NamePlates", "HealthTag", "Set health tag format")
	Window:CreateSwitch("All", "NamePlates", "HealthPrediction", "Enable health prediction for nameplates")
	Window:CreateDropdown("All", "Textures", "NPHealthTexture", "Set health texture", "Texture")
	Window:CreateSlider("All", "NamePlates", "HealthFontSize", "|cffFFFFFFSet nameplate health font size|r", 6, 32, 1)

	Window:CreateSection("All", "Power")
	Window:CreateDropdown("All", "NamePlates", "Font", "Set nameplate font", "Font")
	Window:CreateDropdown("All", "Textures", "NPPowerTexture", "Set power texture", "Texture")

	Window:CreateSection("All", "Name")
	Window:CreateDropdown("All", "NamePlates", "NameTag", "|cffFFFFFFSet name tag format|r")
	Window:CreateSlider("All", "NamePlates", "FontSize", "|cffFFFFFFSet nameplate font size|r", 6, 32, 1)

	Window:CreateSection("All", "Castbar")
	Window:CreateSwitch("All", "NamePlates", "NameplateCastBar", "Enable nameplate castbar")
	Window:CreateSlider("All", "NamePlates", "CastHeight", "|cffFFFF99Set castbar height|r", 2, 32, 1)
	Window:CreateSwitch("All", "NamePlates", "CastbarFullNameplateOverlap", "|cffFFFF99Use the entire nameplate when casting|r")
	Window:CreateDropdown("All", "Textures", "NPCastTexture", "Set cast texture", "Texture")

	Window:CreateSection("All", "Debuffs")
	Window:CreateSwitch("All", "NamePlates", "Debuffs", "Enable debuffs")
	Window:CreateSwitch("All", "NamePlates", "OnlySelfDebuffs", "Display only our debuffs")
	Window:CreateSwitch("All", "NamePlates", "DebuffsOnTop", "Enable debuffs on top")
	Window:CreateSlider("All", "NamePlates", "DebuffSize", "Set debuff size", 2, 40, 1)
	
	Window:CreateSection("All", "Marking and Icons (WIP)")
	Window:CreateSlider("All", "NamePlates", "MarkerSize", "Set raid marker size", 2, 80, 1)
	Window:CreateSlider("All", "NamePlates", "QuestIconSize", "Set quest icon size", 2, 80, 1)
	Window:CreateSwitch("All", "NamePlates", "RoleIndicator", "Enable Role indicator")
	Window:CreateSwitch("All", "NamePlates", "PvPIndicator", "Enable PvP indicator (right)")
	Window:CreateSwitch("All", "NamePlates", "Badge", "Enable Pvp badge {right)")
	Window:CreateSwitch("All", "NamePlates", "PvPClassificationIndicator", "Enable PvP Classification indicator (top)")
	
	Window:CreateSection("All", "Threat")
	Window:CreateSwitch("All", "NamePlates", "ThreatIndicator", "Enable a personal threat indicator (like threatbar)")

	Window:CreateSection("All", "Current target highlighting")
	Window:CreateSwitch("All", "NamePlates", "TargetIndicator", "Enable current target indicator")
	Window:CreateSwitch("All", "NamePlates", "TargetHighlight", "Enable current target highlight")
	Window:CreateSlider("All", "NamePlates", "HighlightSize", "Set nameplate highlight size", 2, 16, 1)
	Window:CreateColorSelection("All", "NamePlates", "HighlightColor", "Highlight/Indicator color")
	
	-- new tukui option need to match
	Window:CreateSection("All", "Current target scale")
	Window:CreateSlider("All", "NamePlates", "SelectedScale", "Set scaling of selected plate (%)", 100, 200, 1)
	
	-- new tukui option need to match
	Window:CreateSection("All", "Current target transparency")
	Window:CreateSlider("All", "NamePlates", "NotSelectedAlpha", "Set not selected nameplate alpha (%)", 0, 100, 1)
	
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

	Window:CreateSection("All", "Settings")
	Window:CreateSwitch("All", "Party", "ShowSolo", "Show when solo")
	Window:CreateSlider("All", "Party", "VerticalSpacing", "|cffFFFF99Set spacing|r", -200, 200, 1)

	-- still needed? tag system?
	if (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then
		Window:CreateSwitch("All", "Party", "PercentageTags", "|cffFFFF99Enable percentages|r")
	end
	
	Window:CreateSection("All", "Health")
	if (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then
		Window:CreateSlider("All", "Party", "HealthHeight", "|cffFFFF99Set health height|r", 10, 50, 1)
		Window:CreateSlider("All", "Party", "HealthWidth", "|cffFFFF99Set health width|r", 50, 400, 1)
	end		
	Window:CreateDropdown("All", "Party", "HealthTag", "Health tag party unit")
	Window:CreateDropdown("All", "Party", "HealthFont", "Set party health font", "Font")
	Window:CreateSlider("All", "Party", "HealthFontSize", "|cffFFFF99Set health font size|r", 6, 40, 1)
	Window:CreateDropdown("All", "Textures", "UFPartyHealthTexture", "|cffFFFFFFSet health texture|r", "Texture")
	
	Window:CreateSection("All", "Power")
	if (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then
		Window:CreateSlider("All", "Party", "PowerHeight", "|cffFFFF99Set power height|r", 4, 30, 1)
		Window:CreateSlider("All", "Party", "PowerWidth", "|cffFFFF99Set power width|r", 20, 200, 1)
	end
	Window:CreateDropdown("All", "Party", "PowerFont", "|cffFFFF99Set power font|r", "Font")
	Window:CreateSlider("All", "Party", "PowerFontSize", "|cffFFFF99Set power font size|r", 6, 40, 1)
	Window:CreateDropdown("All", "Textures", "UFPartyPowerTexture", "|cffFFFFFFSet power texture|r", "Texture")
	
	Window:CreateSection("All", "Name")
	if (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then
	end
	Window:CreateDropdown("All", "Party", "Font", "Set party font", "Font")
	Window:CreateSlider("All", "Party", "NameFontSize", "|cffFFFF99Set name font size|r", 6, 40, 1)
	
	Window:CreateSection("All", "Buffs")
	if (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then
		Window:CreateSwitch("All", "Party", "ShowBuffs", "|cffFFFF99Show buffs|r")
	end
	
	Window:CreateSection("All", "Debuffs")
	if (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then
		Window:CreateSwitch("All", "Party", "ShowDebuffs", "|cffFFFF99Show debuffs|r")
	end
	
	if (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then
		Window:CreateSection("All", "Marking")
		Window:CreateSlider("All", "Party", "RaidIconSize", "|cffFFFF99Set raid icon size|r", 10, 40, 1)
	end
	
	Window:CreateSection("All", "Portrait")
	if (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then
		Window:CreateDropdown("All", "Party", "PortraitStyle", "|cffFFFF99Set portrait style|r")
		Window:CreateSlider("All", "Party", "PortraitOverlayAlpha", "|cffFFFF99Set transparency|r", 0, 1, 0.1)
	end
end
GUI:AddWidgets(Party)

------------------------------------------------------------------------------------------
-- QUESTS	
------------------------------------------------------------------------------------------
local Quests = function(self)
	local Window = self:CreateWindow("Quests")
	
	Window:CreateSection("All", "Style")
	Window:CreateSwitch("All", "Quests", "QuestHeaderLines", "|cffFFFF99Add a header line/panel for the objective tracker sections|r")
	Window:CreateSwitch("All", "Quests", "QuestHeaderBackdrops", "|cffFFFF99Add a shadowy backdrop for the objective tracker sections|r")
	Window:CreateDropdown("All", "Textures", "QuestProgressTexture", "Set progress bar texture", "Texture")
	
	Window:CreateSection("Retail", "Settings")
	Window:CreateSwitch("Retail", "Quests", "TrackerFixed", "|cffFFFF99Anchor the objective tracker to the quest datatext|r")
	Window:CreateDropdown("Retail", "Quests", "FilterTracking", "|cffFFFF99Set filter for quests tracked in the objective tracker|r")
	
	Window:CreateSection("All", "Combat State")
	Window:CreateDropdown("All", "Quests", "QuestTrackerCombatState", "Set combat state for tracker")

end
GUI:AddWidgets(Quests)

------------------------------------------------------------------------------------------
-- RAID
------------------------------------------------------------------------------------------
local Raid = function(self)
	local Window = self:GetWindow("Raid")

	Window:CreateSection("All", "Alternative WIP")
	Window:CreateSwitch("All", "Raid", "Alternative", "Enable experimental Raidframes")

	Window:CreateSection("All", "Settings")
	Window:CreateSwitch("All", "Raid", "ShowSolo", "Show when solo (Not working atm)")
	Window:CreateSwitch("All", "Raid", "GroupNumber", "Enable a group number indicator")
	
	Window:CreateSection("All", "Direction")
	Window:CreateDropdown("All", "Raid", "GrowDirection", "Set grow direction")

	Window:CreateSection("All", "Spacing")
	Window:CreateSlider("All", "Raid", "HorSpacing", "Set horizontal spacing", 4, 40, 1)
	Window:CreateSlider("All", "Raid", "VerSpacing", "Set vertical spacing", 4, 40, 1)

	Window:CreateSection("All", "Marking and Icons")
	Window:CreateDropdown("All", "UnitFrames", "Roles", "Set style for role icons (all unitframes)")
	Window:CreateSlider("All", "Raid", "RoleIconSize", "|cffFFFF99Set role icon size|r", 4, 40, 1)
	Window:CreateSlider("All", "Raid", "MarkerSize", "|cffFFFF99Set raid marker size|r", 4, 40, 1)
	--Window:CreateSwitch("All", "Raid", "AssignmentIcon", "Enable a Raid Assignment Icon")

	Window:CreateSection("All", "Health")
	Window:CreateSlider("All", "Raid", "HealthFontSize", "|cffFFFF99Set health font size|r", 6, 32, 1)
	Window:CreateSwitch("All", "Raid", "VerticalHealth", "Enable vertical health")
	Window:CreateDropdown("All", "Raid", "HealthTag", "Health tag raid unit")
	Window:CreateSwitch("All", "Raid", "ShowPercentageHealth", "Enable a health percentage tag")
	Window:CreateDropdown("All", "Raid", "HealthPercentageFont", "Set font for raid info tags", "Font")
	Window:CreateSlider("All", "Raid", "PercentageFontSize", "|cffFFFF99Set tag font size|r", 6, 32, 1)
	Window:CreateDropdown("All", "Textures", "UFRaidHealthTexture", "|cffFFFFFFSet health texture|r", "Texture")
			
	Window:CreateSection("All", "Power")
	Window:CreateDropdown("All", "Textures", "UFRaidPowerTexture", "|cffFFFFFFSet power texture|r", "Texture")
	Window:CreateSwitch("All", "Raid", "PowerVertical", "Enable a vertical powerbar to the side")
			
	Window:CreateSection("All", "Name")
	Window:CreateSlider("All", "Raid", "FontSize", "|cffFFFF99Set name font size|r", 6, 32, 1)
	Window:CreateDropdown("All", "Raid", "NameColor", "Set name color")
	Window:CreateColorSelection("All", "Raid", "CustomNameColor", "Set custom name color if style 'Custom' is chosen")
			
	Window:CreateSection("All", "Buffs extended")
	Window:CreateDropdown("All", "Raid", "RaidBuffs", "Set style for raid buffs")
	if (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then
		Window:CreateDropdown("All", "Raid", "BuffsPosition", "|cffFFFF99Set position for raid buffs icons|r")
	end
	Window:CreateSection("All", "Debuffs extended")
	if (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then
		Window:CreateSectionButton("All", "tracking", "Open the debuff tracking tool", GUI.TukuiDebuffTracking)
		Window:CreateSwitch("All", "Raid", "DeBuffsOnRight", "|cffFFFF99Anchor debuffs to the right|r")
	end
end
GUI:AddWidgets(Raid)

------------------------------------------------------------------------------------------
-- Scrolling Combat Text
------------------------------------------------------------------------------------------
local ScrollingCombatText = function(self)
	local Window = self:CreateWindow("Scrolling Text")

	Window:CreateSection("All", "World / Nameplates: Enable")
	Window:CreateDropdown("All", "Scrolling Text", "Healing", "Enable healing numbers")
	Window:CreateDropdown("All", "Scrolling Text", "Shields", "Enable absorb numbers")
	Window:CreateDropdown("All", "Scrolling Text", "Damage", "Enable damage numbers")
	Window:CreateDropdown("All", "Scrolling Text", "Pet", "Enable Pet damage numbers")
	
	Window:CreateSection("All", "World / Nameplates: Customize")
	Window:CreateSwitch("All", "Scrolling Text", "Direction", "Enable dynamic/directional combat text")
	Window:CreateDropdown("All", "Scrolling Text", "FloatMode", "Set direction for combat text")
	Window:CreateSlider("All", "Scrolling Text", "Scale", "Set scale", 0, 2, 0.1)
	Window:CreateSlider("All", "Scrolling Text", "YOffset", "Set vertical offset", -0.1, 0.1, 0.01)
	
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

	if (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then 
		local Explanation = CreateFrame("Frame", "Explanation", Window)
		Explanation:SetPoint("BOTTOMLEFT", Window, "BOTTOMLEFT", 16, 16)
		Explanation:SetPoint("BOTTOMRIGHT", Window, "BOTTOMRIGHT", -16, 16)
		Explanation:SetHeight(120)
		Explanation:SetFrameStrata("FULLSCREEN")
		Explanation:SetFrameLevel(15)
		Explanation:CreateBackdrop("Transparent")
		--Explanation.Backdrop:SetBackdropColor(0, 0, 0, 0)
		Explanation:EnableMouse(true)

		Explanation.Text = Explanation:CreateFontString(nil, "OVERLAY")
		Explanation.Text:SetFont(C.Medias.Font, 12)
		Explanation.Text:SetPoint("LEFT", Explanation, "LEFT", 16, 0)
		Explanation.Text:SetTextColor(1, 1, 1)
		Explanation.Text:SetShadowColor(0, 0, 0)
		Explanation.Text:SetShadowOffset(1.25, -1.25)
		Explanation.Text:SetJustifyH("LEFT")
		Explanation.Text:SetText("|cffFFFF99NOTE:|r \n\nThese texture settings are used by options in other sections.")	
		
		Explanation.Logomaxui = Explanation:CreateTexture(nil, "ART")
		Explanation.Logomaxui:SetWidth(96)
		Explanation.Logomaxui:SetHeight(48)
		Explanation.Logomaxui:SetPoint("RIGHT", Explanation, "TOPRIGHT", -16, 0)
		Explanation.Logomaxui:SetTexture(T.GetTexture("MaxUI"))
	end
end
GUI:AddWidgets(Textures)

------------------------------------------------------------------------------------------
-- TOOLS
------------------------------------------------------------------------------------------
local Tools = function(self)
	local Window = self:CreateWindow("Tools")

	Window:CreateSection("All", "Settings")
	Window:CreateSlider("All", "Tools", "ToolButtonSize", "Set button size", 10, 40, 1)
	Window:CreateDropdown("All", "Tools", "Font", "Set tools font", "Font")
	Window:CreateSlider("All", "Tools", "FontSize", "|cffFFFFFFSet tools font size|r", 6, 32, 1)

	Window:CreateSection("All", "UI Configuration")
	Window:CreateSwitch("All", "Tools", "UIConfig", "Enable the UI config tool & datatext")

	Window:CreateSection("All", "Chat")
	Window:CreateSwitch("All", "Tools", "ChatShortcuts", "Enable chat button shortcuts")
	Window:CreateDropdown("All", "Tools", "ChatShortcutsPosition", "Set anchorpoint for the chat tool")

	Window:CreateSection("All", "Meters")
	Window:CreateSwitch("All", "Tools", "Meters", "Enable the meters tool & datatext")

	Window:CreateSection("All", "Buff Tracker")
	Window:CreateSwitch("All", "Tools", "RaidBuffTracking", "Enable the buff tracker & datatext")
	
	Window:CreateSection("All", "Raid Tools")
	Window:CreateSwitch("All", "Tools", "RaidTools", "Enable the raid tools & datatext")

	Window:CreateSection("All", "Game Menu")
	Window:CreateSwitch("All", "Tools", "GameMenu", "Enable the game menu & datatext")

	--Window:CreateSection("All", "Interrupt")
	--Window:CreateDropdown("All", "Tools", "InterruptAnnounce", "Set Interrupt Announces")
	--Window:CreateSwitch("All", "Tools", "InterruptAnnounceSolo", "Enable when solo")
end
GUI:AddWidgets(Tools)

------------------------------------------------------------------------------------------
-- TOOLTIPS
------------------------------------------------------------------------------------------
local Tooltips = function(self)
	local Window = self:GetWindow("Tooltips")

	Window:CreateSlider("All", "Tooltips", "HealthFontSize", "|cffFFFF99Set tooltip health font size|r", 6, 40, 1)

	Window:CreateSection("All", "Texture")
	Window:CreateDropdown("All", "Textures", "TTHealthTexture", "Set texture for tooltip health", "Texture")

	Window:CreateSection("All", "Settings")
	Window:CreateSlider("All", "Tooltips", "TooltipAlpha", "|cffFFFF99Set tooltip transparency|r", 0, 1, 0.1)
end
GUI:AddWidgets(Tooltips)

------------------------------------------------------------------------------------------
-- UNITFRAMES - GENERAL
------------------------------------------------------------------------------------------
local UnitFrames = function(self)
	local Window = self:GetWindow("UnitFrames")

	local UnitFramesWarning = CreateFrame("Frame", "UnitFramesWarning", Window)
	UnitFramesWarning:SetAllPoints(Window)
	UnitFramesWarning:SetFrameStrata("FULLSCREEN")
	UnitFramesWarning:SetFrameLevel(15)
	UnitFramesWarning:CreateBackdrop()
	UnitFramesWarning:EnableMouse(true)

	UnitFramesWarning.Text = UnitFramesWarning:CreateFontString(nil, "OVERLAY")
	UnitFramesWarning.Text:SetFont(C.Medias.Font, 14)
	UnitFramesWarning.Text:SetPoint("CENTER", UnitFramesWarning, "CENTER", 0, 0)
	UnitFramesWarning.Text:SetTextColor(1, 1, 1)
	UnitFramesWarning.Text:SetShadowColor(0, 0, 0)
	UnitFramesWarning.Text:SetShadowOffset(1.25, -1.25)
	UnitFramesWarning.Text:SetText("These settings have been disabled.\nAll settings are reorganized or replaced \nby settings in their respective unitframe sections.")	

	UnitFramesWarning.Logomaxui = UnitFramesWarning:CreateTexture(nil, "ART")
	UnitFramesWarning.Logomaxui:SetWidth(Window:GetWidth()-4)
	UnitFramesWarning.Logomaxui:SetHeight((Window:GetWidth()-4)/2)
	UnitFramesWarning.Logomaxui:SetPoint("TOP", UnitFramesWarning, "TOP", 0, -4)
	UnitFramesWarning.Logomaxui:SetTexture(T.GetTexture("MaxUI"))

	UnitFramesWarning.Logotukui = UnitFramesWarning:CreateTexture(nil, "OVERLAY")
	UnitFramesWarning.Logotukui:SetWidth(148)
	UnitFramesWarning.Logotukui:SetHeight(148)
	UnitFramesWarning.Logotukui:SetPoint("BOTTOM", UnitFramesWarning, "BOTTOM", 0, 42)
	UnitFramesWarning.Logotukui:SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\logo.blp]])
end
GUI:AddWidgets(UnitFrames)

local UnitFramesMore = function(self)
	local Window = self:CreateWindow("Unitfr. ALL")

	Window:CreateSection("All", "Enable")
	Window:CreateSwitch("All", "UnitFrames", "Enable", "Enable all unitframe modules")

	Window:CreateSection("All", "Theme")
	Window:CreateDropdown("All", "UnitFrames", "Style", "Set theme for unitframes")
	
	if (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then
		Window:CreateSection("All", "Orientation")
		Window:CreateDropdown("All", "UnitFrames", "HorVer", "|cffFFFF99Set unitframes orientation|r")
	end
	
	Window:CreateSection("All", "Styling")
	Window:CreateSwitch("All", "UnitFrames", "Smoothing", "Animate health and power bars")
	Window:CreateSwitch("All", "UnitFrames", "Smooth", "Enable smooth health transitions")
	Window:CreateSlider("All", "UnitFrames", "StatusBarBackgroundMultiplier", "Health and Power background % opacity", 0, 50, 1)
	Window:CreateSlider("All", "UnitFrames", "RangeAlpha", "Set out of range alpha (focus/arena/boss)", 0, 1, 0.1)
	Window:CreateSwitch("All", "UnitFrames", "TargetEnemyHostileColor", "Enemy health bar colored by hostile reaction color instead of class")

	--Window:CreateSection("All", "Font")
	--Window:CreateDropdown("All", "UnitFrames", "Font", "Set unitframe font", "Font")
	
	--Window:CreateSection("All", "Combat feedback")
	--Window:CreateSwitch("All", "UnitFrames", "CombatLog", "Enable combat feedback text")
	
	Window:CreateSection("All", "Anchors")
	Window:CreateSwitch("All", "UnitFrames", "MaxUIAnchor", "|cffFFFFFFShow unitframes anchor|r")
	Window:CreateSlider("All", "UnitFrames", "MaxUIAnchorWidth", "|cffFFFFFFSet horizontal offset for player and target|r", -1000, 1000, 1)
	Window:CreateSlider("All", "UnitFrames", "MaxUIAnchorVertical", "|cffFFFFFFSet vertical offset for player and target|r", -1000, 1000, 1)

	Window:CreateSection("All", "Health color")
	Window:CreateDropdown("All", "UnitFrames", "Colorstyle", "Set color style for all unitframes")
	Window:CreateColorSelection("All", "UnitFrames", "StatusBarColor", "Set custom health bar color")
	Window:CreateColorSelection("All", "UnitFrames", "ColorTexture", "Set custom backdrop color")
	
	Window:CreateSection("All", "Values / Tag color")
	Window:CreateDropdown("All", "UnitFrames", "TagFormat", "Set value/tag format (full or short)")
	Window:CreateDropdown("All", "UnitFrames", "HealthValueColors", "Set preset color for all unitframe health values")
	Window:CreateColorSelection("All", "UnitFrames", "CustomHealthValueColors", "Set custom health value color")
	Window:CreateDropdown("All", "UnitFrames", "PowerValueColors", "Set preset color for all unitframe power values")
	Window:CreateColorSelection("All", "UnitFrames", "CustomPowerValueColors", "Set custom power value color")

	Window:CreateSection("All", "Healcomm")
	Window:CreateSwitch("All", "UnitFrames", "HealComm", "Enable HealComm")
	Window:CreateSlider("All", "UnitFrames", "HealCommAlpha", "Set healcomm bars alpha", 0, 1, 0.1)
	Window:CreateColorSelection("All", "UnitFrames", "HealCommSelfColor", "HealComm - my heals")
	Window:CreateColorSelection("All", "UnitFrames", "HealCommOtherColor", "HealComm - others heals")
	Window:CreateColorSelection("Retail", "UnitFrames", "HealCommAbsorbColor", "HealComm - absorbs")
	
	Window:CreateSection("All", "Buffs & Debuffs")
	Window:CreateSwitch("All", "UnitFrames", "OnlySelfBuffs", "Display only our buffs on unitframes")
	Window:CreateSwitch("All", "UnitFrames", "OnlySelfDebuffs", "Display only our debuffs on target")
	Window:CreateSwitch("All", "UnitFrames", "AurasBelow", "Move auras below unitframes")
	Window:CreateSwitch("All", "UnitFrames", "DesaturateDebuffs", "Desaturate debuffs that are not by me")
	Window:CreateSwitch("All", "UnitFrames", "FlashRemovableBuffs", "Flash enemy buffs that can be dispelled/purged/stealed")
	Window:CreateSwitch("All", "UnitFrames", "RemainingTime", "|cffFFFF99Enable remaining time for buffs/debuffs|r")
	Window:CreateSlider("All", "UnitFrames", "IconCountSize", "|cffFFFF99Set count font size|r", 6, 40, 1)
	Window:CreateSlider("All", "UnitFrames", "IconRemainingSize", "|cffFFFF99Set remaining time font size|r", 6, 40, 1)

	Window:CreateSection("All", "Castbar")
	Window:CreateColorSelection("All", "UnitFrames", "CastingColor", "Cast bar casting color")
	Window:CreateColorSelection("All", "UnitFrames", "ChannelingColor", "Cast bar channeling color")
	Window:CreateColorSelection("Retail", "UnitFrames", "NotInterruptibleColor", "Cast bar not interruptible color")
	Window:CreateSwitch("All", "UnitFrames", "CastBarLatency", "Display castbar latency")

	Window:CreateSection("All", "Role icon")
	Window:CreateDropdown("All", "UnitFrames", "Roles", "Set style for role icons used on all unitframes")

	Window:CreateSection("All", "Portrait")
	Window:CreateSwitch("All", "UnitFrames", "Portrait2D", "Use 2D Portrait")

end
GUI:AddWidgets(UnitFramesMore)

------------------------------------------------------------------------------------------	
-- UNIT CLASS OPTIONS	
------------------------------------------------------------------------------------------
local ClassOptions = function(self)
	
	if not (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then return end

	-- need to check all classes and specs for class powers
	
	local Window = self:CreateWindow("Unitfr. Class")
	Window:CreateSection("Retail", "Class bar(s)")
	Window:CreateSwitch("Retail", "UnitFrames", "ClassBar", "Enable class bar (example: holy power)")

	Window:CreateSection("All", "Settings Resources/Combo Bar")
	Window:CreateDropdown("All", "ClassOptions", "ClassResourcesOrientation", "|cffFFFF99Set orientation|r")
	Window:CreateSlider("All", "ClassOptions", "ClassPowerWidth", "|cffFFFF99Set width|r", 4, 40, 1)
	Window:CreateSlider("All", "ClassOptions", "ClassPowerHeight", "|cffFFFF99Set height|r", 4, 40, 1)
	Window:CreateSlider("All", "ClassOptions", "ClassPowerSpace", "|cffFFFF99Set spacing|r", 0, 20, 1)
	Window:CreateDropdown("All", "ClassOptions", "ClassPowerTexture", "|cffFFFF99Set texture|r", "Texture")

	Window:CreateSection("BCC", "Custom Mana / Energy Regen Ticker")
	Window:CreateSwitch("BCC", "UnitFrames", "PowerTick", "|cffFFFF99Enable Mana/Energy Ticker|r")
	Window:CreateSwitch("BCC", "ClassOptions", "MaxUITicker", "|cffFFFF99Enable Standalone Mana/Energy Ticker|r")
	Window:CreateSlider("BCC", "ClassOptions", "MaxUITickerLength", "|cffFFFF99Set Length for the custom Ticker|r", 30, 300, 1)
	Window:CreateDropdown("BCC", "ClassOptions", "OrientationTicker", " |cffFFFF99Orientation custom Ticker|r")

	Window:CreateSection("All", "Combat State")
	Window:CreateDropdown("All", "ClassOptions", "ClassResourcesCombatState", "|cffFFFF99Set combat state|r")

	Window:CreateSection("Retail", "|cffC41F3BDeathknight|r")
	Window:CreateSwitch("Retail", "ClassOptions", "Deathknight", "|cffC41F3BEnable runes for all specs|r")
	
	Window:CreateSection("Retail", "|cffA330C9Demonhunter|r")
	Window:CreateSwitch("Retail", "ClassOptions", "Demonhunter", "|cffA330C9No option available|r")
	
	Window:CreateSection("All", "|cffFF7D0ADruid|r")
	Window:CreateSwitch("All", "ClassOptions", "DruidAdditionalPower", "|cffFF7D0AEnable mana (additional powerbar) for Balance|r")
	Window:CreateSwitch("All", "ClassOptions", "Druid", "|cffFF7D0AEnable mana bar for Ferals (WIP)|r")
	Window:CreateSwitch("All", "UnitFrames", "ComboBar", "|cffFF7D0AEnable combo bar|r")
	
	Window:CreateSection("All", "|cffABD473Hunter|r")
	Window:CreateSwitch("All", "ClassOptions", "Hunter", "|cffABD473No option available|r")
	
	Window:CreateSection("All", "|cff69CCF0Mage|r")
	Window:CreateSwitch("BCC", "ClassOptions", "Mage", "|cff69CCF0No option available|r")
	Window:CreateSwitch("Retail", "ClassOptions", "Mage", "|cff69CCF0Enable arcane charges|r")

	Window:CreateSection("Retail", "|cff00FF96Monk|r")
	Window:CreateSwitch("Retail", "ClassOptions", "Monk", "|cff00FF96Enable harmony/chi|r")
	
	Window:CreateSection("All", "|cffF58CBAPaladin|r")
	Window:CreateSwitch("BCC", "ClassOptions", "Paladin", "|cffF58CBANo option available|r")
	Window:CreateSwitch("Retail", "ClassOptions", "Paladin", "|cffF58CBAEnable holy power charges|r")
	
	Window:CreateSection("All", "|cffFCFCFCPriest|r")
	Window:CreateSwitch("BCC", "ClassOptions", "PriestAdditionalPower", "|cffFCFCFCNo option available|r")
	Window:CreateSwitch("Retail", "ClassOptions", "PriestAdditionalPower", "|cffFCFCFCEnable mana (additional powerbar) for Shadow|r")
	Window:CreateSwitch("Retail", "ClassOptions", "PriestAtonement", "|cffFCFCFCEnable atonement for Discipline|r")
	
	Window:CreateSection("All", "|cffFFF569Rogue|r")
	Window:CreateSwitch("All", "UnitFrames", "ComboBar", "|cffFFF569Enable combo bar|r")
	
	Window:CreateSection("All", "|cff0070DEShaman|r")
	Window:CreateSwitch("All", "UnitFrames", "TotemBar", "|cff0070DEEnable totem bar|r")
	Window:CreateDropdown("All", "UnitFrames", "TotemBarStyle", "|cff0070DESet totems style|r")
	Window:CreateSwitch("All", "ClassOptions", "ShamanTotemBackdrop", "|cff0070DEEnable backdrop (totem bar)|r")
	Window:CreateSlider("All", "ClassOptions", "ShamanTotemSize", "|cff0070DESet totem size (totem bar) / width (status bars)|r", 0, 160, 1)
	Window:CreateSlider("All", "ClassOptions", "ShamanTotemSpace", "|cff0070DESet totem spacing (totem bar)|r", 0, 20, 1)
	Window:CreateSwitch("Retail", "ClassOptions", "ShamanAdditionalPower", "|cff0070DEEnable mana (additional powerbar) for Elemental|r")
	
	Window:CreateSection("All", "|cff9482C9Warlock|r")
	Window:CreateSwitch("BCC", "ClassOptions", "Warlock", "|cff9482C9No option available|r")
	Window:CreateSwitch("Retail", "ClassOptions", "Warlock", "|cff9482C9Enable soul shards|r")

	Window:CreateSection("All", "|cffC79C6EWarrior|r")
	Window:CreateSwitch("All", "ClassOptions", "Warrior", "|cffC79C6ENo option available|r")
end
GUI:AddWidgets(ClassOptions)

------------------------------------------------------------------------------------------
-- UF - SPECIFIC
------------------------------------------------------------------------------------------
-- PLAYER UNITFRAME
local Player = function(self)
	local Window = self:CreateWindow("Unitfr. Player")
	
	Window:CreateSection("All", "Enable")
	Window:CreateSwitch("All", "UF: Player", "Enable", "Enable PLAYER unitframe")

	if C["UF: Player"]["Enable"] == true then 

		Window:CreateSection("All", "Styling")
		if (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then
			Window:CreateSwitch("All", "UF: Player", "PercentageTags", "|cffFFFF99Enable percentages|r")
			Window:CreateSwitch("All", "UF: Player", "CombatLog", "|cffFFFF99Enable combat feedback|r")
		end

		if (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then
			Window:CreateSection("All", "Health")
			Window:CreateSlider("All", "UF: Player", "HealthHeight", "|cffFFFF99Set health height|r", 10, 80, 1)
			Window:CreateSlider("All", "UF: Player", "HealthWidth", "|cffFFFF99Set health width|r", 40, 400, 1)
			Window:CreateDropdown("All", "UnitFrames", "PlayerHealthTag", "|cffFFFF99Set health tag format|r")
			Window:CreateDropdown("All", "UF: Player", "HealthFont", "|cffFFFF99Set health font|r", "Font")
			Window:CreateSlider("All", "UF: Player", "HealthFontSize", "|cffFFFF99Set health font size|r", 6, 40, 1)
			Window:CreateDropdown("All", "UF: Player", "HealthTexture", "|cffFFFF99Set health texture|r", "Texture")
			
			Window:CreateSection("All", "Power")
			Window:CreateSlider("All", "UF: Player", "PowerHeight", "|cffFFFF99Set power height|r", 2, 20, 1)
			Window:CreateSlider("All", "UF: Player", "PowerWidth", "|cffFFFF99Set power width|r", 30, 300, 1)
			Window:CreateDropdown("All", "UF: Player", "PowerTag", "|cffFFFF99Set power tag format|r")
			Window:CreateDropdown("All", "UF: Player", "PowerFont", "|cffFFFF99Set power font|r", "Font")
			Window:CreateSlider("All", "UF: Player", "PowerFontSize", "|cffFFFF99Set power font size|r", 6, 40, 1)
			Window:CreateDropdown("All", "UF: Player", "PowerTexture", "|cffFFFF99Set power texture|r", "Texture")
			
			Window:CreateSection("All", "Name")
			Window:CreateDropdown("All", "UF: Player", "NameFont", "|cffFFFF99Set name font|r", "Font")
			Window:CreateSlider("All", "UF: Player", "NameFontSize", "|cffFFFF99Set name font size|r", 6, 40, 1)
			
			Window:CreateSection("All", "Castbar")
			Window:CreateSwitch("All", "UF: Player", "CastBar", "|cffFFFF99Enable castbar|r")
			Window:CreateSwitch("All", "UF: Player", "CastBarUnlink", "|cffFFFF99Unlink player castbar|r")
			Window:CreateSwitch("All", "UF: Player", "CastBarIcon", "|cffFFFF99Enable castbar icon|r")
			Window:CreateSwitch("All", "UF: Player", "CenteredHealer", "|cffFFFF99Enable healer layout centered castbar|r")
			Window:CreateSlider("All", "UF: Player", "CastHeight", "|cffFFFF99Set unlinked castbar height|r", 2, 20, 1)
			Window:CreateSlider("All", "UF: Player", "CastWidth", "|cffFFFF99Set unlinked castbar width|r", 40, 400, 1)
			Window:CreateDropdown("All", "UF: Player", "CastFont", "|cffFFFF99Set castbar font|r", "Font")
			Window:CreateSlider("All", "UF: Player", "CastFontSize", "|cffFFFF99Set castbar font size|r", 6, 40, 1)
			Window:CreateDropdown("All", "UF: Player", "CastTexture", "|cffFFFF99Set castbar texture|r", "Texture")

			Window:CreateSection("All", "Buffs")
			Window:CreateSwitch("All", "UnitFrames", "PlayerBuffs", "|cffFFFF99Enable buffs|r")
			Window:CreateSwitch("All", "UF: Player", "OnlySelfBuffs", "|cffFFFF99Enable only self created buffs|r")
			Window:CreateSlider("All", "UF: Player", "BuffSize", "|cffFFFF99Set buffs size|r", 10, 40, 1)
			Window:CreateSlider("All", "UF: Player", "BuffNumber", "|cffFFFF99Set number of buffs displayed|r", 1, 40, 1)
			Window:CreateSlider("All", "UF: Player", "BuffNumberRows", "|cffFFFF99Set amount of rows displayed|r", 1, 5, 1)
			Window:CreateSlider("All", "UF: Player", "BuffSpacing", "|cffFFFF99Set buffs spacing|r", 0, 20, 1)
			Window:CreateDropdown("All", "UF: Player", "BuffsPlayerCombatState", "|cffFFFF99Set combat state|r")

			Window:CreateSection("All", "Debuffs")
			Window:CreateSwitch("All", "UnitFrames", "PlayerDebuffs", "|cffFFFF99Enable debuffs|r")
			Window:CreateSlider("All", "UF: Player", "DebuffSize", "|cffFFFF99Set debuff size|r", 10, 60, 1)
			Window:CreateSlider("All", "UF: Player", "DebuffNumber", "|cffFFFF99Set number of debuffs displayed|r", 1, 40, 1)
			Window:CreateSlider("All", "UF: Player", "DebuffNumberRows", "|cffFFFF99Set amount of rows displayed|r", 1, 5, 1)
			Window:CreateSlider("All", "UF: Player", "DebuffSpacing", "|cffFFFF99Set debuffs spacing|r", 0, 20, 1)

			Window:CreateSection("All", "Aurabars")
			Window:CreateSwitch("All", "UnitFrames", "PlayerAuraBars", "|cffFFFF99Convert to aurabars|r")
			Window:CreateDropdown("All", "UF: Player", "AuraBarsGrowDirection", "|cffFFFF99Set aurabars grow direction|r")
			Window:CreateSlider("All", "UF: Player", "AuraBarsHeight", "|cffFFFF99Set aurabars height|r", 10, 80, 1)
			Window:CreateSlider("All", "UF: Player", "AuraBarsWidth", "|cffFFFF99Set aurabars width|r", 40, 400, 1)
			Window:CreateSlider("All", "UF: Player", "AuraBarsSpacing", "|cffFFFF99Set aurabars spacing|r", 2, 20, 1)
			
			Window:CreateSection("All", "Rested icon")
			Window:CreateSwitch("All", "UF: Player", "RestedIcon", "Enable rested icon")
			
			Window:CreateSection("Retail", "Role icon")
			Window:CreateSwitch("Retail", "UF: Player", "RoleIcon", "|cffFFFF99Enable role icon|r")
			Window:CreateSlider("Retail", "UF: Player", "RoleIconSize", "|cffFFFF99Set role icon size|r", 2, 64, 1)

			Window:CreateSection("All", "Raid icon")
			Window:CreateSwitch("All", "UF: Player", "RaidIcon", "|cffFFFF99Enable raid marker|r")
			Window:CreateSlider("All", "UF: Player", "RaidIconSize", "|cffFFFF99Set raid marker size|r", 2, 64, 1)
		
			Window:CreateSection("All", "Combat icon")
			Window:CreateSwitch("All", "UF: Player", "CombatIcon", "|cffFFFF99Enable combat icon|r")
			Window:CreateSlider("All", "UF: Player", "CombatIconSize", "|cffFFFF99Set combat icon size|r", 2, 64, 1)
			Window:CreateColorSelection("All", "UF: Player", "CombatIconColor", "|cffFFFF99Set combat icon color|r")

			Window:CreateSection("All", "Leader icon")
			Window:CreateSwitch("All", "UF: Player", "LeaderIcon", "|cffFFFF99Enable leader icon|r")
			Window:CreateSlider("All", "UF: Player", "LeaderIconSize", "|cffFFFF99Set leader icon size|r", 2, 64, 1)

			Window:CreateSection("All", "Master looter icon")
			Window:CreateSwitch("All", "UF: Player", "MasterLooterIcon", "|cffFFFF99Enable master looter icon|r")
			Window:CreateSlider("All", "UF: Player", "MasterLooterIconSize", "|cffFFFF99Set master looter icon size|r", 2, 64, 1)

			Window:CreateSection("All", "PVP status icon")
			Window:CreateSwitch("All", "UF: Player", "PVPIcon", "|cffFFFF99Enable combat icon|r")
			Window:CreateSlider("All", "UF: Player", "PVPIconSize", "|cffFFFF99Set pvp icon size|r", 2, 64, 1)
		end
		
		Window:CreateSection("All", "Portrait")
		Window:CreateDropdown("All", "UF: Player", "PortraitStyle", "Set portrait style")
		Window:CreateSlider("All", "UF: Player", "PortraitOverlayAlpha", "Set portrait alpha", 0, 1, 0.1)
		
		Window:CreateSection("All", "Combat state")
		Window:CreateSwitch("All", "UF: Player", "NonCombatAlphaEnable", "Enable alpha settings for non-combat")
		Window:CreateSlider("All", "UF: Player", "NonCombatAlpha", "Set out of combat alpha", 0, 1, 0.1)
	end
end
GUI:AddWidgets(Player)

-- TARGET UNITFRAME
local Target = function(self)
	local Window = self:CreateWindow("Unitfr. Target")

	Window:CreateSection("All", "Enable")
	Window:CreateSwitch("All", "UF: Target", "Enable", "Enable TARGET unitframe")

	if C["UF: Target"]["Enable"] == true then 

		Window:CreateSection("All", "Color")
		Window:CreateSwitch("All", "UF: Target", "ColorThreat", "Enable threat colored health")
		Window:CreateSwitch("All", "UF: Target", "ColorGradient", "|cffFFFFFFEnable gradient colored health|r")

		if (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then
			Window:CreateSection("All", "Styling")
			Window:CreateSwitch("All", "UF: Target", "PercentageTags", "|cffFFFF99Enable percentages|r")
			Window:CreateSwitch("All", "UF: Target", "CombatLog", "|cffFFFF99Enable combat feedback|r")
			--Window:CreateSwitch("All", "UnitFrames", "TargetEnemyHostileColor", "|cffFFFF99Color health according to hostility|r")

			Window:CreateSection("All", "Health")
			Window:CreateSlider("All", "UF: Target", "HealthHeight", "|cffFFFF99Set health height|r", 10, 80, 1)
			Window:CreateSlider("All", "UF: Target", "HealthWidth", "|cffFFFF99Set health width|r", 40, 400, 1)
			Window:CreateDropdown("All", "UnitFrames", "TargetHealthTag", "|cffFFFF99Set health tag format|r")
			Window:CreateDropdown("All", "UF: Target", "HealthFont", "|cffFFFF99Set health font|r", "Font")
			Window:CreateSlider("All", "UF: Target", "HealthFontSize", "|cffFFFF99Set health font size|r", 6, 40, 1)
			Window:CreateDropdown("All", "UF: Target", "HealthTexture", "|cffFFFF99Set health texture|r", "Texture")
			
			Window:CreateSection("All", "Power")
			Window:CreateSlider("All", "UF: Target", "PowerHeight", "|cffFFFF99Set power height|r", 2, 20, 1)
			Window:CreateSlider("All", "UF: Target", "PowerWidth", "|cffFFFF99Set power width|r", 30, 300, 1)
			Window:CreateDropdown("All", "UF: Target", "PowerTag", "|cffFFFF99Set power tag format|r")
			Window:CreateDropdown("All", "UF: Target", "PowerFont", "|cffFFFF99Set power font|r", "Font")
			Window:CreateSlider("All", "UF: Target", "PowerFontSize", "|cffFFFF99Set power font size|r", 6, 40, 1)
			Window:CreateDropdown("All", "UF: Target", "PowerTexture", "|cffFFFF99Set power texture|r", "Texture")
			
			Window:CreateSection("All", "Name")
			Window:CreateDropdown("All", "UF: Target", "NameTag", "|cffFFFF99Set name tag format|r")
			Window:CreateDropdown("All", "UF: Target", "NameFont", "|cffFFFF99Set name font|r", "Font")
			Window:CreateSlider("All", "UF: Target", "NameFontSize", "|cffFFFF99Set name font size|r", 6, 40, 1)
			
			Window:CreateSection("All", "Castbar")
			Window:CreateSwitch("All", "UF: Target", "CastBar", "|cffFFFF99Enable castbar|r")
			Window:CreateSwitch("All", "UF: Target", "CastBarUnlink", "|cffFFFF99Unlink target castbar|r")
			Window:CreateSwitch("All", "UF: Target", "CastBarIcon", "|cffFFFF99Enable castbar icon|r")
			Window:CreateSlider("All", "UF: Target", "CastHeight", "|cffFFFF99Set unlinked castbar height|r", 2, 20, 1)
			Window:CreateSlider("All", "UF: Target", "CastWidth", "|cffFFFF99Set unlinked castbar width|r", 40, 400, 1)
			Window:CreateDropdown("All", "UF: Target", "CastFont", "|cffFFFF99Set castbar font|r", "Font")
			Window:CreateSlider("All", "UF: Target", "CastFontSize", "|cffFFFF99Set castbar font size|r", 6, 40, 1)
			Window:CreateDropdown("All", "UF: Target", "CastTexture", "|cffFFFF99Set castbar texture|r", "Texture")

			Window:CreateSection("All", "Buffs")
			Window:CreateSwitch("All", "UnitFrames", "TargetBuffs", "|cffFFFF99Enable buffs|r")
			Window:CreateSwitch("All", "UF: Target", "OnlySelfBuffs", "|cffFFFF99Enable only self created buffs|r")
			Window:CreateSlider("All", "UF: Target", "BuffSize", "|cffFFFF99Set buffs size|r", 10, 40, 1)
			Window:CreateSlider("All", "UF: Target", "BuffNumber", "|cffFFFF99Set number of buffs displayed|r", 1, 40, 1)
			Window:CreateSlider("All", "UF: Target", "BuffNumberRows", "|cffFFFF99Set amount of rows displayed|r", 1, 5, 1)
			Window:CreateSlider("All", "UF: Target", "BuffSpacing", "|cffFFFF99Set buffs spacing|r", 0, 20, 1)
			Window:CreateDropdown("All", "UF: Target", "BuffsTargetCombatState", "|cffFFFF99Set combat state|r")

			Window:CreateSection("All", "Debuffs")
			Window:CreateSwitch("All", "UnitFrames", "TargetDebuffs", "|cffFFFF99Enable debuffs|r")
			Window:CreateSwitch("All", "UF: Target", "OnlySelfDebuffs", "|cffFFFF99Enable only self created debuffs|r")
			Window:CreateSlider("All", "UF: Target", "DebuffSize", "|cffFFFF99Set debuffs size|r", 10, 60, 1)
			Window:CreateSlider("All", "UF: Target", "DebuffNumber", "|cffFFFF99Set number of debuffs displayed|r", 1, 40, 1)
			Window:CreateSlider("All", "UF: Target", "DebuffNumberRows", "|cffFFFF99Set amount of rows displayed|r", 1, 5, 1)
			Window:CreateSlider("All", "UF: Target", "DebuffSpacing", "|cffFFFF99Set debuffs spacing|r", 0, 20, 1)
			
			Window:CreateSection("Retail", "Role icon")
			Window:CreateSwitch("Retail", "UF: Target", "RoleIcon", "|cffFFFF99Enable role icon|r")
			Window:CreateSlider("Retail", "UF: Target", "RoleIconSize", "|cffFFFF99Set role icon size|r", 2, 64, 1)

			Window:CreateSection("All", "Raid icon")
			Window:CreateSwitch("All", "UF: Target", "RaidIcon", "|cffFFFF99Enable raid marker|r")
			Window:CreateSlider("All", "UF: Target", "RaidIconSize", "|cffFFFF99Set raid marker size|r", 2, 64, 1)
		end
		
		Window:CreateSection("All", "Portrait")
		Window:CreateDropdown("All", "UF: Target", "PortraitStyle", "Set portrait style")
		Window:CreateSlider("All", "UF: Target", "PortraitOverlayAlpha", "Set portrait alpha", 0, 1, 0.1)
		
		Window:CreateSection("All", "Combat state")
		Window:CreateSwitch("All", "UF: Target", "NonCombatAlphaEnable", "Enable alpha settings for non-combat")
		Window:CreateSlider("All", "UF: Target", "NonCombatAlpha", "Set out of combat alpha", 0, 1, 0.1)
	end
end
GUI:AddWidgets(Target)

-- PET UNITFRAME
local Pet = function(self)
	local Window = self:CreateWindow("Unitfr. Pet")
	
	Window:CreateSection("All", "Enable")
	Window:CreateSwitch("All", "UF: Pet", "Enable", "Enable PET unitframe")
	
	Window:CreateSection("All", "Styling")
	
	Window:CreateSwitch("All", "UnitFrames", "PetAuras", "Enable pet auras")
	if C["UF: Pet"]["Enable"] == true then 

		if (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then
			Window:CreateSwitch("All", "UF: Pet", "PercentageTags", "|cffFFFF99Enable percentages|r")
		
			Window:CreateSection("All", "Health")
			Window:CreateDropdown("All", "UF: Pet", "HealthTag", "|cffFFFF99Set health tag format|r")
			Window:CreateSlider("All", "UF: Pet", "HealthHeight", "|cffFFFF99Set health height|r", 10, 80, 1)
			Window:CreateSlider("All", "UF: Pet", "HealthWidth", "|cffFFFF99Set health width|r", 40, 400, 1)
			Window:CreateDropdown("All", "UF: Pet", "HealthFont", "|cffFFFF99Set health font|r", "Font")
			Window:CreateSlider("All", "UF: Pet", "HealthFontSize", "|cffFFFF99Set health font size|r", 6, 40, 1)
			Window:CreateDropdown("All", "UF: Pet", "HealthTexture", "|cffFFFF99Set health texture|r", "Texture")
			
			Window:CreateSection("All", "Power")
			Window:CreateDropdown("All", "UF: Pet", "PowerTag", "|cffFFFF99Set power tag format|r")
			Window:CreateSlider("All", "UF: Pet", "PowerHeight", "|cffFFFF99Set power height|r", 2, 20, 1)
			Window:CreateSlider("All", "UF: Pet", "PowerWidth", "|cffFFFF99Set power width|r", 30, 300, 1)
			Window:CreateDropdown("All", "UF: Pet", "PowerFont", "|cffFFFF99Set power font|r", "Font")
			Window:CreateSlider("All", "UF: Pet", "PowerFontSize", "|cffFFFF99Set power font size|r", 6, 40, 1)
			
			Window:CreateSection("All", "Name")
			Window:CreateDropdown("All", "UF: Pet", "NameFont", "|cffFFFF99Set name font|r", "Font")
			Window:CreateSlider("All", "UF: Pet", "NameFontSize", "|cffFFFF99Set name font size|r", 6, 40, 1)
			Window:CreateDropdown("All", "UF: Pet", "PowerTexture", "|cffFFFF99Set power texture|r", "Texture")
			
			Window:CreateSection("All", "Castbar")
			Window:CreateSwitch("All", "UF: Pet", "CastBar", "|cffFFFF99Enable castbar|r")
			Window:CreateSwitch("All", "UF: Pet", "CastBarUnlink", "|cffFFFF99Unlink castbar|r")
			Window:CreateSwitch("All", "UF: Pet", "CastBarText", "|cffFFFF99Enable castbar text|r")
			Window:CreateSlider("All", "UF: Pet", "CastHeight", "|cffFFFF99Set unlinked castbar height|r", 2, 20, 1)
			Window:CreateSlider("All", "UF: Pet", "CastWidth", "|cffFFFF99Set unlinked castbar width|r", 40, 400, 1)
			Window:CreateDropdown("All", "UF: Pet", "CastFont", "|cffFFFF99Set castbar font|r", "Font")
			Window:CreateSlider("All", "UF: Pet", "CastFontSize", "|cffFFFF99Set castbar font size|r", 6, 40, 1)
			Window:CreateDropdown("All", "UF: Pet", "CastTexture", "|cffFFFF99Set castbar texture|r", "Texture")

			Window:CreateSection("All", "Buffs")
			Window:CreateSwitch("All", "UF: Pet", "Buffs", "|cffFFFF99Enable buffs|r")
			Window:CreateSwitch("All", "UF: Pet", "OnlySelfBuffs", "|cffFFFF99Enable only self created buffs|r")
			Window:CreateSlider("All", "UF: Pet", "BuffSize", "|cffFFFF99Set buffs size|r", 10, 40, 1)
			Window:CreateSlider("All", "UF: Pet", "BuffNumber", "|cffFFFF99Set number of buffs displayed|r", 1, 40, 1)
			Window:CreateSlider("All", "UF: Pet", "BuffNumberRows", "|cffFFFF99Set amount of rows displayed|r", 1, 5, 1)
			Window:CreateSlider("All", "UF: Pet", "BuffSpacing", "|cffFFFF99Set buffs spacing|r", 0, 20, 1)
			Window:CreateDropdown("All", "UF: Pet", "BuffsPetCombatState", "|cffFFFF99Set combat state|r")

			Window:CreateSection("All", "Debuffs")
			Window:CreateSwitch("All", "UF: Pet", "Debuffs", "|cffFFFF99Enable debuffs|r")
			Window:CreateSlider("All", "UF: Pet", "DebuffSize", "|cffFFFF99Set debuffs Size|r", 10, 60, 1)
			Window:CreateSlider("All", "UF: Pet", "DebuffNumber", "|cffFFFF99Set number of debuffs displayed|r", 1, 40, 1)
			Window:CreateSlider("All", "UF: Pet", "DebuffNumberRows", "|cffFFFF99Set amount of rows displayed|r", 1, 5, 1)
			Window:CreateSlider("All", "UF: Pet", "DebuffSpacing", "|cffFFFF99Set debuffs spacing|r", 0, 20, 1)
		
			Window:CreateSection("All", "Raid icon")
			Window:CreateSwitch("All", "UF: Pet", "RoleIcon", "|cffFFFF99Enable a raid marker icon|r")
			Window:CreateSlider("All", "UF: Pet", "RaidIconSize", "|cffFFFF99Set raid marker size|r", 2, 64, 1)
	
		end

		Window:CreateSection("All", "Portrait")
		Window:CreateDropdown("All", "UF: Pet", "PortraitStyle", "Set portrait style")
		Window:CreateSlider("All", "UF: Pet", "PortraitOverlayAlpha", "Set portrait alpha", 0, 1, 0.1)

		Window:CreateSection("All", "Combat state")
		Window:CreateSwitch("All", "UF: Pet", "NonCombatAlphaEnable", "Enable alpha settings for non-combat")
		Window:CreateSlider("All", "UF: Pet", "NonCombatAlpha", "Set out of combat alpha", 0, 1, 0.1)
	end
end
GUI:AddWidgets(Pet)

-- TARGET OF TARGET UNITFRAME
local TargetOfTarget = function(self)
	local Window = self:CreateWindow("Unitfr. ToT")
	
	Window:CreateSection("All", "Enable")
	Window:CreateSwitch("All", "UF: ToT", "Enable", "Enable TARGET OF TARGET unitframe")
	
	Window:CreateSection("All", "Styling")
	Window:CreateSwitch("All", "UnitFrames", "TOTAuras", "Enable target of target auras")
	Window:CreateSwitch("All", "UF: ToT", "ColorThreat", "Enable threat colored health")
	
	if C["UF: ToT"]["Enable"] == true then 
		if (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then
			Window:CreateSwitch("All", "UF: ToT", "PercentageTags", "|cffFFFF99Enable percentages|r")
			
			Window:CreateSection("All", "Health")
			Window:CreateDropdown("All", "UF: ToT", "HealthTag", "|cffFFFF99Set health tag format|r")
			Window:CreateSlider("All", "UF: ToT", "HealthHeight", "|cffFFFF99Set health height|r", 10, 80, 1)
			Window:CreateSlider("All", "UF: ToT", "HealthWidth", "|cffFFFF99Set health width|r", 40, 400, 1)
			Window:CreateDropdown("All", "UF: ToT", "HealthFont", "|cffFFFF99Set health font|r", "Font")
			Window:CreateSlider("All", "UF: ToT", "HealthFontSize", "|cffFFFF99Set health font size|r", 6, 40, 1)
			Window:CreateDropdown("All", "UF: ToT", "HealthTexture", "|cffFFFF99Set health texture|r", "Texture")
			
			Window:CreateSection("All", "Power")
			Window:CreateDropdown("All", "UF: ToT", "PowerTag", "|cffFFFF99Set power tag format|r")
			Window:CreateSlider("All", "UF: ToT", "PowerHeight", "|cffFFFF99Set power height|r", 2, 20, 1)
			Window:CreateSlider("All", "UF: ToT", "PowerWidth", "|cffFFFF99Set power width|r", 30, 300, 1)
			Window:CreateDropdown("All", "UF: ToT", "PowerFont", "|cffFFFF99Set power font|r", "Font")
			Window:CreateSlider("All", "UF: ToT", "PowerFontSize", "|cffFFFF99Set power font size|r", 6, 40, 1)
			Window:CreateDropdown("All", "UF: ToT", "PowerTexture", "|cffFFFF99Set power texture|r", "Texture")
			
			Window:CreateSection("All", "Name")
			Window:CreateDropdown("All", "UF: ToT", "NameTag", "|cffFFFF99Set name tag format|r")
			Window:CreateDropdown("All", "UF: ToT", "NameFont", "|cffFFFF99Set name font|r", "Font")
			Window:CreateSlider("All", "UF: ToT", "NameFontSize", "|cffFFFF99Set name font size|r", 6, 40, 1)
			
			Window:CreateSection("All", "Castbar")

			Window:CreateSection("All", "Buffs")
			Window:CreateSwitch("All", "UF: ToT", "Buffs", "|cffFFFF99Enable buffs|r")
			Window:CreateSwitch("All", "UF: ToT", "OnlySelfBuffs", "|cffFFFF99Enable only self created buffs|r")
			Window:CreateSlider("All", "UF: ToT", "BuffSize", "|cffFFFF99Set buffs size|r", 10, 40, 1)
			Window:CreateSlider("All", "UF: ToT", "BuffNumber", "|cffFFFF99Set number of buffs displayed|r", 1, 40, 1)
			Window:CreateSlider("All", "UF: ToT", "BuffNumberRows", "|cffFFFF99Set amount of rows displayed|r", 1, 5, 1)
			Window:CreateSlider("All", "UF: ToT", "BuffSpacing", "|cffFFFF99Set buffs spacing|r", 0, 20, 1)
			Window:CreateDropdown("All", "UF: ToT", "BuffsToTCombatState", "|cffFFFF99Set combat state|r")

			Window:CreateSection("All", "Debuffs")
			Window:CreateSwitch("All", "UF: ToT", "Debuffs", "|cffFFFF99Enable debuffs|r")
			Window:CreateSwitch("All", "UF: ToT", "OnlySelfDebuffs", "|cffFFFF99Enable only self created debuffs|r")
			Window:CreateSlider("All", "UF: ToT", "DebuffSize", "|cffFFFF99Set debuffs size|r", 10, 60, 1)
			Window:CreateSlider("All", "UF: ToT", "DebuffNumber", "|cffFFFF99Set number of debuffs displayed|r", 1, 40, 1)
			Window:CreateSlider("All", "UF: ToT", "DebuffNumberRows", "|cffFFFF99Set amount of rows displayed|r", 1, 5, 1)
			Window:CreateSlider("All", "UF: ToT", "DebuffSpacing", "|cffFFFF99Set debuffs spacing|r", 0, 20, 1)

			Window:CreateSection("Retail", "Role icon")
			Window:CreateSwitch("Retail", "UF: ToT", "RoleIcon", "|cffFFFF99Enable role icon|r")
			Window:CreateSlider("Retail", "UF: ToT", "RoleIconSize", "|cffFFFF99Set role icon size|r", 2, 64, 1)
			
			Window:CreateSection("All", "Raid icon")
			Window:CreateSwitch("All", "UF: ToT", "RoleIcon", "|cffFFFF99Enable a raid marker icon|r")
			Window:CreateSlider("All", "UF: ToT", "RaidIconSize", "|cffFFFF99Set raid marker size|r", 2, 64, 1)
		end	

		Window:CreateSection("All", "Portrait")
		Window:CreateDropdown("All", "UF: ToT", "PortraitStyle", "Set portrait style")
		Window:CreateSlider("All", "UF: ToT", "PortraitOverlayAlpha", "Set portrait alpha", 0, 1, 0.1)

		Window:CreateSection("All", "Combat state")
		Window:CreateSwitch("All", "UF: ToT", "NonCombatAlphaEnable", "Enable alpha settings for non-combat")
		Window:CreateSlider("All", "UF: ToT", "NonCombatAlpha", "Set out of combat alpha", 0, 1, 0.1)
	end
end
GUI:AddWidgets(TargetOfTarget)

-- FOCUS UNITFRAME
local Focus = function(self)
	local Window = self:CreateWindow("Unitfr. Focus")
	
	Window:CreateSection("All", "Enable")
	Window:CreateSwitch("All", "UF: Focus", "Enable", "Enable FOCUS unitframe")
	Window:CreateSwitch("All", "UF: Focus", "EnableFT", "Enable FOCUS TARGET unitframe (All settings are mirrored)")
	
	if C["UF: Focus"]["Enable"] == true then 
		
		Window:CreateSection("All", "Color")
		Window:CreateSwitch("All", "UF: Focus", "ColorThreat", "Enable threat colored health")
		
		if (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then
			Window:CreateSection("All", "Styling")
			Window:CreateSwitch("All", "UF: Focus", "PercentageTags", "|cffFFFF99Enable percentages|r")
			
			Window:CreateSection("All", "Health")
			Window:CreateSlider("All", "UF: Focus", "HealthHeight", "|cffFFFF99Set health height|r", 10, 80, 1)
			Window:CreateSlider("All", "UF: Focus", "HealthWidth", "|cffFFFF99Set health width|r", 40, 400, 1)
			Window:CreateDropdown("All", "UnitFrames", "FocusHealthTag", "|cffFFFF99Set health tag format for Focus|r")
			Window:CreateDropdown("All", "UnitFrames", "FocusTargetHealthTag", "|cffFFFF99Set health tag format for Focus target|r")
			Window:CreateDropdown("All", "UF: Focus", "HealthFont", "|cffFFFF99Set health font|r", "Font")
			Window:CreateSlider("All", "UF: Focus", "HealthFontSize", "|cffFFFF99Set health font size|r", 6, 40, 1)
			Window:CreateDropdown("All", "UF: Focus", "HealthTexture", "|cffFFFF99Set health texture|r", "Texture")
			
			Window:CreateSection("All", "Power")
			Window:CreateSlider("All", "UF: Focus", "PowerHeight", "|cffFFFF99Set power height|r", 2, 20, 1)
			Window:CreateSlider("All", "UF: Focus", "PowerWidth", "|cffFFFF99Set power wWidth|r", 30, 300, 1)
			Window:CreateDropdown("All", "UF: Focus", "PowerTag", "|cffFFFF99Set power tag format|r")
			Window:CreateDropdown("All", "UF: Focus", "PowerFont", "|cffFFFF99Set power font|r", "Font")
			Window:CreateSlider("All", "UF: Focus", "PowerFontSize", "|cffFFFF99Set power font size|r", 6, 40, 1)
			Window:CreateDropdown("All", "UF: Focus", "PowerTexture", "|cffFFFF99Set power texture|r", "Texture")
			
			Window:CreateSection("All", "Name")
			Window:CreateDropdown("All", "UF: Focus", "FocusNameTag", "|cffFFFF99Set name tag format for Focus|r")
			Window:CreateDropdown("All", "UF: Focus", "FocusTargetNameTag", "|cffFFFF99Set name tag format for Focus target|r")
			Window:CreateDropdown("All", "UF: Focus", "NameFont", "|cffFFFF99Set name font|r", "Font")
			Window:CreateSlider("All", "UF: Focus", "NameFontSize", "|cffFFFF99Set name font size|r", 6, 40, 1)
			
			Window:CreateSection("All", "Castbar")
			Window:CreateSwitch("All", "UF: Focus", "CastBar", "|cffFFFF99Enable castbar|r")
			Window:CreateSwitch("All", "UF: Focus", "CastIcon", "|cffFFFF99Enable castbar icon|r")
			Window:CreateDropdown("All", "UF: Focus", "CastFont", "|cffFFFF99Set castbar font|r", "Font")
			Window:CreateSlider("All", "UF: Focus", "CastFontSize", "|cffFFFF99Set castbar font size|r", 6, 40, 1)
			Window:CreateDropdown("All", "UF: Focus", "CastTexture", "|cffFFFF99Set castbar texture|r", "Texture")

			Window:CreateSection("All", "Buffs")
			Window:CreateSwitch("All", "UF: Focus", "Buffs", "|cffFFFF99Enable buffs|r")

			Window:CreateSection("All", "Debuffs")
			Window:CreateSwitch("All", "UF: Focus", "Debuffs", "|cffFFFF99Enable debuffs|r")

			Window:CreateSection("Retail", "Role icon")
			Window:CreateSwitch("Retail", "UF: Focus", "RoleIcon", "|cffFFFF99Enable role icon|r")
			Window:CreateSlider("Retail", "UF: Focus", "RoleIconSize", "|cffFFFF99Set role icon size|r", 2, 64, 1)
			
			Window:CreateSection("All", "Raid icon")
			Window:CreateSwitch("All", "UF: Focus", "RaidIcon", "|cffFFFF99Enable raid marker|r")
			Window:CreateSlider("All", "UF: Focus", "RaidIconSize", "|cffFFFF99Set raid marker size|r", 2, 64, 1)
		end	

		Window:CreateSection("All", "Portrait")
		Window:CreateDropdown("All", "UF: Focus", "PortraitStyle", "Set portrait style")
		Window:CreateSlider("All", "UF: Focus", "PortraitOverlayAlpha", "Set portrait alpha", 0, 1, 0.1)

		Window:CreateSection("All", "Combat state")
		Window:CreateSwitch("All", "UF: Focus", "NonCombatAlphaEnable", "Enable alpha settings for non-combat")
		Window:CreateSlider("All", "UF: Focus", "NonCombatAlpha", "Set out of combat alpha", 0, 1, 0.1)
	end
end
GUI:AddWidgets(Focus)

-- BOSS UNITFRAME
local Boss = function(self)
	local Window = self:CreateWindow("Unitfr. Boss")
	
	Window:CreateSection("All", "Enable")
	Window:CreateSwitch("All", "UnitFrames", "Boss", "Enable BOSS unitframe(s)")
	
	if C["UnitFrames"]["Boss"] == true then 

		Window:CreateSection("All", "Color")
		Window:CreateSwitch("All", "UF: Boss", "ColorThreat", "Enable threat colored health")

		if (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then
			Window:CreateSection("All", "Styling")
			Window:CreateSwitch("All", "UF: Boss", "PercentageTags", "|cffFFFF99Enable percentages|r")
			Window:CreateSlider("All", "UF: Boss", "Spacing", "|cffFFFF99Set spacing|r", 50, 300, 1)

			Window:CreateSection("All", "Health")
			Window:CreateSlider("All", "UF: Boss", "HealthHeight", "|cffFFFF99Set health height|r", 10, 80, 1)
			Window:CreateSlider("All", "UF: Boss", "HealthWidth", "|cffFFFF99Set health width|r", 40, 400, 1)
			Window:CreateDropdown("All", "UnitFrames", "BossHealthTag", "|cffFFFF99Set health tag format|r")
			Window:CreateDropdown("All", "UF: Boss", "HealthFont", "|cffFFFF99Set health font|r", "Font")
			Window:CreateSlider("All", "UF: Boss", "HealthFontSize", "|cffFFFF99Set health font size|r", 6, 40, 1)
			Window:CreateDropdown("All", "UF: Boss", "HealthTexture", "|cffFFFF99Set health texture|r", "Texture")
			
			Window:CreateSection("All", "Power")
			Window:CreateSlider("All", "UF: Boss", "PowerHeight", "|cffFFFF99Set power height|r", 2, 20, 1)
			Window:CreateSlider("All", "UF: Boss", "PowerWidth", "|cffFFFF99Set power width|r", 30, 300, 1)
			Window:CreateDropdown("All", "UF: Boss", "PowerTag", "|cffFFFF99Set power tag format|r")
			Window:CreateDropdown("All", "UF: Boss", "PowerFont", "|cffFFFF99Set power font|r", "Font")
			Window:CreateSlider("All", "UF: Boss", "PowerFontSize", "|cffFFFF99Set power font size|r", 6, 40, 1)
			Window:CreateDropdown("All", "UF: Boss", "PowerTexture", "|cffFFFF99Set power texture|r", "Texture")
			
			Window:CreateSection("All", "Name")
			Window:CreateDropdown("All", "UF: Boss", "NameTag", "|cffFFFF99Set name tag format|r")
			Window:CreateDropdown("All", "UF: Boss", "NameFont", "|cffFFFF99Set name font|r", "Font")
			Window:CreateSlider("All", "UF: Boss", "NameFontSize", "|cffFFFF99Set for name font size|r", 6, 40, 1)
			
			Window:CreateSection("All", "Castbar")
			Window:CreateSwitch("All", "UF: Boss", "CastBar", "|cffFFFF99Enable castbar|r")
			Window:CreateSwitch("All", "UF: Boss", "CastBarIcon", "|cffFFFF99Enable castbar icon|r")
			Window:CreateDropdown("All", "UF: Boss", "CastFont", "|cffFFFF99Set castbar font|r", "Font")
			Window:CreateSlider("All", "UF: Boss", "CastFontSize", "|cffFFFF99Set for castbar font size|r", 6, 40, 1)
			Window:CreateDropdown("All", "UF: Boss", "CastTexture", "|cffFFFF99Set castbar texture|r", "Texture")

			Window:CreateSection("All", "Buffs")
			Window:CreateSwitch("All", "UF: Boss", "Buffs", "|cffFFFF99Enable buffs|r")

			Window:CreateSection("All", "Debuffs")
			Window:CreateSwitch("All", "UF: Boss", "Debuffs", "|cffFFFF99Enable debuffs|r")
			
			Window:CreateSection("All", "Raid icon")
			Window:CreateSwitch("All", "UF: Boss", "RaidIcon", "|cffFFFF99Enable raid marker|r")
			Window:CreateSlider("All", "UF: Boss", "RaidIconSize", "|cffFFFF99Set raid marker size|r", 2, 64, 1)
		end	

		Window:CreateSection("All", "Portrait")
		Window:CreateDropdown("All", "UF: Boss", "PortraitStyle", "Set portrait style")
		Window:CreateSlider("All", "UF: Boss", "PortraitOverlayAlpha", "Set portrait alpha", 0, 1, 0.1)
	end
end
GUI:AddWidgets(Boss)

-- ARENA UNITFRAME
local Arena = function(self)
	local Window = self:CreateWindow("Unitfr. Arena")
	
	Window:CreateSection("All", "Enable")
	Window:CreateSwitch("All", "UnitFrames", "Arena", "Enable ARENA unitframe(s)")
	
	if C["UnitFrames"]["Arena"] == true then 

		Window:CreateSection("All", "Color")
		Window:CreateSwitch("All", "UF: Arena", "ColorThreat", "Enable threat colored health")

		if (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then
			Window:CreateSection("All", "Styling")
			Window:CreateSwitch("All", "UF: Arena", "PercentageTags", "|cffFFFF99Enable percentages|r")
			Window:CreateSwitch("All", "UF: Arena", "SpecIcon", "|cffFFFF99Enable spec icon|r")
			Window:CreateSwitch("All", "UF: Arena", "Trinket", "|cffFFFF99Enable trinket display|r")
			Window:CreateSlider("All", "UF: Arena", "Spacing", "|cffFFFF99Set spacing|r", 50, 300, 1)
			
			Window:CreateSection("All", "Health")
			Window:CreateSlider("All", "UF: Arena", "HealthHeight", "|cffFFFF99Set health height|r", 10, 80, 1)
			Window:CreateSlider("All", "UF: Arena", "HealthWidth", "|cffFFFF99Set health width|r", 40, 400, 1)
			Window:CreateDropdown("All", "UF: Arena", "HealthTag", "|cffFFFF99Set health tag format|r")
			Window:CreateDropdown("All", "UF: Arena", "HealthFont", "|cffFFFF99Set health font|r", "Font")
			Window:CreateSlider("All", "UF: Arena", "HealthFontSize", "|cffFFFF99Set health font size|r", 6, 40, 1)
			Window:CreateDropdown("All", "UF: Arena", "HealthTexture", "|cffFFFF99Set health texture|r", "Texture")
			
			Window:CreateSection("All", "Power")
			Window:CreateSlider("All", "UF: Arena", "PowerHeight", "|cffFFFF99Set power height|r", 2, 20, 1)
			Window:CreateSlider("All", "UF: Arena", "PowerWidth", "|cffFFFF99Set power width|r", 30, 300, 1)
			Window:CreateDropdown("All", "UF: Arena", "PowerTag", "|cffFFFF99Set power tag format|r")
			Window:CreateDropdown("All", "UF: Arena", "PowerFont", "|cffFFFF99Set power font|r", "Font")
			Window:CreateSlider("All", "UF: Arena", "PowerFontSize", "|cffFFFF99Set power font size|r", 6, 40, 1)
			Window:CreateDropdown("All", "UF: Arena", "PowerTexture", "|cffFFFF99Set power texture|r", "Texture")
			
			Window:CreateSection("All", "Name")
			Window:CreateDropdown("All", "UF: Arena", "NameFont", "|cffFFFF99Set name font|r", "Font")
			Window:CreateSlider("All", "UF: Arena", "NameFontSize", "|cffFFFF99Set name font size|r", 6, 40, 1)
			
			Window:CreateSection("All", "Castbar")
			Window:CreateSwitch("All", "UF: Arena", "CastBar", "|cffFFFF99Enable castbar|r")
			Window:CreateSwitch("All", "UF: Arena", "CastBarIcon", "|cffFFFF99Enable castbar icon|r")
			Window:CreateDropdown("All", "UF: Arena", "CastFont", "|cffFFFF99Set castbar font|r", "Font")
			Window:CreateSlider("All", "UF: Arena", "CastFontSize", "|cffFFFF99Set castbar font size|r", 6, 40, 1)
			Window:CreateDropdown("All", "UF: Arena", "CastTexture", "|cffFFFF99Set castbar texture|r", "Texture")

			Window:CreateSection("All", "Buffs")
			Window:CreateSwitch("All", "UF: Arena", "Buffs", "|cffFFFF99Enable buffs|r")

			Window:CreateSection("All", "Debuffs")
			Window:CreateSwitch("All", "UF: Arena", "Debuffs", "|cffFFFF99Enable debuffs|r")
			
			Window:CreateSection("All", "Raid icon")
			Window:CreateSwitch("All", "UF: Arena", "RaidIcon", "|cffFFFF99Enable raid marker|r")
			Window:CreateSlider("All", "UF: Arena", "RaidIconSize", "|cffFFFF99Set raid marker size|r", 2, 64, 1)
			
			Window:CreateSection("All", "Spec icon")

			Window:CreateSection("All", "Trinket icon")

		end	

		Window:CreateSection("All", "Portrait")
		Window:CreateDropdown("All", "UF: Arena", "PortraitStyle", "Set portrait style")
		Window:CreateSlider("All", "UF: Arena", "PortraitOverlayAlpha", "Set portrait alpha", 0, 1, 0.1)

		Window:CreateSection("All", "Combat state")
		Window:CreateSwitch("All", "UF: Arena", "NonCombatAlphaEnable", "Enable alpha settings for non-combat")
		Window:CreateSlider("All", "UF: Arena", "NonCombatAlpha", "Set out of combat alpha", 0, 1, 0.1)
	end
end
GUI:AddWidgets(Arena)