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

------------------------------------------------------------------------------------------
-- WORLDMAP ETC.
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
-- GOSSIP
------------------------------------------------------------------------------------------
local AS_Blizzard_Gossip = AS.Blizzard_Gossip
function AS:Blizzard_Gossip()
	AS_Blizzard_Gossip(self)

	if not Tukui then return end
	if not T then T, C = Tukui:unpack() end
	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	
	-- adjustments
	--GossipFrameInset:Hide()
	GossipFrame:CreateShadow()
	
	GossipGreetingScrollFrame:CreateShadow()
	
	-- header
	GossipFrame:CreateMaxUIHeader("Gossip")
	
	-- close button
	GossipFrameCloseButton:ClearAllPoints()
	GossipFrameCloseButton:SetFrameLevel(16)
	GossipFrameCloseButton:SetFrameStrata("HIGH")
	GossipFrameCloseButton:SetPoint("RIGHT", GossipFrame.MaxUIHeader, "RIGHT", 4, 0)

	-- relocate
	GossipFrame:ClearAllPoints()
	GossipFrame:SetPoint("TOPRIGHT", UIParent, "TOP", -300, -100)
	GossipFrame.ClearAllPoints = function() end
	GossipFrame.SetPoint = function() end
end
AS:RegisterSkin('Blizzard_Gossip', AS.Blizzard_Gossip)

------------------------------------------------------------------------------------------
--QUEST
------------------------------------------------------------------------------------------
local AS_Blizzard_Quest = AS.Blizzard_Quest
function AS:Blizzard_Quest()
	AS_Blizzard_Quest(self)
	
	if not Tukui then return end
	if not T then T, C = Tukui:unpack() end
	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	
	-- adjustments
	--QuestFrameInset:Hide()
	
	-- header
	QuestFrame:CreateMaxUIHeader("Quest")
	
	-- close button
	QuestFrameCloseButton:ClearAllPoints()
	QuestFrameCloseButton:SetFrameLevel(16)
	QuestFrameCloseButton:SetFrameStrata("HIGH")
	QuestFrameCloseButton:SetPoint("RIGHT", QuestFrame.MaxUIHeader, "RIGHT", 4, 0)

	-- relocate
	QuestFrame:ClearAllPoints()
	QuestFrame:SetPoint("TOPRIGHT", UIParent, "TOP", -300, -100)
	QuestFrame.ClearAllPoints = function() end
	QuestFrame.SetPoint = function() end
end
AS:RegisterSkin('Blizzard_Quest', AS.Blizzard_Quest)

------------------------------------------------------------------------------------------
-- WORLDMAP
------------------------------------------------------------------------------------------
local AS_Blizzard_WorldMap = AS.Blizzard_WorldMap
function AS:Blizzard_WorldMap()
	AS_Blizzard_WorldMap()

	WorldMapFrame.Backdrop:SetAlpha(0.7)
	--WorldMapFrame.BorderFrame.CloseButton:SkinCloseButton()
	--WorldMapFrame.BorderFrame.CloseButton:ClearAllPoints()
	--WorldMapFrame.BorderFrame.CloseButton:SetPoint("RIGHT", WorldMapFrame.MaxUIHeader, "RIGHT", 4, 0)
end
AS:RegisterSkin('Blizzard_WorldMap', AS.Blizzard_WorldMap)