------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkinsBlizzard

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local SocialSkin = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- SKIN Social
------------------------------------------------------------------------------------------
local function SkinSocialFriends()
	FriendsTooltip:SkinMaxUIFrame(true)

	-- FRIENDS
	FriendsFrame:SkinMaxUIBaseFrame(true, true, " ")
	FriendsFrame:SetSize(FriendsFrame:GetWidth()+50, FriendsFrame:GetHeight()+100)

	FriendsFrameIcon:ClearAllPoints()
	FriendsFrameIcon:SetPoint("TOPLEFT", FriendsFrame, "TOPLEFT", 4, -4)

	FriendsFrameTitleText:SetScale(1.5)
	FriendsFrameTitleText:ClearAllPoints()
	FriendsFrameTitleText:SetPoint("TOPLEFT", FriendsFrameIcon, "TOPRIGHT", 4, -8)
	FriendsFrameTitleText:SetJustifyH("LEFT")

	FriendsFrameBattlenetFrame:StripTextures()
	FriendsFrameBattlenetFrame.Tag:ClearAllPoints()
	FriendsFrameBattlenetFrame.Tag:SetPoint("TOPLEFT", FriendsFrameTitleText, "BOTTOMLEFT", 0, -4)
	FriendsFrameBattlenetFrame.Tag:SetJustifyH("LEFT")
	
	FriendsFrameStatusDropDown:SkinMaxUIDropDown(true, 70)
	FriendsFrameStatusDropDown:ClearAllPoints()
	FriendsFrameStatusDropDown:SetPoint("TOPRIGHT", FriendsFrame, "TOPRIGHT", -4, -8)
	FriendsFrameStatusDropDownStatus:SetPoint('LEFT', '$parent', 'LEFT', 23, 0)

	FriendsFrameBattlenetFrame.BroadcastButton:SkinMaxUIFrame(true)
	FriendsFrameBattlenetFrame.BroadcastButton:ClearAllPoints()
	FriendsFrameBattlenetFrame.BroadcastButton:SetPoint("RIGHT", FriendsFrameStatusDropDown, "LEFT", -4, 0)
	FriendsFrameBattlenetFrame.BroadcastButton:SetSize(22, 22)
	
	FriendsFrameBattlenetFrame.BroadcastButton:SetNormalTexture([[Interface\FriendsFrame\BroadcastIcon]])
	FriendsFrameBattlenetFrame.BroadcastButton:GetNormalTexture():SetInside()
	FriendsFrameBattlenetFrame.BroadcastButton:SetPushedTexture([[Interface\FriendsFrame\BroadcastIcon]])
	FriendsFrameBattlenetFrame.BroadcastButton.SetNormalTexture = Noop
	FriendsFrameBattlenetFrame.BroadcastButton.SetPushedTexture = Noop

	-- own anchor frame
	local FriendsFrameMaxUIInset = CreateFrame("Frame", nil, FriendsFrame)
	FriendsFrameMaxUIInset:SkinMaxUIFrame(true)
	FriendsFrameMaxUIInset:SetPoint("BOTTOMLEFT", FriendsFrame, "BOTTOMLEFT", 8, 48)
	FriendsFrameMaxUIInset:SetPoint("TOPRIGHT", FriendsFrame, "TOPRIGHT", -8, -132)
	--FriendsFrameMaxUIInset:CreateMaxUITopEdge()

	for i = 1, 3 do
		local Tab = _G["FriendsTabHeaderTab"..i]
		Tab:SkinMaxUITab(true)
		Tab.Backdrop:SetPoint("TOPLEFT", 0, 0)
		Tab.Backdrop:SetPoint("BOTTOMRIGHT", 0, -2)

		Tab:ClearAllPoints()
		Tab:SetHeight(24)

		if i == 1 then
			Tab:SetPoint("BOTTOMLEFT", FriendsFrameMaxUIInset.MaxUITopEdge, "TOPLEFT", 0, 4)
		elseif i == 2 then
			Tab:SetPoint("BOTTOMLEFT", FriendsFrameMaxUIInset.MaxUITopEdge, "TOPLEFT", 80, 4)
		elseif i == 3 then 
			Tab:SetPoint("BOTTOMLEFT", FriendsFrameMaxUIInset.MaxUITopEdge, "TOPLEFT", 160, 4)
		else
			Tab:SetPoint("BOTTOMLEFT", FriendsFrameMaxUIInset.MaxUITopEdge, "TOPLEFT", 0, 4)
		end	
	end

	-- scrollframe
	FriendsListFrame:StripTextures()
	
	FriendsListFrame.ScrollBox:ClearAllPoints()
	FriendsListFrame.ScrollBox:SetPoint("TOPLEFT", FriendsFrameMaxUIInset, "TOPLEFT")
	FriendsListFrame.ScrollBox:SetPoint("BOTTOMRIGHT", FriendsFrameMaxUIInset, "BOTTOMRIGHT", -24, 0)
	
	FriendsListFrame.ScrollBar:SkinMaxUIScrollBarNew(true)

	-- buttons
	FriendsFrameAddFriendButton:SkinMaxUIButton(true)
	FriendsFrameSendMessageButton:SkinMaxUIButton(true)

	FriendsFrameAddFriendButton:ClearAllPoints()
	FriendsFrameSendMessageButton:ClearAllPoints()
	
	FriendsFrameAddFriendButton:SetPoint("BOTTOMLEFT", FriendsFrame, "BOTTOMLEFT", 8, 8)
	FriendsFrameSendMessageButton:SetPoint("BOTTOMRIGHT", FriendsFrame, "BOTTOMRIGHT", -8, 8)

	-- bottom tabs
	for i = 1, FriendsFrame.numTabs do
		_G["FriendsFrameTab"..i]:SkinMaxUITab(true)
	end

	AddFriendFrame:SkinMaxUIFrame(true)
	--AddFriendEntryFrame:CreateBackdrop("Transparent")
	--AddFriendEntryFrame.Backdrop:CreateShadow()
	AddFriendFrame:ClearAllPoints()
	AddFriendFrame:SetPoint("TOPLEFT", FriendsFrame, "TOPRIGHT", 4, 0)

	AddFriendEntryFrameAcceptButton:SkinMaxUIButton(true)
	AddFriendEntryFrameCancelButton:SkinMaxUIButton(true)

	--AddFriendNameEditBox:StripTextures()
	AddFriendNameEditBox:CreateBackdrop("Transparent")
	AddFriendNameEditBox.Backdrop:CreateShadow()
end


-- WHO
local function SkinSocialWho()

end

-- RAID
local function SkinSocialRaid()

end

-- QUICK JOIN
local function SkinSocialQuickJoin()

end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function SocialSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsBlizzard then return end

	if C["Skins"]["Social"] then
		if not IsAddOnLoaded("FriendsFrame") then
			LoadAddOn("FriendsFrame")
		end		
		SkinSocialFriends()
		SkinSocialWho()
		SkinSocialRaid()
		SkinSocialQuickJoin()
	end
	self:UnregisterAllEvents()
end

SocialSkin:RegisterEvent("PLAYER_LOGIN")
SocialSkin:SetScript("OnEvent", SocialSkin.OnEvent)