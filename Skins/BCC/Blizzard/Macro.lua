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
-- MACRO System
------------------------------------------------------------------------------------------
local AS_Blizzard_MacroUI = AS.Blizzard_MacroUI
function AS:Blizzard_MacroUI(event, addon)
	AS_Blizzard_MacroUI(self, event, addon)

	if addon ~= 'Blizzard_MacroUI' then return end

	if not Tukui then return end
	if not T then
		T, C = Tukui:unpack()
	end

	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	
	local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}

	-- BASE FRAME
	MacroFrame:CreateShadow()
	MacroFrame:SetHeight(520)
	MacroFrame:SetWidth(352)
	
	-- Tabs
	MacroFrameTab1:ClearAllPoints()
	MacroFrameTab1:SetPoint("BOTTOMLEFT", MacroButtonScrollFrame, "TOPLEFT", 0, 3)
	
	MacroFrameTab2:ClearAllPoints()
	MacroFrameTab2:SetPoint("BOTTOMLEFT", MacroButtonScrollFrame, "TOPLEFT", 115, 3)
	
	-- Buttons ScrollFrame
	MacroButtonScrollFrame:CreateBackdrop("Transparent")

	-- selected macro
	local MacroFrameSelectedMacroBG = CreateFrame("Frame", MacroFrameSelectedMacroBG, MacroFrame)
	MacroFrameSelectedMacroBG:CreateBackdrop("Transparent")
	MacroFrameSelectedMacroBG:SetPoint("TOPLEFT", MacroButtonScrollFrame, "BOTTOMLEFT", 0, -24)
	MacroFrameSelectedMacroBG:SetPoint("TOPRIGHT", MacroButtonScrollFrame, "BOTTOMRIGHT", 22, -24)
	MacroFrameSelectedMacroBG:SetHeight(58)
	
	MacroFrameSelectedMacroName:ClearAllPoints()
	MacroFrameSelectedMacroName:SetPoint("BOTTOMLEFT", MacroFrameSelectedMacroBG, "TOPLEFT", 4, 2)

	MacroFrameSelectedMacroButton:ClearAllPoints()
	MacroFrameSelectedMacroButton:SetScale(1.5)
	MacroFrameSelectedMacroButton:SetPoint("TOPLEFT", MacroFrameSelectedMacroBG, "TOPLEFT", 1, -1)

	MacroEditButton:ClearAllPoints()
	MacroEditButton:SetPoint("TOPRIGHT", MacroFrameSelectedMacroBG, "TOPRIGHT", -6, -6)
	
	MacroSaveButton:ClearAllPoints()
	MacroSaveButton:SetPoint("TOPRIGHT", MacroEditButton, "BOTTOMRIGHT", 0, -2)
	
	MacroCancelButton:ClearAllPoints()
	MacroCancelButton:SetPoint("RIGHT", MacroSaveButton, "LEFT", -2, 0)

	-- EditBox
	MacroFrameScrollFrame:ClearAllPoints()
	MacroFrameScrollFrame:CreateBackdrop("Transparent")
	MacroFrameScrollFrame:SetPoint("TOPLEFT", MacroFrameSelectedMacroBG, "BOTTOMLEFT", 0, -24)
	MacroFrameScrollFrame:SetPoint("TOPRIGHT", MacroFrameSelectedMacroBG, "BOTTOMRIGHT", -24, -24)
	
	MacroFrameTextBackground:Hide()
		
	MacroFrameEnterMacroText:ClearAllPoints()
	MacroFrameEnterMacroText:SetPoint("BOTTOMLEFT", MacroFrameScrollFrame, "TOPLEFT", 4, 4)
	
	MacroFrameCharLimitText:ClearAllPoints()
	MacroFrameCharLimitText:SetPoint("TOPLEFT", MacroFrameScrollFrame, "BOTTOMLEFT", 4, -8)

	-- bottom buttons
	MacroNewButton:ClearAllPoints()
	MacroNewButton:SetPoint("RIGHT",MacroExitButton, "LEFT", -2, 0)

	-- header
	MacroFrame:CreateMaxUIHeader("Macro's")
	
	-- relocate
	MacroFrame:ClearAllPoints()
	MacroFrame:SetPoint("TOP", UIParent, "TOP", 0, -100)
	MacroFrame.ClearAllPoints = function() end
	MacroFrame.SetPoint = function() end
	
	-- close button
	MacroFrameCloseButton:ClearAllPoints()
	MacroFrameCloseButton:SetPoint("RIGHT", MacroFrame.MaxUIHeader, "RIGHT", 4, 0)

	-- POPUP FRAME
	MacroPopupFrame:SetHeight(520)
	MacroPopupFrame:CreateShadow()
	MacroPopupScrollFrame:CreateBackdrop("Transparent")
	MacroPopupScrollFrame:SetHeight(416)
	MacroPopupScrollFrame:SetWidth(474)
	MacroPopupFrame.BorderBox.CancelButton:ClearAllPoints()
	MacroPopupFrame.BorderBox.CancelButton:SetPoint("BOTTOMRIGHT", MacroPopupFrame, "BOTTOMRIGHT", -3, 3)

	AS:UnregisterSkinEvent(addon, event)
end
AS:RegisterSkin('Blizzard_MacroUI', AS.Blizzard_MacroUI, 'ADDON_LOADED')