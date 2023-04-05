------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 04-01-2023
------------------------------------------------------------------------------------------

-- setting up LOOT

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Inventory = T["Inventory"]
local Loot = Inventory.Loot
local baseLootOpened = Loot.LOOT_OPENED
local baseLootEnable = Loot.Enable

------------------------------------------------------------------------------------------
-- LOOT
------------------------------------------------------------------------------------------
function Loot:LOOT_OPENED(_, autoloot)
	baseLootOpened(self, _, autoloot)

	if C["General"]["Themes"]["Value"] == "MaxUI" then 
		local Items = GetNumLootItems()
		if (Items > 0) then
			for i = 1, Items do
		
				local LootFrameSlots = TukuiLootFrame.LootSlots[i] or Loot:CreateSlots(i)

				LootFrameSlots.count:SetFontTemplate(C.Medias.MaxUIFont, C["Loot"]["FontSize"]/10)
				
				LootFrameSlots.name:SetFontObject(T.GetFont(C["Loot"]["Font"]))
				LootFrameSlots.name:SetScale(C["Loot"]["FontSize"]/10)

				if C["Skins"]["InventoryFilter"] then
					LootFrameSlots:CreateMaxUIFilter()
					LootFrameSlots.iconFrame:CreateMaxUIFilter()
				end	
			end
		end
	end	
end

function Loot:Enable()
	baseLootEnable(self)
	
	if C["General"]["Themes"]["Value"] == "MaxUI" then 
		if  C.Loot.Enable then

			TukuiLootFrame:CreateMaxUIHeader("Loot")
			TukuiLootFrame.MaxUIHeader:ClearAllPoints()
			TukuiLootFrame.MaxUIHeader:SetPoint("BOTTOMLEFT", TukuiLootFrame, "TOPLEFT", -24, 16)
			TukuiLootFrame.MaxUIHeader:SetPoint("BOTTOMRIGHT", TukuiLootFrame, "TOPRIGHT", -8, 16)

			TukuiLootFrame.Title:SetFontObject(T.GetFont(C["Loot"]["Font"]))
			TukuiLootFrame.Title:SetScale(C["Loot"]["FontSize"]/10)

			TukuiLootFrame.Overlay.Backdrop:SetOutside(TukuiLootFrame.Overlay)
			TukuiLootFrame.Overlay.Shadow:Kill()
			TukuiLootFrame.Overlay.Backdrop:CreateShadow()

			if C["Skins"]["InventoryFilter"] then
				TukuiLootFrame.Overlay.Backdrop:CreateMaxUIFilter()
			end	
		end
	end	
end