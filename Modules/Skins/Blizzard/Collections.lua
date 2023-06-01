------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkinsBlizzard

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local CollectionsSkin = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- SKIN Collections
------------------------------------------------------------------------------------------
local function SkinBlizzardToMaxUIStyleCollections()

	-- bugs when trying to drag...
	--CollectionsJournal:SkinMaxUIBaseFrame()

end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function CollectionsSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsBlizzard then return end

	if C["Skins"]["Collections"] then
		if not IsAddOnLoaded("Blizzard_Collections") then
			LoadAddOn("Blizzard_Collections")
		end		
		SkinBlizzardToMaxUIStyleCollections()
	end
	self:UnregisterAllEvents()
end

CollectionsSkin:RegisterEvent("PLAYER_LOGIN")
CollectionsSkin:SetScript("OnEvent", CollectionsSkin.OnEvent)