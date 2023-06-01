------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkins

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local ProfilesSkin = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- SKIN WhatsNew
------------------------------------------------------------------------------------------
local function SkinTukuiProfiles()
	TukuiProfiles.Reset:SkinMaxUIButton(true)
	TukuiProfiles.Apply:SkinMaxUIButton(true)
	TukuiProfilesScrollBar:SkinMaxUIScrollBar(true)
end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function ProfilesSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	SkinTukuiProfiles()
	self:UnregisterAllEvents()
end

ProfilesSkin:RegisterEvent("PLAYER_LOGIN")
ProfilesSkin:SetScript("OnEvent", ProfilesSkin.OnEvent)