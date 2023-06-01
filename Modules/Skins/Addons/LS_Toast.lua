------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkins

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local LSToastSkin = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- SKIN simc
------------------------------------------------------------------------------------------
local function SkinLSToastToMaxUIStyle()
	
	if toast then

		for i = 1, 99 do
			

			local toast = "LSToast"..i	
			toast:Hide()
		end
	end	
end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function LSToastSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsAddons then return end

	if IsAddOnLoaded('ls_Toasts') --[[and C["AddOns"]["SimulationcraftSkin"] --]] then 
		SkinLSToastToMaxUIStyle()
	end
	self:UnregisterAllEvents()
end

LSToastSkin:RegisterEvent("PLAYER_LOGIN")
LSToastSkin:SetScript("OnEvent", LSToastSkin.OnEvent)