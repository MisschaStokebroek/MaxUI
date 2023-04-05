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
-- ACTIONBARS
------------------------------------------------------------------------------------------
local ActionBars = function(self)
	local Window = self:GetWindow("Actionbars")

end
GUI:AddWidgets(ActionBars)

local MaxUIActionBars = function(self)
	local Window = self:CreateWindow("Actionbars 1")

	Window:CreateWindowLogo("All", "|cffFFFF99Actionbars: General Settings|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Settings for actionbars in general.")
	Window:CreateSpacer("All", 7)

	Window:CreateSection("All", "Enable")
	Window:CreateSwitch("All", "ActionBars", "Enable", "Enable actionbar module")
	Window:CreateDropdown("All", "Layout", "LayoutCustomize", "Lock/unlock actionbars customization state")
	Window:CreateSwitch("WOTLK", "ActionBars", "MultiCastBar", "Display Blizzard MultiCast Totem Bar")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Styling")
	Window:CreateSwitch("All", "ActionBars", "ShowBackdrop", "Show the actionbar backdrop")
	Window:CreateSlider("All", "ActionBars", "ABAlpha", "|cffFFFFFFSet actionbar backdrop alpha|r", 0, 1, 0.1)
	Window:CreateSwitch("All", "ActionBars", "ProcAnim", "Enable our own spell flashing proc animation")
	Window:CreateSwitch("All", "ActionBars", "EquipBorder", "Highlight equipped item if they are on action bars")
	Window:CreateSwitch("Retail", "ActionBars", "AutoAddNewSpell", "Auto add new spell to actionbars")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Font")
	Window:CreateDropdown("All", "ActionBars", "Font", "Set actionbar font", "Font")
	Window:CreateSlider("All", "ActionBars", "ABFontSize", "|cffFFFFFFSet actionbar font size|r", 6, 32, 1)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Cooldowns")
	Window:CreateSwitch("All", "ActionBars", "CoolDown", "Enable cooldown text")
	Window:CreateDropdown("All", "Cooldowns", "Font", "Set cooldown font", "Font")
	Window:CreateSlider("All", "ActionBars", "CoolDownFontSize", "|cffFFFFFFSet cooldown font size|r", 6, 32, 1)
	Window:CreateColorSelection("All", "ActionBars", "CoolDownColor", "Set font color for cooldown (Not working atm)")
	Window:CreateDropdown("All", "ActionBars", "CoolDownPosition", "Set position for cooldown")
	Window:CreateSlider("All", "ActionBars", "CoolDownOffsetH", "Set horizontal offset for cooldown", -20, 20, 1)
	Window:CreateSlider("All", "ActionBars", "CoolDownOffsetV", "Set vertical offset for cooldown", -20, 20, 1)
	Window:CreateDropdown("All", "ActionBars", "CoolDownJustifyH", "Set alignment for cooldown")
	Window:CreateSpacerNoPos("All")
	Window:CreateSwitch("All", "ActionBars", "CooldownFlash", "Enable off cooldown flash")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Hotkeys")
	Window:CreateSwitch("All", "ActionBars", "HotKey", "Enable hotkey text")
	Window:CreateDropdown("All", "ActionBars", "HotKeyFont", "Set hotkey font", "Font")
	Window:CreateSlider("All", "ActionBars", "HotKeyFontSize", "|cffFFFFFFSet hotkey font size|r", 6, 32, 1)
	Window:CreateColorSelection("All", "ActionBars", "HotKeyColor", "Set font color for hotkey")
	Window:CreateDropdown("All", "ActionBars", "HotKeyPosition", "Set position for hotkey")
	Window:CreateSlider("All", "ActionBars", "HotKeyOffsetH", "Set horizontal offset for hotkey", -20, 20, 1)
	Window:CreateSlider("All", "ActionBars", "HotKeyOffsetV", "Set vertical offset for hotkey", -20, 20, 1)
	Window:CreateDropdown("All", "ActionBars", "HotKeyJustifyH", "Set alignment for hotkey")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Count")
	Window:CreateSwitch("All", "ActionBars", "Count", "Enable count text")
	Window:CreateDropdown("All", "ActionBars", "CountFont", "Set count font", "Font")
	Window:CreateSlider("All", "ActionBars", "CountFontSize", "|cffFFFFFFSet count font size|r", 6, 32, 1)
	Window:CreateColorSelection("All", "ActionBars", "CountColor", "Set font color for count")
	Window:CreateDropdown("All", "ActionBars", "CountPosition", "Set position for count")
	Window:CreateSlider("All", "ActionBars", "CountOffsetH", "Set horizontal offset for count", -20, 20, 1)
	Window:CreateSlider("All", "ActionBars", "CountOffsetV", "Set vertical offset for count", -20, 20, 1)
	Window:CreateDropdown("All", "ActionBars", "CountJustifyH", "Set alignment for count")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Macro")
	Window:CreateSwitch("All", "ActionBars", "Macro", "Enable macro text")
	Window:CreateDropdown("All", "ActionBars", "MacroFont", "Set macro font", "Font")
	Window:CreateSlider("All", "ActionBars", "MacroFontSize", "|cffFFFFFFSet macro font size|r", 6, 32, 1)
	Window:CreateColorSelection("All", "ActionBars", "MacroColor", "Set font color for macro")
	Window:CreateDropdown("All", "ActionBars", "MacroPosition", "Set position for macro")
	Window:CreateSlider("All", "ActionBars", "MacroOffsetH", "Set horizontal offset for macro", -20, 20, 1)
	Window:CreateSlider("All", "ActionBars", "MacroOffsetV", "Set vertical offset for macro", -20, 20, 1)
	Window:CreateDropdown("All", "ActionBars", "MacroJustifyH", "Set alignment for macro")
	Window:CreateSpacerNoPos("All")
end
GUI:AddWidgets(MaxUIActionBars)

local MaxUIActionBarsSpecific = function(self)
	local Window = self:CreateWindow("Actionbars 2")

	Window:CreateWindowLogo("All", "|cffFFFF99Actionbars: bars and buttons|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Settings for each individual actionbar & special bars.")
	Window:CreateSpacer("All", 7)

	Window:CreateSection("All", "General")
	Window:CreateSlider("All", "ActionBars", "ButtonSpacing", "Set button spacing", 0, 8, 1)
	Window:CreateSpacerNoPos("All")

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
	Window:CreateSpacerNoPos("All")

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
	Window:CreateSpacerNoPos("All")
	
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
	Window:CreateSpacerNoPos("All")
	
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
	Window:CreateSpacerNoPos("All")
	
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
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Actionbar 6")
	Window:CreateSwitch("All", "ActionBars", "Bar6", "Enable actionbar 6")
	Window:CreateSlider("All", "ActionBars", "Bar6ButtonsPerRow", "Set number of buttons per row", 1, 12, 1)
	Window:CreateSlider("All", "ActionBars", "Bar6NumButtons", "Set number of buttons shown", 1, 12, 1)
	Window:CreateSlider("All", "ActionBars", "ActionBar6ButtonSize", "|cffFFFFFFSet button size|r", 12, 60, 1)
	Window:CreateDropdown("All", "ActionBars", "Actionbar6", "Set visibility")
	Window:CreateSlider("All", "ActionBars", "ActionBar6Alpha", "Set mouseover transparency", 0, 1, 0.1)
	Window:CreateDropdown("All", "ActionBars", "ActionBar6CombatState", "Set combat state")
	Window:CreateDropdown("All", "ActionBars", "ActionBar6Edges", "Set edges")
	Window:CreateSwitch("All", "ActionBars", "ActionBar6Backdrop", "Enable backdrop")
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Actionbar 7")
	Window:CreateSwitch("All", "ActionBars", "Bar7", "Enable actionbar 7")
	Window:CreateSlider("All", "ActionBars", "Bar7ButtonsPerRow", "Set number of buttons per row", 1, 12, 1)
	Window:CreateSlider("All", "ActionBars", "Bar7NumButtons", "Set number of buttons shown", 1, 12, 1)
	Window:CreateSlider("All", "ActionBars", "ActionBar7ButtonSize", "|cffFFFFFFSet button size|r", 12, 60, 1)
	Window:CreateDropdown("All", "ActionBars", "Actionbar7", "Set visibility")
	Window:CreateSlider("All", "ActionBars", "ActionBar7Alpha", "Set mouseover transparency", 0, 1, 0.1)
	Window:CreateDropdown("All", "ActionBars", "ActionBar7CombatState", "Set combat state")
	Window:CreateDropdown("All", "ActionBars", "ActionBar7Edges", "Set edges")
	Window:CreateSwitch("All", "ActionBars", "ActionBar7Backdrop", "Enable backdrop")
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Actionbar 8")
	Window:CreateSwitch("All", "ActionBars", "Bar8", "Enable actionbar 8")
	Window:CreateSlider("All", "ActionBars", "Bar8ButtonsPerRow", "Set number of buttons per row", 1, 12, 1)
	Window:CreateSlider("All", "ActionBars", "Bar8NumButtons", "Set number of buttons shown", 1, 12, 1)
	Window:CreateSlider("All", "ActionBars", "ActionBar8ButtonSize", "|cffFFFFFFSet button size|r", 12, 60, 1)
	Window:CreateDropdown("All", "ActionBars", "Actionbar8", "Set visibility")
	Window:CreateSlider("All", "ActionBars", "ActionBar8Alpha", "Set mouseover transparency", 0, 1, 0.1)
	Window:CreateDropdown("All", "ActionBars", "ActionBar8CombatState", "Set combat state")
	Window:CreateDropdown("All", "ActionBars", "ActionBar8Edges", "Set edges")
	Window:CreateSwitch("All", "ActionBars", "ActionBar8Backdrop", "Enable backdrop")
	Window:CreateSpacerNoPos("All")
end
GUI:AddWidgets(MaxUIActionBarsSpecific)

local MaxUIActionBarsSpecial = function(self)
	local Window = self:CreateWindow("Actionbars 3")

	Window:CreateWindowLogo("All", "|cffFFFF99Actionbars: Special bars|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Settings for special actionbars like the petbar and stancebar.")
	Window:CreateSpacer("All", 7)

	Window:CreateSection("All", "General")
	Window:CreateSlider("All", "ActionBars", "ButtonSpacing", "Set button spacing", 0, 8, 1)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Pet Bar")
	Window:CreateSwitch("All", "ActionBars", "Pet", "Enable pet bar")
	Window:CreateSlider("All", "ActionBars", "BarPetButtonsPerRow", "Set number of buttons per row", 1, 10, 1)
	--Window:CreateSlider("All", "ActionBars", "PetButtonSize", "|cffFFFFFFSet button size|r", 12, 60, 1)
	Window:CreateSlider("All", "ActionBars", "PetButtonSize", "|cffFFFFFFSet button size|r", 30, 60, 1)
	Window:CreateDropdown("All", "ActionBars", "Petbar", "Set visibility")
	Window:CreateSlider("All", "ActionBars", "PetBarAlpha", "Set mouseover transparency", 0, 1, 0.1)
	Window:CreateDropdown("All", "ActionBars", "ActionBarPetCombatState", "Set combat state")
	Window:CreateDropdown("All", "ActionBars", "ActionBarPetEdges", "Set edges")
	Window:CreateSwitch("All", "ActionBars", "PetBarBackdrop", "Enable backdrop")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Stance bar")
	Window:CreateSwitch("All", "ActionBars", "ShapeShift", "Enable shapeshift / stancs bar")
	Window:CreateDropdown("All", "ActionBars", "StancebarLayout", "Set layout")
	Window:CreateSlider("All", "ActionBars", "StanceBarButtonSize", "|cffFFFFFFSet button size|r", 12, 60, 1)
	Window:CreateDropdown("All", "ActionBars", "Stancebar", "Set visibility")
	Window:CreateSlider("All", "ActionBars", "StanceBarAlpha", "Set mouseover transparency", 0, 1, 0.1)
	Window:CreateDropdown("All", "ActionBars", "ActionBarStanceCombatState", "Set combat state")
	Window:CreateDropdown("All", "ActionBars", "ActionBarStanceEdges", "Set edges")
	Window:CreateSwitch("All", "ActionBars", "StanceBarBackdrop", "Enable backdrop")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Extra / Zone bar (To be done, not working)")
	Window:CreateSwitch("All", "ActionBars", "ExtraBarEnable", "Enable Extra / zone bar")
	--Window:CreateDropdown("All", "ActionBars", "ExtrabarLayout", "Set layout")
	Window:CreateSlider("All", "ActionBars", "ExtraBarButtonSize", "|cffFFFFFFSet button size|r", 12, 60, 1)
	Window:CreateDropdown("All", "ActionBars", "Extrabar", "Set visibility")
	Window:CreateSlider("All", "ActionBars", "ExtraBarAlpha", "Set mouseover transparency", 0, 1, 0.1)
	Window:CreateDropdown("All", "ActionBars", "ActionBarExtraCombatState", "Set combat state")
	Window:CreateDropdown("All", "ActionBars", "ActionBarExtraEdges", "Set edges")
	Window:CreateSwitch("All", "ActionBars", "ExtraBarBackdrop", "Enable backdrop")
	Window:CreateSpacerNoPos("All")
	
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
GUI:AddWidgets(MaxUIActionBarsSpecial)

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
		Window:CreateSpacer("All", 12)
		Window:CreateSpacer("All", 20)
		Window:CreateSpacer("All", 23)
	end

	Window:CreateSection("All", "Styling")
	Window:CreateSlider("All", "Bags", "BagsAlpha", "|cffFFFF99Set bags backdrop alpha|r", 0, 1, 0.1)
	Window:CreateSpacerNoPos("All")
	
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
-- GENERAL
------------------------------------------------------------------------------------------
local General = function(self)
	local Window = self:GetWindow("General")
	
	Window:CreateWindowLogo("All", "|cffFFFF99General options|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "General UI options for color, fonts and more.")
	Window:CreateExplanationText("All", 7, "The global font only sets fonts for texts that aren't adjustable in other sections.")
	Window:CreateExplanationText("All", 8, "It will change the fonts for the GUI, the tooltip descriptions,")
	Window:CreateExplanationText("All", 9, "several blizzard frames and more.")
	Window:CreateSpacer("All", 10)
	
	if (Locale ~= "koKR" or Locale ~= "zhTW" or Locale ~= "zhCN") then
		Window:CreateSpacer("All", 13)
		Window:CreateSpacer("All", 16)
		Window:CreateSpacer("All", 19)
		Window:CreateSpacer("All", 25)
		Window:CreateSlider("All", "General", "FontSize", "Set global font size", 6, 32, 1)
		Window:CreateSpacerNoPos("All")
	else	
		Window:CreateSpacer("All", 13)
		Window:CreateSpacer("All", 16)
		Window:CreateSpacer("All", 19)
		Window:CreateSpacer("All", 25)
	end

	Window:CreateSection("All", "Fader Animation")
	Window:CreateSlider("All", "General", "FaderTime", "|cffFFFFFFSet fade duration for animated elements|r", 0, 2, 0.1)
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "MAXUI Frames")
	Window:CreateSlider("All", "General", "GeneralPanelAlpha", "|cffFFFF99Set line/panel transparency|r", 0, 1, 0.1)
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "MAXUI Edges & Borders")
	Window:CreateSlider("All", "General", "thickness", "|cffFFFF99Set line/panel thickness|r", 1, 40, 1)
	Window:CreateSlider("All", "General", "ABLineThickness", "|cffFFFF99Set actionbar edge thickness|r", 1, 40, 1)
	--Window:CreateSwitch("All", "General", "TopEdgeText", "Enable text on top edge/border")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "MAXUI Headers")
	Window:CreateSlider("All", "General", "HeaderHeight", "Set height for headers", 0, 100, 1)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "MAXUI Buttons")
	Window:CreateDropdown("All", "General", "ButtonStyle", "Set style for button icons")
	Window:CreateSwitch("All", "General", "IconDesaturate", "Enable desaturation of button icons")
	Window:CreateSlider("All", "General", "ButtonSize", "Set button size", 10, 40, 1)
	--Window:CreateDropdown("All", "General", "ButtonFont", "Set button font", "Font")
	Window:CreateSlider("All", "General", "ButtonFontSize", "|cffFFFFFFSet button font size|r", 6, 32, 1)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Texture")
	Window:CreateDropdown("All", "General", "HeaderTexture", "|cffFFFF99Set general header texture|r", "Texture")
	Window:CreateDropdown("All", "General", "LineTexture", "|cffFFFF99Set general line/panel texture|r", "Texture")
	Window:CreateDropdown("All", "General", "TextureButton", "|cffFFFF99Set general button texture|r", "Texture")
	Window:CreateDropdown("All", "General", "StatusBarTexture", "|cffFFFF99Set general statusbar texture|r", "Texture")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Colors")
	Window:CreateDropdown("All", "General", "ClassColorHeaders", "|cffFFFF99Set header color|r")
	Window:CreateDropdown("All", "General", "ButtonColor", "|cffFFFF99Set button color|r")
	Window:CreateDropdown("All", "General", "ClassColorLines", "|cffFFFF99Set line/panel color|r")
	Window:CreateDropdown("All", "General", "ClassColorActionBarLines", "|cffFFFF99Set actionbar edge color|r")
	Window:CreateDropdown("All", "General", "ClassShadow", "|cffFFFF99Set shadow color|r")
	Window:CreateSwitch("All", "General", "ClassShadowExcludeUF", "|cffFFFF99Exclude unitframes from shadow color|r")
	Window:CreateColorSelection("All", "General", "CustomColor", "|cffFFFF99Set custom color|r")
	Window:CreateSpacerNoPos("All")
end
GUI:AddWidgets(General)

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
	Window:CreateSpacer("All", 11 +1)
	Window:CreateSpacer("All", 14 +1)
	Window:CreateSpacer("All", 17 +1)
	Window:CreateSpacer("All", 20 +1)
	Window:CreateSpacer("All", 23 +1)
	Window:CreateSpacer("All", 27 +1)
	Window:CreateSpacer("All", 31 +1)
	Window:CreateSpacer("All", 34 +1)

	--[[ should be
	Window:CreateSpacer("All", 11)
	Window:CreateSpacer("All", 14)
	Window:CreateSpacer("All", 17)
	Window:CreateSpacer("All", 20)
	Window:CreateSpacer("All", 23)
	Window:CreateSpacer("All", 27)
	Window:CreateSpacer("All", 31)
	Window:CreateSpacer("All", 34)
	]]
end

	Window:CreateSection("All", "UI Error Frame Extended")
	Window:CreateSwitch("All", "Misc", "ErrorSpeechEnable", "Enable error speech frame")
	Window:CreateDropdown("All", "Misc", "ErrorSpeechCombatState", "Set combat state for error speech frame")
	Window:CreateSpacerNoPos("All")
end
GUI:AddWidgets(Misc)

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
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "Combat State")
	Window:CreateDropdown("All", "Quests", "QuestTrackerCombatState", "Set combat state for tracker")
end
GUI:AddWidgets(Quests)

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
	UnitFramesWarning:EnableMouse(false)

	UnitFramesWarning.Text = UnitFramesWarning:CreateFontString(nil, "OVERLAY")
	UnitFramesWarning.Text:SetFont(C.Medias.Font, 14)
	UnitFramesWarning.Text:SetPoint("CENTER", UnitFramesWarning, "CENTER", 0, 0)
	UnitFramesWarning.Text:SetTextColor(1, 1, 1)
	UnitFramesWarning.Text:SetShadowColor(0, 0, 0)
	UnitFramesWarning.Text:SetShadowOffset(1, -1)
	UnitFramesWarning.Text:SetText("These settings have been disabled.\nAll settings are reorganized or replaced \nby settings in their respective unitframe sections.")	

	UnitFramesWarning.Logomaxui = UnitFramesWarning:CreateTexture(nil, "ARTWORK")
	UnitFramesWarning.Logomaxui:SetWidth(Window:GetWidth()-4)
	UnitFramesWarning.Logomaxui:SetHeight((Window:GetWidth()-4)/2)
	UnitFramesWarning.Logomaxui:SetPoint("TOP", UnitFramesWarning, "TOP", 0, -4)
	UnitFramesWarning.Logomaxui:SetTexture(T.GetTexture("zMaxUI"))
end
GUI:AddWidgets(UnitFrames)

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
		Window:CreateDropdown("All", "UF: Player", "NameFont", "|cffFFFF99Set name font|r", "Font")
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