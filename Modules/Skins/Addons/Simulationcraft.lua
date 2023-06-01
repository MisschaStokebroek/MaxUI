------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkins

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local SimCraftSkin = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- SKIN simc
------------------------------------------------------------------------------------------
local function SkinSimCToMaxUIStyle()
	local Simulationcraft = LibStub("AceAddon-3.0"):GetAddon("Simulationcraft")
	hooksecurefunc(Simulationcraft, 'GetMainFrame', function()
		
		if SimcFrame.IsMaxUISkinned then return end

		-- basic
		SimcFrame:SkinMaxUIBaseFrame(true)
		SimcFrame:SetHeight(420)

		SimcFrameButton:SkinMaxUIButton(Strip)
		SimcScrollFrameScrollBar:SkinMaxUIScrollBar(Strip)
		
		SimcFrame.IsMaxUISkinned = true
	end)
end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function SimCraftSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsAddons then return end

	if IsAddOnLoaded('Simulationcraft') and C["AddOns"]["SimulationcraftSkin"] then 
		SkinSimCToMaxUIStyle()
	end
	self:UnregisterAllEvents()
end

SimCraftSkin:RegisterEvent("PLAYER_LOGIN")
SimCraftSkin:SetScript("OnEvent", SimCraftSkin.OnEvent)