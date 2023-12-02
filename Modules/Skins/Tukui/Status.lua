------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 19-11-2023
------------------------------------------------------------------------------------------

-- setting up MaxUISkinsBlizzard

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 

------------------------------------------------------------------------------------------
-- SKIN Status Frame
------------------------------------------------------------------------------------------
local Status = TukuiStatus
local baseStatusShowWindow = Status.ShowWindow

function Status:ShowWindow()
	baseStatusShowWindow(self)

	TukuiStatus:SkinMaxUIBaseFrame(nil, true)

	TukuiStatus.Logo:ClearAllPoints()
	TukuiStatus.Logo:SetPoint("TOPLEFT", TukuiStatus, "TOPLEFT", 6, -6)
	TukuiStatus.Logo:SetSize(56, 56)

	TukuiStatus.Close:SkinMaxUIButton(true)

	TukuiStatus.MaxUILogo = TukuiStatus:CreateTexture(nil, "OVERLAY")
	TukuiStatus.MaxUILogo:SetSize(128, 64)
	TukuiStatus.MaxUILogo:SetPoint("TOPRIGHT", TukuiStatus, "TOPRIGHT", -2, -2)
	TukuiStatus.MaxUILogo:SetTexture([[Interface\AddOns\MaxUI\Medias\MaxUI\MaxUI_LOGO.tga]])
end