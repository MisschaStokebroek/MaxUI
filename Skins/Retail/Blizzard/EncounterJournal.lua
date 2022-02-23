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
local AS_Blizzard_EncounterJournal = AS.Blizzard_EncounterJournal
function AS:Blizzard_EncounterJournal(event, addon)
	AS_Blizzard_EncounterJournal(self, event, addon)
	
	if not Tukui then return end
	if not T then
		T, C = Tukui:unpack()
	end

	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	if addon ~= 'Blizzard_EncounterJournal' then return end
	
	-- adjustments
	local Font = C.Medias.MaxUIFont
	EncounterJournal.Backdrop:SetAlpha(0.75)
	EncounterJournalInset:Hide()
	
	
	-- header
	EncounterJournal:CreateMaxUIHeader("Encounter Journal")
	EncounterJournal:CreateShadow()
	EncounterJournal.MaxUIHeader:SetFrameLevel(15)
	
	-- close button
	EncounterJournalCloseButton:ClearAllPoints()
	EncounterJournalCloseButton:SetFrameLevel(16)
	EncounterJournalCloseButton:SetFrameStrata("HIGH")
	EncounterJournalCloseButton:SetPoint("RIGHT", EncounterJournal.MaxUIHeader, "RIGHT", 4, 0)

	-- relocate
	EncounterJournal:ClearAllPoints()
	EncounterJournal:SetPoint("TOP", UIParent, "TOP", 0, -100)
	EncounterJournal.ClearAllPoints = function() end
	EncounterJournal.SetPoint = function() end

	AS:UnregisterSkinEvent(addon, event)
end
AS:RegisterSkin('Blizzard_EncounterJournal', AS.Blizzard_EncounterJournal, 'ADDON_LOADED')