------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-07-2021
------------------------------------------------------------------------------------------

-- setting up MAXUI GUI EXTENSIONS

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local GUI = T["GUI"]

------------------------------------------------------------------------------------------
-- SECTION BUTTON ADDED TO GUI	
------------------------------------------------------------------------------------------
local sort = table.sort
local tinsert = table.insert
local tremove = table.remove
local match = string.match
local floor = floor
local unpack = unpack
local pairs = pairs
local type = type

local StyleFont = function(fs, font, size)
	fs:SetFont(font, size)
	fs:SetShadowColor(0, 0, 0)
	fs:SetShadowOffset(1, -1)
end

local Texture = C.Medias.Normal

local LightColor = {0.175, 0.175, 0.175}
local BGColor = {0.2, 0.2, 0.2}
local BrightColor = {0.35, 0.35, 0.35}
local HeaderColor = {0.43, 0.43, 0.43}

local WindowWidth = 770
local Spacing = 4
local ButtonListWidth = 120

local WidgetListWidth = (WindowWidth - ButtonListWidth) - (Spacing * 3) + 1
local WidgetHeight = 20
local WidgetHighlightAlpha = 0.3

local CheckClient = function(self)
	local Client = string.upper(self)
	
	if Client == "RETAIL" and WOW_PROJECT_ID == 1 then
		return true
	elseif Client == "BCC" and WOW_PROJECT_ID == 5 then
		return true
	elseif Client == "CLASSIC" and WOW_PROJECT_ID == 2 then
		return true
	elseif Client == "ALL" then
		return true
	else
		return false
	end
end

local ButtonOnEnter = function(self)
	self.Highlight:SetAlpha(WidgetHighlightAlpha)
end

local ButtonOnLeave = function(self)
	self.Highlight:SetAlpha(0)
end

local ButtonOnMouseDown = function(self)
	self.Backdrop:SetBackdropColor(unpack(BGColor))
end

local ButtonOnMouseUp = function(self)
	self.Backdrop:SetBackdropColor(unpack(BrightColor))
end

local CreateSectionButton = function(self, client, midtext, text, func)
	local Font = C.Medias.Font
	local IsEnabled = CheckClient(client)
	local ButtonWidth = 134
	
	if not IsEnabled then
		return
	end
	
	local Anchor = CreateFrame("Frame", nil, self)
	Anchor:SetSize(WidgetListWidth - (Spacing * 2), WidgetHeight)

	local Button = CreateFrame("Frame", nil, Anchor)
	Button:SetSize(ButtonWidth, WidgetHeight)
	Button:SetPoint("LEFT", Anchor, 0, 0)
	Button:CreateBackdrop(nil, Texture)
	Button.Backdrop:SetBackdropColor(unpack(BrightColor))
	Button:SetScript("OnMouseDown", ButtonOnMouseDown)
	Button:SetScript("OnMouseUp", ButtonOnMouseUp)
	Button:SetScript("OnEnter", ButtonOnEnter)
	Button:SetScript("OnLeave", ButtonOnLeave)
	Button:HookScript("OnMouseUp", func)

	Button.Highlight = Button:CreateTexture(nil, "OVERLAY")
	Button.Highlight:SetAllPoints()
	Button.Highlight:SetTexture(Texture)
	Button.Highlight:SetVertexColor(0.5, 0.5, 0.5)
	Button.Highlight:SetAlpha(0)

	Button.Middle = Button:CreateFontString(nil, "OVERLAY")
	Button.Middle:SetPoint("CENTER", Button, 0, 0)
	Button.Middle:SetWidth(WidgetListWidth - (Spacing * 4))
	StyleFont(Button.Middle, Font, 12)
	Button.Middle:SetJustifyH("CENTER")
	Button.Middle:SetText(midtext)

	Button.Label = Button:CreateFontString(nil, "OVERLAY")
	Button.Label:SetPoint("LEFT", Button, "RIGHT", Spacing, 0)
	Button.Label:SetWidth(WidgetListWidth - ButtonWidth - (Spacing * 4))
	Button.Label:SetJustifyH("LEFT")
	StyleFont(Button.Label, Font, 12)
	Button.Label:SetText(text)

	tinsert(self.Widgets, Anchor)

	return Button
end
GUI.Widgets.CreateSectionButton = CreateSectionButton

------------------------------------------------------------------------------------------
-- FUNCTIONS TO EXECUTE	
------------------------------------------------------------------------------------------
GUI.ProfilesShow = function(self)
	T.Profiles:Toggle()
end

GUI.ProfilesHide = function(self)
	T.Profiles:Toggle()
end

-- DATATEXT SETUP
GUI.DatatextSetupConfig = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui dt")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

GUI.DatatextSetupDefault = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui dt reset")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

GUI.DatatextSetupGoldReset = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui dt gold reset")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

-- CHAT SETUP
GUI.ChatSetupReset = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui chat reset")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

-- INTERFACE RESET
GUI.TotalReset = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui reset")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

-- GRID
GUI.TukuiGrid = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui grid")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

GUI.TukuiGrid24 = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui grid 24")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

GUI.TukuiGrid48 = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui grid 48")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

GUI.TukuiGrid64 = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui grid 64")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

GUI.TukuiGrid96 = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui grid 96")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

GUI.TukuiGrid128 = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui grid 128")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

-- TOOLS
GUI.TukuiMove = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui move")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
	GUI:Toggle()
end

GUI.TukuiKeybinds = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui kb")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
	GUI:Toggle()
end

GUI.TukuiTest = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui test")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
	GUI:Toggle()
end

GUI.TukuiDebuffTracking = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui t")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
	GUI:Toggle()
end

GUI.TukuiMarkers = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui markers")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

GUI.TukuiMicroMenu = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui mm")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

GUI.AFK = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/afk")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

-- Blizzard
GUI.MacroOpen = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/macro")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

-- DEVELOPER
GUI.TukuiPrint = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

GUI.TukuiStatus = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui status")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

GUI.FStack = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/fstack")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

GUI.TukuiTraceEvents = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui trace")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

------------------------------------------------------------------------------------------
-- FUNCTIONS TO EXECUTE	FOR EXTERNAL ADDONS
------------------------------------------------------------------------------------------
-- AddonSkins
GUI.OpenConfigAddOnSkins = function(self)
	if IsAddOnLoaded("ProjectAzilroka") then 
		_G.Enhanced_Config:ToggleConfig()
	else
		_G.AddOnSkins_Config:ToggleConfig()
	end
end

-- Advanced interface options
GUI.OpenConfigAdvancedInterfaceOptions = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/aio")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui c")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

-- AstralKeys
GUI.OpenConfigAstralKeys = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/ak")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui c")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

-- Auctionator
GUI.OpenConfigAuctionator = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/auctionator config")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui c")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

-- BugSack
GUI.OpenConfigBugSack = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/bugsack")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui c")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

-- Clique
GUI.OpenConfigClique = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/clique")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui c")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

-- DBM
GUI.OpenConfigDBM = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/dbm")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui c")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

-- Details
GUI.OpenConfigDetails = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/details options")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui c")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

-- Hekili
GUI.OpenConfigHekili = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/hek")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui c")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

-- Immersion
GUI.OpenConfigImmersion = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/immersion")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui c")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

-- LeatrixPlus
GUI.OpenConfigLeatrixPlus = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/ltp")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui c")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

-- LS Toasts
GUI.OpenConfigLSToasts = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/lst")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui c")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

-- Pawn
GUI.OpenConfigPawn = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/pawn")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui c")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

-- ProjectAzilroka
GUI.OpenConfigProjectAzilroka = function(self)
	_G.Enhanced_Config:ToggleConfig()
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui c")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

-- RSA
GUI.OpenConfigQuestie = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/questie")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui c")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

-- RSA
GUI.OpenConfigRSA = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/rsa")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui c")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

-- Simcraft
GUI.OpenConfigSimCraft = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/simc")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui c")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

-- WeakAuras
GUI.OpenConfigWeakAuras = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/wa")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui c")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

-- WorldQuestList
GUI.OpenConfigWorldQuestList = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/wql")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui c")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end

-- WorldQuestTab
GUI.OpenConfigWorldQuestTab = function(self)

end