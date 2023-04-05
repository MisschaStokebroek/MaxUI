------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 28-03-2023
------------------------------------------------------------------------------------------

-- setting up MIRROBARS

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Mirror = T.Miscellaneous.MirrorTimers
local Movers = T["Movers"]
local baseMirrorEnable = Mirror.Enable

------------------------------------------------------------------------------------------
-- Mirror Timer.
------------------------------------------------------------------------------------------
function Mirror:MaxUIUpdate()
	for i = 1, MIRRORTIMER_NUMTIMERS, 1 do
		local Bar = _G["MirrorTimer"..i]
		
		if Bar and not Bar.isMaxUISkinned then
			local Width = C["Misc"]["BarWidth"]
			local Height = C["Misc"]["BarHeight"]
			local Texture = T.GetTexture(C["Misc"]["BarTexture"])
			local Status = Bar.StatusBar or _G[Bar:GetName().."StatusBar"]
			local Border = Bar.Border or _G[Bar:GetName().."Border"]
			local Text = Bar.Text or _G[Bar:GetName().."Text"]
			
			Status:SetStatusBarTexture(Texture)
			Status:SetStatusBarColor(0, 0, 1)
			
			_G.MirrorTimer1:ClearAllPoints()
			_G.MirrorTimer1:SetPoint("TOP", UIParent, "TOP", 0, -250)
			
			Bar:SetWidth(Width)
			Bar:SetHeight(Height)
			Bar.Backdrop:SetAlpha(0.7)

			Text:SetFont(C.Medias.MaxUIFont, 12, "")
			
			Movers:RegisterFrame(Bar)

			if C["Skins"]["DataBarFilter"] == true then 
				Bar:CreateMaxUIFilter()
			end
			Bar.isMaxUISkinned = true
		end	
	end
end

function Mirror:Enable()
	baseMirrorEnable(self)
	hooksecurefunc("MirrorTimer_Show", Mirror.MaxUIUpdate)
end