------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up MaxUISkins

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
if not IsAddOnLoaded('AddonSkins') then return end

local AS, ASL = unpack(AddOnSkins)
if not AS:CheckAddOn('Tukui') then return end
local T, C
local _G = _G

------------------------------------------------------------------------------------------
-- CHARACTER
------------------------------------------------------------------------------------------
local AS_Blizzard_Character = AS.Blizzard_Character
function AS:Blizzard_Character()
	AS_Blizzard_Character(self)

	if not Tukui then return end
	if not T then T, C = Tukui:unpack() end
	if not C["Skins"]["MaxUIAddOnSkins"] then return end

	-- adjustments
	CharacterFrame:CreateShadow()
	--CharacterFrameInset:StripTextures()

	--CharacterStatsPane.ItemLevelFrame.Value:SetFont(C.Medias.MaxUIFont, 16, 1, 1)
	CharacterLevelText:SetFont(C.Medias.MaxUIFont, 10, 1, 1)
	CharacterLevelText:SetWidth(300)
	
	-- CharacterStats
	--AS:SkinFrame(CharacterStatsPane.EnhancementsCategory)
	--CharacterStatsPane.EnhancementsCategory:SetHeight(22)
	
	--AS:SkinFrame(CharacterStatsPane.AttributesCategory)
	--CharacterStatsPane.AttributesCategory:SetHeight(22)
	
	--AS:SkinFrame(CharacterStatsPane.ItemLevelCategory)
	--CharacterStatsPane.ItemLevelCategory:SetHeight(22)

	--for _, Button in pairs(_G.PaperDollEquipmentManagerPane.buttons) do
	--	Button:SetWidth(175)
	--end

	-- Titles
	--hooksecurefunc('PaperDollTitlesPane_Update', function()
	--	for _, Title in pairs(_G.PaperDollTitlesPane.buttons) do
	--		Title.text:SetFont(C.Medias.MaxUIFont, 9)
	--	end
	--end)

	-- reputation
	ReputationDetailFactionDescription:SetFont(C.Medias.MaxUIFont, 10)

	-- header
	CharacterFrame:CreateMaxUIHeader("Character")
	CharacterFrame.MaxUIHeader:ClearAllPoints()
	CharacterFrame.MaxUIHeader:SetPoint("BOTTOMLEFT", CharacterFrame, "TOPLEFT", 10, -10)
	CharacterFrame.MaxUIHeader:SetPoint("BOTTOMRIGHT", CharacterFrame, "TOPRIGHT", -31, -10)

	-- close button
	CharacterFrameCloseButton:ClearAllPoints()
	CharacterFrameCloseButton:SetPoint("RIGHT", CharacterFrame.MaxUIHeader, "RIGHT", 4, 0)
	
	-- relocate
	CharacterFrame:ClearAllPoints()
	CharacterFrame:SetPoint("TOP", UIParent, "TOP", 0, -100)
	CharacterFrame.ClearAllPoints = function() end
	CharacterFrame.SetPoint = function() end

	-- Outfitter
	if IsAddOnLoaded('Outfitter') then 
		OutfitterFrame:CreateMaxUIHeader("Outfitter")
		OutfitterFrame:ClearAllPoints()
		OutfitterFrame:SetPoint("TOPLEFT", CharacterFrame, "TOPRIGHT", -24, -12)
		OutfitterFrame:CreateShadow()
		OutfitterFrame:SetHeight(CharacterFrame:GetHeight()-88)
		
		OutfitterNewButton:SetWidth(OutfitterFrame:GetWidth()-6)
		OutfitterNewButton:ClearAllPoints()
		OutfitterNewButton:SetPoint("BOTTOM", OutfitterFrame, "BOTTOM", 0, 3)
	end	
end
AS:RegisterSkin('Blizzard_Character', AS.Blizzard_Character)

------------------------------------------------------------------------------------------
-- DRESSUP
------------------------------------------------------------------------------------------
local AS_Blizzard_DressUpFrame = AS.Blizzard_DressUpFrame
function AS:Blizzard_DressUpFrame()
	AS_Blizzard_DressUpFrame(self)

	if not Tukui then return end
	if not T then
		T, C = Tukui:unpack()
	end
	
	if not C["Skins"]["MaxUIAddOnSkins"] then return end

	-- adjustments
	DressUpFrame:CreateShadow()
	DressUpFrame.Backdrop:SetAlpha(0.75)
	
	DressUpFrameTitleText:Kill()
	--DressUpFrameInset:StripTextures()

	--DressUpFrameOutfitDropDown:SetWidth(200)
	--DressUpFrameOutfitDropDown:SetHeight(28)
	--DressUpFrameOutfitDropDown:ClearAllPoints()
	--DressUpFrameOutfitDropDown:SetPoint("TOPLEFT", DressUpFrame, "TOPLEFT", -10, -8)
	
	--DressUpFrameOutfitDropDownButton:ClearAllPoints()
	--DressUpFrameOutfitDropDownButton:SetHeight(20)
	--DressUpFrameOutfitDropDownButton:SetWidth(20)
	--DressUpFrameOutfitDropDownButton:SetPoint("RIGHT", DressUpFrame.OutfitDropDown, "RIGHT", -1, 0)

	
	--DressUpFrame.OutfitDropDown.SaveButton:ClearAllPoints()
	--DressUpFrame.OutfitDropDown.SaveButton:SetPoint("TOPRIGHT", DressUpFrame, "TOPRIGHT", -8, -8)

	--DressUpFrame.MaximizeMinimizeFrame:ClearAllPoints()
	--DressUpFrame.MaximizeMinimizeFrame:SetPoint("RIGHT",DressUpFrame.OutfitDropDown.SaveButton, "LEFT", -3, 0)
	--DressUpFrame.MaximizeMinimizeFrame:StripTextures()
	--DressUpFrame.MaximizeMinimizeFrame:SetHeight(40)
	--DressUpFrame.MaximizeMinimizeFrame:SetWidth(20)

	--WardrobeOutfitFrame.Border:Kill()
	--WardrobeOutfitFrame:CreateBackdrop("Transparent")

	-- header
	DressUpFrame:CreateMaxUIHeader("Dressing Room")

	-- close button
	DressUpFrameCloseButton:ClearAllPoints()
	DressUpFrameCloseButton:SetPoint("RIGHT", DressUpFrame.MaxUIHeader, "RIGHT", 4, 0)

	-- relocate
	DressUpFrame:ClearAllPoints()
	DressUpFrame:SetPoint("TOP", UIParent, "TOP", 0, -100)
	DressUpFrame.ClearAllPoints = function() end
	DressUpFrame.SetPoint = function() end
end
AS:RegisterSkin('Blizzard_DressUpFrame', AS.Blizzard_DressUpFrame)

------------------------------------------------------------------------------------------
-- INSPECT
------------------------------------------------------------------------------------------
local AS_Blizzard_Inspect = AS.Blizzard_Inspect
function AS:Blizzard_Inspect(event, addon)
	AS_Blizzard_Inspect(self, event, addon)

	if not Tukui then return end
	if not T then
		T, C = Tukui:unpack()
	end
	
	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	if addon ~= "Blizzard_InspectUI" then return end

	-- adjustments
	_G.InspectFrameInset:Hide()
	_G.InspectPaperDollFrame.ViewButton:ClearAllPoints()
	_G.InspectPaperDollFrame.ViewButton:SetPoint("TOP", _G.InspectModelFrame, "TOP", 0, -4)
	_G.InspectPaperDollFrame.ViewButton:SetFrameLevel(_G.InspectModelFrame:GetFrameLevel() +1)
	_G.InspectModelFrame.Backdrop:SetOutside()	
	_G.InspectModelFrame.Backdrop:CreateShadow()	
	
	-- header
	_G.InspectFrame:CreateMaxUIHeader("Inspect")
	_G.InspectFrame:CreateShadow()

	-- close button
	_G.InspectFrameCloseButton:ClearAllPoints()
	_G.InspectFrameCloseButton:SetPoint("RIGHT", _G.InspectFrame.MaxUIHeader, "RIGHT", 4, 0)

	-- relocate
	_G.InspectFrame:ClearAllPoints()
	_G.InspectFrame:SetPoint("TOP", UIParent, "TOP", 0, -100)
	_G.InspectFrame.ClearAllPoints = function() end
	_G.InspectFrame.SetPoint = function() end

	AS:UnregisterSkinEvent(addon, event)
end
AS:RegisterSkin("Blizzard_Inspect", AS.Blizzard_Inspect, 'ADDON_LOADED')