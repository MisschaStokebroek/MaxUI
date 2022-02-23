------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 01-08-2021
------------------------------------------------------------------------------------------

-- setting up sharing of media, needs LibSharedMedia-3.0 to be installed.

------------------------------------------------------------------------------------------
-- SHARING
------------------------------------------------------------------------------------------
if IsAddOnLoaded('LibSharedMedia-3.0')then
	local LSM = LibStub('LibSharedMedia-3.0')

	if LSM == nil then return end

	LSM:Register('font','Cartoon', [[Interface\AddOns\MaxUI\Medias\Fonts\cartoon.TTF]])
	LSM:Register('font','Comic', [[Interface\AddOns\MaxUI\Medias\Fonts\comic.TTF]])
	LSM:Register('font','Bold', [[Interface\AddOns\MaxUI\Medias\Fonts\Bold.ttf]])
	LSM:Register('font','MaxUI', [[Interface\AddOns\MaxUI\Medias\Fonts\MaxUI.TTF]])
	LSM:Register('font','Expressway', [[Interface\AddOns\MaxUI\Medias\Fonts\Expressway.TTF]])
	LSM:Register('font','PTSansNarrow', [[Interface\AddOns\MaxUI\Medias\Fonts\PTSansNarrow.TTF]])
	LSM:Register('font','Warcraft', [[Interface\AddOns\MaxUI\Medias\Fonts\LifeCraft.TTF]])
	LSM:Register('font','Morpheus', [[Interface\AddOns\MaxUI\Medias\Fonts\Morpheus.TTF]])

	LSM:Register('texture', "Gloss", [[Interface\\AddOns\\MaxUI\\Medias\\Textures\\Gloss.tga]])
	LSM:Register('texture', "Graphite", [[Interface\\AddOns\\MaxUI\\Medias\\Textures\\Graphite.tga]])
	LSM:Register('texture', "Glosswave", [[Interface\\AddOns\\MaxUI\\Medias\\Textures\\glosswave.tga]])
	LSM:Register('texture', "Drop", [[Interface\\AddOns\\MaxUI\\Medias\\Textures\\drop.tga]])
	LSM:Register('texture', "Fiery", [[Interface\\AddOns\\MaxUI\\Medias\\Textures\\Fiery.tga]])
	LSM:Register('texture', "Fifths", [[Interface\\AddOns\\MaxUI\\Medias\\Textures\\Fifths.tga]])
	LSM:Register('texture', "Fourths", [[Interface\\AddOns\\MaxUI\\Medias\\Textures\\Fourths.tga]])
	LSM:Register('texture', "Glamour", [[Interface\\AddOns\\MaxUI\\Medias\\Textures\\Glamour6.tga]])
	LSM:Register('texture', "Minimalist", [[Interface\\AddOns\\MaxUI\\Medias\\Textures\\Minimalist.tga]])
	LSM:Register('texture', "Tukui", [[Interface\\AddOns\\Tukui\Medias\Textures\Status\\Tukui.tga]])
	LSM:Register('texture', "HalfBar", [[Interface\\AddOns\\Tukui\Medias\Textures\Status\\halfbar.tga]])
end