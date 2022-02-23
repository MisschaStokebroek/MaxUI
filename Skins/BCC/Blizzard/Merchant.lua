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
-- MERCHANTS
------------------------------------------------------------------------------------------
local AS_Blizzard_Merchant = AS.Blizzard_Merchant
function AS:Blizzard_Merchant()
	AS_Blizzard_Merchant(self)
	
	if not Tukui then return end
	if not T then T, C = Tukui:unpack() end
	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	
	-- adjustments
	MerchantFrameInset:StripTextures()
	--MerchantFrameInset.NineSlice:StripTextures()
	
	for i = 1, 12 do
		local Slot = _G["MerchantItem"..i]
		Slot.Backdrop:Hide()
		Slot.ItemButton:CreateShadow()
	end
	
	MerchantBuyBackItem.Backdrop:Hide()
	MerchantNextPageButton:SetSize(22, 22)
	MerchantPrevPageButton:SetSize(22, 22)
	
	-- header
	MerchantFrame:CreateMaxUIHeader("Merchant")
	MerchantFrame:CreateShadow()
	MerchantFrame.MaxUIHeader:SetFrameLevel(15)
	
	-- close button
	MerchantFrameCloseButton:ClearAllPoints()
	MerchantFrameCloseButton:SetFrameLevel(16)
	MerchantFrameCloseButton:SetFrameStrata("HIGH")
	MerchantFrameCloseButton:SetPoint("RIGHT", MerchantFrame.MaxUIHeader, "RIGHT", 4, 0)

	-- relocate
	MerchantFrame:ClearAllPoints()
	MerchantFrame:SetPoint("TOPLEFT", UIParent, "TOP", 300, -100)
	MerchantFrame.ClearAllPoints = function() end
	MerchantFrame.SetPoint = function() end

end
AS:RegisterSkin('Blizzard_Merchant', AS.Blizzard_Merchant)