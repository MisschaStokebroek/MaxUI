------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkinsBlizzard

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local LFGSkin = CreateFrame("Frame")

local _G = _G
local next = next
local unpack, ipairs, pairs = unpack, ipairs, pairs
local min, strlower, select = min, strlower, select
local hooksecurefunc = hooksecurefunc

local GetItemInfo = GetItemInfo
local GetLFGProposal = GetLFGProposal
local UnitIsGroupLeader = UnitIsGroupLeader
local GetLFGProposalMember = GetLFGProposalMember
local GetBackgroundTexCoordsForRole = GetBackgroundTexCoordsForRole

local C_ChallengeMode_GetAffixInfo = C_ChallengeMode.GetAffixInfo
local C_LFGList_GetApplicationInfo = C_LFGList.GetApplicationInfo
local C_LFGList_GetAvailableActivities = C_LFGList.GetAvailableActivities
local C_LFGList_GetAvailableRoles = C_LFGList.GetAvailableRoles
local C_MythicPlus_GetCurrentAffixes = C_MythicPlus.GetCurrentAffixes
local C_ChallengeMode_GetSlottedKeystoneInfo = C_ChallengeMode.GetSlottedKeystoneInfo
local C_ChallengeMode_GetMapUIInfo = C_ChallengeMode.GetMapUIInfo

------------------------------------------------------------------------------------------
-- SKIN LFG
------------------------------------------------------------------------------------------
local function SkinLFGDungeonFinder()
	LFDQueueFrameBackground:Kill()
	LFDQueueFrameSpecific.ScrollBar:SkinMaxUIScrollBarNew(true)

end

local function SkinLFGRaidFinder()

end

local function SkinLFGPremadeFinder()

end

local function SkinRoleSelection()
	_G.LFDParentFrame:StripTextures()

	_G.RaidFinderFrame:StripTextures()
	_G.RaidFinderFrameRoleInset:StripTextures()
	_G.RaidFinderFrameRoleInset.NineSlice:Hide()

	---_G.LFDQueueFrameRoleButtonTankIncentiveIcon:SetAlpha(0)
	--_G.LFDQueueFrameRoleButtonHealerIncentiveIcon:SetAlpha(0)
	--_G.LFDQueueFrameRoleButtonDPSIncentiveIcon:SetAlpha(0)
	--_G.LFDQueueFrameRoleButtonTank.shortageBorder:Kill()
	--_G.LFDQueueFrameRoleButtonDPS.shortageBorder:Kill()
	--_G.LFDQueueFrameRoleButtonHealer.shortageBorder:Kill()

	-- checkbuttons
	local roleButtons = {
		_G.LFDQueueFrameRoleButtonHealer,
		_G.LFDQueueFrameRoleButtonDPS,
		_G.LFDQueueFrameRoleButtonLeader,
		_G.LFDQueueFrameRoleButtonTank,
		
		_G.RaidFinderQueueFrameRoleButtonHealer,
		_G.RaidFinderQueueFrameRoleButtonDPS,
		_G.RaidFinderQueueFrameRoleButtonLeader,
		_G.RaidFinderQueueFrameRoleButtonTank,
		
		_G.LFGInvitePopupRoleButtonTank,
		_G.LFGInvitePopupRoleButtonHealer,
		_G.LFGInvitePopupRoleButtonDPS,
		
		_G.LFGListApplicationDialog.TankButton,
		_G.LFGListApplicationDialog.HealerButton,
		_G.LFGListApplicationDialog.DamagerButton,
		
		_G.RolePollPopupRoleButtonTank,
		_G.RolePollPopupRoleButtonHealer,
		_G.RolePollPopupRoleButtonDPS,
	}

	for _, roleButton in pairs(roleButtons) do
		if roleButton.checkButton then
			roleButton.checkButton:SkinMaxUICheckBox(true)
		elseif roleButton.CheckButton then
			roleButton.CheckButton:SkinMaxUICheckBox(true)
		end
	end

	-- use my role icons
	for _, Button in pairs({ 'LFDQueueFrameRoleButton', 'RaidFinderQueueFrameRoleButton' }) do
		for _, Role in pairs({ 'Tank', 'Healer', 'DPS', 'Leader' }) do
			_G[Button..Role]:StripTextures()
			
			if Role == 'Tank' then 
				_G[Button..Role].MaxUIRole = _G[Button..Role]:CreateTexture(nil, "OVERLAY")
				_G[Button..Role].MaxUIRole:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\Icons\\Role\\Maxtank.tga")
				_G[Button..Role].MaxUIRole:SetAllPoints()
				
			elseif Role == 'Healer' then
				_G[Button..Role].MaxUIRole = _G[Button..Role]:CreateTexture(nil, "OVERLAY")
				_G[Button..Role].MaxUIRole:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\Icons\\Role\\Maxhealer.tga")
				_G[Button..Role].MaxUIRole:SetAllPoints()

			elseif Role == 'DPS' then
				_G[Button..Role].MaxUIRole = _G[Button..Role]:CreateTexture(nil, "OVERLAY")
				_G[Button..Role].MaxUIRole:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\Icons\\Role\\Maxdps.tga")
				_G[Button..Role].MaxUIRole:SetAllPoints()

			else			
				_G[Button..Role].MaxUIRole = _G[Button..Role]:CreateTexture(nil, "OVERLAY")
				_G[Button..Role].MaxUIRole:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\Icons\\Role\\Maxleader.tga")
				_G[Button..Role].MaxUIRole:SetAllPoints()
			end
		end
	end

	LFDQueueFrameFindGroupButton:SkinMaxUIButton(true)
end

local function SkinLFGFrame()
	local PVEFrame = _G.PVEFrame

	SkinLFGDungeonFinder()
	SkinRoleSelection()

	-- basic
	--LFDQueueFrame:StripTextures()
	--LFDQueueFrameRandomScrollFrame:StripTextures()
	--LFDQueueFrameSpecific:StripTextures()
	

	PVEFrame:SkinMaxUIBaseFrame(true, true, " ")
	PVEFrame.shadows:SetAlpha(0)
	PVEFrame.NineSlice:Hide()
	_G.PVEFrameLeftInset:Hide()
	_G.PVEFrameBg:Hide()

	_G.PVEFramePortrait:ClearAllPoints()
	_G.PVEFramePortrait:SetPoint("TOPLEFT", PVEFrame, "TOPLEFT", 8, -8)
	
	_G.PVEFrameTitleText:SetScale(1.5)
	_G.PVEFrameTitleText:ClearAllPoints()
	_G.PVEFrameTitleText:SetPoint("TOPLEFT", PVEFramePortrait, "TOPRIGHT", 8, 0)

	-- tabs
	for i = 1, 3 do
		PVEFrame['tab'..i]:SkinMaxUITab(true)
	end

	-- groupfinder selection
	for i = 1, 3 do
		local Button = _G.GroupFinderFrame["groupButton"..i]

		Button.bg:SetAlpha(0)
		Button.ring:SetAlpha(0)
		Button:SetHighlightTexture('')
		Button:SkinMaxUITab(true)

		Button.icon:SetSize(50, 50)
		Button.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cSocial.tga]]) -- fix me

		Button.name:SetTextColor(1, 1, 1)
	end

	hooksecurefunc('GroupFinderFrame_SelectGroupButton', function()
		for i = 1, 3 do
			local Button = GroupFinderFrame["groupButton"..i]
			if GroupFinderFrame.selectionIndex == Button:GetID() then
				Button.icon:SetVertexColor(1, 1, 0, 1)
			else
				Button.icon:SetVertexColor(1, 1, 1, 1)
			end
		end
	end)

	-- dropdown
	LFDQueueFrameTypeDropDown:SkinMaxUIDropDown(true, 120)
	LFDQueueFrameTypeDropDown:ClearAllPoints()
	LFDQueueFrameTypeDropDown:SetPoint("TOPRIGHT", LFDQueueFrame, "TOPRIGHT", -34, -108)
	LFDQueueFrameTypeDropDownName:ClearAllPoints()
	LFDQueueFrameTypeDropDownName:SetPoint("RIGHT", LFDQueueFrameTypeDropDownText, "LEFT", -8, 0)
	
	DropDownList1Backdrop:SetAlpha(0.7)
end

local function SkinLFGPVPFrame()

end

local function SkinMythicPlusFrame()

end

local function SkinLFGPopups()

end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function LFGSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsBlizzard then return end

	if C["Skins"]["LFG"] then
		if not IsAddOnLoaded("LookingForGroupFrames") then
			LoadAddOn("LookingForGroupFrames")
		end		
		if not IsAddOnLoaded("Blizzard_ChallengesUI") then
			LoadAddOn("Blizzard_ChallengesUI")
		end		
		SkinLFGFrame()
		SkinLFGPVPFrame()
		SkinMythicPlusFrame()
		SkinLFGPopups()
	end
	self:UnregisterAllEvents()
end

LFGSkin:RegisterEvent("PLAYER_LOGIN")
LFGSkin:SetScript("OnEvent", LFGSkin.OnEvent)