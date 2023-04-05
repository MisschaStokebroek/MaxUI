------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkinsBlizzard

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local EventCalendarSkin = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- SKIN Events and calendar
------------------------------------------------------------------------------------------
local function SkinBlizzardToMaxUIStyleEvents()

	CalendarFrame:SkinMaxUIBaseFrame(true)

end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function EventCalendarSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsBlizzard then return end

	if C["Skins"]["EventCalendar"] then
		if not IsAddOnLoaded("Blizzard_Calendar") then
			LoadAddOn("Blizzard_Calendar")
		end		
		SkinBlizzardToMaxUIStyleEvents()
	end
	self:UnregisterAllEvents()
end

EventCalendarSkin:RegisterEvent("PLAYER_LOGIN")
EventCalendarSkin:SetScript("OnEvent", EventCalendarSkin.OnEvent)