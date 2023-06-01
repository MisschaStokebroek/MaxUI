------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 01-05-2023
------------------------------------------------------------------------------------------

-- setting up CHAT BUBBLES

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Bubbles = T.Chat.Bubbles
local baseSkinBubbles = Bubbles.Skin

function Bubbles:Skin(bubble)
	baseSkinBubbles(self, bubble)
	
	local Bubble = bubble
	local Frame = bubble:GetChildren()
	
	if Frame and not Frame:IsForbidden() then
		local Text = Frame.String
		Text:SetFont(C.Medias.Font, C.Chat.BubblesTextSize)

		Frame:SkinMaxUIFrame()
		
		Frame.icon = Frame:CreateTexture(nil, "OVERLAY")
		Frame.icon:SetDrawLayer("OVERLAY", 5)
		Frame.icon:SetWidth(18)
		Frame.icon:SetHeight(18)
		Frame.icon:SetPoint("BOTTOMLEFT", Frame, "TOPLEFT", 0, 0)
		Frame.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\Chat.tga]])

		Frame.Name:ClearAllPoints()
		Frame.Name:SetPoint("LEFT", Frame.icon, "RIGHT", 4, 0)
	end
end