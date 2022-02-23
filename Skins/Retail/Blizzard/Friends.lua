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
-- TO BE DONE
------------------------------------------------------------------------------------------
local AS_Blizzard_Friends = AS.Blizzard_Friends
function AS:Blizzard_Friends()
	AS_Blizzard_Friends(self)

	if not Tukui then return end
	if not T then
		T, C = Tukui:unpack()
	end

	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	
	-- adjustments
	WhoFrameDropDown:ClearAllPoints()
	WhoFrameDropDown:SetPoint("TOPLEFT", FriendsFrame, "TOPLEFT", 0, -20)
	
	AS:SkinScrollBar(IgnoreListFrameScrollFrame.scrollBar)
	
	RaidFrame.RoleCount.TankIcon:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\roleicons\\Maxtank.tga")
	RaidFrame.RoleCount.HealerIcon:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\roleicons\\Maxhealer.tga")
	RaidFrame.RoleCount.DamagerIcon:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\roleicons\\Maxdps.tga")
	
	-- header
	FriendsFrame:CreateMaxUIHeader("Social")
	FriendsFrame:CreateShadow()
	FriendsFrame.MaxUIHeader:SetFrameLevel(15)

	-- close button
	FriendsFrameCloseButton:ClearAllPoints()
	FriendsFrameCloseButton:SetFrameLevel(16)
	FriendsFrameCloseButton:SetFrameStrata("HIGH")
	FriendsFrameCloseButton:SetPoint("RIGHT", FriendsFrame.MaxUIHeader, "RIGHT", 4, 0)

	-- relocate
	FriendsFrame:ClearAllPoints()
	FriendsFrame:SetPoint("TOP", UIParent, "TOP", 0, -100)
	FriendsFrame.ClearAllPoints = function() end
	FriendsFrame.SetPoint = function() end
end
AS:RegisterSkin('Blizzard_Friends', AS.Blizzard_Friends)
