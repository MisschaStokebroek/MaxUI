------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- setting up TALKING HEAD.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()

if not T.Retail then return end

local TalkingHead = T["Miscellaneous"].TalkingHead
local baseTalkingHead = TalkingHead.OnEvent

------------------------------------------------------------------------------------------
-- TALKING HEAD
------------------------------------------------------------------------------------------
function TalkingHead:OnEvent(event, addon)
	if addon ~= "Blizzard_TalkingHeadUI" then return end
	baseTalkingHead(self, event, addon)

	if not (C.General.Themes.Value == "MaxUI") then return end

	local Frame = TalkingHeadFrame
	local CustomPosition = TukuiDatabase.Variables[T.MyRealm][T.MyName].Move["TalkingHeadFrame"]
	local A1, Parent, A2, X, Y = "TOP", TopLine, "BOTTOM", 0, -6
	
	if CustomPosition then
		A1, Parent, A2, X, Y = unpack(CustomPosition)
	end

	Frame:ClearAllPoints()
	Frame:SetPoint(A1, Parent, A2, X, Y)
	Frame.ignoreFramePositionManager = true
	--Frame:CreateMaxUIFilter()
end