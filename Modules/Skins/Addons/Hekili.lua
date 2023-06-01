------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkins

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local HekiliSkin = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- SKIN Hekili
------------------------------------------------------------------------------------------
 local function SkinHekiliToMaxUIStyle()
	

--[[
	for Display, _ in ipairs(Hekili.DB.profile.displays) do
		for Buttons = 1, Hekili.DB.profile.displays[Display].numIcons do
			local Button = _G['Hekili_D'..Display..'_B'..Buttons]
			
			if Button and not Button.IsMaxUISkinned then
				Button:CreateBackdrop('Transparent')
				Button.Backdrop:CreateShadow()

				if C["Skins"]["ActionBarButtonFilter"] == true then 
					Button.Backdrop:CreateMaxUIFilter()
				end
				Button.IsMaxUISkinned = true				
			end
		end
	end	

--]]

	hooksecurefunc(Hekili, "CreateButton", function(self, dispID, id)
		local Button = Hekili.DisplayPool[dispID].Buttons[id]
		if Button and not Button.IsMaxUISkinned then
			Button.Backdrop:SetOutside()
			Button.Backdrop:CreateShadow()

			if C["Skins"]["ActionBarButtonFilter"] == true then 
				Button:CreateMaxUIFilter()
			end
			Button.IsMaxUISkinned = true
		end
	end)
end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function HekiliSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsAddons then return end

	if IsAddOnLoaded('Hekili') and C["AddOns"]["HekiliSkin"] then 
		SkinHekiliToMaxUIStyle()
	end
	self:UnregisterAllEvents()
end

HekiliSkin:RegisterEvent("PLAYER_LOGIN")
HekiliSkin:SetScript("OnEvent", HekiliSkin.OnEvent)