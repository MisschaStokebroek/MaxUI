------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up MaxUISkins
-- AddonSkins has bugs


------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
if not T.Retail then return end

if not IsAddOnLoaded('AddonSkins') then 
	return
end

local AS, ASL = unpack(AddOnSkins)
if not AS:CheckAddOn('Tukui') then return end
local T, C
local _G = _G

------------------------------------------------------------------------------------------
-- ACHIEVEMENTS
------------------------------------------------------------------------------------------
local AS_Blizzard_AchievementUI = AS.Blizzard_AchievementUI
function AS:Blizzard_AchievementUI(event, addon)
	AS_Blizzard_AchievementUI(self, event, addon)

	if not Tukui then return end
	if not T then T, C = Tukui:unpack() end
	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	if addon ~= 'Blizzard_AchievementUI' then return end
	
	AchievementFrame:CreateShadow()
	AchievementFrame:SetHeight(AchievementFrame:GetHeight() + 100)
	AchievementFrame.Backdrop:SetAlpha(0.75)
	AchievementFrameCategories.Backdrop:SetAlpha(0.75)
	AchievementFrameSummary.Backdrop:SetAlpha(0.75)
	AchievementFrameAchievementsContainer.Backdrop:Hide()

	_G.AchievementFrame.searchBox:ClearAllPoints()
	_G.AchievementFrame.searchBox:SetHeight(16)
	_G.AchievementFrame.searchBox:SetWidth(200)
	_G.AchievementFrame.searchBox:SetFrameLevel(16)
	_G.AchievementFrame.searchBox:SetFrameStrata("HIGH")
	_G.AchievementFrame.searchBox:SetPoint("RIGHT", AchievementFrameCloseButton, "LEFT", -8, 0)

	_G.AchievementFrameFilterDropDown:ClearAllPoints()
	_G.AchievementFrameFilterDropDown:SetPoint("BOTTOMLEFT", _G.AchievementFrameCategories, "TOPLEFT", 0, 1)
	_G.AchievementFrameFilterDropDown:SetPoint("TOPRIGHT", _G.AchievementFrameCategories, "TOPRIGHT", 0, 17)

	_G.AchievementFrameFilterDropDownButton:ClearAllPoints()
	_G.AchievementFrameFilterDropDownButton:SetPoint("TOPRIGHT", _G.AchievementFrameFilterDropDown, "TOPRIGHT", -10, -8)

	_G.AchievementFrameFilterDropDownText:SetHeight(18)
	_G.AchievementFrameFilterDropDownText:SetPoint("BOTTOMLEFT", _G.AchievementFrameCategories, "TOPLEFT", 0, 1)
	_G.AchievementFrameFilterDropDownText:SetPoint("TOPRIGHT", _G.AchievementFrameCategories, "TOPRIGHT", -44, 14)

	_G.AchievementFrameFilterDropDownButton:SetHeight(16)
	_G.AchievementFrameFilterDropDownButton:SetWidth(16)
	_G.AchievementFrameFilterDropDownButton:ClearAllPoints()
	_G.AchievementFrameFilterDropDownButton:SetPoint("RIGHT", _G.AchievementFrameFilterDropDown, "RIGHT", -18, -3)
	
	-- header
	AchievementFrame:CreateMaxUIHeader("Achievements")
	AchievementFrame.MaxUIHeader:SetFrameLevel(15)
	
	-- close button
	AchievementFrameCloseButton:ClearAllPoints()
	AchievementFrameCloseButton:SetFrameLevel(16)
	AchievementFrameCloseButton:SetFrameStrata("HIGH")
	AchievementFrameCloseButton:SetPoint("RIGHT", AchievementFrame.MaxUIHeader, "RIGHT", 4, 0)

	-- relocate
	AchievementFrame:ClearAllPoints()
	AchievementFrame:SetPoint("TOP", UIParent, "TOP", 0, -100)
	AchievementFrame.ClearAllPoints = function() end
	AchievementFrame.SetPoint = function() end

	AS:UnregisterSkinEvent(addon, event)
end
AS:RegisterSkin("Blizzard_AchievementUI", AS.Blizzard_AchievementUI, 'ADDON_LOADED')