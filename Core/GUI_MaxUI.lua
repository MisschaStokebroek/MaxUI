------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-08-2023
------------------------------------------------------------------------------------------

-- setting up MAXUI GUI EXTENSIONS

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local GUI = T["GUI"]

------------------------------------------------------------------------------------------
-- GUI EXTENDED
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

local HexClassColor = T.RGBToHex(unpack(T.Colors.class[T.MyClass]))
local LightColor = {0.175, 0.175, 0.175}
local BGColor = {0.2, 0.2, 0.2}
local BrightColor = {0.35, 0.35, 0.35}
local HeaderColor = {0.43, 0.43, 0.43}
local ClassColor = T.Colors.class[select(2, UnitClass("player"))]
local R, G, B = unpack(ClassColor)

local WindowWidth = 770
local Spacing = 4
local ButtonListWidth = 120

local MenuButtonWidth = ButtonListWidth - (Spacing * 2)
local MenuButtonHeight = 20

local WidgetHeight = 20
local WidgetHighlightAlpha = 0.3
local WidgetListWidth = (WindowWidth - ButtonListWidth) - (Spacing * 3) + 1
local WidgetHighlightAlpha = 0.3

local CheckClient = function(self)
	local Client = string.upper(self)
	local Toc = select(4, GetBuildInfo())

	if Client == "RETAIL" and T.Retail then
		return true
	elseif Client == "WOTLK" and T.WotLK then
		return true
	elseif Client == "BCC" and T.BCC then
		return true
	elseif Client == "CLASSIC" and T.Classic then
		return true
	elseif Client == "ALL" then
		return true
	else
		return false
	end
end

------------------------------------------------------------------------------------------
-- SKINNING AND ADJUSTMENTS
------------------------------------------------------------------------------------------
-- Skinning
------------------------------------------------------------------------------------------
local function SkinGUIElements()
	if C["Skins"]["ButtonFilter"] == true then 
		local TukuiGUIFooterChildren = {TukuiGUI.Footer:GetChildren()}
		for _, child in ipairs(TukuiGUIFooterChildren) do
			child:CreateMaxUIFilter()
		end

		local TukuiGUIButtonListChildren = {TukuiGUI.ButtonList:GetChildren()}
		for _, child in ipairs(TukuiGUIButtonListChildren) do
			child:CreateMaxUIFilter()
		end
		TukuiGUI.ButtonList.Backdrop.Filter:Kill()
		TukuiGUI.ButtonList.Shadow.Filter:Kill()
	end

	TukuiGUI.Header:Hide()

	if C["Skins"]["BackdropFilter"] == true then 
		local TukuiGUIFramesChildren = {TukuiGUI:GetChildren()}
		for _, child in ipairs(TukuiGUIFramesChildren) do
			child:CreateMaxUIFilter()
		end
	end
end

------------------------------------------------------------------------------------------
-- Adjusting GUI
------------------------------------------------------------------------------------------
local function ExtendedGUI()
	local HeaderText = "Global User Interface"
	
	-- skin elements
	SkinGUIElements()

	-- fade duration
	TukuiGUI.FadeIn:SetDuration(C["General"]["FaderTime"])
	TukuiGUI.FadeOut:SetDuration(C["General"]["FaderTime"])
	
	-- reposition
	TukuiGUI:ClearAllPoints()
	TukuiGUI:SetFrameStrata("TOOLTIP")
	TukuiGUI:SetPoint("TOP", UIParent, "TOP", 0, -22)

	TukuiGUI:CreateMaxUIHeader(HeaderText)
	TukuiGUI.MaxUIHeader:ClearAllPoints()
	TukuiGUI.MaxUIHeader:SetPoint("BOTTOMLEFT", TukuiGUI, "TOPLEFT", 5, -25)
	TukuiGUI.MaxUIHeader:SetPoint("BOTTOMRIGHT", TukuiGUI, "TOPRIGHT", -5, -25)
	TukuiGUI:CreateMaxUICloseButton(TukuiGUI.MaxUIHeader)

	TukuiGUI:CreateMaxUIFooter()
	TukuiGUI.MaxUIFooter:ClearAllPoints()
	TukuiGUI.MaxUIFooter:SetPoint("TOPLEFT", TukuiGUI, "BOTTOMLEFT", 5, -21)
	TukuiGUI.MaxUIFooter:SetPoint("TOPRIGHT", TukuiGUI, "BOTTOMRIGHT", -5, -21)

	if C["ConfigMenu"]["OldTukuiGUIEnable"] == true then 
		local TukuiOldGUIElements = CreateFrame("Frame", nil, TukuiGUI.ButtonList)
		TukuiOldGUIElements:SetSize(TukuiGUI.ButtonList:GetWidth(), TukuiGUI.ButtonList:GetHeight())
		TukuiOldGUIElements:SetPoint("RIGHT", TukuiGUI.ButtonList, "LEFT", -3, 0)
		TukuiOldGUIElements:SkinMaxUIFrame()
	end
end
hooksecurefunc(GUI, "Enable", ExtendedGUI)

------------------------------------------------------------------------------------------
-- Sorting menu
------------------------------------------------------------------------------------------
GUI.SortMenuButtons = function(self)
	for i = 1, #self.Buttons do
		self.Buttons[i]:ClearAllPoints()

		self.Windows["MaxUI"].Button:SetPoint("TOPLEFT", self.ButtonList, Spacing, -Spacing)
		self.Windows["MaxUI"].Button.Text:SetText("|cffFFFF99MaxUI|r")
		local PreviousButton = self.Windows["MaxUI"].Button

		self.Windows["Changelog"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["Changelog"].Button.Text:SetText("|cffFFFF99Changelog|r")
		local PreviousButton = self.Windows["Changelog"].Button

		self.Windows["Help"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["Help"].Button.Text:SetText("|cffFFFF99Help|r")
		local PreviousButton = self.Windows["Help"].Button

		self.Windows["Config"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["Config"].Button.Text:SetText("|cffFFFF99Configuration|r")
		local PreviousButton = self.Windows["Config"].Button

		self.Windows["MaxUIGeneral"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["MaxUIGeneral"].Button.Text:SetText("|cffFFFF99General|r")
		local PreviousButton = self.Windows["MaxUIGeneral"].Button

		self.Windows["Quick Setup"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["Quick Setup"].Button.Text:SetText("|cffFFFF99Quick Setup|r")
		local PreviousButton = self.Windows["Quick Setup"].Button

		self.Windows["Profiles"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["Profiles"].Button.Text:SetText("|cffFFFF99Profiles|r")
		local PreviousButton = self.Windows["Profiles"].Button

		self.Windows["Masks"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["Masks"].Button.Text:SetText("|cffFFFF99Masks|r")
		local PreviousButton = self.Windows["Masks"].Button

		self.Windows["Skins"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["Skins"].Button.Text:SetText("|cffFFFF99Skins|r")
		local PreviousButton = self.Windows["Skins"].Button

		self.Windows["AddOns"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["AddOns"].Button.Text:SetText("|cffFFFF99Addons|r")
		local PreviousButton = self.Windows["AddOns"].Button

		if IsAddOnLoaded('MaxArtUI') then 
			self.Windows["Styling Art"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
			self.Windows["Styling Art"].Button.Text:SetText("|cffFFFF99Styling Art|r")
			local PreviousButton = self.Windows["Styling Art"].Button
		end

		------------------------------------- ACTIONBARS -------------------------------------
		if IsAddOnLoaded('MaxArtUI') then 
			self.Windows["Actionbars 1"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing*3 - 2 + WidgetHeight*2))
		else
			self.Windows["Actionbars 1"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing*2 - 2 + WidgetHeight))
		end
		self.Windows["Actionbars 1"].Button.Text:SetText("Actionbars")
		local PreviousButton = self.Windows["Actionbars 1"].Button

		self.Windows["Actionbars 2"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["Actionbars 2"].Button.Text:SetText("Bar 1 - 8")
		local PreviousButton = self.Windows["Actionbars 2"].Button

		self.Windows["Actionbars 3"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["Actionbars 3"].Button.Text:SetText("Special bars")
		local PreviousButton = self.Windows["Actionbars 3"].Button

		------------------------------------- UNITFRAMES -------------------------------------

		self.Windows["MaxUIUnitFrames"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing*2 -2 + WidgetHeight))
		self.Windows["MaxUIUnitFrames"].Button.Text:SetText("Unitframes")
		local PreviousButton = self.Windows["MaxUIUnitFrames"].Button

		self.Windows["Unitfr. Class"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["Unitfr. Class"].Button.Text:SetText("Class")
		local PreviousButton = self.Windows["Unitfr. Class"].Button

		self.Windows["Unitfr. Player"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["Unitfr. Player"].Button.Text:SetText("Player")
		local PreviousButton = self.Windows["Unitfr. Player"].Button

		self.Windows["Unitfr. Target"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["Unitfr. Target"].Button.Text:SetText("Target")
		local PreviousButton = self.Windows["Unitfr. Target"].Button

		self.Windows["Unitfr. Pet"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["Unitfr. Pet"].Button.Text:SetText("Pet")
		local PreviousButton = self.Windows["Unitfr. Pet"].Button

		self.Windows["Unitfr. ToT"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["Unitfr. ToT"].Button.Text:SetText("Tar. of target")
		local PreviousButton = self.Windows["Unitfr. ToT"].Button

		self.Windows["Unitfr. Focus"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["Unitfr. Focus"].Button.Text:SetText("Focus")
		local PreviousButton = self.Windows["Unitfr. Focus"].Button

		self.Windows["Unitfr. Boss"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["Unitfr. Boss"].Button.Text:SetText("Boss")
		local PreviousButton = self.Windows["Unitfr. Boss"].Button

		self.Windows["Unitfr. Arena"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["Unitfr. Arena"].Button.Text:SetText("Arena")
		local PreviousButton = self.Windows["Unitfr. Arena"].Button

		self.Windows["MaxUINamePlates"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["MaxUINamePlates"].Button.Text:SetText("Nameplates")
		local PreviousButton = self.Windows["MaxUINamePlates"].Button

		self.Windows["MaxUIParty"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["MaxUIParty"].Button.Text:SetText("Party")
		local PreviousButton = self.Windows["MaxUIParty"].Button

		self.Windows["MaxUIRaid"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["MaxUIRaid"].Button.Text:SetText("Raid")
		local PreviousButton = self.Windows["MaxUIRaid"].Button

		------------------------------------- MISC -------------------------------------
		
		self.Windows["Auras"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing*2 - 2 + WidgetHeight))
		self.Windows["Auras"].Button.Text:SetText("Auras")
		local PreviousButton = self.Windows["Auras"].Button
		
		self.Windows["Bags"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["Bags"].Button.Text:SetText("Bags")
		local PreviousButton = self.Windows["Bags"].Button

		self.Windows["MaxUIChat"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["MaxUIChat"].Button.Text:SetText("Chat")
		local PreviousButton = self.Windows["MaxUIChat"].Button

		self.Windows["DataBars"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["DataBars"].Button.Text:SetText("Databars")
		local PreviousButton = self.Windows["DataBars"].Button

		self.Windows["DataTexts"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing -1))
		self.Windows["DataTexts"].Button.Text:SetText("Datatexts")
		local PreviousButton = self.Windows["DataTexts"].Button	

		self.Windows["Loot"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["Loot"].Button.Text:SetText("Loot")
		local PreviousButton = self.Windows["Loot"].Button

		self.Windows["MaxUIMaps"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["MaxUIMaps"].Button.Text:SetText("Maps & Quests")
		local PreviousButton = self.Windows["MaxUIMaps"].Button	

		self.Windows["MaxUIMisc"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["MaxUIMisc"].Button.Text:SetText("Misc")
		local PreviousButton = self.Windows["MaxUIMisc"].Button

		self.Windows["Scrolling Text"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["Scrolling Text"].Button.Text:SetText("Scrolling Text")
		local PreviousButton = self.Windows["Scrolling Text"].Button

		self.Windows["Tooltips"].Button:SetPoint("TOP", PreviousButton, "BOTTOM", 0, -(Spacing - 1))
		self.Windows["Tooltips"].Button.Text:SetText("Tooltips")
		local PreviousButton = self.Windows["Tooltips"].Button

		------------------------------------- Tukui old sections -------------------------------------

		if C["ConfigMenu"]["OldTukuiGUIEnable"] == true then 
			self.Windows["Textures"].Button:SetPoint("RIGHT", self.Windows["Masks"].Button, "LEFT", -(3 + Spacing*2), 0)
			self.Windows["Textures"].Button.Text:SetText("t.Textures")
			local PreviousButton = self.Windows["Textures"].Button

			self.Windows["Actionbars"].Button:SetPoint("RIGHT", self.Windows["Actionbars 1"].Button, "LEFT", -(3 + Spacing*2), 0)
			self.Windows["Actionbars"].Button.Text:SetText("T.Actionbars")
			local PreviousButton = self.Windows["Actionbars"].Button

			self.Windows["Chat"].Button:SetPoint("RIGHT", self.Windows["MaxUIChat"].Button, "LEFT", -(3 + Spacing*2), 0)
			self.Windows["Chat"].Button.Text:SetText("T.Chat")
			local PreviousButton = self.Windows["Chat"].Button

			self.Windows["General"].Button:SetPoint("RIGHT", self.Windows["MaxUIGeneral"].Button, "LEFT", -(3 + Spacing*2), 0)
			self.Windows["General"].Button.Text:SetText("T.General")
			local PreviousButton = self.Windows["General"].Button

			self.Windows["Maps"].Button:SetPoint("RIGHT", self.Windows["MaxUIMaps"].Button, "LEFT", -(3 + Spacing*2), 0)
			self.Windows["Maps"].Button.Text:SetText("T.Maps")
			local PreviousButton = self.Windows["Maps"].Button	

			self.Windows["Misc"].Button:SetPoint("RIGHT", self.Windows["MaxUIMisc"].Button, "LEFT", -(3 + Spacing*2), 0)
			self.Windows["Misc"].Button.Text:SetText("T.Misc")
			local PreviousButton = self.Windows["Misc"].Button

			self.Windows["NamePlates"].Button:SetPoint("RIGHT", self.Windows["MaxUINamePlates"].Button, "LEFT", -(3 + Spacing*2), 0)
			self.Windows["NamePlates"].Button.Text:SetText("T.Nameplates")
			local PreviousButton = self.Windows["NamePlates"].Button

			self.Windows["Party"].Button:SetPoint("RIGHT", self.Windows["MaxUIParty"].Button, "LEFT", -(3 + Spacing*2), 0)
			self.Windows["Party"].Button.Text:SetText("T.Party")
			local PreviousButton = self.Windows["Party"].Button

			self.Windows["Raid"].Button:SetPoint("RIGHT", self.Windows["MaxUIRaid"].Button, "LEFT", -(3 + Spacing*2), 0)
			self.Windows["Raid"].Button.Text:SetText("T.Raid")
			local PreviousButton = self.Windows["Raid"].Button

			self.Windows["UnitFrames"].Button:SetPoint("RIGHT", self.Windows["MaxUIUnitFrames"].Button, "LEFT", -(3 + Spacing*2), 0)
			self.Windows["UnitFrames"].Button.Text:SetText("T.UnitFrames")
			local PreviousButton = self.Windows["UnitFrames"].Button
		end	
	end
end

------------------------------------------------------------------------------------------
-- ELEMENTS	(TUKUI EDITED OVERRIDES)
------------------------------------------------------------------------------------------
-- Sections
------------------------------------------------------------------------------------------
local CreateSection = function(self, client, text)
	local Texture = (T.GetTexture(C["General"]["HeaderTexture"]))
	local IsEnabled = CheckClient(client)
	
	if not IsEnabled then
		return
	end
	
	local Anchor = CreateFrame("Frame", nil, self)
	Anchor:SetSize(WidgetListWidth - (Spacing * 2), WidgetHeight)
	Anchor.IsSection = true

	local Section = CreateFrame("Frame", nil, Anchor)
	Section:SetPoint("TOPLEFT", Anchor, 0, 0)
	Section:SetPoint("BOTTOMRIGHT", Anchor, 0, 0)
	Section:CreateBackdrop(nil, Texture)
	Section.Backdrop:SetBackdropColor(unpack(BrightColor))

	Section.Text = Section:CreateFontString(nil, "OVERLAY")
	Section.Text:SetFontTemplate(C.Medias.Font, 12, 0, 0)
	Section.Text:SetPoint("LEFT", 8, -1)
	Section.Text:SetText(string.upper(text))

	if C["Skins"]["HeaderFilter"] then
		Section:CreateMaxUIFilter()
	end

	tinsert(self.Widgets, Anchor)

	return Section
end

GUI.Widgets.CreateSection = CreateSection

------------------------------------------------------------------------------------------
-- NEW ADDED ELEMENTS
------------------------------------------------------------------------------------------
-- DoubleSwitch widget
------------------------------------------------------------------------------------------
local SetValue = function(group, option, value)
	if (type(C[group][option]) == "table") then
		if C[group][option].Value then
			C[group][option].Value = value
		else
			C[group][option] = value
		end
	else
		C[group][option] = value
	end

	local Settings

	if (not TukuiDatabase.Settings[T.MyRealm]) then
		TukuiDatabase.Settings[T.MyRealm] = {}
	end

	if (not TukuiDatabase.Settings[T.MyRealm][T.MyName]) then
		TukuiDatabase.Settings[T.MyRealm][T.MyName] = {}
	end

	Settings = TukuiDatabase.Settings[T.MyRealm][T.MyName]

	if (not Settings[group]) then
		Settings[group] = {}
	end

	Settings[group][option] = value
end

local SwitchWidth = 46

local SwitchOnMouseUp = function(self, button)
	self.Thumb:ClearAllPoints()

	if (button == "RightButton") then
		self.Value = Reverse(T.Defaults[self.Group][self.Option])
	end

	if self.Value then
		self.Thumb:SetPoint("RIGHT", self, 0, 0)
		self.Movement:SetOffset(-26, 0)
		self.Value = false
	else
		self.Thumb:SetPoint("LEFT", self, 0, 0)
		self.Movement:SetOffset(26, 0)
		self.Value = true
	end

	self.Movement:Play()

	SetValue(self.Group, self.Option, self.Value)

	if self.Hook then
		self.Hook(self.Value)
	end
end

local SwitchOnEnter = function(self)
	self.Highlight:SetAlpha(WidgetHighlightAlpha)
end

local SwitchOnLeave = function(self)
	self.Highlight:SetAlpha(0)
end

local CreateDoubleSwitch = function(self, client, groupleft, optionleft, textleft, groupright, optionright, textright)
	local Font = C.Medias.Font
	local ValueLeft = C[groupleft][optionleft]
	local ValueRight = C[groupright][optionright]
	local IsEnabled = CheckClient(client)

	if not IsEnabled then
		return
	end

	local Anchor = CreateFrame("Frame", nil, self)
	Anchor:SetSize(WidgetListWidth - (Spacing * 2), WidgetHeight)

	local SwitchLeft = CreateFrame("Frame", nil, Anchor)
	SwitchLeft:SetPoint("LEFT", Anchor, 0, 0)
	SwitchLeft:SetSize(SwitchWidth, WidgetHeight)
	SwitchLeft:CreateBackdrop(nil, Texture)
	SwitchLeft.Backdrop:SetBackdropColor(unpack(BGColor))
	SwitchLeft:SetScript("OnMouseUp", SwitchOnMouseUp)
	SwitchLeft:SetScript("OnEnter", SwitchOnEnter)
	SwitchLeft:SetScript("OnLeave", SwitchOnLeave)
	SwitchLeft.Value = ValueLeft
	SwitchLeft.Group = groupleft
	SwitchLeft.Option = optionleft

		SwitchLeft.Highlight = SwitchLeft:CreateTexture(nil, "OVERLAY")
		SwitchLeft.Highlight:SetAllPoints()
		SwitchLeft.Highlight:SetTexture(Texture)
		SwitchLeft.Highlight:SetVertexColor(0.5, 0.5, 0.5)
		SwitchLeft.Highlight:SetAlpha(0)

		SwitchLeft.Thumb = CreateFrame("Frame", nil, SwitchLeft)
		SwitchLeft.Thumb:SetSize(WidgetHeight, WidgetHeight)
		SwitchLeft.Thumb:CreateBackdrop(nil, Texture)
		SwitchLeft.Thumb.Backdrop:SetBackdropColor(unpack(BrightColor))

		SwitchLeft.Movement = CreateAnimationGroup(SwitchLeft.Thumb):CreateAnimation("Move")
		SwitchLeft.Movement:SetDuration(0.1)
		SwitchLeft.Movement:SetEasing("in-sinusoidal")

		SwitchLeft.TrackTexture = SwitchLeft:CreateTexture(nil, "ARTWORK")
		SwitchLeft.TrackTexture:SetPoint("TOPLEFT", SwitchLeft, 0, -1)
		SwitchLeft.TrackTexture:SetPoint("BOTTOMRIGHT", SwitchLeft.Thumb, "BOTTOMLEFT", 0, 1)
		SwitchLeft.TrackTexture:SetTexture(Texture)
		SwitchLeft.TrackTexture:SetVertexColor(R, G, B)

		SwitchLeft.Label = SwitchLeft:CreateFontString(nil, "OVERLAY")
		SwitchLeft.Label:SetPoint("LEFT", SwitchLeft, "RIGHT", Spacing, 0)
		SwitchLeft.Label:SetWidth(WidgetListWidth/2 - SwitchWidth - (Spacing * 4))
		SwitchLeft.Label:SetJustifyH("LEFT")
		StyleFont(SwitchLeft.Label, Font, 12)
		SwitchLeft.Label:SetText(textleft)

		if ValueLeft then
			SwitchLeft.Thumb:SetPoint("RIGHT", SwitchLeft, 0, 0)
		else
			SwitchLeft.Thumb:SetPoint("LEFT", SwitchLeft, 0, 0)
		end

	local SwitchRight = CreateFrame("Frame", nil, Anchor)
	SwitchRight:SetPoint("LEFT", Anchor, WidgetListWidth/2, 0)
	SwitchRight:SetSize(SwitchWidth, WidgetHeight)
	SwitchRight:CreateBackdrop(nil, Texture)
	SwitchRight.Backdrop:SetBackdropColor(unpack(BGColor))
	SwitchRight:SetScript("OnMouseUp", SwitchOnMouseUp)
	SwitchRight:SetScript("OnEnter", SwitchOnEnter)
	SwitchRight:SetScript("OnLeave", SwitchOnLeave)
	SwitchRight.Value = ValueRight
	SwitchRight.Group = groupright
	SwitchRight.Option = optionright

		SwitchRight.Highlight = SwitchRight:CreateTexture(nil, "OVERLAY")
		SwitchRight.Highlight:SetAllPoints()
		SwitchRight.Highlight:SetTexture(Texture)
		SwitchRight.Highlight:SetVertexColor(0.5, 0.5, 0.5)
		SwitchRight.Highlight:SetAlpha(0)

		SwitchRight.Thumb = CreateFrame("Frame", nil, SwitchRight)
		SwitchRight.Thumb:SetSize(WidgetHeight, WidgetHeight)
		SwitchRight.Thumb:CreateBackdrop(nil, Texture)
		SwitchRight.Thumb.Backdrop:SetBackdropColor(unpack(BrightColor))

		SwitchRight.Movement = CreateAnimationGroup(SwitchRight.Thumb):CreateAnimation("Move")
		SwitchRight.Movement:SetDuration(0.1)
		SwitchRight.Movement:SetEasing("in-sinusoidal")

		SwitchRight.TrackTexture = SwitchRight:CreateTexture(nil, "ARTWORK")
		SwitchRight.TrackTexture:SetPoint("TOPLEFT", SwitchRight, 0, -1)
		SwitchRight.TrackTexture:SetPoint("BOTTOMRIGHT", SwitchRight.Thumb, "BOTTOMLEFT", 0, 1)
		SwitchRight.TrackTexture:SetTexture(Texture)
		SwitchRight.TrackTexture:SetVertexColor(R, G, B)

		SwitchRight.Label = SwitchRight:CreateFontString(nil, "OVERLAY")
		SwitchRight.Label:SetPoint("LEFT", SwitchRight, "RIGHT", Spacing, 0)
		SwitchRight.Label:SetWidth(WidgetListWidth/2 - SwitchWidth - (Spacing * 4))
		SwitchRight.Label:SetJustifyH("LEFT")
		StyleFont(SwitchRight.Label, Font, 12)
		SwitchRight.Label:SetText(textright)

		if ValueRight then
			SwitchRight.Thumb:SetPoint("RIGHT", SwitchRight, 0, 0)
		else
			SwitchRight.Thumb:SetPoint("LEFT", SwitchRight, 0, 0)
		end

	tinsert(self.Widgets, Anchor)

	return SwitchLeft, SwitchRight
end
GUI.Widgets.CreateDoubleSwitch = CreateDoubleSwitch

------------------------------------------------------------------------------------------
-- button widget (almost same as Tukui one, only added version check)
------------------------------------------------------------------------------------------
--[[
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
--]]

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
	Button:SkinMaxUIButton()
	Button.Backdrop.Shadow:Hide()

	--Button:CreateBackdrop(nil, Texture)
	--Button.Backdrop:SetBackdropColor(unpack(BrightColor))
	--Button:SetScript("OnMouseDown", ButtonOnMouseDown)
	--Button:SetScript("OnMouseUp", ButtonOnMouseUp)
	--Button:SetScript("OnEnter", ButtonOnEnter)
	--Button:SetScript("OnLeave", ButtonOnLeave)
	Button:HookScript("OnMouseUp", func)

		--Button.Highlight = Button:CreateTexture(nil, "OVERLAY")
		--Button.Highlight:SetAllPoints()
		--Button.Highlight:SetTexture(Texture)
		--Button.Highlight:SetVertexColor(0.5, 0.5, 0.5)
		--Button.Highlight:SetAlpha(0)

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
-- widget spacer positioned
------------------------------------------------------------------------------------------
local CreateSpacer = function(self, client, pos)
	local IsEnabled = CheckClient(client)
	
	if not IsEnabled then
		return
	end
	
	local Anchor = CreateFrame("Frame", nil, self)
	Anchor:SetSize(WidgetListWidth - (Spacing * 2), WidgetHeight)
	Anchor.IsSection = true
	
	tinsert(self.Widgets, pos, Anchor)
end
GUI.Widgets.CreateSpacer = CreateSpacer

------------------------------------------------------------------------------------------
-- widget spacer
------------------------------------------------------------------------------------------
local CreateSpacerNoPos = function(self, client)
	local IsEnabled = CheckClient(client)
	
	if not IsEnabled then
		return
	end
	
	local Anchor = CreateFrame("Frame", nil, self)
	Anchor:SetSize(WidgetListWidth - (Spacing * 2), WidgetHeight)
	Anchor.IsSection = true

	tinsert(self.Widgets, Anchor)
end
GUI.Widgets.CreateSpacerNoPos = CreateSpacerNoPos

------------------------------------------------------------------------------------------
-- text line widget positioned
------------------------------------------------------------------------------------------
local CreateTextLinePos = function(self, client, pos, text)
	local Font = C.Medias.Font
	local IsEnabled = CheckClient(client)
	
	if not IsEnabled then
		return
	end
	
	local Anchor = CreateFrame("Frame", nil, self)
	Anchor:SetSize(WidgetListWidth - (Spacing * 2), WidgetHeight)
	Anchor.IsSection = true

	local TextLine = CreateFrame("Frame", nil, Anchor)
	TextLine:SetPoint("TOPLEFT", Anchor, 0, 0)
	TextLine:SetPoint("BOTTOMRIGHT", Anchor, 0, 0)

		TextLine.Text = TextLine:CreateFontString(nil, "OVERLAY")
		StyleFont(TextLine.Text, Font, 12)
		TextLine.Text:SetPoint("LEFT", 4, 0)
		TextLine.Text:SetText(text)
	
	tinsert(self.Widgets, pos, Anchor)

	return TextLine
end
GUI.Widgets.CreateTextLinePos = CreateTextLinePos

------------------------------------------------------------------------------------------
-- text line widget
------------------------------------------------------------------------------------------
local CreateTextLine = function(self, client, text)
	local Font = C.Medias.Font
	local IsEnabled = CheckClient(client)
	
	if not IsEnabled then
		return
	end
	
	local Anchor = CreateFrame("Frame", nil, self)
	Anchor:SetSize(WidgetListWidth - (Spacing * 2), WidgetHeight)
	Anchor.IsSection = true

	local TextLine = CreateFrame("Frame", nil, Anchor)
	TextLine:SetPoint("TOPLEFT", Anchor, 0, 0)
	TextLine:SetPoint("BOTTOMRIGHT", Anchor, 0, 0)

		TextLine.Text = TextLine:CreateFontString(nil, "OVERLAY")
		StyleFont(TextLine.Text, Font, 12)
		TextLine.Text:SetPoint("LEFT", 4, 0)
		TextLine.Text:SetText(text)
	
	tinsert(self.Widgets, Anchor)

	return TextLine
end
GUI.Widgets.CreateTextLine = CreateTextLine

------------------------------------------------------------------------------------------
-- text explanation widget (Centered text)
------------------------------------------------------------------------------------------
local CreateExplanationText = function(self, client, pos, text)
	local Font = C.Medias.Font
	local IsEnabled = CheckClient(client)
	
	if not IsEnabled then
		return
	end
	
	local Anchor = CreateFrame("Frame", nil, self)
	Anchor:SetSize(WidgetListWidth - (Spacing * 2), WidgetHeight)

	local Explanation = CreateFrame("Frame", nil, Anchor)
	Explanation:SetPoint("TOPLEFT", Anchor, 0, 0)
	Explanation:SetPoint("BOTTOMRIGHT", Anchor, 0, 0)

		Explanation.Text = Explanation:CreateFontString(nil, "OVERLAY")
		StyleFont(Explanation.Text, Font, 12)
		Explanation.Text:SetPoint("CENTER", Explanation, "CENTER", 0, 0)
		Explanation.Text:SetText(text)
	
	tinsert(self.Widgets, pos, Anchor)

	return Explanation
end
GUI.Widgets.CreateExplanationText = CreateExplanationText

------------------------------------------------------------------------------------------
-- maxui window logo widget
------------------------------------------------------------------------------------------
local CreateWindowLogo = function(self, client, text)
	local Font = C.Medias.Font
	local IsEnabled = CheckClient(client)
	
	if not IsEnabled then
		return
	end
	
	local Anchor = CreateFrame("Frame", nil, self)
	Anchor:SetSize(WidgetListWidth - (Spacing *2), WidgetHeight)

	local WindowLogo = CreateFrame("Frame", nil, Anchor)
	WindowLogo:SetPoint("TOPLEFT", Anchor, 0, 0)
	WindowLogo:SetPoint("BOTTOMRIGHT", Anchor, 0, 0)

	WindowLogo.Logomaxui = WindowLogo:CreateTexture(nil, "BACKGROUND")
	WindowLogo.Logomaxui:SetWidth(2*((WidgetHeight *4) + (Spacing *3)) +1)
	WindowLogo.Logomaxui:SetHeight((WidgetHeight *4) + (Spacing *3) +1)
	WindowLogo.Logomaxui:SetPoint("TOP", Anchor, "TOP", 0, -4)
	WindowLogo.Logomaxui:SetTexture(T.GetTexture("zMaxUI"))

		WindowLogo.Logomaxui.Text = WindowLogo:CreateFontString(nil, "OVERLAY")
		StyleFont(WindowLogo.Logomaxui.Text, Font, 16)
		WindowLogo.Logomaxui.Text:SetPoint("BOTTOM", WindowLogo.Logomaxui, "BOTTOM", 0, 0)
		WindowLogo.Logomaxui.Text:SetText(HexClassColor..string.upper(text).."|r")
	
	tinsert(self.Widgets, 1, Anchor)

	return WindowLogo
end
GUI.Widgets.CreateWindowLogo = CreateWindowLogo

------------------------------------------------------------------------------------------
-- widget texture
------------------------------------------------------------------------------------------
local CreateTextureWidget = function(self, client, texture)
	local IsEnabled = CheckClient(client)
	
	if not IsEnabled then
		return
	end
	
	local Anchor = CreateFrame("Frame", nil, self)
	Anchor:SetSize(WidgetListWidth - (Spacing * 2), WidgetHeight)
	Anchor.IsSection = true
	
	local Logo = CreateFrame("Frame", nil, Anchor)
	Logo:SetPoint("TOPLEFT", Anchor, 0, 0)
	Logo:SetPoint("BOTTOMRIGHT", Anchor, 0, 0)

	Logo.class = Logo:CreateTexture(nil, "BACKGROUND")
	Logo.class:SetWidth((WidgetHeight *2))
	Logo.class:SetHeight((WidgetHeight *2))
	Logo.class:SetPoint("BOTTOMRIGHT", Anchor, "BOTTOMRIGHT", -8, 1)
	Logo.class:SetTexture(T.GetTexture(texture))

	tinsert(self.Widgets, Anchor)
end
GUI.Widgets.CreateTextureWidget = CreateTextureWidget

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

GUI.TotalResetBLizzard = function(self)
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui reset blizzard")
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

GUI.TukuiGroupLootTest = function(self)
	T.Inventory.GroupLoot:TestGroupLootFrames()
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