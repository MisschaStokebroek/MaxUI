------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 05-11-2023
------------------------------------------------------------------------------------------

-- setting up MaxUISkins

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local RareScannerSkin = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- SKIN simc
------------------------------------------------------------------------------------------
local function SkinRareScannerToMaxUIStyle()
		
		if scanner_button.IsMaxUISkinned then return end

		-- basic
		--scanner_button:SetParent(UIParent)
		scanner_button:SetScale(0.55)
		scanner_button:SetWidth(scanner_button:GetWidth()+10)
		scanner_button:SkinMaxUIBaseFrame(true)
		--scanner_button.FilterEntityButton:SkinMaxUIButton(true)
		
		mxpplayermodel:ClearAllPoints()
		mxpplayermodel:SetPoint("BOTTOM", scanner_button.MaxUIHeader, "CENTER", 0, 0)
		--mxpplayermodel:SetHeight(scanner_button:GetHeight())
		--mxpplayermodel:SetWidth(scanner_button:GetHeight())

		LootBar:SkinMaxUIFrame(true)
		LootBar:ClearAllPoints()
		LootBar:SetPoint("TOPLEFT", scanner_button, "BOTTOMLEFT", 0, -8)
		LootBar:SetPoint("TOPRIGHT", scanner_button, "BOTTOMRIGHT", 0, -8)

		--local LootBarChildren = {LootBar:GetChildren()}
		--for _, child in ipairs(LootBarChildren) do
		--	child:SkinMaxUIIcon2()
		--end

		scanner_button.IsMaxUISkinned = true
end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function RareScannerSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsAddons then return end

	if IsAddOnLoaded('RareScanner')  and C["AddOns"]["RareScannerSkin"] then 
		SkinRareScannerToMaxUIStyle()
	end
	self:UnregisterAllEvents()
end

RareScannerSkin:RegisterEvent("PLAYER_LOGIN")
RareScannerSkin:SetScript("OnEvent", RareScannerSkin.OnEvent)