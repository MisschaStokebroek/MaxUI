------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-07-2021
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
--  MaxUI -- fonts added 
------------------------------------------------------------------------------------------
-- Outlined
local BoldOutlined = CreateFont("BoldOutlined")
BoldOutlined:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\Bold.ttf", 10, "THINOUTLINE")
TukuiMedia:RegisterFont("Bold Outlined", "BoldOutlined")

local MaxUIOutlined = CreateFont("MaxUIOutlined")
MaxUIOutlined:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\MaxUI.ttf", 10, "THINOUTLINE")
TukuiMedia:RegisterFont("MaxUI Outlined", "MaxUIOutlined")

local ComicOutlined = CreateFont("ComicOutlined")
ComicOutlined:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\comic.ttf", 10, "THINOUTLINE")
TukuiMedia:RegisterFont("Comic Outlined", "ComicOutlined")

local CartoonOutlined = CreateFont("CartoonOutlined")
CartoonOutlined:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\cartoon.ttf", 10, "THINOUTLINE")
TukuiMedia:RegisterFont("Cartoon Outlined", "CartoonOutlined")

local ExpresswayOutlined = CreateFont("ExpresswayOutlined")
ExpresswayOutlined:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\Expressway.ttf", 10, "THINOUTLINE")
TukuiMedia:RegisterFont("Expressway Outlined", "ExpresswayOutlined")

local PTSansNarrowOutlined = CreateFont("PTSansNarrowOutlined")
PTSansNarrowOutlined:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\PTSansNarrow.ttf", 10, "THINOUTLINE")
TukuiMedia:RegisterFont("PTSansNarrow Outlined", "PTSansNarrowOutlined")

local WarcraftOutlined = CreateFont("WarcraftOutlined")
WarcraftOutlined:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\LifeCraft.ttf", 10, "THINOUTLINE")
TukuiMedia:RegisterFont("Warcraft Outlined", "WarcraftOutlined")

local MorpheusOutlined = CreateFont("MorpheusOutlined")
MorpheusOutlined:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\Morpheus.ttf", 10, "THINOUTLINE")
TukuiMedia:RegisterFont("Morpheus Outlined", "MorpheusOutlined")

local KimberleyOutlined = CreateFont("KimberleyOutlined")
KimberleyOutlined:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\kimberley.ttf", 10, "THINOUTLINE")
TukuiMedia:RegisterFont("Kimberley Outlined", "KimberleyOutlined")


-- Shadowed Offset
local Bold = CreateFont("Bold")
Bold:SetShadowColor(0, 0, 0)
Bold:SetShadowOffset(1.25, -1.25)
Bold:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\Bold.ttf", 10)
TukuiMedia:RegisterFont("Bold", "Bold")

local MaxUI = CreateFont("MaxUI")
MaxUI:SetShadowColor(0, 0, 0)
MaxUI:SetShadowOffset(1.25, -1.25)
MaxUI:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\MaxUI.ttf", 10)
TukuiMedia:RegisterFont("MaxUI", "MaxUI")

local Comic = CreateFont("Comic")
Comic:SetShadowColor(0, 0, 0)
Comic:SetShadowOffset(1.25, -1.25)
Comic:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\comic.ttf", 10)
TukuiMedia:RegisterFont("Comic", "Comic")

local Cartoon = CreateFont("Cartoon")
Cartoon:SetShadowColor(0, 0, 0)
Cartoon:SetShadowOffset(1.25, -1.25)
Cartoon:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\Cartoon.ttf", 10)
TukuiMedia:RegisterFont("Cartoon", "Cartoon")

local Expressway = CreateFont("Expressway")
Expressway:SetShadowColor(0, 0, 0)
Expressway:SetShadowOffset(1.25, -1.25)
Expressway:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\Expressway.ttf", 10)
TukuiMedia:RegisterFont("Expressway", "Expressway")

local PTSansNarrow = CreateFont("PTSansNarrow")
PTSansNarrow:SetShadowColor(0, 0, 0)
PTSansNarrow:SetShadowOffset(1.25, -1.25)
PTSansNarrow:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\PTSansNarrow.ttf", 10)
TukuiMedia:RegisterFont("PTSansNarrow", "PTSansNarrow")

local Warcraft = CreateFont("Warcraft")
Warcraft:SetShadowColor(0, 0, 0)
Warcraft:SetShadowOffset(1.25, -1.25)
Warcraft:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\LifeCraft.ttf", 10)
TukuiMedia:RegisterFont("Warcraft", "Warcraft")

local Morpheus = CreateFont("Morpheus")
Morpheus:SetShadowColor(0, 0, 0)
Morpheus:SetShadowOffset(1.25, -1.25)
Morpheus:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\Morpheus.ttf", 10)
TukuiMedia:RegisterFont("Morpheus", "Morpheus")

local Kimberley = CreateFont("Kimberley")
Kimberley:SetShadowColor(0, 0, 0)
Kimberley:SetShadowOffset(1.25, -1.25)
Kimberley:SetFont("Interface\\AddOns\\MaxUI\\Medias\\Fonts\\kimberley.ttf", 10)
TukuiMedia:RegisterFont("Kimberley", "Kimberley")

------------------------------------------------------------------------------------------
--  MaxUI -- textures added 
------------------------------------------------------------------------------------------
-- bar textures
TukuiMedia:RegisterTexture("Asphyxia", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\Asphyxia.blp")
TukuiMedia:RegisterTexture("Drop", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\drop.tga")
TukuiMedia:RegisterTexture("Fiery", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\fiery.tga")
TukuiMedia:RegisterTexture("Fifths", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\Fifths.tga")
TukuiMedia:RegisterTexture("Fourths", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\Fourths.tga")
TukuiMedia:RegisterTexture("Gloss", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\Gloss.tga")
TukuiMedia:RegisterTexture("Glosswave", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\glosswave.tga")
TukuiMedia:RegisterTexture("Graphite", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\Graphite.tga")
TukuiMedia:RegisterTexture("Minimalist", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\Minimalist.tga")
TukuiMedia:RegisterTexture("MinimalistVert", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\MinimalistVertical.blp")
TukuiMedia:RegisterTexture("Rounded", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\Rounded.tga")
TukuiMedia:RegisterTexture("Overlay", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\Overlay.tga")
TukuiMedia:RegisterTexture("HalfBar", "Interface\\AddOns\\MaxUI\\Medias\\Textures\\halfbar.tga")

-- art / chat bg
TukuiMedia:RegisterTexture("MaxUI", "Interface\\AddOns\\MaxUI\\Medias\\MaxUI\\MaxUI_LOGO.tga")
TukuiMedia:RegisterTexture("Classic", "Interface\\AddOns\\MaxUI\\Medias\\MaxUI\\classic.tga")
TukuiMedia:RegisterTexture("Retail", "Interface\\AddOns\\MaxUI\\Medias\\MaxUI\\shadowlands.tga")
TukuiMedia:RegisterTexture("BCC", "Interface\\AddOns\\MaxUI\\Medias\\MaxUI\\bcc.tga")
TukuiMedia:RegisterTexture("ClassicBG", "Interface\\AddOns\\MaxUI\\Medias\\MaxUI\\classicBG.tga")
TukuiMedia:RegisterTexture("RetailBG", "Interface\\AddOns\\MaxUI\\Medias\\MaxUI\\shadowlandsBG.tga")
TukuiMedia:RegisterTexture("BCCBG", "Interface\\AddOns\\MaxUI\\Medias\\MaxUI\\bccBG.tga")