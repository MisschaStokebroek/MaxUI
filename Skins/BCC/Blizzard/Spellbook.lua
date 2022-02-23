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
-- SPELLBOOK
------------------------------------------------------------------------------------------
local AS_Blizzard_Spellbook = AS.Blizzard_Spellbook
function AS:Blizzard_Spellbook()
	AS_Blizzard_Spellbook(self)
	
	if not Tukui then return end
	if not T then
		T, C = Tukui:unpack()
	end
	
	if not C["Skins"]["MaxUIAddOnSkins"] then return end

	-- adjustments
	SpellBookFrame:CreateShadow()
	--SpellBookFrameInset:StripTextures()
	SpellBookPageText:ClearAllPoints()	
	SpellBookPageText:SetPoint("BOTTOMRIGHT", SpellBookFrame, "BOTTOMRIGHT", -44, 8)
		
	for i = 1, 8 do
		local Tab = _G["SpellBookSkillLineTab"..i]
		Tab:CreateShadow()
	end

	-- spelldescriptions
	hooksecurefunc("SpellButton_UpdateButton", function()
		for i = 1, SPELLS_PER_PAGE do
			local Button = _G["SpellButton"..i]
			Button:CreateShadow()
			AS:SkinIconButton(Button, true)
			Button.SpellSubName:SetFont(C.Medias.MaxUIFont, 10)
		end
	end)

	-- header
	SpellBookFrame:CreateMaxUIHeader("Spellbook & Professions")

	-- close button
	SpellBookCloseButton:ClearAllPoints()
	SpellBookCloseButton:SetPoint("RIGHT", SpellBookFrame.MaxUIHeader, "RIGHT", 4, 0)
	
	-- relocate
	SpellBookFrame:ClearAllPoints()
	SpellBookFrame:SetPoint("TOP", UIParent, "TOP", 0, -100)
	SpellBookFrame.ClearAllPoints = function() end
	SpellBookFrame.SetPoint = function() end
end
AS:RegisterSkin('Blizzard_Spellbook', AS.Blizzard_Spellbook)