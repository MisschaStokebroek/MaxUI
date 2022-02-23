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
-- COLLECTIONS
------------------------------------------------------------------------------------------
local AS_Blizzard_Collections = AS.Blizzard_Collections
function AS:Blizzard_Collections(event, addon)
	AS_Blizzard_Collections(self, event, addon)
	
	if not Tukui then return end
	if not T then
		T, C = Tukui:unpack()
	end

	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	
	if addon ~= 'Blizzard_Collections' then return end

	-- adjustments
	CollectionsJournalTitleText:Kill()
	
	-- MOUNT JOURNAL
	MountJournal.MountDisplay.Backdrop:SetAlpha(0)
	MountJournal.MountDisplay.InfoButton:ClearAllPoints()
	MountJournal.MountDisplay.InfoButton:SetPoint("TOPLEFT", MountJournal.MountDisplay, "TOPLEFT", -4, 20)

	MountJournal.BottomLeftInset:StripTextures()
	MountJournal.BottomLeftInset.NineSlice:StripTextures()
	MountJournal.BottomLeftInset:CreateBackdrop("Transparent")
	
	MountJournal.MountCount:ClearAllPoints()
	MountJournal.MountCount:SetPoint("TOPLEFT", MountJournal, "TOPLEFT", 10, -24)
	MountJournal.MountCount:SetWidth(274)
	MountJournal.MountCount:SetHeight(20)
	
	MountJournalSearchBox:ClearAllPoints()
	MountJournalSearchBox:SetPoint("TOPLEFT", MountJournal.MountCount, "BOTTOMLEFT", 1, -9)
	MountJournalSearchBox:SetWidth(MountJournalSearchBox:GetWidth()+12)
	
	MountJournalFilterButton:ClearAllPoints()
	MountJournalFilterButton:SetPoint("TOPRIGHT", MountJournal.MountCount, "BOTTOMRIGHT", -1, -8)
	MountJournalFilterButton:SetWidth(MountJournalFilterButton:GetWidth()+13)
	
	MountJournalListScrollFrame.Backdrop:SetAlpha(0)
	MountJournalListScrollFrameScrollBar:ClearAllPoints()
	MountJournalListScrollFrameScrollBar:SetPoint("TOPLEFT", MountJournalListScrollFrame, "TOPRIGHT", 8, -20)
	MountJournalListScrollFrameScrollBar:SetPoint("BOTTOMLEFT", MountJournalListScrollFrame, "BOTTOMRIGHT", 8, 20)
	MountJournalListScrollFrameScrollBar:SetWidth(12)

	MountJournalListScrollFrameScrollBarScrollDownButton:ClearAllPoints()
	MountJournalListScrollFrameScrollBarScrollUpButton:ClearAllPoints()
	MountJournalListScrollFrameScrollBarScrollDownButton:SetPoint("TOP", MountJournalListScrollFrameScrollBar, "BOTTOM", 0, -4)
	MountJournalListScrollFrameScrollBarScrollUpButton:SetPoint("BOTTOM", MountJournalListScrollFrameScrollBar, "TOP", 0, 4)
	
	MountJournalMountButton:ClearAllPoints()
	MountJournalMountButton:SetPoint("BOTTOMLEFT", MountJournal.BottomLeftInset.Backdrop, "BOTTOMRIGHT", 8, 0)
	MountJournalMountButton:SetFrameLevel(MountJournal.MountDisplay:GetFrameLevel()+1)
	
	AS:SkinCheckBox(MountJournal.MountDisplay.ModelScene.TogglePlayer)
	MountJournal.MountDisplay.ModelScene.TogglePlayer:ClearAllPoints()
	MountJournal.MountDisplay.ModelScene.TogglePlayer:SetPoint("BOTTOMRIGHT", MountJournal.MountDisplay.Backdrop, "BOTTOMRIGHT", 0, -6)	
	
	-- PET JOURNAL
	
	-- TOY BOX
	ToyBox.progressBar.Backdrop:SetOutside()
	ToyBox.progressBar:SetHeight(20)
	ToyBox.progressBar:ClearAllPoints()
	ToyBox.progressBar:SetPoint("TOP", ToyBox, "TOP", 0, -35)
	ToyBox.progressBar.text:ClearAllPoints()
	ToyBox.progressBar.text:SetPoint("CENTER", ToyBox.progressBar, "CENTER", 0, -1)
		
	-- HEIRLOOMS
	HeirloomsJournal.progressBar.Backdrop:SetOutside()
	HeirloomsJournal.progressBar:SetHeight(20)
	HeirloomsJournal.progressBar:ClearAllPoints()
	HeirloomsJournal.progressBar:SetPoint("TOP", HeirloomsJournal, "TOP", 0, -35)
	HeirloomsJournal.progressBar.text:ClearAllPoints()
	HeirloomsJournal.progressBar.text:SetPoint("CENTER", HeirloomsJournal.progressBar, "CENTER", 0, -1)
	
	-- APPEARENCES
	WardrobeCollectionFrame.ItemsCollectionFrame:StripTextures()
	WardrobeCollectionFrameTab1:SetHeight(24)
	WardrobeCollectionFrameTab2:SetHeight(24)
	WardrobeCollectionFrame.progressBar.Backdrop:SetOutside()
	WardrobeCollectionFrame.progressBar:SetHeight(20)
	WardrobeCollectionFrame.progressBar:ClearAllPoints()
	WardrobeCollectionFrame.progressBar:SetPoint("TOP", WardrobeCollectionFrame, "TOP", 0, -35)
	WardrobeCollectionFrame.progressBar.text:ClearAllPoints()
	WardrobeCollectionFrame.progressBar.text:SetPoint("CENTER", WardrobeCollectionFrame.progressBar, "CENTER", 0, -1)
	
	WardrobeCollectionFrameWeaponDropDown:SetWidth(182)

	-- header
	CollectionsJournal:CreateMaxUIHeader("Collections")
	CollectionsJournal:CreateShadow()
	CollectionsJournal.MaxUIHeader:SetFrameLevel(15)
	
	-- close button
	CollectionsJournalCloseButton:ClearAllPoints()
	CollectionsJournalCloseButton:SetFrameLevel(16)
	CollectionsJournalCloseButton:SetFrameStrata("HIGH")
	CollectionsJournalCloseButton:SetPoint("RIGHT", CollectionsJournal.MaxUIHeader, "RIGHT", 4, 0)

	-- relocate
	CollectionsJournal:ClearAllPoints()
	CollectionsJournal:SetPoint("TOP", UIParent, "TOP", 0, -100)
	CollectionsJournal.ClearAllPoints = function() end
	CollectionsJournal.SetPoint = function() end

	-- TRANSMOG
	WardrobeTransmogFrame:StripTextures()
	AS:SkinButton(WardrobeTransmogFrame.ModelScene.ClearAllPendingButton)
	
	WardrobeOutfitDropDown.SaveButton:ClearAllPoints()
	WardrobeOutfitDropDown.SaveButton:SetPoint("BOTTOMRIGHT", WardrobeTransmogFrame, "TOPRIGHT", 0, 4)

	WardrobeOutfitDropDown:ClearAllPoints()
	WardrobeOutfitDropDown:SetHeight(22)
	WardrobeOutfitDropDown:SetWidth(234)
	WardrobeOutfitDropDown:SetPoint("BOTTOMLEFT", WardrobeTransmogFrame, "TOPLEFT", -20, 4)
	
	WardrobeOutfitDropDownButton:SetHeight(18)
	WardrobeOutfitDropDownButton:SetWidth(18)
	
	-- header
	WardrobeFrame:CreateMaxUIHeader("Transmogrify")
	WardrobeFrame:CreateShadow()
	WardrobeFrame.MaxUIHeader:SetFrameLevel(15)
	
	-- close button
	WardrobeFrameCloseButton:ClearAllPoints()
	WardrobeFrameCloseButton:SetFrameLevel(16)
	WardrobeFrameCloseButton:SetFrameStrata("HIGH")
	WardrobeFrameCloseButton:SetPoint("RIGHT", WardrobeFrame.MaxUIHeader, "RIGHT", 4, 0)

	-- relocate
	WardrobeFrame:ClearAllPoints()
	WardrobeFrame:SetPoint("TOP", UIParent, "TOP", 0, -100)
	WardrobeFrame.ClearAllPoints = function() end
	WardrobeFrame.SetPoint = function() end

	AS:UnregisterSkinEvent(addon, event)
end
AS:RegisterSkin("Blizzard_Collections", AS.Blizzard_Collections, 'ADDON_LOADED')