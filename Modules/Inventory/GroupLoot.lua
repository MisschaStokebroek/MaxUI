------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 01-05-2023
------------------------------------------------------------------------------------------

-- setting up LOOT

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Inventory = T["Inventory"]
local GroupLoot = Inventory.GroupLoot
local baseSkinGroupLoot = GroupLoot.SkinGroupLoot
local baseUpdateGroupLootContainer = GroupLoot.UpdateGroupLootContainer
local NUM_GROUP_LOOT_FRAMES = NUM_GROUP_LOOT_FRAMES or 4

local function SkinLootRollsFrame()
	--LootHistoryFrame:SkinMaxUIBasicFrame(true, nil)


end

function GroupLoot:SkinGroupLoot(Frame)
	baseSkinGroupLoot(self, Frame)
	
	if C["General"]["Themes"]["Value"] == "MaxUI" and C["Skins"]["Loot"] then 
		Frame.OverlayContrainerFrame.Backdrop:SetOutside(Frame.OverlayContrainerFrame)
		Frame.Timer.Backdrop:SetOutside(Frame.Timer)
		Frame.IconFrame.Backdrop:SetOutside(Frame.IconFrame)

		Frame:CreateMaxUIHeader()
		Frame.MaxUIHeader:ClearAllPoints()
		Frame.MaxUIHeader:SetPoint("BOTTOMLEFT", Frame.IconFrame, "TOPLEFT", 0, 3)
		Frame.MaxUIHeader:SetPoint("BOTTOMRIGHT", Frame.OverlayContrainerFrame, "TOPRIGHT", 0, 3)
		Frame.MaxUIHeader:SetHeight(C["Loot"]["GroupLootHeaderHeight"])

		Frame.IconFrame.Icon:SetTexCoord(unpack(T.IconCoord))

		if T.Retail then
			Frame.IconFrame.Border:Hide()
		end
		
		--if C["Skins"]["Loot"] then
			Frame.OverlayContrainerFrame:SkinMaxUIFrame()
			Frame.Timer:SkinMaxUIStatusBar()
			Frame.IconFrame:SkinMaxUIFrame()
		--end

		SkinLootRollsFrame()
	end
end

function GroupLoot:UpdateGroupLootContainer()
	baseUpdateGroupLootContainer(self)
	
	if C["General"]["Themes"]["Value"] == "MaxUI" and C["Skins"]["Loot"] then 
		for i = 1, NUM_GROUP_LOOT_FRAMES do
			local Frame = _G["GroupLootFrame" .. i]
			local Mover = GroupLoot.Mover
			local PreviousFrame = _G["GroupLootFrame" .. i-1]

			Frame:ClearAllPoints()

			if (i == 1) then
				Frame:SetPoint("CENTER", Mover, 24, -32)
			else

				Frame:SetPoint("BOTTOM", PreviousFrame, "BOTTOM", 0, -(52 + C["Loot"]["GroupLootSpacing"]))
			end
		end
	end	
end