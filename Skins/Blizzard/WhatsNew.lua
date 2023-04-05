------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkinsBlizzard

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local WhatsNewSkin = CreateFrame("Frame")

local _G = _G

------------------------------------------------------------------------------------------
-- SKIN WhatsNew
------------------------------------------------------------------------------------------
local function SkinWhatsNewFrame()
	local SplashFrame = SplashFrame

	SplashFrame:SkinMaxUIBaseFrame(nil, true, " ")
end

local function SkinWhatsNewButtons()
	local SplashFrame = SplashFrame

	if not SplashFrame.TopCloseButton.isSkinned then
		SplashFrame.TopCloseButton:ClearAllPoints()
		SplashFrame.TopCloseButton:SetPoint("RIGHT", SplashFrame.MaxUIHeader, "RIGHT", -4, 0)
		SplashFrame.TopCloseButton:SkinMaxUICloseButton(true)
		SplashFrame.TopCloseButton.isSkinned = true
	end	
	
	if not SplashFrame.BottomCloseButton.isSkinned then
		SplashFrame.BottomCloseButton:SkinMaxUIButton(true)
		SplashFrame.BottomCloseButton.isSkinned = true
	end
end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function WhatsNewSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsBlizzard then return end

	if C["Skins"]["WhatsNew"] then
		if not IsAddOnLoaded("WhatsNew") then
			LoadAddOn("WhatsNew")
		end		
		SkinWhatsNewFrame()
		SkinWhatsNewButtons()
	end
	self:UnregisterAllEvents()
end

WhatsNewSkin:RegisterEvent("PLAYER_LOGIN")
WhatsNewSkin:SetScript("OnEvent", WhatsNewSkin.OnEvent)