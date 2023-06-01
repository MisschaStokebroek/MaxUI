------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkinsBlizzard

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local UIWidgetSkin = CreateFrame("Frame")

local _G = _G

------------------------------------------------------------------------------------------
-- SKIN WhatsNew
------------------------------------------------------------------------------------------
local function SkinUIWidget()
	
	local Children = {UIWidgetPowerBarContainerFrame:GetChildren()}
	for _, child in ipairs(UIWidgetPowerBarContainerFrame) do
		if child:GetObjectType() == "StatusBar" then
			child:SkinMaxUIStatusBar(true)
		end
	end
end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function UIWidgetSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsBlizzard then return end

	--if C["Skins"]["WhatsNew"] then
		--SkinUIWidget()
	--end
	self:UnregisterAllEvents()
end

UIWidgetSkin:RegisterEvent("PLAYER_LOGIN")
UIWidgetSkin:SetScript("OnEvent", UIWidgetSkin.OnEvent)