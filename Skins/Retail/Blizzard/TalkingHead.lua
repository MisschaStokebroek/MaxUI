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
-- TALKING HEAD
------------------------------------------------------------------------------------------
local AS_Blizzard_TalkingHeadUI = AS.Blizzard_TalkingHeadUI
function AS:Blizzard_TalkingHeadUI(event, addon)
	if Tukui then return end
end
AS:RegisterSkin("Blizzard_TalkingHeadUI", AS.Blizzard_TalkingHeadUI, 'ADDON_LOADED')