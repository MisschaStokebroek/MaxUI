------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up MAPS.
-- MawBuffsBelowMinimapFrame
------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Minimap = T.Maps.Minimap
local baseEnable = Minimap.Enable
local Texture = T.GetTexture(C.General.HeaderTexture)
local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
local thickness = thickness

------------------------------------------------------------------------------------------
-- MINIMAP ADJUSTMENTS
------------------------------------------------------------------------------------------
function Minimap:TukuiStyleAdjustments()
	local Mail = MiniMapMailFrame
	
	if T.Retail then
		MawBuffsBelowMinimapFrame.Container:ClearAllPoints()
		MawBuffsBelowMinimapFrame.Container:SetPoint("TOPRIGHT", Minimap, "BOTTOMRIGHT", 0, -10)
	end
	
	-- Mail Icon
	Mail:ClearAllPoints()
	Mail:SetPoint("TOPLEFT", 0, 0)

	Minimap.Backdrop:SetOutside()
	
	self.Backdrop.Shadow:ClearAllPoints()
	self.Backdrop.Shadow:SetPoint("TOP", 0, 4)
	self.Backdrop.Shadow:SetPoint("BOTTOM", 0, -4)
	self.Backdrop.Shadow:SetPoint("LEFT", -4, 0)
	self.Backdrop.Shadow:SetPoint("RIGHT", 4, 0)

	Minimap:ClearAllPoints()
	if C["Location"]["Position"]["Value"] == "Topleft" then
		Minimap:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 30, -30)	
		
	elseif C["Location"]["Position"]["Value"] == "Center" then
		Minimap:SetPoint("TOP", UIParent, "TOP", 0, -30)	
	
	elseif C["Location"]["Position"]["Value"] == "Topright" then
		Minimap:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -30, -30)	
	
	elseif C["Location"]["Position"]["Value"] == "EmbedChatRight" then
		Minimap:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -30, -30)	
	
	elseif C["Location"]["Position"]["Value"] == "EmbedChatLeft" then
		Minimap:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -30, -30)	
	
	elseif C["Location"]["Position"]["Value"] == "Bottom" then
		Minimap:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -30, -30)	
	end	
end

function Minimap:Compass()
	local MapFont = T.GetFont(C["General"].Font)

	local North = Minimap:CreateFontString(nil, "OVERLAY")
	North:SetFontObject(MapFont)
	North:SetPoint("TOP", Minimap, "TOP", 0, -2)
	North:SetText("N")

	local East = Minimap:CreateFontString(nil, "OVERLAY")
	East:SetFontObject(MapFont)
	East:SetPoint("RIGHT", Minimap, "RIGHT", -2, 0)
	East:SetText("E")

	local South = Minimap:CreateFontString(nil, "OVERLAY")
	South:SetFontObject(MapFont)
	South:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, 2)
	South:SetText("S")

	local West = Minimap:CreateFontString(nil, "OVERLAY")
	West:SetFontObject(MapFont)
	West:SetPoint("LEFT", Minimap, "LEFT", 2, 0)
	West:SetText("W")
end

function Minimap:CombatState()
	if C["Location"]["MinimapCombatState"]["Value"] == "Hide" then
		RegisterStateDriver(Minimap, "visibility", "[combat] hide; show")
	end

	if C["Location"]["MinimapCombatState"]["Value"] == "Show" then
		RegisterStateDriver(Minimap, "visibility", "[combat] show; hide")
	end
end

function Minimap:MaxUIStyle()
	local MinimapDataText = T.DataTexts.Panels.Minimap
	local MapHeight = C["Location"]["MapHeight"]
	local MapWidth = C["Location"]["MapWidth"]
	local RightHeight = C["Chat"]["RightHeight"]
	local TopLine = TopLine
	local MapSize = T.Maps.Minimap:GetWidth()
	local MapFont = T.GetFont(C["General"].Font)
	local Backdrop = Minimap.Backdrop
	local MinimapZone = Minimap.MinimapZone
	local MinimapCoords = Minimap.MinimapCoords
	thickness = C["General"]["thickness"] 
	
	if C["Skins"]["MinimapFilter"] == true then 
		Minimap.Filter = Minimap:CreateTexture(nil, "OVERLAY")
		Minimap.Filter:SetAlpha(C["Skins"]["FilterAlpha"])
		Minimap.Filter:SetPoint("TOPLEFT", Minimap, "BOTTOMLEFT", 0, 0)
		Minimap.Filter:SetPoint("BOTTOMRIGHT", Minimap, "TOPRIGHT", 0, 0)
		Minimap.Filter:SetTexture([[Interface\AddOns\MaxUI\Medias\Textures\Overlay.tga]])
	end
	
	-- datatext hide it
	MinimapDataText:ClearAllPoints()
	MinimapDataText:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, 4)
	MinimapDataText:SetWidth(T.Maps.Minimap:GetWidth()-8)
	MinimapDataText:SetHeight(22)
	MinimapDataText:SetAlpha(0)
	
	-- add optional dt's for coords and zone
	local ZoneHolder = CreateFrame("Frame", "ZoneHolder", Minimap)
	ZoneHolder:SetHeight(22) 
	ZoneHolder:SetWidth(MapSize-8)
	ZoneHolder:SetPoint("TOP", Minimap, "TOP", 0, -6)

	local LEFTCoordsHolder = CreateFrame("Frame", "LEFTCoordsHolder", Minimap)
	LEFTCoordsHolder:SetHeight(22) 
	LEFTCoordsHolder:SetWidth((MapSize-8)/2)
	LEFTCoordsHolder:SetPoint("BOTTOMLEFT", Minimap, "BOTTOMLEFT", 2, 6)

	local RIGHTCoordsHolder = CreateFrame("Frame", "RIGHTCoordsHolder", Minimap)
	RIGHTCoordsHolder:SetHeight(22) 
	RIGHTCoordsHolder:SetWidth((MapSize-8)/2)
	RIGHTCoordsHolder:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", -2, 6)
	
	--MinimapZone:ClearAllPoints()
	--MinimapZone:SetPoint("TOP", Minimap, "TOP", 0, -6)
	if C.Maps.MinimapCoords then
		MinimapCoords:ClearAllPoints()
		MinimapCoords:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 6, -6)
	end
	
	-- Resize Minimap Backdrop
	Backdrop:ClearAllPoints()
	Backdrop:SetPoint("TOPLEFT", Minimap, "TOPLEFT", -1, 1)
	Backdrop:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", 1, -1)

	local y
	if C["General"]["thickness"] <=19 then
		y = 12
	else
		y = 6 
	end

	-- minimap position
	Minimap:ClearAllPoints()
	if C["Location"]["Position"]["Value"] == "Topleft" then
		Minimap:SetPoint("TOPLEFT", Minimap.TopLine, "BOTTOMLEFT", 1, -y)	
	
	elseif C["Location"]["Position"]["Value"] == "Center" then
		Minimap:SetPoint("TOP", Minimap.TopLine, "TOP", 0, -y)	
	
	elseif C["Location"]["Position"]["Value"] == "Topright" then
		Minimap:SetPoint("TOPRIGHT", Minimap.TopLine, "BOTTOMRIGHT", -1, -y)

	elseif C["Location"]["Position"]["Value"] == "BottomLeft" then
		Minimap:SetPoint("BOTTOMLEFT", BottomLine, "TOPLEFT", 0, y)
	
	elseif C["Location"]["Position"]["Value"] == "Bottom" then
		Minimap:SetPoint("BOTTOM", BottomLine, "TOP", 0, y)

	elseif C["Location"]["Position"]["Value"] == "BottomRight" then
		Minimap:SetPoint("BOTTOMRIGHT", BottomLine, "TOPRIGHT", 0, y)
	
	elseif C["Location"]["Position"]["Value"] == "EmbedChatRight" then
		Minimap:SetPoint("BOTTOMRIGHT", BottomLine, "TOPRIGHT", -14, 15)
		Minimap:SetWidth(RightHeight-1)
		Minimap:SetHeight(RightHeight-1)
	end	

	-- tracker button
	if T.Retail then
		local Tracker = CreateFrame("Frame", "Tracker", Minimap)
		Tracker:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", -4, -4)
		Tracker:SetHeight(18)
		Tracker:SetWidth(18)
		Tracker:SetFrameStrata("HIGH")
		Tracker:SetFrameLevel(Minimap:GetFrameLevel()+1)
		Tracker:CreateBackdrop(nil, Texture)
		Tracker.Backdrop:SetInside()
		Tracker.Backdrop:SetBackdropColor(unpack(C.General.BackdropColor))
		Tracker.Backdrop:SetAlpha(C["General"]["GeneralPanelAlpha"])
		if not IsAddOnLoaded('ProjectAzilroka') then 
			Tracker.Backdrop:CreateShadow()
		end

		MiniMapTrackingButton:StripTextures()
		MiniMapTrackingButton:SetParent(Tracker)
		MiniMapTrackingButton:ClearAllPoints()
		MiniMapTrackingButton:SetAllPoints()
			MiniMapTrackingButton.Icon = MiniMapTrackingButton:CreateTexture(nil, "ART")
			MiniMapTrackingButton.Icon:SetInside()
			MiniMapTrackingButton.Icon:SetTexture([[Interface\AddOns\MaxUI\Medias\menuicons\maplocation.tga]])

		
		if not IsAddOnLoaded("ProjectAzilroka") then
			Tracker:SetAlpha(0)
			MiniMapTrackingButton:SetScript("OnEnter", function(self)
				Tracker:SetAlpha(1)
			end)

			MiniMapTrackingButton:SetScript("OnLeave", function(self)
				Tracker:SetAlpha(0)
			end)
		end
	end
	
	-- Animation
	--Minimap:Hide()
	--Minimap:SetAlpha(0)	
	Minimap:fadeIn(C["General"]["FaderTime"])
	Minimap:fadeOut(C["General"]["FaderTime"])

	-- temp fix for datatext not running function from API.
	function MinimapFadeToggle()
		if Minimap:IsShown() then
			Minimap.fadeOut:Play()
		else
			Minimap:Show()
			Minimap.fadeIn:Play()
		end
	end
	
	-- taxi button
	Minimap.EarlyExitButton:CreateShadow()
	Minimap.EarlyExitButton:SetFrameStrata("HIGH")
	Minimap.EarlyExitButton:SetInside(MinimapDataText)
	
	Minimap.EarlyExitButton.Text:Hide()
	
	local MinimapEarlyExitButtonText = Minimap.EarlyExitButton:CreateFontString(nil, "OVERLAY")
	MinimapEarlyExitButtonText:SetFontObject(MapFont)
	MinimapEarlyExitButtonText:SetPoint("CENTER")
	MinimapEarlyExitButtonText:SetText("|cffFFFFFFDismount now.|r")

	Minimap.EarlyExitButton.Texture = Minimap.EarlyExitButton:CreateTexture(nil, "ART")
	Minimap.EarlyExitButton.Texture:SetInside(Minimap.EarlyExitButton)
	Minimap.EarlyExitButton.Texture:SetTexture(Texture)
	Minimap.EarlyExitButton.Texture:SetVertexColor(unpack(ClassColor))
	if C["General"]["ClassColorHeaders"]["Value"] == "Dark" then 
		Minimap.EarlyExitButton.Texture:SetVertexColor(0.11, 0.11, 0.11)
	elseif C["General"]["ClassColorHeaders"]["Value"] == "ClassColor" then 
		Minimap.EarlyExitButton.Texture:SetVertexColor(unpack(ClassColor))
	elseif C["General"]["ClassColorHeaders"]["Value"] == "BackdropColor" then 
		Minimap.EarlyExitButton.Texture:SetVertexColor(unpack(C.General.BackdropColor))
	else
		Minimap.EarlyExitButton.Texture:SetVertexColor(0.43, 0.43, 0.43)
	end
end

function Minimap:StartHighlight()
	if not Minimap.Highlight then
		Minimap.Highlight = CreateFrame("Frame", nil, Minimap, "BackdropTemplate")
		Minimap.Highlight:SetBackdrop({edgeFile = C.Medias.Glow, edgeSize = 10})
		Minimap.Highlight:SetPoint("TOP", 0, 10)
		Minimap.Highlight:SetPoint("BOTTOM", 0, -10)
		Minimap.Highlight:SetPoint("LEFT", -10, 0)
		Minimap.Highlight:SetPoint("RIGHT", 10, 0)
		Minimap.Highlight:SetBackdropBorderColor(1, 1, 0)
		
		Minimap.Highlight.Animation = Minimap.Highlight:CreateAnimationGroup()
		Minimap.Highlight.Animation:SetLooping("BOUNCE")
		
		Minimap.Highlight.Animation.Bounce = Minimap.Highlight.Animation:CreateAnimation("Alpha")
		Minimap.Highlight.Animation.Bounce:SetFromAlpha(1)
		Minimap.Highlight.Animation.Bounce:SetToAlpha(.6)
		Minimap.Highlight.Animation.Bounce:SetDuration(.3)
		Minimap.Highlight.Animation.Bounce:SetSmoothing("IN_OUT")
	end
	
	if not Minimap.Highlight.Animation:IsPlaying() then
		Minimap.Highlight:Show()
		Minimap.Highlight.Animation:Play()
		
		T.Print("[|cffffff00"..MINIMAP_LABEL.."|r] "..MINIMAP_GARRISON_LANDING_PAGE_TOOLTIP.." (|cffff0000"..KEY_BUTTON3.."|r)")
	end
end

function Minimap:Enable()
	-- Tukui
	baseEnable(self)

	-- Compass
	if C["Location"]["Compass"] == true then 
		self:Compass()
	end

	-- Combat State
	self:CombatState()

	-- MaxUI
	if C["General"]["Themes"]["Value"] == "MaxUI" then 
		self:TukuiStyleAdjustments()
		self:MaxUIStyle()
	end	
end	