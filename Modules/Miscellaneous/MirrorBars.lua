------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up MIRROBARS

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Movers = T["Movers"]
local Texture = T.GetTexture(C.General.HeaderTexture)
local Mirror = T.Miscellaneous.MirrorTimers
local baseMirrorEnable = Mirror.Enable
local BackdropAlpha = (C["General"]["GeneralPanelAlpha"])

------------------------------------------------------------------------------------------
-- Mirror Timer.
------------------------------------------------------------------------------------------
local function MaxUIMirrorTimers()
	for i = 1, MIRRORTIMER_NUMTIMERS, 1 do
		local Bar = _G["MirrorTimer"..i]
		local Text = _G[Bar:GetName().."Text"]
		local Width = C["Misc"]["BarWidth"]
		local Height = C["Misc"]["BarHeight"]
		local Texture = T.GetTexture(C["Misc"]["BarTexture"])
		
		if not Bar.isSkinned then
			local Status = _G[Bar:GetName().."StatusBar"]
			
			Status:SetStatusBarTexture(Texture)
			_G.MirrorTimer1:ClearAllPoints()
			_G.MirrorTimer1:SetPoint("TOP", UIParent, "TOP", 0, -250)
			Bar:SetWidth(Width)
			Bar:SetHeight(Height)
			
			Bar:CreateBackdrop("Transparent")
			Bar.Backdrop:SetAlpha(BackdropAlpha)
			
			Text:SetFont(C.Medias.MaxUIFont, 12)
			
			Movers:RegisterFrame(Bar)
		end	
	end
end

function Mirror:Enable()
	-- Tukui
	baseMirrorEnable(self, Bar)
	
	-- MaxUI
	if not (C.General.Themes.Value == "MaxUI") then return end
	MaxUIMirrorTimers()
end