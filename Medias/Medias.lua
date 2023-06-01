	------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 30-10-2022
------------------------------------------------------------------------------------------

-- setting up MEDIA.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
TukuiMedia = T["Media"]

------------------------------------------------------------------------------------------
-- MaxUI MEDIA -- force fonts to set font
------------------------------------------------------------------------------------------
if not C["Medias"] then C["Medias"] = {} end

C["Medias"]["Font"] = T.GetFont(C.General.Font)
C["Medias"]["UnitFrameFont"] = [=[Interface\Addons\MaxUI\Medias\Fonts\MaxUI.ttf]=]
C["Medias"]["DamageFont"] = [=[Interface\AddOns\MaxUI\Medias\Fonts\MaxUI.ttf]=]
C["Medias"]["PixelFont"] = [=[Interface\Addons\MaxUI\Medias\Fonts\MaxUI.ttf]=]
C["Medias"]["ActionBarFont"] = [=[Interface\Addons\MaxUI\Medias\Fonts\MaxUI.ttf]=]
C["Medias"]["ConfigFont"] = [[Interface\AddOns\MaxUI\Medias\Fonts\MaxUI.ttf]]
C["Medias"]["MaxUIFont"] = [[Interface\AddOns\MaxUI\Medias\Fonts\MaxUI.ttf]]

------------------------------------------------------------------------------------------
--  MaxUI -- ADD FONTS OUTLINED
------------------------------------------------------------------------------------------
-- MAXUI
local MaxUIOutlined = CreateFont("MaxUIOutlined")
MaxUIOutlined:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\MaxUI.ttf", 10, "OUTLINE")
TukuiMedia:RegisterFont("MaxUI Outlined", "MaxUIOutlined")

local MaxUIItalicOutlined = CreateFont("MaxUIItalicOutlined")
MaxUIItalicOutlined:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\MaxUIitalic.ttf", 10, "OUTLINE")
TukuiMedia:RegisterFont("MaxUI It. Outlined", "MaxUIItalicOutlined")

local BoldOutlined = CreateFont("BoldOutlined")
BoldOutlined:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\Bold.ttf", 10, "OUTLINE")
TukuiMedia:RegisterFont("Bold Outlined", "BoldOutlined")

local ComicOutlined = CreateFont("ComicOutlined")
ComicOutlined:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\comic.ttf", 10, "OUTLINE")
TukuiMedia:RegisterFont("Comic Outlined", "ComicOutlined")

local CartoonOutlined = CreateFont("CartoonOutlined")
CartoonOutlined:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\cartoon.ttf", 10, "OUTLINE")
TukuiMedia:RegisterFont("Cartoon Outlined", "CartoonOutlined")

-- TUKUI
local ExpresswayOutlined = CreateFont("ExpresswayOutlined")
ExpresswayOutlined:SetFont("Interface\\AddOns\\Tukui\\Medias\\Fonts\\Expressway.ttf", 10, "OUTLINE")
TukuiMedia:RegisterFont("Expressway Outlined", "ExpresswayOutlined")

local PTSansNarrowOutlined = CreateFont("PTSansNarrowOutlined")
PTSansNarrowOutlined:SetFont("Interface\\AddOns\\Tukui\\Medias\\Fonts\\PTSansNarrow.ttf", 10, "OUTLINE")
TukuiMedia:RegisterFont("PTSansNarrow Outlined", "PTSansNarrowOutlined")

local BigNoodleTitlingOutlined = CreateFont("BigNoodleTitlingOutlined")
BigNoodleTitlingOutlined:SetFont("Interface\\AddOns\\Tukui\\Medias\\Fonts\\BigNoodleTitling.ttf", 10, "OUTLINE")
TukuiMedia:RegisterFont("BigNoodleTitling Outlined", "BigNoodleTitlingOutlined")

local VisitorOutlined = CreateFont("VisitorOutlined")
VisitorOutlined:SetFont("Interface\\AddOns\\Tukui\\Medias\\Fonts\\Visitor.ttf", 10, "OUTLINE")
TukuiMedia:RegisterFont("Visitor Outlined", "VisitorOutlined")

-- BLIZZARD
local WarcraftOutlined = CreateFont("WarcraftOutlined")
WarcraftOutlined:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\LifeCraft.ttf", 10, "OUTLINE")
TukuiMedia:RegisterFont("Warcraft Outlined", "WarcraftOutlined")

local MorpheusOutlined = CreateFont("MorpheusOutlined")
MorpheusOutlined:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\Morpheus.ttf", 10, "OUTLINE")
TukuiMedia:RegisterFont("Morpheus Outlined", "MorpheusOutlined")

------------------------------------------------------------------------------------------
--  MaxUI -- ADD FONTS
------------------------------------------------------------------------------------------
-- MAXUI
local MaxUI = CreateFont("MaxUI")
MaxUI:SetShadowColor(0, 0, 0)
MaxUI:SetShadowOffset(1.25, -1.25)
MaxUI:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\MaxUI.ttf", 10, "")
TukuiMedia:RegisterFont("MaxUI", "MaxUI")

local MaxUIitalic = CreateFont("MaxUIitalic")
MaxUIitalic:SetShadowColor(0, 0, 0)
MaxUIitalic:SetShadowOffset(1.25, -1.25)
MaxUIitalic:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\MaxUIitalic.ttf", 10, "")
TukuiMedia:RegisterFont("MaxUI It.", "MaxUIitalic")

local Bold = CreateFont("Bold")
Bold:SetShadowColor(0, 0, 0)
Bold:SetShadowOffset(1.25, -1.25)
Bold:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\Bold.ttf", 10, "")
TukuiMedia:RegisterFont("Bold", "Bold")

local Comic = CreateFont("Comic")
Comic:SetShadowColor(0, 0, 0)
Comic:SetShadowOffset(1.25, -1.25)
Comic:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\comic.ttf", 10, "")
TukuiMedia:RegisterFont("Comic", "Comic")

local Cartoon = CreateFont("Cartoon")
Cartoon:SetShadowColor(0, 0, 0)
Cartoon:SetShadowOffset(1.25, -1.25)
Cartoon:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\Cartoon.ttf", 10,"")
TukuiMedia:RegisterFont("Cartoon", "Cartoon")

-- TUKUI
local Expressway = CreateFont("Expressway")
Expressway:SetShadowColor(0, 0, 0)
Expressway:SetShadowOffset(1.25, -1.25)
Expressway:SetFont("Interface\\AddOns\\Tukui\\Medias\\Fonts\\Expressway.ttf", 10, "")
TukuiMedia:RegisterFont("Expressway", "Expressway")

local PTSansNarrow = CreateFont("PTSansNarrow")
PTSansNarrow:SetShadowColor(0, 0, 0)
PTSansNarrow:SetShadowOffset(1.25, -1.25)
PTSansNarrow:SetFont("Interface\\AddOns\\Tukui\\Medias\\Fonts\\PTSansNarrow.ttf", 10,"")
TukuiMedia:RegisterFont("PTSansNarrow", "PTSansNarrow")

local BigNoodleTitling = CreateFont("BigNoodleTitling")
BigNoodleTitling:SetShadowColor(0, 0, 0)
BigNoodleTitling:SetShadowOffset(1.25, -1.25)
BigNoodleTitling:SetFont("Interface\\AddOns\\Tukui\\Medias\\Fonts\\BigNoodleTitling.ttf", 10,"")
TukuiMedia:RegisterFont("BigNoodleTitling", "BigNoodleTitling")

local Visitor = CreateFont("Visitor")
Visitor:SetShadowColor(0, 0, 0)
Visitor:SetShadowOffset(1.25, -1.25)
Visitor:SetFont("Interface\\AddOns\\Tukui\\Medias\\Fonts\\Visitor.ttf", 10,"")
TukuiMedia:RegisterFont("Visitor", "Visitor")

-- BLIZZARD
local Warcraft = CreateFont("Warcraft")
Warcraft:SetShadowColor(0, 0, 0)
Warcraft:SetShadowOffset(1.25, -1.25)
Warcraft:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\LifeCraft.ttf", 10, "")
TukuiMedia:RegisterFont("Warcraft", "Warcraft")

local Morpheus = CreateFont("Morpheus")
Morpheus:SetShadowColor(0, 0, 0)
Morpheus:SetShadowOffset(1.25, -1.25)
Morpheus:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\Morpheus.ttf", 10, "")
TukuiMedia:RegisterFont("Morpheus", "Morpheus")

------------------------------------------------------------------------------------------
--  MaxUI -- textures added 
------------------------------------------------------------------------------------------
-- bar textures
TukuiMedia:RegisterTexture("Asphyxia", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\Asphyxia.blp")
TukuiMedia:RegisterTexture("Border", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\Border.tga")
TukuiMedia:RegisterTexture("Drop", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\drop.tga")
TukuiMedia:RegisterTexture("Fiery", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\fiery.tga")
TukuiMedia:RegisterTexture("Fifths", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\Fifths.tga")
TukuiMedia:RegisterTexture("Fourths", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\Fourths.tga")
TukuiMedia:RegisterTexture("Gloss", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\Gloss.tga")
TukuiMedia:RegisterTexture("Glosswave", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\glosswave.tga")
TukuiMedia:RegisterTexture("Graphite", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\Graphite.tga")
TukuiMedia:RegisterTexture("Highlight", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\Highlight.tga")
TukuiMedia:RegisterTexture("Minimalist", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\Minimalist.tga")
TukuiMedia:RegisterTexture("MinimalistVert", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\MinimalistVertical.blp")
TukuiMedia:RegisterTexture("Overlay", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\Overlay.tga")

TukuiMedia:RegisterTexture("Rounded", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\Rounded.tga")
TukuiMedia:RegisterTexture("Rounded Vert Left", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\RoundedVl.tga")
TukuiMedia:RegisterTexture("Rounded Vert Right", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\RoundedVr.tga")

TukuiMedia:RegisterTexture("Gradation Left", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\GradationLeftH.tga")
TukuiMedia:RegisterTexture("Gradation Right", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\GradationRightH.tga")
TukuiMedia:RegisterTexture("Gradation Bottom", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\GradationBottomH.tga")
TukuiMedia:RegisterTexture("Gradation Top", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\GradationTopH.tga")
TukuiMedia:RegisterTexture("Gradation Left Vert", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\GradationLeftV.tga")
TukuiMedia:RegisterTexture("Gradation Right Vert", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\GradationRightV.tga")
TukuiMedia:RegisterTexture("Gradation Bottom Vert", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\GradationBottomV.tga")
TukuiMedia:RegisterTexture("Gradation Top Vert", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\GradationTopV.tga")

TukuiMedia:RegisterTexture("vectorDK", "Interface\\AddOns\\MaxUI\\Medias\\Class\\vector style\\DeathKnight.tga")
TukuiMedia:RegisterTexture("vectorDH", "Interface\\AddOns\\MaxUI\\Medias\\Class\\vector style\\DemonHunter.tga")
TukuiMedia:RegisterTexture("vectorDR", "Interface\\AddOns\\MaxUI\\Medias\\Class\\vector style\\Druid.tga")
TukuiMedia:RegisterTexture("vectorEV", "Interface\\AddOns\\MaxUI\\Medias\\Class\\vector style\\Evoker.tga")
TukuiMedia:RegisterTexture("vectorHU", "Interface\\AddOns\\MaxUI\\Medias\\Class\\vector style\\Hunter.tga")
TukuiMedia:RegisterTexture("vectorMA", "Interface\\AddOns\\MaxUI\\Medias\\Class\\vector style\\Mage.tga")
TukuiMedia:RegisterTexture("vectorMO", "Interface\\AddOns\\MaxUI\\Medias\\Class\\vector style\\Monk.tga")
TukuiMedia:RegisterTexture("vectorPA", "Interface\\AddOns\\MaxUI\\Medias\\Class\\vector style\\Paladin.tga")
TukuiMedia:RegisterTexture("vectorPR", "Interface\\AddOns\\MaxUI\\Medias\\Class\\vector style\\Priest.tga")
TukuiMedia:RegisterTexture("vectorRO", "Interface\\AddOns\\MaxUI\\Medias\\Class\\vector style\\Rogue.tga")
TukuiMedia:RegisterTexture("vectorSH", "Interface\\AddOns\\MaxUI\\Medias\\Class\\vector style\\Shaman.tga")
TukuiMedia:RegisterTexture("vectorWL", "Interface\\AddOns\\MaxUI\\Medias\\Class\\vector style\\Warlock.tga")
TukuiMedia:RegisterTexture("vectorWA", "Interface\\AddOns\\MaxUI\\Medias\\Class\\vector style\\Warrior.tga")

-- art / chat bg
TukuiMedia:RegisterTexture("yLogoClassic", "Interface\\AddOns\\MaxUI\\Medias\\Logos\\classiclogo.tga")
TukuiMedia:RegisterTexture("yLogoBurningCrusade", "Interface\\AddOns\\MaxUI\\Medias\\Logos\\bcclogo.tga")
TukuiMedia:RegisterTexture("yLogoWotLK", "Interface\\AddOns\\MaxUI\\Medias\\Logos\\wotlklogo.tga")
TukuiMedia:RegisterTexture("yLogoCataclysm", "Interface\\AddOns\\MaxUI\\Medias\\Logos\\cataclysmlogo.tga")
TukuiMedia:RegisterTexture("yLogoMistsOfPandaria", "Interface\\AddOns\\MaxUI\\Medias\\Logos\\mistsofpandarialogo.tga")
TukuiMedia:RegisterTexture("yLogoWarlordsOfDraenor", "Interface\\AddOns\\MaxUI\\Medias\\Logos\\warlordsofdraenorlogo.tga")
TukuiMedia:RegisterTexture("yLogoLegion", "Interface\\AddOns\\MaxUI\\Medias\\Logos\\legionlogo.tga")
TukuiMedia:RegisterTexture("yLogoBattleForAzeroth", "Interface\\AddOns\\MaxUI\\Medias\\Logos\\battleforazerothlogo.tga")
TukuiMedia:RegisterTexture("yLogoShadowlands", "Interface\\AddOns\\MaxUI\\Medias\\Logos\\shadowlandslogo.tga")
TukuiMedia:RegisterTexture("yLogoDragonflight", "Interface\\AddOns\\MaxUI\\Medias\\Logos\\dragonflightlogo.tga")

TukuiMedia:RegisterTexture("zMaxUI", "Interface\\AddOns\\MaxUI\\Medias\\MaxUI\\MaxUI_LOGO.tga")
TukuiMedia:RegisterTexture("zClassicBG", "Interface\\AddOns\\MaxUI\\Medias\\backgrounds\\classic.tga")
TukuiMedia:RegisterTexture("zBurningCrusadeBG", "Interface\\AddOns\\MaxUI\\Medias\\backgrounds\\bcc.tga")
TukuiMedia:RegisterTexture("zWotLKBG", "Interface\\AddOns\\MaxUI\\Medias\\backgrounds\\wotlk.tga")
TukuiMedia:RegisterTexture("zCataclysmBG", "Interface\\AddOns\\MaxUI\\Medias\\backgrounds\\cata.tga")
TukuiMedia:RegisterTexture("zMistsOfPandariaBG", "Interface\\AddOns\\MaxUI\\Medias\\backgrounds\\mop.tga")
TukuiMedia:RegisterTexture("zWarlordsOfDraenorBG", "Interface\\AddOns\\MaxUI\\Medias\\backgrounds\\wod.tga")
TukuiMedia:RegisterTexture("zLegionBG", "Interface\\AddOns\\MaxUI\\Medias\\backgrounds\\legion.tga")
TukuiMedia:RegisterTexture("zBattleForAzerothBG", "Interface\\AddOns\\MaxUI\\Medias\\backgrounds\\bfa.tga")
TukuiMedia:RegisterTexture("zShadowlandsBG", "Interface\\AddOns\\MaxUI\\Medias\\backgrounds\\shadowlands.tga")
TukuiMedia:RegisterTexture("zDragonFlightBG", "Interface\\AddOns\\MaxUI\\Medias\\backgrounds\\dragonflight.tga")