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
-- KEYBINDINGS
------------------------------------------------------------------------------------------
local AS_Blizzard_BindingUI = AS.Blizzard_BindingUI
function AS:Blizzard_BindingUI(event, addon)
	AS_Blizzard_BindingUI(self, event, addon)
	
	if addon ~= 'Blizzard_BindingUI' then return end

	if not Tukui then return end
	if not T then
		T, C = Tukui:unpack()
	end

	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	
	for _, v in pairs({ "defaultsButton", "unbindButton", "okayButton", "cancelButton", "quickKeybindButton" }) do
		AS:SkinButton(KeyBindingFrame[v])
	end
	
	KeyBindingFrame:CreateMaxUIHeader("Key Bindings")
	KeyBindingFrame:CreateShadow()
	KeyBindingFrame.Header:Kill()
	KeyBindingFrame.BG:Kill()
	
	KeyBindingFrame.cancelButton:ClearAllPoints()
	KeyBindingFrame.cancelButton:SetPoint("BOTTOMRIGHT", KeyBindingFrame, "BOTTOMRIGHT", -16, 16)
 
	KeyBindingFrame.okayButton:ClearAllPoints()
	KeyBindingFrame.okayButton:SetPoint("RIGHT", KeyBindingFrame.cancelButton, "LEFT", -3, 0)

	KeyBindingFrame.unbindButton:ClearAllPoints()
	KeyBindingFrame.unbindButton:SetPoint("RIGHT", KeyBindingFrame.okayButton, "LEFT", -3, 0)

	KeyBindingFrame.quickKeybindButton:ClearAllPoints()
	KeyBindingFrame.quickKeybindButton:SetPoint("RIGHT", KeyBindingFrame.unbindButton, "LEFT", -3, 0)
	
	AS:UnregisterSkinEvent(addon, event)
end
AS:RegisterSkin("Blizzard_BindingUI", AS.Blizzard_BindingUI, 'ADDON_LOADED')