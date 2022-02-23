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
-- BLIZZARD SYSTEMS FORM THE GAME MENU
------------------------------------------------------------------------------------------
local AS_Blizzard_Options = AS.Blizzard_Options
function AS:Blizzard_Options(event, addon)
	AS_Blizzard_Options(self, event, addon)
	
	if not Tukui then return end
	if not T then
		T, C = Tukui:unpack()
	end
	
	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	
	local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}

	if addon == 'Blizzard_GMSurveyUI' then
		GMSurveyFrame:CreateMaxUIHeader("GM Survey")
		--GMSurveyFrame:CreateShadow()
		GMSurveyHeader:Kill()
		
		AS:UnregisterSkinEvent(addon, event)
	end
	
	if event == 'PLAYER_ENTERING_WORLD' then
		
	-- interface frame adjustments
		_G.InterfaceOptionsFrame:CreateMaxUIHeader("Interface Options")
		_G.InterfaceOptionsFrame:CreateShadow()
		InterfaceOptionsFrameHeader:Kill()

		InterfaceOptionsFrameTab1:ClearAllPoints()
		InterfaceOptionsFrameTab1:SetPoint("BOTTOMLEFT", InterfaceOptionsFrameCategories, "TOPLEFT", 0, 1)
		
		InterfaceOptionsFrameTab2:ClearAllPoints()
		InterfaceOptionsFrameTab2:SetPoint("BOTTOMRIGHT", InterfaceOptionsFrameCategories, "TOPRIGHT", -9, 1)
		
		InterfaceOptionsFrameOkay:ClearAllPoints()
		InterfaceOptionsFrameOkay:SetPoint("BOTTOMRIGHT", InterfaceOptionsFrameCancel, "BOTTOMLEFT", -2, 0)
		
	-- Video options frame adjustments
		_G.Display_:StripTextures()
		_G.Graphics_:StripTextures()
		_G.RaidGraphics_:StripTextures()
		
		Advanced_DisplayHeaderUnderline:Kill()
		NetworkOptionsPanelDisplayHeaderUnderline:Kill()
		InterfaceOptionsLanguagesPanelDisplayHeaderUnderline:Kill()
		AudioOptionsSoundPanelDisplayHeaderUnderline:Kill()
		AudioOptionsVoicePanelDisplayHeaderUnderline:Kill()

		AudioOptionsSoundPanelPlayback.Backdrop:Hide()
		AudioOptionsSoundPanelHardware.Backdrop:Hide()
		AudioOptionsSoundPanelVolume.Backdrop:Hide()

		_G.VideoOptionsFrame:CreateMaxUIHeader("System Options")
		_G.VideoOptionsFrame:CreateShadow()
		VideoOptionsFrameHeader:Kill()
		AudioOptionsVoicePanelTestInputDevice.VUMeter:StripTextures()
		AudioOptionsVoicePanelTestInputDevice.ToggleTest:SkinButton()
		AudioOptionsVoicePanelTestInputDevice.VUMeter:CreateBackdrop("Transparent")
		
		VideoOptionsFrameOkay:ClearAllPoints()
		VideoOptionsFrameOkay:SetPoint("BOTTOMRIGHT", VideoOptionsFrameCancel, "BOTTOMLEFT", -2, 0)
		
	-- Chat options frame adjustments
		_G.ChatConfigFrame:CreateMaxUIHeader("Chat Options")
		_G.ChatConfigFrame:CreateShadow()
		ChatConfigFrameHeader:Kill()

		ChatConfigFrame:HookScript("OnShow", function()
			for tab in ChatConfigFrameChatTabManager.tabPool:EnumerateActive() do
				tab:SetHeight(22)
				tab.Text:SetInside()
			end
		end)

		ChatConfigChatSettingsLeft:StripTextures()
		ChatConfigChannelSettingsLeft:StripTextures()
		ChatConfigOtherSettingsCombat:StripTextures()
		ChatConfigOtherSettingsPVP:StripTextures()
		ChatConfigOtherSettingsSystem:StripTextures()
		ChatConfigOtherSettingsCreature:StripTextures()
		CombatConfigMessageSourcesDoneBy:StripTextures()
		CombatConfigMessageSourcesDoneTo:StripTextures()
		CombatConfigColorsUnitColors:StripTextures()
		CombatConfigColorsColorize:StripTextures()
		CombatConfigColorsHighlighting:StripTextures()
		CombatConfigColorsColorizeUnitName:StripTextures()
		CombatConfigColorsColorizeSpellNames:StripTextures()
		CombatConfigColorsColorizeDamageNumber:StripTextures()
		CombatConfigColorsColorizeDamageSchool:StripTextures()
		CombatConfigColorsColorizeEntireLine:StripTextures()
		
	-- Colorpicker frame adjustments
		ColorPickerFrame:CreateMaxUIHeader("Color Picker")
		ColorPickerFrame:CreateShadow()
		ColorPickerFrameHeader:Kill()
		--ColorPickerFrame.Border:StripTextures()
		
	-- Customer Support / Help frame adjustments
		
		-- header
		HelpFrame:CreateMaxUIHeader("Customer Support")	

		-- close button
		AS:SkinCloseButton(HelpFrameCloseButton)
		HelpFrameCloseButton:ClearAllPoints()
		HelpFrameCloseButton:SetPoint("RIGHT", HelpFrame.MaxUIHeader, "RIGHT", 4, 0)
		
		-- relocate
		HelpFrame:ClearAllPoints()
		HelpFrame:SetPoint("TOP", UIParent, "TOP", 0, -100)
		HelpFrame.ClearAllPoints = function() end
		HelpFrame.SetPoint = function() end
			
		HelpFrame:CreateShadow()
		HelpFrameTitleText:Kill()
		AS:SkinFrame(HelpFrame)
	end	
end
AS:RegisterSkin('Blizzard_Options', AS.Blizzard_Options, 'ADDON_LOADED')