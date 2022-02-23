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
-- TRADESKILLS
------------------------------------------------------------------------------------------
local AS_Blizzard_TradeSkill = AS.Blizzard_TradeSkill
function AS:Blizzard_TradeSkill(event, addon)
	AS_Blizzard_TradeSkill(self, event, addon)
	
	if not Tukui then return end
	if not T then
		T, C = Tukui:unpack()
	end

	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	if addon ~= 'Blizzard_TradeSkillUI' then return end
	
	-- adjustments
	TradeSkillFrameInset:StripTextures()
	TradeSkillFrameInset.NineSlice:StripTextures()
	
	-- header
	TradeSkillFrame:CreateMaxUIHeader("Merchant")
	TradeSkillFrame:CreateShadow()
	TradeSkillFrame.MaxUIHeader:SetFrameLevel(15)
	
	-- close button
	TradeSkillFrameCloseButton:ClearAllPoints()
	TradeSkillFrameCloseButton:SetFrameLevel(16)
	TradeSkillFrameCloseButton:SetFrameStrata("HIGH")
	TradeSkillFrameCloseButton:SetPoint("RIGHT", TradeSkillFrame.MaxUIHeader, "RIGHT", 4, 0)

	-- relocate
	TradeSkillFrame:ClearAllPoints()
	TradeSkillFrame:SetPoint("TOPLEFT", UIParent, "TOP", 300, -100)
	TradeSkillFrame.ClearAllPoints = function() end
	TradeSkillFrame.SetPoint = function() end
	
	AS:UnregisterSkinEvent(addon, event)
end
AS:RegisterSkin('Blizzard_TradeSkill', AS.Blizzard_TradeSkill)

------------------------------------------------------------------------------------------
-- TRADESKILLS
------------------------------------------------------------------------------------------
local AS_Blizzard_TrainerUI = AS.Blizzard_TrainerUI
function AS:Blizzard_TrainerUI(event, addon)
	AS_Blizzard_TrainerUI(self, event, addon)
	
	if not Tukui then return end
	if not T then
		T, C = Tukui:unpack()
	end

	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	if addon ~= 'Blizzard_TrainerUI' then return end
	
	-- adjustments
	ClassTrainerFrameInset:StripTextures()
	ClassTrainerFrame.NineSlice:StripTextures()
	
	-- header
	ClassTrainerFrame:CreateMaxUIHeader("Merchant")
	ClassTrainerFrame:CreateShadow()
	ClassTrainerFrame.MaxUIHeader:SetFrameLevel(15)
	
	-- close button
	ClassTrainerFrameCloseButton:ClearAllPoints()
	ClassTrainerFrameCloseButton:SetFrameLevel(16)
	ClassTrainerFrameCloseButton:SetFrameStrata("HIGH")
	ClassTrainerFrameCloseButton:SetPoint("RIGHT", ClassTrainerFrame.MaxUIHeader, "RIGHT", 4, 0)

	-- relocate
	ClassTrainerFrame:ClearAllPoints()
	ClassTrainerFrame:SetPoint("TOPLEFT", UIParent, "TOP", 300, -100)
	ClassTrainerFrame.ClearAllPoints = function() end
	ClassTrainerFrame.SetPoint = function() end
	
	AS:UnregisterSkinEvent(addon, event)
end
AS:RegisterSkin('Blizzard_TrainerUI', AS.Blizzard_TrainerUI)
