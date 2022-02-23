------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
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
-- ADDON MANAGER
------------------------------------------------------------------------------------------
local AS_Blizzard_AddonManager = AS.Blizzard_AddonManager
function AS:Blizzard_AddonManager()
	AS_Blizzard_AddonManager(self)

	if not Tukui then return end
	if not T then T, C = Tukui:unpack() end
	if not C["Skins"]["MaxUIAddOnSkins"] then return end

	local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}

	_G.AddonList:CreateMaxUIHeader("Addons")
	_G.AddonList:CreateShadow()
	AddonListTitleText:Hide()

	_G.AddonCharacterDropDown:ClearAllPoints()	
	_G.AddonCharacterDropDown:SetPoint("TOPLEFT", AddonList, "TOPLEFT", -14, -4)	

	_G.AddonListForceLoad:ClearAllPoints()
	_G.AddonListForceLoad:SetPoint("TOPLEFT", _G.AddonCharacterDropDown , "BOTTOMLEFT", 16, 2)
	
	_G.AddonList:SetHeight(AddonList:GetHeight())
	
	_G.AddonListInset.Bg:SetInside()

	-- close button
	AddonListCloseButton:ClearAllPoints()
	AddonListCloseButton:SetPoint("RIGHT", AddonList.MaxUIHeader, "RIGHT", 4, 0)
	
	AddonListOkayButton:ClearAllPoints()
	AddonListCancelButton:ClearAllPoints()
	AddonListEnableAllButton:ClearAllPoints()
	AddonListDisableAllButton:ClearAllPoints()

	AddonListOkayButton:SetFrameLevel(15)
	AddonListCancelButton:SetFrameLevel(15)
	AddonListEnableAllButton:SetFrameLevel(15)
	AddonListDisableAllButton:SetFrameLevel(15)

	AddonListCancelButton:SetPoint("BOTTOMRIGHT", AddonList, "BOTTOMRIGHT", -6, 2)
	AddonListOkayButton:SetPoint("RIGHT", AddonListCancelButton, "LEFT", -3, 0)
	AddonListEnableAllButton:SetPoint("BOTTOMLEFT", AddonList, "BOTTOMLEFT", 6, 2)
	AddonListDisableAllButton:SetPoint("LEFT", AddonListEnableAllButton, "RIGHT", 3, 0)
end
AS:RegisterSkin('Blizzard_AddonManager', AS.Blizzard_AddonManager)