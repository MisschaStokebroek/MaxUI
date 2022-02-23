------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up GAME MENU DATATEXT, BAR AND BUTTON.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local DataText = T["DataTexts"]
local Misc = T["Miscellaneous"]
local Movers = T["Movers"]
local GameMenu = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- GAME MENU
------------------------------------------------------------------------------------------
local function CreateGameMenu()
	local buttonsize = C["Tools"]["ToolButtonSize"]
	local spacing = 2
		
	local GameMenuBG = CreateFrame("Frame", "GameMenuBG", UIParent)
	GameMenuBG:CreateBackdrop("Transparent")
	GameMenuBG:CreateShadow()
	if T.Retail then 
		GameMenuBG:SetHeight(buttonsize*3 + spacing*4)
	else
		GameMenuBG:SetHeight(buttonsize*2 + spacing*3)
	end
	GameMenuBG:SetWidth(buttonsize*10 + spacing*11)
	GameMenuBG:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 24)
	GameMenuBG:SetFrameLevel(15)
	GameMenuBG:SetFrameStrata("HIGH")
	GameMenuBG:Hide()
	GameMenuBG:SetAlpha(0)	
	GameMenuBG:CreateMaxUIHeader("MaxUI Micro Menu")
	
	Movers:RegisterFrame(GameMenuBG, "Micro Menu")

	local GameMenuClose = CreateFrame("Button", "GameMenuClose", GameMenuBG.MaxUIHeader)
	GameMenuClose:SetWidth(14)
	GameMenuClose:SetHeight(14)
	GameMenuClose:SetAlpha(0)
	GameMenuClose:SetPoint("RIGHT", GameMenuBG.MaxUIHeader, "RIGHT", -8, 0)
	
	GameMenuCloseicon = GameMenuBG.MaxUIHeader:CreateTexture(nil, "OVERLAY")
	GameMenuCloseicon:SetPoint("RIGHT", GameMenuBG.MaxUIHeader, "RIGHT", -8,0)
	GameMenuCloseicon:SetWidth(11)
	GameMenuCloseicon:SetHeight(11)
	GameMenuCloseicon:SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\Close.tga]])

	GameMenuClose:SetScript("OnEnter", function(self)
		GameMenuCloseicon:SetVertexColor(1, 0, 0)
	end)
	
	GameMenuClose:SetScript("OnLeave", function(self)
		GameMenuCloseicon:SetVertexColor(1, 1, 1)
	end)
	
	-- Animation
	GameMenuBG:fadeIn(C["General"]["FaderTime"])
	GameMenuBG:fadeOut(C["General"]["FaderTime"])
	GameMenuClose:SetScript("OnMouseUp", function(self) GameMenuBG:fadeToggle() end)

	-- temp fix for datatext not running function from API.
	function GameMenuFadeToggle()
	    if GameMenuBG:IsShown() then
	        GameMenuBG.fadeOut:Play()
	    else
	        GameMenuBG:Show()
	        GameMenuBG.fadeIn:Play()
	    end
	end
	
	-- Combat State
	RegisterStateDriver(GameMenuBG, "visibility", "[combat] hide; nil")
end

local function CreateGameMenuButtons()
	local buttonsize = C["Tools"]["ToolButtonSize"]
	local spacing = 2

	--Button 1 - Character Info
	GameMenuBG.CreateToolButton("GameMenuButton01", GameMenuBG, buttonsize, buttonsize, "", "Character: ", "Open character info ", GameMenuBG.MaxUIHeader)
	GameMenuButton01:SetPoint("TOPLEFT", GameMenuBG, "TOPLEFT", spacing, -spacing)
	GameMenuButton01.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\microbar\char.tga]])
	GameMenuButton01:SetScript("OnMouseDown", function(self)
		ToggleCharacter("PaperDollFrame")
	end)

	--Button 2 - Spellbook
	GameMenuBG.CreateToolButton("GameMenuButton02", GameMenuBG, buttonsize, buttonsize, "", "Character: ", "Open spellbook & abilities ", GameMenuBG.MaxUIHeader)
	GameMenuButton02:SetPoint("LEFT", GameMenuButton01, "RIGHT", spacing, 0)
	GameMenuButton02.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\microbar\spell.tga]])
	GameMenuButton02:SetScript("OnMouseDown", function(self)
		ToggleFrame(SpellBookFrame)
	end)

	--Button 3 - Talent
	GameMenuBG.CreateToolButton("GameMenuButton03", GameMenuBG, buttonsize, buttonsize, "", "Character: ", "Open specialization & talents ", GameMenuBG.MaxUIHeader)
	GameMenuButton03:SetPoint("LEFT", GameMenuButton02, "RIGHT", spacing, 0)
	--GameMenuButton03:SetAttribute("macrotext1", "/qs")
	GameMenuButton03.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\microbar\talent.tga]])
	GameMenuButton03:SetScript("OnMouseDown", function(self)
		if T.Retail then
			SpecBarFadeToggle()
		else
			ToggleTalentFrame()
		end
	end)

	--Button 4 - Guild
	GameMenuBG.CreateToolButton("GameMenuButton04", GameMenuBG, buttonsize, buttonsize, "", "Guild: ", "Open guild info and communities ", GameMenuBG.MaxUIHeader)
	GameMenuButton04:SetPoint("LEFT", GameMenuButton03, "RIGHT", spacing, 0)
	GameMenuButton04.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\microbar\guild.tga]])
	GameMenuButton04:SetScript("OnMouseDown", function(self)
		if IsInGuild() then
			if (not GuildFrame) then
				GuildFrame_LoadUI()
			end
			ToggleGuildFrame()
		else
			if (not LookingForGuildFrame) then
				LookingForGuildFrame_LoadUI()
			end
			LookingForGuildFrame_Toggle()
		end
	end)

	--Button 5 - Social
	GameMenuBG.CreateToolButton("GameMenuButton05", GameMenuBG, buttonsize, buttonsize, "", "Social: ", "Open friends tab ", GameMenuBG.MaxUIHeader)
	GameMenuButton05:SetPoint("LEFT", GameMenuButton04, "RIGHT", spacing, 0)
	GameMenuButton05.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\microbar\social.tga]])
	GameMenuButton05:SetScript("OnMouseDown", function(self)
		ToggleFriendsFrame(1)
	end)

	--Button 6 - Raid
	GameMenuBG.CreateToolButton("GameMenuButton06", GameMenuBG, buttonsize, buttonsize, "", "Social: ", "Open raid tab ", GameMenuBG.MaxUIHeader)
	GameMenuButton06:SetPoint("LEFT", GameMenuButton05, "RIGHT", spacing, 0)
	GameMenuButton06.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\microbar\social.tga]])
	GameMenuButton06:SetScript("OnMouseDown", function(self)
		ToggleFriendsFrame(4)
	end)

	--Button 7 - Questlog
	GameMenuBG.CreateToolButton("GameMenuButton07", GameMenuBG, buttonsize, buttonsize, "", "Quest Log: ", "Open quest log ", GameMenuBG.MaxUIHeader)
	GameMenuButton07:SetPoint("LEFT", GameMenuButton06, "RIGHT", spacing, 0)
	GameMenuButton07.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\microbar\quest.tga]])
	GameMenuButton07:SetScript("OnMouseDown", function(self)
		if T.BCC then 
			ShowUIPanel(QuestLogFrame)
		elseif T.Retail then
			ToggleQuestLog()		
		end
	end)

	--Button 8 - WorldMap
	GameMenuBG.CreateToolButton("GameMenuButton08", GameMenuBG, buttonsize, buttonsize, "", "Map: ", "Open world map ", GameMenuBG.MaxUIHeader)
	GameMenuButton08:SetPoint("LEFT", GameMenuButton07, "RIGHT", spacing, 0)
	GameMenuButton08.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\microbar\location.tga]])
	GameMenuButton08:SetScript("OnMouseDown", function(self)
		ShowUIPanel(WorldMapFrame)
		MaximizeUIPanel(WorldMapFrame)
	end)

	--Button 9 - Customer Support
	GameMenuBG.CreateToolButton("GameMenuButton09", GameMenuBG, buttonsize, buttonsize, "", "Customer Support: ", "Open customer support ", GameMenuBG.MaxUIHeader)
	GameMenuButton09:SetPoint("LEFT", GameMenuButton08, "RIGHT", spacing, 0)
	GameMenuButton09.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\microbar\help.tga]])
	GameMenuButton09:SetScript("OnMouseDown", function(self)
		ToggleHelpFrame()
	end)

	--Button 10 - Compose a Tweet
	GameMenuBG.CreateToolButton("GameMenuButton10", GameMenuBG, buttonsize, buttonsize, "", "Tweet: ", "Compose a tweet (if account is linked) ", GameMenuBG.MaxUIHeader)
	GameMenuButton10:SetPoint("LEFT", GameMenuButton09, "RIGHT", spacing, 0)
	GameMenuButton10.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\microbar\chat.tga]])
	GameMenuButton10:SetScript("OnMouseUp", function(self)
		if not SocialPostFrame then
			LoadAddOn("Blizzard_SocialUI")
		end
		local IsTwitterEnabled = C_Social.IsSocialEnabled()
		if IsTwitterEnabled then
			Social_SetShown(true)
		else
			T.Print(SOCIAL_TWITTER_TWEET_NOT_LINKED)
		end
	end)

 -- RETAIL EXTRA BUTTONS
	if T.Retail then 
	
		--Button 11 - Achievements
		GameMenuBG.CreateToolButton("GameMenuButton11", GameMenuBG, buttonsize, buttonsize, "", "Achievements: ", "Open achievements ", GameMenuBG.MaxUIHeader)
		GameMenuButton11:SetPoint("TOP", GameMenuButton01, "BOTTOM", 0, -spacing)
		GameMenuButton11.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\microbar\ach.tga]])
		GameMenuButton11:SetScript("OnMouseDown", function(self)
			ToggleAchievementFrame()
		end)

		--Button 12 - Mounts
		GameMenuBG.CreateToolButton("GameMenuButton12", GameMenuBG, buttonsize, buttonsize, "", "Collection Journal: ", "Open mounts tab ", GameMenuBG.MaxUIHeader)
		GameMenuButton12:SetPoint("LEFT", GameMenuButton11, "RIGHT", spacing, 0)
		GameMenuButton12.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\microbar\pet.tga]])
		GameMenuButton12:SetScript("OnMouseDown", function(self)
			ToggleCollectionsJournal(1)
		end)

		--Button 13 - Pets
		GameMenuBG.CreateToolButton("GameMenuButton13", GameMenuBG, buttonsize, buttonsize, "", "Collection Journal: ", "Open pets tab ", GameMenuBG.MaxUIHeader)
		GameMenuButton13:SetPoint("LEFT", GameMenuButton12, "RIGHT", spacing, 0)
		GameMenuButton13.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\microbar\pet.tga]])
		GameMenuButton13:SetScript("OnMouseDown", function(self)
			ToggleCollectionsJournal(2)
		end)

		--Button 14 - Toy Box
		GameMenuBG.CreateToolButton("GameMenuButton14", GameMenuBG, buttonsize, buttonsize, "", "Collection Journal: ", "Open toy box tab ", GameMenuBG.MaxUIHeader)
		GameMenuButton14:SetPoint("LEFT", GameMenuButton13, "RIGHT", spacing, 0)
		GameMenuButton14.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\microbar\toybox.tga]])
		GameMenuButton14.icon:SetWidth(12)
		GameMenuButton14.icon:SetHeight(12)
		GameMenuButton14:SetScript("OnMouseDown", function(self)
			ToggleCollectionsJournal(3)
		end)

		--Button 15 - Heirlooms
		GameMenuBG.CreateToolButton("GameMenuButton15", GameMenuBG, buttonsize, buttonsize, "", "Collection Journal: ", "Open heirlooms tab ", GameMenuBG.MaxUIHeader)
		GameMenuButton15:SetPoint("LEFT", GameMenuButton14, "RIGHT", spacing, 0)
		GameMenuButton15.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\microbar\heirlooms.tga]])
		GameMenuButton15.icon:SetWidth(12)
		GameMenuButton15.icon:SetHeight(12)
		GameMenuButton15:SetScript("OnMouseDown", function(self)
			ToggleCollectionsJournal(4)
		end)

		--Button 16 - Dressing room
		GameMenuBG.CreateToolButton("GameMenuButton16", GameMenuBG, buttonsize, buttonsize, "", "Collection Journal: ", "Open transmogrification tab ", GameMenuBG.MaxUIHeader)
		GameMenuButton16:SetPoint("LEFT", GameMenuButton15, "RIGHT", spacing, 0)
		GameMenuButton16.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\microbar\bag.tga]])
		GameMenuButton16.icon:SetWidth(12)
		GameMenuButton16.icon:SetHeight(12)
		GameMenuButton16:SetScript("OnMouseDown", function(self)
			ToggleCollectionsJournal(5)
		end)

		--Button 17 - PVE LF group tool
		GameMenuBG.CreateToolButton("GameMenuButton17", GameMenuBG, buttonsize, buttonsize, "", "Looking for Group: ", "Open the dungeon finder and looking for group tool ", GameMenuBG.MaxUIHeader)
		GameMenuButton17:SetPoint("LEFT", GameMenuButton16, "RIGHT", spacing, 0)
		GameMenuButton17.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\microbar\pvp.tga]])
		GameMenuButton17:SetScript("OnMouseDown", function(self)
			PVEFrame_ToggleFrame()
		end)


		--Button 18 - Event Calendar
		GameMenuBG.CreateToolButton("GameMenuButton18", GameMenuBG, buttonsize, buttonsize, "", "Events: ", "Open the event calendar ", GameMenuBG.MaxUIHeader)
		GameMenuButton18:SetPoint("LEFT", GameMenuButton17, "RIGHT", spacing, 0)
		GameMenuButton18.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\menuicons\calendar.tga]])
		GameMenuButton18:SetScript("OnMouseDown", function(self)
			if (not CalendarFrame) then
			LoadAddOn("Blizzard_Calendar")
			end
			Calendar_Toggle()
		end)

		--Button 19 - Dungeon Journal
		GameMenuBG.CreateToolButton("GameMenuButton19", GameMenuBG, buttonsize, buttonsize, "", "Dungeon Journal: ", "Open the dungeon journal ", GameMenuBG.MaxUIHeader)
		GameMenuButton19:SetPoint("LEFT", GameMenuButton18, "RIGHT", spacing, 0)
		GameMenuButton19.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\microbar\journal.tga]])
		GameMenuButton19:SetScript("OnMouseDown", function(self)
			ToggleEncounterJournal()
		end)

		--Button 20 - Garrison Report
		GameMenuBG.CreateToolButton("GameMenuButton20", GameMenuBG, buttonsize, buttonsize, "", "Missions: ", "Open garrison / class hall / war campaign / covenant report ", GameMenuBG.MaxUIHeader)
		GameMenuButton20:SetPoint("LEFT", GameMenuButton19, "RIGHT", spacing, 0)
		GameMenuButton20.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\microbar\location.tga]])
		GameMenuButton20.icon:SetWidth(12)
		GameMenuButton20.icon:SetHeight(12)
		GameMenuButton20:SetScript("OnMouseDown", function(self)
			GarrisonLandingPage_Toggle()
		end)
	end
	
	--Button - TukUI config
	GameMenuBG.CreateToolButton("GameMenuButtonConfig", GameMenuBG, ((buttonsize*5) + (spacing*4)), buttonsize, "", "Game Menu: ", "Open the Tukui/MaxUI GUI ", GameMenuBG.MaxUIHeader)
	if T.Retail then
		GameMenuButtonConfig:SetPoint("TOPLEFT", GameMenuButton11, "BOTTOMLEFT", 0, -spacing)
	else
		GameMenuButtonConfig:SetPoint("TOPLEFT", GameMenuButton01, "BOTTOMLEFT", 0, -spacing)
	end
	GameMenuButtonConfig.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\menuicons\config.tga]])
	GameMenuButtonConfig.icon:SetWidth(buttonsize -4)
	GameMenuButtonConfig:SetAttribute("macrotext1", "/tukui c")
	GameMenuButtonConfig:SetScript("OnMouseUp", function()
		if GameMenuFrame:IsShown() then
			GameMenuFrame:Hide()
		end
	end)

	--Button - TukUI config
	GameMenuBG.CreateToolButton("GameMenuButtonEscape", GameMenuBG, ((buttonsize*5) + (spacing*4)), buttonsize, "", "Game Menu: ", "Open the Blizzard game menu ", GameMenuBG.MaxUIHeader)
	if T.Retail then
		GameMenuButtonEscape:SetPoint("TOPRIGHT", GameMenuButton20, "BOTTOMRIGHT", 0, -spacing)
	else
		GameMenuButtonEscape:SetPoint("TOPRIGHT", GameMenuButton10, "BOTTOMRIGHT", 0, -spacing)
	end
	GameMenuButtonEscape.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\menuicons\logout.tga]])
	GameMenuButtonEscape.icon:SetWidth(buttonsize -4)
	GameMenuButtonEscape:SetAttribute("macrotext1", " ")
	GameMenuButtonEscape:SetScript("OnMouseUp", function()
		if GameMenuFrame:IsShown() then
			GameMenuFrame:Hide()
		else
			GameMenuFrame:Show()
		end
	end)
end

function GameMenu:Enable()
	CreateGameMenu()
	CreateGameMenuButtons()
end	

function GameMenu:OnEvent(event)
	if C["Tools"]["GameMenu"] == true then
		self:Enable()
	end
end

GameMenu:RegisterEvent("PLAYER_LOGIN")
GameMenu:SetScript("OnEvent", GameMenu.OnEvent)

DataText.GameMenu = GameMenu

------------------------------------------------------------------------------------------
-- GAME MENU DATATEXT
------------------------------------------------------------------------------------------
local Update = function(self)
	if C["Tools"]["GameMenu"] == true then
		self.Text:SetFormattedText("%s", DataText.NameColor .. "Game Menu|r")
		
		if C["DataTexts"]["Icons"] == true then
			self.icon = self:CreateTexture(nil, "OVERLAY")
			self.icon:SetWidth(17)
			self.icon:SetHeight(17)
			self.icon:SetPoint("LEFT", self, "CENTER", 45, 0)
			self.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\menuicons\infobars.tga]])
			self.icon:SetVertexColor(unpack(C["DataTexts"].ValueColor))
		end
		
		self:SetScript("OnEnter", function(self)
			self.Text:SetFormattedText("%s", DataText.HighlightColor .. "Game Menu|r")
			if C["DataTexts"]["Icons"] == true then
				self.icon:SetVertexColor(unpack(C["DataTexts"].HighlightColor))
			end
			GameTooltip:SetOwner(self:GetTooltipAnchor())
			GameTooltip:AddLine("Game Menu:")
			GameTooltip:AddLine("Toggle the MaxUI Game Menu ", 1, 1, 1, 1, 1, 1)
			GameTooltip:Show()
		end)
		
		self:SetScript("OnLeave", function(self)
			self.Text:SetFormattedText("%s", DataText.NameColor .. "Game Menu|r")
			if C["DataTexts"]["Icons"] == true then
				self.icon:SetVertexColor(unpack(C["DataTexts"].ValueColor))
			end
			GameTooltip:Hide()
		end)
	end
end

local OnMouseDown = function()
	if InCombatLockdown() then
		T.Print(ERR_NOT_IN_COMBAT)

		return
	end
	GameMenuFadeToggle()
end

local Enable = function(self)
	self:SetScript("OnMouseDown", OnMouseDown)
	self:Update()
end

local Disable = function(self)
	self:SetScript("OnMouseDown", nil)
end

DataText:Register("|cffFFFF99Game Menu|r", Enable, Disable, Update)