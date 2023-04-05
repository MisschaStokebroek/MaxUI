------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up ERRORSPEECH.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Miscellaneous = T["Miscellaneous"]
local Errors = Miscellaneous.Errors
local baseErrorSpeechEnable = Errors.Enable

------------------------------------------------------------------------------------------
-- ERRORSPEECH
------------------------------------------------------------------------------------------
function Errors:Enable()
	baseErrorSpeechEnable(self)
	
	UIErrorsFrame:SetFont(C.Medias.Font, C.Misc.UIErrorSize, "")

	if C["Misc"]["ErrorSpeechEnable"] == false then
		UIErrorsFrame:Kill()
	end	
	
	-- combat state
	if C["Misc"]["ErrorSpeechCombatState"]["Value"] == "Hide" then
		RegisterStateDriver(UIErrorsFrame, "visibility", "[combat] hide; show")
	end

	if C["Misc"]["ErrorSpeechCombatState"]["Value"] == "Show" then
		RegisterStateDriver(UIErrorsFrame, "visibility", "[combat] show; hide")
	end
end