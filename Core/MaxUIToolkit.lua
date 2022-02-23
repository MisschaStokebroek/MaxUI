------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-07-2021
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

local HeaderTexture = T.GetTexture(C.General.HeaderTexture)

local LightColor = {0.175, 0.175, 0.175}
local BGColor = {0.2, 0.2, 0.2}
local BrightColor = {0.35, 0.35, 0.35}
local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
local HeaderColor = {0.43, 0.43, 0.43}

local thickness = thickness 
local tooltipanchor = tooltipanchor
local tooltiptext = tooltiptext

local ButtonOnEnter = function(self)
	self.highlight:SetAlpha(0.3)
end

local ButtonOnLeave = function(self)
	self.highlight:SetAlpha(0)
end

local ButtonOnMouseDown = function(self)
	self.Backdrop:SetBackdropColor(unpack(BGColor))
end

local ButtonOnMouseUp = function(self)
	self.Backdrop:SetBackdropColor(unpack(BrightColor))
end
	
local ShowTooltip = function(self)
	GameTooltip:SetOwner(tooltipanchor, "ANCHOR_TOP", 0, 10)
	GameTooltip:AddLine(tooltiptext, 1, 1, 1, 1, 1, 1)
	GameTooltip:Show()
end

local HideTooltip = function(self)
	GameTooltip:Hide()
end
	
------------------------------------------------------------------------------------------
-- SHADOW FUNCTION
------------------------------------------------------------------------------------------
API.CreateShadow = function(self, ShadowScale)
	if (self.Shadow) then
		return
	end

	local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
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

------------------------------------------------------------------------------------------
-- MAXUI Tools Button
------------------------------------------------------------------------------------------
API.CreateToolButton = function(buttonname, f, buttonwidth, buttonheight, buttontext, tooltiptexttitle, tooltiptext, tooltipanchor)
	local Texture = T.GetTexture(C.General.TextureButton)
	
	-- basic button
	local button = CreateFrame("Button", buttonname, f, "SecureActionButtonTemplate")
	button:SetWidth(buttonwidth)
	button:SetHeight(buttonheight)
	button:CreateBackdrop(nil, Texture)
	button.Backdrop:SetBackdropColor(unpack(BrightColor))
	button:SetFrameLevel(f:GetFrameLevel()+1)
	button:SetFrameStrata(f:GetFrameStrata())
	
	-- button text
	button.text = button:CreateFontString(nil, "OVERLAY")
	button.text:SetFont(C.Medias.Font, C.Tools.FontSize)
	button.text:SetText(buttontext)
	button.text:SetTextColor(1, 1, 1)
	button.text:SetPoint("CENTER", button, 'CENTER', 0, 0)
	button.text:SetJustifyH("CENTER")	
	
	-- button icon
	button.icon = button:CreateTexture(nil, "OVERLAY")
	button.icon:SetWidth(buttonwidth-4)
	button.icon:SetHeight(buttonheight-4)
	button.icon:SetPoint("CENTER", button, "CENTER", 0, 0)
	
	--button mouseaction (mousover or click)
	button:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(tooltipanchor, "ANCHOR_TOP", 0, 10)
		GameTooltip:AddLine(tooltiptexttitle)
		GameTooltip:AddLine(tooltiptext, 1, 1, 1, 1, 1, 1)
		GameTooltip:Show()
		
		if C["General"]["ClassColorHeaders"]["Value"] == "Dark" then 
			button.text:SetTextColor(0.11, 0.11, 0.11)
			button.Backdrop:SetBorderColor(0.11, 0.11, 0.11)
			button.icon:SetVertexColor(0.11, 0.11, 0.11)
		
		elseif C["General"]["ClassColorHeaders"]["Value"] == "ClassColor" then 
			button.text:SetTextColor(unpack(ClassColor))
			button.Backdrop:SetBorderColor(unpack(ClassColor))
			button.icon:SetVertexColor(unpack(ClassColor))
		
		elseif C["General"]["ClassColorHeaders"]["Value"] == "Grey" then 
			button.text:SetTextColor(0.43, 0.43, 0.43)
			button.Backdrop:SetBorderColor(0.43, 0.43, 0.43)
			button.icon:SetVertexColor(0.43, 0.43, 0.43)
		else			
			button.text:SetTextColor(unpack(C.General.BackdropColor))
			button.Backdrop:SetBorderColor(unpack(C.General.BackdropColor))
			button.icon:SetVertexColor(unpack(C.General.BackdropColor))
		end
	end)
	
	button:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
		button.text:SetTextColor(1, 1, 1)
		button.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
		button.icon:SetVertexColor(1, 1, 1)
	end)

	-- set attributes
	button:SetAttribute("type1", "macro")
	
	f.ToolButton = ToolButton
end

------------------------------------------------------------------------------------------
-- MAXUI Config Button
------------------------------------------------------------------------------------------
API.CreateConfigButton = function(buttonname, f, buttonwidth, buttonheight, buttontext, tooltiptexttitle, tooltiptext, tooltipanchor)
	local Texture = C.Medias.Normal
	
	-- basic button
	local button = CreateFrame("Button", buttonname, f, "SecureActionButtonTemplate")
	button:SetWidth(buttonwidth)
	button:SetHeight(buttonheight)
	button:CreateBackdrop(nil, Texture)
	button.Backdrop:SetBackdropColor(unpack(BrightColor))
	button:SetFrameLevel(f:GetFrameLevel()+1)
	button:SetFrameStrata(f:GetFrameStrata())
	
	-- button text
	button.label = button:CreateFontString(nil, "OVERLAY")
	button.label:SetFont(C["Medias"]["Font"], 12)
	button.label:SetPoint("CENTER", button, 'CENTER', 0, 0)
	button.label:SetJustifyH("CENTER")	
	button.label:SetTextColor(1, 1, 1)
	button.label:SetShadowColor(0, 0, 0)
	button.label:SetShadowOffset(1, -1)
	button.label:SetText(buttontext)

	-- button texture
	button.highlight = button:CreateTexture(nil, "OVERLAY")
	button.highlight:SetAllPoints()
	button.highlight:SetTexture(Texture)
	button.highlight:SetVertexColor(0.5, 0.5, 0.5)
	button.highlight:SetAlpha(0)
	
	-- button mouseaction (mousover or click)
	button:SetScript("OnMouseDown", ButtonOnMouseDown)
	button:SetScript("OnMouseUp", ButtonOnMouseUp)
	button:SetScript("OnEnter", function(self) 
		GameTooltip:SetFrameLevel(self:GetFrameLevel() +1)
		GameTooltip:SetFrameStrata("TOOLTIP")
		GameTooltip:SetOwner(tooltipanchor, "ANCHOR_TOP", 0, 10)
		GameTooltip:AddLine(tooltiptexttitle)
		GameTooltip:AddLine(tooltiptext, 1, 1, 1, 1, 1, 1)
		GameTooltip:Show()
		ButtonOnEnter(button)
	end)
	
	button:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
		ButtonOnLeave(button)
	end)	

	-- icon
	button.icon = button:CreateTexture(nil, "OVERLAY")
	button.icon:SetWidth(17)
	button.icon:SetHeight(17)
	button.icon:SetPoint("CENTER", button, "CENTER", 0, 0)

	-- set attributes
	button:SetAttribute("type1", "macro")
	
	f.ConfigButton = ConfigButton
end

------------------------------------------------------------------------------------------
-- MAXUI HEADER and MOVABLE FRAME
------------------------------------------------------------------------------------------
API.CreateMaxUIHeader = function(f, text)
	if f.MaxUIHeader then return end

	local MaxUIHeader = CreateFrame("Frame", nil, f)
	MaxUIHeader:CreateBackdrop()
	
	MaxUIHeader.Texture = MaxUIHeader:CreateTexture(nil, "ART")
	MaxUIHeader.Texture:SetInside(MaxUIHeader)
	MaxUIHeader.Texture:SetTexture(T.GetTexture(C.General.HeaderTexture))
	if C["General"]["ClassColorHeaders"]["Value"] == "Dark" then 
		MaxUIHeader.Texture:SetVertexColor(0.11, 0.11, 0.11)
	elseif C["General"]["ClassColorHeaders"]["Value"] == "ClassColor" then 
		MaxUIHeader.Texture:SetVertexColor(unpack(ClassColor))
	elseif C["General"]["ClassColorHeaders"]["Value"] == "Grey" then 
		MaxUIHeader.Texture:SetVertexColor(0.43, 0.43, 0.43)
	elseif C["General"]["ClassColorHeaders"]["Value"] == "Art" then 

	else
		MaxUIHeader.Texture:SetVertexColor(unpack(C.General.BackdropColor))
	end
	
	MaxUIHeader:SetHeight(22)
	MaxUIHeader:SetPoint("BOTTOMLEFT", f, "TOPLEFT", 0, 3) 
	MaxUIHeader:SetPoint("BOTTOMRIGHT", f, "TOPRIGHT", 0, 3) 
	MaxUIHeader:SetFrameLevel(f:GetFrameLevel()+1)
	MaxUIHeader:SetFrameStrata(f:GetFrameStrata())
	MaxUIHeader.Backdrop:CreateShadow()
	
	MaxUIHeader:RegisterForDrag("LeftButton")
	MaxUIHeader:SetScript("OnDragStart", function() f:StartMoving() end)
	MaxUIHeader:SetScript("OnDragStop", function() f:StopMovingOrSizing() end)

	-- title
	local MaxUIHeadertext = MaxUIHeader:CreateFontString(nil, "OVERLAY")
	MaxUIHeadertext:SetFont(C.Medias.Font, C.General.FontSize)
	MaxUIHeadertext:SetPoint("CENTER", MaxUIHeader, "CENTER", 0, 0)
	MaxUIHeadertext:SetShadowColor(0, 0, 0)
	MaxUIHeadertext:SetShadowOffset(1, -1)
	MaxUIHeadertext:SetText(text)
	
	MaxUIHeader:SetScript("OnEnter", function(self)
		if C["General"]["ClassColorHeaders"]["Value"] == "Dark" then 
			MaxUIHeader.Backdrop:SetBorderColor(0.43, 0.43, 0.43)
			MaxUIHeadertext:SetTextColor(0.43, 0.43, 0.43)
		elseif C["General"]["ClassColorHeaders"]["Value"] == "ClassColor" then 
			MaxUIHeader.Backdrop:SetBorderColor(unpack(ClassColor))
			MaxUIHeadertext:SetTextColor(unpack(ClassColor))
		elseif C["General"]["ClassColorHeaders"]["Value"] == "Grey" then 
			MaxUIHeader.Backdrop:SetBorderColor(0.43, 0.43, 0.43)
			MaxUIHeadertext:SetTextColor(0.43, 0.43, 0.43)
		else
			MaxUIHeader.Backdrop:SetBorderColor(unpack(C.General.BackdropColor))
			MaxUIHeadertext:SetTextColor(unpack(C.General.BackdropColor))
		end
	end)
	
	MaxUIHeader:SetScript("OnLeave", function(self)
		MaxUIHeadertext:SetTextColor(1, 1, 1)
		MaxUIHeader.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
	end)

	-- frame movable
	f:SetMovable(true)
	f:SetUserPlaced(true)
	
	f.MaxUIHeader = MaxUIHeader
end

------------------------------------------------------------------------------------------
-- MAXUI STATIC HEADER
------------------------------------------------------------------------------------------
API.CreateMaxUIStaticHeader = function(f, text)
	if f.MaxUIStaticHeader then return end

	local MaxUIStaticHeader = CreateFrame("Frame", nil, f)
	MaxUIStaticHeader:CreateBackdrop()
	
	MaxUIStaticHeader.Texture = MaxUIStaticHeader:CreateTexture(nil, "ART")
	MaxUIStaticHeader.Texture:SetInside(MaxUIStaticHeader)
	MaxUIStaticHeader.Texture:SetTexture(T.GetTexture(C.General.HeaderTexture))
	if C["General"]["ClassColorHeaders"]["Value"] == "Dark" then 
		MaxUIStaticHeader.Texture:SetVertexColor(0.11, 0.11, 0.11)
	elseif C["General"]["ClassColorHeaders"]["Value"] == "ClassColor" then 
		MaxUIStaticHeader.Texture:SetVertexColor(unpack(ClassColor))
	elseif C["General"]["ClassColorHeaders"]["Value"] == "Grey" then 
		MaxUIStaticHeader.Texture:SetVertexColor(0.43, 0.43, 0.43)
	else
		MaxUIStaticHeader.Texture:SetVertexColor(unpack(C.General.BackdropColor))
	end
	
	MaxUIStaticHeader:SetHeight(22)
	MaxUIStaticHeader:SetPoint("BOTTOMLEFT", f, "TOPLEFT", 0, 3) 
	MaxUIStaticHeader:SetPoint("BOTTOMRIGHT", f, "TOPRIGHT", 0, 3) 
	MaxUIStaticHeader:SetFrameLevel(f:GetFrameLevel())
	MaxUIStaticHeader:SetFrameStrata(f:GetFrameStrata())
	MaxUIStaticHeader.Backdrop:CreateShadow()

	-- title
	local MaxUIStaticHeadertext = MaxUIStaticHeader:CreateFontString(nil, "OVERLAY")
	MaxUIStaticHeadertext:SetFont(C.Medias.Font, C.General.FontSize)
	MaxUIStaticHeadertext:SetPoint("CENTER", MaxUIStaticHeader, "CENTER", 0, 0)
	MaxUIStaticHeadertext:SetText(text)
	
	MaxUIStaticHeader:SetScript("OnEnter", function(self)
		if C["General"]["ClassColorHeaders"]["Value"] == "Dark" then 
			MaxUIStaticHeader.Backdrop:SetBorderColor(0.43, 0.43, 0.43)
			MaxUIStaticHeadertext:SetTextColor(0.43, 0.43, 0.43)
		elseif C["General"]["ClassColorHeaders"]["Value"] == "ClassColor" then 
			MaxUIStaticHeader.Backdrop:SetBorderColor(unpack(ClassColor))
			MaxUIStaticHeadertext:SetTextColor(unpack(ClassColor))
		elseif C["General"]["ClassColorHeaders"]["Value"] == "Grey" then 
			MaxUIStaticHeader.Backdrop:SetBorderColor(0.43, 0.43, 0.43)
			MaxUIStaticHeadertext:SetTextColor(0.43, 0.43, 0.43)
		else
			MaxUIStaticHeader.Backdrop:SetBorderColor(unpack(C.General.BackdropColor))
			MaxUIStaticHeadertext:SetTextColor(unpack(C.General.BackdropColor))
		end
	end)
	
	MaxUIStaticHeader:SetScript("OnLeave", function(self)
		MaxUIStaticHeadertext:SetTextColor(1, 1, 1)
		MaxUIStaticHeader.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
	end)
	
	f.MaxUIStaticHeader = MaxUIStaticHeader
end

------------------------------------------------------------------------------------------
-- MAXUI Top Edge
------------------------------------------------------------------------------------------
API.CreateMaxUITopEdge = function(f, text)
	if f.MaxUITopEdge then return end
	
	local LineTexture = T.GetTexture(C.General.LineTexture)

	if C["General"]["thickness"] <= 6 then 
		thickness = C["General"]["thickness"] 
	else
		thickness = 1 
	end

	-- edge
	local MaxUITopEdge = CreateFrame("StatusBar", nil, UIParent)
	MaxUITopEdge:CreateBackdrop()
	MaxUITopEdge:SetHeight(thickness)
	MaxUITopEdge:SetWidth(f:GetWidth())
	MaxUITopEdge:SetPoint("BOTTOM", f, "TOP", 0, 3) 
	MaxUITopEdge:SetFrameLevel(2)
	MaxUITopEdge:SetFrameStrata("BACKGROUND")
	MaxUITopEdge.Backdrop:SetOutside()
	MaxUITopEdge.Backdrop:CreateShadow()
	MaxUITopEdge:SetParent(f)
	MaxUITopEdge:SetStatusBarTexture(LineTexture)
	
	-- class color
	if C["General"]["ClassColorLines"]["Value"] == "Dark" then 
		MaxUITopEdge:SetStatusBarColor(0.11, 0.11, 0.11)
	elseif C["General"]["ClassColorLines"]["Value"] == "ClassColor" then 
		MaxUITopEdge:SetStatusBarColor(unpack(ClassColor))
	elseif C["General"]["ClassColorLines"]["Value"] == "Grey" then 
		MaxUITopEdge:SetStatusBarColor(0.43, 0.43, 0.43)
	else
		MaxUITopEdge:SetStatusBarColor(unpack(C.General.BackdropColor))
	end

	f.MaxUITopEdge = MaxUITopEdge
end

------------------------------------------------------------------------------------------
-- MAXUI Left Edge
------------------------------------------------------------------------------------------
API.CreateMaxUILeftEdge = function(f, text)
	if f.MaxUILeftEdge then return end
	
	local LineTexture = T.GetTexture(C.General.LineTexture)
	if C["General"]["thickness"] <= 6 then 
		thickness = C["General"]["thickness"] 
	else
		thickness = 1 
	end

	local MaxUILeftEdge = CreateFrame("StatusBar", nil, UIParent)
	MaxUILeftEdge:CreateBackdrop()
	MaxUILeftEdge:SetHeight(f:GetHeight())
	MaxUILeftEdge:SetWidth(thickness)
	MaxUILeftEdge:SetPoint("RIGHT", f, "LEFT", -3, 0) 
	MaxUILeftEdge:SetFrameLevel(2)
	MaxUILeftEdge:SetFrameStrata("BACKGROUND")
	MaxUILeftEdge.Backdrop:CreateShadow()
	MaxUILeftEdge.Backdrop:SetOutside()
	MaxUILeftEdge:SetParent(f)
	MaxUILeftEdge:SetStatusBarTexture(LineTexture)
	
	if C["General"]["ClassColorLines"]["Value"] == "Dark" then 
		MaxUILeftEdge:SetStatusBarColor(0.11, 0.11, 0.11)
	elseif C["General"]["ClassColorLines"]["Value"] == "ClassColor" then 
		MaxUILeftEdge:SetStatusBarColor(unpack(ClassColor))
	elseif C["General"]["ClassColorLines"]["Value"] == "Grey" then 
		MaxUILeftEdge:SetStatusBarColor(0.43, 0.43, 0.43)
	else
		MaxUILeftEdge:SetStatusBarColor(unpack(C.General.BackdropColor))
	end

	f.MaxUILeftEdge = MaxUILeftEdge
end

------------------------------------------------------------------------------------------
-- MAXUI Right Edge
------------------------------------------------------------------------------------------
API.CreateMaxUIRightEdge = function(f, text)
	if f.MaxUIRightEdge then return end
	
	local LineTexture = T.GetTexture(C.General.LineTexture)
	if C["General"]["thickness"] <= 6 then 
		thickness = C["General"]["thickness"] 
	else
		thickness = 1 
	end

	local MaxUIRightEdge = CreateFrame("StatusBar", nil, UIParent)
	MaxUIRightEdge:CreateBackdrop()
	MaxUIRightEdge:SetHeight(f:GetHeight())
	MaxUIRightEdge:SetWidth(thickness)
	MaxUIRightEdge:SetPoint("LEFT", f, "RIGHT", 3, 0) 
	MaxUIRightEdge:SetFrameLevel(2)
	MaxUIRightEdge:SetFrameStrata("BACKGROUND")
	MaxUIRightEdge.Backdrop:CreateShadow()
	MaxUIRightEdge.Backdrop:SetOutside()
	MaxUIRightEdge:SetParent(f)
	MaxUIRightEdge:SetStatusBarTexture(LineTexture)
	
	if C["General"]["ClassColorLines"]["Value"] == "Dark" then 
		MaxUIRightEdge:SetStatusBarColor(0.11, 0.11, 0.11)
	elseif C["General"]["ClassColorLines"]["Value"] == "ClassColor" then 
		MaxUIRightEdge:SetStatusBarColor(unpack(ClassColor))
	elseif C["General"]["ClassColorLines"]["Value"] == "Grey" then 
		MaxUIRightEdge:SetStatusBarColor(0.43, 0.43, 0.43)
	else
		MaxUIRightEdge:SetStatusBarColor(unpack(C.General.BackdropColor))
	end

	f.MaxUIRightEdge = MaxUIRightEdge
end

------------------------------------------------------------------------------------------
-- MAXUI Bottom Edge
------------------------------------------------------------------------------------------
API.CreateMaxUIBottomEdge = function(f, text)
	if f.MaxUIBottomEdge then return end
	
	local LineTexture = T.GetTexture(C.General.LineTexture)
	if C["General"]["thickness"] <= 6 then 
		thickness = C["General"]["thickness"] 
	else
		thickness = 1 
	end

	local MaxUIBottomEdge = CreateFrame("StatusBar", nil, UIParent)
	MaxUIBottomEdge:CreateBackdrop()
	MaxUIBottomEdge:SetHeight(thickness)
	MaxUIBottomEdge:SetWidth(f:GetWidth())
	MaxUIBottomEdge:SetPoint("TOP", f, "BOTTOM", 0, -3) 
	MaxUIBottomEdge:SetFrameLevel(2)
	MaxUIBottomEdge:SetFrameStrata("BACKGROUND")
	MaxUIBottomEdge.Backdrop:CreateShadow()
	MaxUIBottomEdge.Backdrop:SetOutside()
	MaxUIBottomEdge:SetParent(f)
	MaxUIBottomEdge:SetStatusBarTexture(LineTexture)
	
	if C["General"]["ClassColorLines"]["Value"] == "Dark" then 
		MaxUIBottomEdge:SetStatusBarColor(0.11, 0.11, 0.11)
	elseif C["General"]["ClassColorLines"]["Value"] == "ClassColor" then 
		MaxUIBottomEdge:SetStatusBarColor(unpack(ClassColor))
	elseif C["General"]["ClassColorLines"]["Value"] == "Grey" then 
		MaxUIBottomEdge:SetStatusBarColor(0.43, 0.43, 0.43)
	else
		MaxUIBottomEdge:SetStatusBarColor(unpack(C.General.BackdropColor))
	end
	
	f.MaxUIBottomEdge = MaxUIBottomEdge
end

------------------------------------------------------------------------------------------
-- Animations (Slide In / Out)
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
-- Animations (Fade In / Out)
------------------------------------------------------------------------------------------
API.fadeIn = function(self, d)
	self.fadeIn = CreateAnimationGroup(self)
	local f = self.fadeIn:CreateAnimation("fade")
	f:SetChange(1)
	f:SetDuration(d)
	f:SetEasing("in-sinusoidal")
end

API.fadeOut = function(self, d)
	self.fadeOut = CreateAnimationGroup(self)
	local f = self.fadeOut:CreateAnimation("fade")
	f:SetChange(0)
	f:SetDuration(d)
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
-- MAXUI STYLE SKINNING
------------------------------------------------------------------------------------------
-- BUTTON
API.SkinMaxUIButton = function(self, BackdropStyle, Shadows, Strip)
	local Texture = T.GetTexture(C.General.HeaderTexture)
	
	-- Unskin everything
	if self.Left then self.Left:SetAlpha(0) end
	if self.Middle then self.Middle:SetAlpha(0) end
	if self.Right then self.Right:SetAlpha(0) end
	if self.TopLeft then self.TopLeft:SetAlpha(0) end
	if self.TopMiddle then self.TopMiddle:SetAlpha(0) end
	if self.TopRight then self.TopRight:SetAlpha(0) end
	if self.MiddleLeft then self.MiddleLeft:SetAlpha(0) end
	if self.MiddleMiddle then self.MiddleMiddle:SetAlpha(0) end
	if self.MiddleRight then self.MiddleRight:SetAlpha(0) end
	if self.BottomLeft then self.BottomLeft:SetAlpha(0) end
	if self.BottomMiddle then self.BottomMiddle:SetAlpha(0) end
	if self.BottomRight then self.BottomRight:SetAlpha(0) end
	if self.LeftSeparator then self.LeftSeparator:SetAlpha(0) end
	if self.RightSeparator then self.RightSeparator:SetAlpha(0) end
	if self.SetNormalTexture then self:SetNormalTexture("") end
	if self.SetHighlightTexture then self:SetHighlightTexture("") end
	if self.SetPushedTexture then self:SetPushedTexture("") end
	if self.SetDisabledTexture then self:SetDisabledTexture("") end
	if Strip then self:StripTexture() end
	
	-- Push our style
	self:CreateBackdrop(nil, Texture)
	self.Backdrop:CreateShadow()
	if C["General"]["ClassColorHeaders"] == true then 
		self.Backdrop:SetBackdropColor(unpack(ClassColor))
	else
		self.Backdrop:SetBackdropColor(0.43, 0.43, 0.43)
	end
	
	if (Shadows) then
		self:CreateShadow()
	end

	self:HookScript("OnEnter", function()
		if not self.Backdrop then
			return
		end
			
		local Class = select(2, UnitClass("player"))
		local Color = RAID_CLASS_COLORS[Class]

		if Toolkit.Settings.ClassColors then
			Color.r, Color.g, Color.b = unpack(Toolkit.Settings.ClassColors[Class])
		end

		self.Backdrop:SetBorderColor(Color.r, Color.g, Color.b)
	end)

	self:HookScript("OnLeave", function()
		self.Backdrop:SetBorderColor(Toolkit.Settings.BorderColor[1], Toolkit.Settings.BorderColor[2], Toolkit.Settings.BorderColor[3], 1)
	end)
end

-- CHECKBOX
API.SkinMaxUICheckBox = function(self, Size)
	self:StripTextures()
	self:CreateBackdrop()
	self.Backdrop:SetInside(self, 4, 4)

	if self.SetCheckedTexture then
		self:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
	end

	if self.SetDisabledCheckedTexture then
		self:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
	end

	self:HookScript("OnDisable", function(self)
		if not self.SetDisabledTexture then return end

		if self:GetChecked() then
			self:SetDisabledTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
		else
			self:SetDisabledTexture("")
		end
	end)

	self.SetNormalTexture = Noop
	self.SetPushedTexture = Noop
	self.SetHighlightTexture = Noop
end

-- CLOSEBUTTON
API.SkinMaxUICloseButton = function(self)
	self:SetNormalTexture("")
	self:SetPushedTexture("")
	self:SetHighlightTexture("")
	self:SetDisabledTexture("")

	self.Texture = self:CreateTexture(nil, "OVERLAY")
	self.Texture:SetPoint("CENTER", OffsetX or 0, OffsetY or 0)
	self.Texture:SetSize(CloseSize or 12, CloseSize or 12)
	self.Texture:SetTexture(Toolkit.Settings.CloseTexture)

	self:SetScript("OnEnter", function(self) self.Texture:SetVertexColor(1, 0, 0) end)
	self:SetScript("OnLeave", function(self) self.Texture:SetVertexColor(1, 1, 1) end)
end

-- EDITBOX
API.SkinMaxUIEditBox = function(self)
	self:StripTextures()
	self:CreateBackdrop("Transparent")
end

--ARROWBUTTONS
API.SkinMaxUIArrowButton = function(self)
	self:CreateBackdrop()
	self:SetSize(self:GetWidth() - 7, self:GetHeight() - 7)

	if Vertical then
		self:GetNormalTexture():SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\ArrowDown.tga]])

		if self:GetPushedTexture() then
			self:GetPushedTexture():SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\ArrowDown.tga]])
		end

		if self:GetDisabledTexture() then
			self:GetDisabledTexture():SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\ArrowDown.tga]])
		end
	else
		self:GetNormalTexture():SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\ArrowDown.tga]])

		if self:GetPushedTexture() then
			self:GetPushedTexture():SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\ArrowDown.tga]])
		end

		if self:GetDisabledTexture() then
			self:GetDisabledTexture():SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\ArrowDown.tga]])
		end
	end

	self:GetNormalTexture():ClearAllPoints()
	self:GetNormalTexture():SetInside()

	if self:GetDisabledTexture() then
		self:GetDisabledTexture():SetAllPoints(self:GetNormalTexture())
	end

	if self:GetPushedTexture() then
		self:GetPushedTexture():SetAllPoints(self:GetNormalTexture())
	end

	self:GetHighlightTexture():SetColorTexture(1, 1, 1, 0.3)
	self:GetHighlightTexture():SetAllPoints(self:GetNormalTexture())
end

-- DROPDOWN
API.SkinMaxUIDropDown = function(self, Width)
	local Button = _G[self:GetName().."Button"]
	local Text = _G[self:GetName().."Text"]

	self:StripTextures()
	self:CreateBackdrop("Transparent")
	self:SetWidth(Width or 155)

	Text:ClearAllPoints()
	Text:SetPoint("RIGHT", Button, "LEFT", -2, 0)

	Button:ClearAllPoints()
	Button:SetPoint("RIGHT", self, "RIGHT", -10, 3)
	Button.SetPoint = Noop

	Button:SkinMaxUIArrowButton(true)

	self:CreateBackdrop()
	self.Backdrop:SetPoint("TOPLEFT", 20, -2)
	self.Backdrop:SetPoint("BOTTOMRIGHT", Button, "BOTTOMRIGHT", 2, -2)
end

--TABS
API.SkinMaxUISkinTab = function(self)
	if (not self) then
		return
	end

	for _, object in pairs(Tabs) do
		local Texture = _G[self:GetName()..object]
		if (Texture) then
			Texture:SetTexture(nil)
		end
	end

	if self.GetHighlightTexture and self:GetHighlightTexture() then
		self:GetHighlightTexture():SetTexture(nil)
	else
		self:StripTextures()
	end

	self.Backdrop = CreateFrame("Frame", nil, self)
	self.Backdrop:CreateBackdrop()
	self.Backdrop:SetFrameLevel(self:GetFrameLevel() - 1)
	self.Backdrop:SetPoint("TOPLEFT", 10, -3)
	self.Backdrop:SetPoint("BOTTOMRIGHT", -10, 3)
end

-- SCROLLBAR
API.SkinMaxUIScrollBar = function(self)
	local Texture = T.GetTexture(C.General.HeaderTexture)
	local ScrollUpButton = _G[self:GetName().."ScrollUpButton"]
	local ScrollDownButton = _G[self:GetName().."ScrollDownButton"]
	if _G[self:GetName().."BG"] then
		_G[self:GetName().."BG"]:SetTexture(nil)
	end

	if _G[self:GetName().."Track"] then
		_G[self:GetName().."Track"]:SetTexture(nil)
	end

	if _G[self:GetName().."Top"] then
		_G[self:GetName().."Top"]:SetTexture(nil)
	end

	if _G[self:GetName().."Bottom"] then
		_G[self:GetName().."Bottom"]:SetTexture(nil)
	end

	if _G[self:GetName().."Middle"] then
		_G[self:GetName().."Middle"]:SetTexture(nil)
	end

	if ScrollUpButton and ScrollDownButton then
		ScrollUpButton:StripTextures()
		ScrollUpButton:CreateBackdrop("Default", true)

		if not ScrollUpButton.texture then
			ScrollUpButton.texture = ScrollUpButton:CreateTexture(nil, "OVERLAY")
			ScrollUpButton.texture:SetPoint("TOPLEFT", 2, -2)
			ScrollUpButton.texture:SetPoint("BOTTOMRIGHT", -2, 2)
			ScrollUpButton.texture:SetTexture(Toolkit.Settings.ArrowUpTexture)
			ScrollUpButton.texture:SetVertexColor(1, 1, 1)
		end

		ScrollDownButton:StripTextures()
		ScrollDownButton:CreateBackdrop("Default", true)

		if not ScrollDownButton.texture then
			ScrollDownButton.texture = ScrollDownButton:CreateTexture(nil, "OVERLAY")
			ScrollDownButton.texture:SetPoint("TOPLEFT", 2, -2)
			ScrollDownButton.texture:SetPoint("BOTTOMRIGHT", -2, 2)
			ScrollDownButton.texture:SetTexture(Toolkit.Settings.ArrowDownTexture)
			ScrollDownButton.texture:SetVertexColor(1, 1, 1)
		end

		if not self.trackbg then
			self.trackbg = CreateFrame("Frame", nil, self)
			self.trackbg:SetPoint("TOPLEFT", ScrollUpButton, "BOTTOMLEFT", 0, -1)
			self.trackbg:SetPoint("BOTTOMRIGHT", ScrollDownButton, "TOPRIGHT", 0, 1)
			self.trackbg:CreateBackdrop("Transparent")
			self.trackbg.Backdrop:SetFrameLevel(self:GetFrameLevel())
		end

		if self:GetThumbTexture() then
			self:GetThumbTexture():SetTexture(Texture)
			self:GetThumbTexture():SetHeight(6)
			if C["General"]["ClassColorHeaders"] == true then 
				self:GetThumbTexture():SetVertexColor(unpack(ClassColor))
			else
				self:GetThumbTexture():SetVertexColor(0.43, 0.43, 0.43)
			end
		end
	end
end

-- SLIDER
API.SkinMaxUISlider = function(self, MoveText)
	local Texture = T.GetTexture(C.General.HeaderTexture)

	if _G[self:GetName().."BG"] then
		_G[self:GetName().."BG"]:SetTexture(nil)
	end

	if _G[self:GetName().."Track"] then
		_G[self:GetName().."Track"]:SetTexture(nil)
	end

	if _G[self:GetName().."Top"] then
		_G[self:GetName().."Top"]:SetTexture(nil)
	end

	if _G[self:GetName().."Bottom"] then
		_G[self:GetName().."Bottom"]:SetTexture(nil)
	end

	if _G[self:GetName().."Middle"] then
		_G[self:GetName().."Middle"]:SetTexture(nil)
	end

	if _G[self:GetName().."Left"] then
		_G[self:GetName().."Left"]:SetTexture(nil)
	end

	if _G[self:GetName().."Right"] then
		_G[self:GetName().."Right"]:SetTexture(nil)
	end
	
	self:StripTextures()
	self:CreateBackdrop()
	self.Backdrop:SetAllPoints()
	self.Backdrop:SetFrameLevel(self:GetFrameLevel())

	if self:GetThumbTexture() then
		local Orientation = self:GetOrientation()
		if Orientation == 'VERTICAL' then
			self:GetThumbTexture():SetTexture(Texture)
			self:GetThumbTexture():SetWidth(self:GetWidth())
			self:GetThumbTexture():SetHeight(6)
			if C["General"]["ClassColorHeaders"] == true then 
				self:GetThumbTexture():SetVertexColor(unpack(ClassColor))
			else
				self:GetThumbTexture():SetVertexColor(0.43, 0.43, 0.43)
			end
		else
			self:GetThumbTexture():SetSize(self:GetHeight() + 4, self:GetHeight())
			self:GetThumbTexture():SetTexture(Texture)
			self:GetThumbTexture():SetWidth(6)
			self:GetThumbTexture():SetHeight(self:GetHeight())
			if C["General"]["ClassColorHeaders"] == true then 
				self:GetThumbTexture():SetVertexColor(unpack(ClassColor))
			else
				self:GetThumbTexture():SetVertexColor(0.43, 0.43, 0.43)
			end
		end
	end	
end
------------------------------------------------------------------------------------------
-- ADD TO API
------------------------------------------------------------------------------------------
Toolkit:Enable()

-- Settings we want to use for T00LKIT
Settings.NormalTexture = C.Medias.Blank
Settings.ShadowTexture = C.Medias.Glow
Settings.DefaultFont = C.Medias.MaxUIFont
Settings.BackdropColor = C.General.BackdropColor
Settings.BorderColor = C.General.BorderColor
Settings.ArrowUpTexture = "Interface\\AddOns\\Tukui\\Medias\\Textures\\Others\\ArrowUp"
Settings.ArrowDownTexture = "Interface\\AddOns\\Tukui\\Medias\\Textures\\Others\\ArrowDown"
Settings.CloseTexture = "Interface\\AddOns\\Tukui\\Medias\\Textures\\Others\\Close"
