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

-- MaxUI Welcome
T.version = GetAddOnMetadata("Tukui", "Version")
T.MaxUIversion = GetAddOnMetadata("MaxUI", "Version")
local MaxUIVersion = "version "..T.MaxUIversion..""
local TukuiVersion = "version "..T.version..""
local GameVersion = GameVersion
if T.Retail then
	GameVersion	= "|cffFFFF99~Retail~|r" 
elseif T.BCC then
	GameVersion	= "|cffFFFF99~The Burning Crusade Classic~|r" 
else
	GameVersion	= "|cffFFFF99~Classic Era~|r" 
end

local WelcomeMessage = "Thank you for using MaxUI.\n\n Check the HELP section for slash commands.\n\nFor more information, support or\nfeedback, go to www.tukui.org,\njoin the Tukui Discord or\n\n|cff2299ffMaxUI Discord|r: https://discord.gg/vzUFmUm \n\n|cffFFFF99colored items|r = MaxUI Theme or Unitframes only. "

-- media
local Texture = C.Medias.Normal
local HeaderColor = {0.43, 0.43, 0.43}
local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
local HexClassColor = T.RGBToHex(unpack(T.Colors.class[T.MyClass]))

------------------------------------------------------------------------------------------
-- EXTRA HEADER/FOOTER
------------------------------------------------------------------------------------------
local HeaderText = "Global User Interface"

local function ExtendedGUI()	

	-- fade duration
	TukuiGUI.FadeIn:SetDuration(C["General"]["FaderTime"])
	TukuiGUI.FadeOut:SetDuration(C["General"]["FaderTime"])
	
	-- reposition
	TukuiGUI:ClearAllPoints()
	TukuiGUI:SetFrameStrata("TOOLTIP")
	TukuiGUI:SetPoint("TOP", UIParent, "TOP", 0, -28)

	-- header
	if C["General"]["ClassColorHeaders"]["Value"] == "Dark" then 
		TukuiGUI.Header.Backdrop:SetBackdropColor(0.11, 0.11, 0.11)
	elseif C["General"]["ClassColorHeaders"]["Value"] == "ClassColor" then 
		TukuiGUI.Header.Backdrop:SetBackdropColor(unpack(ClassColor))
	elseif C["General"]["ClassColorHeaders"]["Value"] == "BackdropColor" then 
		TukuiGUI.Header.Backdrop:SetBackdropColor(unpack(C.General.BackdropColor))
	else
		TukuiGUI.Header.Backdrop:SetBackdropColor(0.43, 0.43, 0.43)
	end
	
	TukuiGUI.Header.Label:SetText(HeaderText)
	
	TukuiGUI.Header:SetScript("OnEnter", function(self)
		if C["General"]["ClassColorHeaders"]["Value"] == "Dark" then 
			TukuiGUI.Header.Label:SetTextColor(0.43, 0.43, 0.43)
			TukuiGUI.Header.Backdrop:SetBorderColor(0.43, 0.43, 0.43)
		elseif C["General"]["ClassColorHeaders"]["Value"] == "ClassColor" then 
			TukuiGUI.Header.Label:SetTextColor(unpack(ClassColor))
			TukuiGUI.Header.Backdrop:SetBorderColor(unpack(ClassColor))
		elseif C["General"]["ClassColorHeaders"]["Value"] == "BackdropColor" then 
			TukuiGUI.Header.Label:SetTextColor(unpack(C.General.BackdropColor))
			TukuiGUI.Header.Backdrop:SetBorderColor(unpack(C.General.BackdropColor))
		else
			TukuiGUI.Header.Label:SetTextColor(0.43, 0.43, 0.43)
			TukuiGUI.Header.Backdrop:SetBorderColor(0.43, 0.43, 0.43)
		end
	end)
	
	TukuiGUI.Header:SetScript("OnLeave", function(self)
		TukuiGUI.Header.Label:SetTextColor(1, 1, 1)
		TukuiGUI.Header.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
	end)
	
	TukuiGUI.Header:RegisterForDrag("LeftButton")
	TukuiGUI.Header:SetScript("OnDragStart", function() TukuiGUI:StartMoving() end)
	TukuiGUI.Header:SetScript("OnDragStop", function() TukuiGUI:StopMovingOrSizing() end)

	-- bottom drag
	TukuiGUI.Bottom = CreateFrame("Frame", nil, TukuiGUI)
	TukuiGUI.Bottom:CreateBackdrop(nil, Texture)
	TukuiGUI.Bottom:CreateShadow()
	TukuiGUI.Bottom:SetFrameStrata("DIALOG")
	TukuiGUI.Bottom:SetWidth(TukuiGUI.Header:GetWidth())
	TukuiGUI.Bottom:SetHeight(22)
	TukuiGUI.Bottom:SetPoint("TOP", TukuiGUI, "BOTTOM", 0, -19)
		if C["General"]["ClassColorHeaders"]["Value"] == "Dark" then 
			TukuiGUI.Bottom.Backdrop:SetBackdropColor(0.11, 0.11, 0.11)
		elseif C["General"]["ClassColorHeaders"]["Value"] == "ClassColor" then 
			TukuiGUI.Bottom.Backdrop:SetBackdropColor(unpack(ClassColor))
		elseif C["General"]["ClassColorHeaders"]["Value"] == "BackdropColor" then 
			TukuiGUI.Bottom.Backdrop:SetBackdropColor(unpack(C.General.BackdropColor))
		else
			TukuiGUI.Bottom.Backdrop:SetBackdropColor(0.43, 0.43, 0.43)
		end

	--button mouseaction (mousover or click)
	TukuiGUI.Bottom:SetScript("OnEnter", function(self)
		if C["General"]["ClassColorHeaders"]["Value"] == "Dark" then 
			TukuiGUI.Bottom.Backdrop:SetBorderColor(0.43, 0.43, 0.43)
		elseif C["General"]["ClassColorHeaders"]["Value"] == "ClassColor" then 
			TukuiGUI.Bottom.Backdrop:SetBorderColor(unpack(ClassColor))
		elseif C["General"]["ClassColorHeaders"]["Value"] == "BackdropColor" then 
			TukuiGUI.Bottom.Backdrop:SetBorderColor(unpack(C.General.BackdropColor))
		else
			TukuiGUI.Bottom.Backdrop:SetBorderColor(0.43, 0.43, 0.43)
		end
	end)
	
	TukuiGUI.Bottom:SetScript("OnLeave", function(self)
		TukuiGUI.Bottom.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
	end)

	TukuiGUI.Bottom:RegisterForDrag("LeftButton")
	TukuiGUI.Bottom:SetScript("OnDragStart", function() TukuiGUI:StartMoving() end)
	TukuiGUI.Bottom:SetScript("OnDragStop", function() TukuiGUI:StopMovingOrSizing() end)

	TukuiGUI.Close.Label:Hide()
	
	TukuiGUI.CloseIcon = TukuiGUI.Header:CreateTexture(nil, "ART")
	TukuiGUI.CloseIcon:SetWidth(11)
	TukuiGUI.CloseIcon:SetHeight(11)
	TukuiGUI.CloseIcon:SetPoint("RIGHT", TukuiGUI.Header, "RIGHT", -8, 0)
	TukuiGUI.CloseIcon:SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\Close.tga]])
	
	TukuiGUI.Close:SetScript("OnEnter", function(self)
		TukuiGUI.CloseIcon:SetVertexColor(1, 0, 0)
	end)
	
	TukuiGUI.Close:SetScript("OnLeave", function(self)
		TukuiGUI.CloseIcon:SetVertexColor(1, 1, 1)
	end)
end	
hooksecurefunc(GUI, "Enable", ExtendedGUI)

------------------------------------------------------------------------------------------
-- WELCOME WINDOW
------------------------------------------------------------------------------------------
local MaxUIWelcome = function(self)
	local Window = self:CreateWindow("   |cffFFFF99MaxUI|r   ", true)
	
	Window.Logomaxui = Window:CreateTexture(nil, "OVERLAY")
	Window.Logomaxui:SetWidth(Window:GetWidth()-4)
	Window.Logomaxui:SetHeight((Window:GetWidth()-4)/2)
	Window.Logomaxui:SetPoint("TOP", Window, "TOP", 0, -4)
	Window.Logomaxui:SetTexture(T.GetTexture("MaxUI"))

	Window.LogoGameVersionBG = Window:CreateTexture(nil, "ART")
	Window.LogoGameVersionBG:SetInside(Window)
	Window.LogoGameVersionBG:SetAlpha(0.4)

	if T.Retail then
		Window.LogoGameVersionBG:SetTexture(T.GetTexture("RetailBG"))
	elseif T.BCC then
		Window.LogoGameVersionBG:SetTexture(T.GetTexture("BCCBG"))
	else
		Window.LogoGameVersionBG:SetTexture(T.GetTexture("ClassicBG"))
	end

		Window.MaxUIGameVersiontext = Window:CreateFontString(nil, "OVERLAY")
		Window.MaxUIGameVersiontext:SetFontTemplate(C.Medias.Font, 16, 1.25, 1.25)
		Window.MaxUIGameVersiontext:SetPoint("TOP", Window.Logomaxui, "CENTER", 0, -84)
		Window.MaxUIGameVersiontext:SetTextColor(1, 1, 1)
		Window.MaxUIGameVersiontext:SetShadowColor(0, 0, 0)
		Window.MaxUIGameVersiontext:SetShadowOffset(1, -1)
		Window.MaxUIGameVersiontext:SetText(GameVersion)	

		Window.MaxUIVersiontext = Window:CreateFontString(nil, "OVERLAY")
		Window.MaxUIVersiontext:SetFontTemplate(C.Medias.Font, 12, 1.25, 1.25)
		Window.MaxUIVersiontext:SetPoint("TOP", Window.Logomaxui, "CENTER", 0, -104)
		Window.MaxUIVersiontext:SetTextColor(1, 1, 1)
		Window.MaxUIVersiontext:SetShadowColor(0, 0, 0)
		Window.MaxUIVersiontext:SetShadowOffset(1, -1)
		Window.MaxUIVersiontext:SetText(MaxUIVersion)	

	Window.Logotukui = Window:CreateTexture(nil, "OVERLAY")
	Window.Logotukui:SetWidth(148)
	Window.Logotukui:SetHeight(148)
	Window.Logotukui:SetPoint("BOTTOM", Window, "BOTTOM", 0, 42)
	Window.Logotukui:SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\logo.blp]])

		Window.TukuiVersiontext = Window:CreateFontString(nil, "OVERLAY")
		Window.TukuiVersiontext:SetFontTemplate(C.Medias.Font, 12, 1.25, 1.25)
		Window.TukuiVersiontext:SetPoint("BOTTOM", Window, "BOTTOM", 0, 24)
		Window.TukuiVersiontext:SetTextColor(1, 1, 1)
		Window.TukuiVersiontext:SetShadowColor(0, 0, 0)
		Window.TukuiVersiontext:SetShadowOffset(1, -1)
		Window.TukuiVersiontext:SetText(TukuiVersion)	

		Window.MaxUIWelcometext = Window:CreateFontString(nil, "OVERLAY")
		Window.MaxUIWelcometext:SetFontTemplate(C.Medias.Font, 14, 1.25, 1.25)
		Window.MaxUIWelcometext:SetPoint("TOP", Window, "CENTER", 0, 0)
		Window.MaxUIWelcometext:SetTextColor(1, 1, 1)
		Window.MaxUIWelcometext:SetShadowColor(0, 0, 0)
		Window.MaxUIWelcometext:SetShadowOffset(1, -1)
		Window.MaxUIWelcometext:SetText(WelcomeMessage)	
end
GUI:AddWidgets(MaxUIWelcome)

------------------------------------------------------------------------------------------
-- HELP WINDOW
------------------------------------------------------------------------------------------
local Texts = {}
local Count = 1

L.Help.Grid = "|cff00ff00/tukui grid|r or |cff00ff00/tukui grid 128|r : Display a grid which allow you to better align frames."
L.Help.Status = "|cff00ff00/tukui status|r or |cff00ff00/tukui debug|r : Show a debug window with information about debugging the UI"

L.MaxUIHelp = {} -- /maxui help
L.MaxUIHelp.Print = "|cffffff99/maxui|r : Print the MaxUI commands in chat"
L.MaxUIHelp.DataCenter = "|cffffff99/maxui datacenter|r or |cffffff99/maxui dc|r : Open the MaxUI data center"
L.MaxUIHelp.GameMenu = "|cffffff99/maxui gamemenu|r or |cffffff99/maxui gm|r : Open the MaxUI game menu"
L.MaxUIHelp.RaidTools = "|cffffff99/maxui raidtools|r or |cffffff99/maxui rt|r : Open the MaxUI raid tools"
L.MaxUIHelp.BuffTracker = "|cffffff99/maxui bufftracker|r or |cffffff99/maxui bt|r : Open the MaxUI buff tracker"


local MaxUIHelp = function(self)
	local Window = self:CreateWindow("  |cffFFFF99Help|r  ", false)

	Window.Logomaxui = Window:CreateTexture(nil, "ART")
	Window.Logomaxui:SetWidth(Window:GetWidth()-4)
	Window.Logomaxui:SetHeight((Window:GetWidth()-4)/2)
	Window.Logomaxui:SetPoint("TOP", Window, "TOP", 0, -4)
	Window.Logomaxui:SetTexture(T.GetTexture("MaxUI"))

	Window.Logotukui = Window:CreateTexture(nil, "OVERLAY")
	Window.Logotukui:SetWidth(148)
	Window.Logotukui:SetHeight(148)
	Window.Logotukui:SetPoint("BOTTOM", Window, "BOTTOM", 0, 42)
	Window.Logotukui:SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\logo.blp]])
	
	for Index, Value in pairs(L.MaxUIHelp) do
		Texts[Index] = Window:CreateFontString(nil, "OVERLAY")
		Texts[Index]:SetFont(C.Medias.Font, 11, "THINOUTLINE")
		Texts[Index]:SetPoint("BOTTOMLEFT", Window, "BOTTOMLEFT", 4, 23 * Count)
		Texts[Index]:SetText(Value)
		
		Count = Count + 1
	end
	for Index, Value in pairs(L.Help) do
		Texts[Index] = Window:CreateFontString(nil, "OVERLAY")
		Texts[Index]:SetFont(C.Medias.Font, 11, "THINOUTLINE")
		Texts[Index]:SetPoint("BOTTOMLEFT", Window, "BOTTOMLEFT", 4, 23 * Count)
		Texts[Index]:SetText(Value)
		
		Count = Count + 1
	end
end
GUI:AddWidgets(MaxUIHelp)

------------------------------------------------------------------------------------------
-- ADDONS	
------------------------------------------------------------------------------------------
if IsAddOnLoaded( 'AddOnSkins', 'AdvancedInterfaceOptions', 'AstralKeys', 'Auctionator', 'BugSack', 'Clique', 'DBM-Core', 'Details', 'Hekili', 'Immersion', 'ls_Toasts', 'Leatrix_Plus', 'Pawn', 'ProjectAzilroka', 'RSA', 'Simulationcraft', 'WeakAuras', 'WorldQuestsList', 'WorldQuestTab') then

	local AddOns = function(self)
		local Window = self:CreateWindow(" |cffFFFF99AddOns|r ")

		Window:CreateSection("All", "MaxUI connected AddOns")
		
		if IsAddOnLoaded('AddOnSkins') then 
			Window:CreateSectionButton("All", "open", "AddonSkins", GUI.OpenConfigAddOnSkins)	
		end

		if IsAddOnLoaded('AdvancedInterfaceOptions') then 
			Window:CreateSectionButton("All", "open", "Advanced Interface Options", GUI.OpenConfigAdvancedInterfaceOptions)
		end

		if IsAddOnLoaded('AstralKeys') then 
			Window:CreateSectionButton("All", "open", "Astral Keys", GUI.OpenConfigAstralKeys)
		end

		if IsAddOnLoaded('Auctionator') then 
			Window:CreateSectionButton("All", "open", "Auctionator", GUI.OpenConfigAuctionator)
		end
		
		if IsAddOnLoaded('BugSack') then 
			Window:CreateSectionButton("All", "open", "BugSack", GUI.OpenConfigBugSack)
		end
		
		if IsAddOnLoaded('Clique') then 
			Window:CreateSectionButton("All", "open", "Clique", GUI.OpenConfigClique)
		end

		if IsAddOnLoaded('DBM-Core') then 
			Window:CreateSectionButton("All", "open", "Deadly Boss Mods", GUI.OpenConfigDBM)	
		end
		
		if IsAddOnLoaded('Details') then 
			Window:CreateSectionButton("All", "open", "Details!", GUI.OpenConfigDetails)	
		end

		if IsAddOnLoaded('Hekili') then 
			Window:CreateSectionButton("All", "open", "Hekili", GUI.OpenConfigHekili)	
		end

		if IsAddOnLoaded('Immersion') then 
			Window:CreateSectionButton("All", "open", "Immersion", GUI.OpenConfigImmersion)	
		end

		if IsAddOnLoaded('Leatrix_Plus') then 
			Window:CreateSectionButton("All", "open", "Leatrix Plus", GUI.OpenConfigLeatrixPlus)
		end

		if IsAddOnLoaded('ls_Toasts') then 
			Window:CreateSectionButton("All", "open", "LS: Toasts", GUI.OpenConfigLSToasts)	
		end

		if IsAddOnLoaded('Pawn') then 
			Window:CreateSectionButton("All", "open", "Pawn", GUI.OpenConfigPawn)
		end

		if IsAddOnLoaded('ProjectAzilroka') then 
			Window:CreateSectionButton("All", "open", "Project Azilroka", GUI.OpenConfigProjectAzilroka)
		end

		if IsAddOnLoaded('Questie') then 
			Window:CreateSectionButton("All", "open", "Questie", GUI.OpenConfigQuestie)	
		end
		

		if IsAddOnLoaded('RSA') then 
			Window:CreateSectionButton("All", "open", "Raelli's Spell Announcer", GUI.OpenConfigRSA)	
		end
		
		if IsAddOnLoaded('Simulationcraft') then 
			Window:CreateSectionButton("All", "open", "SimCraft", GUI.OpenConfigSimCraft)	
		end

		if IsAddOnLoaded('WeakAuras') then 
			Window:CreateSectionButton("All", "open", "WeakAuras", GUI.OpenConfigWeakAuras)	
		end

		if IsAddOnLoaded('WorldQuestsList') then 
			Window:CreateSectionButton("All", "open", "World Quest List", GUI.OpenConfigWorldQuestList)
		end
		
		if IsAddOnLoaded('WorldQuestTab') then 
			Window:CreateSectionButton("All", "open", "World Quest Tab", GUI.OpenConfigWorldQuestTab)
		end

		local Explanation = CreateFrame("Frame", "Explanation", Window)
		Explanation:SetPoint("BOTTOMLEFT", Window, "BOTTOMLEFT", 16, 16)
		Explanation:SetPoint("BOTTOMRIGHT", Window, "BOTTOMRIGHT", -16, 16)
		Explanation:SetHeight(120)
		Explanation:SetFrameStrata("FULLSCREEN")
		Explanation:SetFrameLevel(15)
		Explanation:CreateBackdrop("Transparent")
		Explanation:EnableMouse(true)

		Explanation.Text = Explanation:CreateFontString(nil, "OVERLAY")
		Explanation.Text:SetFont(C.Medias.Font, 12)
		Explanation.Text:SetPoint("LEFT", Explanation, "LEFT", 16, 0)
		Explanation.Text:SetTextColor(1, 1, 1)
		Explanation.Text:SetShadowColor(0, 0, 0)
		Explanation.Text:SetShadowOffset(1.25, -1.25)
		Explanation.Text:SetJustifyH("LEFT")
		Explanation.Text:SetText("|cffFFFF99NOTE:|r \n\nShortcuts to other addons and their configuration.")	
		
		Explanation.Logomaxui = Explanation:CreateTexture(nil, "ART")
		Explanation.Logomaxui:SetWidth(96)
		Explanation.Logomaxui:SetHeight(48)
		Explanation.Logomaxui:SetPoint("RIGHT", Explanation, "TOPRIGHT", -16, 0)
		Explanation.Logomaxui:SetTexture(T.GetTexture("MaxUI"))
	end
	GUI:AddWidgets(AddOns)
end

------------------------------------------------------------------------------------------
-- CONFIGURATION SECTION
------------------------------------------------------------------------------------------
local MaxUIConfig = function(self)
	local Window = self:CreateWindow(" |cffFFFF99Config|r ")

	Window:CreateSection("All", "Mode")
	Window:CreateDropdown("All", "ConfigMenu", "Style", "Set configuration mode")
	
	Window:CreateSection("All", "Tukui/MaxUI settings")
	Window:CreateSectionButton("All", "Default", "Reset Tukui/MaxUI to default settings", GUI.TotalReset)	
	Window:CreateSectionButton("All", "Test", "Run test mode", GUI.TukuiTest)	

	Window:CreateSection("All", "Chat settings")
	Window:CreateSectionButton("All", "Default", "Reset chat to default settings", GUI.ChatSetupReset)	

	Window:CreateSection("All", "Datatext settings")
	Window:CreateSectionButton("All", "Default", "Set all datatexts to default", GUI.DatatextSetupDefault)	
	Window:CreateSectionButton("All", "Config", "Open datatext configuration mode", GUI.DatatextSetupConfig)	
	Window:CreateSectionButton("All", "Gold Reset", "Reset gold datatext", GUI.DatatextSetupGoldReset)	

	Window:CreateSection("All", "Tukui/MaxUI tools")
	Window:CreateSectionButton("All", "Keybinds", "Open hover keybinds", GUI.TukuiKeybinds)	
	Window:CreateSectionButton("All", "Debuff tracking", "Open raid debuff tracking tool", GUI.TukuiDebuffTracking)	
	Window:CreateSectionButton("All", "Markers", "Open Tukui markers", GUI.TukuiMarkers)	
	Window:CreateSectionButton("All", "Micromenu", "Open Tukui Micromenu", GUI.TukuiMicroMenu)	
	Window:CreateSectionButton("All", "AFK", "Run afk mode", GUI.AFK)	


	Window:CreateSection("All", "Move & Grid settings")
	Window:CreateSectionButton("All", "Move", "Enable movable elements", GUI.TukuiMove)	
	Window:CreateSectionButton("All", "Standard", "Standard alignment grid", GUI.TukuiGrid)	
	Window:CreateSectionButton("All", "24", "", GUI.TukuiGrid24)	
	Window:CreateSectionButton("All", "48", "", GUI.TukuiGrid48)	
	Window:CreateSectionButton("All", "64", "", GUI.TukuiGrid64)	
	Window:CreateSectionButton("All", "96", "", GUI.TukuiGrid96)	
	Window:CreateSectionButton("All", "128", "", GUI.TukuiGrid128)	

	if C["ConfigMenu"]["Style"]["Value"] == "Developer" then
		Window:CreateSection("All", "Developer settings")
		Window:CreateSectionButton("All", "Help", "Print Tukui help in chat", GUI.TukuiPrint)	
		Window:CreateSectionButton("All", "Status", "Tukui status report", GUI.TukuiStatus)	
		Window:CreateSectionButton("All", "Frame Stack", "Run frame stack tool", GUI.FStack)	
		Window:CreateSectionButton("All", "Trace Events", "Tukui trace events (chat)", GUI.TukuiTraceEvents)	
	end
	
	local Explanation = CreateFrame("Frame", "Explanation", Window)
	Explanation:SetPoint("BOTTOMLEFT", Window, "BOTTOMLEFT", 16, 16)
	Explanation:SetPoint("BOTTOMRIGHT", Window, "BOTTOMRIGHT", -16, 16)
	Explanation:SetHeight(120)
	Explanation:SetFrameStrata("FULLSCREEN")
	Explanation:SetFrameLevel(15)
	Explanation:CreateBackdrop("Transparent")
	Explanation:EnableMouse(true)

	Explanation.Text = Explanation:CreateFontString(nil, "OVERLAY")
	Explanation.Text:SetFont(C.Medias.Font, 12)
	Explanation.Text:SetPoint("LEFT", Explanation, "LEFT", 16, 0)
	Explanation.Text:SetTextColor(1, 1, 1)
	Explanation.Text:SetShadowColor(0, 0, 0)
	Explanation.Text:SetShadowOffset(1.25, -1.25)
	Explanation.Text:SetJustifyH("LEFT")
	Explanation.Text:SetText("|cffFFFF99NOTE:|r \n\nMost of these options are also accessable as slash commands,\ncheck the Help section for more info.")	
	
	Explanation.Logomaxui = Explanation:CreateTexture(nil, "ART")
	Explanation.Logomaxui:SetWidth(96)
	Explanation.Logomaxui:SetHeight(48)
	Explanation.Logomaxui:SetPoint("RIGHT", Explanation, "TOPRIGHT", -16, 0)
	Explanation.Logomaxui:SetTexture(T.GetTexture("MaxUI"))
end
GUI:AddWidgets(MaxUIConfig)

------------------------------------------------------------------------------------------
-- PROFILES
------------------------------------------------------------------------------------------
local Profiles = function(self)
	local Profiles = T.Profiles
	local BrightColor = {0.35, 0.35, 0.35}
	local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
	local baseProfilesEnable = Profiles.Enable
	local EditBox = Profiles:GetParent().EditBox
	
	local Window = self:CreateWindow(" |cffFFFF99Profiles|r ")
	Window:HookScript("OnShow", GUI.ProfilesShow)
	Window:HookScript("OnHide", GUI.ProfilesHide)

	Window:CreateSection("All", "Profiles")
	local Profile = Window:CreateDropdown("All", "General", "Profiles", "Import a profile from another character")
	Profile.Menu:HookScript("OnHide", GUI.SetProfile)

	Window:CreateSection("All", "IMPORT/EXPORT")

	function Profiles:Enable()
		baseProfilesEnable(self)
		
		self:ClearAllPoints()
		self:SetParent(Window)
		self:SetPoint("BOTTOM", Window, "BOTTOM", 0, 0)
		
		self.Logo:Kill()
		self.Title:SetFont(C.Medias.Font, 12, "")
		self.Title:ClearAllPoints()
		self.Title:SetPoint("TOP", Window, "TOP", 0, -96)
		self.Description:SetFont(C.Medias.Font, 12, "")
		self.Status:SetFont(C.Medias.Font, 12, "")
		self.Status:SetTextColor(1, 1, 1)

		self.EditBox.Backdrop:SetBorderColor(0.43, 0.43, 0.43)
		self.EditBox:ClearAllPoints()
		self.EditBox:SetPoint("TOP", self.Status, "BOTTOM", 0, -4)
		
		self.Backdrop:Kill()
		self.Shadow:Kill()
		
		self.Close:Kill()
		self.Reset.Shadow:Kill()
		self.Apply.Shadow:Kill()
		
		self.Reset:SetHeight(20)
		self.Reset:SetWidth(244)
		self.Reset.Backdrop.Texture = self.Reset.Backdrop:CreateTexture(nil, "ART")
		self.Reset.Backdrop.Texture:SetInside(self.Reset.Backdrop)
		self.Reset.Backdrop.Texture:SetTexture(T.GetTexture(C["General"]["TextureButton"]))
		self.Reset.Backdrop.Texture:SetVertexColor(unpack(BrightColor))
	
		self.Apply:SetHeight(20)
		self.Apply:SetWidth(244)
		self.Apply.Backdrop.Texture = self.Apply.Backdrop:CreateTexture(nil, "ART")
		self.Apply.Backdrop.Texture:SetInside(self.Apply.Backdrop)
		self.Apply.Backdrop.Texture:SetTexture(T.GetTexture(C["General"]["TextureButton"]))
		self.Apply.Backdrop.Texture:SetVertexColor(unpack(BrightColor))
		
	end
end
GUI:AddWidgets(Profiles)

------------------------------------------------------------------------------------------
-- QUICK SETUP	
------------------------------------------------------------------------------------------
local QuickSetup = function(self)
	local Window = self:CreateWindow(" |cffFFFF99Quick Setup|r ")

	Window:CreateSection("All", "Step 1: Role / Playstyle")
	Window:CreateDropdown("All", "Layout", "LayoutRole", "Set role / playstyle")

	Window:CreateSection("All", "Step 2: Actionbar positioning")
	Window:CreateDropdown("All", "Layout", "LayoutAB", "Set position(s) for certain actionbars")

	Window:CreateSection("All", "Step 3: Customize layout")
	Window:CreateDropdown("All", "Layout", "LayoutCustomize", "Set customize state for layouts / actionbars")

	Window:CreateSection("All", "Step 4: Unitframes orientation")
	if (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then
		Window:CreateDropdown("All", "UnitFrames", "HorVer", "|cffFFFF99Set unitframes orientation|r")
		Window:CreateDropdown("All", "ClassOptions", "ClassResourcesOrientation", "|cffFFFF99Set class resources orientation|r")
	end

	Window:CreateSection("All", "Step 5: Unitframes anchoring")
	Window:CreateSlider("All", "UnitFrames", "MaxUIAnchorWidth", "|cffFFFFFFSet horizontal offset for player and target|r", -1000, 1000, 1)
	Window:CreateSlider("All", "UnitFrames", "MaxUIAnchorVertical", "|cffFFFFFFSet vertical offset for player and target|r", -1000, 1000, 1)
	
	Window:CreateSection("All", "Step 6: Unitframes customization")
	Window:CreateDropdown("All", "UnitFrames", "Colorstyle", "Set color style for all unitframes")

	local Explanation = CreateFrame("Frame", "Explanation", Window)
	Explanation:SetPoint("BOTTOMLEFT", Window, "BOTTOMLEFT", 16, 16)
	Explanation:SetPoint("BOTTOMRIGHT", Window, "BOTTOMRIGHT", -16, 16)
	Explanation:SetHeight(120)
	Explanation:SetFrameStrata("FULLSCREEN")
	Explanation:SetFrameLevel(15)
	Explanation:CreateBackdrop("Transparent")
	Explanation:EnableMouse(true)

	Explanation.Text = Explanation:CreateFontString(nil, "OVERLAY")
	Explanation.Text:SetFont(C.Medias.Font, 12)
	Explanation.Text:SetPoint("LEFT", Explanation, "LEFT", 16, 0)
	Explanation.Text:SetTextColor(1, 1, 1)
	Explanation.Text:SetShadowColor(0, 0, 0)
	Explanation.Text:SetShadowOffset(1.25, -1.25)
	Explanation.Text:SetJustifyH("LEFT")
	Explanation.Text:SetText("|cffFFFF99NOTE:|r \n\nWhen step 3 is set to 'locked', actionbars can not be modified in the actionbar section.\n\nThe Tukui layout doesn't have actionbar adjustments.")	
	
	Explanation.Logomaxui = Explanation:CreateTexture(nil, "ART")
	Explanation.Logomaxui:SetWidth(96)
	Explanation.Logomaxui:SetHeight(48)
	Explanation.Logomaxui:SetPoint("RIGHT", Explanation, "TOPRIGHT", -16, 0)
	Explanation.Logomaxui:SetTexture(T.GetTexture("MaxUI"))
end
GUI:AddWidgets(QuickSetup)

------------------------------------------------------------------------------------------
-- SKINS	
------------------------------------------------------------------------------------------
local MaxUISkins = function(self)
	local Window = self:CreateWindow(" |cffFFFF99Skins|r")

	Window:CreateSection("All", "AddonSkins")
	Window:CreateSwitch("All", "Skins", "MaxUIAddOnSkins", "Enable MaxUI style for AddonSkins")
	Window:CreateDropdown("All", "Skins", "Color", "|cffFFFF99Set color theme for skins|r")

	Window:CreateSection("All", "Filters")
	Window:CreateSwitch("All", "Skins", "MinimapFilter", "Enable a shadowy filter for the minimap")
	Window:CreateSwitch("All", "Skins", "ChatFilter", "Enable a shadowy filter for the chat panels")
	Window:CreateSwitch("All", "Skins", "AFKFilter", "Enable a shadowy filter for the afk screen")
	Window:CreateSlider("All", "Skins", "FilterAlpha", "Set filter alpha|r", 0, 1, 0.1)
	
	Window:CreateSection("All", "Screen Filter")
	Window:CreateSwitch("All", "Skins", "UIParentFilter", "Enable a shadowy filter for the screen")
	Window:CreateSlider("All", "Skins", "FilterSize", "Set screen filter size|r", 0, 300, 2)
	Window:CreateColorSelection("All", "Skins", "ScreenFilterColor", "Set screen filter color|r")
	Window:CreateSlider("All", "Skins", "ScreenFilterAlpha", "Set screen filter alpha|r", 0, 1, 0.1)
	
	
	local Explanation = CreateFrame("Frame", "Explanation", Window)
	Explanation:SetPoint("BOTTOMLEFT", Window, "BOTTOMLEFT", 16, 16)
	Explanation:SetPoint("BOTTOMRIGHT", Window, "BOTTOMRIGHT", -16, 16)
	Explanation:SetHeight(120)
	Explanation:SetFrameStrata("FULLSCREEN")
	Explanation:SetFrameLevel(15)
	Explanation:CreateBackdrop("Transparent")
	Explanation:EnableMouse(true)

	Explanation.Text = Explanation:CreateFontString(nil, "OVERLAY")
	Explanation.Text:SetFont(C.Medias.Font, 12)
	Explanation.Text:SetPoint("LEFT", Explanation, "LEFT", 16, 0)
	Explanation.Text:SetTextColor(1, 1, 1)
	Explanation.Text:SetShadowColor(0, 0, 0)
	Explanation.Text:SetShadowOffset(1.25, -1.25)
	Explanation.Text:SetJustifyH("LEFT")
	Explanation.Text:SetText("|cffFFFF99NOTE:|r \n\nMaxUI modifies AddonSkins to skin Blizzard frames and addons.\nThe style of MaxUI is applied to those skins.\nTo disable skins or for more options, go to the AddonSkins interface.\n\nNot all skins are working or finished.")	
	
	Explanation.Logomaxui = Explanation:CreateTexture(nil, "ART")
	Explanation.Logomaxui:SetWidth(96)
	Explanation.Logomaxui:SetHeight(48)
	Explanation.Logomaxui:SetPoint("RIGHT", Explanation, "TOPRIGHT", -16, 0)
	Explanation.Logomaxui:SetTexture(T.GetTexture("MaxUI"))
	
		if IsAddOnLoaded('AddOnSkins') then 
			AddonSkinsButton = Window:CreateSectionButton("All", "AddOnSkins", "", GUI.OpenConfigAddOnSkins)	
			AddonSkinsButton:ClearAllPoints()
			AddonSkinsButton:SetFrameStrata("FULLSCREEN")
			AddonSkinsButton:SetFrameLevel(16)
			AddonSkinsButton:SetPoint("BOTTOMRIGHT", Explanation, "BOTTOMRIGHT", -8, 8)
		end
end
GUI:AddWidgets(MaxUISkins)

------------------------------------------------------------------------------------------
-- SPACER	
------------------------------------------------------------------------------------------
local Spacer = function(self)
	local Window = self:CreateWindow(" |cffFFFFFF|r ")

end
GUI:AddWidgets(Spacer)