------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-01-2023
------------------------------------------------------------------------------------------

-- setting up MaxUISkins

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local ImmersionSkin = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- SKIN Immersion
------------------------------------------------------------------------------------------
local function SkinImmersionToMaxUIStyle()
	
	-- adjustments Mainframe
	ImmersionFrame.TalkBox.BackgroundFrame:Kill()
	ImmersionFrame.TalkBox:SkinMaxUIFrame(true)
	if C["AddOns"]["ImmersionTopEdge"] then 
		ImmersionFrame.TalkBox.Backdrop:CreateMaxUITopEdge()
	end

	ImmersionFrame.TalkBox.PortraitFrame:StripTextures()

	ImmersionFrame.TalkBox.MainFrame.CloseButton:StripTextures()
	ImmersionFrame.TalkBox.MainFrame.CloseButton:SkinMaxUICloseButton(true)

	ImmersionFrame.TalkBox.Hilite:Kill()
	ImmersionFrame.TalkBox.MainFrame.Overlay:Kill()
	ImmersionFrame.TalkBox.MainFrame.Model:CreateBackdrop("Transparent")
	ImmersionFrame.TalkBox.MainFrame.Model.Backdrop:SetOutside(ImmersionFrame.TalkBox.MainFrame.Model)
	ImmersionFrame.TalkBox.MainFrame.Model.Backdrop:CreateShadow()

	ImmersionFrame.TalkBox.MainFrame.Model.ModelShadow:Kill()
	ImmersionFrame.TalkBox.MainFrame.Model.PortraitBG:Hide()

	-- rewards/objectives
	ImmersionFrame.TalkBox.Elements:StripTextures()
	ImmersionFrame.TalkBox.Elements:SkinMaxUIFrame()
	ImmersionFrame.TalkBox.Elements.Backdrop:SetPoint("TOPLEFT", ImmersionFrame.TalkBox.Elements, "TOPLEFT", -7, -14)
	ImmersionFrame.TalkBox.Elements.Backdrop:SetPoint("BOTTOMRIGHT", ImmersionFrame.TalkBox.Elements, "BOTTOMRIGHT", 7, -14)

	ImmersionFrame.TalkBox.ReputationBar:SkinMaxUIStatusBar(true)
	ImmersionFrame.TalkBox.ReputationBar:ClearAllPoints()
	ImmersionFrame.TalkBox.ReputationBar:SetPoint("TOPLEFT", ImmersionFrame.TalkBox.PortraitFrame, "BOTTOMLEFT", 0, -8)
	ImmersionFrame.TalkBox.ReputationBar:SetPoint("TOPRIGHT", ImmersionFrame.TalkBox.PortraitFrame, "BOTTOMRIGHT", 0, -8)
	ImmersionFrame.TalkBox.ReputationBar:SetHeight(12)

	if C["Skins"]["BackdropFilter"] then 
		ImmersionFrame.TalkBox.Elements.Backdrop:CreateMaxUIFilter()
	end

	local function SkinReward(Button)
		if Button.Icon then
			Button:SkinMaxUIFrame()
			Button.Backdrop:SetPoint("TOPLEFT", 2, -2)
			Button.Backdrop:SetPoint("BOTTOMRIGHT", -2, 2)

			Button.Icon:SetTexCoord(unpack(T.IconCoord))
			Button.Icon:ClearAllPoints()
			Button.Icon:SetPoint("LEFT", 4, 0)
			Button.Icon:SetSize(36, 36)
			
			if Button.NameFrame then
				Button.NameFrame:Hide()
			end

			if Button.Border then
				Button.Border:Hide()
			end

			if Button.Mask then
				Button.Mask:Hide()
			end
		end

		if Button.CircleBackground then
			Button.CircleBackground:SetTexture()
			Button.CircleBackgroundGlow:SetTexture()
			hooksecurefunc(Button.ValueText, "SetText", function(self, text) Button.Count:SetText('+'..text) self:Hide() end)
		end
	end

	SkinReward(ImmersionContentFrame)
	SkinReward(ImmersionFrame.TalkBox.Elements.Content.RewardsFrame.ArtifactXPFrame)
	SkinReward(ImmersionFrame.TalkBox.Elements.Content.RewardsFrame.HonorFrame)
	SkinReward(ImmersionFrame.TalkBox.Elements.Content.RewardsFrame.MoneyFrame)
	SkinReward(ImmersionFrame.TalkBox.Elements.Content.RewardsFrame.TitleFrame)
	SkinReward(ImmersionFrame.TalkBox.Elements.Content.RewardsFrame.SkillPointFrame)

	-- adjustments Options/Questions
	ImmersionFrame:HookScript('OnUpdate', function(self)
		for _, Button in ipairs(self.TitleButtons.Buttons) do
			if Button and not Button.Backdrop then
				Button:SetBackdrop(nil)
				Button.Overlay:Hide()
				Button.HighlightTexture:Kill()
				Button.Hilite:Kill()
				
				Button:SkinMaxUIFrame()
				Button.Backdrop:SetPoint("TOPLEFT", 0, -8)
				Button.Backdrop:SetPoint("BOTTOMRIGHT", -0, 8)
				if C["AddOns"]["ImmersionTopEdge"] then 
					Button.Backdrop:CreateMaxUITopEdge()
				end	
			end
		end

		for _, Button in ipairs(self.TalkBox.Elements.Content.RewardsFrame.Buttons) do
			if Button and not Button.Backdrop then
				SkinReward(Button)
			end
		end

		for Button in self.TalkBox.Elements.Content.RewardsFrame.spellRewardPool:EnumerateActive() do
			if Button and not Button.Backdrop then
				SkinReward(Button)
			end
		end

		for _, Button in ipairs(self.TalkBox.Elements.Progress.Buttons) do
			if Button and not Button.Backdrop then
				SkinReward(Button)
			end
		end
	end)
end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function ImmersionSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	--if not T.Retail then return end
	if not C.Skins.MaxUISkinsAddons then return end

	if IsAddOnLoaded('Immersion') and C["AddOns"]["ImmersionSkin"] then 
		SkinImmersionToMaxUIStyle()
	end
	self:UnregisterAllEvents()
end

ImmersionSkin:RegisterEvent("PLAYER_LOGIN")
ImmersionSkin:SetScript("OnEvent", ImmersionSkin.OnEvent)