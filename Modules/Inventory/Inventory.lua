------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 01-05-2023
------------------------------------------------------------------------------------------

-- setting up INVENTORY.

-- to do: Skin de actual buttons, blizzard icon background still showing, same for Tukui.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Bags = T["Inventory"]["Bags"]

-- functions
local baseBagsSkinBagButton = Bags.SkinBagButton
local baseCreateContainer = Bags.CreateContainer
local baseCreateReagentContainer = Bags.CreateReagentContainer

local ButtonSize = C.Bags.ButtonSize
local ButtonSpacing = C.Bags.Spacing

local BlizzardBags = {
	CharacterBag0Slot,
	CharacterBag1Slot,
	CharacterBag2Slot,
	CharacterBag3Slot,
	CharacterReagentBag0Slot,
}

------------------------------------------------------------------------------------------
-- SKINNING
------------------------------------------------------------------------------------------
function Bags:SkinBagButton()
	baseBagsSkinBagButton(self)

	if not (C.Skins.Inventory) then return end
	self:SkinMaxUIFrame(true)
	if self.Backdrop.Filter then
		self.Backdrop.Filter:SetInside()
	end
end

------------------------------------------------------------------------------------------
-- CONTAINERS
------------------------------------------------------------------------------------------
function Bags:CreateContainer(storagetype, ...)

	baseCreateContainer(self, storagetype, ...)
	
	if not (C.General.Themes.Value == "MaxUI") then return end
	if not (C.Skins.Inventory) then return end
	
	local Container = self[storagetype]
	Container:SkinMaxUIFrame(true)
	Container:SetFrameLevel(20)

	-- bags (right)
	if (storagetype == "Bag") then
		local SortButton = Container.SortButton
		local BagsCloseButton = Container.CloseButton
		local ToggleBagsButton = Container.ToggleBags
		local BagsContainer = Container.BagsContainer
		local SearchBox = Container.SearchBox
		local Keys = Container.Keys
	
		Container:ClearAllPoints()
		Container:SetPoint("RIGHT", UIParent, "RIGHT", -6, 0)
		Container:CreateMaxUIHeader("Bags")
		Container.MaxUIHeader:SetPoint("BOTTOMLEFT", Container, "TOPLEFT", 0, 28)
		Container.MaxUIHeader:SetPoint("BOTTOMRIGHT", Container, "TOPRIGHT", 0, 28)
		
		BagsCloseButton:SkinMaxUICloseButton()
		BagsCloseButton:ClearAllPoints()
		BagsCloseButton:SetPoint("RIGHT", Container.MaxUIHeader, "RIGHT", -4, 0)
		
		ToggleBagsButton:SkinMaxUIButton()
		ToggleBagsButton:SetSize(22, 22)
		ToggleBagsButton:ClearAllPoints()
		ToggleBagsButton:SetPoint("BOTTOMRIGHT", Container, "TOPRIGHT", 0, 3)

		-- bags not anchoring
		BagsContainer:ClearAllPoints()
		BagsContainer:SetPoint("BOTTOMRIGHT", Container.MaxUIHeader, "TOPRIGHT", -0, 3)
		--BagsContainer:CreateBackdrop()
		--BagsContainer:CreateShadow()
		
		SortButton:SkinMaxUIButton()
		SortButton:SetSize(22, 22)
		SortButton:ClearAllPoints()
		SortButton:SetPoint("RIGHT", ToggleBagsButton, "LEFT", -3, 0)

		if T.BCC or T.WotLK then
			Keys:SkinMaxUIButton()
			Keys:SetSize(22, 22)
			Keys:ClearAllPoints()
			Keys:SetPoint("RIGHT", SortButton, "LEFT", -3, 0)
		end

		SearchBox:SkinMaxUIEditBox()
		SearchBox:SetHeight(26)
		SearchBox:ClearAllPoints()
		SearchBox:SetPoint("BOTTOMLEFT", Container, "TOPLEFT", 7, 1)
		if T.BCC or T.WotLK then
			SearchBox:SetPoint("BOTTOMRIGHT", Keys, "BOTTOMLEFT", -10, 0)
		else
			SearchBox:SetPoint("BOTTOMRIGHT", SortButton, "BOTTOMLEFT", -10, 0)
		end
		SearchBox.Title:Kill()		
		SearchBoxTitle = SearchBox:CreateFontString(nil, "OVERLAY")
		SearchBoxTitle:SetAllPoints()
		SearchBoxTitle:SetFontObject(T.GetFont(C["Bags"]["Font"]))
		SearchBoxTitle:SetScale(C["Bags"]["FontSize"]/10)
		SearchBoxTitle:SetJustifyH("CENTER")
		SearchBoxTitle:SetText("Click and type here to search an item")
		SearchBox:SetScript("OnEditFocusLost", function(self) SearchBoxTitle:Show() self.Backdrop:SetBorderColor(.3, .3, .3, 1) end)
		SearchBox:SetScript("OnEditFocusGained", function(self) SearchBoxTitle:Hide() self.Backdrop:SetBorderColor(1, 1, 1, 1) end)


		for _, Button in pairs(BlizzardBags) do
			if Button then
				local Count = _G[Button:GetName().."Count"]
				local Icon = _G[Button:GetName().."IconTexture"]
				local SlotIconTexture = _G[Button:GetName().."IconTexture"]
				local SlotNormalTexture = _G[Button:GetName().."NormalTexture"]

				Button:SkinMaxUIFrame()

				if T.Retail then
					Button.CircleMask:Hide()
					Button.AnimIcon:Hide()
					Button.SlotHighlightTexture:Hide()
				end
				--Button.:Hide()
				if SlotIconTexture then
					SlotIconTexture:SetInside(Button)
				end

				if SlotNormalTexture then
					SlotNormalTexture:SetAlpha(0)
				end

				Button:ClearAllPoints()
				if Button == CharacterBag0Slot then
					Button:SetPoint("TOPRIGHT", TukuiBag, "TOPLEFT", -4, -6)
				elseif Button == CharacterBag1Slot then
					Button:SetPoint("TOP", CharacterBag0Slot, "BOTTOM", 0, -6)
				elseif Button == CharacterBag2Slot then
					Button:SetPoint("TOP", CharacterBag1Slot, "BOTTOM", 0, -6)
				elseif Button == CharacterBag3Slot then
					Button:SetPoint("TOP", CharacterBag2Slot, "BOTTOM", 0, -6)
				end
			end
		end

	-- reagentbag (right)
	elseif (storagetype == "BagReagent") then
		Container.Title:Kill()

		Container:CreateMaxUIHeader("Reagents")
		Container:ClearAllPoints()
		
		if not C.Bags.ReagentInsideBag then
			if C.Bags.PositionReagentBag.Value == "TOPLEFT" then
				Container:SetPoint("TOPRIGHT", TukuiBag, "TOPLEFT", -6, 25)
			elseif C.Bags.PositionReagentBag.Value == "TOP" then
				Container:SetPoint("BOTTOM", TukuiBag, "TOP", 0, 53)
			elseif C.Bags.PositionReagentBag.Value == "BOTTOM" then
				Container:SetPoint("TOP", TukuiBag, "BOTTOM", 0, -28)
			else
				Container:SetPoint("TOPRIGHT", TukuiBag, "TOPLEFT", -6, 25)
			end
		end

		for _, Button in pairs(BlizzardBags) do
			if Button then
				if Button == CharacterReagentBag0Slot then
					Button:ClearAllPoints()
					Button:SetPoint("TOPRIGHT", Container, "TOPLEFT", -4, -6)
				end
			end
		end

	else	
	-- bank (left)
		local BankBagsContainer = Container.BagsContainer
		local Purchase = BankFramePurchaseInfo
		local SortButton = Container.SortButton
		local SwitchReagentButton = Container.ReagentButton
		
		BankFrameTitleText:Kill()
		if T.Retail then 
			BankFramePortrait:Kill()
		end
		
		Container:ClearAllPoints()
		Container:SetPoint("LEFT", UIParent, "LEFT", 6, 0)
		
		Container:CreateMaxUIHeader("Bank")
		Container.MaxUIHeader:ClearAllPoints()
		Container.MaxUIHeader:SetPoint("BOTTOMLEFT", Container, "TOPLEFT", 0, 28)
		Container.MaxUIHeader:SetPoint("BOTTOMRIGHT", Container, "TOPRIGHT", 0, 28)
		
		Purchase:SkinMaxUIButton(true)
		Purchase:ClearAllPoints()
		Purchase:SetPoint("TOP", Container, "BOTTOM", -25, -3)
		Purchase.Backdrop:SetAlpha(0.7)

		BankBagsContainer:SetFrameStrata("HIGH")
		BankBagsContainer:SetFrameLevel(Container.MaxUIHeader:GetFrameLevel() +3)
		BankBagsContainer:SetPoint("BOTTOMLEFT", Container.MaxUIHeader, "TOPLEFT", 0, 3)
		
		SwitchReagentButton:SkinMaxUIButton(true)
		SwitchReagentButton:ClearAllPoints()
		SwitchReagentButton:SetPoint("BOTTOMLEFT", Container, "TOPLEFT", 0, 3)
		SwitchReagentButton:SetHeight(22)
		SwitchReagentButton.Text:Kill()
		SwitchReagentButtonText = SwitchReagentButton:CreateFontString(nil, "OVERLAY")
		SwitchReagentButtonText:SetFontObject(T.GetFont(C["Bags"]["Font"]))
		SwitchReagentButtonText:SetScale(C["Bags"]["FontSize"]/10)
		SwitchReagentButtonText:SetJustifyH("LEFT")
		SwitchReagentButtonText:SetPoint("CENTER")
		SwitchReagentButtonText:SetText("Switch to: "..REAGENT_BANK)
		
		SortButton:SkinMaxUIButton(true)
		SortButton:ClearAllPoints()
		SortButton:SetPoint("LEFT", SwitchReagentButton, "RIGHT", 2, 0)
		SortButton:SetHeight(22)
		SortButton.Text:Kill()
		SortButtonText = SortButton:CreateFontString(nil, "OVERLAY")
		SortButtonText:SetFontObject(T.GetFont(C["Bags"]["Font"]))
		SortButtonText:SetScale(C["Bags"]["FontSize"]/10)
		SortButtonText:SetJustifyH("LEFT")
		SortButtonText:SetPoint("CENTER")
		SortButtonText:SetText(BAG_FILTER_CLEANUP)
	end
end
------------------------------------------------------------------------------------------
-- CONTAINERS: REAGENTS
------------------------------------------------------------------------------------------
function Bags:CreateReagentContainer()
	baseCreateReagentContainer(self)
	
	if not (C.General.Themes.Value == "MaxUI") then return end
	if not (C.Skins.Inventory) then return end
	
	local Reagent = self.Reagent
	local Deposit = ReagentBankFrame.DespositButton
	local SwitchBankButton = self.Reagent.SwitchBankButton
	local SortButton = self.Reagent.SortButton
	
	Reagent:CreateMaxUIHeader("Reagents")
	Reagent.MaxUIHeader:ClearAllPoints()
	Reagent.MaxUIHeader:SetPoint("BOTTOMLEFT", Reagent, "TOPLEFT", 0, 27)
	Reagent.MaxUIHeader:SetPoint("BOTTOMRIGHT", Reagent, "TOPRIGHT", 0, 27)

	Reagent:ClearAllPoints()
	Reagent:SetPoint("LEFT", UIParent, "LEFT", 15, 10)
	Reagent:SkinMaxUIFrame(true)
	Reagent:SetFrameLevel(20)

	SwitchBankButton:SkinMaxUIButton(true)
	SwitchBankButton:ClearAllPoints()
	SwitchBankButton:SetHeight(20)
	SwitchBankButton:SetPoint("BOTTOMLEFT", Reagent, "TOPLEFT", 0, 3)
	SwitchBankButton.Text:Kill()
	SwitchBankButtonText = SwitchBankButton:CreateFontString(nil, "OVERLAY")
	SwitchBankButtonText:SetJustifyH("LEFT")
	SwitchBankButtonText:SetPoint("CENTER")
	SwitchBankButtonText:SetFontObject(T.GetFont(C["Bags"]["Font"]))
	SwitchBankButtonText:SetScale(C["Bags"]["FontSize"]/10)
	SwitchBankButtonText:SetText("Switch to: "..BANK)
	
	SortButton:SkinMaxUIButton(true)
	SortButton:ClearAllPoints()
	SortButton:SetHeight(20)
	SortButton:SetPoint("BOTTOMRIGHT", Reagent, "TOPRIGHT", 0, 3)
	SortButton.Text:Kill()
	SortButtonText = SortButton:CreateFontString(nil, "OVERLAY")
	SortButtonText:SetFontObject(T.GetFont(C["Bags"]["Font"]))
	SortButtonText:SetScale(C["Bags"]["FontSize"]/10)
	SortButtonText:SetJustifyH("LEFT")
	SortButtonText:SetPoint("CENTER")
	SortButtonText:SetText(BAG_FILTER_CLEANUP)
	SortButton:SetScript("OnClick", BankFrame_AutoSortButtonOnClick)

	Deposit:SkinMaxUIButton(true)
	Deposit:ClearAllPoints()
	Deposit:SetHeight(20)
	Deposit:SetPoint("TOP", Reagent, "BOTTOM", 0, -3)
	ReagentBankFrameText:SetTextColor(1, 1, 1)

	for i = 1, 98 do
		local Button = _G["ReagentBankFrameItem"..i]
		Button:SkinMaxUIFrame()
	end
end