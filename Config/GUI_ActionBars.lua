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
	--Window:CreateSwitch("All", "ActionBars", "ShowBackdrop", "Show the actionbar backdrop")
	Window:CreateSlider("All", "ActionBars", "ABAlpha", "|cffFFFFFFSet actionbar button backdrop alpha|r", 0, 1, 0.05)
	Window:CreateSwitch("All", "ActionBars", "EquipBorder", "Highlight equipped item if they are on action bars")
	Window:CreateSwitch("Retail", "ActionBars", "AutoAddNewSpell", "Auto add new spell to actionbars")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Proc animation")
	Window:CreateSwitch("All", "ActionBars", "ProcAnim", "Enable our own spell flashing proc animation")
	Window:CreateDropdown("All", "ActionBars", "ProcAnim+", "Set the style for the custom proc animation")
	Window:CreateColorSelection("All", "ActionBars", "ProcAnimColor", "Set color for the custom proc animation")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Font")
	Window:CreateDropdown("All", "ActionBars", "Font", "Set actionbar font", "Font")
	Window:CreateSlider("All", "ActionBars", "ABFontSize", "|cffFFFFFFSet actionbar font size|r", 6, 32, 1)
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "Cooldowns")
	Window:CreateSwitch("All", "ActionBars", "CooldownFlash", "Enable off cooldown flash")
	Window:CreateSwitch("All", "ActionBars", "CoolDown", "Enable cooldown text")
	Window:CreateDropdown("All", "Cooldowns", "Font", "Set cooldown font", "Font")
	Window:CreateSlider("All", "ActionBars", "CoolDownFontSize", "|cffFFFFFFSet cooldown font size|r", 6, 32, 1)
	Window:CreateColorSelection("All", "ActionBars", "CoolDownColor", "Set font color for cooldown (Not working atm)")
	Window:CreateDropdown("All", "ActionBars", "CoolDownPosition", "Set position for cooldown")
	Window:CreateSlider("All", "ActionBars", "CoolDownOffsetH", "Set horizontal offset for cooldown", -20, 20, 1)
	Window:CreateSlider("All", "ActionBars", "CoolDownOffsetV", "Set vertical offset for cooldown", -20, 20, 1)
	Window:CreateDropdown("All", "ActionBars", "CoolDownJustifyH", "Set alignment for cooldown")
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