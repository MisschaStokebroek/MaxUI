------------------------------------------------------------------------------------------
-- MaxUI 6 - SHADOWLANDS / TUKUI 20
-- latest update: 27-10-2020
------------------------------------------------------------------------------------------

-- setting up MaxUISkins

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
if not IsAddOnLoaded('AddonSkins') then return end

local AS, ASL = unpack(AddOnSkins)
if not AS:CheckAddOn('Tukui') then return end
local T, C
local _G = _G

------------------------------------------------------------------------------------------
-- TALENTS
------------------------------------------------------------------------------------------
local AS_Blizzard_TalentUI = AS.Blizzard_TalentUI
function AS:Blizzard_TalentUI(event, addon)
	AS_Blizzard_TalentUI(self, event, addon)
	
	if not Tukui then return end
	if not T then T, C = Tukui:unpack() end
	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	if addon ~= 'Blizzard_TalentUI' then return end

	-- adjustments
	PlayerTalentFrame:CreateShadow()
	PlayerTalentFrameInset:StripTextures()
	
	PlayerTalentFrameTitleText:Kill()
	PlayerTalentFrameSpecializationSpellScrollFrameScrollChildSpecName:SetFont(C.Medias.MaxUIFont, 36, 1, 1)
	PlayerTalentFrameTalentsPvpTalentFrame.Label:SetFont(C.Medias.MaxUIFont, 12, 1, 1)
	
	for _, Frame in pairs({ PlayerTalentFrameSpecialization, PlayerTalentFramePetSpecialization }) do

		for i = 1, 4 do
			local Button = Frame['specButton'..i]
			local _, _, _, icon = GetSpecializationInfo(i, false, Frame.isPet)

			Button.specIcon:SetHeight(61)
			Button.specIcon:SetWidth(61)
			
			Button.Backdrop:Hide()
			
		end	
	end

	-- header
	PlayerTalentFrame:CreateMaxUIHeader("Talents")

	-- close button
	PlayerTalentFrame.CloseButton:ClearAllPoints()
	PlayerTalentFrame.CloseButton:SetPoint("RIGHT", PlayerTalentFrame.MaxUIHeader, "RIGHT", 4, 0)
	
	-- relocate
	PlayerTalentFrame:ClearAllPoints()
	PlayerTalentFrame:SetPoint("TOP", UIParent, "TOP", 0, -100)
	PlayerTalentFrame.ClearAllPoints = function() end
	PlayerTalentFrame.SetPoint = function() end

	AS:UnregisterSkinEvent(addon, event)
end
AS:RegisterSkin('Blizzard_TalentUI', AS.Blizzard_TalentUI, 'ADDON_LOADED')