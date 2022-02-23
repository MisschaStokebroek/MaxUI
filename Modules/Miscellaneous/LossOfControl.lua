------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
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
	-- Tukui
	baseLossControlUpdate(self)

	-- MaxUI
	if not (C.General.Themes.Value == "MaxUI") then return end
	self.AbilityName:SetFont(C.Medias.Font, 16)
	self.TimeLeft.NumberText:SetFont(C.Medias.Font, 16)
	self.TimeLeft.SecondsText:SetFont(C.Medias.Font, 16)
end

function LossControl:Enable()
	baseLossControlEnable(self)

	Movers:RegisterFrame(LossOfControlFrame, "Loss of Control")
end
