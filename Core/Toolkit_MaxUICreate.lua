------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 10-01-2023
------------------------------------------------------------------------------------------

-- setting up MAXUI API/TOOLKIT

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Toolkit = T00LKIT
local Settings = Toolkit.Settings
local API = Toolkit.API
local Functions = Toolkit.Functions
local Shadows = (C["General"]["HideShadows"] == false)

local BackdropColor = {0.11, 0.11, 0.11}
local LightColor = {0.175, 0.175, 0.175}
local BGColor = {0.2, 0.2, 0.2}
local BrightColor = {0.35, 0.35, 0.35}
local HeaderColor = {0.43, 0.43, 0.43}
local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}

------------------------------------------------------------------------------------------
-- ANIMATIONS (Fade In / Out)
------------------------------------------------------------------------------------------
API.fadeIn = function(self, duration)
	self.fadeIn = CreateAnimationGroup(self)
	local f = self.fadeIn:CreateAnimation("fade")
	f:SetChange(1)
	f:SetDuration(duration)
	f:SetEasing("in-sinusoidal")
end

API.fadeOut = function(self, duration)
	self.fadeOut = CreateAnimationGroup(self)
	local f = self.fadeOut:CreateAnimation("fade")
	f:SetChange(0)
	f:SetDuration(duration)
	f:SetEasing("in-sinusoidal")
	f:SetScript("OnFinished", function(self)
		self:GetParent():Hide()
	end)
end

API.fadeToggle = function(self)
	if self:IsShown() then
        self.fadeOut:Play()
    else
        self:Show()
        self.fadeIn:Play()
    end
end

------------------------------------------------------------------------------------------
-- ANIMATIONS (Slide In / Out)
------------------------------------------------------------------------------------------
API.slideIn = function(self, x, y, d)
	self.slideIn = CreateAnimationGroup(self)
	local f = self.slideIn:CreateAnimation("move")
	f:SetOffset(x, y)
	f:SetDuration(d)
	f:SetEasing("in")
end

API.slideOut = function(self, x, y, d)
	self.slideOut = CreateAnimationGroup(self)
	local f = self.slideOut:CreateAnimation("move")
	f:SetOffset(x, y)
	f:SetDuration(d)
	f:SetEasing("out")
end

API.slideToggle = function(self)
	if self.slideStateIn then
        self.slideStateIn = false
        self.slideIn:Stop()
        self.slideOut:Play()
    else
        self.slideStateIn = true
        self.slideOut:Stop()
        self.slideIn:Play()
    end
end

------------------------------------------------------------------------------------------
-- ANIMATIONS (Mouseover)
------------------------------------------------------------------------------------------
API.HookMaxUIMouseover = function(f)
	f:HookScript("OnEnter", function(self)

	end)

	f:HookScript("OnLeave", function(self)

	end)
end	

API.SetMaxUIMouseover = function(f)
	f:SetScript("OnEnter", function(self)

	end)

	f:SetScript("OnLeave", function(self)

	end)
end	

------------------------------------------------------------------------------------------
-- ANIMATIONS (Highlighting)
------------------------------------------------------------------------------------------
API.HookMaxUIHighlight = function(frame)
	local Texture = T.GetTexture(C.Medias.Normal)
	if frame.Highlight then return end

	frame.Highlight = frame:CreateTexture(nil, "OVERLAY")
	frame.Highlight:SetDrawLayer("OVERLAY", 5)
	frame.Highlight:SetAllPoints()
	frame.Highlight:SetTexture(Texture)
	frame.Highlight:SetVertexColor(0.5, 0.5, 0.5)
	frame.Highlight:SetAlpha(0)

	frame:HookScript("OnEnter", function(self)
		frame.Highlight:SetAlpha(0.5)
	end)

	frame:HookScript("OnLeave", function(self)
		frame.Highlight:SetAlpha(0)
	end)
end	

API.SetMaxUIHighlight = function(frame)
	local Texture = T.GetTexture(C.Medias.Normal)
	if frame.Highlight then return end

	frame.Highlight = frame:CreateTexture(nil, "OVERLAY")
	frame.Highlight:SetDrawLayer("OVERLAY", 5)
	frame.Highlight:SetAllPoints()
	frame.Highlight:SetTexture(Texture)
	frame.Highlight:SetVertexColor(0.5, 0.5, 0.5)
	frame.Highlight:SetAlpha(0)

	frame:HookScript("OnEnter", function(self)
		frame.Highlight:SetAlpha(0.5)
	end)

	frame:HookScript("OnLeave", function(self)
		frame.Highlight:SetAlpha(0)
	end)
end	

------------------------------------------------------------------------------------------
-- SHADOW FUNCTION
------------------------------------------------------------------------------------------
-- not working anymore? Seems not to overwrite the original Tukui version anymore.
API.CreateShadow = function(self, ShadowScale)
	if (self.Shadow) then
		return
	end

	local Level = (self:GetFrameLevel() - 1 >= 0 and self:GetFrameLevel() - 1) or (0)
	local Scale = ShadowScale or 1
	local Shadow = CreateFrame("Frame", nil, self, "BackdropTemplate")

	Shadow:SetBackdrop({edgeFile = Toolkit.Settings.ShadowTexture, edgeSize = Toolkit.Functions.Scale(4)})
	Shadow:SetFrameLevel(Level)
	Shadow:SetOutside(self, Toolkit.Functions.Scale(3), Toolkit.Functions.Scale(3))
	Shadow:SetScale(Toolkit.Functions.Scale(Scale))
	
	if C["General"]["ClassShadow"]["Value"] == "Dark" then 
		Shadow:SetBackdropBorderColor(0.11, 0.11, 0.11)
		Shadow:SetAlpha(0.8)
	elseif C["General"]["ClassShadow"]["Value"] == "ClassColor" then 
		Shadow:SetBackdropBorderColor(unpack(ClassColor))
		Shadow:SetAlpha(0.8)
	elseif C["General"]["ClassShadow"]["Value"] == "Grey" then 
		Shadow:SetBackdropBorderColor(0.43, 0.43, 0.43)
		Shadow:SetAlpha(0.8)
	elseif C["General"]["ClassShadow"]["Value"] == "BackdropColor" then 
		Shadow:SetBackdropBorderColor(unpack(C.General.BackdropColor))
		Shadow:SetAlpha(0.8)
	else
		Shadow:SetBackdropBorderColor(0, 0, 0, .8)
	end
	self.Shadow = Shadow
end

API.CreateMaxUIShadow = function(self, ShadowScale)
	if (self.MaxUIShadow) then
		return
	end

	local Level = (self:GetFrameLevel() - 1 >= 0 and self:GetFrameLevel() - 1) or (0)
	local Scale = ShadowScale or 1
	local Shadow = CreateFrame("Frame", nil, self, "BackdropTemplate")

	Shadow:SetBackdrop({edgeFile = Toolkit.Settings.ShadowTexture, edgeSize = Toolkit.Functions.Scale(4)})
	Shadow:SetFrameLevel(Level)
	Shadow:SetOutside(self, Toolkit.Functions.Scale(3), Toolkit.Functions.Scale(3))
	Shadow:SetBackdropBorderColor(1, 0, 0)
	Shadow:SetScale(Toolkit.Functions.Scale(Scale))

	self.MaxUIShadow = Shadow
end

API.CreateMaxUIShadow = API.CreateMaxUIShadow

------------------------------------------------------------------------------------------
-- MAXUI Filter mask
------------------------------------------------------------------------------------------
API.CreateMaxUIFilter = function(frame)
	if frame.Filter then return end
	Filter = frame:CreateTexture(nil, "OVERLAY")
	Filter:SetDrawLayer("OVERLAY", 1)
	Filter:SetAllPoints()
	Filter:SetAlpha(C["Skins"]["FilterAlpha"])
	Filter:SetTexture(T.GetTexture(C["Skins"]["SkinTexture"]))
	Filter:SetVertexColor(unpack(C["Skins"]["CustomFilterColor"]))
	
	frame.Filter = Filter
end

API.CreateMaxUIFilterInside = function(frame)
	if frame.FilterInside then return end
	FilterInside = frame:CreateTexture(nil, "OVERLAY")
	FilterInside:SetDrawLayer("OVERLAY", 1)
	FilterInside:SetInside()
	FilterInside:SetAlpha(C["Skins"]["FilterAlpha"])
	FilterInside:SetTexture(T.GetTexture(C["Skins"]["SkinTexture"]))
	FilterInside:SetVertexColor(unpack(C["Skins"]["CustomFilterColor"]))
	
	frame.FilterInside = FilterInside
end

API.CreateMaxUIVerticalFilter = function(frame)
	if frame.Filter then return end
	Filter = frame:CreateTexture(nil, "OVERLAY")
	Filter:SetDrawLayer("OVERLAY", 1)
	Filter:SetAllPoints()
	Filter:SetAlpha(C["Skins"]["FilterAlpha"])
	Filter:SetTexture(T.GetTexture(C["Skins"]["SkinVerticalTexture"]))
	Filter:SetVertexColor(unpack(C["Skins"]["CustomFilterColor"]))
	
	frame.VerticalFilter = Filter
end

API.CreateMaxUIVerticalFilterInside = function(frame)
	if frame.FilterInside then return end
	FilterInside = frame:CreateTexture(nil, "OVERLAY")
	FilterInside:SetDrawLayer("OVERLAY", 1)
	FilterInside:SetInside()
	FilterInside:SetAlpha(C["Skins"]["FilterAlpha"])
	FilterInside:SetTexture(T.GetTexture(C["Skins"]["SkinVerticalTexture"]))
	FilterInside:SetVertexColor(unpack(C["Skins"]["CustomFilterColor"]))
	
	frame.VerticalFilterInside = FilterInside
end

------------------------------------------------------------------------------------------
-- MAXUI Button
------------------------------------------------------------------------------------------
API.CreateMaxUIButton = function(buttonname, frame, buttonwidth, buttonheight, buttontext, tooltiptexttitle, tooltiptext, tooltipanchor)
	local Texture = T.GetTexture(C.General.TextureButton)
	
	--if frame.MaxUIButton then return end
	
	-- basic button
	local button = CreateFrame("Button", buttonname, frame, "SecureActionButtonTemplate")
	button:SetWidth(buttonwidth)
	button:SetHeight(buttonheight)
	button:SetFrameLevel(frame:GetFrameLevel()+1)
	button:SetFrameStrata(frame:GetFrameStrata())

	-- style and skin
	button:SkinMaxUIButton()

	-- button text
	button.label = button:CreateFontString(nil, "OVERLAY")
	button.label:SetFont(C.Medias.Font, C["General"]["ButtonFontSize"])
	button.label:SetPoint("CENTER", button, 'CENTER', 0, 0)
	button.label:SetJustifyH("CENTER")	
	button.label:SetTextColor(1, 1, 1)
	button.label:SetShadowColor(0, 0, 0)
	button.label:SetShadowOffset(1, -1)
	button.label:SetText(buttontext)

	-- icon
	button.icon = button:CreateTexture(nil, "ARTWORK")
	button.icon:SetPoint("CENTER", button, "CENTER", 0, 0)
	button.icon:SetWidth(buttonheight-2)
	button.icon:SetHeight(buttonheight-2)
	button.icon:SetTexCoord(unpack(T.IconCoord))
	shaderSupported = button.icon:SetDesaturated(C["General"]["IconDesaturate"])		

	-- set attributes
	button:SetAttribute("type1", "macro")

	button:HookScript("OnEnter", function(self) 
		GameTooltip:SetFrameLevel(self:GetFrameLevel() +1)
		GameTooltip:SetFrameStrata("TOOLTIP")
		GameTooltip:SetOwner(tooltipanchor, "ANCHOR_TOP", 0, 10)
		GameTooltip:AddLine(tooltiptexttitle)
		GameTooltip:AddLine(tooltiptext, 1, 1, 1, 1, 1, 1)
		GameTooltip:Show()
		shaderSupported = button.icon:SetDesaturated(false)
		button.label:SetTextColor(1, 1, 0)
	end)

	button:HookScript("OnLeave", function(self)
		GameTooltip:Hide()
		shaderSupported = button.icon:SetDesaturated(C["General"]["IconDesaturate"])		
		button.label:SetTextColor(1, 1, 1)
	end)	

	frame.MaxUIButton = button
end

------------------------------------------------------------------------------------------
-- MAXUI CLOSE BUTTON FOR HEADERS
------------------------------------------------------------------------------------------
API.CreateMaxUICloseButton = function(frame, anchorpoint)
	if frame.MaxUIClose then return end

	local MaxUIClose = CreateFrame("Button", nil, frame)
	--MaxUIClose:CreateBackdrop() -- make it visible for testing
	MaxUIClose:SetWidth(14)
	MaxUIClose:SetHeight(14)
	MaxUIClose:SetParent(anchorpoint)
	MaxUIClose:SetPoint("RIGHT", anchorpoint, "RIGHT", -8, 0)

	MaxUIClose.icon = MaxUIClose:CreateTexture(nil, "OVERLAY")
	MaxUIClose.icon:SetInside(MaxUIClose)
	MaxUIClose.icon:SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\Close.tga]])

	MaxUIClose:SetScript("OnEnter", function(self) MaxUIClose.icon:SetVertexColor(1, 0, 0) end)
	MaxUIClose:SetScript("OnLeave", function(self)MaxUIClose.icon:SetVertexColor(1, 1, 1) end)
	
	-- Animation
	frame:fadeIn(C["General"]["FaderTime"])
	frame:fadeOut(C["General"]["FaderTime"])
	MaxUIClose:HookScript("OnMouseUp", function(self) frame:fadeToggle() end)

	frame.MaxUICloseButton = MaxUIClose
end

API.CreateBlizzardCloseButton = function(frame, anchorpoint)
	if frame.MaxUIBlizzardClose then return end

	local MaxUIBlizzardClose = CreateFrame("Button", nil, frame)
	--MaxUIBlizzardClose:CreateBackdrop() -- make it visible for testing
	MaxUIBlizzardClose:SetWidth(14)
	MaxUIBlizzardClose:SetHeight(14)
	MaxUIBlizzardClose:SetParent(anchorpoint)
	MaxUIBlizzardClose:SetPoint("RIGHT", anchorpoint, "RIGHT", -8, 0)

	MaxUIBlizzardClose.icon = MaxUIBlizzardClose:CreateTexture(nil, "OVERLAY")
	MaxUIBlizzardClose.icon:SetInside(MaxUIBlizzardClose)
	MaxUIBlizzardClose.icon:SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\Close.tga]])

	MaxUIBlizzardClose:SetScript("OnEnter", function(self)
		MaxUIBlizzardClose.icon:SetVertexColor(1, 0, 0)
	end)
	
	MaxUIBlizzardClose:SetScript("OnLeave", function(self)
		MaxUIBlizzardClose.icon:SetVertexColor(1, 1, 1)
	end)
	
	frame.BlizzardCloseButton = MaxUIBlizzardClose
end

------------------------------------------------------------------------------------------
-- MAXUI HEADER 
------------------------------------------------------------------------------------------
local BarOnEnter = function(self)
	self.highlight:SetAlpha(0.3)
end

local BarOnLeave = function(self)
	self.highlight:SetAlpha(0)
end

local BarMouseDown = function(self)
	self.Backdrop:SetBackdropColor(unpack(BGColor))
end

local BarMouseUp = function(self)
	if C["General"]["ButtonColor"]["Value"] == "Dark" then 
		self.Backdrop:SetBackdropColor(0.11, 0.11, 0.11)
	elseif C["General"]["ButtonColor"]["Value"] == "ClassColor" then 
		self.Backdrop:SetBackdropColor(unpack(ClassColor))
	elseif C["General"]["ButtonColor"]["Value"] == "Grey" then 
		self.Backdrop:SetBackdropColor(unpack(BrightColor))
	elseif C["General"]["ButtonColor"]["Value"] == "BackdropColor" then 
		self.Backdrop:SetBackdropColor(unpack(C.General.BackdropColor))
	elseif C["General"]["ButtonColor"]["Value"] == "Custom" then 
		self.Backdrop:SetBackdropColor(unpack(C["Skins"]["CustomSkinsColor"]))
	else
		self.Backdrop:SetBackdropColor(unpack(BrightColor))
	end
end

API.CreateMaxUIHeader = function(frame, text, closebutton)
	if frame.MaxUIHeader then return end
	
	local Texture = T.GetTexture(C.General.HeaderTexture)

	local MaxUIHeader = CreateFrame("Frame", nil, frame)
	MaxUIHeader:SetHeight(C["General"]["HeaderHeight"])
	MaxUIHeader:SetPoint("BOTTOMLEFT", frame, "TOPLEFT", 0, 3) 
	MaxUIHeader:SetPoint("BOTTOMRIGHT", frame, "TOPRIGHT", 0, 3) 
	MaxUIHeader:SetFrameLevel(frame:GetFrameLevel()+1)
	MaxUIHeader:SetFrameStrata(frame:GetFrameStrata())
	MaxUIHeader:RegisterForDrag("LeftButton")
	MaxUIHeader:SetScript("OnDragStart", function() frame:StartMoving() end)
	MaxUIHeader:SetScript("OnDragStop", function() frame:StopMovingOrSizing() end)

	MaxUIHeader:SkinMaxUIHeader()

	-- title
	MaxUIHeader.label = MaxUIHeader:CreateFontString(nil, "OVERLAY")
	MaxUIHeader.label:SetFont(C.Medias.Font, C.General.FontSize)
	MaxUIHeader.label:SetPoint("CENTER", MaxUIHeader, "CENTER", 0, 0)
	MaxUIHeader.label:SetJustifyH("CENTER")	
	MaxUIHeader.label:SetTextColor(1, 1, 1)
	MaxUIHeader.label:SetShadowColor(0, 0, 0)
	MaxUIHeader.label:SetShadowOffset(1, -1)
	MaxUIHeader.label:SetText(text)
	
	-- button texture
	MaxUIHeader.highlight = MaxUIHeader:CreateTexture(nil, "OVERLAY")
	MaxUIHeader.highlight:SetAllPoints()
	MaxUIHeader.highlight:SetTexture(Texture)
	MaxUIHeader.highlight:SetVertexColor(0.5, 0.5, 0.5)
	MaxUIHeader.highlight:SetAlpha(0)

	-- button mouseaction (mousover or click)
	MaxUIHeader:SetScript("OnMouseDown", BarOnMouseDown)
	MaxUIHeader:SetScript("OnMouseUp", BarOnMouseUp)
	MaxUIHeader:SetScript("OnEnter", function(self) 
		BarOnEnter(MaxUIHeader)
	end)

	MaxUIHeader:SetScript("OnLeave", function(self)
		BarOnLeave(MaxUIHeader)
	end)

	-- frame movable
	frame:SetMovable(true)
	frame:SetUserPlaced(true)

	if closebutton then
		frame:CreateMaxUICloseButton(MaxUIHeader)
	end
			
	frame.MaxUIHeader = MaxUIHeader
end

API.CreateMaxUIFooter = function(frame)
	if frame.MaxUIFooter then return end
	
	local Texture = T.GetTexture(C.General.HeaderTexture)

	local MaxUIFooter = CreateFrame("Frame", nil, frame)
	MaxUIFooter:SetHeight(C["General"]["HeaderHeight"])
	MaxUIFooter:SetPoint("TOPLEFT", frame, "BOTTOMLEFT", 0, -3) 
	MaxUIFooter:SetPoint("TOPRIGHT", frame, "BOTTOMRIGHT", 0, -3) 
	MaxUIFooter:SetFrameLevel(frame:GetFrameLevel()+1)
	MaxUIFooter:SetFrameStrata(frame:GetFrameStrata())
	MaxUIFooter:RegisterForDrag("LeftButton")
	MaxUIFooter:SetScript("OnDragStart", function() frame:StartMoving() end)
	MaxUIFooter:SetScript("OnDragStop", function() frame:StopMovingOrSizing() end)

	MaxUIFooter:SkinMaxUIHeader()
	
	-- button texture
	MaxUIFooter.highlight = MaxUIFooter:CreateTexture(nil, "OVERLAY")
	MaxUIFooter.highlight:SetAllPoints()
	MaxUIFooter.highlight:SetTexture(Texture)
	MaxUIFooter.highlight:SetVertexColor(0.5, 0.5, 0.5)
	MaxUIFooter.highlight:SetAlpha(0)

	-- button mouseaction (mousover or click)
	MaxUIFooter:SetScript("OnMouseDown", BarOnMouseDown)
	MaxUIFooter:SetScript("OnMouseUp", BarOnMouseUp)
	MaxUIFooter:SetScript("OnEnter", function(self) 
		BarOnEnter(MaxUIFooter)
	end)

	MaxUIFooter:SetScript("OnLeave", function(self)
		BarOnLeave(MaxUIFooter)
	end)

	-- frame movable
	frame:SetMovable(true)
	frame:SetUserPlaced(true)
			
	frame.MaxUIFooter = MaxUIFooter
end

------------------------------------------------------------------------------------------
-- MAXUI CLASS COLOR EDGES / PARTIAL BORDERS
------------------------------------------------------------------------------------------
API.CreateMaxUITopEdge = function(frame, text)
	if frame.MaxUITopEdge then return end
	
	local LineTexture = T.GetTexture(C.General.LineTexture)
	local thickness = C["General"]["ABLineThickness"]

	-- edge
	local MaxUITopEdge = CreateFrame("Frame", nil, frame)
	MaxUITopEdge:SetHeight(thickness)
	MaxUITopEdge:SetWidth(frame:GetWidth())
	MaxUITopEdge:SetPoint("BOTTOM", frame, "TOP", 0, 3) 
	MaxUITopEdge:SetFrameLevel(frame:GetFrameLevel()+1)
	MaxUITopEdge:SetFrameStrata(frame:GetFrameStrata())
	
	-- title
	if C["General"]["TopEdgeText"] then
		MaxUITopEdge.label = MaxUITopEdge:CreateFontString(nil, "OVERLAY")
		MaxUITopEdge.label:SetFont(C.Medias.Font, C.General.FontSize)
		MaxUITopEdge.label:SetPoint("CENTER", MaxUITopEdge, "CENTER", 0, 0)
		MaxUITopEdge.label:SetJustifyH("CENTER")	
		MaxUITopEdge.label:SetTextColor(unpack(ClassColor))
		MaxUITopEdge.label:SetShadowColor(0, 0, 0)
		MaxUITopEdge.label:SetShadowOffset(1.25, -1.25)
		MaxUITopEdge.label:SetText(text)
	end	

	MaxUITopEdge:SkinMaxUIHeader()

	frame.MaxUITopEdge = MaxUITopEdge
end

API.CreateMaxUILeftEdge = function(frame, text)
	if frame.MaxUILeftEdge then return end
	
	local LineTexture = T.GetTexture(C.General.LineTexture)
	local thickness = C["General"]["ABLineThickness"]

	local MaxUILeftEdge = CreateFrame("Frame", nil, frame)
	MaxUILeftEdge:SetHeight(frame:GetHeight())
	MaxUILeftEdge:SetWidth(thickness)
	MaxUILeftEdge:SetPoint("RIGHT", frame, "LEFT", -3, 0) 
	MaxUILeftEdge:SetFrameLevel(frame:GetFrameLevel()+1)
	MaxUILeftEdge:SetFrameStrata(frame:GetFrameStrata())
	
	MaxUILeftEdge:SkinMaxUIHeader(true)

	frame.MaxUILeftEdge = MaxUILeftEdge
end

API.CreateMaxUIRightEdge = function(frame, text)
	if frame.MaxUIRightEdge then return end
	
	local LineTexture = T.GetTexture(C.General.LineTexture)
	local thickness = C["General"]["ABLineThickness"]

	local MaxUIRightEdge = CreateFrame("Frame", nil, frame)
	MaxUIRightEdge:SetHeight(frame:GetHeight())
	MaxUIRightEdge:SetWidth(thickness)
	MaxUIRightEdge:SetPoint("LEFT", frame, "RIGHT", 3, 0) 
	MaxUIRightEdge:SetFrameLevel(frame:GetFrameLevel()+1)
	MaxUIRightEdge:SetFrameStrata(frame:GetFrameStrata())

	MaxUIRightEdge:SkinMaxUIHeader(true)

	frame.MaxUIRightEdge = MaxUIRightEdge
end

API.CreateMaxUIBottomEdge = function(frame, text)
	if frame.MaxUIBottomEdge then return end
	
	local LineTexture = T.GetTexture(C.General.LineTexture)
	local thickness = C["General"]["ABLineThickness"]

	local MaxUIBottomEdge = CreateFrame("Frame", nil, frame)
	MaxUIBottomEdge:SetHeight(thickness)
	MaxUIBottomEdge:SetWidth(frame:GetWidth())
	MaxUIBottomEdge:SetPoint("TOP", frame, "BOTTOM", 0, -3)
	MaxUIBottomEdge:SetFrameLevel(frame:GetFrameLevel()+1)
	MaxUIBottomEdge:SetFrameStrata(frame:GetFrameStrata())

	MaxUIBottomEdge:SkinMaxUIHeader(true)

	frame.MaxUIBottomEdge = MaxUIBottomEdge
end

------------------------------------------------------------------------------------------
-- ADD TO API
------------------------------------------------------------------------------------------
Toolkit:Enable()