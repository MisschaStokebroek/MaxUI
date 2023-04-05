------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkins

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local CliqueSkin = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- SKIN Clique
------------------------------------------------------------------------------------------
local function SkinCliqueToMaxUIStyle()
	---if ???.IsSkinned then return end
	CliqueConfig:SkinMaxUIBaseFrame()
	---???.IsSkinned = true
end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function CliqueSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsAddons then return end

	if IsAddOnLoaded('Clique') and C["AddOns"]["CliqueSkin"] then 
		SkinCliqueToMaxUIStyle()
	end
	self:UnregisterAllEvents()
end

CliqueSkin:RegisterEvent("PLAYER_LOGIN")
CliqueSkin:SetScript("OnEvent", CliqueSkin.OnEvent)