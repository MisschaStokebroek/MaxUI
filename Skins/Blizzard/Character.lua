------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-01-2023
------------------------------------------------------------------------------------------

-- setting up MaxUISkinsBlizzard

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local CharacterSkin = CreateFrame("Frame")

local _G = _G
local ipairs, pairs, select, type, unpack = ipairs, pairs, select, type, unpack
local PaperDollBgDesaturate = PaperDollBgDesaturate
local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
local Texture = T.GetTexture("Tukui")
local CharacterIcon = "Interface\\AddOns\\MaxUI\\Medias\\Icons\\Menu\\cChar.tga"
local TitlesIcon = "Interface\\AddOns\\MaxUI\\Medias\\Icons\\Menu\\cGuild.tga"
local EquipmentManagerIcon = "Interface\\AddOns\\MaxUI\\Medias\\Icons\\Menu\\cCallToArms.tga"
local Check = "Interface\\AddOns\\MaxUI\\Medias\\Icons\\Role\\check.tga"

------------------------------------------------------------------------------------------
-- SKIN character
------------------------------------------------------------------------------------------
-- BASIC CHARACTER FRAME
local function SkinCharacterBasicFrame()
	if _G.CharacterFrame.IsSkinned then return end

	--_G.CHARACTERFRAME_EXPANDED_WIDTH = 600

	_G.CharacterFrame:SkinMaxUIBaseFrame(true, true)
	--_G.CharacterFrame:HookScript('OnShow', function() PaperDollBgDesaturate(false) end)
	
	_G.CharacterFramePortrait:ClearAllPoints()
	_G.CharacterFramePortrait:SetPoint("TOPLEFT", _G.CharacterFrame, "TOPLEFT", 8, -8)
	_G.CharacterFramePortrait:SetAlpha(0)

	_G.CharacterFrame.Icon = _G.CharacterFrame:CreateTexture(nil, "ARTWORK")
	_G.CharacterFrame.Icon:SetSize(40, 40)
	_G.CharacterFrame.Icon:SetPoint("TOPLEFT", _G.CharacterFrame, "TOPLEFT", 8, -8)
	_G.CharacterFrame.Icon:SetTexture(CharacterIcon)

	_G.CharacterFrameTitleText:SetScale(1.5)
	_G.CharacterFrameTitleText:ClearAllPoints()
	_G.CharacterFrameTitleText:SetPoint("TOPLEFT", _G.CharacterFramePortrait, "TOPRIGHT", 0, 0)
	_G.CharacterFrameTitleText:SetJustifyH("LEFT")

	_G.CharacterLevelText:SetScale(1.5)
	_G.CharacterLevelText:ClearAllPoints()
	_G.CharacterLevelText:SetPoint("TOPLEFT", _G.CharacterFrameTitleText, "BOTTOMLEFT", 0, 4)
	_G.CharacterLevelText:SetJustifyH("LEFT")

	for i = 1, _G.CharacterFrame.numTabs do
		_G["CharacterFrameTab"..i]:SkinMaxUITab(true)
	end

	_G.CharacterFrame.IsSkinned = true
end

-- LEFT SIDE CHARACTER GEAR
local function SkinCharacterModelFrame()
	_G.CharacterModelScene:StripTextures() -- neded?
	_G.CharacterModelScene:SkinMaxUIFrame(true)
	_G.CharacterModelScene:SetFrameLevel(3)

	_G.CharacterModelScene:ClearAllPoints()
	_G.CharacterModelScene:SetPoint("TOPLEFT", CharacterFrame, "TOPLEFT", 52, -62)
	_G.CharacterModelScene.Backdrop:CreateShadow()
	
	if C["Skins"]["BackdropFilter"] then 
		_G.CharacterModelScene:CreateMaxUIFilter()
	end

	for _, Slot in pairs({_G.PaperDollItemsFrame:GetChildren()}) do
		if Slot:IsObjectType('Button') or Slot:IsObjectType('ItemButton') then
			Slot:StripTextures()
			Slot:SkinMaxUIFrame(true)
			Slot:CreateMaxUIFilter()
			--Slot:StyleButton()
			Slot:SetFrameLevel(_G.CharacterModelScene:GetFrameLevel()+2)

			Slot.icon:SetTexCoord(unpack(T.IconCoord))
			Slot.IconBorder:SetAlpha(0)
			Slot.ignoreTexture:SetTexture([[Interface\PaperDollInfoFrame\UI-GearManager-LeaveItem-Transparent]])

			--hooksecurefunc(Slot, "DisplayAsAzeriteItem", UpdateAzerite)
			--hooksecurefunc(Slot, "DisplayAsAzeriteEmpoweredItem", UpdateAzerite)

			--if Slot.popoutButton:GetPoint() == 'TOP' then
			--	Slot.popoutButton:SetPoint("TOP", Slot, "BOTTOM", 0, 2)
			--else
			--	Slot.popoutButton:SetPoint("LEFT", Slot, "RIGHT", -2, 0)
			--end
		end
	end

	hooksecurefunc('PaperDollItemSlotButton_Update', function(slot)
		local highlight = slot:GetHighlightTexture()
		highlight:SetTexture(T.GetTexture("Blank"))
		highlight:SetVertexColor(1, 1, 1, .25)
		highlight:SetInside()
	end)

	--if IsAddOnLoaded('Pawn') then
	--	PawnUI_InventoryPawnButton:SkinMaxUIButton(true)
	--end	
end

-- RIGHT SIDE CHARACTER STATS
local function SkinCharacterStatsFrame()
	_G.CharacterFrameInsetRight:StripTextures()
	_G.CharacterFrameInsetRight.Bg:Hide()
	_G.CharacterFrameInsetRight.NineSlice:Hide()
	
	PaperDollSidebarTabs:StripTextures()
	for i = 1, #PAPERDOLL_SIDEBARS do
		local tab = _G["PaperDollSidebarTab"..i]
		tab:SkinMaxUITab(true)
		tab.Icon:Kill()

		tab.CustomIcon = tab:CreateTexture(nil, "ARTWORK")
		tab.CustomIcon:SetInside(tab, 4, 4, -4, -4)
		if i == 1 then
			tab.CustomIcon:SetTexture(CharacterIcon)
		elseif i == 2 then
			tab.CustomIcon:SetTexture(TitlesIcon)
		elseif i ==3 then
			tab.CustomIcon:SetTexture(EquipmentManagerIcon)
		else
			tab.CustomIcon:SetTexture(CharacterIcon)
		end
	end
	
	--_G.CharacterStatsPane:SkinMaxUIFrame(true)
	--_G.CharacterStatsPane:SetFrameLevel(3)
	_G.CharacterStatsPane.EnhancementsCategory:StripTextures()
	_G.CharacterStatsPane.EnhancementsCategory:SkinMaxUIFrame(true)
	_G.CharacterStatsPane.EnhancementsCategory.Backdrop:SetPoint("TOPLEFT", 0, -8)
	_G.CharacterStatsPane.EnhancementsCategory.Backdrop:SetPoint("BOTTOMRIGHT", 0, 8)

	_G.CharacterStatsPane.ItemLevelCategory:StripTextures()
	_G.CharacterStatsPane.ItemLevelCategory:SkinMaxUIFrame(true)
	_G.CharacterStatsPane.ItemLevelCategory.Backdrop:SetPoint("TOPLEFT", 0, -8)
	_G.CharacterStatsPane.ItemLevelCategory.Backdrop:SetPoint("BOTTOMRIGHT", 0, 8)

	_G.CharacterStatsPane.AttributesCategory:StripTextures()
	_G.CharacterStatsPane.AttributesCategory:SkinMaxUIFrame(true)
	_G.CharacterStatsPane.AttributesCategory.Backdrop:SetPoint("TOPLEFT", 0, -8)
	_G.CharacterStatsPane.AttributesCategory.Backdrop:SetPoint("BOTTOMRIGHT", 0, 8)

	--_G.CharacterStatsPane.EnhancementsCategory:CreateMaxUIBottomEdge()
	--_G.CharacterStatsPane.ItemLevelCategory:CreateMaxUIBottomEdge()
	--_G.CharacterStatsPane.AttributesCategory:CreateMaxUIBottomEdge()

	--_G.CharacterStatsPane.EnhancementsCategory.MaxUIBottomEdge:ClearAllPoints()
	--_G.CharacterStatsPane.ItemLevelCategory.MaxUIBottomEdge:ClearAllPoints()
	--_G.CharacterStatsPane.AttributesCategory.MaxUIBottomEdge:ClearAllPoints()

	--_G.CharacterStatsPane.EnhancementsCategory.MaxUIBottomEdge:SetPoint("TOP", _G.CharacterStatsPane.EnhancementsCategory, "BOTTOM", 0, 8)
	--_G.CharacterStatsPane.ItemLevelCategory.MaxUIBottomEdge:SetPoint("TOP", _G.CharacterStatsPane.ItemLevelCategory, "BOTTOM", 0, 8)
	--_G.CharacterStatsPane.AttributesCategory.MaxUIBottomEdge:SetPoint("TOP", _G.CharacterStatsPane.AttributesCategory, "BOTTOM", 0, 8)

	_G.CharacterStatsPane.ItemLevelFrame.Background:Hide()
	_G.CharacterStatsPane.ItemLevelFrame.Value:SetScale(1.5)

	hooksecurefunc("PaperDollFrame_UpdateStats", function()
		for _, Table in ipairs({_G.CharacterStatsPane.statsFramePool:EnumerateActive()}) do
			if type(Table) == 'table' then
				for statFrame in pairs(Table) do
					statFrame.Background:SetTexture(Texture)
					statFrame.Background:SetVertexColor(unpack(ClassColor))
					statFrame.Background:SetInside()
				end
			end
		end
	end)

	-- TITLES
	--_G.PaperDollFrame.TitleManagerPane:SkinMaxUIFrame(true)
	--_G.PaperDollFrame.TitleManagerPane:SetFrameLevel(3)
	_G.PaperDollFrame.TitleManagerPane.ScrollBar:SkinMaxUIScrollBarNew(true)
	_G.PaperDollFrame.TitleManagerPane.ScrollBar:SetFrameLevel(3)

	hooksecurefunc(_G.PaperDollFrame.TitleManagerPane.ScrollBox, 'Update', function(frame)
		for _, child in next, { frame.ScrollTarget:GetChildren() } do
			if not child.isSkinned then
				
				--child.BgTop:SetTexture('')
				--child.BgMiddle:SetTexture('')
				--child.BgBottom:SetTexture('')
				--child.Stripe:Kill()				
				child:DisableDrawLayer('BACKGROUND')
				
				child:SkinMaxUITab(true)

				child.SelectedBar:SetColorTexture(unpack(ClassColor))
				child.SelectedBar:SetAlpha(.5)
				child.SelectedBar:SetDrawLayer('BORDER')
				child.SelectedBar:SetInside(child.Backdrop)

				child.Check:SetTexture(Check)

				child.isSkinned = true
			end
		end
	end)

	-- EQUIPMENT MANAGER
	_G.PaperDollFrameEquipSet:SkinMaxUIButton(true)
	_G.PaperDollFrameSaveSet:SkinMaxUIButton(true)

	_G.PaperDollFrameEquipSet.Backdrop:SetPoint("TOPLEFT", 2, 0)
	_G.PaperDollFrameEquipSet.Backdrop:SetPoint("BOTTOMRIGHT", -2, 0)
	_G.PaperDollFrameSaveSet.Backdrop:SetPoint("TOPLEFT", 2, 0)
	_G.PaperDollFrameSaveSet.Backdrop:SetPoint("BOTTOMRIGHT", -2, 0)

	_G.PaperDollFrame.EquipmentManagerPane.ScrollBar:SkinMaxUIScrollBarNew(true)

	hooksecurefunc(_G.PaperDollFrame.EquipmentManagerPane.ScrollBox, 'Update', function(frame)
		for _, child in next, { frame.ScrollTarget:GetChildren() } do
			if child.icon and not child.isSkinned then
			
				child.BgTop:SetTexture('')
				child.BgMiddle:SetTexture('')
				child.BgBottom:SetTexture('')
				child.Stripe:Kill()
				
				child:SkinMaxUITab()

				child.icon:SetTexCoord(unpack(T.IconCoord))

				child.HighlightBar:SetColorTexture(1, 1, 1, .25)
				child.HighlightBar:SetDrawLayer('BACKGROUND')
				child.HighlightBar:SetInside(child.Backdrop)
				
				child.SelectedBar:SetColorTexture(unpack(ClassColor))
				child.SelectedBar:SetAlpha(.5)
				child.SelectedBar:SetDrawLayer('BACKGROUND')
				child.SelectedBar:SetInside(child.Backdrop)

				child.Check:SetTexture(Check)
				
				child.isSkinned = true
			end
		end
	end)

	_G.GearManagerPopupFrame:HookScript('OnShow', function(frame)
		if frame.isSkinned then return end
		
		frame:SkinMaxUIBaseFrame(true)
		frame.IconSelector.ScrollBar:SkinMaxUIScrollBarNew(true)
		frame.BorderBox.CancelButton:SkinMaxUIButton(true)
		frame.BorderBox.OkayButton:SkinMaxUIButton(true)
		
		frame.BorderBox.IconSelectorEditBox.IconSelectorPopupNameLeft:Hide()
		frame.BorderBox.IconSelectorEditBox.IconSelectorPopupNameMiddle:Hide()
		frame.BorderBox.IconSelectorEditBox.IconSelectorPopupNameRight:Hide()
		frame.BorderBox.IconSelectorEditBox:SkinMaxUIEditBox()

		--frame.BorderBox.SelectedIconArea.SelectedIconButton:SkinMaxUIIcon()
		frame.BorderBox.SelectedIconArea.SelectedIconButton.Icon:SetTexCoord(unpack(T.IconCoord))
		--frame.BorderBox.SelectedIconArea.SelectedIconButton.IconBorder:SetAlpha(0)

		--frame.BorderBox.SelectedIconArea.SelectedIconButton.Highlight:SetTexCoord(T.IconCoord)


		frame.isSkinned = true
	end)
end

local function UpdateFactionSkins(frame)
	for _, child in next, { frame.ScrollTarget:GetChildren() } do
		local container = child.Container
		if container and not container.IsSkinned then
			container.IsSkinned = true

			container:StripTextures()

			if container.ExpandOrCollapseButton then
				--container.ExpandOrCollapseButton:SkinMaxUIArrowButton(Down)
			end

			if container.ReputationBar then
				container.ReputationBar:SkinMaxUIStatusBar(true)

				if not container.ReputationBar.backdrop then
					--container.ReputationBar:CreateBackdrop()
					--E:RegisterStatusBar(container.ReputationBar)
				end
			end
		end
	end
end

-- CLOSEBUTTON SKIN REVERTS...
-- OPEN/CLOSE BUTTONS...

local function SkinReputationFrame()
	_G.ReputationFrame.ScrollBar:SkinMaxUIScrollBarNew(true)

	_G.ReputationDetailFrame:StripTextures()
	_G.ReputationDetailFrame:SkinMaxUIFrame(true)
	
	_G.ReputationDetailCloseButton:SkinMaxUICloseButton(true)

	_G.ReputationDetailAtWarCheckBox:SkinMaxUICheckBox(true)
	_G.ReputationDetailMainScreenCheckBox:SkinMaxUICheckBox(true)
	_G.ReputationDetailInactiveCheckBox:SkinMaxUICheckBox(true)
	
	_G.ReputationDetailAtWarCheckBox:ClearAllPoints()
	_G.ReputationDetailMainScreenCheckBox:ClearAllPoints()
	_G.ReputationDetailInactiveCheckBox:ClearAllPoints()

	_G.ReputationDetailMainScreenCheckBox:SetPoint("BOTTOMLEFT", _G.ReputationDetailFrame, "BOTTOMLEFT", 4, 4)
	_G.ReputationDetailAtWarCheckBox:SetPoint("BOTTOMLEFT", _G.ReputationDetailMainScreenCheckBox, "TOPLEFT", 0, 4)
	_G.ReputationDetailInactiveCheckBox:SetPoint("BOTTOMLEFT",_G.ReputationDetailAtWarCheckBox, "TOPLEFT", 0, 4)

	_G.ReputationDetailAtWarCheckBoxText:ClearAllPoints()
	_G.ReputationDetailMainScreenCheckBoxText:ClearAllPoints()
	_G.ReputationDetailInactiveCheckBoxText:ClearAllPoints()

	_G.ReputationDetailMainScreenCheckBoxText:SetPoint("LEFT", _G.ReputationDetailMainScreenCheckBox, "RIGHT", 4, 0)
	_G.ReputationDetailAtWarCheckBoxText:SetPoint("LEFT", _G.ReputationDetailAtWarCheckBox, "RIGHT", 4, 0)
	_G.ReputationDetailInactiveCheckBoxText:SetPoint("LEFT", _G.ReputationDetailInactiveCheckBox, "RIGHT", 4, 0)

	_G.ReputationDetailViewRenownButton:SkinMaxUIButton(true)
	_G.ReputationDetailViewRenownButton:ClearAllPoints()
	_G.ReputationDetailViewRenownButton:SetPoint("TOPLEFT", _G.ReputationDetailFrame, "BOTTOMLEFT", 0, -3)
	_G.ReputationDetailViewRenownButton:SetPoint("TOPRIGHT", _G.ReputationDetailFrame, "BOTTOMRIGHT", 0, -3)
	_G.ReputationDetailViewRenownButton:SetHeight(20)

	hooksecurefunc(_G.ReputationFrame.ScrollBox, 'Update', UpdateFactionSkins)
end

local function SkinCurrencyFrame()
	_G.TokenFrame.ScrollBar:SkinMaxUIScrollBarNew(true)
	
	_G.TokenFramePopup:StripTextures()
	_G.TokenFramePopup:SkinMaxUIFrame(true)
	
	if _G.TokenFramePopup.CloseButton then  -- Probably Blizzard Typo
		_G.TokenFramePopup.CloseButton:SkinMaxuICloseButton(true)
	end
	
	_G.TokenFramePopup:SetPoint('TOPLEFT', _G.TokenFrame, 'TOPRIGHT', 3, -28)
	
	_G.TokenFramePopup.InactiveCheckBox:SkinMaxUICheckBox(true)
	_G.TokenFramePopup.BackpackCheckBox:SkinMaxUICheckBox(true)

	_G.TokenFramePopup.InactiveCheckBox:ClearAllPoints()
	_G.TokenFramePopup.BackpackCheckBox:ClearAllPoints()

	_G.TokenFramePopup.BackpackCheckBox:SetPoint("BOTTOMLEFT", _G.TokenFramePopup, "BOTTOMLEFT", 20, 20)
	_G.TokenFramePopup.InactiveCheckBox:SetPoint("BOTTOMLEFT", _G.TokenFramePopup.BackpackCheckBox, "TOPLEFT", 0, 10)

	hooksecurefunc(_G.TokenFrame.ScrollBox, 'Update', function(frame)
		for _, child in next, { frame.ScrollTarget:GetChildren() } do
			if child.Highlight and not child.IsSkinned then
				child.CategoryLeft:SetAlpha(0)
				child.CategoryRight:SetAlpha(0)
				child.CategoryMiddle:SetAlpha(0)

				child.Highlight:SetInside()
				child.Highlight.SetPoint = Noop
				child.Highlight:SetColorTexture(1, 1, 1, .25)
				child.Highlight.SetTexture = Noop

				child.Icon:SetTexCoord(unpack(T.IconCoord))
				--child.Icon:SetInside()

				if child.ExpandIcon then
					--child.ExpandIcon:CreateBackdrop('Transparent')
					--child.ExpandIcon.Backdrop:SetInside(3, 3)
				end

				child.IsSkinned = true
			end

			if child.isHeader then
				--child.ExpandIcon.Backdrop:Show()
			else
				--child.ExpandIcon.Backdrop:Hide()
			end
		end
	end)
end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function CharacterSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsAddons then return end

	if C["Skins"]["Character"] then
		if not IsAddOnLoaded("CharacterFrame") then
			LoadAddOn("CharacterFrame")
		end		
		SkinCharacterBasicFrame()
		SkinCharacterModelFrame()
		SkinCharacterStatsFrame()
		SkinReputationFrame()
		SkinCurrencyFrame()
	end
	self:UnregisterAllEvents()
end

CharacterSkin:RegisterEvent("PLAYER_LOGIN")
CharacterSkin:SetScript("OnEvent", CharacterSkin.OnEvent)