------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- setting up LOSS OF CONTROL.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()

if not T.Retail then return end

local Movers = T["Movers"]
local LossControl = T.Miscellaneous.LossControl
local baseLossControlUpdate = LossControl.Update
local baseLossControlEnable = LossControl.Enable

------------------------------------------------------------------------------------------
-- Loss of Control
------------------------------------------------------------------------------------------
function LossControl:Update()
	baseLossControlUpdate(self)

	if not (C.General.Themes.Value == "MaxUI") then return end
	self.AbilityName:SetFont(C.Medias.Font, 16)
	self.TimeLeft.NumberText:SetFont(C.Medias.Font, 16)
	self.TimeLeft.SecondsText:SetFont(C.Medias.Font, 16)

	--if C["Skins"]["ActionBarButtonFilter"] == true then 
	--	self.Icon:CreateMaxUIFilter() -- !! bug
	--end
end

function LossControl:Enable()
	baseLossControlEnable(self)

	Movers:RegisterFrame(LossOfControlFrame, "Loss of Control")
end