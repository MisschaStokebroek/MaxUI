------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-10-2023
------------------------------------------------------------------------------------------

-- setting up MAPS.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Minimap = T.Maps.Minimap
local baseEnable = Minimap.Enable
local Texture = T.GetTexture(C.General.HeaderTexture)
local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
local thickness

------------------------------------------------------------------------------------------
-- MINIMAP ADJUSTMENTS
------------------------------------------------------------------------------------------
function Minimap:TukuiStyleAdjustments()
	local Mail = (T.Retail and MiniMapMailIcon:GetParent()) or (MinimapCluster and MinimapCluster.MailFrame) or (MiniMapMailFrame)
	local MailBorder = MiniMapMailBorder
	local MailIcon = MiniMapMailIcon

	if T.Retail and MawBuffsBelowMinimapFrame then
		MawBuffsBelowMinimapFrame.Container:ClearAllPoints()
		MawBuffsBelowMinimapFrame.Container:SetPoint("TOPRIGHT", Minimap, "BOTTOMRIGHT", 0, -10)
	end
	
	-- Mail Icon
	if Mail then
		Mail:ClearAllPoints()
		Mail:SetPoint("TOPLEFT", 3, -3)
	end

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

function Minimap:RectangleMask()
	local scale = C["General"]["MinimapScale"]/100
    local texturePath = "Interface\\AddOns\\MaxUI\\Medias\\Textures\\RecMapMask.tga"
    local diff = (256*scale) - (190*scale)
    local halfDiff = ceil(diff / 2)

    Minimap:SetClampedToScreen(true)
    Minimap:SetMaskTexture(texturePath)
    Minimap:SetSize(256*scale, 256*scale)
    Minimap:SetHitRectInsets(0, 0, halfDiff * 2, halfDiff * 1)
    Minimap:SetClampRectInsets(0, 0, 0, 0)
    
   	Minimap:ClearAllPoints()
    Minimap:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -6, 20)

    Minimap.diff = diff
    Minimap.halfDiff = halfDiff

    Minimap.Backdrop:SetOutside()

    self.Backdrop:ClearAllPoints()
    self.Backdrop:SetPoint("TOP", 0, -38*scale)
    self.Backdrop:SetPoint("BOTTOM", 0, 37*scale)
    self.Backdrop:SetPoint("LEFT", 0, -2*scale)
    self.Backdrop:SetPoint("RIGHT", 0, 2*scale)
    
    self.Backdrop.Shadow:ClearAllPoints()
    self.Backdrop.Shadow:SetPoint("TOP", 0, 4)
    self.Backdrop.Shadow:SetPoint("BOTTOM", 0, -4)
    self.Backdrop.Shadow:SetPoint("LEFT", -4, 0)
    self.Backdrop.Shadow:SetPoint("RIGHT", 4, 0)
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
	-- wow
	-- elements
	local MinimapDataText = T.DataTexts.Panels.Minimap
	local TopLine = TopLine
	local Mail = (T.Retail and MiniMapMailIcon:GetParent()) or (MinimapCluster and MinimapCluster.MailFrame) or (MiniMapMailFrame)
	local MailBorder = MiniMapMailBorder
	local MailIcon = MiniMapMailIcon

	-- settings
	local MapHeight = C["Location"]["MapHeight"]
	local MapWidth = C["Location"]["MapWidth"]
	local RightHeight = C["Chat"]["RightHeight"]
	thickness = C["General"]["thickness"] 
	local Backdrop = Minimap.Backdrop
	local MinimapZone = Minimap.MinimapZone
	local MinimapCoords = Minimap.MinimapCoords
	local MapSize = T.Maps.Minimap:GetWidth()
	local MapFont = T.GetFont(C["General"].Font)
	local AmountTop = C["DataTexts"]["AmountTopDataTexts"]
	local width = ((TopLine:GetWidth() / AmountTop))-1

	if Mail then
		Mail:ClearAllPoints()
		Mail:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 4, -4)
		Mail:SetSize(22, 22)
		
		MailIcon:ClearAllPoints()
		MailIcon:SetPoint("TOPRIGHT", Mail, "TOPRIGHT")
		MailIcon:SetSize(24, 24)
		MailIcon:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\Icons\\Menu\\cMail.tga")
	end

	MinimapZone.Backdrop:SetAlpha(0.8)
	MinimapZone.Backdrop:CreateShadow()
	
	-- datatext hide it
	MinimapDataText:ClearAllPoints()
	MinimapDataText:SetPoint("BOTTOMLEFT", Minimap, "BOTTOMLEFT", 4, 4)
	MinimapDataText:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", -4, 4)
	--MinimapDataText:SetWidth(T.Maps.Minimap:GetWidth()-8)
	MinimapDataText:SetHeight(22)
	MinimapDataText:SetAlpha(0)
	
	if C.Maps.MinimapCoords then
		MinimapCoords:ClearAllPoints()
		MinimapCoords:SetSize(70, 22)
		MinimapCoords:SetPoint("BOTTOMLEFT", MinimapZone, "TOPLEFT", 0, 4)
		MinimapCoords.Backdrop:SetAlpha(0.75)
		MinimapCoords.Backdrop:CreateShadow()
	end

	-- Resize Minimap Backdrop
	Backdrop:ClearAllPoints()
	Backdrop:SetPoint("TOPLEFT", Minimap, "TOPLEFT", -1, 1)
	Backdrop:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", 1, -1)

	local y
	if C["General"]["thickness"] <=19 then
		y = C["Location"]["MinimapRectangular"] and -26 or 12
	else
		y = C["Location"]["MinimapRectangular"] and -32 or 6 
	end

	if C["Location"]["MinimapFixedSizeDT"] then 
		Minimap:SetSize(width-1, width-1)
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
	
	-- Animation
	Minimap:fadeIn(C["General"]["FaderTime"])
	Minimap:fadeOut(C["General"]["FaderTime"])
	
	-- taxi button
	Minimap.EarlyExitButton:SkinMaxUIButton(true)
	--Minimap.EarlyExitButton:SetInside(MinimapDataText)
	Minimap.EarlyExitButton:SetFrameStrata("HIGH")
	Minimap.EarlyExitButton.Text:Hide()
	
	local MinimapEarlyExitButtonText = Minimap.EarlyExitButton:CreateFontString(nil, "OVERLAY")
	MinimapEarlyExitButtonText:SetFontObject(MapFont)
	MinimapEarlyExitButtonText:SetPoint("CENTER")
	MinimapEarlyExitButtonText:SetText("|cffFFFFFFDismount now.|r")

	if C["Skins"]["MinimapFilter"] == true then 
		Minimap:CreateMaxUIFilter()
	end

	if C["Skins"]["MinimapElementsFilter"] == true then 
		MinimapZone:CreateMaxUIFilter()
		if C.Maps.MinimapCoords then
			MinimapCoords:CreateMaxUIFilter()
		end
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
	baseEnable(self)

	-- Compass
	if C["Location"]["Compass"] == true then 
		self:Compass()
	end

	-- Combat State
	self:CombatState()

	-- MaxUI Style
	if C["General"]["Themes"]["Value"] == "MaxUI" then 
		self:TukuiStyleAdjustments()
		self:MaxUIStyle()
	end

	-- Rectangular
	if C["Location"]["MinimapRectangular"] == true then 
		Minimap:RectangleMask()
	end
end