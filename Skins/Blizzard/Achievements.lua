------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkinsBlizzard

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local AchievementSkin = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- SKIN Achievements
------------------------------------------------------------------------------------------
local function SkinBlizzardToMaxUIStyleAchievements()

	AchievementFrame:SkinMaxUIBaseFrame()

end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function AchievementSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsBlizzard then return end

	if C["Skins"]["Achievements"] then
		if not IsAddOnLoaded("Blizzard_AchievementUI") then
			LoadAddOn("Blizzard_AchievementUI")
		end		
		SkinBlizzardToMaxUIStyleAchievements()
	end
	self:UnregisterAllEvents()
end

AchievementSkin:RegisterEvent("PLAYER_LOGIN")
AchievementSkin:SetScript("OnEvent", AchievementSkin.OnEvent)