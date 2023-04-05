------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkinsBlizzard

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local MissionsSkin = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- SKIN Missions
------------------------------------------------------------------------------------------
local function SkinBlizzardToMaxUIStyleMissions()

	GarrisonLandingPage:SkinMaxUIBaseFrame()
	ExpansionLandingPage:SkinMaxUIBaseFrame()

end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function MissionsSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsBlizzard then return end

	if C["Skins"]["MissionsRenown"] then
		--if not IsAddOnLoaded("Blizzard_GarrisonUI") then
		--	LoadAddOn("Blizzard_GarrisonUI")
		--end		
	--SkinBlizzardToMaxUIStyleMissions()
	end
	self:UnregisterAllEvents()
end

MissionsSkin:RegisterEvent("PLAYER_LOGIN")
MissionsSkin:SetScript("OnEvent", MissionsSkin.OnEvent)