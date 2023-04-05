------------------------------------------------------------------------------------------
-- MaxUI 6.5 - SHADOWLANDS / TUKUI 20
-- latest update: 30-10-2022
------------------------------------------------------------------------------------------

-- setting up FONTS.

-- to do: Define use of all fonts and set them here...
-- some system fonts force a fatal error atm.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()

------------------------------------------------------------------------------------------
-- MAXUI FONT USAGE
------------------------------------------------------------------------------------------
local function MaxUIFonts()

	local Fonts = T.Fonts
	
	local STANDARD = C.Medias.Font
	
	-- MAXUI optional fonts
	local COMBAT = [[Interface\AddOns\Tukui\Medias\Fonts\DieDieDie.ttf]]
	local COMIC = [=[Interface\AddOns\MaxUI\Medias\Fonts\comic.ttf]=]
	local CARTOON = [=[Interface\AddOns\MaxUI\Medias\Fonts\cartoon.ttf]=]
	local BOLD = [=[Interface\AddOns\MaxUI\Medias\Fonts\Bold.ttf]=]
	local MAXUI = [=[Interface\AddOns\MaxUI\Medias\Fonts\MaxUI.ttf]=]
	
	-- TUKUI Basic fonts
	local TUKUI = [[Interface\AddOns\Tukui\Medias\Fonts\Expressway.ttf]]
	local TUKUIUF = [[Interface\AddOns\Tukui\Medias\Fonts\BigNoodleTitling.ttf]]
	local TUKUIDAMAGE = [[Interface\AddOns\Tukui\Medias\Fonts\DieDieDie.ttf]]
	local TUKUIPIXEL = [=[Interface\AddOns\Tukui\Medias\Fonts\Visitor.ttf]=]
	local TUKUIACTIONBAR = [[Interface\AddOns\Tukui\Medias\Fonts\Arial.ttf]]
	
	-- BLIZZARD fonts
	local ARIALN = [=[Interface\AddOns\MaxUI\Medias\Fonts\ARIALN.ttf]=]
	local FRIZQT = [=[Interface\AddOns\MaxUI\Medias\Fonts\FRIZQT__.ttf]=]
	local MORPHEUS = [=[Interface\AddOns\MaxUI\Medias\Fonts\MORPHEUS.ttf]=]
	local SKURRI = [=[Interface\AddOns\MaxUI\Medias\Fonts\SKURRI.ttf]=]
	
	-- SET FONTS
	UNIT_NAME_FONT = STANDARD
	STANDARD_TEXT_FONT = STANDARD
	
	if T.MyName == "Maxímvs" and T.MyRealm == "Silvermoon" then
		DAMAGE_TEXT_FONT = COMIC
	elseif T.MyName == "Praetorica" and T.MyRealm == "Silvermoon" then
		DAMAGE_TEXT_FONT = COMIC
	else
		DAMAGE_TEXT_FONT = MAXUI
	end	

------------------------------------------------------------------------------------------
-- KNOWN USE:
------------------------------------------------------------------------------------------
	-- TOOLTIP FONTS
	Fonts:SetFont(GameTooltipHeader, STANDARD, 14) -- title/header of the tooltip 
	Fonts:SetFont(Tooltip_Med, STANDARD, 12) -- descriptions etc., standard tooltip font
	Fonts:SetFont(Tooltip_Small, STANDARD, 11) -- ??
	
	-- QUEST FONTS
	Fonts:SetFont(QuestFont, STANDARD, 14, "") -- descriptions
	Fonts:SetFont(QuestFont_Large, STANDARD, 16, "") -- ??
	Fonts:SetFont(QuestFont_Huge, STANDARD, 20, "") -- headers, title, description header, rewards header
	Fonts:SetFont(QuestFont_Outline_Huge, STANDARD, 20, "") -- ???
	Fonts:SetFont(QuestFont_Super_Huge, STANDARD, 24, "") -- ???
	Fonts:SetFont(QuestFont_Super_Huge_Outline, STANDARD, 24, "")
	Fonts:SetFont(QuestFont_Enormous, STANDARD, 28, "")
	Fonts:SetFont(QuestFont_Shadow_Small, STANDARD, 11, "")
	
	-- ZONE INFO CENTER SCREEN
	Fonts:SetFont(ZoneTextString, STANDARD, 32, "OUTLINE") -- zone name when changing zone
	Fonts:SetFont(SubZoneTextString, STANDARD, 25, "OUTLINE") -- sub zone information when changing zone

------------------------------------------------------------------------------------------
-- UNKNOWN USE:
------------------------------------------------------------------------------------------
	-- SYSTEM FONTS, e.g. 
	Fonts:SetFont(SystemFont_Tiny, STANDARD, 10, "")
	Fonts:SetFont(SystemFont_Small, STANDARD, 10, "")
	Fonts:SetFont(SystemFont_Med1, STANDARD, 12, "")
	Fonts:SetFont(SystemFont_Med3, STANDARD, 13, "")
	Fonts:SetFont(SystemFont_Large, STANDARD, 15, "")

	Fonts:SetFont(SystemFont_Outline_Small, STANDARD, 12, "OUTLINE")
	Fonts:SetFont(SystemFont_OutlineThick_Huge2, STANDARD, 20, "THICKOUTLINE")
	
	Fonts:SetFont(SystemFont_Shadow_Small, STANDARD, 11, "")
	Fonts:SetFont(SystemFont_Shadow_Med1, STANDARD, 12, "")
	Fonts:SetFont(SystemFont_Shadow_Med3, STANDARD, 13, "")
	--Fonts:SetFont(SystemFont_Shadow_Large, STANDARD, 15, "")
	Fonts:SetFont(SystemFont_Shadow_Huge1, STANDARD, 20, "THINOUTLINE")
	
	--Fonts:SetFont(SystemFont_Shadow_Outline_Huge2, STANDARD, 20, "OUTLINE")

	-- NUMBER FONT ???
	Fonts:SetFont(NumberFont_GameNormal, STANDARD, 12, "OUTLINE")
	Fonts:SetFont(NumberFont_Normal_Med, STANDARD, 12, "OUTLINE")
	Fonts:SetFont(NumberFont_OutlineThick_Mono_Small, STANDARD, 12, "OUTLINE")
	Fonts:SetFont(NumberFont_Outline_Med, STANDARD, 13, "OUTLINE")
	Fonts:SetFont(NumberFont_Outline_Large, STANDARD, 15, "OUTLINE")
	Fonts:SetFont(NumberFont_Outline_Huge, STANDARD, 28, "THICKOUTLINE")
	Fonts:SetFont(NumberFont_Shadow_Small, STANDARD, 12, "")
	Fonts:SetFont(NumberFont_Shadow_Med, STANDARD, 12, "")
	
	-- COMBAT TEXT FONT ??
	Fonts:SetFont(CombatTextFont, STANDARD, 50, "OUTLINE")
	
	-- PVP FONT ??
	Fonts:SetFont(PVPInfoTextString, STANDARD, 22, "THINOUTLINE")
	Fonts:SetFont(PVPArenaTextString, STANDARD, 22, "THINOUTLINE")
	
	-- FRIENDS FONT ??
	Fonts:SetFont(FriendsFont_Normal, STANDARD, 12, "")
	Fonts:SetFont(FriendsFont_Small, STANDARD, 11, "")
	Fonts:SetFont(FriendsFont_Large, STANDARD, 14, "")
	Fonts:SetFont(FriendsFont_UserText, STANDARD, 11, "")
	
	-- NAMEPLATE FONTS ???
	Fonts:SetFont(SystemFont_NamePlateCastBar, STANDARD, 14, "")
	Fonts:SetFont(SystemFont_NamePlateFixed, STANDARD, 14, "")
	Fonts:SetFont(SystemFont_LargeNamePlateFixed, STANDARD, 14, "")
	Fonts:SetFont(SystemFont_NamePlate, STANDARD, 14, "")
	Fonts:SetFont(SystemFont_LargeNamePlate, STANDARD, 14, "")
end
MaxUIFonts()