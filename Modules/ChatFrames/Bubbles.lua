------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-07-2021
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
	end
end