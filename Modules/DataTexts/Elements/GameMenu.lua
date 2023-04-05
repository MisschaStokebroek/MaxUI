------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
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
local GUI = T["GUI"]

------------------------------------------------------------------------------------------
-- GAME MENU
------------------------------------------------------------------------------------------
local function CreateGameMenu()
	local buttonsize = C["General"]["ButtonSize"]
	local spacing = 3
		
	local GameMenuBG = CreateFrame("Frame", "GameMenuBG", UIParent)
	GameMenuBG:SkinMaxUIFrame()
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
	GameMenuBG:CreateMaxUICloseButton(GameMenuBG.MaxUIHeader)

	Movers:RegisterFrame(GameMenuBG, "Micro Menu")
	
	-- Combat State
	RegisterStateDriver(GameMenuBG, "visibility", "[combat] hide; nil")
end

local function CreateGameMenuButtons()
	local buttonsize = C["General"]["ButtonSize"]
	local spacing = 3

	--Button 1 - Character Info
	GameMenuBG.CreateMaxUIButton("GameMenuButton01", GameMenuBG, buttonsize, buttonsize, "", "Character: ", "Open character info ", GameMenuBG.MaxUIHeader)
	GameMenuButton01:SetPoint("TOPLEFT", GameMenuBG, "TOPLEFT", spacing, -spacing)
	if C["General"]["ButtonStyle"]["Value"] == "Blizzard" then
		GameMenuButton01.icon:SetTexture("Interface\\Icons\\Achievement_character_human_male")
	else
		GameMenuButton01.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cChar.tga]])
	end
	GameMenuButton01:SetScript("OnMouseDown", function(self)
		ToggleCharacter("PaperDollFrame")
	end)

	--Button 2 - Spellbook
	GameMenuBG.CreateMaxUIButton("GameMenuButton02", GameMenuBG, buttonsize, buttonsize, "", "Character: ", "Open spellbook & abilities ", GameMenuBG.MaxUIHeader)
	GameMenuButton02:SetPoint("LEFT", GameMenuButton01, "RIGHT", spacing, 0)
	if C["General"]["ButtonStyle"]["Value"] == "Blizzard" then
		GameMenuButton02.icon:SetTexture("Interface\\Icons\\Inv_misc_book_09")
	else
		GameMenuButton02.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cSpell.tga]])
	end
	GameMenuButton02:SetScript("OnMouseDown", function(self)
		ToggleFrame(SpellBookFrame)
	end)

	--Button 3 - Talent
	GameMenuBG.CreateMaxUIButton("GameMenuButton03", GameMenuBG, buttonsize, buttonsize, "", "Character: ", "Open specialization & talents ", GameMenuBG.MaxUIHeader)
	GameMenuButton03:SetPoint("LEFT", GameMenuButton02, "RIGHT", spacing, 0)
	if C["General"]["ButtonStyle"]["Value"] == "Blizzard" then
		GameMenuButton03.icon:SetTexture("Interface\\Icons\\Ability_marksmanship")
	else
		GameMenuButton03.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cTalent.tga]])
	end
	GameMenuButton03:SetScript("OnMouseDown", function(self)
		if T.Retail then
			SpecBar:fadeToggle()
		else
			ToggleTalentFrame()
		end
	end)

	--Button 4 - Guild
	GameMenuBG.CreateMaxUIButton("GameMenuButton04", GameMenuBG, buttonsize, buttonsize, "", "Guild: ", "Open guild info and communities ", GameMenuBG.MaxUIHeader)
	GameMenuButton04:SetPoint("LEFT", GameMenuButton03, "RIGHT", spacing, 0)
	if C["General"]["ButtonStyle"]["Value"] == "Blizzard" then
		GameMenuButton04.icon:SetTexture("Interface\\Icons\\Inv_shirt_guildtabard_01")
	else
		GameMenuButton04.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cGuild.tga]])
	end
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
	GameMenuBG.CreateMaxUIButton("GameMenuButton05", GameMenuBG, buttonsize, buttonsize, "", "Social: ", "Open friends tab ", GameMenuBG.MaxUIHeader)
	GameMenuButton05:SetPoint("LEFT", GameMenuButton04, "RIGHT", spacing, 0)
	if C["General"]["ButtonStyle"]["Value"] == "Blizzard" then
		GameMenuButton05.icon:SetTexture("Interface\\Icons\\Inv_misc_grouplooking")
	else
		GameMenuButton05.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cSocial.tga]])
	end
	GameMenuButton05:SetScript("OnMouseDown", function(self)
		ToggleFriendsFrame(1)
	end)

	--Button 6 - Raid
	GameMenuBG.CreateMaxUIButton("GameMenuButton06", GameMenuBG, buttonsize, buttonsize, "", "Social: ", "Open raid tab ", GameMenuBG.MaxUIHeader)
	GameMenuButton06:SetPoint("LEFT", GameMenuButton05, "RIGHT", spacing, 0)
	if C["General"]["ButtonStyle"]["Value"] == "Blizzard" then
		GameMenuButton06.icon:SetTexture("Interface\\Icons\\Achievement_guildperk_everybodysfriend")
	else
		GameMenuButton06.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cSocial.tga]])
	end
	GameMenuButton06:SetScript("OnMouseDown", function(self)
		ToggleFriendsFrame(4)
	end)

	--Button 7 - Questlog
	GameMenuBG.CreateMaxUIButton("GameMenuButton07", GameMenuBG, buttonsize, buttonsize, "", "Quest Log: ", "Open quest log ", GameMenuBG.MaxUIHeader)
	GameMenuButton07:SetPoint("LEFT", GameMenuButton06, "RIGHT", spacing, 0)
	if C["General"]["ButtonStyle"]["Value"] == "Blizzard" then
		GameMenuButton07.icon:SetTexture("Interface\\Icons\\Achievement_quests_completed_mounthyjal")
	else
		GameMenuButton07.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cQuest.tga]])
	end
	GameMenuButton07:SetScript("OnMouseDown", function(self)
		if T.BCC then 
			ShowUIPanel(QuestLogFrame)
		elseif T.Retail then
			ToggleQuestLog()		
		end
	end)

	--Button 8 - WorldMap
	GameMenuBG.CreateMaxUIButton("GameMenuButton08", GameMenuBG, buttonsize, buttonsize, "", "Map: ", "Open world map ", GameMenuBG.MaxUIHeader)
	GameMenuButton08:SetPoint("LEFT", GameMenuButton07, "RIGHT", spacing, 0)
	if C["General"]["ButtonStyle"]["Value"] == "Blizzard" then
		GameMenuButton08.icon:SetTexture("Interface\\Icons\\Inv_misc_map02")
	else
		GameMenuButton08.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cLocation.tga]])
	end
	GameMenuButton08:SetScript("OnMouseDown", function(self)
		--ShowUIPanel(WorldMapFrame)
		--MaximizeUIPanel(WorldMapFrame)
		if WorldMapFrame:IsShown() then
			WorldMapFrame:Hide()
		else
			WorldMapFrame:Show()
		end
	end)

	--Button 9 - Customer Support
	GameMenuBG.CreateMaxUIButton("GameMenuButton09", GameMenuBG, buttonsize, buttonsize, "", "Customer Support: ", "Open customer support ", GameMenuBG.MaxUIHeader)
	GameMenuButton09:SetPoint("LEFT", GameMenuButton08, "RIGHT", spacing, 0)
	if C["General"]["ButtonStyle"]["Value"] == "Blizzard" then
		GameMenuButton09.icon:SetTexture("Interface\\Icons\\Inv_pet_babyblizzardbear")
	else
		GameMenuButton09.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cHelp.tga]])
	end
	GameMenuButton09:SetScript("OnMouseDown", function(self)
		ToggleHelpFrame()
	end)

	--Button 10 - Compose a Tweet
	GameMenuBG.CreateMaxUIButton("GameMenuButton10", GameMenuBG, buttonsize, buttonsize, "", "Tweet: ", "Compose a tweet (if account is linked) ", GameMenuBG.MaxUIHeader)
	GameMenuButton10:SetPoint("LEFT", GameMenuButton09, "RIGHT", spacing, 0)
	if C["General"]["ButtonStyle"]["Value"] == "Blizzard" then
			GameMenuButton10.icon:SetTexture("Interface\\Icons\\Ability_garrison_orangebird")
	else
		GameMenuButton10.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cTwitter.tga]])
	end
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
		GameMenuBG.CreateMaxUIButton("GameMenuButton11", GameMenuBG, buttonsize, buttonsize, "", "Achievements: ", "Open achievements ", GameMenuBG.MaxUIHeader)
		GameMenuButton11:SetPoint("TOP", GameMenuButton01, "BOTTOM", 0, -spacing)
		if C["General"]["ButtonStyle"]["Value"] == "Blizzard" then
			GameMenuButton11.icon:SetTexture("Interface\\Icons\\Achievement_level_60")
		else
			GameMenuButton11.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cAchieve.tga]])
		end
		GameMenuButton11:SetScript("OnMouseDown", function(self)
			ToggleAchievementFrame()
		end)

		--Button 12 - Mounts
		GameMenuBG.CreateMaxUIButton("GameMenuButton12", GameMenuBG, buttonsize, buttonsize, "", "Collection Journal: ", "Open mounts tab ", GameMenuBG.MaxUIHeader)
		GameMenuButton12:SetPoint("LEFT", GameMenuButton11, "RIGHT", spacing, 0)
		if C["General"]["ButtonStyle"]["Value"] == "Blizzard" then
			GameMenuButton12.icon:SetTexture("Interface\\Icons\\Achievement_guildperk_mountup")
		else
			GameMenuButton12.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cMount.tga]])
		end
		GameMenuButton12:SetScript("OnMouseDown", function(self)
			ToggleCollectionsJournal(1)
		end)

		--Button 13 - Pets
		GameMenuBG.CreateMaxUIButton("GameMenuButton13", GameMenuBG, buttonsize, buttonsize, "", "Collection Journal: ", "Open pets tab ", GameMenuBG.MaxUIHeader)
		GameMenuButton13:SetPoint("LEFT", GameMenuButton12, "RIGHT", spacing, 0)
		if C["General"]["ButtonStyle"]["Value"] == "Blizzard" then
			GameMenuButton13.icon:SetTexture("Interface\\Icons\\Spell_misc_petheal")
		else
			GameMenuButton13.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cPet.tga]])
		end
		GameMenuButton13:SetScript("OnMouseDown", function(self)
			ToggleCollectionsJournal(2)
		end)

		--Button 14 - Toy Box
		GameMenuBG.CreateMaxUIButton("GameMenuButton14", GameMenuBG, buttonsize, buttonsize, "", "Collection Journal: ", "Open toy box tab ", GameMenuBG.MaxUIHeader)
		GameMenuButton14:SetPoint("LEFT", GameMenuButton13, "RIGHT", spacing, 0)
		if C["General"]["ButtonStyle"]["Value"] == "Blizzard" then
			GameMenuButton14.icon:SetTexture("Interface\\Icons\\Inv_misc_toy_10")
		else
			GameMenuButton14.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cToy.tga]])
		end
		GameMenuButton14:SetScript("OnMouseDown", function(self)
			ToggleCollectionsJournal(3)
		end)

		--Button 15 - Heirlooms
		GameMenuBG.CreateMaxUIButton("GameMenuButton15", GameMenuBG, buttonsize, buttonsize, "", "Collection Journal: ", "Open heirlooms tab ", GameMenuBG.MaxUIHeader)
		GameMenuButton15:SetPoint("LEFT", GameMenuButton14, "RIGHT", spacing, 0)
		if C["General"]["ButtonStyle"]["Value"] == "Blizzard" then
			GameMenuButton15.icon:SetTexture("Interface\\Icons\\Inv_icon_heirloomtoken_weapon01")
		else
			GameMenuButton15.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cHeirloom.tga]])
		end
		GameMenuButton15:SetScript("OnMouseDown", function(self)
			ToggleCollectionsJournal(4)
		end)

		--Button 16 - Dressing room
		GameMenuBG.CreateMaxUIButton("GameMenuButton16", GameMenuBG, buttonsize, buttonsize, "", "Collection Journal: ", "Open transmogrification tab ", GameMenuBG.MaxUIHeader)
		GameMenuButton16:SetPoint("LEFT", GameMenuButton15, "RIGHT", spacing, 0)
		if C["General"]["ButtonStyle"]["Value"] == "Blizzard" then
			GameMenuButton16.icon:SetTexture("Interface\\Icons\\Ui_calendar_freetshirtday")
		else
			GameMenuButton16.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cTransmog.tga]])
		end
		GameMenuButton16:SetScript("OnMouseDown", function(self)
			ToggleCollectionsJournal(5)
		end)

		--Button 17 - PVE LF group tool
		GameMenuBG.CreateMaxUIButton("GameMenuButton17", GameMenuBG, buttonsize, buttonsize, "", "Looking for Group: ", "Open the dungeon finder and looking for group tool ", GameMenuBG.MaxUIHeader)
		GameMenuButton17:SetPoint("LEFT", GameMenuButton16, "RIGHT", spacing, 0)
		if C["General"]["ButtonStyle"]["Value"] == "Blizzard" then
			GameMenuButton17.icon:SetTexture("Interface\\Icons\\Inv_misc_groupneedmore")
		else
			GameMenuButton17.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cSocial.tga]])
		end
		GameMenuButton17:SetScript("OnMouseDown", function(self)
			PVEFrame_ToggleFrame()
		end)

		--Button 18 - Event Calendar
		GameMenuBG.CreateMaxUIButton("GameMenuButton18", GameMenuBG, buttonsize, buttonsize, "", "Events: ", "Open the event calendar ", GameMenuBG.MaxUIHeader)
		GameMenuButton18:SetPoint("LEFT", GameMenuButton17, "RIGHT", spacing, 0)
		if C["General"]["ButtonStyle"]["Value"] == "Blizzard" then
			GameMenuButton18.icon:SetTexture("Interface\\Icons\\Inv_misc_pocketwatch_02")
		else
			GameMenuButton18.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cCalendar.tga]])
		end
		GameMenuButton18:SetScript("OnMouseDown", function(self)
			if (not CalendarFrame) then
			LoadAddOn("Blizzard_Calendar")
			end
			Calendar_Toggle()
		end)

		--Button 19 - Dungeon Journal
		GameMenuBG.CreateMaxUIButton("GameMenuButton19", GameMenuBG, buttonsize, buttonsize, "", "Dungeon Journal: ", "Open the dungeon journal ", GameMenuBG.MaxUIHeader)
		GameMenuButton19:SetPoint("LEFT", GameMenuButton18, "RIGHT", spacing, 0)
		if C["General"]["ButtonStyle"]["Value"] == "Blizzard" then
			GameMenuButton19.icon:SetTexture("Interface\\Icons\\Achievement_zone_stonetalon_01")
		else
			GameMenuButton19.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cJournal.tga]])
		end
		GameMenuButton19:SetScript("OnMouseDown", function(self)
			ToggleEncounterJournal()
		end)

		--Button 20 - Garrison Report
		GameMenuBG.CreateMaxUIButton("GameMenuButton20", GameMenuBG, buttonsize, buttonsize, "", "Missions: ", "Open the current expansion's missions (left-click), open older expansion's missions (right-click) ", GameMenuBG.MaxUIHeader)
		GameMenuButton20:SetPoint("LEFT", GameMenuButton19, "RIGHT", spacing, 0)
		if C["General"]["ButtonStyle"]["Value"] == "Blizzard" then
			GameMenuButton20.icon:SetTexture("Interface\\Icons\\Inv_garrison_cargoship")
		else
			GameMenuButton20.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cGarrison.tga]])
		end

		GameMenuButton20:SetScript("OnMouseDown", function(self, button)
	 		if button == "LeftButton" then
				if ExpansionLandingPageMinimapButton and ExpansionLandingPageMinimapButton:IsShown() then
					if InCombatLockdown() then
						T.Print("["..GARRISON_MISSIONS_TITLE.."] "..ERR_NOT_IN_COMBAT)
					else
						ExpansionLandingPageMinimapButton:ToggleLandingPage()
					end
				end
			else
				GarrisonLandingPage_Toggle()
			end	
		end)
	end
	
	--Button - TukUI config
	GameMenuBG.CreateMaxUIButton("GameMenuButtonConfig", GameMenuBG, ((buttonsize*5) + (spacing*4)), buttonsize, "", "Game Menu: ", "Open the Tukui/MaxUI GUI ", GameMenuBG.MaxUIHeader)
	if T.Retail then
		GameMenuButtonConfig:SetPoint("TOPLEFT", GameMenuButton11, "BOTTOMLEFT", 0, -spacing)
	else
		GameMenuButtonConfig:SetPoint("TOPLEFT", GameMenuButton01, "BOTTOMLEFT", 0, -spacing)
	end
	GameMenuButtonConfig.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cConfig.tga]])
	GameMenuButtonConfig:SetAttribute("macrotext1", "/tukui c")
	GameMenuButtonConfig:SetScript("OnClick", function()
		if InCombatLockdown() then
			T.Print(ERR_NOT_IN_COMBAT)
			return
		end

		GUI:Toggle()

		if GameMenuFrame:IsShown() then
			GameMenuFrame:Hide()
		end
	end)

	--Button - TukUI config
	GameMenuBG.CreateMaxUIButton("GameMenuButtonEscape", GameMenuBG, ((buttonsize*5) + (spacing*4)), buttonsize, "", "Game Menu: ", "Open the Blizzard game menu ", GameMenuBG.MaxUIHeader)
	if T.Retail then
		GameMenuButtonEscape:SetPoint("TOPRIGHT", GameMenuButton20, "BOTTOMRIGHT", 0, -spacing)
	else
		GameMenuButtonEscape:SetPoint("TOPRIGHT", GameMenuButton10, "BOTTOMRIGHT", 0, -spacing)
	end
	GameMenuButtonEscape.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cLogout.tga]])
	GameMenuButtonEscape:SetAttribute("macrotext1", " ")
	GameMenuButtonEscape:SetScript("OnClick", function()
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
			self.icon:SetWidth(20)
			self.icon:SetHeight(20)
			self.icon:SetPoint("LEFT", self, "CENTER", 45, 0)
			self.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cConfig.tga]])
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
	GameMenuBG:fadeToggle()
end

local Enable = function(self)
	self:SetScript("OnMouseDown", OnMouseDown)
	self:Update()
end

local Disable = function(self)
	self:SetScript("OnMouseDown", nil)
end

DataText:Register("|cffFFFF99Game Menu|r", Enable, Disable, Update)