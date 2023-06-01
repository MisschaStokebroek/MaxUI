------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkinsBlizzard

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local QuestlogWorldmapSkin = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- SKIN questlog and worldframe
------------------------------------------------------------------------------------------
local function SkinBlizzardToMaxUIStyleQuestLog()

	-- basic
	WorldMapFrame:SkinMaxUIBaseFrame()

	-- backdrop
	--WorldMapFrame:CreateBackdrop("Transparent")
	WorldMapFrame.Backdrop:SetAlpha(0.7)
	WorldMapFrame.Backdrop:SetOutside(WorldMapFrame)
	WorldMapFrame.Backdrop:SetFrameLevel(0)
	WorldMapFrame.Backdrop:CreateShadow()

end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function QuestlogWorldmapSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsBlizzard then return end

	if C["Skins"]["WorldMapQuestlog"] then
		if not IsAddOnLoaded("BlizzardQuestFrames") then
			LoadAddOn("BlizzardQuestFrames")
		end		
	SkinBlizzardToMaxUIStyleQuestLog()
	end
	self:UnregisterAllEvents()
end

QuestlogWorldmapSkin:RegisterEvent("PLAYER_LOGIN")
QuestlogWorldmapSkin:SetScript("OnEvent", QuestlogWorldmapSkin.OnEvent)