------------------------------------------------------------------------------------------
-- MaxUI 6 - SHADOWLANDS / TUKUI 20
-- latest update: 30-10-2020
------------------------------------------------------------------------------------------

-- setting up AddonSkins Adjustments

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
if not IsAddOnLoaded('AddonSkins') then 
	return
end

local AS, ASL = unpack(AddOnSkins)
if not AS:CheckAddOn('Tukui') then return end
local T, C

function AS:UpdateMedia()
	if not Tukui then return end
	if not T then T, C = Tukui:unpack()	end
	
	local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
	AS.Color = {unpack(ClassColor)}

	AS.HideShadows = C.General.HideShadows

	AS.DataTextFontSize = 12
	AS.DataTexts = T.DataTexts
	AS.InfoLeft = T.DataTexts.Panels.Left
	AS.InfoRight = T.DataTexts.Panels.Right
	AS.ChatBackgroundRight = T.Chat.Panels and T.Chat.Panels.RightChat
	AS.ChatBackgroundLeft = T.Chat.Panels and T.Chat.Panels.LeftChat
	AS.TabsRightBackground = T.Chat.Panels and T.Chat.Panels.RightChatTabs
	AS.TabsLeftBackground = T.Chat.Panels and T.Chat.Panels.LeftChatTabs
	AS.Minimap = T.Maps.Minimap
	AS.ActionBar1 = T.ActionBars.Bars and T.ActionBars.Bars.Bar1
	AS.ActionBar2 = T.ActionBars.Bars and T.ActionBars.Bars.Bar2
	AS.ActionBar3 = T.ActionBars.Bars and T.ActionBars.Bars.Bar3
	AS.ActionBar4 = T.ActionBars.Bars and T.ActionBars.Bars.Bar4

	AS.Blank = C.Medias.Blank
	AS.NormTex = C.Medias.Normal
	AS.Font = C.Medias.Font
	AS.BackdropColor = C.General.BackdropColor
	AS.BorderColor = C.General.BorderColor
end

------------------------------------------------------------------------------------------
-- ADDONSKINS MAXUI STYLE
------------------------------------------------------------------------------------------
-- SKINNING EDITBOXFRAMES

-- SKINNING DROPDOWNBOXES

-- SKINNING ARROWBUTTON
local AS_SkinArrowButton = AS.SkinArrowButton
function AS:SkinArrowButton(object, Arrow)
	AS_SkinArrowButton(self, object, Arrow)

	if not Tukui then return end
	if not T then T, C = Tukui:unpack()	end
	if not C["Skins"]["MaxUIAddOnSkins"] then return end

	local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}

	if object:IsObjectType("Button") then
		local Button = object

		local Normal, Disabled, Pushed = Button:GetNormalTexture(), Button:GetDisabledTexture(), Button:GetPushedTexture()
			
		Button:HookScript('OnEnter', function(self)
			if C["Skins"]["Color"]["Value"] == "Dark" then 
				self:SetBackdropBorderColor(unpack(ClassColor))
			elseif C["Skins"]["Color"]["Value"] == "ClassColor" then 
				self:SetBackdropBorderColor(unpack(ClassColor))
			elseif C["Skins"]["Color"]["Value"] == "BackdropColor" then 
				self:SetBackdropBorderColor(unpack(C.General.BackdropColor))
			else
				self:SetBackdropBorderColor(0.43, 0.43, 0.43)
			end

			if C["Skins"]["Color"]["Value"] == "Dark" then 
				Normal:SetVertexColor(unpack(ClassColor))
			elseif C["Skins"]["Color"]["Value"] == "ClassColor" then 
				Normal:SetVertexColor(unpack(ClassColor))
			elseif C["Skins"]["Color"]["Value"] == "BackdropColor" then 
				Normal:SetVertexColor(unpack(C.General.BackdropColor))
			else
				Normal:SetVertexColor(0.43, 0.43, 0.43)
			end
		end)
		Button:HookScript('OnLeave', function(self) self:SetBackdropBorderColor(unpack(AS.BorderColor)) Normal:SetVertexColor(1, 1, 1) end)
	end
end

-- SKINNING CHECKBOXES
local AS_SkinCheckBox = AS.SkinCheckBox
function AS:SkinCheckBox(CheckBox)
	AS_SkinCheckBox(self, CheckBox)
	
	if not Tukui then return end
	if not T then T, C = Tukui:unpack()	end
	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	
	local Texture = T.GetTexture(C.General.HeaderTexture)
	local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
	
	CheckBox:SetCheckedTexture(Texture)
	CheckBox:GetCheckedTexture():SetInside(CheckBox.Backdrop)
	
	if C["Skins"]["Color"]["Value"] == "Dark" then 
		CheckBox:GetCheckedTexture():SetVertexColor(unpack(ClassColor))
	elseif C["Skins"]["Color"]["Value"] == "ClassColor" then 
		CheckBox:GetCheckedTexture():SetVertexColor(unpack(ClassColor))
	elseif C["Skins"]["Color"]["Value"] == "BackdropColor" then 
		CheckBox:GetCheckedTexture():SetVertexColor(unpack(C.General.BackdropColor))
	else
		CheckBox:GetCheckedTexture():SetVertexColor(0.43, 0.43, 0.43)
	end
end

-- SKINNING SCROLLBARS
AS_SkinScrollBar = AS.SkinScrollBar
function AS:SkinScrollBar(Frame)
	AS_SkinScrollBar(self, Frame)
	
	if not Tukui then return end
	if not T then T, C = Tukui:unpack()	end
	if not C["Skins"]["MaxUIAddOnSkins"] then return end

	local Thumb = Frame.Thumb
	local Texture = T.GetTexture(C.General.HeaderTexture)
	local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}

	Thumb.Backdrop:Hide()
	Thumb.Backdrop:HookScript('OnEnter', function(self) end)
	Thumb.Backdrop:HookScript('OnLeave', function(self) end)
	Thumb:SetTexture(Texture)
	Thumb:SetHeight(6)
	Thumb:SetWidth(Frame:GetWidth()-2)
	if C["Skins"]["Color"]["Value"] == "Dark" then 
		Thumb:SetVertexColor(0.11, 0.11, 0.11)
	elseif C["Skins"]["Color"]["Value"] == "ClassColor" then 
		Thumb:SetVertexColor(unpack(ClassColor))
	elseif C["Skins"]["Color"]["Value"] == "BackdropColor" then 
		Thumb:SetVertexColor(unpack(C.General.BackdropColor))
	else
		Thumb:SetVertexColor(0.43, 0.43, 0.43)
	end
	
	Frame.Backdrop:SetAlpha(0.75)
end

-- SKINNING SLIDERS
local AS_SkinSlideBar = AS.SkinSlideBar
function AS:SkinSlideBar(Frame, MoveText)
	AS_SkinSlideBar(self, Frame, MoveText)

	if not Tukui then return end
	if not T then T, C = Tukui:unpack()	end
	if not C["Skins"]["MaxUIAddOnSkins"] then return end

	local Texture = T.GetTexture(C.General.HeaderTexture)
	local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}

	Frame.ThumbBG:Hide()
	
	Frame:StripTextures()
	Frame:CreateBackdrop()
	Frame.Backdrop:SetAllPoints()
	Frame.Backdrop:SetFrameLevel(Frame:GetFrameLevel())

	if Frame:GetThumbTexture() then
		local Orientation = Frame:GetOrientation()
		if Orientation == 'VERTICAL' then
			Frame:GetThumbTexture():SetTexture(Texture)
			Frame:GetThumbTexture():SetWidth(Frame:GetWidth()-4)
			Frame:GetThumbTexture():SetHeight(6)
			if C["Skins"]["Color"]["Value"] == "Dark" then 
				Frame:GetThumbTexture():SetVertexColor(0.11, 0.11, 0.11)
			elseif C["Skins"]["Color"]["Value"] == "ClassColor" then 
				Frame:GetThumbTexture():SetVertexColor(unpack(ClassColor))
			elseif C["Skins"]["Color"]["Value"] == "BackdropColor" then 
				Frame:GetThumbTexture():SetVertexColor(unpack(C.General.BackdropColor))
			else
				Frame:GetThumbTexture():SetVertexColor(0.43, 0.43, 0.43)
			end
		else
			Frame:GetThumbTexture():SetTexture(Texture)
			Frame:GetThumbTexture():SetWidth(6)
			Frame:GetThumbTexture():SetHeight(Frame:GetHeight()-2)
			if C["Skins"]["Color"]["Value"] == "Dark" then 
				Frame:GetThumbTexture():SetVertexColor(0.11, 0.11, 0.11)
			elseif C["Skins"]["Color"]["Value"] == "ClassColor" then 
				Frame:GetThumbTexture():SetVertexColor(unpack(ClassColor))
			elseif C["Skins"]["Color"]["Value"] == "BackdropColor" then 
				Frame:GetThumbTexture():SetVertexColor(unpack(C.General.BackdropColor))
			else
				Frame:GetThumbTexture():SetVertexColor(0.43, 0.43, 0.43)
			end
		end
	end	
end

-- SKINNING STANDARD BUTTONS
local AS_SkinButton = AS.SkinButton
function AS:SkinButton(Button, Strip)
	AS_SkinButton(self, Button, Strip)

	local Texture = T.GetTexture(C.General.HeaderTexture)
	local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}

	if not Tukui then return end
	if not T then T, C = Tukui:unpack()	end
	if not C["Skins"]["MaxUIAddOnSkins"] then return end

	Button.Texture = Button:CreateTexture(nil, "BORDER")
	Button.Texture:SetTexture(Texture)
	Button.Texture:SetInside()
	
	if C["Skins"]["Color"]["Value"] == "Dark" then 
		Button.Texture:SetVertexColor(0.11, 0.11, 0.11)
	elseif C["Skins"]["Color"]["Value"] == "ClassColor" then 
		Button.Texture:SetVertexColor(unpack(ClassColor))
	elseif C["Skins"]["Color"]["Value"] == "BackdropColor" then 
		Button.Texture:SetVertexColor(unpack(C.General.BackdropColor))
	else
		Button.Texture:SetVertexColor(0.43, 0.43, 0.43)
	end
	
	Button:CreateBackdrop()
	Button.Backdrop:SetOutside()

	Button:HookScript('OnEnter', function(self)
		if C["Skins"]["Color"]["Value"] == "Dark" then 
			self:SetBackdropBorderColor(unpack(ClassColor))
		elseif C["Skins"]["Color"]["Value"] == "ClassColor" then 
			self:SetBackdropBorderColor(unpack(ClassColor))
		elseif C["Skins"]["Color"]["Value"] == "BackdropColor" then 
			self:SetBackdropBorderColor(unpack(C.General.BackdropColor))
		else
			self:SetBackdropBorderColor(0.43, 0.43, 0.43)
		end
	end)
	
	Button:HookScript('OnLeave', function(self) self:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
	
	if (Shadows) then
		Button:CreateShadow()
	end
end

-- SKINNING CLOSE BUTTONS
local AS_SkinCloseButton = AS.SkinCloseButton
function AS:SkinCloseButton(Button, Reposition)
	AS_SkinCloseButton(self, Button, Reposition)
	
	if not C["Skins"]["MaxUIAddOnSkins"] then return end

	--local Mask = Button.Mask
	--Mask:SetSize(12, 12)

	Button.Backdrop:SetBackdropColor(0, 0, 0, 0)
	Button.Backdrop:SetBackdropBorderColor(0, 0, 0, 0)
	
	Button:HookScript('OnEnter', function(self)
		self:GetNormalTexture():SetVertexColor(1, .2, .2)
		self.Backdrop:SetBackdropBorderColor(0, 0, 0, 0)
	end)

	Button:HookScript('OnLeave', function(self)
		self:GetNormalTexture():SetVertexColor(1, 1, 1)
		self.Backdrop:SetBackdropBorderColor(0, 0, 0, 0)
	end)
end

-- SKINNING ICON BUTTONS
local AS_SkinIconButton = AS.SkinIconButton
function AS:SkinIconButton(Button)
	AS_SkinIconButton(self, Button)
	
	if not Tukui then return end
	if not T then T, C = Tukui:unpack()	end
	if not C["Skins"]["MaxUIAddOnSkins"] then return end

	--Button.Backdrop:Kill()
end



local AS_SkinTab = AS.SkinTab
function AS:SkinTab(Tab)
	AS_SkinTab(self, Tab)
	
	if not Tukui then return end
	if not T then T, C = Tukui:unpack()	end
	if not C["Skins"]["MaxUIAddOnSkins"] then return end

	local Texture = T.GetTexture(C.General.HeaderTexture)
	local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
	
	Tab.Backdrop:CreateShadow()

	Tab.Texture = Tab:CreateTexture(nil, "BORDER")
	Tab.Texture:SetTexture(Texture)
	Tab.Texture:SetInside(Tab.Backdrop)
	
	--if C["Skins"]["Color"]["Value"] == "Dark" then 
		Tab.Texture:SetVertexColor(0.11, 0.11, 0.11)
	--elseif C["Skins"]["Color"]["Value"] == "ClassColor" then 
	--	Tab.Texture:SetVertexColor(unpack(ClassColor))
	--elseif C["Skins"]["Color"]["Value"] == "BackdropColor" then 
	--	Tab.Texture:SetVertexColor(unpack(C.General.BackdropColor))
	--else
	--	Tab.Texture:SetVertexColor(0.43, 0.43, 0.43)
	--end
	Tab:HookScript('OnEnter', function(self) self:SetBorderColor(unpack(ClassColor)) end)
	Tab:HookScript('OnLeave', function(self) self:SetBorderColor(0.11, 0.11, 0.11) end)
end


