------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
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
-- AUCTIONHOUSE WIP
------------------------------------------------------------------------------------------
local AS_Blizzard_AuctionHouseUI = AS.Blizzard_AuctionHouseUI
function AS:Blizzard_AuctionHouseUI(event, addon)
	AS_Blizzard_AuctionHouseUI(self, event, addon)
	
	if not Tukui then return end
	if not T then T, C = Tukui:unpack()	end
	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	if addon ~= "Blizzard_AuctionHouseUI" then return end
	
	-- adjustments
	_G.AuctionHouseFrameInset:StripTextures()
	_G.AuctionHouseFrameInset.NineSlice:StripTextures()
	_G.AuctionHouseFrame.Backdrop:SetAlpha(0.75)	
	_G.AuctionHouseFrame.BrowseResultsFrame.ItemList.Backdrop:SetAlpha(0.75)

	AS:SkinFrame(_G.AuctionHouseFrame.ItemSellList)

	-- header
	_G.AuctionHouseFrame:CreateMaxUIHeader("Auction House")
	_G.AuctionHouseFrame:CreateShadow()
	_G.AuctionHouseFrame.MaxUIHeader:SetFrameLevel(15)
	
	-- close button
	_G.AuctionHouseFrameCloseButton:ClearAllPoints()
	_G.AuctionHouseFrameCloseButton:SetFrameLevel(16)
	_G.AuctionHouseFrameCloseButton:SetFrameStrata("HIGH")
	_G.AuctionHouseFrameCloseButton:SetPoint("RIGHT", _G.AuctionHouseFrame.MaxUIHeader, "RIGHT", 4, 0)

	-- relocate
	_G.AuctionHouseFrame:ClearAllPoints()
	_G.AuctionHouseFrame:SetPoint("TOP", UIParent, "TOP", 0, -100)
	_G.AuctionHouseFrame.ClearAllPoints = function() end
	_G.AuctionHouseFrame.SetPoint = function() end

	AS:UnregisterSkinEvent(addon, event)
end
AS:RegisterSkin('Blizzard_AuctionHouseUI', AS.Blizzard_AuctionHouseUI, 'ADDON_LOADED')

------------------------------------------------------------------------------------------
-- BLACK MARKET
------------------------------------------------------------------------------------------
local AS_Blizzard_BlackMarketUI = AS.Blizzard_BlackMarketUI
function AS:Blizzard_BlackMarketUI(event, addon)
	AS_Blizzard_BlackMarketUI(self, event, addon)
	
	if not Tukui then return end
	if not T then T, C = Tukui:unpack()	end
	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	if addon ~= "Blizzard_BlackMarketUI" then return end
	
	-- adjustments
	_G.BlackMarketFrameInset:StripTextures()
	_G.BlackMarketFrameInset.NineSlice:StripTextures()
	_G.BlackMarketFrame.Backdrop:SetAlpha(0.75)	

	-- header
	_G.BlackMarketFrame:CreateMaxUIHeader("Black Market")
	_G.BlackMarketFrame:CreateShadow()
	_G.BlackMarketFrame.MaxUIHeader:SetFrameLevel(15)
	
	-- close button
	_G.BlackMarketFrameCloseButton:ClearAllPoints()
	_G.BlackMarketFrameCloseButton:SetFrameLevel(16)
	_G.BlackMarketFrameCloseButton:SetFrameStrata("HIGH")
	_G.BlackMarketFrameCloseButton:SetPoint("RIGHT", _G.BlackMarketFrame.MaxUIHeader, "RIGHT", 4, 0)

	-- relocate
	_G.BlackMarketFrame:ClearAllPoints()
	_G.BlackMarketFrame:SetPoint("TOP", UIParent, "TOP", 0, -100)
	_G.BlackMarketFrame.ClearAllPoints = function() end
	_G.BlackMarketFrame.SetPoint = function() end

	AS:UnregisterSkinEvent(addon, event)
end
AS:RegisterSkin('Blizzard_BlackMarketUI', AS.Blizzard_BlackMarketUI, 'ADDON_LOADED')