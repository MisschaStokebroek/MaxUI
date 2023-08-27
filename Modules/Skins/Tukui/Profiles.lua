------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 21-08-2023
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
	if TukuiProfiles.Reset then
		TukuiProfiles.Reset:SkinMaxUIButton(true)
	end	
	if TukuiProfiles.Apply then
		TukuiProfiles.Apply:SkinMaxUIButton(true)
	end
	if TukuiProfilesScrollBar then		
		TukuiProfilesScrollBar:SkinMaxUIScrollBar(true)
	end	
end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function ProfilesSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if IsAddOnLoaded('Tukui') then
		SkinTukuiProfiles()
	end	
	self:UnregisterAllEvents()
end

ProfilesSkin:RegisterEvent("PLAYER_ENTERING_WORLD")
ProfilesSkin:SetScript("OnEvent", ProfilesSkin.OnEvent)