------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up MICRO MENU FROM TUKUI

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Movers = T["Movers"]
local Miscellaneous = T["Miscellaneous"]
local MicroMenu = Miscellaneous.MicroMenu
local baseMicroMenuEnable = MicroMenu.Enable

function MicroMenu:Enable()
	baseMicroMenuEnable(self)
	
	if not C.Misc.MicroMenu then return	end

	if C["General"]["Themes"]["Value"] == "MaxUI" then
		MicroMenu:CreateMaxUIHeader("Tukui Micro menu")	
	
		local MicroMenuClose = CreateFrame("Button", "MicroMenuClose", MicroMenu.MaxUIHeader)
		MicroMenuClose:SetWidth(14)
		MicroMenuClose:SetHeight(14)
		MicroMenuClose:SetAlpha(0)
		MicroMenuClose:SetPoint("RIGHT", MicroMenu.MaxUIHeader, "RIGHT", -4, 0)
		
		MicroMenuCloseicon = MicroMenu.MaxUIHeader:CreateTexture(nil, "OVERLAY")
		MicroMenuCloseicon:SetPoint("RIGHT", MicroMenu.MaxUIHeader, "RIGHT", -4,0)
		MicroMenuCloseicon:SetWidth(14)
		MicroMenuCloseicon:SetHeight(14)
		MicroMenuCloseicon:SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\Close.tga]])

		MicroMenuClose:SetScript("OnEnter", function(self)
			MicroMenuCloseicon:SetVertexColor(1, 0, 0)
		end)
		
		MicroMenuClose:SetScript("OnLeave", function(self)
			MicroMenuCloseicon:SetVertexColor(1, 1, 1)
		end)
		
		local NumButtons = #MICRO_BUTTONS
		for i = 1, NumButtons do
			local Button = _G[MICRO_BUTTONS[i]]
			Button.Backdrop.Texture = Button.Backdrop:CreateTexture(nil, "ARTWORK")
			Button.Backdrop.Texture:SetInside()
			Button.Backdrop.Texture:SetTexture(T.GetTexture(C.General.TextureButton))
			Button.Backdrop.Texture:SetVertexColor(0.35, 0.35, 0.35)
		end
		
		-- Animation
		MicroMenu:fadeIn(C["General"]["FaderTime"])
		MicroMenu:fadeOut(C["General"]["FaderTime"])
		MicroMenuClose:SetScript("OnMouseUp", function(self) MicroMenu:Toggle() end)

		-- Combat State
		RegisterStateDriver(MicroMenu, "visibility", "[combat] hide; nil")
	end
end