------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-01-2023
------------------------------------------------------------------------------------------

-- setting up MaxUISkinsBlizzard

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local SettingsPanelSkin = CreateFrame("Frame")

local _G = _G
local next = next
local hooksecurefunc = hooksecurefunc

-- bugs out when opening keybinds and trying to close

------------------------------------------------------------------------------------------
-- ADDITIONAL SKINNING FUNCTIONS
------------------------------------------------------------------------------------------
local function SkinSettingsPanelCheckbox(checkbox)
	checkbox:SkinMaxUIFrame()
	checkbox:SetSize(20, 20)

	for _, region in next, { checkbox:GetRegions() } do
		if region:IsObjectType("Texture") then
			if region:GetAtlas() == 'checkmark-minimal' then
					region:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Role\check.tga]])

					local checkedTexture = checkbox:GetCheckedTexture()
					checkedTexture:SetInside(checkbox.Backdrop)
			else
				region:SetTexture("")
			end
		end
	end
end

local function SkinSettingsPanelTabs(tab)
	if tab then tab:StripTextures() end
end

local function UpdateKeybindButtons(self)
	if not self.bindingsPool then return end
	for panel in self.bindingsPool:EnumerateActive() do
		if not panel.isSkinned then
			panel.Button1:SkinMaxUIButton(true)
			panel.Button2:SkinMaxUIButton(true)
			if panel.CustomButton then panel.CustomButton:SkinMaxUIButton(true) end
			panel.isSkinned = true
		end
	end
end

local function UpdateHeaderExpand(self, expanded)
	self.collapseTex:SetAtlas(expanded and 'Soulbinds_Collection_CategoryHeader_Collapse' or 'Soulbinds_Collection_CategoryHeader_Expand', true)

	UpdateKeybindButtons(self)
end

------------------------------------------------------------------------------------------
-- SKIN SettingsFrame
------------------------------------------------------------------------------------------
local function SkinSettingsPanelFrame()
	local SettingsPanel = _G.SettingsPanel

	SettingsPanel:SkinMaxUIBaseFrame(nil, true)
	SettingsPanel:StripTextures()
	SettingsPanel.Bg:Hide()
	SettingsPanel.NineSlice:Hide()

	--SettingsPanel.CloseButton:Hide()

	--SettingsPanel.ClosePanelButton:SkinMaxUICloseButton(true)
	--SettingsPanel.ClosePanelButton:ClearAllPoints()
	--SettingsPanel.ClosePanelButton:SetPoint("RIGHT", SettingsPanel.MaxUIHeader, "RIGHT", -4, 0)
	
	SettingsPanel.SearchBox:SkinMaxUIEditBox(true)
	SettingsPanel.Container.SettingsList.Header.DefaultsButton:SkinMaxUIButton(true)

	SettingsPanel.ApplyButton:SkinMaxUIButton(true)

end

local function SkinSettingsPanelLeftFrame()
	local SettingsPanel = _G.SettingsPanel

	-- tabs Not stripping correct!
	SkinSettingsPanelTabs(SettingsPanel.GameTab)
	SkinSettingsPanelTabs(SettingsPanel.AddOnsTab)
	SettingsPanel.GameTab:SkinMaxUITab(true)
	SettingsPanel.AddOnsTab:SkinMaxUITab(true)

	-- category list frame
	SettingsPanel.CategoryList:SkinMaxUIFrame(true)
	
	-- catergory list headers
	hooksecurefunc(SettingsPanel.CategoryList.ScrollBox, 'Update', function(frame)
		for _, child in next, { frame.ScrollTarget:GetChildren() } do
			if not child.isSkinned then
				if child.Background then
					child.Background:SetAlpha(0)
					child:SkinMaxUIFrame(true)
				end

				local toggle = child.Toggle
				if toggle then -- ToDo Handle the toggle. DF
					toggle:GetPushedTexture():SetAlpha(0)
				end

				child.isSkinned = true
			end
		end
	end)


end

local function SkinSettingsPanelRightFrame()
	local SettingsPanel = _G.SettingsPanel

	-- container frame
	SettingsPanel.Container:SkinMaxUIFrame()
	
	-- container scrollbar
	SettingsPanel.Container.SettingsList.ScrollBar:SkinMaxUIScrollBarNew(true)

	-- container elements
	hooksecurefunc(SettingsPanel.Container.SettingsList.ScrollBox, 'Update', function(frame)
		for _, child in next, { frame.ScrollTarget:GetChildren() } do
			if not child.isSkinned then
				if child.CheckBox then
					SkinSettingsPanelCheckbox(child.CheckBox)
				end

				if child.Button then
					if child.Button:GetWidth() < 250 then
						child.Button:SkinMaxUIButton(true)
						--child.Button.Backdrop:SetPoint("TOPLEFT", 2, -2)
						--child.Button.Backdrop:SetPoint("BOTTOMRIGHT", -2, 2)
					else
						child.Button:StripTextures()
						child.Button.Right:SetAlpha(0)
						child.Button:SkinMaxUITab()
						child.Button.Backdrop:SetPoint('TOPLEFT', 2, -1)
						child.Button.Backdrop:SetPoint('BOTTOMRIGHT', -2, 3)

						child.collapseTex = child.Button.Backdrop:CreateTexture(nil, 'OVERLAY')
						child.collapseTex:SetPoint('RIGHT', -10, 0)

						UpdateHeaderExpand(child, false)
						hooksecurefunc(child, 'EvaluateVisibility', UpdateHeaderExpand)
					end
				end

				--if child.ToggleTest then
				--	S:HandleButton(child.ToggleTest)
				--	child.VUMeter:StripTextures()
				--	child.VUMeter.NineSlice:Hide()
				--	child.VUMeter:CreateBackdrop()
				--	child.VUMeter.backdrop:SetInside(4, 4)
				--	child.VUMeter.Status:SetStatusBarTexture(E.media.normTex)
				--	child.VUMeter.Status:SetInside(child.VUMeter.backdrop)
				--	E:RegisterStatusBar(child.VUMeter.Status)
				--end

				--if child.PushToTalkKeybindButton then
				--	S:HandleButton(child.PushToTalkKeybindButton)
				--end

				--if child.SliderWithSteppers then
				--	S:HandleStepSlider(child.SliderWithSteppers)
				--end


				--if child.Button1 and child.Button2 then
				--	S:HandleButton(child.Button1)
				--	S:HandleButton(child.Button2)
				--end


				child.isSkinned = true
			end
		end
	end)
end



local function SkinSettingsPanelButtons()
	local SettingsPanel = _G.SettingsPanel

end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function SettingsPanelSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsBlizzard then return end

	if C["Skins"]["SettingsPanel"] then
		if not IsAddOnLoaded("SettingsPanel") then
			LoadAddOn("SettingsPanel")
		end		
		SkinSettingsPanelFrame()
		SkinSettingsPanelLeftFrame()
		SkinSettingsPanelRightFrame()	
	end
	self:UnregisterAllEvents()
end

SettingsPanelSkin:RegisterEvent("PLAYER_LOGIN")
SettingsPanelSkin:SetScript("OnEvent", SettingsPanelSkin.OnEvent)