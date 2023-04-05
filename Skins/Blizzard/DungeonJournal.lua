------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkinsBlizzard

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local DungeonJournalSkin = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- SKIN Dungeon Journal
------------------------------------------------------------------------------------------
local function SkinBlizzardToMaxUIStyleJournal()

	EncounterJournal:SkinMaxUIBaseFrame()

end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function DungeonJournalSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsBlizzard then return end

	if C["Skins"]["DungeonJournal"] then
		if not IsAddOnLoaded("Blizzard_EncounterJournal") then
			LoadAddOn("Blizzard_EncounterJournal")
		end		
		SkinBlizzardToMaxUIStyleJournal()
	end
	self:UnregisterAllEvents()
end

DungeonJournalSkin:RegisterEvent("PLAYER_LOGIN")
DungeonJournalSkin:SetScript("OnEvent", DungeonJournalSkin.OnEvent)