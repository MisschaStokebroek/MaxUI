------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up AFK screen.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local AFK = T.Miscellaneous.AFK
local baseEnable = AFK.Enable
local ClassTextColor = T.RGBToHex(unpack(T.Colors.class[select(2, UnitClass("player"))]))
local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
local PlayerModelFrame = CreateFrame("Frame", PlayerModelFrame, self)
local myPlayerModel = CreateFrame("PlayerModel", nil, PlayerModelFrame)
local WelcomeMessage = "Thank you for using MaxUI.\n\n Check the HELP section for slash commands.\n\nFor more information, support or\nfeedback, go to www.tukui.org,\njoin the Tukui Discord or\n\n|cff2299ffMaxUI Discord|r: https://discord.gg/vzUFmUm \n\n|cffFFFF99colored items|r = MaxUI Theme or Unitframes only. "

T.MaxUIversion = GetAddOnMetadata("MaxUI", "Version")
myPlayerModel:SetUnit('player')
	myPlayerModel:ClearModel()
	myPlayerModel:SetUnit("player")
	myPlayerModel:SetFacing(1)
	myPlayerModel:SetCamDistanceScale(1)
	myPlayerModel:SetAlpha(1)

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

	myPlayerModel:SetParent(PlayerModelFrame)
	myPlayerModel:SetWidth(500)
	myPlayerModel:SetHeight(UIParent:GetHeight())
	myPlayerModel:SetPoint("BOTTOM", PlayerModelFrame, "BOTTOM", 0, -210)
	myPlayerModel:SetRotation(0.2)

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

	PlayerModelFrame.Logoclass = PlayerModelFrame:CreateTexture(nil, "ART")
	PlayerModelFrame.Logoclass:SetWidth(256)
	PlayerModelFrame.Logoclass:SetHeight(256)
	PlayerModelFrame.Logoclass:SetPoint("TOPLEFT", PlayerModelFrame, "TOPLEFT", -12, -122)

	if select(2, UnitClass('player')) == "DRUID" then
		PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\DRUID.tga]])
	end
	
	if select(2, UnitClass('player')) == "MONK" then
		PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\MONK.tga]])
	end
	
	if select(2, UnitClass('player')) == "ROGUE" then
		PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\ROGUE.tga]])
	end
	
	if select(2, UnitClass('player')) == "MAGE" then
		PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\MAGE.tga]])
	end
	
	if select(2, UnitClass('player')) == "PRIEST" then
		PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\PRIEST.tga]])
	end
	
	if select(2, UnitClass('player')) == "WARLOCK" then
		PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\WARLOCK.tga]])
	end
	
	if select(2, UnitClass('player')) == "SHAMAN" then
		PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\SHAMAN.tga]])
	end
	
	if select(2, UnitClass('player')) == "HUNTER" then
		PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\HUNTER.tga]])
	end
	
	if select(2, UnitClass('player')) == "DEATHKNIGHT" then
		PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\DEATHKNIGHT.tga]])
	end
	
	if select(2, UnitClass('player')) == "WARRIOR" then
		PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\WARRIOR.tga]])
	end

	if select(2, UnitClass('player')) == "PALADIN" then
		PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\PALADIN.tga]])
	end

	if select(2, UnitClass('player')) == "DEMONHUNTER" then
		PlayerModelFrame.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\DEMONHUNTER.tga]])
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

		RightAFKFrame.MaxUIWelcometext = RightAFKFrame:CreateFontString(nil, "OVERLAY")
		RightAFKFrame.MaxUIWelcometext:SetFontTemplate(C.Medias.Font, 14, 1.25, 1.25)
		RightAFKFrame.MaxUIWelcometext:SetPoint("TOP", LineBottom, "BOTTOM", 0, -48)
		RightAFKFrame.MaxUIWelcometext:SetTextColor(1, 1, 1)
		RightAFKFrame.MaxUIWelcometext:SetShadowColor(0, 0, 0)
		RightAFKFrame.MaxUIWelcometext:SetShadowOffset(1, -1)
		RightAFKFrame.MaxUIWelcometext:SetText(WelcomeMessage)	


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
	local PlayerModelFrame = AFK.PlayerModelFrame
	local RightAFKFrame = AFK.RightAFKFrame

	if C["Skins"]["AFKFilter"] == true then 
		CenterFilter = BottomPanel:CreateTexture(nil, "BACKGROUND")
		CenterFilter:SetPoint("TOPLEFT", TopPanel, "BOTTOMLEFT", 500, 0)
		CenterFilter:SetPoint("BOTTOMRIGHT", BottomPanel, "TOPRIGHT", -500, 0)
		CenterFilter:SetTexture([[Interface\AddOns\MaxUI\Medias\Textures\Overlay.tga]])
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
	-- Tukui
	baseEnable(self)

	if not C.Misc.AFKSaver then return end
	isAFK = UnitIsAFK("player")	

	-- MaxUI
	if not (C.General.Themes.Value == "MaxUI") then return end
	self:MaxUIStyleAFKSaver()
	self:AFKPlayerInfoFrame()
	self:AFKRightInfoPanel()
end