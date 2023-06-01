------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkinsBlizzard

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local TalentSkin = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- SKIN Talentframe
------------------------------------------------------------------------------------------
local function SkinBlizzardToMaxUIStyleDFTalent()

	_G.ClassTalentFrame:SkinMaxUIBaseFrame(true, true, " ")

end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function TalentSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsBlizzard then return end

	if C["Skins"]["Talents"] then
		if not IsAddOnLoaded("Blizzard_ClassTalentUI") then
			LoadAddOn("Blizzard_ClassTalentUI")
		end		
		SkinBlizzardToMaxUIStyleDFTalent()
	end
	self:UnregisterAllEvents()
end

TalentSkin:RegisterEvent("PLAYER_LOGIN")
TalentSkin:SetScript("OnEvent", TalentSkin.OnEvent)