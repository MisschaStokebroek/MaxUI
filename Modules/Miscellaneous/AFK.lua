------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 30-10-2022
------------------------------------------------------------------------------------------

-- setting up AFK screen.

-- PLAYER MODEL NOT SHOWING ANYMORE???

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local AFK = T.Miscellaneous.AFK
local baseEnable = AFK.Enable

local ClassTextColor = T.RGBToHex(unpack(T.Colors.class[select(2, UnitClass("player"))]))
local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}

local PlayerModelFrame = CreateFrame("Frame", PlayerModelFrame, AFK.BottomPanel)
--local myPlayerModel = CreateFrame("PlayerModel", nil, AFK.BottomPanel)
local CharacterSpec = ""

-- WoW Globals
local GuildInfo = GuildInfo
local GetTalentInfo = GetTalentInfo
local GetSpecialization = GetSpecialization
local SetSpecialization = SetSpecialization
local GetNumSpecializations = GetNumSpecializations
local GetSpecializationInfo = GetSpecializationInfo
local GetLootSpecialization = GetLootSpecialization
local SetLootSpecialization = SetLootSpecialization

T.version = GetAddOnMetadata("Tukui", "Version")
T.MaxUIversion = GetAddOnMetadata("MaxUI", "Version")
local MaxUIVersion = "|cffFFFF99version:|r "..T.MaxUIversion..""
local TukuiVersion = "|cffFFFF99version:|r "..T.version..""
local GameVersion
if T.Retail then
	GameVersion	= "|cffFFFF99Retail|r" 
elseif T.BCC then
	GameVersion	= "|cffFFFF99The Burning Crusade Classic|r" 
elseif T.WotLK then	
	GameVersion	= "|cffFFFF99Wrath of the Lich King Classic|r" 
elseif T.Classic then	
	GameVersion	= "|cffFFFF99Classic Era / Season of Mastery|r" 
else
	GameVersion	= "|cffFFFF99World of Warcraft|r" 
end
local version, build, date, tocversion = GetBuildInfo()

------------------------------------------------------------------------------------------
-- AFK SCREEN ADJUSTMENTS
------------------------------------------------------------------------------------------
function AFK:AFKPlayerInfoFrame()
	local BottomPanel = AFK.BottomPanel
	local TopPanel = AFK.PanelTop
	local Font = C.Medias.Font
	local Texture = T.GetTexture(C["General"]["LineTexture"])
	
	BottomPanel.Backdrop:SetAlpha(0.7)
	TopPanel.Backdrop:SetAlpha(0.7)
	
	local englishFaction, localizedFaction = UnitFactionGroup("player")
	isGuildMember = IsInGuild("player")
	local GetRealmName = GetRealmName()
	local FullName = UnitPVPName("player")
	local Level = UnitLevel("player")
	local UnitRace = UnitRace("player")
	local thickness = 1 
		
	PlayerModelFrame:SetPoint("TOPLEFT", TopPanel, "BOTTOMLEFT", 0, -2)
	PlayerModelFrame:SetPoint("BOTTOMLEFT", BottomPanel, "TOPLEFT", 0, 2)
	PlayerModelFrame:SetWidth(500)
	PlayerModelFrame:SetParent(BottomPanel)
	PlayerModelFrame:CreateBackdrop("Transparent")
	PlayerModelFrame:CreateShadow()

	if C["Skins"]["AFKFilter"] == true then 
		LeftFilter = PlayerModelFrame:CreateTexture(nil, "BACKGROUND")
		LeftFilter:SetAllPoints()
		LeftFilter:SetTexture([[Interface\AddOns\MaxUI\Medias\Textures\Overlay.tga]])
	end

	--myPlayerModel:SetParent(PlayerModelFrame)
	--myPlayerModel:SetWidth(500)
	--myPlayerModel:SetHeight(UIParent:GetHeight())
	--myPlayerModel:SetPoint("BOTTOM", PlayerModelFrame, "BOTTOM", 0, -210)
	
	--myPlayerModel:SetRotation(0.2)
	--myPlayerModel:ClearModel()
	--myPlayerModel:SetUnit("player")
	--myPlayerModel:SetFacing(1)
	--myPlayerModel:SetCamDistanceScale(1)
	--myPlayerModel:SetAlpha(0)

	local Line = CreateFrame("StatusBar", "Line", PlayerModelFrame)
	Line:CreateBackdrop()
	Line:SetHeight(thickness)
	Line:SetPoint("TOPLEFT", 10, -102)
	Line:SetPoint("TOPRIGHT", -10, -102)
	Line:SetFrameStrata("HIGH")
	Line:SetFrameLevel(3)
	Line:SetStatusBarTexture(Texture)
	Line:SetStatusBarColor(unpack(ClassColor))
	Line.Backdrop:CreateShadow()

	local LineBottom = CreateFrame("StatusBar", "LineBottom", Line)
	LineBottom:CreateBackdrop()
	LineBottom:SetHeight(thickness)
	LineBottom:SetWidth(Line:GetWidth())
	LineBottom:SetPoint("TOP", Line, "BOTTOM", 0, -300)
	LineBottom:SetFrameStrata("HIGH")
	LineBottom:SetFrameLevel(2)
	LineBottom:SetStatusBarTexture(Texture)
	LineBottom:SetStatusBarColor(unpack(ClassColor))
	LineBottom.Backdrop:CreateShadow()

	local CharacterDescriptionName = PlayerModelFrame:CreateFontString(nil, "OVERLAY")  
	CharacterDescriptionName:SetPoint("TOP", PlayerModelFrame, "TOP", 0, -20)
	CharacterDescriptionName:SetFontTemplate(Font, 24, 1.25, 1.25)
	CharacterDescriptionName:SetText(""..ClassTextColor ..FullName)
	
	local CharacterDescriptionLevel = PlayerModelFrame:CreateFontString(nil, "OVERLAY")  
	CharacterDescriptionLevel:SetPoint("TOP", CharacterDescriptionName, "BOTTOM", 0, -8)
	CharacterDescriptionLevel:SetFontTemplate(Font, 18, 1.25, 1.25)
	CharacterDescriptionLevel:SetText("Level: "..ClassTextColor..Level)

	PlayerModelFrame.Logoclass = PlayerModelFrame:CreateTexture(nil, "ARTWORK")
	PlayerModelFrame.Logoclass:SetWidth(256)
	PlayerModelFrame.Logoclass:SetHeight(256)
	PlayerModelFrame.Logoclass:SetPoint("TOPLEFT", PlayerModelFrame, "TOPLEFT", -12, -122)

		if select(2, UnitClass('player')) == "DRUID" then
			PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\DRUID.tga]])
		elseif select(2, UnitClass('player')) == "EVOKER" then
			PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\EVOKER.tga]])
		elseif select(2, UnitClass('player')) == "MONK" then
			PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\MONK.tga]])
		elseif select(2, UnitClass('player')) == "ROGUE" then
			PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\ROGUE.tga]])
		elseif select(2, UnitClass('player')) == "MAGE" then
			PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\MAGE.tga]])
		elseif select(2, UnitClass('player')) == "PRIEST" then
			PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\PRIEST.tga]])
		elseif select(2, UnitClass('player')) == "WARLOCK" then
			PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\WARLOCK.tga]])
		elseif select(2, UnitClass('player')) == "SHAMAN" then
			PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\SHAMAN.tga]])
		elseif select(2, UnitClass('player')) == "HUNTER" then
			PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\HUNTER.tga]])
		elseif select(2, UnitClass('player')) == "DEATHKNIGHT" then
			PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\DEATHKNIGHT.tga]])
		elseif select(2, UnitClass('player')) == "WARRIOR" then
			PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\WARRIOR.tga]])
		elseif select(2, UnitClass('player')) == "PALADIN" then
			PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\PALADIN.tga]])
		elseif select(2, UnitClass('player')) == "DEMONHUNTER" then
			PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\DEMONHUNTER.tga]])
		end

	local CharacterDescriptionSummary = PlayerModelFrame:CreateFontString(nil, "OVERLAY")
	CharacterDescriptionSummary:SetPoint("TOPLEFT", PlayerModelFrame.Logoclass, "TOPRIGHT", 0, 0)
	CharacterDescriptionSummary:SetFontTemplate(Font, 18, 1.25, 1.25)
	CharacterDescriptionSummary:SetText("Summary:")
	
	local CharacterRealmInfo = PlayerModelFrame:CreateFontString(nil, "OVERLAY")
	CharacterRealmInfo:SetPoint("LEFT", PlayerModelFrame.Logoclass, "RIGHT", 0, 75)
	CharacterRealmInfo:SetFontTemplate(Font, 14, 1.25, 1.25)
	CharacterRealmInfo:SetText("Realm: " ..ClassTextColor..GetRealmName)
	
	local CharacterFactionInfo = PlayerModelFrame:CreateFontString(nil, "OVERLAY")  
	CharacterFactionInfo:SetPoint("LEFT", PlayerModelFrame.Logoclass, "RIGHT", 0, 55)
	CharacterFactionInfo:SetFontTemplate(Font, 14, 1.25, 1.25)
	CharacterFactionInfo:SetText("Faction: " ..ClassTextColor..localizedFaction)

	local CharacterDescriptionRace = PlayerModelFrame:CreateFontString(nil, "OVERLAY")  
	CharacterDescriptionRace:SetPoint("LEFT", PlayerModelFrame.Logoclass, "RIGHT", 0, 35)
	CharacterDescriptionRace:SetFontTemplate(Font, 14, 1.25, 1.25)
	CharacterDescriptionRace:SetText("Race: "..ClassTextColor..UnitRace)

	local CharacterDescriptionClass = PlayerModelFrame:CreateFontString(nil, "OVERLAY")  
	CharacterDescriptionClass:SetPoint("LEFT", PlayerModelFrame.Logoclass, "RIGHT", 0, 15)
	CharacterDescriptionClass:SetFontTemplate(Font, 14, 1.25, 1.25)
	CharacterDescriptionClass:SetText("Class: "..ClassTextColor..UnitClass("player"))

	if T.Retail then
		local Tree = GetSpecialization()
		local Spec = select(2, GetSpecializationInfo(Tree)) or ""
		CharacterSpec = Spec
	
		local CharacterDescriptionSpec = PlayerModelFrame:CreateFontString(nil, "OVERLAY")  
		CharacterDescriptionSpec:SetPoint("LEFT", PlayerModelFrame.Logoclass, "RIGHT", 0, -5)
		CharacterDescriptionSpec:SetFontTemplate(Font, 14, 1.25, 1.25)
		CharacterDescriptionSpec:SetText("Spec: " ..ClassTextColor..Spec)
	end
	
	if (isGuildMember) then
		CharacterDescriptionGuild = PlayerModelFrame:CreateFontString(nil, "OVERLAY")  
		CharacterDescriptionGuild:SetPoint("LEFT", PlayerModelFrame.Logoclass, "RIGHT", 0, -45)
		CharacterDescriptionGuild:SetFontTemplate(Font, 14, 1.25, 1.25)
		
		CharacterDescriptionGuild2 = PlayerModelFrame:CreateFontString(nil, "OVERLAY")  
		CharacterDescriptionGuild2:SetPoint("LEFT", PlayerModelFrame.Logoclass, "RIGHT", 0, -65)
		CharacterDescriptionGuild2:SetFontTemplate(Font, 14, 1.25, 1.25)
	end

	-- game art
	local AFKGameVersionArt = CreateFrame("Frame", "AFKGameVersionArt", PlayerModelFrame)
	AFKGameVersionArt:SetPoint("BOTTOM", PlayerModelFrame, "BOTTOM", 0, 48)
	AFKGameVersionArt:SetSize(PlayerModelFrame:GetWidth()-48, PlayerModelFrame:GetWidth()-48)
	AFKGameVersionArt:CreateBackdrop("Transparent")
	AFKGameVersionArt:EnableMouse(false)
	AFKGameVersionArt:CreateShadow()

	AFKGameVersionArt.ArtBG = AFKGameVersionArt:CreateTexture(nil, "ARTWORK")
	AFKGameVersionArt.ArtBG:SetInside(AFKGameVersionArt)
	AFKGameVersionArt.ArtBG:SetAlpha(0.7)

	AFKGameVersionArt.logo = AFKGameVersionArt:CreateTexture(nil, "OVERLAY")
	AFKGameVersionArt.logo:SetPoint("TOP", AFKGameVersionArt, "TOP")
	AFKGameVersionArt.logo:SetSize(200, 100)
	AFKGameVersionArt.logo:SetAlpha(1)

		AFKGameVersionArt.WoWVersiontext = AFKGameVersionArt:CreateFontString(nil, "OVERLAY")
		AFKGameVersionArt.WoWVersiontext:SetFont(C.Medias.Font, 12)
		AFKGameVersionArt.WoWVersiontext:SetPoint("TOP", AFKGameVersionArt.logo, "BOTTOM", 0, 4)
		AFKGameVersionArt.WoWVersiontext:SetTextColor(1, 1, 1)
		AFKGameVersionArt.WoWVersiontext:SetShadowColor(0, 0, 0)
		AFKGameVersionArt.WoWVersiontext:SetShadowOffset(1, -1)
		AFKGameVersionArt.WoWVersiontext:SetText(version)	
		
		if tocversion >= 10000 and tocversion <= 19999 then
			AFKGameVersionArt.logo:SetTexture(T.GetTexture("yLogoClassic"))
		elseif tocversion >= 20000 and tocversion <= 29999 then
			AFKGameVersionArt.logo:SetTexture(T.GetTexture("yLogoBurningCrusade"))
		elseif tocversion >= 30000 and tocversion <= 39999 then
			AFKGameVersionArt.logo:SetTexture(T.GetTexture("yLogoWotLK"))
		elseif tocversion >= 40000 and tocversion <= 49999 then
			AFKGameVersionArt.logo:SetTexture(T.GetTexture("yLogoCataclysm"))
		elseif tocversion >= 50000 and tocversion <= 59999 then
			AFKGameVersionArt.logo:SetTexture(T.GetTexture("yLogoMistsOfPandaria"))
		elseif tocversion >= 60000 and tocversion <= 69999 then
			AFKGameVersionArt.logo:SetTexture(T.GetTexture("yLogoWarlordsOfDraenor"))
		elseif tocversion >= 70000 and tocversion <= 79999 then
			AFKGameVersionArt.logo:SetTexture(T.GetTexture("yLogoLegion"))
		elseif tocversion >= 80000 and tocversion <= 89999 then
			AFKGameVersionArt.logo:SetTexture(T.GetTexture("yLogoBattleForAzeroth"))
		elseif tocversion >= 90000 and tocversion <= 99999 then
			AFKGameVersionArt.logo:SetTexture(T.GetTexture("yLogoShadowlands"))
		elseif tocversion >= 100000 and tocversion <= 109999 then
			AFKGameVersionArt.logo:SetTexture(T.GetTexture("yLogoDragonflight"))
		end

		if tocversion >= 10000 and tocversion <= 19999 then
			AFKGameVersionArt.ArtBG:SetTexture(T.GetTexture("zClassicBG"))
		elseif tocversion >= 20000 and tocversion <= 29999 then
			AFKGameVersionArt.ArtBG:SetTexture(T.GetTexture("zBurningCrusadeBG"))
		elseif tocversion >= 30000 and tocversion <= 39999 then
			AFKGameVersionArt.ArtBG:SetTexture(T.GetTexture("zWotLKBG"))
		elseif tocversion >= 40000 and tocversion <= 49999 then
			AFKGameVersionArt.ArtBG:SetTexture(T.GetTexture("zCataclysmBG"))
		elseif tocversion >= 50000 and tocversion <= 59999 then
			AFKGameVersionArt.ArtBG:SetTexture(T.GetTexture("zMistsOfPandariaBG"))
		elseif tocversion >= 60000 and tocversion <= 69999 then
			AFKGameVersionArt.ArtBG:SetTexture(T.GetTexture("zWarlordsOfDraenorBG"))
		elseif tocversion >= 70000 and tocversion <= 79999 then
			AFKGameVersionArt.ArtBG:SetTexture(T.GetTexture("zLegionBG"))
		elseif tocversion >= 80000 and tocversion <= 89999 then
			AFKGameVersionArt.ArtBG:SetTexture(T.GetTexture("zBattleForAzerothBG"))
		elseif tocversion >= 90000 and tocversion <= 99999 then
			AFKGameVersionArt.ArtBG:SetTexture(T.GetTexture("zShadowlandsBG"))
		elseif tocversion >= 100000 and tocversion <= 109999 then
			AFKGameVersionArt.ArtBG:SetTexture(T.GetTexture("zDragonFlightBG"))
		end
end

function AFK:AFKRightInfoPanel()
	local BottomPanel = AFK.BottomPanel
	local TopPanel = AFK.PanelTop
	local Font = C.Medias.Font
	local Name = AFK.Name
	local LocalTime = AFK.LocalTime
	local LocalDate = AFK.LocalDate
	local Version = AFK.Version
	local Time = AFK.Time
	local thickness = 1 
	local Texture = T.GetTexture(C["General"]["LineTexture"])
	
	local RightAFKFrame = CreateFrame("Frame", RightAFKFrame, self)
	RightAFKFrame:SetPoint("TOPRIGHT", TopPanel, "BOTTOMRIGHT", 0, -2)
	RightAFKFrame:SetPoint("BOTTOMRIGHT", BottomPanel, "TOPRIGHT", 0, 2)
	RightAFKFrame:SetWidth(500)
	RightAFKFrame:SetParent(BottomPanel)
	RightAFKFrame:CreateBackdrop("Transparent")
	RightAFKFrame:CreateShadow()

	if C["Skins"]["AFKFilter"] == true then 
		RightFilter = RightAFKFrame:CreateTexture(nil, "BACKGROUND")
		RightFilter:SetAllPoints()
		RightFilter:SetTexture([[Interface\AddOns\MaxUI\Medias\Textures\Overlay.tga]])
	end

	local Line = CreateFrame("StatusBar", "Line", RightAFKFrame)
	Line:CreateBackdrop()
	Line:SetHeight(thickness)
	Line:SetPoint("TOPLEFT", 10, -102)
	Line:SetPoint("TOPRIGHT", -10, -102)
	Line:SetFrameStrata("HIGH")
	Line:SetFrameLevel(3)
	Line:SetStatusBarTexture(Texture)
	Line:SetStatusBarColor(unpack(ClassColor))
	Line.Backdrop:CreateShadow()

	-- added MaxUI Logo and Style	
	RightAFKFrame.MaxUILogo = RightAFKFrame:CreateTexture(nil, "OVERLAY")
	RightAFKFrame.MaxUILogo:SetWidth(512)
	RightAFKFrame.MaxUILogo:SetHeight(256)
	RightAFKFrame.MaxUILogo:SetPoint("TOP", Line, "BOTTOM", 0, 0)
	RightAFKFrame.MaxUILogo:SetTexture([[Interface\AddOns\MaxUI\Medias\MaxUI\MaxUI_LOGO.tga]])

	local MaxUIVersion = RightAFKFrame:CreateFontString(nil, "OVERLAY")  
	MaxUIVersion:SetPoint("BOTTOM", RightAFKFrame.MaxUILogo, "BOTTOM", 0, 10)
	MaxUIVersion:SetFontTemplate(Font, 14, 1.25, 1.25)
	MaxUIVersion:SetText("Version: " ..T.MaxUIversion.."")

	local LineBottom = CreateFrame("StatusBar", "LineBottom", Line)
	LineBottom:CreateBackdrop()
	LineBottom:SetHeight(thickness)
	LineBottom:SetWidth(Line:GetWidth())
	LineBottom:SetPoint("TOP", RightAFKFrame.MaxUILogo, "BOTTOM", 0, -34)
	LineBottom:SetFrameStrata("HIGH")
	LineBottom:SetFrameLevel(2)
	LineBottom:SetStatusBarTexture(Texture)
	LineBottom:SetStatusBarColor(unpack(ClassColor))
	LineBottom.Backdrop:CreateShadow()

	-- tukui
	Name:ClearAllPoints()
	Name:SetPoint("BOTTOM", RightAFKFrame, "BOTTOM", 0, 96)
	Name:SetSize(128,128)
	
	Version:SetFontTemplate(Font, 14, 1.25, 1.25)
	Version:ClearAllPoints()
	Version:SetPoint("TOP", Name, "BOTTOM", 0, -10)
	
	Time:SetFontTemplate(Font, 14, 1.25, 1.25)
	Time:ClearAllPoints()
	Time:SetPoint("TOPLEFT", LocalDate, "BOTTOM", 0, -10)
	
	local AFKFor = RightAFKFrame:CreateFontString(nil, "OVERLAY")  
	AFKFor:SetPoint("TOPRIGHT", LocalDate, "BOTTOM", -0, -10)
	AFKFor:SetFontTemplate(Font, 14, 1.25, 1.25)
	AFKFor:SetText(""..ClassTextColor .."AFK for:")

	LocalTime:SetFontTemplate(Font, 24, 1.25, 1.25)
	LocalTime:ClearAllPoints()
	LocalTime:SetPoint("TOP", RightAFKFrame, "TOP", 0, -20)
	
	LocalDate:SetFontTemplate(Font, 14, 1.25, 1.25)
	LocalDate:ClearAllPoints()
	LocalDate:SetPoint("TOP", LocalTime, "BOTTOM", 0, -10)
end

function AFK:MaxUIStyleAFKSaver()
	local BottomPanel = AFK.BottomPanel
	local TopPanel = AFK.PanelTop

	if C["Skins"]["AFKFilter"] == true then 
		BottomPanel = BottomPanel:CreateTexture(nil, "BACKGROUND")
		BottomPanel:SetAllPoints()
		BottomPanel:SetTexture([[Interface\AddOns\MaxUI\Medias\Textures\Overlay.tga]])
		
		TopPanel = TopPanel:CreateTexture(nil, "BACKGROUND")
		TopPanel:SetAllPoints()
		TopPanel:SetTexture([[Interface\AddOns\MaxUI\Medias\Textures\Overlay.tga]])
	end
end

function AFK:MaxUIUpdate()
	local guildName, guildRankName, guildRankIndex = GetGuildInfo("player")	
	if (isGuildMember) then
		CharacterDescriptionGuild:SetText("Guild: " ..ClassTextColor..guildName)
		CharacterDescriptionGuild2:SetText("Guild rank: " ..ClassTextColor..guildRankName)
	end
end

local baseAFKOnUpdate = AFK.OnUpdate
function AFK:OnUpdate(Elapsed)
	baseAFKOnUpdate(self, Elapsed)

	self:MaxUIUpdate()
end

function AFK:Enable()
	baseEnable(self)

	if not C.Misc.AFKSaver then return end
	isAFK = UnitIsAFK("player")	

	if not (C.General.Themes.Value == "MaxUI") then return end
	self:MaxUIStyleAFKSaver()
	self:AFKPlayerInfoFrame()
	self:AFKRightInfoPanel()
end