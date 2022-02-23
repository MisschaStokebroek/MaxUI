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
local _G = _G

------------------------------------------------------------------------------------------
-- FLIGHTMAP
------------------------------------------------------------------------------------------
local AS_Blizzard_FlightMap = AS.Blizzard_FlightMap
function AS:Blizzard_FlightMap(event, addon)
	AS_Blizzard_FlightMap(self, event, addon)
	
	if not Tukui then return end
	if not T then
		T, C = Tukui:unpack()
	end

	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	if addon ~= 'Blizzard_FlightMap' then return end
	
	-- adjustments
	local Font = C.Medias.MaxUIFont

	-- header
	FlightMapFrame:CreateMaxUIHeader("Flight Map")
	FlightMapFrame:CreateShadow()
	FlightMapFrame.MaxUIHeader:SetFrameLevel(15)
	FlightMapFrame.MaxUIHeader:ClearAllPoints()
	FlightMapFrame.MaxUIHeader:SetPoint("TOPLEFT", FlightMapFrame, "TOPLEFT", 0, 4)
	FlightMapFrame.MaxUIHeader:SetPoint("TOPRIGHT", FlightMapFrame, "TOPRIGHT", 0, 4)
	
	FlightMapFrameTitleText:Hide()
	FlightMapFramePortrait:Hide()

	-- close button
	FlightMapFrameCloseButton:ClearAllPoints()
	FlightMapFrameCloseButton:SetFrameLevel(16)
	FlightMapFrameCloseButton:SetFrameStrata("HIGH")
	FlightMapFrameCloseButton:SetPoint("RIGHT", FlightMapFrame.MaxUIHeader, "RIGHT", 4, 0)

	-- relocate
	FlightMapFrame:ClearAllPoints()
	FlightMapFrame:SetPoint("TOP", UIParent, "TOP", 0, -100)
	FlightMapFrame.ClearAllPoints = function() end
	FlightMapFrame.SetPoint = function() end
	
	AS:UnregisterSkinEvent(addon, event)
end
AS:RegisterSkin('Blizzard_FlightMap', AS.Blizzard_FlightMap, 'ADDON_LOADED')

------------------------------------------------------------------------------------------
-- TAXI
------------------------------------------------------------------------------------------
local AS_Blizzard_Taxi = AS.Blizzard_Taxi
function AS:Blizzard_Taxi()
	AS_Blizzard_Taxi(self)
	
	-- adjustments
	local Font = C.Medias.MaxUIFont

	-- header
	TaxiRouteMap:CreateMaxUIHeader("Route Map")
	TaxiRouteMap:CreateShadow()
	TaxiRouteMap.MaxUIHeader:SetFrameLevel(15)

	-- close button
	--TaxiFrame.CloseButton:ClearAllPoints()
	---TaxiFrame.CloseButton:SetFrameLevel(16)
	--TaxiFrame.CloseButton:SetFrameStrata("HIGH")
	--TaxiFrame.CloseButton:SetPoint("RIGHT", TaxiRouteMap.MaxUIHeader, "RIGHT", 4, 0)

	-- relocate
	TaxiFrame:ClearAllPoints()
	TaxiFrame:SetPoint("TOP", UIParent, "TOP", 0, -100)
	TaxiFrame.ClearAllPoints = function() end
	TaxiFrame.SetPoint = function() end
end
AS:RegisterSkin('Blizzard_Taxi', AS.Blizzard_Taxi)