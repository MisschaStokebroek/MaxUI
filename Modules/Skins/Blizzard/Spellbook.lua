------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkinsBlizzard

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local SpellbookSkin = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- SKIN Spellbook
------------------------------------------------------------------------------------------
local function SkinBlizzardToMaxUIStyleSpellBook()

	-- basic
	SpellBookFrame:SkinMaxUIBaseFrame(true, true, " ")
	--SpellBookSpellIconsFrame:StripTextures()

	for i = 1, 5 do
		_G["SpellBookFrameTabButton"..i]:SkinMaxUITab(true)
	end

	for i = 1, 8 do
		local Tab = _G["SpellBookSkillLineTab"..i]
		Tab:SkinMaxUITab()
		Tab:StripTextures()
		Tab.Backdrop:SetPoint("TOPLEFT", Tab, "TOPLEFT", -10, 4)
		Tab.Backdrop:SetPoint("BOTTOMRIGHT", Tab, "BOTTOMRIGHT", 10, -4)
	end

	hooksecurefunc("SpellBookFrame_UpdateSkillLineTabs", function()
		for i = 1, 8 do
			local Tab = _G["SpellBookSkillLineTab"..i]
			if Tab:GetNormalTexture() then
				Tab:GetNormalTexture():SetTexCoord(unpack(T.IconCoord))
				Tab:GetNormalTexture():ClearAllPoints()
				Tab:GetNormalTexture():SetSize(Tab.Backdrop:GetHeight()-2, Tab.Backdrop:GetHeight()-2)
				Tab:GetNormalTexture():SetPoint("CENTER", Tab, "CENTER", 0, 0)
				Tab:GetNormalTexture():SetDrawLayer("BACKGROUND")
			end
		end
	end)

	SpellBookPrevPageButton:SkinMaxUIArrowButton(Left)
	SpellBookNextPageButton:SkinMaxUIArrowButton(Right)
	
	for i = 1, SPELLS_PER_PAGE do
		local Button = _G["SpellButton"..i]
		local Icon = _G["SpellButton"..i.."IconTexture"]

		--Button:SkinMaxUIButton()
		--Icon:SetTexCoord(unpack(T.IconCoord))
		--Icon:SetInside()

		--Button:SetCheckedTexture('')
		--Button:SetPushedTexture('')


	end
end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function SpellbookSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsBlizzard then return end

	if C["Skins"]["Spellbook"] then
		if not IsAddOnLoaded("SpellBookFrame") then
			LoadAddOn("SpellBookFrame")
		end		
		SkinBlizzardToMaxUIStyleSpellBook()
	end
	self:UnregisterAllEvents()
end

SpellbookSkin:RegisterEvent("PLAYER_LOGIN")
SpellbookSkin:SetScript("OnEvent", SpellbookSkin.OnEvent)