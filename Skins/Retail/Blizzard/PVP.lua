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
-- PVP UI
------------------------------------------------------------------------------------------
local AS_Blizzard_PVPUI = AS.Blizzard_PVPUI
function AS:Blizzard_PVPUI(event, addon)
	
	AS_Blizzard_PVPUI(self, event, addon)

	if not Tukui then return end
	if not T then T, C = Tukui:unpack()	end
	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	if addon ~= "Blizzard_PVPUI" then return end

	GetCurrencyInfo = C_CurrencyInfo.GetCurrencyInfo
	IsQuestFlaggedCompleted =  C_QuestLog.IsQuestFlaggedCompleted
	
	for i = 1, 3 do
		local Button = PVPQueueFrame["CategoryButton"..i]
		AS:SkinButton(Button.Backdrop)
		Button.Icon:ClearAllPoints()
		Button.Icon:SetPoint("LEFT", Button, "LEFT", 4, 0)
		Button.Icon:SetSize(Button:GetHeight()-8, Button:GetHeight()-8)
	end
	
	PVPQueueFrame.CategoryButton1.Icon:SetTexture([[Interface\Icons\achievement_bg_winwsg]])
	PVPQueueFrame.CategoryButton2.Icon:SetTexture([[Interface\Icons\achievement_bg_killxenemies_generalsroom]])
	PVPQueueFrame.CategoryButton3.Icon:SetTexture([[Interface\Icons\ability_warrior_offensivestance]])

	HonorFrameTypeDropDown:SetWidth(200)
	
	for _, Frame in pairs({ HonorFrame, ConquestFrame }) do

		Frame.DPSIcon:StripTextures()
		Frame.TankIcon:StripTextures()
		Frame.HealerIcon:StripTextures()
		
		Frame.DPSIcon.MaxUIRole = Frame.DPSIcon:CreateTexture(nil, "OVERLAY")
		Frame.TankIcon.MaxUIRole = Frame.TankIcon:CreateTexture(nil, "OVERLAY")
		Frame.HealerIcon.MaxUIRole = Frame.HealerIcon:CreateTexture(nil, "OVERLAY")
		
		Frame.DPSIcon.MaxUIRole:SetAllPoints()
		Frame.TankIcon.MaxUIRole:SetAllPoints()
		Frame.HealerIcon.MaxUIRole:SetAllPoints()

		Frame.DPSIcon.MaxUIRole:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\roleicons\\Maxdps.tga")
		Frame.TankIcon.MaxUIRole:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\roleicons\\Maxtank.tga")
		Frame.HealerIcon.MaxUIRole:SetTexture("Interface\\AddOns\\MaxUI\\Medias\\roleicons\\Maxhealer.tga")
		
		Frame.DPSIcon.checkButton:SetFrameLevel(10)
		Frame.TankIcon.checkButton:SetFrameLevel(10)
		Frame.HealerIcon.checkButton:SetFrameLevel(10)

		Frame.ConquestBar.Reward:SetPoint("LEFT", Frame.ConquestBar, "RIGHT", 4, 0)
		Frame.ConquestBar.Backdrop:SetAlpha(0.75)

	end
	
	local Buttons = { ['RandomBGButton'] = HonorFrame.BonusFrame, ['RandomEpicBGButton'] = HonorFrame.BonusFrame, ['Arena1Button'] = HonorFrame.BonusFrame, ['BrawlButton'] = HonorFrame.BonusFrame, ['RatedBG'] = ConquestFrame, ['Arena2v2'] = ConquestFrame, ['Arena3v3'] = ConquestFrame }

	for Section, Parent in pairs(Buttons) do
		local Button = Parent[Section]
		AS:SkinIconButton(Button)
		Button.Backdrop:SetAlpha(0.75)
	end

	AS:UnregisterSkinEvent(addon, event)
end
AS:RegisterSkin("Blizzard_PVPUI", AS.Blizzard_PVPUI)