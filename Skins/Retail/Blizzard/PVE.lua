------------------------------------------------------------------------------------------
-- MaxUI 6 - SHADOWLANDS / TUKUI 20
-- latest update: 27-10-2020
------------------------------------------------------------------------------------------

-- setting up MaxUISkins

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
if not IsAddOnLoaded('AddonSkins') then 
	return
end

local AS, ASL = unpack(AddOnSkins)
if not AS:CheckAddOn('Tukui') then return end
local T, C
local _G = _G

------------------------------------------------------------------------------------------
-- PVE / LFG
------------------------------------------------------------------------------------------
local AS_Blizzard_PvE = AS.Blizzard_PvE
function AS:Blizzard_PvE()
	LFGListSearchPanelScrollFrame.StartGroupButton = LFGListFrame.CategorySelection.StartGroupButton
	AS_Blizzard_PvE(self)

	if not Tukui then return end
	if not T then T, C = Tukui:unpack()	end
	if not C["Skins"]["MaxUIAddOnSkins"] then return end

	-- adjustments
	PVEFrame:CreateShadow()
	PVEFrameLeftInset:StripTextures()
	
	for _, Button in pairs({ 'LFDQueueFrameRoleButton', 'RaidFinderQueueFrameRoleButton' }) do
		for _, Role in pairs({ 'Tank', 'Healer', 'DPS', 'Leader' }) do
			_G[Button..Role]:StripTextures()
			
			if Role == 'Tank' then 
				_G[Button..Role].MaxUIRole = _G[Button..Role]:CreateTexture(nil, "OVERLAY")
				_G[Button..Role].MaxUIRole:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\roleicons\\Maxtank.tga")
				_G[Button..Role].MaxUIRole:SetAllPoints()
				
			elseif Role == 'Healer' then
				_G[Button..Role].MaxUIRole = _G[Button..Role]:CreateTexture(nil, "OVERLAY")
				_G[Button..Role].MaxUIRole:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\roleicons\\Maxhealer.tga")
				_G[Button..Role].MaxUIRole:SetAllPoints()

			elseif Role == 'DPS' then
				_G[Button..Role].MaxUIRole = _G[Button..Role]:CreateTexture(nil, "OVERLAY")
				_G[Button..Role].MaxUIRole:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\roleicons\\Maxdps.tga")
				_G[Button..Role].MaxUIRole:SetAllPoints()

			else			
				_G[Button..Role].MaxUIRole = _G[Button..Role]:CreateTexture(nil, "OVERLAY")
				_G[Button..Role].MaxUIRole:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\roleicons\\Maxleader.tga")
				_G[Button..Role].MaxUIRole:SetAllPoints()
			end
		end
	end
	
	GroupFinderFrameGroupButton1:StripTextures()
	GroupFinderFrameGroupButton2:StripTextures()
	GroupFinderFrameGroupButton3:StripTextures()
	
	AS:SkinButton(GroupFinderFrameGroupButton1)
	AS:SkinButton(GroupFinderFrameGroupButton2)
	AS:SkinButton(GroupFinderFrameGroupButton3)
	
	GroupFinderFrameGroupButton1.icon:SetTexture("Interface\\Icons\\INV_Helmet_08")
	GroupFinderFrameGroupButton2.icon:SetTexture("Interface\\Icons\\Icon_Scenarios")
	GroupFinderFrameGroupButton3.icon:SetTexture("Interface\\Icons\\inv_helmet_06")
	
	GroupFinderFrameGroupButton1.icon:SetSize(GroupFinderFrameGroupButton1:GetHeight()-8, GroupFinderFrameGroupButton1:GetHeight()-8)
	GroupFinderFrameGroupButton2.icon:SetSize(GroupFinderFrameGroupButton2:GetHeight()-8, GroupFinderFrameGroupButton2:GetHeight()-8)
	GroupFinderFrameGroupButton3.icon:SetSize(GroupFinderFrameGroupButton3:GetHeight()-8, GroupFinderFrameGroupButton3:GetHeight()-8)

	GroupFinderFrameGroupButton1.icon:ClearAllPoints()
	GroupFinderFrameGroupButton2.icon:ClearAllPoints()
	GroupFinderFrameGroupButton3.icon:ClearAllPoints()

	GroupFinderFrameGroupButton1.icon:SetPoint("LEFT", GroupFinderFrameGroupButton1, "LEFT", 4, 0)
	GroupFinderFrameGroupButton2.icon:SetPoint("LEFT", GroupFinderFrameGroupButton2, "LEFT", 4, 0)
	GroupFinderFrameGroupButton3.icon:SetPoint("LEFT", GroupFinderFrameGroupButton3, "LEFT", 4, 0)
	
	-- header
	PVEFrame:CreateMaxUIHeader("PvE & LFG")
	PVEFrame.MaxUIHeader:SetFrameLevel(15)
	
	-- close button
	PVEFrame.CloseButton:ClearAllPoints()
	PVEFrame.CloseButton:SetFrameLevel(16)
	PVEFrame.CloseButton:SetFrameStrata("HIGH")
	PVEFrame.CloseButton:SetPoint("RIGHT", PVEFrame.MaxUIHeader, "RIGHT", 4, 0)

	-- relocate
	PVEFrame:ClearAllPoints()
	PVEFrame:SetPoint("TOP", UIParent, "TOP", 0, -100)
	PVEFrame.ClearAllPoints = function() end
	PVEFrame.SetPoint = function() end
end
AS:RegisterSkin("Blizzard_PvE", AS.Blizzard_PvE)

------------------------------------------------------------------------------------------
-- RAIDUI
------------------------------------------------------------------------------------------
local AS_Blizzard_RaidUI = AS.Blizzard_RaidUI
function AS:Blizzard_RaidUI(event, addon)
	AS_Blizzard_RaidUI(self, event, addon)

	if not Tukui then return end
	if not T then
		T, C = Tukui:unpack()
	end

	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	if addon ~= 'Blizzard_RaidUI' then return end

	-- adjustments
	
	-- header
	RaidInfoFrame:CreateMaxUIHeader("Raid Info")
	RaidInfoFrame.MaxUIHeader:SetFrameLevel(15)
	RaidInfoFrame.Header:Kill()
	
	-- close button
	RaidInfoCloseButton:ClearAllPoints()
	RaidInfoCloseButton:SetFrameLevel(16)
	RaidInfoCloseButton:SetFrameStrata("HIGH")
	RaidInfoCloseButton:SetPoint("RIGHT", RaidInfoFrame.MaxUIHeader, "RIGHT", 4, 0)

	-- relocate
	RaidInfoFrame:ClearAllPoints()
	RaidInfoFrame:SetPoint("TOPLEFT", FriendsFrame, "TOPRIGHT", 4, 0)
	--RaidInfoFrame.ClearAllPoints = function() end
	--RaidInfoFrame.SetPoint = function() end
	
	AS:UnregisterSkinEvent(addon, event)
end
AS:RegisterSkin("Blizzard_RaidUI", AS.Blizzard_RaidUI)

------------------------------------------------------------------------------------------
-- RAIDUI
------------------------------------------------------------------------------------------
local AS_Blizzard_AdventureMap = AS.Blizzard_AdventureMap
function AS:Blizzard_AdventureMap(event, addon)
	AS_Blizzard_AdventureMap(self, event, addon)

	if not Tukui then return end
	if not T then
		T, C = Tukui:unpack()
	end

	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	if addon ~= 'Blizzard_AdventureMap' then return end

	-- adjustments
	
	-- header
	AdventureMapQuestChoiceDialog:CreateMaxUIHeader("PvE & LFG")
	AdventureMapQuestChoiceDialog.MaxUIHeader:SetFrameLevel(15)
	
	-- close button
	AdventureMapQuestChoiceDialog.CloseButton:ClearAllPoints()
	AdventureMapQuestChoiceDialog.CloseButton:SetFrameLevel(16)
	AdventureMapQuestChoiceDialog.CloseButton:SetFrameStrata("HIGH")
	AdventureMapQuestChoiceDialog.CloseButton:SetPoint("RIGHT", AdventureMapQuestChoiceDialog.MaxUIHeader, "RIGHT", 4, 0)

	-- relocate
	AdventureMapQuestChoiceDialog:ClearAllPoints()
	AdventureMapQuestChoiceDialog:SetPoint("TOP", UIParent, "TOP", 0, -100)
	AdventureMapQuestChoiceDialog.ClearAllPoints = function() end
	AdventureMapQuestChoiceDialog.SetPoint = function() end
end
AS:RegisterSkin("Blizzard_AdventureMap", AS.Blizzard_AdventureMap)

------------------------------------------------------------------------------------------
-- CHALLENGES UI
------------------------------------------------------------------------------------------
local AS_Blizzard_ChallengesUI = AS.Blizzard_ChallengesUI
function AS:Blizzard_ChallengesUI(event, addon)
	AS_Blizzard_ChallengesUI(self, event, addon)

	if not Tukui then return end
	if not T then T, C = Tukui:unpack()	end
	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	if addon ~= 'Blizzard_ChallengesUI' then return end

	-- adjustments
	
	-- header
	ChallengesFrame:CreateMaxUIHeader("PvE & PvP")
	ChallengesFrame.MaxUIHeader:SetFrameLevel(15)
	
	-- close button
	ChallengesFrame.CloseButton:ClearAllPoints()
	ChallengesFrame.CloseButton:SetFrameLevel(16)
	ChallengesFrame.CloseButton:SetFrameStrata("HIGH")
	ChallengesFrame.CloseButton:SetPoint("RIGHT", ChallengesFrame.MaxUIHeader, "RIGHT", 4, 0)

	-- relocate
	ChallengesFrame:ClearAllPoints()
	ChallengesFrame:SetPoint("TOP", UIParent, "TOP", 0, -100)
	ChallengesFrame.ClearAllPoints = function() end
	ChallengesFrame.SetPoint = function() end
end
AS:RegisterSkin("Blizzard_ChallengesUI", AS.Blizzard_ChallengesUI)
