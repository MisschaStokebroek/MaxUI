------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- setting up MICRO MENU FROM TUKUI

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Miscellaneous = T["Miscellaneous"]
local MicroMenu = Miscellaneous.MicroMenu
local baseMicroMenuGameMenu = MicroMenu.GameMenu
local baseMicroMenuMinimalist = MicroMenu.Minimalist

function MicroMenu:GameMenu()
	baseMicroMenuGameMenu(self)
	if C["General"]["Themes"]["Value"] == "MaxUI" then
		local Buttons = MicroMenu:ShownMicroButtons()

		MicroMenu:CreateMaxUIHeader("Tukui Micro menu")	
		
		for i = 1, #Buttons do
			local Button = _G[Buttons[i]]

			Button.Backdrop.Texture = Button.Backdrop:CreateTexture(nil, "BACKGROUND")
			Button.Backdrop.Texture:SetInside()
			Button.Backdrop.Texture:SetTexture(T.GetTexture(C.General.TextureButton))
			Button.Backdrop.Texture:SetVertexColor(0.35, 0.35, 0.35)

			--button mouseaction (mousover or click)
			Button:HookScript("OnEnter", function(self)
				Button.Backdrop.Texture:SetVertexColor(0.5, 0.5, 0.5)
			end)

			Button:HookScript("OnLeave", function(self)
				Button.Backdrop.Texture:SetVertexColor(0.35, 0.35, 0.35)
			end)
			
			if C["Skins"]["ButtonFilter"] == true then 
				Button.Backdrop:CreateMaxUIFilter()
			end
		end

		-- Combat State
		RegisterStateDriver(MicroMenu, "visibility", "[combat] hide; nil")
	end	
end

function MicroMenu:Minimalist()
	baseMicroMenuMinimalist(self)
	local Buttons = MicroMenu:ShownMicroButtons()
	local NumButtons = #Buttons

	if C["General"]["Themes"]["Value"] == "MaxUI" then
		for i = 1, NumButtons do
			local Button = _G[Buttons[i]]

			if C["Skins"]["ButtonFilter"] == true then 
				Button.Backdrop:CreateMaxUIFilter()
			end
		end
	end
end