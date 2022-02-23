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
local AS_Blizzard_GarrisonUI = AS.Blizzard_GarrisonUI
function AS:Blizzard_GarrisonUI(event, addon)
	AS_Blizzard_GarrisonUI(self, event, addon)
	
	if not Tukui then return end
	if not T then T, C = Tukui:unpack()	end
	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	if addon ~= 'Blizzard_GarrisonUI' then return end

	-- skin frame
	AS:CreateBackdrop(GarrisonLandingPage)
	GarrisonLandingPage.Backdrop:CreateShadow()
	
	-- header
	GarrisonLandingPage:CreateMaxUIHeader("Missions")
	GarrisonLandingPage.MaxUIHeader:SetFrameLevel(15)
	
	-- close button
	AS:SkinCloseButton(GarrisonLandingPage.CloseButton)
	GarrisonLandingPage.CloseButton:ClearAllPoints()
	GarrisonLandingPage.CloseButton:SetFrameLevel(16)
	GarrisonLandingPage.CloseButton:SetFrameStrata("HIGH")
	GarrisonLandingPage.CloseButton:SetPoint("RIGHT", GarrisonLandingPage.MaxUIHeader, "RIGHT", 4, 0)

	-- relocate
	GarrisonLandingPage:ClearAllPoints()
	GarrisonLandingPage:SetPoint("TOP", UIParent, "TOP", 0, -100)
	GarrisonLandingPage.ClearAllPoints = function() end
	GarrisonLandingPage.SetPoint = function() end

	AS:UnregisterSkinEvent(addon, event)
end
AS:RegisterSkin('Blizzard_GarrisonUI', AS.Blizzard_GarrisonUI, 'ADDON_LOADED')
