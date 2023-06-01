------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 01-0105-2023
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

	if C["General"]["Themes"]["Value"] == "MaxUI" and C["Skins"]["Loot"] then 
		local Items = GetNumLootItems()
		if (Items > 0) then
			for i = 1, Items do
		
				local LootFrameSlots = TukuiLootFrame.LootSlots[i] or Loot:CreateSlots(i)

				LootFrameSlots.count:SetFontTemplate(C.Medias.MaxUIFont, C["Loot"]["FontSize"]/10)
				
				LootFrameSlots.name:SetFontObject(T.GetFont(C["Loot"]["Font"]))
				LootFrameSlots.name:SetScale(C["Loot"]["FontSize"]/10)

				--if C["Skins"]["Loot"] then
					LootFrameSlots:SkinMaxUIFrame()
					LootFrameSlots.iconFrame:SkinMaxUIFrame()
				--end	
			end
		end
	end	
end

function Loot:Enable()
	baseLootEnable(self)
	
	if C["General"]["Themes"]["Value"] == "MaxUI" then 
		if  C.Loot.Enable and C["Skins"]["Loot"] then

			--if C["Skins"]["MaxUIPositioningBlizzardFrames"] == true then
			--	TukuiLootFrame:ClearAllPoints()
			--	TukuiLootFrame:SetPoint("TOP", UIParent, "TOP", 0, -100)
			--	TukuiLootFrame.ClearAllPoints = function() end
			--	TukuiLootFrame.SetPoint = function() end
			--end

			TukuiLootFrame:CreateMaxUIHeader("Loot")
			TukuiLootFrame.MaxUIHeader:ClearAllPoints()
			TukuiLootFrame.MaxUIHeader:SetPoint("BOTTOMLEFT", TukuiLootFrame, "TOPLEFT", -24, 16)
			TukuiLootFrame.MaxUIHeader:SetPoint("BOTTOMRIGHT", TukuiLootFrame, "TOPRIGHT", -8, 16)

			TukuiLootFrame.Title:SetFontObject(T.GetFont(C["Loot"]["Font"]))
			TukuiLootFrame.Title:SetScale(C["Loot"]["FontSize"]/10)

			TukuiLootFrame.Overlay.Backdrop:SetOutside(TukuiLootFrame.Overlay)
			TukuiLootFrame.Overlay.Shadow:Kill()
			TukuiLootFrame.Overlay.Backdrop:CreateShadow()

			TukuiLootFrame.Overlay:SkinMaxUIFrame()
		end
	end	
end