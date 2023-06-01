------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkinsBlizzard

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local GuildSkin = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- SKIN Guild
------------------------------------------------------------------------------------------
local function SkinBlizzardToMaxUIStyleGuild()
	local CommunitiesFrame = _G.CommunitiesFrame
	local CommunitiesFrameCommunitiesList = _G.CommunitiesFrameCommunitiesList

	CommunitiesFrame.NineSlice:Hide()

	--CommunitiesFrame.StreamDropDownMenu:SkinMaxUIDropDown(nil, 120)
	--_G.ChannelFrame.ChannelRoster.ScrollBar:StripTextures()
	--S:HandleDropDownBox(CommunitiesFrame.StreamDropDownMenu)

	-- overall 
	CommunitiesFrame:SkinMaxUIBaseFrame(nil, true)
	CommunitiesFrame.InviteButton:SkinMaxUIButton(true)
	CommunitiesFrame.CommunitiesControlFrame.GuildRecruitmentButton:SkinMaxUIButton(true)


	-- left = CommunitiesFrameCommunitiesList
	CommunitiesFrameCommunitiesList.ScrollBar:SkinMaxUIScrollBarNew(true)
	
	CommunitiesFrameCommunitiesList.InsetFrame:StripTextures()
	CommunitiesFrameCommunitiesList.FilligreeOverlay:Hide()
	CommunitiesFrameCommunitiesList.Bg:Hide()
	CommunitiesFrameCommunitiesList.TopFiligree:Hide()
	CommunitiesFrameCommunitiesList.BottomFiligree:Hide()

	-- center = CommunitiesFrame.Chat
	CommunitiesFrame.Chat.ScrollBar:SkinMaxUIScrollBarNew(true)

	-- right = CommunitiesFrame.MemberList
	CommunitiesFrame.MemberList.ScrollBar:SkinMaxUIScrollBarNew(true)

	

end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function GuildSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsBlizzard then return end

	if C["Skins"]["Guild"] then
		if not IsAddOnLoaded("Blizzard_GuildUI") then
			LoadAddOn("Blizzard_GuildUI")
		end		
		if not IsAddOnLoaded("Blizzard_Communities") then
			LoadAddOn("Blizzard_Communities")
		end		
		SkinBlizzardToMaxUIStyleGuild()
	end
	self:UnregisterAllEvents()
end

GuildSkin:RegisterEvent("PLAYER_LOGIN")
GuildSkin:SetScript("OnEvent", GuildSkin.OnEvent)