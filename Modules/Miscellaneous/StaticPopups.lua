------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- setting up STATIC POPUPS.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Miscellaneous = T["Miscellaneous"]
local StaticPopups = Miscellaneous.StaticPopups
local BaseStaticPopupsSkin = StaticPopups.Skin

--[[
------------------------------------------------------------------------------------------
-- POPUP MESSAGES
------------------------------------------------------------------------------------------
StaticPopups.Popups = {
	StaticPopup1,
	StaticPopup2,
	StaticPopup3,
	StaticPopup4,
}

function StaticPopups:Skin()
	BaseStaticPopupsSkin(self)

	local Name = self:GetName()
	_G[Name]:CreateMaxUIHeader()
	
	if C["Skins"]["ButtonFilter"] == true then 
		_G[Name.."Button1"]:CreateMaxUIFilterInside()
		_G[Name.."Button2"]:CreateMaxUIFilterInside()
		_G[Name.."Button3"]:CreateMaxUIFilterInside()
		_G[Name.."Button4"]:CreateMaxUIFilterInside()
		_G[Name.."EditBox"]:CreateMaxUIFilterInside()
	end
end
--]]