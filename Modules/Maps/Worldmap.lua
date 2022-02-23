------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-07-2021
------------------------------------------------------------------------------------------

-- setting up MAPS.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Minimap = T.Maps.Minimap
local WorldMap = T.Maps.Worldmap
local baseWorldmapEnable = WorldMap.Enable
local Texture = T.GetTexture(C.General.HeaderTexture)

------------------------------------------------------------------------------------------
-- WORLDMAP ADJUSTMENTS
------------------------------------------------------------------------------------------
function WorldMap:MaxUIWorldMapCoords()
	WorldMap.Coords.PlayerText:SetFontTemplate(C.Medias.Font, 16)
	WorldMap.Coords.CursorText:SetFontTemplate(C.Medias.Font, 16)
	
	WorldMap.Coords.PlayerText:ClearAllPoints()
	WorldMap.Coords.CursorText:ClearAllPoints()
	WorldMap.Coords.PlayerText:SetPoint("BOTTOM", WorldMapFrame.ScrollContainer, "BOTTOM", 0, 10)
	WorldMap.Coords.CursorText:SetPoint("BOTTOM", WorldMap.Coords.PlayerText, "BOTTOM", 0, 20)
end

function WorldMap:CombatState()
	--if C["Location"]["WorldmapCombatState"]["Value"] == "Hide" then
	--	RegisterStateDriver(WorldMapFrame, "visibility", "[combat] hide") -- bugs opening blizzard frames
	--end	
end

baseWorldMapSkinMap = WorldMap.SkinMap
function WorldMap:SkinMap()
	baseWorldMapSkinMap(self)

	local Frame = WorldMapFrame

	WorldMapFrame:CreateMaxUIHeader("World Map")
	Frame.Backdrop:SetAlpha(0.7)
	Frame.Backdrop:ClearAllPoints()
	Frame.Backdrop:SetPoint("LEFT", 1, 0)
	Frame.Backdrop:SetPoint("RIGHT", -2, 0)
	Frame.Backdrop:SetPoint("TOP")
	Frame.Backdrop:SetPoint("BOTTOM")
end

function WorldMap:Enable()
	-- Tukui
	baseWorldmapEnable(self)

	if not C.Misc.WorldMapEnable then return end

	local MoveButton = WorldMap.MoveButton
	
	-- MaxUI
	if C["General"]["Themes"]["Value"] == "MaxUI" then 
		self:MaxUIWorldMapCoords()
		MoveButton:Hide()
	end

	-- Combat State World Map
	self:CombatState() -- needs testing
end