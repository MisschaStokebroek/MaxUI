------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- setting up THREAT BAR.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local ThreatBar = T.Miscellaneous.ThreatBar
local baseCreate = ThreatBar.Create
local BackdropColor = C["General"]["BackdropColor"]
local Movers = T["Movers"]

------------------------------------------------------------------------------------------
-- THREATBAR
------------------------------------------------------------------------------------------
local function MaxUIStyleThreatBar()
	local Width = C["Misc"]["ThreatBarWidth"]
	local Height = C["Misc"]["ThreatBarHeight"]
	local Texture = T.GetTexture(C["Misc"]["ThreatBarTexture"])
	
	ThreatBar:ClearAllPoints()
	Movers:RegisterFrame(ThreatBar, "Threat Bar") -- tukui fix then remove
	ThreatBar:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 2)
	ThreatBar:SetHeight(Height) 
	ThreatBar:SetWidth(Width)
	ThreatBar:SetFrameLevel(15)
	ThreatBar:CreateBackdrop()
	ThreatBar.Backdrop:CreateShadow()
	ThreatBar:SetStatusBarTexture(Texture)

	ThreatBar.Text:SetFont(C.Medias.MaxUIFont, 12)
	ThreatBar.Text:ClearAllPoints()
	ThreatBar.Text:SetPoint("RIGHT", ThreatBar, -2, 0)
	
	ThreatBar.Title:SetFont(C.Medias.MaxUIFont, 12)
	ThreatBar.Title:ClearAllPoints()
	ThreatBar.Title:SetPoint("LEFT", ThreatBar, 2, 0)
	
	ThreatBar.Background:SetColorTexture(unpack(BackdropColor))
	
	if C["Skins"]["DataBarFilter"] == true then 
		ThreatBar:CreateMaxUIFilter()
	end
end

function ThreatBar:Create()
	if not C["Misc"]["ThreatBar"] then return end
    baseCreate(self)
	
	if not (C.General.Themes.Value == "MaxUI") then return end
	MaxUIStyleThreatBar()
end