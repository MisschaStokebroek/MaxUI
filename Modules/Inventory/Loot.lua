------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up LOOT

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Inventory = T["Inventory"]
local Loot = Inventory.Loot

------------------------------------------------------------------------------------------
-- GROUP LOOT ROLLS
------------------------------------------------------------------------------------------
local baseLootOpened = Loot.LOOT_OPENED
function Loot:LOOT_OPENED(_, autoloot)
	baseLootOpened(self, _, autoloot)

	local Items = GetNumLootItems()
	if (Items > 0) then
		for i = 1, Items do
	
			local LootFrameSlots = TukuiLootFrame.LootSlots[i] or Loot:CreateSlots(i)

			LootFrameSlots.count:SetFontTemplate(C.Medias.MaxUIFont, C["Loot"]["FontSize"]/10)
			
			LootFrameSlots.name:SetFontObject(T.GetFont(C["Loot"]["Font"]))
			LootFrameSlots.name:SetScale(C["Loot"]["FontSize"]/10)
		end
	end
end

local baseLootEnable = Loot.Enable
function Loot:Enable()
	baseLootEnable(self)
	
	if  C.Loot.Enable then
		TukuiLootFrame.Title:SetFontObject(T.GetFont(C["Loot"]["Font"]))
		TukuiLootFrame.Title:SetScale(C["Loot"]["FontSize"]/10)
	end	
end