------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 02-10-2022
------------------------------------------------------------------------------------------

-- setting up INVENTORY.

-- to do: actual bags filter

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Bags = T["Inventory"]["Bags"]

-- functions
local baseBagsSkinBagButton = Bags.SkinBagButton
local baseCreateContainer = Bags.CreateContainer
local baseCreateReagentContainer = Bags.CreateReagentContainer

-- settings
local BackdropR, BackdropG, BackdropB = unpack(C["General"]["BackdropColor"])
local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}

------------------------------------------------------------------------------------------
-- SKINNING
------------------------------------------------------------------------------------------
function Bags:SkinBagButton()
	baseBagsSkinBagButton(self)
	if C["Skins"]["InventoryFilter"] == true then 
		self:CreateMaxUIFilterInside()
	end

	BankFrameTitleText:Kill()
end

------------------------------------------------------------------------------------------
-- CONTAINERS
------------------------------------------------------------------------------------------
function Bags:CreateContainer(storagetype, ...)
	baseCreateContainer(self, storagetype, ...)
	
	if not (C.General.Themes.Value == "MaxUI") then return end
	
	local Container = self[storagetype]
	local BackdropAlpha = C["Bags"]["BagsAlpha"]
	
	-- cosmetic
	Container:SetFrameLevel(20)
	if C["Skins"]["InventoryBGFilter"] == true then 
		Container:CreateMaxUIFilter()
	end
	Container.Backdrop:SetBackdropColor(BackdropR, BackdropG, BackdropB, BackdropAlpha)

	-- bag (right)
	if (storagetype == "Bag") then
		local Sort = Container.SortButton
		local ToggleBagsContainer = Container.CloseButton
		local ToggleBags = Container.ToggleBags
		local BagsContainer = Container.BagsContainer
		local BanksContainer = Container.BagsContainer
		local SearchBox = Container.SearchBox
		
		Container:ClearAllPoints()
		Container:SetPoint("RIGHT", UIParent, "RIGHT", -6, 0)
		Container:CreateMaxUIHeader("Bags")
		
		if C["Skins"]["InventoryFilter"] == true then 
			SearchBox:CreateMaxUIFilter()	
		end

		SearchBox.Title:Kill()		
		SearchBoxTitle = SearchBox:CreateFontString(nil, "OVERLAY")
		SearchBoxTitle:SetAllPoints()
		SearchBoxTitle:SetFontObject(T.GetFont(C["Bags"]["Font"]))
		SearchBoxTitle:SetScale(C["Bags"]["FontSize"]/10)
		SearchBoxTitle:SetJustifyH("CENTER")
		SearchBoxTitle:SetText("Type here to search an item")
		
		BagsContainer:ClearAllPoints()
		BagsContainer:SetPoint("BOTTOMRIGHT", Container.MaxUIHeader, "TOPRIGHT", 0, 3)

		Sort:HookScript("OnEnter", function(self)
			Sort.Texture:SetVertexColor(unpack(ClassColor))
		end)

		Sort:HookScript("OnLeave", function(self)
			Sort.Texture:SetVertexColor(1,1,1)
		end)

		ToggleBags:HookScript("OnEnter", function(self)
			ToggleBags.Texture:SetVertexColor(unpack(ClassColor))
		end)

		ToggleBags:HookScript("OnLeave", function(self)
			ToggleBags.Texture:SetVertexColor(1,1,1)
		end)

		ToggleBagsContainer:SkinCloseButton()
		ToggleBagsContainer:ClearAllPoints()
		ToggleBagsContainer:SetPoint("RIGHT", Container.MaxUIHeader, "RIGHT", -4, 0)
		
		ToggleBags:ClearAllPoints()
		ToggleBags:SetPoint("TOPRIGHT", Container, "TOPRIGHT", -6, -6)

	elseif (storagetype == "BagReagent") then
		Container.Title:Kill()

		Container:ClearAllPoints()
		Container:SetPoint("TOPRIGHT", TukuiBag, "TOPLEFT", -6, 0)

		Container:CreateMaxUIHeader("Reagents")

	else	
	-- bank (left)
		local BankBagsContainer = Container.BagsContainer
		local Purchase = BankFramePurchaseInfo
		local SortButton = Container.SortButton
		local SwitchReagentButton = Container.ReagentButton
		local Bank = BankFrame
		
		Container:ClearAllPoints()
		Container:SetPoint("LEFT", UIParent, "LEFT", 6, 0)
		
		Container:CreateMaxUIHeader("Bank")
		Container.MaxUIHeader:ClearAllPoints()
		Container.MaxUIHeader:SetPoint("BOTTOMLEFT", Container, "TOPLEFT", 0, 27)
		Container.MaxUIHeader:SetPoint("BOTTOMRIGHT", Container, "TOPRIGHT", 0, 27)
		
		Purchase:ClearAllPoints()
		Purchase:SetPoint("TOP", Container, "BOTTOM", -25, -3)
		Purchase.Backdrop:SetAlpha(0.7)

		BankBagsContainer:SetFrameStrata("HIGH")
		BankBagsContainer:SetFrameLevel(Container.MaxUIHeader:GetFrameLevel() +3)
		BankBagsContainer:SetPoint("BOTTOMLEFT", Container.MaxUIHeader, "TOPLEFT", 0, 3)
		
		SwitchReagentButton.Text:Kill()
		SwitchReagentButtonText = SwitchReagentButton:CreateFontString(nil, "OVERLAY")
		SwitchReagentButtonText:SetFontObject(T.GetFont(C["Bags"]["Font"]))
		SwitchReagentButtonText:SetScale(C["Bags"]["FontSize"]/10)
		SwitchReagentButtonText:SetJustifyH("LEFT")
		SwitchReagentButtonText:SetPoint("CENTER")
		SwitchReagentButtonText:SetText("Switch to: "..REAGENT_BANK)
		
		SortButton.Text:Kill()
		SortButtonText = SortButton:CreateFontString(nil, "OVERLAY")
		SortButtonText:SetFontObject(T.GetFont(C["Bags"]["Font"]))
		SortButtonText:SetScale(C["Bags"]["FontSize"]/10)
		SortButtonText:SetJustifyH("LEFT")
		SortButtonText:SetPoint("CENTER")
		SortButtonText:SetText(BAG_FILTER_CLEANUP)
		
		if C["Skins"]["InventoryFilter"] == true then 
			SwitchReagentButton:CreateMaxUIFilter()
			SortButton:CreateMaxUIFilter()
			BankFramePurchaseButton:CreateMaxUIFilter()
		end
	end
end
------------------------------------------------------------------------------------------
-- CONTAINERS: REAGENTS
------------------------------------------------------------------------------------------
function Bags:CreateReagentContainer()
	baseCreateReagentContainer(self)
	
	if not (C.General.Themes.Value == "MaxUI") then return end

	local BackdropR, BackdropG, BackdropB = unpack(C["General"]["BackdropColor"])
	local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
	local BackdropAlpha = C["Bags"]["BagsAlpha"]
	local Reagent = self.Reagent
	local Deposit = ReagentBankFrame.DespositButton
	local SwitchBankButton = self.Reagent.SwitchBankButton
	local SortButton = self.Reagent.SortButton
	
	Reagent:CreateMaxUIHeader("Reagents")
	Reagent.MaxUIHeader:ClearAllPoints()
	Reagent.MaxUIHeader:SetPoint("BOTTOMLEFT", Reagent, "TOPLEFT", 0, 27)
	Reagent.MaxUIHeader:SetPoint("BOTTOMRIGHT", Reagent, "TOPRIGHT", 0, 27)

	-- cosmetic
	Reagent:ClearAllPoints()
	Reagent:SetPoint("LEFT", UIParent, "LEFT", 15, 10)
	Reagent.Backdrop:SetBackdropColor(BackdropR, BackdropG, BackdropB, BackdropAlpha)

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

	Deposit:ClearAllPoints()
	Deposit:SetHeight(20)
	Deposit:SetPoint("TOP", Reagent, "BOTTOM", 0, -3)

	if C["Skins"]["InventoryBGFilter"] == true then 
		Reagent:CreateMaxUIFilter()
	end

	if C["Skins"]["InventoryFilter"] == true then 
		SwitchBankButton:CreateMaxUIFilter()
		SortButton:CreateMaxUIFilter()
		Deposit:CreateMaxUIFilter()
		for i = 1, 98 do
			local Button = _G["ReagentBankFrameItem"..i]
			Button:CreateMaxUIFilterInside()
		end
	end
end