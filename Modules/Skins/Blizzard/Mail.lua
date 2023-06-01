------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkinsBlizzard

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local MailSkin = CreateFrame("Frame")

local ScrollTexture = "Interface\\AddOns\\MaxUI\\Medias\\Backgrounds\\scroll.tga"
local MailIcon = "Interface\\AddOns\\MaxUI\\Medias\\Icons\\Menu\\cMail.tga"

------------------------------------------------------------------------------------------
-- SKIN Mail
------------------------------------------------------------------------------------------
local function SkinInbox()
	if MailFrame.IsMaxUISkinned then return end

	MailFrame:SkinMaxUIBaseFrame(true, true, " ")
	MailFrame:SetSize(MailFrame:GetWidth(), MailFrame:GetHeight()+50)
	
	MailFrame.Icon = MailFrame:CreateTexture(nil, "ARTWORK")
	MailFrame.Icon:SetSize(40, 40)
	MailFrame.Icon:SetPoint("TOPLEFT", MailFrame, "TOPLEFT", 4, -4)
	MailFrame.Icon:SetTexture(MailIcon)

	MailFrameTitleText:SetScale(1.5)
	MailFrameTitleText:ClearAllPoints()
	MailFrameTitleText:SetPoint("TOPLEFT", MailFrame.Icon, "TOPRIGHT", 8, 0)
	MailFrameTitleText:SetJustifyH("LEFT")
	
	MailFrameTab1:SkinMaxUITab(true)
	MailFrameTab2:SkinMaxUITab(true)

	InboxPrevPageButton:SkinMaxUIArrowButton(Left)
	InboxNextPageButton:SkinMaxUIArrowButton(Right)
	OpenAllMail:SkinMaxUIButton(true)
	
	OpenAllMail:ClearAllPoints()
	InboxPrevPageButton:ClearAllPoints()
	InboxNextPageButton:ClearAllPoints()

	OpenAllMail:SetPoint("BOTTOM", MailFrame, "BOTTOM", 0, 10)
	InboxPrevPageButton:SetPoint("BOTTOMLEFT", MailFrame, "BOTTOMLEFT", 10, 10)
	InboxNextPageButton:SetPoint("BOTTOMRIGHT", MailFrame, "BOTTOMRIGHT", -10, 10)

	for i = 1, _G.INBOXITEMS_TO_DISPLAY do
		local bg = _G['MailItem'..i]
		bg:SkinMaxUITab(true)

		local btn = _G['MailItem'..i..'Button']
		btn:StripTextures()
		btn:SkinMaxUIFrame()

		local icon = _G['MailItem'..i..'ButtonIcon']
		icon:SetTexCoord(unpack(T.IconCoord))
		icon:SetInside()

		_G['MailItem'..i..'ButtonIconBorder']:SetAlpha(0)
	end

	MailFrame.IsMaxUISkinned = true
end

local function SkinSendMail()
	if SendMailFrame.IsMaxUISkinned then return end

	SendMailScrollFrame:StripTextures()

	SendMailScrollFrame.Scroll = SendMailScrollFrame:CreateTexture(nil, "BACKGROUND")
	SendMailScrollFrame.Scroll:SetPoint("TOPLEFT", SendMailScrollFrame, "TOPLEFT", -8, 8)
	SendMailScrollFrame.Scroll:SetPoint("BOTTOMRIGHT", SendMailScrollFrame, "BOTTOMRIGHT", 4, -8)
	SendMailScrollFrame.Scroll:SetTexture(ScrollTexture)

	SendStationeryBackgroundLeft:Hide()
	SendStationeryBackgroundRight:Hide()
	SendMailMoneyBg:Hide()
	SendMailMoneyInset:Hide()

	-- scrollframes
	--SendMailScrollFrameScrollBar:SkinMaxUIScrollBar(true)
	SendMailScrollFrame.ScrollBar:SkinMaxUIScrollBarNew(true)

	-- buttons
	SendMailCancelButton:SkinMaxUIButton(true)
	SendMailMailButton:SkinMaxUIButton(true)
	
	SendMailCancelButton:ClearAllPoints()
	SendMailMailButton:ClearAllPoints()

	SendMailCancelButton:SetPoint("BOTTOMLEFT", MailFrame, "BOTTOM", 4, 10)
	SendMailMailButton:SetPoint("BOTTOMRIGHT", MailFrame, "BOTTOM", -4, 10)
	
	-- editbox
	SendMailNameEditBox:SkinMaxUIEditBox(true)
	SendMailSubjectEditBox:SkinMaxUIEditBox(true)
	SendMailMoneyGold:SkinMaxUIEditBox(true)
	SendMailMoneySilver:SkinMaxUIEditBox(true)
	SendMailMoneyCopper:SkinMaxUIEditBox(true)

	-- radio checkboxes
	SendMailSendMoneyButton:SkinMaxUIRadioButton()
	SendMailCODButton:SkinMaxUIRadioButton()

	for i = 1, _G.ATTACHMENTS_MAX_SEND do
		local btn = _G['SendMailAttachment'..i]
		if btn then
			btn:StripTextures()
			btn:SkinMaxUIFrame()

			btn.IconBorder:SetAlpha(0)
		end

		local Texture = btn:GetNormalTexture()
		if Texture then
			Texture:SetTexCoord(unpack(T.IconCoord))
			Texture:SetInside()
		end
	end

	-- do I need this?
	hooksecurefunc("SendMailFrame_Update", function()
		for i = 1, ATTACHMENTS_MAX_SEND do
			local Texture = _G["SendMailAttachment"..i]:GetNormalTexture()
			if Texture then
				Texture:SetTexCoord(unpack(T.IconCoord))
				Texture:SetInside()
			end
		end
	end)

	SendMailFrame.IsMaxUISkinned = true
end

local function SkinOpenMail()
	if OpenMailFrame.IsMaxUISkinned then return end
	
	OpenMailFrame:SetSize(OpenMailFrame:GetWidth(), OpenMailFrame:GetHeight())
	
	OpenMailFrame:StripTextures()
	OpenMailFrame:SkinMaxUIBaseFrame(true)
	OpenMailFrame:ClearAllPoints()
	OpenMailFrame:SetPoint("TOPLEFT", MailFrame, "TOPRIGHT", 4, 0)
	OpenMailFrame:SetHeight(OpenMailFrame:GetHeight() +50)

	OpenMailFrameIcon:Kill()
	OpenMailFrame.Icon = OpenMailFrame:CreateTexture(nil, "ARTWORK")
	OpenMailFrame.Icon:SetSize(40, 40)
	OpenMailFrame.Icon:SetPoint("TOPLEFT", OpenMailFrame, "TOPLEFT", 4, -4)
	OpenMailFrame.Icon:SetTexture(MailIcon)

	OpenMailFrameTitleText:SetScale(1.5)
	OpenMailFrameTitleText:ClearAllPoints()
	OpenMailFrameTitleText:SetPoint("TOPLEFT", OpenMailFrame.Icon, "TOPRIGHT", 8, 0)
	OpenMailFrameTitleText:SetJustifyH("LEFT")

	-- scrollframe
	OpenMailScrollFrame:StripTextures()

	OpenMailScrollFrame.Scroll = OpenMailScrollFrame:CreateTexture(nil, "BACKGROUND")
	OpenMailScrollFrame.Scroll:SetPoint("TOPLEFT", OpenMailScrollFrame, "TOPLEFT", -8, 16)
	OpenMailScrollFrame.Scroll:SetPoint("BOTTOMRIGHT", OpenMailScrollFrame, "BOTTOMRIGHT", 4, -12)
	OpenMailScrollFrame.Scroll:SetTexture(ScrollTexture)

	OpenMailScrollFrame.ScrollBar:SkinMaxUIScrollBarNew(true)

	--_G.InvoiceTextFontNormal:SetTextColor(1, 1, 1)
	--_G.MailTextFontNormal:SetTextColor(1, 1, 1)

	OpenMailFrameBg:Hide()
	OpenStationeryBackgroundLeft:Hide()
	OpenStationeryBackgroundRight:Hide()

	-- buttons
	OpenMailReportSpamButton:SkinMaxUIButton(true)
	OpenMailReplyButton:SkinMaxUIButton(true)
	OpenMailDeleteButton:SkinMaxUIButton(true)
	OpenMailCancelButton:SkinMaxUIButton(true)

	OpenMailReplyButton:ClearAllPoints()
	OpenMailDeleteButton:ClearAllPoints()
	OpenMailCancelButton:ClearAllPoints()

	OpenMailReplyButton:SetPoint("BOTTOMLEFT", OpenMailFrame, "BOTTOMLEFT", 4, 4)
	OpenMailDeleteButton:SetPoint("BOTTOM", OpenMailFrame, "BOTTOM", 0, 4)
	OpenMailCancelButton:SetPoint("BOTTOMRIGHT", OpenMailFrame, "BOTTOMRIGHT", -4, 4)

	for i = 1, _G.ATTACHMENTS_MAX_SEND do
		local btn = _G['OpenMailAttachmentButton'..i]
		if btn then
			btn:StripTextures()
			btn:SkinMaxUIFrame()

			btn.IconBorder:SetAlpha(0)
		end

		local t = _G['OpenMailAttachmentButton'..i..'IconTexture']
		if t then
			t:SetTexCoord(unpack(T.IconCoord))
			t:SetInside()
		end

		local btn = _G['OpenMailLetterButton']
		if btn then
			btn:StripTextures()
			btn:SkinMaxUIFrame()

			btn.IconBorder:SetAlpha(0)
		end

		local t = _G['OpenMailLetterButtonIconTexture']
		if t then
			t:SetTexCoord(unpack(T.IconCoord))
			t:SetInside()
		end
	end

	OpenMailFrame.IsMaxUISkinned = true
end

local function SkinReportPlayer()
	if ReportFrame.IsMaxUISkinned then return end

	ReportFrame:SkinMaxUIBaseFrame(true)
	ReportFrame:SkinMaxUIDropDown(nil, 70)
	
	ReportFrame:ClearAllPoints()
	ReportFrame:SetPoint("TOPLEFT", OpenMailFrame, "TOPRIGHT", 4, 0)

	ReportFrame:SetHeight(ReportFrame:GetHeight() +70)

	ReportFrame.ReportingMajorCategoryDropdown:SkinMaxUIFrame()
	ReportFrame.ReportingMajorCategoryDropdown.Backdrop:SetPoint("TOPLEFT", 4, -4)
	ReportFrame.ReportingMajorCategoryDropdown.Backdrop:SetPoint("BOTTOMRIGHT", 0, 4)
	ReportFrame.ReportButton:SkinMaxUIButton(true)

	ReportFrameText:ClearAllPoints(ReportFrame.ReportingMajorCategoryDropdown)
	ReportFrameText:SetPoint("LEFT", ReportFrame.ReportingMajorCategoryDropdown, "LEFT", 8, 0)
	
	ReportFrameButton:ClearAllPoints()
	ReportFrameButton:SetPoint("RIGHT", ReportFrame.ReportingMajorCategoryDropdown, "RIGHT", 0, 0)
	
	ReportFrame.IsMaxUISkinned = true
end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function MailSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsBlizzard then return end

	if C["Skins"]["Mail"] then
		if not IsAddOnLoaded("MailFrame") then
			LoadAddOn("MailFrame")
		end		
		SkinInbox()
		SkinSendMail()
		SkinOpenMail()
		SkinReportPlayer()
	end
	self:UnregisterAllEvents()
end

MailSkin:RegisterEvent("PLAYER_LOGIN")
MailSkin:SetScript("OnEvent", MailSkin.OnEvent)