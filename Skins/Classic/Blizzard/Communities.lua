------------------------------------------------------------------------------------------
-- MaxUI 6 - SHADOWLANDS / TUKUI 20
-- latest update: 27-10-2020
------------------------------------------------------------------------------------------

-- setting up MaxUISkins

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
if not IsAddOnLoaded('AddonSkins') then 
	return
end

local AS, ASL = unpack(AddOnSkins)
if not AS:CheckAddOn('Tukui') then return end
local T, C
local _G = _G

------------------------------------------------------------------------------------------
-- GUILD UI
------------------------------------------------------------------------------------------
local AS_Blizzard_GuildUI = AS.Blizzard_GuildUI
function AS:Blizzard_GuildUI(event, addon)
	AS_Blizzard_GuildUI(self, event, addon)
	
	if not Tukui then return end
	if not T then
		T, C = Tukui:unpack()
	end

	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	if addon ~= "Blizzard_GuildUI" then return end
	
end
AS:RegisterSkin('Blizzard_GuildUI', AS.Blizzard_GuildUI, 'ADDON_LOADED')

------------------------------------------------------------------------------------------
-- COMMUNITIES
------------------------------------------------------------------------------------------
local AS_Blizzard_Communities = AS.Blizzard_Communities
function AS:Blizzard_Communities(event, addon)
	AS_Blizzard_Communities(self, event, addon)
	
	if not Tukui then return end
	if not T then
		T, C = Tukui:unpack()
	end

	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	if addon ~= 'Blizzard_Communities' then return end

	-- header
	CommunitiesFrame:CreateMaxUIHeader("Guild Finder")
	CommunitiesFrame.MaxUIHeader:SetFrameLevel(15)
	
	-- close button
	CommunitiesFrame.CloseButton:ClearAllPoints()
	CommunitiesFrame.CloseButton:SetFrameLevel(16)
	CommunitiesFrame.CloseButton:SetFrameStrata("HIGH")
	CommunitiesFrame.CloseButton:SetPoint("RIGHT", CommunitiesFrame.MaxUIHeader, "RIGHT", 4, 0)

	-- relocate
	CommunitiesFrame:ClearAllPoints()
	CommunitiesFrame:SetPoint("TOP", UIParent, "TOP", 0, -100)
	CommunitiesFrame.ClearAllPoints = function() end
	CommunitiesFrame.SetPoint = function() end

	AS:UnregisterSkinEvent(addon, event)
end
AS:RegisterSkin("Blizzard_Communities", AS.Blizzard_Communities, 'ADDON_LOADED')

------------------------------------------------------------------------------------------
-- GUILD CONTROL
------------------------------------------------------------------------------------------
local AS_Blizzard_GuildControlUI = AS.Blizzard_GuildControlUI
function AS:Blizzard_GuildControlUI(event, addon)
	AS_Blizzard_GuildControlUI(self, event, addon)

	if not Tukui then return end
	if not T then
		T, C = Tukui:unpack()
	end

	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	if addon ~= 'Blizzard_GuildControlUI' then return end

	AS:UnregisterSkinEvent(addon, event)
end
AS:RegisterSkin('Blizzard_GuildControlUI', AS.Blizzard_GuildControlUI, 'ADDON_LOADED')

------------------------------------------------------------------------------------------
-- GUILD BANK
------------------------------------------------------------------------------------------
local AS_Blizzard_GuildBankUI = AS.Blizzard_GuildBankUI
function AS:Blizzard_GuildBankUI(event, addon)
	AS_Blizzard_GuildBankUI(self, event, addon)
	
	if not Tukui then return end
	if not T then
		T, C = Tukui:unpack()
	end

	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	if addon ~= 'Blizzard_GuildBankUI' then return end

	AS:UnregisterSkinEvent(addon, event)
end
AS:RegisterSkin('Blizzard_GuildBankUI', AS.Blizzard_GuildBankUI, 'ADDON_LOADED')

------------------------------------------------------------------------------------------
-- LOOKING FOR GUILD
------------------------------------------------------------------------------------------
