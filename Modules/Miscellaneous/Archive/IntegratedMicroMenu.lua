------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- setting up MICRO MENU FROM TUKUI

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Miscellaneous = T["Miscellaneous"]
local MicroMenu = Miscellaneous.MicroMenu
local baseMicroMenuGameMenu = MicroMenu.GameMenu
local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
local Movers = T["Movers"]

function MicroMenu:GameMenu()
	baseMicroMenuGameMenu(self)

	if C["General"]["Themes"]["Value"] == "MaxUI" then
		local Buttons = MicroMenu:ShownMicroButtons()

		MicroMenu:CreateMaxUIHeader("Tukui Micro menu")	
		
		for i = 1, #Buttons do
			local Button = _G[Buttons[i]]

			Button.Backdrop.Texture = Button.Backdrop:CreateTexture(nil, "BACKGROUND")
			Button.Backdrop.Texture:SetInside()
			Button.Backdrop.Texture:SetTexture(T.GetTexture(C.General.TextureButton))
			Button.Backdrop.Texture:SetVertexColor(0.35, 0.35, 0.35)

			--button mouseaction (mousover or click)
			Button:HookScript("OnEnter", function(self)
				Button.Backdrop.Texture:SetVertexColor(0.5, 0.5, 0.5)
			end)

			Button:HookScript("OnLeave", function(self)
				Button.Backdrop.Texture:SetVertexColor(0.35, 0.35, 0.35)
			end)
			
			if C["Skins"]["ButtonFilter"] == true then 
				Button.Backdrop:CreateMaxUIFilter()
			end

		end

		-- Combat State
		RegisterStateDriver(MicroMenu, "visibility", "[combat] hide; nil")
	end	
end


--[[
local function CreateMaxUIGameMenu()
	local buttonsize = C["Tools"]["ToolButtonSize"]
	local spacing = 2
		
	--local MicroMenu = CreateFrame("Frame", "MicroMenu", UIParent)
	MicroMenu:CreateBackdrop("Transparent")
	MicroMenu:CreateShadow()

	if T.Retail then 
		MicroMenu:SetHeight(buttonsize*3 + spacing*4)
	else
		MicroMenu:SetHeight(buttonsize*2 + spacing*3)
	end
	MicroMenu:SetWidth(buttonsize*10 + spacing*11)
	MicroMenu:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 24)
	--MicroMenu:SetFrameLevel(15)
	--MicroMenu:SetFrameStrata("HIGH")
	--MicroMenu:Hide()
	--MicroMenu:SetAlpha(0)	
	MicroMenu:CreateMaxUIHeader("MaxUI Micro Menu")
	MicroMenu:CreateMaxUICloseButton(MicroMenu.MaxUIHeader)

	--Movers:RegisterFrame(MicroMenu, "Micro Menu")
	
	-- Combat State
	RegisterStateDriver(MicroMenu, "visibility", "[combat] hide; nil")
end

local function CreateMaxUIGameMenuButtons()
	local buttonsize = C["Tools"]["ToolButtonSize"]
	local spacing = 2

	--Button 1 - Character Info
	MicroMenu.CreateToolButton("GameMenuButton01", MicroMenu, buttonsize, buttonsize, "", "Character: ", "Open character info ", MicroMenu.MaxUIHeader)
	GameMenuButton01:SetPoint("TOPLEFT", MicroMenu, "TOPLEFT", spacing, -spacing)
	if C["Tools"]["ButtonStyle"]["Value"] == "Blizzard" then
		GameMenuButton01.icon:SetTexture("Interface\\Icons\\Achievement_character_human_male")
	else
		GameMenuButton01.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cChar.tga]])
	end
	GameMenuButton01:SetScript("OnMouseDown", function(self)
		ToggleCharacter("PaperDollFrame")
	end)

	--Button 2 - Spellbook
	MicroMenu.CreateToolButton("GameMenuButton02", MicroMenu, buttonsize, buttonsize, "", "Character: ", "Open spellbook & abilities ", MicroMenu.MaxUIHeader)
	GameMenuButton02:SetPoint("LEFT", GameMenuButton01, "RIGHT", spacing, 0)
	if C["Tools"]["ButtonStyle"]["Value"] == "Blizzard" then
		GameMenuButton02.icon:SetTexture("Interface\\Icons\\Inv_misc_book_09")
	else
		GameMenuButton02.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cSpell.tga]])
	end
	GameMenuButton02:SetScript("OnMouseDown", function(self)
		ToggleFrame(SpellBookFrame)
	end)

	--Button 3 - Talent
	MicroMenu.CreateToolButton("GameMenuButton03", MicroMenu, buttonsize, buttonsize, "", "Character: ", "Open specialization & talents ", MicroMenu.MaxUIHeader)
	GameMenuButton03:SetPoint("LEFT", GameMenuButton02, "RIGHT", spacing, 0)
	if C["Tools"]["ButtonStyle"]["Value"] == "Blizzard" then
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
	MicroMenu.CreateToolButton("GameMenuButton04", MicroMenu, buttonsize, buttonsize, "", "Guild: ", "Open guild info and communities ", MicroMenu.MaxUIHeader)
	GameMenuButton04:SetPoint("LEFT", GameMenuButton03, "RIGHT", spacing, 0)
	if C["Tools"]["ButtonStyle"]["Value"] == "Blizzard" then
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
	MicroMenu.CreateToolButton("GameMenuButton05", MicroMenu, buttonsize, buttonsize, "", "Social: ", "Open friends tab ", MicroMenu.MaxUIHeader)
	GameMenuButton05:SetPoint("LEFT", GameMenuButton04, "RIGHT", spacing, 0)
	if C["Tools"]["ButtonStyle"]["Value"] == "Blizzard" then
		GameMenuButton05.icon:SetTexture("Interface\\Icons\\Inv_misc_grouplooking")
	else
		GameMenuButton05.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cSocial.tga]])
	end
	GameMenuButton05:SetScript("OnMouseDown", function(self)
		ToggleFriendsFrame(1)
	end)

	--Button 6 - Raid
	MicroMenu.CreateToolButton("GameMenuButton06", MicroMenu, buttonsize, buttonsize, "", "Social: ", "Open raid tab ", MicroMenu.MaxUIHeader)
	GameMenuButton06:SetPoint("LEFT", GameMenuButton05, "RIGHT", spacing, 0)
	if C["Tools"]["ButtonStyle"]["Value"] == "Blizzard" then
		GameMenuButton06.icon:SetTexture("Interface\\Icons\\Achievement_guildperk_everybodysfriend")
	else
		GameMenuButton06.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cSocial.tga]])
	end
	GameMenuButton06:SetScript("OnMouseDown", function(self)
		ToggleFriendsFrame(4)
	end)

	--Button 7 - Questlog
	MicroMenu.CreateToolButton("GameMenuButton07", MicroMenu, buttonsize, buttonsize, "", "Quest Log: ", "Open quest log ", MicroMenu.MaxUIHeader)
	GameMenuButton07:SetPoint("LEFT", GameMenuButton06, "RIGHT", spacing, 0)
	if C["Tools"]["ButtonStyle"]["Value"] == "Blizzard" then
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
	MicroMenu.CreateToolButton("GameMenuButton08", MicroMenu, buttonsize, buttonsize, "", "Map: ", "Open world map ", MicroMenu.MaxUIHeader)
	GameMenuButton08:SetPoint("LEFT", GameMenuButton07, "RIGHT", spacing, 0)
	if C["Tools"]["ButtonStyle"]["Value"] == "Blizzard" then
			GameMenuButton08.icon:SetTexture("Interface\\Icons\\Inv_misc_map02")
	else
		GameMenuButton08.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cLocation.tga]])
	end
	GameMenuButton08:SetScript("OnMouseDown", function(self)
		ShowUIPanel(WorldMapFrame)
		MaximizeUIPanel(WorldMapFrame)
	end)

	--Button 9 - Customer Support
	MicroMenu.CreateToolButton("GameMenuButton09", MicroMenu, buttonsize, buttonsize, "", "Customer Support: ", "Open customer support ", MicroMenu.MaxUIHeader)
	GameMenuButton09:SetPoint("LEFT", GameMenuButton08, "RIGHT", spacing, 0)
	if C["Tools"]["ButtonStyle"]["Value"] == "Blizzard" then
		GameMenuButton09.icon:SetTexture("Interface\\Icons\\Inv_pet_babyblizzardbear")
	else
		GameMenuButton09.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cHelp.tga]])
	end
	GameMenuButton09:SetScript("OnMouseDown", function(self)
		ToggleHelpFrame()
	end)

	--Button 10 - Compose a Tweet
	MicroMenu.CreateToolButton("GameMenuButton10", MicroMenu, buttonsize, buttonsize, "", "Tweet: ", "Compose a tweet (if account is linked) ", MicroMenu.MaxUIHeader)
	GameMenuButton10:SetPoint("LEFT", GameMenuButton09, "RIGHT", spacing, 0)
	if C["Tools"]["ButtonStyle"]["Value"] == "Blizzard" then
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
		MicroMenu.CreateToolButton("GameMenuButton11", MicroMenu, buttonsize, buttonsize, "", "Achievements: ", "Open achievements ", MicroMenu.MaxUIHeader)
		GameMenuButton11:SetPoint("TOP", GameMenuButton01, "BOTTOM", 0, -spacing)
		if C["Tools"]["ButtonStyle"]["Value"] == "Blizzard" then
			GameMenuButton11.icon:SetTexture("Interface\\Icons\\Achievement_level_60")
		else
			GameMenuButton11.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cAchieve.tga]])
		end
		GameMenuButton11:SetScript("OnMouseDown", function(self)
			ToggleAchievementFrame()
		end)

		--Button 12 - Mounts
		MicroMenu.CreateToolButton("GameMenuButton12", MicroMenu, buttonsize, buttonsize, "", "Collection Journal: ", "Open mounts tab ", MicroMenu.MaxUIHeader)
		GameMenuButton12:SetPoint("LEFT", GameMenuButton11, "RIGHT", spacing, 0)
		if C["Tools"]["ButtonStyle"]["Value"] == "Blizzard" then
			GameMenuButton12.icon:SetTexture("Interface\\Icons\\Achievement_guildperk_mountup")
		else
			GameMenuButton12.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cMount.tga]])
		end
		GameMenuButton12:SetScript("OnMouseDown", function(self)
			ToggleCollectionsJournal(1)
		end)

		--Button 13 - Pets
		MicroMenu.CreateToolButton("GameMenuButton13", MicroMenu, buttonsize, buttonsize, "", "Collection Journal: ", "Open pets tab ", MicroMenu.MaxUIHeader)
		GameMenuButton13:SetPoint("LEFT", GameMenuButton12, "RIGHT", spacing, 0)
		if C["Tools"]["ButtonStyle"]["Value"] == "Blizzard" then
			GameMenuButton13.icon:SetTexture("Interface\\Icons\\Spell_misc_petheal")
		else
			GameMenuButton13.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cPet.tga]])
		end
		GameMenuButton13:SetScript("OnMouseDown", function(self)
			ToggleCollectionsJournal(2)
		end)

		--Button 14 - Toy Box
		MicroMenu.CreateToolButton("GameMenuButton14", MicroMenu, buttonsize, buttonsize, "", "Collection Journal: ", "Open toy box tab ", MicroMenu.MaxUIHeader)
		GameMenuButton14:SetPoint("LEFT", GameMenuButton13, "RIGHT", spacing, 0)
		if C["Tools"]["ButtonStyle"]["Value"] == "Blizzard" then
			GameMenuButton14.icon:SetTexture("Interface\\Icons\\Inv_misc_toy_10")
		else
			GameMenuButton14.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cToy.tga]])
		end
		GameMenuButton14:SetScript("OnMouseDown", function(self)
			ToggleCollectionsJournal(3)
		end)

		--Button 15 - Heirlooms
		MicroMenu.CreateToolButton("GameMenuButton15", MicroMenu, buttonsize, buttonsize, "", "Collection Journal: ", "Open heirlooms tab ", MicroMenu.MaxUIHeader)
		GameMenuButton15:SetPoint("LEFT", GameMenuButton14, "RIGHT", spacing, 0)
		if C["Tools"]["ButtonStyle"]["Value"] == "Blizzard" then
			GameMenuButton15.icon:SetTexture("Interface\\Icons\\Inv_icon_heirloomtoken_weapon01")
		else
			GameMenuButton15.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cHeirloom.tga]])
		end
		GameMenuButton15:SetScript("OnMouseDown", function(self)
			ToggleCollectionsJournal(4)
		end)

		--Button 16 - Dressing room
		MicroMenu.CreateToolButton("GameMenuButton16", MicroMenu, buttonsize, buttonsize, "", "Collection Journal: ", "Open transmogrification tab ", MicroMenu.MaxUIHeader)
		GameMenuButton16:SetPoint("LEFT", GameMenuButton15, "RIGHT", spacing, 0)
		if C["Tools"]["ButtonStyle"]["Value"] == "Blizzard" then
			GameMenuButton16.icon:SetTexture("Interface\\Icons\\Ui_calendar_freetshirtday")
		else
			GameMenuButton16.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cTransmog.tga]])
		end
		GameMenuButton16:SetScript("OnMouseDown", function(self)
			ToggleCollectionsJournal(5)
		end)

		--Button 17 - PVE LF group tool
		MicroMenu.CreateToolButton("GameMenuButton17", MicroMenu, buttonsize, buttonsize, "", "Looking for Group: ", "Open the dungeon finder and looking for group tool ", MicroMenu.MaxUIHeader)
		GameMenuButton17:SetPoint("LEFT", GameMenuButton16, "RIGHT", spacing, 0)
		if C["Tools"]["ButtonStyle"]["Value"] == "Blizzard" then
			GameMenuButton17.icon:SetTexture("Interface\\Icons\\Inv_misc_groupneedmore")
		else
			GameMenuButton17.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cSocial.tga]])
		end
		GameMenuButton17:SetScript("OnMouseDown", function(self)
			PVEFrame_ToggleFrame()
		end)


		--Button 18 - Event Calendar
		MicroMenu.CreateToolButton("GameMenuButton18", MicroMenu, buttonsize, buttonsize, "", "Events: ", "Open the event calendar ", MicroMenu.MaxUIHeader)
		GameMenuButton18:SetPoint("LEFT", GameMenuButton17, "RIGHT", spacing, 0)
		if C["Tools"]["ButtonStyle"]["Value"] == "Blizzard" then
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
		MicroMenu.CreateToolButton("GameMenuButton19", MicroMenu, buttonsize, buttonsize, "", "Dungeon Journal: ", "Open the dungeon journal ", MicroMenu.MaxUIHeader)
		GameMenuButton19:SetPoint("LEFT", GameMenuButton18, "RIGHT", spacing, 0)
		if C["Tools"]["ButtonStyle"]["Value"] == "Blizzard" then
			GameMenuButton19.icon:SetTexture("Interface\\Icons\\Achievement_zone_stonetalon_01")
		else
			GameMenuButton19.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cJournal.tga]])
		end
		GameMenuButton19:SetScript("OnMouseDown", function(self)
			ToggleEncounterJournal()
		end)

		--Button 20 - Garrison Report
		MicroMenu.CreateToolButton("GameMenuButton20", MicroMenu, buttonsize, buttonsize, "", "Missions: ", "Open garrison / class hall / war campaign / covenant report ", MicroMenu.MaxUIHeader)
		GameMenuButton20:SetPoint("LEFT", GameMenuButton19, "RIGHT", spacing, 0)
		if C["Tools"]["ButtonStyle"]["Value"] == "Blizzard" then
			GameMenuButton20.icon:SetTexture("Interface\\Icons\\Inv_garrison_cargoship")
		else
			GameMenuButton20.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cGarrison.tga]])
		end
		GameMenuButton20:SetScript("OnMouseDown", function(self)
			GarrisonLandingPage_Toggle()
		end)
	end
	
	--Button - TukUI config
	MicroMenu.CreateToolButton("GameMenuButtonConfig", MicroMenu, ((buttonsize*5) + (spacing*4)), buttonsize, "", "Game Menu: ", "Open the Tukui/MaxUI GUI ", MicroMenu.MaxUIHeader)
	if T.Retail then
		GameMenuButtonConfig:SetPoint("TOPLEFT", GameMenuButton11, "BOTTOMLEFT", 0, -spacing)
	else
		GameMenuButtonConfig:SetPoint("TOPLEFT", GameMenuButton01, "BOTTOMLEFT", 0, -spacing)
	end
	GameMenuButtonConfig.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cConfig.tga]])
	GameMenuButtonConfig.icon:SetWidth(buttonsize -4)
	GameMenuButtonConfig:SetAttribute("macrotext1", "/tukui c")
	GameMenuButtonConfig:SetScript("OnMouseUp", function()
		if GameMenuFrame:IsShown() then
			GameMenuFrame:Hide()
		end
	end)

	--Button - TukUI config
	MicroMenu.CreateToolButton("GameMenuButtonEscape", MicroMenu, ((buttonsize*5) + (spacing*4)), buttonsize, "", "Game Menu: ", "Open the Blizzard game menu ", MicroMenu.MaxUIHeader)
	if T.Retail then
		GameMenuButtonEscape:SetPoint("TOPRIGHT", GameMenuButton20, "BOTTOMRIGHT", 0, -spacing)
	else
		GameMenuButtonEscape:SetPoint("TOPRIGHT", GameMenuButton10, "BOTTOMRIGHT", 0, -spacing)
	end
	GameMenuButtonEscape.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cLogout.tga]])
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

baseEnableMicroMenu = MicroMenu.Enable
function MicroMenu:Enable()
	baseEnableMicroMenu(self)

	if not C.Misc.MicroStyle.Value == "None" then
		return
	end

	if C.Misc.MicroStyle.Value == "Minimalist" then
		self:Minimalist()
	elseif C.Misc.MicroStyle.Value == "Blizzard" then
		self:Blizzard()
	elseif C.Misc.MicroStyle.Value == "Game Menu" then
		self:GameMenu()
	elseif C.Misc.MicroStyle.Value == "MaxUI Game Menu" then
		CreateMaxUIGameMenu()
		CreateMaxUIGameMenuButtons()
	end


end