------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 01-08-2021
------------------------------------------------------------------------------------------

-- setting up CHAT.
-- need to kill the toggle buttons

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Chat = T.Chat
local baseChatAddToggles = Chat.AddToggles
local baseChatShowToggle = Chat.ShowChatFrame
local baseChatHideToggle = Chat.HideChatFrame
local baseAddPanels = Chat.AddPanels
local baseSetup = Chat.Setup

local HeaderColor = {0.43, 0.43, 0.43}
local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
local ChatPlayerModel = CreateFrame("PlayerModel", nil, UIParent)
ChatPlayerModel:SetUnit('player')

------------------------------------------------------------------------------------------
-- CHAT TAB COLORING
------------------------------------------------------------------------------------------
function Chat:UpdateTabColors()
	for i = 1, 10 do
		local tab = _G["ChatFrame"..i.."Tab"]
		local tabtext = _G["ChatFrame"..i.."TabText"]
		tabtext:SetFontObject(T.GetFont(C["Chat"].TabFont))
		tabtext:SetScale(C["Chat"]["TabFontSize"]/10)
		
		if(i == SELECTED_CHAT_FRAME:GetID()) then
			tabtext:SetTextColor(1, 1, 1)
		else
			if C["General"]["ClassColorHeaders"]["Value"] == "Dark" then 
				tabtext:SetVertexColor(0.43, 0.43, 0.43)
			elseif C["General"]["ClassColorHeaders"]["Value"] == "ClassColor" then 
				tabtext:SetVertexColor(unpack(ClassColor))
			elseif C["General"]["ClassColorHeaders"]["Value"] == "BackdropColor" then 
				tabtext:SetVertexColor(unpack(C.General.BackdropColor))
			else
				tabtext:SetTextColor(unpack(HeaderColor))
			end
		end
		
		tab:SetScript("OnEnter", function(self)
			tabtext:SetTextColor(1, 1, 0)
		end)
		
		tab:SetScript("OnLeave", function(self)
			if(i == SELECTED_CHAT_FRAME:GetID()) then
				tabtext:SetTextColor(1, 1, 1)
			else
				if C["General"]["ClassColorHeaders"]["Value"] == "Dark" then 
					tabtext:SetVertexColor(0.43, 0.43, 0.43)
				elseif C["General"]["ClassColorHeaders"]["Value"] == "ClassColor" then 
					tabtext:SetVertexColor(unpack(ClassColor))
				elseif C["General"]["ClassColorHeaders"]["Value"] == "BackdropColor" then 
					tabtext:SetVertexColor(unpack(C.General.BackdropColor))
				else
					tabtext:SetTextColor(unpack(HeaderColor))
				end
			end
		end)
   	end
	
end
hooksecurefunc("FCFTab_UpdateColors", Chat.UpdateTabColors)

function Chat:CreateChatTabs()
	for i = 1, 10 do
		local tab = _G["ChatFrame"..i.."Tab"]
		
		local ChatTabSplitter = CreateFrame("Frame", "ChatTabSplitter", tab)
		ChatTabSplitter:SetHeight(20)
		ChatTabSplitter:SetWidth(2)
		ChatTabSplitter:SetPoint("LEFT", tab, "RIGHT", 0, -6)
		ChatTabSplitter:SetFrameStrata("BACKGROUND")
		ChatTabSplitter:SetFrameLevel(4)
		ChatTabSplitter:CreateBackdrop()
	end
end

------------------------------------------------------------------------------------------
-- CHAT TOGGLE BUTTON CHANGES
------------------------------------------------------------------------------------------
function Chat:AddToggles()
	local LeftChatBG = T.Chat.Panels.LeftChat
	local RightChatBG = T.Chat.Panels.RightChat
	
	-- Tukui
	baseChatAddToggles(self)
	
	if C["General"]["Themes"]["Value"] == "MaxUI" then 
		for i = 1, 2 do
			
			if i == 1 then
				local Button = T.Chat.Panels.LeftChatToggle
				Button:ClearAllPoints()
				Button:SetPoint("LEFT", LeftChatBG, "LEFT", 0, 0)
			else
				local Button = T.Chat.Panels.RightChatToggle
				Button:ClearAllPoints()
				Button:SetPoint("RIGHT", RightChatBG, "RIGHT", 0, 0)
			end
		end
	end	
end

function Chat:HideChatFrame(button, id)
	if C["General"]["Themes"]["Value"] == "MaxUI" then 
		local Background = id == 1 and T.Chat.Panels.LeftChat or T.Chat.Panels.RightChat
		Background:Hide()

		for i = 1, 10 do
			local Chat =  _G["ChatFrame"..i]
			local Tab = _G["ChatFrame"..i.."Tab"]
			local Dock = GeneralDockManager

			if id == 1 and Chat.isDocked then
				Tab:SetParent(T.Hider)
				Dock:SetParent(T.Hider)
			elseif id == 2 and not Chat.isDocked then
				Tab:SetParent(T.Hider)
			end
		end

		button.state = "hidden"
		button.Texture:SetTexture(C.Medias.ArrowUp)

		local Data = TukuiDatabase.Variables[T.MyRealm][T.MyName]

		if id == 1 then
			Data.ChatLeftHidden = true
		elseif id == 2 then
			Data.ChatRightHidden = true
		end
	else
		baseChatHideToggle(self)
	end
end

function Chat:ShowChatFrame(button, id)
	
	if C["General"]["Themes"]["Value"] == "MaxUI" then 
		local Background = id == 1 and T.Chat.Panels.LeftChat or T.Chat.Panels.RightChat
		Background:Show()

		for i = 1, 10 do
			local Chat =  _G["ChatFrame"..i]
			local Tab = _G["ChatFrame"..i.."Tab"]
			local Dock = GeneralDockManager

			if id == 1 and Chat.isDocked then
				Tab:SetParent(UIParent)
				Dock:SetParent(UIParent)
			elseif id == 2 and not Chat.isDocked then
				Tab:SetParent(UIParent)
			end
		end

		button.state = "show"
		button.Texture:SetTexture(C.Medias.ArrowDown)

		local Data = TukuiDatabase.Variables[T.MyRealm][T.MyName]

		if id == 1 then
			Data.ChatLeftHidden = false
		elseif id == 2 then
			Data.ChatRightHidden = false
		end
	else
		baseChatShowToggle(self)	
	end
end
------------------------------------------------------------------------------------------
-- CHAT EDIT BOX SHORTCUT BUTTONS
------------------------------------------------------------------------------------------
function Chat:CreateChatTools()
	local LeftChatBG = T.Chat.Panels.LeftChat

	local ChatButtons = CreateFrame("Frame", "ChatButtons", LeftChatBG)
	ChatButtons:SetWidth((7*14) + (7*4))
	ChatButtons:SetHeight(24)
	ChatButtons:SetFrameStrata("MEDIUM")
	--ChatButtons:CreateBackdrop()
	if (C.General.Themes.Value == "MaxUI") then 
		if C["Tools"]["ChatShortcutsPosition"]["Value"] == "Topright" then
			ChatButtons:SetPoint("BOTTOMRIGHT", LeftChatBG, "TOPRIGHT", -4, 1)
		
		elseif C["Tools"]["ChatShortcutsPosition"]["Value"] == "Topleft" then
			ChatButtons:SetPoint("BOTTOMLEFT", LeftChatBG, "TOPLEFT", 4, 1)
		end	
	else
		if C["Tools"]["ChatShortcutsPosition"]["Value"] == "Topright" then
			ChatButtons:SetPoint("BOTTOMRIGHT", LeftChatBG, "TOPRIGHT", -4, 12)
		
		elseif C["Tools"]["ChatShortcutsPosition"]["Value"] == "Topleft" then
			ChatButtons:SetPoint("BOTTOMLEFT", LeftChatBG, "TOPLEFT", 4, 12)
		end	
	end
end

function Chat:CreateChatToolsButtons()
	-- Say Button
	ChatButtons.CreateConfigButton("SayButton", ChatButtons, 14, 14, "", "Open chat:", "Say (leftclick)\n|cffFF3F40Yell|r (rightclick) ",  ChatButtons)
	SayButton:SetPoint("RIGHT", ChatButtons, "RIGHT", -4, 0)
	SayButton:CreateShadow()
	SayButton.Backdrop:SetBackdropColor(1,1,1)
	
	local SayButtonOnMouseUp = function(self)
		SayButton.Backdrop:SetBackdropColor(1,1,1)
	end
	SayButton:SetScript("OnMouseUp", SayButtonOnMouseUp)
	
	SayButton:SetScript("OnMouseDown", function(self, btn)
		if btn == "RightButton" then
			ChatFrame_OpenChat("/y ", chatFrame)
		else
			ChatFrame_OpenChat("/s ", chatFrame)
		end
	end)
	
	-- Guild Button
	ChatButtons.CreateConfigButton("GuildButton", ChatButtons, 14, 14, "", "Open chat:", "|cff3CE13FGuild|r (leftclick)\n|cff40BC40Officer|r (rightclick) ", ChatButtons)
	GuildButton:SetPoint("RIGHT", SayButton, "LEFT", -4, 0)
	GuildButton:CreateShadow()
	GuildButton.Backdrop:SetBackdropColor(0.25, 1, 0.25)
	
	local GuildButtonOnMouseUp = function(self)
		GuildButton.Backdrop:SetBackdropColor(0.25, 1, 0.25)
	end
	GuildButton:SetScript("OnMouseUp", GuildButtonOnMouseUp)
	
	GuildButton:SetScript("OnMouseDown", function(self, btn)
		if btn == "RightButton" and CanEditOfficerNote() then
			ChatFrame_OpenChat("/o ", chatFrame)
		else
			ChatFrame_OpenChat("/g ", chatFrame)
		end
	end)

	-- Party Button
	ChatButtons.CreateConfigButton("PartyButton", ChatButtons, 14, 14, "", "Open chat:", "|cff77C8FFParty|r (any) ", ChatButtons)
	PartyButton:SetPoint("RIGHT", GuildButton, "LEFT", -4, 0)
	PartyButton:CreateShadow()
	PartyButton.Backdrop:SetBackdropColor(0.65, 0.65, 1)
	
	local PartyButtonOnMouseUp = function(self)
		PartyButton.Backdrop:SetBackdropColor(0.65, 0.65, 1)
	end
	PartyButton:SetScript("OnMouseUp", PartyButtonOnMouseUp)

	PartyButton:SetScript("OnMouseDown", function(self)
		ChatFrame_OpenChat("/p ", chatFrame)
	end)
	
	-- Instance/Raid Button
	if T.Retail then
		ChatButtons.CreateConfigButton("InstanceButton", ChatButtons, 14, 14, "", "Open chat:", "|cffFF7D01Instance|r (any)|n|cffFF7D01Raid|r (any) ", ChatButtons)
	else
		ChatButtons.CreateConfigButton("InstanceButton", ChatButtons, 14, 14, "", "Open chat:", "|cffFF7D01Raid|r (any) ", ChatButtons)
	end
		
	InstanceButton:SetPoint("RIGHT", PartyButton, "LEFT", -4, 0)
	InstanceButton:CreateShadow()
	InstanceButton.Backdrop:SetBackdropColor(1, 0.5, 0)
	
	local InstanceButtonOnMouseUp = function(self)
		InstanceButton.Backdrop:SetBackdropColor(1, 0.5, 0)
	end
	InstanceButton:SetScript("OnMouseUp", InstanceButtonOnMouseUp)

	InstanceButton:SetScript("OnMouseDown", function(self)
		
		if T.Retail then
			if IsPartyLFG() then
				ChatFrame_OpenChat("/i ", chatFrame)
			else
				ChatFrame_OpenChat("/raid ", chatFrame)
			end
		
		elseif T.BCC then
			ChatFrame_OpenChat("/raid ", chatFrame)
		end
	end)
	
	-- Whisper Reply Button
	ChatButtons.CreateConfigButton("WhisperButton", ChatButtons, 14, 14, "", "Open chat:", "|cffFF7EFFWhisper Target|r (leftclick)\n|cffFF7EFFReply Whisper|r (rightclick) ", ChatButtons)
	WhisperButton:SetPoint("RIGHT", InstanceButton, "LEFT", -4, 0)
	WhisperButton:CreateShadow()
	WhisperButton.Backdrop:SetBackdropColor(1, 0.5, 1)
	
	local WhisperButtonOnMouseUp = function(self)
		WhisperButton.Backdrop:SetBackdropColor(1, 0.5, 1)
	end
	WhisperButton:SetScript("OnMouseUp", WhisperButtonOnMouseUp)
	
	WhisperButton:SetScript("OnMouseDown", function(self, btn)
		local editBox = ChatEdit_ChooseBoxForSend()
		if btn == "RightButton" then
			ChatFrame_ReplyTell(chatFrame)
			if not editBox:IsVisible() or editBox:GetAttribute("chatType") ~= "WHISPER" then
				ChatFrame_OpenChat("/w ", chatFrame)
			end
		else
			if UnitExists("target") and UnitName("target") and UnitIsPlayer("target") and GetDefaultLanguage("player") == GetDefaultLanguage("target") then
				local name = GetUnitName("target", true)
				ChatFrame_OpenChat("/w "..name.." ", chatFrame)
			else
				ChatFrame_OpenChat("/w ", chatFrame)
			end
		end
	end)
	
	--language and emote Button
	ChatButtons.CreateConfigButton("LanguageEmoteButton", ChatButtons, 28, 14, "", "Chat:", "Language and emotes ", ChatButtons)
	LanguageEmoteButton:SetPoint("RIGHT", WhisperButton, "LEFT", -4, 0)
	LanguageEmoteButton:CreateShadow()
	
	LanguageEmoteButton.icon = LanguageEmoteButton:CreateTexture(nil, "OVERLAY")
	LanguageEmoteButton.icon:SetWidth(10)
	LanguageEmoteButton.icon:SetHeight(10)
	LanguageEmoteButton.icon:SetPoint("CENTER", LanguageEmoteButton, "CENTER", 0, 0)
	LanguageEmoteButton.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\menuicons\chat.tga]])
	
	LanguageEmoteButton:SetScript("OnMouseDown", function(self)
		local LeftBG = T.Chat.Panels.LeftChat
		if InCombatLockdown() then
			T.Print(ERR_NOT_IN_COMBAT)

			return
		end
		ToggleFrame(ChatMenu)
		ChatMenu:ClearAllPoints()
		ChatMenu:SetPoint("BOTTOMLEFT", LanguageEmoteButton, "TOPLEFT", -1, 6)
	end)
end

------------------------------------------------------------------------------------------
-- CHAT EXTENDED OPTIONS
------------------------------------------------------------------------------------------
function Chat:ChatBackgroundOptions()
	local LeftChatBG = T.Chat.Panels.LeftChat
	local RightChatBG = T.Chat.Panels.RightChat
	local LeftHeight = C["Chat"]["LeftHeight"]
	local RightHeight = C["Chat"]["RightHeight"]

	if C["Chat"]["BackgroundOptions"]["Value"] == "Logo" then
		LeftChatBG.LogoMaxUI = LeftChatBG:CreateTexture(nil, "ART")
		LeftChatBG.LogoMaxUI:SetAllPoints()
		LeftChatBG.LogoMaxUI:SetTexture(T.GetTexture("MaxUI"))

		RightChatBG.LogoMaxUI = RightChatBG:CreateTexture(nil, "ART")
		RightChatBG.LogoMaxUI:SetAllPoints()
		RightChatBG.LogoMaxUI:SetTexture(T.GetTexture("MaxUI"))

	elseif C["Chat"]["BackgroundOptions"]["Value"] == "Class" then
		LeftChatBG.Logoclass = LeftChatBG:CreateTexture(nil, "ART")
		LeftChatBG.Logoclass:SetWidth(LeftHeight)
		LeftChatBG.Logoclass:SetHeight(LeftHeight)
		LeftChatBG.Logoclass:SetPoint("CENTER", LeftChatBG, "CENTER", 0, 0)
		if C["Chat"]["Headers"] == true then 
			LeftChatBG.Logoclass:SetPoint("CENTER", LeftChatBG, "CENTER", 0, -10)
			LeftChatBG.Logoclass:SetWidth(LeftHeight-20)
			LeftChatBG.Logoclass:SetHeight(LeftHeight-20)
		end

		RightChatBG.Logoclass = RightChatBG:CreateTexture(nil, "ART")
		RightChatBG.Logoclass:SetWidth(RightHeight)
		RightChatBG.Logoclass:SetHeight(RightHeight)
		RightChatBG.Logoclass:SetPoint("CENTER", RightChatBG, "CENTER", 0, 0)
		if C["Chat"]["Headers"] == true then 
			RightChatBG.Logoclass:SetPoint("CENTER", RightChatBG, "CENTER", 0, -10)
			RightChatBG.Logoclass:SetWidth(RightHeight-20)
			RightChatBG.Logoclass:SetHeight(RightHeight-20)
		end

		if select(2, UnitClass('player')) == "DRUID" then
			LeftChatBG.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\DRUID.tga]])
			RightChatBG.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\DRUID.tga]])
		end
		
		if select(2, UnitClass('player')) == "MONK" then
			LeftChatBG.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\MONK.tga]])
			RightChatBG.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\MONK.tga]])
		end
		
		if select(2, UnitClass('player')) == "ROGUE" then
			LeftChatBG.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\ROGUE.tga]])
			RightChatBG.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\ROGUE.tga]])
		end
		
		if select(2, UnitClass('player')) == "MAGE" then
			LeftChatBG.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\MAGE.tga]])
			RightChatBG.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\MAGE.tga]])
		end
		
		if select(2, UnitClass('player')) == "PRIEST" then
			LeftChatBG.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\PRIEST.tga]])
			RightChatBG.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\PRIEST.tga]])
		end
		
		if select(2, UnitClass('player')) == "WARLOCK" then
			LeftChatBG.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\WARLOCK.tga]])
			RightChatBG.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\WARLOCK.tga]])
		end
		
		if select(2, UnitClass('player')) == "SHAMAN" then
			LeftChatBG.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\SHAMAN.tga]])
			RightChatBG.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\SHAMAN.tga]])
		end
		
		if select(2, UnitClass('player')) == "HUNTER" then
			LeftChatBG.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\HUNTER.tga]])
			RightChatBG.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\HUNTER.tga]])
		end
		
		if select(2, UnitClass('player')) == "DEATHKNIGHT" then
			LeftChatBG.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\DEATHKNIGHT.tga]])
			RightChatBG.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\DEATHKNIGHT.tga]])
		end
		
		if select(2, UnitClass('player')) == "WARRIOR" then
			LeftChatBG.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\WARRIOR.tga]])
			RightChatBG.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\WARRIOR.tga]])
		end
	
		if select(2, UnitClass('player')) == "PALADIN" then
			LeftChatBG.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\PALADIN.tga]])
			RightChatBG.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\PALADIN.tga]])
		end

		if select(2, UnitClass('player')) == "DEMONHUNTER" then
			LeftChatBG.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\DEMONHUNTER.tga]])
			RightChatBG.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\DEMONHUNTER.tga]])
		end
	
	elseif C["Chat"]["BackgroundOptions"]["Value"] == "Texture" then
		LeftChatBG.Texture = LeftChatBG:CreateTexture(nil, "ART")
		LeftChatBG.Texture:SetAllPoints()
		LeftChatBG.Texture:SetAlpha(C.Chat.ChattextureAlpha)
		LeftChatBG.Texture:SetVertexColor(unpack(C.Chat.ChattextureColor))
		LeftChatBG.Texture:SetTexture(T.GetTexture(C["Chat"]["Chattexture"]))

		RightChatBG.Texture = RightChatBG:CreateTexture(nil, "ART")
		RightChatBG.Texture:SetAllPoints()
		RightChatBG.Texture:SetAlpha(C.Chat.ChattextureAlpha)
		RightChatBG.Texture:SetVertexColor(unpack(C.Chat.ChattextureColor))
		RightChatBG.Texture:SetTexture(T.GetTexture(C["Chat"]["Chattexture"]))

	elseif C["Chat"]["BackgroundOptions"]["Value"] == "Blank" then

	elseif C["Chat"]["BackgroundOptions"]["Value"] == "Character" then
		ChatPlayerModel:SetFrameLevel(2)
		ChatPlayerModel:SetAlpha(1)
		ChatPlayerModel:SetPosition(2.5, 0, -0.9)
		ChatPlayerModel:SetAllPoints(RightChatBG)
	elseif C["Chat"]["BackgroundOptions"]["Value"] == "None" then
		LeftChatBG:SetAlpha(0)
		RightChatBG:SetAlpha(0)
	end
	
	if C["Skins"]["ChatFilter"] == true then 
		LeftChatBG.Filter = LeftChatBG:CreateTexture(nil, "OVERLAY")
		LeftChatBG.Filter:SetAllPoints()
		LeftChatBG.Filter:SetAlpha(C["Skins"]["FilterAlpha"])
		LeftChatBG.Filter:SetTexture(T.GetTexture("Overlay"))

		RightChatBG.Filter = RightChatBG:CreateTexture(nil, "OVERLAY")
		RightChatBG.Filter:SetAllPoints()
		RightChatBG.Filter:SetAlpha(C["Skins"]["FilterAlpha"])
		RightChatBG.Filter:SetTexture(T.GetTexture("Overlay"))
	end
end

function Chat:CombatStateChat()
	local DataTextLeft = T.DataTexts.Panels.Left
	local DataTextRight = T.DataTexts.Panels.Right
	local LeftChatBG = T.Chat.Panels.LeftChat
	local RightChatBG = T.Chat.Panels.RightChat

	if C["Chat"]["ChatBGCombatState"]["Value"] == "Hide" then
		RegisterStateDriver(LeftChatBG, "visibility", "[combat] hide; show")
		RegisterStateDriver(RightChatBG, "visibility", "[combat] hide; show")
	end
	
	if 	C["Chat"]["ChatBGCombatState"]["Value"] == "Show" then
		RegisterStateDriver(LeftChatBG, "visibility", "[combat] show; hide")
		RegisterStateDriver(RightChatBG, "visibility", "[combat] show; hide")
	end		

	-- combat state datatexts (Tukui theme)
	if C["General"]["Themes"]["Value"] == "Tukui" then 
		if C["DataTexts"]["DataTextsCombatState"]["Value"] == "Hide" then
			RegisterStateDriver(DataTextLeft, "visibility", "[combat] hide; show")
			RegisterStateDriver(DataTextRight, "visibility", "[combat] hide; show")
		end

		if 	C["DataTexts"]["DataTextsCombatState"]["Value"] == "Show" then
			RegisterStateDriver(DataTextLeft, "visibility", "[combat] show; hide")
			RegisterStateDriver(DataTextRight, "visibility", "[combat] show; hide")
		end	
	end	
end

function Chat:PositionTukui()
	local TabsBGRight = T.DataTexts.Panels.RightChatTabs 
	local TabsBGLeft = T.DataTexts.Panels.LeftChatTabs 
	local DataTextLeft = T.DataTexts.Panels.Left
	local DataTextRight = T.DataTexts.Panels.Right
	local LeftChatBG = T.Chat.Panels.LeftChat
	local RightChatBG = T.Chat.Panels.RightChat

	-- Tukui
	if C["General"]["Themes"]["Value"] == "Tukui" then 

		-- Top Chat
		if C["Chat"]["Position"]["Value"] == "Top" then
			DataTextLeft:ClearAllPoints()
			DataTextLeft:SetPoint("LEFT", TopLine, "LEFT", 4, 1)
			
			DataTextRight:ClearAllPoints()
			DataTextRight:SetPoint("RIGHT", TopLine, -4, 1)

			-- adjustments to chatbgs and tabs
			LeftChatBG:ClearAllPoints()
			LeftChatBG:SetPoint("TOP", DataTextLeft, "TOP", 0, 6)

			TabsBGLeft:ClearAllPoints()
			TabsBGLeft:SetPoint("BOTTOM", LeftChatBG, "BOTTOM", 0, 6)
			
			RightChatBG:ClearAllPoints()
			RightChatBG:SetPoint("TOP", DataTextRight, "TOP", 0, 6)
			
			TabsBGRight:ClearAllPoints()
			TabsBGRight:SetPoint("BOTTOM", RightChatBG, "BOTTOM", 0, 6)
		
		-- Bottom / Basic Chat
		elseif C["Chat"]["Position"]["Value"] == "Bottom" then
		
		end
	end

	-- T!7
	if C["General"]["Themes"]["Value"] == "Tukui 17" then 

		-- Top Chat
		if C["Chat"]["Position"]["Value"] == "Top" then

		-- Bottom/Basic Chat
		elseif C["Chat"]["Position"]["Value"] == "Bottom" then
		
		end
	end
end

function Chat:MaxUIStyleChat()
	local BottomLine = BottomLine
	local TabsBGRight = T.Chat.Panels.RightChatTabs 
	local TabsBGLeft = T.Chat.Panels.LeftChatTabs 
	local DataTextLeft = T.DataTexts.Panels.Left
	local DataTextRight = T.DataTexts.Panels.Right
	local LeftChatBG = T.Chat.Panels.LeftChat
	local RightChatBG = T.Chat.Panels.RightChat
	
	local y
	if C["General"]["thickness"] <=19 then
		y = 12
	else
		y = 6 
	end
	
	local LeftHeight = C["Chat"]["LeftHeight"]
	local RightHeight = C["Chat"]["RightHeight"]
	local LeftWidth = C["Chat"]["LeftWidth"]
	local RightWidth = C["Chat"]["RightWidth"]

	-- resize options adjust
	LeftChatBG:SetHeight(LeftHeight)
	LeftChatBG:SetWidth(LeftWidth)
	LeftChatBG.Backdrop:SetOutside()

	RightChatBG:SetHeight(RightHeight)
	RightChatBG:SetWidth(RightWidth)
	RightChatBG.Backdrop:SetOutside()

	-- Chat Left
	LeftChatBG:SetParent(UIParent)
	LeftChatBG:SetFrameLevel(1)
	LeftChatBG:SetFrameStrata("BACKGROUND")

	TabsBGLeft:ClearAllPoints()
	TabsBGLeft.Backdrop:CreateShadow()
	TabsBGLeft:SetWidth(LeftWidth)
	TabsBGLeft:SetHeight(20)
	TabsBGLeft:SetPoint("TOP", LeftChatBG, "TOP", 0, 0)
	TabsBGLeft:SetFrameLevel(3)

	TabsBGLeft.Tex = TabsBGLeft:CreateTexture(nil, "ART")
	TabsBGLeft.Tex:SetInside(TabsBGLeft)
	TabsBGLeft.Tex:SetTexture(T.GetTexture(C.General.HeaderTexture))
	TabsBGLeft.Tex:SetVertexColor(unpack(HeaderColor))
	if C["General"]["ClassColorHeaders"]["Value"] == "Dark" then 
		TabsBGLeft.Tex:SetVertexColor(0.11, 0.11, 0.11)
	elseif C["General"]["ClassColorHeaders"]["Value"] == "ClassColor" then 
		TabsBGLeft.Tex:SetVertexColor(unpack(ClassColor))
	elseif C["General"]["ClassColorHeaders"]["Value"] == "BackdropColor" then 
		TabsBGLeft.Tex:SetVertexColor(unpack(C.General.BackdropColor))
	else
		TabsBGLeft.Tex:SetVertexColor(0.43, 0.43, 0.43)
	end

	DataTextLeft:SetWidth(LeftWidth+2)
	DataTextLeft:Hide()

	-- Chat Right
	RightChatBG:SetParent(UIParent)
	RightChatBG:SetFrameLevel(1)
	RightChatBG:SetFrameStrata("BACKGROUND")

	TabsBGRight:ClearAllPoints()
	TabsBGRight.Backdrop:CreateShadow()
	TabsBGRight:SetWidth(RightWidth)
	TabsBGRight:SetHeight(20)
	TabsBGRight:SetPoint("TOP", RightChatBG, "TOP", 0, 0)

	TabsBGRight.Tex = TabsBGRight:CreateTexture(nil, "ART")
	TabsBGRight.Tex:SetInside(TabsBGRight)
	TabsBGRight.Tex:SetTexture(T.GetTexture(C.General.HeaderTexture))
	TabsBGRight.Tex:SetVertexColor(unpack(HeaderColor))
	if C["General"]["ClassColorHeaders"]["Value"] == "Dark" then 
		TabsBGRight.Tex:SetVertexColor(0.11, 0.11, 0.11)
	elseif C["General"]["ClassColorHeaders"]["Value"] == "ClassColor" then 
		TabsBGRight.Tex:SetVertexColor(unpack(ClassColor))
	elseif C["General"]["ClassColorHeaders"]["Value"] == "BackdropColor" then 
		TabsBGRight.Tex:SetVertexColor(unpack(C.General.BackdropColor))
	else
		TabsBGRight.Tex:SetVertexColor(0.43, 0.43, 0.43)
	end

	DataTextRight:SetWidth(RightWidth)
	DataTextRight:Hide()
		
	-- Option to show/hide the Chat Headers
	if C["Chat"]["Headers"] == false then
		TabsBGLeft:Hide()
		TabsBGRight:Hide()
	end

	-- Option to show/hide the Right Chat only
	if C["Chat"]["ShowRightChat"] == false then
		RightChatBG:Hide()
	end

	-- Position MaxUI Theme 
	LeftChatBG:ClearAllPoints()
	RightChatBG:ClearAllPoints()
	DataTextLeft:ClearAllPoints()
	DataTextRight:ClearAllPoints()

	-- Top Chat
	if C["Chat"]["Position"]["Value"] == "Top" then
		LeftChatBG:SetPoint("TOPLEFT", TopLine, "BOTTOMLEFT", 12, -y)
		RightChatBG:SetPoint("TOPRIGHT", TopLine, "BOTTOMRIGHT", -12, -y)
		DataTextLeft:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 18, -(32+LeftHeight+2))
		DataTextRight:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -18, -(32+RightHeight+2))

	-- Bottom/Basic Chat
	elseif C["Chat"]["Position"]["Value"] == "Bottom" then
		LeftChatBG:SetPoint("BOTTOMLEFT", BottomLine, "TOPLEFT", 0, y)
		RightChatBG:SetPoint("BOTTOMRIGHT", BottomLine, "TOPRIGHT", 0, y)
		
		DataTextLeft:SetPoint("TOP", LeftChatBG, "TOP", 0, 0)
		DataTextRight:SetPoint("TOP", RightChatBG, "BOTTOM", 0, 0)
	end
	
	-- map embed
	if C["Location"]["Position"]["Value"] == "EmbedChatRight" then
		RightChatBG:SetWidth(RightWidth - RightHeight)
		TabsBGRight:SetWidth(RightWidth - RightHeight)
		DataTextRight:SetWidth(RightWidth - RightHeight)
		
		RightChatBG:SetPoint("BOTTOMRIGHT", T.Maps.Minimap, "BOTTOMLEFT", -6, 0)
	end
end

function Chat:AddPanels()
	-- Tukui
	baseAddPanels(self)
	
	-- MaxUI
	self:ChatBackgroundOptions()
	if C["Tools"]["ChatShortcuts"] == true then
		self:CreateChatTools()
		self:CreateChatToolsButtons()
	end
	
	if C["Chat"]["TabDividers"] then
		self:CreateChatTabs()
	end
	
	if C["Chat"]["ChatBGCombatState"]["Value"] ~= "Nothing" then 
		self:CombatStateChat()
	end	
	
	if C["General"]["Themes"]["Value"] == "MaxUI" then 
		self:MaxUIStyleChat()
	else
		self:PositionTukui()
	end	
end

------------------------------------------------------------------------------------------
-- BNet toast frame anchoring
------------------------------------------------------------------------------------------

--[[
local Toast = BNToastFrame
function Chat:Setup()
	-- First call the base function
	baseSetup(self)
	
	local DataTextLeft = T.DataTexts.Panels.Left
	local LeftHeight = C["Chat"]["LeftChatHeight"]

	if not (C.General.Themes.Value == "MaxUI") then return end

	QuickJoinToastButton.ClearAllPoints = Toast.ClearAllPoints
	QuickJoinToastButton.SetPoint = Toast.SetPoint
	QuickJoinToastButton:ClearAllPoints()
	QuickJoinToastButton:SetPoint("BOTTOMLEFT", DataTextLeft, "TOPLEFT", 0, 120)
	QuickJoinToastButton.ClearAllPoints = function() end
	QuickJoinToastButton.SetPoint = function() end
end

]]