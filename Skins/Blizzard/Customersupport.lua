------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkinsBlizzard

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local CustomerSupportSkin = CreateFrame("Frame")

local _G = _G

------------------------------------------------------------------------------------------
-- SKIN Customer Support
------------------------------------------------------------------------------------------
local function SkinBlizzardToMaxUIStyleSupport()
	local HelpFrame = _G.HelpFrame
	local browser = _G.HelpBrowser

	HelpFrame:SkinMaxUIBaseFrame(true)
	browser.BrowserInset:StripTextures()
end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function CustomerSupportSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsBlizzard then return end

	if C["Skins"]["CustomerSupport"] then
		SkinBlizzardToMaxUIStyleSupport()
	end
	self:UnregisterAllEvents()
end

CustomerSupportSkin:RegisterEvent("PLAYER_LOGIN")
CustomerSupportSkin:SetScript("OnEvent", CustomerSupportSkin.OnEvent)