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
-- MAXUI STYLE SKINNING
------------------------------------------------------------------------------------------

-- setting up customized skinning functions to skin frames

------------------------------------------------------------------------------------------
-- MAXUI EXTRA SKINNING AND STRIPPING
------------------------------------------------------------------------------------------
API.StripAllRegionTextures = function(self)
	if self.GetNumRegions then
		for i = 1, self:GetNumRegions() do
			local Region = select(i, self:GetRegions())
			if Region and Region:IsObjectType('Texture') then
				Region:Hide()
				Region:SetAlpha(0)
			end
		end
	end
end

API.StripAllForMaxUI = function(self)
	-- strip / kill
	self:StripTextures()
	
	local Children = {self:GetChildren()}
	for _, child in ipairs(Children) do
		child:StripTextures()
	end
	
	if self.NineSlice then
		self.NineSlice:Hide()
		self.NineSlice:SetAlpha(0)
	end

	if self.Inset then
		self.Inset:Hide()
		self.Inset:SetAlpha(0)
	end

	if self.Border then
		self.Border:Hide()
		self.Border:SetAlpha(0)
	end

	--if self["Inset"].NineSlice then
	--	self["Inset"].NineSlice:Hide()
	--	self["Inset"].NineSlice:SetAlpha(0)
	--end

	if self["Border"] then
		self["Border"]:Hide()
		self["Border"]:SetAlpha(0)
	end

	if self["Inset"] then
		self["Inset"]:Hide()
		self["Inset"]:SetAlpha(0)
	end
	
	if self["Bg"] then
		self["Bg"]:Hide()
		self["Bg"]:SetAlpha(0)
	end

	if self["BG"] then
		self["BG"]:Hide()
		self["BG"]:SetAlpha(0)
	end

	if self["Portrait"] then
		self["Portrait"]:Hide()
		self["Portrait"]:SetAlpha(0)
	end

	if self["Icon"] then
		self["Icon"]:Hide()
		self["Icon"]:SetAlpha(0)
	end
end

------------------------------------------------------------------------------------------
-- BASE FRAME: BASIC FRAME BACKDROP AND SHADOW AND HEADER
------------------------------------------------------------------------------------------
API.SkinMaxUIBaseFrame = function(self, Strip, ReAnchor, title)
	if self.IsMaxUISkinned then return end

	-- strip / kill
	if Strip == true then
		self:StripAllForMaxUI()
		--StripAllRegionTextures(self)
	end	
	
	-- create backdrop and shadow
	if not self.Backdrop then
		self:CreateBackdrop("Transparent")
	else
		self.Backdrop:SetAlpha(0.75)
	end
	self.Backdrop:SetFrameLevel(self:GetFrameLevel() - 1)
	self.Backdrop:SetOutside(self)

	if not self.Backdrop.Shadow then
		self.Backdrop:CreateShadow()
	end

	-- create filter
	if C["Skins"]["BackdropFilter"] then 
		self.Backdrop:CreateMaxUIFilter()
	end

	-- create header and reanchor and skin blizzard closebutton
	self:CreateMaxUIHeader(title)

	-- close button reuse
	if self["CloseButton"] then
		self["CloseButton"]:ClearAllPoints()
		self["CloseButton"]:SetPoint("RIGHT", self.MaxUIHeader, "RIGHT", -4, 0)
		self["CloseButton"]:SkinMaxUICloseButton(true)
	end	
	
	-- relocate frame center screen
	if C["Skins"]["MaxUIPositioningBlizzardFrames"] == true and ReAnchor == true then
		self:ClearAllPoints()
		self:SetPoint("TOP", UIParent, "TOP", 0, -100)
		self.ClearAllPoints = function() end
		self.SetPoint = function() end
	end
	self.IsMaxUISkinned = true
end

------------------------------------------------------------------------------------------
-- STANDARD FRAME:BASAIC BACKDROP AND SHADOW
------------------------------------------------------------------------------------------
API.SkinMaxUIFrame = function(self, Strip)
	if self.IsMaxUISkinned then return end
	
	if Strip == true then 
		--StripAllRegionTextures(self)

		if self.NineSlice then
			self.NineSlice:Hide()
			self.NineSlice:SetAlpha(0)
		end

		if self.Inset then
			self.Inset:Hide()
			self.Inset:SetAlpha(0)
		end

		if self.Border then
			self.Border:Hide()
			self.Border:SetAlpha(0)
		end

		if self["Border"] then
			self["Border"]:Hide()
			self["Border"]:SetAlpha(0)
		end

		if self["Inset"] then
			self["Inset"]:Hide()
			self["Inset"]:SetAlpha(0)
		end
		
		if self["Bg"] then
			self["Bg"]:Hide()
			self["Bg"]:SetAlpha(0)
		end

		if self["BG"] then
			self["BG"]:Hide()
			self["BG"]:SetAlpha(0)
		end

		if self["Portrait"] then
			self["Portrait"]:Hide()
			self["Portrait"]:SetAlpha(0)
		end

		if self["Icon"] then
			self["Icon"]:Hide()
			self["Icon"]:SetAlpha(0)
		end
	end

	-- create backdrop and shadow
	if not self.Backdrop then
		self:CreateBackdrop("Transparent")
	else
		self.Backdrop:SetAlpha(C["General"]["GeneralPanelAlpha"])	
		--self.Backdrop:SetAlpha(0.75)	
	end
	self.Backdrop:SetFrameLevel(self:GetFrameLevel())
	self.Backdrop:SetOutside(self)
	
	if not self.Backdrop.Shadow then
		self.Backdrop:CreateShadow()
	end

	-- create filter
	if C["Skins"]["BackdropFilter"] then 
		self.Backdrop:CreateMaxUIFilter()
	end
	self.IsMaxUISkinned = true
end

------------------------------------------------------------------------------------------
-- FRAME: HEADER STYLE
------------------------------------------------------------------------------------------
API.SkinMaxUIHeader = function(self, vertical)
	if self.IsMaxUISkinned then return end
	
	local Texture = T.GetTexture(C.General.HeaderTexture)

	self:CreateBackdrop(nil, Texture)
	self.Backdrop:SetOutside()
	self.Backdrop:CreateShadow()
	
	if C["General"]["ClassColorHeaders"]["Value"] == "Dark" then 
		self.Backdrop:SetBackdropColor(0.11, 0.11, 0.11)
	elseif C["General"]["ClassColorHeaders"]["Value"] == "ClassColor" then 
		self.Backdrop:SetBackdropColor(unpack(ClassColor))
	elseif C["General"]["ClassColorHeaders"]["Value"] == "Grey" then 
		self.Backdrop:SetBackdropColor(unpack(BrightColor))
	elseif C["General"]["ClassColorHeaders"]["Value"] == "BackdropColor" then 
		self.Backdrop:SetBackdropColor(unpack(C.General.BackdropColor))
	elseif C["General"]["ClassColorHeaders"]["Value"] == "Custom" then 
		self.Backdrop:SetBackdropColor(unpack(C["General"]["CustomColor"]))
	else
		self.Backdrop:SetBackdropColor(unpack(BrightColor))
	end

	if C["Skins"]["HeaderFilter"] == true then
		if vertical == true then 
			self.Backdrop:CreateMaxUIVerticalFilter()
		else
			self.Backdrop:CreateMaxUIFilter()
		end	
	end
	self.IsMaxUISkinned = true
end

------------------------------------------------------------------------------------------
-- BUTTON
------------------------------------------------------------------------------------------
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
	
API.SkinMaxUIButton = function(self, Strip, vertical)
	if self.IsMaxUISkinned then return end

	local Texture = T.GetTexture(C.General.TextureButton)
	
	if Strip == true then 
		self:StripAllRegionTextures()
	end	

--[[
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
		
		self:StripTextures()
		
		if self.GetHighlightTexture and self:GetHighlightTexture() then
			self:GetHighlightTexture():SetTexture(nil)
		else
			self:StripTextures()
		end
--]]

	-- button and backdrop
	if self.Backdrop then
		self.Backdrop:ClearBackdrop()
		self.Backdrop:SetBackdrop({bgFile = Texture})
	else
		self:CreateBackdrop(nil, Texture)
	end
	self.Backdrop:SetOutside()
	
	if not self.Backdrop.Shadow then
		self.Backdrop:CreateShadow()
	end	
		
	if C["General"]["ButtonColor"]["Value"] == "Dark" then 
		self.Backdrop:SetBackdropColor(0.11, 0.11, 0.11)
	elseif C["General"]["ButtonColor"]["Value"] == "ClassColor" then 
		self.Backdrop:SetBackdropColor(unpack(ClassColor))
	elseif C["General"]["ButtonColor"]["Value"] == "Grey" then 
		self.Backdrop:SetBackdropColor(unpack(BrightColor))
	elseif C["General"]["ButtonColor"]["Value"] == "BackdropColor" then 
		self.Backdrop:SetBackdropColor(unpack(C.General.BackdropColor))
	elseif C["General"]["ButtonColor"]["Value"] == "Custom" then 
		self.Backdrop:SetBackdropColor(unpack(C["General"]["CustomColor"]))
	else
		self.Backdrop:SetBackdropColor(unpack(BrightColor))
	end

	-- button texture
	self.highlight = self:CreateTexture(nil, "OVERLAY")
	self.highlight:SetAllPoints()
	self.highlight:SetTexture(Texture)
	self.highlight:SetVertexColor(0.5, 0.5, 0.5)
	self.highlight:SetAlpha(0)

	-- button mouseaction (mousover or click)
	self:SetScript("OnMouseDown", ButtonOnMouseDown)
	self:SetScript("OnMouseUp", ButtonOnMouseUp)
	self:SetScript("OnEnter", function(self) 
		ButtonOnEnter(self)
	end)

	self:SetScript("OnLeave", function(self)
		ButtonOnLeave(self)
	end)	

	if C["Skins"]["ButtonFilter"] then 
		if vertical == true then 
			self.Backdrop:CreateMaxUIVerticalFilter()
		else
			self.Backdrop:CreateMaxUIFilter()
		end	
	end
	self.IsMaxUISkinned = true
end

------------------------------------------------------------------------------------------
-- TABS
------------------------------------------------------------------------------------------
local TabOnEnter = function(self)
	self.highlight:SetAlpha(0.3)
end

local TabOnLeave = function(self)
	self.highlight:SetAlpha(0)
end

local TabOnMouseDown = function(self)

end

local TabOnMouseUp = function(self)

end

API.SkinMaxUITab = function(self, Strip)
	if self.IsMaxUISkinned then return end

	local Texture = T.GetTexture(C.General.TextureButton)

	if Strip == true then
		--self:StripTextures()
		self:StripAllRegionTextures()
		
		if self.GetHighlightTexture and self:GetHighlightTexture() then
			self:GetHighlightTexture():SetTexture(nil)
		else
			self:StripTextures()
		end
	end

	if self.Text then
		self.Text:SetAllPoints(self)
	end	

	-- tab backdrop
	if not self.Backdrop then
		self:CreateBackdrop()
	else
		self.Backdrop:SetAlpha(0.75)	
	end
	--self.Backdrop:SetFrameLevel(self:GetParent():GetFrameLevel() - 1)
	self.Backdrop:SetInside()
	--self.Backdrop:SetPoint("TOPLEFT", 4, -3)
	--self.Backdrop:SetPoint("BOTTOMRIGHT", -4, 3)

	if not self.Backdrop.Shadow then
		self.Backdrop:CreateShadow()
	end

	if C["Skins"]["ButtonFilter"] then 
		self.Backdrop:CreateMaxUIFilter()
	end

	-- button texture
	self.highlight = self:CreateTexture(nil, "OVERLAY")
	self.highlight:SetInside()
	self.highlight:SetTexture(Texture)
	self.highlight:SetVertexColor(0.5, 0.5, 0.5)
	self.highlight:SetAlpha(0)

	-- tab mouseaction (mousover or click)
	self:SetScript("OnMouseDown", TabOnMouseDown)
	self:SetScript("OnMouseUp", TabOnMouseUp)
	self:SetScript("OnEnter", function(self) 
		TabOnEnter(self)
	end)
	self:SetScript("OnLeave", function(self)
		TabOnLeave(self)
	end)	

	self.IsMaxUISkinned = true
end

------------------------------------------------------------------------------------------
-- EDITBOX
------------------------------------------------------------------------------------------
API.SkinMaxUIEditBox = function(self, Strip)
	if self.IsMaxUISkinned then return end

	local EditBoxName = self:GetName()

	-- strip / kill
	if Strip == true then
		if self.GetNumRegions then
			for i = 1, self:GetNumRegions() do
				local Region = select(i, self:GetRegions())
				if Region and Region:IsObjectType('Texture') then
					Region:Hide()
				end
			end
		end
	end

	-- create backdrop and shadow
	if not self.Backdrop then
		self:CreateBackdrop("Transparent")
	else
		self.Backdrop:SetAlpha(0.75)	
	end	
	self.Backdrop:SetOutside(self)
	self.Backdrop:SetPoint("TOPLEFT", -8, -1)
	self.Backdrop:SetPoint("BOTTOMRIGHT", 8, 1)
	
	if not self.Backdrop.Shadow then
		self.Backdrop:CreateShadow()
	end

	if EditBoxName and (strfind(EditBoxName, 'Silver') or strfind(EditBoxName, 'Copper')) then
		self.Backdrop:SetPoint("TOPLEFT", -8, -1)
		self.Backdrop:SetPoint("BOTTOMRIGHT", -10, 1)
	end

	-- create filter
	if C["Skins"]["BackdropFilter"] then 
		self.Backdrop:CreateMaxUIFilter()
	end
	self.IsMaxUISkinned = true
end

------------------------------------------------------------------------------------------
-- STATUSBAR
------------------------------------------------------------------------------------------
API.SkinMaxUIStatusBar = function(self, Strip)
	if self.IsMaxUISkinned then return end

	local StatusBarTexture = T.GetTexture(C.General.StatusBarTexture)

	-- strip / kill
	if Strip == true then
		self:StripTextures()
		
		local Children = {self:GetChildren()}
		for _, child in ipairs(Children) do
			child:StripTextures()
		end
	end

	-- statusbar
	self:SetFrameLevel(self:GetFrameLevel()+1)
	self:SetStatusBarTexture(StatusBarTexture)
	
	-- create backdrop and shadow
	if not self.Backdrop then
		self:CreateBackdrop("Transparent")
	else
		self.Backdrop:SetAlpha(0.75)
	end		
	self.Backdrop:SetOutside(self)

	if not self.Backdrop.Shadow then
		self.Backdrop:CreateShadow()
	end

	-- create filter
	if C["Skins"]["BackdropFilter"] then 
		self.Backdrop:CreateMaxUIFilter()
	end
	self.IsMaxUISkinned = true
end

------------------------------------------------------------------------------------------
-- ARROWBUTTONS
------------------------------------------------------------------------------------------
API.SkinMaxUIArrowButton = function(self, Direction)
	if self.IsMaxUISkinned then return end

	-- button
	self:SetSize(self:GetWidth()-8, self:GetHeight()-8)
	
	-- backdrop
	if not self.Backdrop then 
		self:CreateBackdrop("Transparent")
	else
		self.Backdrop:SetAlpha(0.75)
	end
	self.Backdrop:SetOutside(self)

	if not self.Backdrop.Shadow then
		self.Backdrop:CreateShadow()
	end

	if C["Skins"]["ButtonFilter"] then 
		self.Backdrop:CreateMaxUIFilter()
	end

	-- arrow texture direction
	if Direction == Left then
		self:GetNormalTexture():SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowLeft.tga]])

		if self:GetPushedTexture() then
			self:GetPushedTexture():SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowLeft.tga]])
		end

		if self:GetDisabledTexture() then
			self:GetDisabledTexture():SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowLeft.tga]])
		end

	elseif Direction == Right then
		self:GetNormalTexture():SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowRight.tga]])

		if self:GetPushedTexture() then
			self:GetPushedTexture():SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowRight.tga]])
		end

		if self:GetDisabledTexture() then
			self:GetDisabledTexture():SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowRight.tga]])
		end
		
	elseif Direction == Up then
		self:GetNormalTexture():SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowUp.tga]])

		if self:GetPushedTexture() then
			self:GetPushedTexture():SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowUp.tga]])
		end

		if self:GetDisabledTexture() then
			self:GetDisabledTexture():SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowUp.tga]])
		end
		
	elseif Direction == Down then
		self:GetNormalTexture():SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowDown.tga]])

		if self:GetPushedTexture() then
			self:GetPushedTexture():SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowDown.tga]])
		end

		if self:GetDisabledTexture() then
			self:GetDisabledTexture():SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowDown.tga]])
		end
	end

	-- texture position and size
	self:GetNormalTexture():ClearAllPoints()
	self:GetNormalTexture():SetPoint("CENTER")
	self:GetNormalTexture():SetSize(12, 12)

	-- darken arrow when disabled
	if self:GetDisabledTexture() then
		self:GetDisabledTexture():SetAllPoints(self:GetNormalTexture())
		self:GetDisabledTexture():SetAlpha(0.5)
	end

	-- pushed effect
	if self:GetPushedTexture() then
		self:GetPushedTexture():SetAllPoints(self:GetNormalTexture())
	end

	-- highlighting/mouseover
	self:GetHighlightTexture():SetColorTexture(1, 1, 1, 0.3)
	self:GetHighlightTexture():SetAllPoints(self)
	
	self.IsMaxUISkinned = true
end

------------------------------------------------------------------------------------------
-- SCROLLBAR OLD
------------------------------------------------------------------------------------------
API.SkinMaxUIScrollBar = function(self, Strip)
	if self.IsMaxUISkinned then return end

	local Texture = T.GetTexture(C.General.TextureButton)
	local ScrollUpButton = _G[self:GetName().."ScrollUpButton"]
	local ScrollDownButton = _G[self:GetName().."ScrollDownButton"]
	local Thumb = self:GetThumbTexture()
	--local Thumb = self:GetThumb()
	
	if Strip == true then
		self:StripTextures()
		
		local Children = {self:GetChildren()}
		for _, child in ipairs(Children) do
			child:StripTextures()
		end

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
			ScrollDownButton:StripTextures()
		end
	end

	if ScrollUpButton and ScrollDownButton then
		
	-- Scroll Up Button
		ScrollUpButton:CreateBackdrop("Transparent")
		ScrollUpButton.Backdrop:CreateShadow()
		ScrollUpButton.Backdrop:SetOutside(ScrollUpButton)
		
		if C["Skins"]["ButtonFilter"] then 
			ScrollUpButton.Backdrop:CreateMaxUIFilter()
		end

		ScrollUpButton:GetNormalTexture():SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowUp.tga]])

		if ScrollUpButton:GetPushedTexture() then
			ScrollUpButton:GetPushedTexture():SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowUp.tga]])
		end

		if ScrollUpButton:GetDisabledTexture() then
			ScrollUpButton:GetDisabledTexture():SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowUp.tga]])
		end

		-- texture position and size
		ScrollUpButton:GetNormalTexture():ClearAllPoints()
		ScrollUpButton:GetNormalTexture():SetPoint("CENTER")
		ScrollUpButton:GetNormalTexture():SetSize(12, 12)

		-- darken arrow when disabled
		if ScrollUpButton:GetDisabledTexture() then
			ScrollUpButton:GetDisabledTexture():SetAllPoints(ScrollUpButton:GetNormalTexture())
			ScrollUpButton:GetDisabledTexture():SetAlpha(0.5)
		end

		-- pushed effect
		if ScrollUpButton:GetPushedTexture() then
			ScrollUpButton:GetPushedTexture():SetAllPoints(ScrollUpButton:GetNormalTexture())
		end

		-- highlighting/mouseover
		--ScrollUpButton:GetHighlightTexture():SetColorTexture(1, 1, 1, 0.3)
		--ScrollUpButton:GetHighlightTexture():SetAllPoints(ScrollUpButton)

		-- Scroll Down Button
		
		-- backdrop
		ScrollDownButton:CreateBackdrop("Transparent")
		ScrollDownButton.Backdrop:CreateShadow()
		ScrollDownButton.Backdrop:SetOutside(ScrollDownButton)
		
		if C["Skins"]["ButtonFilter"] then 
			ScrollDownButton.Backdrop:CreateMaxUIFilter()
		end

		ScrollDownButton:GetNormalTexture():SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowDown.tga]])

		if ScrollDownButton:GetPushedTexture() then
			ScrollDownButton:GetPushedTexture():SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowDown.tga]])
		end

		if ScrollDownButton:GetDisabledTexture() then
			ScrollDownButton:GetDisabledTexture():SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowDown.tga]])
		end

		-- texture position and size
		ScrollDownButton:GetNormalTexture():ClearAllPoints()
		ScrollDownButton:GetNormalTexture():SetPoint("CENTER")
		ScrollDownButton:GetNormalTexture():SetSize(12, 12)

		-- darken arrow when disabled
		if ScrollDownButton:GetDisabledTexture() then
			ScrollDownButton:GetDisabledTexture():SetAllPoints(ScrollDownButton:GetNormalTexture())
			ScrollDownButton:GetDisabledTexture():SetAlpha(0.5)
		end

		-- pushed effect
		if ScrollDownButton:GetPushedTexture() then
			ScrollDownButton:GetPushedTexture():SetAllPoints(ScrollDownButton:GetNormalTexture())
		end

		-- highlighting/mouseover
		--ScrollDownButton:GetHighlightTexture():SetColorTexture(1, 1, 1, 0.3)
		--ScrollDownButton:GetHighlightTexture():SetAllPoints(ScrollDownButton)
	end	

	-- track bar
	if not self.trackbg then
		self.trackbg = CreateFrame("Frame", nil, self)
		self.trackbg:SetPoint("TOPLEFT", ScrollUpButton, "BOTTOMLEFT", 0, -1)
		self.trackbg:SetPoint("BOTTOMRIGHT", ScrollDownButton, "TOPRIGHT", 0, 1)
		
		self.trackbg:CreateBackdrop("Transparent")
		self.trackbg.Backdrop:SetFrameLevel(self:GetFrameLevel())
		self.trackbg.Backdrop:CreateShadow()

		if C["Skins"]["BackdropFilter"] then 
			self.trackbg.Backdrop:CreateMaxUIVerticalFilter()
		end
	else	
		if C["Skins"]["BackdropFilter"] then 
			self.trackbg.Backdrop:CreateMaxUIVerticalFilter()
		end
	end

	-- thumb slider
	if Thumb then
		Thumb.Backdrop = CreateFrame("Frame", nil, self, "BackdropTemplate")
		Thumb.Backdrop:SetAllPoints(self:GetThumbTexture())
		Thumb.Backdrop:SetFrameLevel(self.trackbg:GetFrameLevel()+10)
		Thumb.Backdrop:ClearBackdrop()
		Thumb.Backdrop:SetBackdrop({bgFile = Texture})

		if C["Skins"]["ButtonFilter"] then 
			Thumb.Backdrop:CreateMaxUIFilter()
		end

		if C["General"]["ButtonColor"]["Value"] == "Dark" then 
			Thumb.Backdrop:SetBackdropColor(0.11, 0.11, 0.11)
		elseif C["General"]["ButtonColor"]["Value"] == "ClassColor" then 
			Thumb.Backdrop:SetBackdropColor(unpack(ClassColor))
		elseif C["General"]["ButtonColor"]["Value"] == "Grey" then 
			Thumb.Backdrop:SetBackdropColor(unpack(BrightColor))
		elseif C["General"]["ButtonColor"]["Value"] == "BackdropColor" then 
			Thumb.Backdrop:SetBackdropColor(unpack(C.General.BackdropColor))
		elseif C["General"]["ButtonColor"]["Value"] == "Custom" then 
			Thumb.Backdrop:SetBackdropColor(unpack(C["Skins"]["CustomSkinsColor"]))
		else
			Thumb.Backdrop:SetBackdropColor(unpack(BrightColor))
		end
	end
	self.IsMaxUISkinned = true
end

------------------------------------------------------------------------------------------
-- SCROLLBAR NEW
------------------------------------------------------------------------------------------
API.SkinMaxUIScrollBarNew = function(self, Strip)
	if self.IsMaxUISkinned then return end

	local Texture = T.GetTexture(C.General.TextureButton)
	local ScrollUpButton = self["Back"]
	local ScrollDownButton = self["Forward"]
	local thumb = self:GetThumb()
	
	if Strip == true then
		self:StripTextures()
		self.Track:StripTextures()

		local Children = {self:GetChildren()}
		for _, child in ipairs(Children) do
			child:StripTextures()
		end
		
		if ScrollUpButton and ScrollDownButton then
			ScrollUpButton:StripTextures()
			ScrollDownButton:StripTextures()
		end
	end

	if ScrollUpButton and ScrollDownButton then
		
		-- Scroll Up Button
		ScrollUpButton.Texture:Kill()
		
		ScrollUpButton:CreateBackdrop("Transparent")
		ScrollUpButton.Backdrop:CreateShadow()
		ScrollUpButton.Backdrop:SetOutside(ScrollUpButton)

		if C["Skins"]["ButtonFilter"] then 
			ScrollUpButton.Backdrop:CreateMaxUIFilter()
		end
		
		ScrollUpButton:SetNormalTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowUp.tga]])
		--ScrollUpButton:SetPushedTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowUp.tga]])
		ScrollUpButton:SetDisabledTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowUp.tga]])
		ScrollUpButton:GetDisabledTexture():SetAlpha(0.3)
		if ScrollUpButton.Overlay then
			ScrollUpButton.Overlay:Hide()
		end

		-- Scroll Down Button
		ScrollDownButton.Texture:Kill()

		ScrollDownButton:CreateBackdrop("Transparent")
		ScrollDownButton.Backdrop:CreateShadow()
		ScrollDownButton.Backdrop:SetOutside(ScrollDownButton)
		
		if C["Skins"]["ButtonFilter"] then 
			ScrollDownButton.Backdrop:CreateMaxUIFilter()
		end
		
		ScrollDownButton:SetNormalTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowDown.tga]])
		--ScrollDownButton:SetPushedTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowDown.tga]])
		ScrollDownButton:SetDisabledTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowDown.tga]])
		ScrollDownButton:GetDisabledTexture():SetAlpha(0.5)
		if ScrollDownButton.Overlay then
			ScrollDownButton.Overlay:Hide()
		end
	end
			
	-- track bar
	if not self.trackbg then
		self.trackbg = CreateFrame("Frame", nil, self)
		self.trackbg:SetPoint("TOPLEFT", ScrollUpButton, "BOTTOMLEFT", 0, -1)
		self.trackbg:SetPoint("BOTTOMRIGHT", ScrollDownButton, "TOPRIGHT", 0, 1)
		
		self.trackbg:CreateBackdrop("Transparent")
		self.trackbg.Backdrop:SetFrameLevel(self:GetFrameLevel())
		self.trackbg.Backdrop:CreateShadow()
	end

	if C["Skins"]["BackdropFilter"] then 
		self.trackbg.Backdrop:CreateMaxUIVerticalFilter()
	end

	-- thumb slider
	if thumb then
		thumb:DisableDrawLayer('BACKGROUND')
		thumb:SetHeight(8)
		thumb:SetWidth(self.trackbg:GetWidth())
		thumb:SkinMaxUIButton(true, true)
	end	
	self.IsMaxUISkinned = true
end
------------------------------------------------------------------------------------------
-- CLOSEBUTTON
------------------------------------------------------------------------------------------
API.SkinMaxUICloseButton = function(self, Strip)
	if self.IsMaxUISkinned then return end

	if Strip == true then
		self:SetNormalTexture("")
		self:SetPushedTexture("")
		self:SetHighlightTexture("")
		self:SetDisabledTexture("")

		self:GetNormalTexture():Kill()
		self:GetPushedTexture():Kill()
		self:GetHighlightTexture():Kill()
		self:GetDisabledTexture():Kill()
	end

	self.Texture = self:CreateTexture(nil, "OVERLAY")
	self.Texture:SetPoint("CENTER", OffsetX or 0, OffsetY or 0)
	self.Texture:SetSize(12, 12)
	self.Texture:SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\Close.tga]])

	self:SetScript("OnEnter", function(self) self.Texture:SetVertexColor(1, 0, 0) end)
	self:SetScript("OnLeave", function(self) self.Texture:SetVertexColor(1, 1, 1) end)
	
	self.IsMaxUISkinned = true
end

------------------------------------------------------------------------------------------
-- DROPDOWN
------------------------------------------------------------------------------------------
API.SkinMaxUIDropDown = function(self, Strip, Width)
	if self.IsMaxUISkinned then return end

	local Button = _G[self:GetName().."Button"] 
	local Text = _G[self:GetName().."Text"]

	-- strip / kill
	if Strip == true then 
		self:StripTextures()

		local Children = {self:GetChildren()}
		for _, child in ipairs(Children) do
			child:StripTextures()
		end
	end

	-- text field
	self:SetWidth(Width)
	self:SetHeight(20)
	
	self:CreateBackdrop("Transparent")
	self.Backdrop:SetPoint("TOPLEFT", 0, -3)
	self.Backdrop:SetPoint("BOTTOMRIGHT", 0, 4)
	self.Backdrop:CreateShadow()

	Text:ClearAllPoints()
	Text:SetPoint("LEFT", self, "LEFT", 4, 0)

	if C["Skins"]["BackdropFilter"] then 
		self.Backdrop:CreateMaxUIFilter()
	end

	-- dropdown button
	Button:ClearAllPoints()
	Button:SetPoint("RIGHT", self, "RIGHT", 0, 0)
	Button:SetSize(24, 24)
	--Button:CreateBackdrop("Transparent")
	--Button.Backdrop:CreateShadow()
	Button.SetPoint = Noop

	if Vertical then
		Button:GetNormalTexture():SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\ArrowDown.tga]])

		if Button:GetPushedTexture() then
			Button:GetPushedTexture():SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\ArrowUp.tga]])
		end

		if Button:GetDisabledTexture() then
			Button:GetDisabledTexture():SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\ArrowDown.tga]])
		end
	else
		Button:GetNormalTexture():SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\ArrowDown.tga]])

		if Button:GetPushedTexture() then
			Button:GetPushedTexture():SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\ArrowUp.tga]])
		end

		if Button:GetDisabledTexture() then
			Button:GetDisabledTexture():SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\ArrowDown.tga]])
		end
	end

	Button:GetNormalTexture():ClearAllPoints()
	Button:GetNormalTexture():SetPoint("CENTER")
	Button:GetNormalTexture():SetSize(12, 12)

	if Button:GetDisabledTexture() then
		Button:GetDisabledTexture():SetAllPoints(Button:GetNormalTexture())
		Button:GetDisabledTexture():SetAlpha(0.5)
	end

	if Button:GetPushedTexture() then
		Button:GetPushedTexture():SetAllPoints(Button:GetNormalTexture())
	end

	Button:GetHighlightTexture():SetColorTexture(1, 1, 1, 0.3)
	Button:GetHighlightTexture():SetAllPoints(Button)
	
	--if C["Skins"]["ButtonFilter"] then 
		--Button:CreateMaxUIFilter()
	--end

	self.IsMaxUISkinned = true
end

------------------------------------------------------------------------------------------
-- CHECKBOX
------------------------------------------------------------------------------------------
API.SkinMaxUICheckBox = function(self, Strip)
	if self.IsMaxUISkinned then return end
	
	-- strip / kill
	if Strip == true then
		self:StripTextures()
	end
			
	if Strip == StripChildren then	
		self:StripTextures()

		local Children = {self:GetChildren()}
		for _, child in ipairs(Children) do
			child:StripTextures()
		end
	end
	
	-- box
	self:SetSize(18, 18)

	self:CreateBackdrop("Transparent")
	self.Backdrop:CreateShadow()
	self.Backdrop:SetOutside(self)
	
	if C["Skins"]["ButtonFilter"] then 
		self.Backdrop:CreateMaxUIFilter()
	end

	-- check mark
	if self.SetCheckedTexture then
		self:SetCheckedTexture([[Interface\AddOns\MaxUI\Medias\Icons\Role\check.tga]])
		self:GetCheckedTexture():SetDrawLayer("OVERLAY", 4)
	end

	if self.SetDisabledCheckedTexture then
		self:SetDisabledCheckedTexture([[Interface\AddOns\MaxUI\Medias\Icons\Role\checkgrey.tga]])
		self:GetDisabledCheckedTexture():SetDrawLayer("OVERLAY", 4)
	end

	self:HookScript("OnDisable", function(self)
		if not self.SetDisabledTexture then return end
		
		if self:GetChecked() then
			self:SetDisabledTexture([[Interface\AddOns\MaxUI\Medias\Icons\Role\checkgrey.tga]])
			self:GetDisabledTexture():SetDrawLayer("OVERLAY", 4)
		else
			self:SetDisabledTexture("")
			self:GetDisabledTexture():SetDrawLayer("OVERLAY", 4)
		end
	end)

	self.SetNormalTexture = Noop
	self.SetPushedTexture = Noop
	self.SetHighlightTexture = Noop
	
	self.IsMaxUISkinned = true
end

------------------------------------------------------------------------------------------
-- RADIOBUTTON
------------------------------------------------------------------------------------------
API.SkinMaxUIRadioButton = function(self)
	if self.isMaxUISkinned then return end

	local background = [[Interface\AddOns\MaxUI\Medias\Icons\Custom\threat.tga]]

	local InsideMask = self:CreateMaskTexture()
	InsideMask:SetTexture(background, 'CLAMPTOBLACKADDITIVE', 'CLAMPTOBLACKADDITIVE')
	InsideMask:SetSize(18, 18)
	InsideMask:SetPoint('CENTER')
	self.InsideMask = InsideMask

	local OutsideMask = self:CreateMaskTexture()
	OutsideMask:SetTexture(background, 'CLAMPTOBLACKADDITIVE', 'CLAMPTOBLACKADDITIVE')
	OutsideMask:SetSize(20, 20)
	OutsideMask:SetPoint('CENTER')
	self.OutsideMask = OutsideMask

	self:SetCheckedTexture([[Interface\AddOns\MaxUI\Medias\Icons\Role\check.tga]])
	self:SetNormalTexture([[Interface\AddOns\MaxUI\Medias\Icons\Custom\threat.tga]])
	self:SetHighlightTexture([[Interface\AddOns\MaxUI\Medias\Icons\Role\checkgrey.tga]])
	self:SetDisabledTexture([[Interface\AddOns\MaxUI\Medias\Icons\Custom\threat.tga]])

	local Check = self:GetCheckedTexture()
	Check:SetTexCoord(0, 1, 0, 1)
	Check:SetOutside()
	Check:AddMaskTexture(InsideMask)

	local Highlight = self:GetHighlightTexture()
	Highlight:SetTexCoord(0, 1, 0, 1)
	Highlight:AddMaskTexture(InsideMask)

	local Normal = self:GetNormalTexture()
	Normal:SetInside()
	Normal:SetTexCoord(0, 1, 0, 1)
	Normal:SetVertexColor(0.43, 0.43, 0.43)
	Normal:AddMaskTexture(OutsideMask)

	local Disabled = self:GetDisabledTexture()
	Disabled:SetInside()
	Disabled:SetTexCoord(0, 1, 0, 1)
	Disabled:SetVertexColor(0.34, 0.34, 0.34)
	Disabled:AddMaskTexture(OutsideMask)

	self.isMaxUISkinned = true
end
------------------------------------------------------------------------------------------
-- SLIDER
------------------------------------------------------------------------------------------
API.SkinMaxUISlider = function(self, Strip)
	if self.isMaxUISkinned then return end

	local Texture = T.GetTexture(C.General.TextureButton)

	if Strip == Strip then 
		self:StripTextures()

		local Children = {self:GetChildren()}
		for _, child in ipairs(Children) do
			child:StripTextures()
		end

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
	end

	-- slider frame
	self:CreateBackdrop("Transparent")
	self.Backdrop:SetAllPoints()
	self.Backdrop:CreateShadow()
	self.Backdrop:SetFrameLevel(self:GetFrameLevel())

	-- thumb slider
	if self:GetThumbTexture() then
		
		local Orientation = self:GetOrientation()
		if Orientation == 'VERTICAL' then
			--self:GetThumbTexture():SetTexture(Texture)
			self:GetThumbTexture():SetWidth(self:GetWidth())
			self:GetThumbTexture():SetHeight(6)
		else
			self:GetThumbTexture():SetSize(self:GetHeight() + 4, self:GetHeight())
			--self:GetThumbTexture():SetTexture(Texture)
			self:GetThumbTexture():SetWidth(6)
			self:GetThumbTexture():SetHeight(self:GetHeight())
		end

		self:GetThumbTexture():SetTexture(Texture)

		if C["General"]["ButtonColor"]["Value"] == "Dark" then 
			self:GetThumbTexture():SetVertexColor(0.11, 0.11, 0.11)
		elseif C["General"]["ButtonColor"]["Value"] == "ClassColor" then 
			self:GetThumbTexture():SetVertexColor(unpack(ClassColor))
		elseif C["General"]["ButtonColor"]["Value"] == "Grey" then 
			self:GetThumbTexture():SetVertexColor(unpack(BrightColor))
		elseif C["General"]["ButtonColor"]["Value"] == "BackdropColor" then 
			self:GetThumbTexture():SetVertexColor(unpack(C.General.BackdropColor))
		elseif C["General"]["ButtonColor"]["Value"] == "Custom" then 
			self:GetThumbTexture():SetVertexColor(unpack(C["Skins"]["CustomSkinsColor"]))
		else
			self:GetThumbTexture():SetVertexColor(unpack(BrightColor))
		end

		self:GetThumbTexture().Backdrop = CreateFrame("Frame", nil, self, "BackdropTemplate")
		self:GetThumbTexture().Backdrop:SetAllPoints(self:GetThumbTexture())
		self:GetThumbTexture().Backdrop:SetFrameLevel(self:GetFrameLevel())

		if C["Skins"]["ButtonFilter"] then 
			self:GetThumbTexture().Backdrop:CreateMaxUIFilter()
		end
	end
	self.isMaxUISkinned = true
end

------------------------------------------------------------------------------------------
-- OTHER SKINNING TOOLS
------------------------------------------------------------------------------------------
API.SkinMaxUIIcon = function(self, Strip, CreateIconBackdrop)
	if self.isMaxUISkinned then return end

	if Strip == true then
		self:StripTextures()
	end

	if self.IconBorder then
		self.IconBorder:SetAlpha(0)
	end

	self:SetTexCoord(unpack(T.IconCoord))
	self:SetDrawLayer("ARTWORK", 2)

	if CreateIconBackdrop == true then
		local Icon = self:GetParent()
		
		if not Icon.hasBackdrop then
			local IconBackdrop = CreateFrame("Frame", nil, Icon)
			IconBackdrop:SkinMaxUIFrame()
			IconBackdrop:SetAllPoints(self)
			IconBackdrop:SetFrameLevel(1)
			
			Icon.hasBackdrop = true
		end	
	end
	self.isMaxUISkinned = true
end

API.SkinMaxUIIcon2 = function(b, setInside)
	if b.isMaxUISkinned then return end

	local name = b:GetName()
	local icon = b.icon or b.Icon or b.IconTexture or b.iconTexture or (name and (_G[name..'IconTexture'] or _G[name..'Icon']))
	local texture = icon and icon.GetTexture and icon:GetTexture()

	b:StripTextures()
	b:CreateBackdrop("Transparent")
	b:StyleButton() --?

	if icon then
		icon:SetTexCoord(unpack(T.IconCoord))

		if setInside then
			icon:SetInside(b)
		else
			b.Backdrop:SetOutside()
		end

		icon:SetParent(b.Backdrop)

		if texture then
			icon:SetTexture(texture)
		end
	end

	b.isMaxUISkinned = true
end

------------------------------------------------------------------------------------------
-- SHADOW
------------------------------------------------------------------------------------------
API.SkinMaxUIShadow = function(self)
	if self.isMaxUISkinned then return end

	local Shadow = self.Shadow
	
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
	self.isMaxUISkinned = true
end

------------------------------------------------------------------------------------------
-- ADD TO API
------------------------------------------------------------------------------------------
Toolkit:Enable()