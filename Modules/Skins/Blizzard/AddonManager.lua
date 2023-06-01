-----------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-01-2023
------------------------------------------------------------------------------------------

-- setting up MaxUISkinsBlizzard

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local AddonManagerSkin = CreateFrame("Frame")

local _G = _G
local gsub = gsub
local unpack = unpack
local GetAddOnInfo = GetAddOnInfo
local GetAddOnEnableState = GetAddOnEnableState
local UIDropDownMenu_GetSelectedValue = UIDropDownMenu_GetSelectedValue
local hooksecurefunc = hooksecurefunc

------------------------------------------------------------------------------------------
-- SKIN Achievements
------------------------------------------------------------------------------------------
local function SkinAddonsListElements(entry, addonIndex)
	if not entry.isMaxUISkinned then
		entry.Enabled:SkinMaxUICheckBox(true)
		entry.LoadAddonButton:SkinMaxUIButton(true)
		entry.isMaxUISkinned = true
	end
end

local function SkinAddonsListElementsClassic()
	local maxShown = _G.MAX_ADDONS_DISPLAYED
	for i = 1, maxShown do
		_G['AddonListEntry'..i..'Enabled']:SkinMaxUICheckBox(true)
		_G['AddonListEntry'..i].LoadAddonButton:SkinMaxUIButton(true)
	end
end

local function SkinAddonManagerFrame()
	local AddonList = _G.AddonList

	AddonListTitleText:SetScale(1.5)

	AddonList:SkinMaxUIBaseFrame(true, true)
	AddonList:SetHeight(AddonList:GetHeight() +2)

	_G.AddonCharacterDropDown:SkinMaxUIDropDown(true, 100)
	_G.AddonCharacterDropDown:ClearAllPoints()
	_G.AddonCharacterDropDown:SetPoint("BOTTOMLEFT", AddonList.ScrollBox, "TOPLEFT", 4, 4)

	_G.AddonListForceLoad:SkinMaxUICheckBox(true)
	_G.AddonListForceLoad:ClearAllPoints()
	_G.AddonListForceLoad:SetPoint("BOTTOMRIGHT", AddonList.ScrollBox, "TOPRIGHT", -200, 10)

	if T.Retail then 
		AddonList.ScrollBox:SkinMaxUIFrame()	
		--AddonList.ScrollBox.Backdrop:SetFrameLevel(4)	
		AddonList.ScrollBar:SkinMaxUIScrollBarNew(true)	
		hooksecurefunc('AddonList_InitButton', SkinAddonsListElements)
	else
		AddonListScrollFrameScrollBar:SkinMaxUIScrollBar(true)
		hooksecurefunc('AddonList_Update', SkinAddonsListElementsClassic)
	end
end

local function SkinAddonManagerButtons()

	-- AddOns Buttons
	local AddonsButtons = {
	_G.AddonListOkayButton,
	_G.AddonListCancelButton,
	_G.AddonListEnableAllButton,
	_G.AddonListDisableAllButton,
	}

	for _, Button in pairs(AddonsButtons) do
		Button:StripTextures()
		Button:SkinMaxUIButton(true)
		if T.Retail then
			Button["Center"]:Hide() -- still needed?
		end	
	end

	_G.AddonListOkayButton:ClearAllPoints()
	_G.AddonListDisableAllButton:ClearAllPoints()
	_G.AddonListOkayButton:SetPoint("BOTTOMRIGHT", _G.AddonListCancelButton, "BOTTOMLEFT", -6, 0)
	_G.AddonListDisableAllButton:SetPoint("BOTTOMLEFT", _G.AddonListEnableAllButton, "BOTTOMRIGHT", 6, 0)
end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function AddonManagerSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not C.Skins.MaxUISkinsBlizzard then return end

	if C["Skins"]["AddOns"] then
		if not IsAddOnLoaded("AddonList") then
			LoadAddOn("AddonList")
		end	
		SkinAddonManagerFrame()
		SkinAddonManagerButtons()
	end
	self:UnregisterAllEvents()
end

AddonManagerSkin:RegisterEvent("PLAYER_LOGIN")
AddonManagerSkin:SetScript("OnEvent", AddonManagerSkin.OnEvent)