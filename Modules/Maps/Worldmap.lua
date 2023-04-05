------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
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
local baseWorldMapSkinMap = WorldMap.SkinMap

------------------------------------------------------------------------------------------
-- WORLDMAP ADJUSTMENTS
------------------------------------------------------------------------------------------
function WorldMap:MaxUIWorldMapCoords()
	WorldMap.Coords.PlayerText:SetFontTemplate(C.Medias.Font, 14, "")
	WorldMap.Coords.CursorText:SetFontTemplate(C.Medias.Font, 14, "")
	
	WorldMap.Coords.PlayerText:ClearAllPoints()
	WorldMap.Coords.CursorText:ClearAllPoints()
	WorldMap.Coords.PlayerText:SetPoint("BOTTOM", WorldMapFrame.ScrollContainer, "BOTTOM", 0, 10)
	WorldMap.Coords.CursorText:SetPoint("BOTTOM", WorldMap.Coords.PlayerText, "BOTTOM", 0, 20)
end

--[[
function WorldMap:SkinMap()
	baseWorldMapSkinMap(self)

	if WorldMapFrame:IsMaximized() then
		local Frame = WorldMapFrame

		Frame:CreateMaxUIHeader("World Map")
		Frame.Backdrop:ClearAllPoints()
		Frame.Backdrop:SetAlpha(0.7)
		Frame.Backdrop:SetOutside(WorldMapFrame.ScrollContainer)
		Frame.MaxUIHeader:ClearAllPoints()
		Frame.MaxUIHeader:SetPoint("BOTTOMLEFT", Frame.Backdrop, "TOPLEFT", 0, 3)
		Frame.MaxUIHeader:SetPoint("BOTTOMRIGHT", Frame.Backdrop, "TOPRIGHT", 0, 3)
	end	
end
--]]

function WorldMap:Enable()
	if not C.Misc.WorldMapEnable then return end

	-- Tukui
	baseWorldmapEnable(self)
	
	-- MaxUI
	if C["General"]["Themes"]["Value"] == "MaxUI" then 
		local MoveButton = WorldMap.MoveButton
		self:MaxUIWorldMapCoords()
		MoveButton:Hide()
	end
end