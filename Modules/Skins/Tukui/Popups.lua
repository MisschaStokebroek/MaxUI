------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 05-11-2023
------------------------------------------------------------------------------------------

-- setting up MaxUISkinsBlizzard

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local PopupsSkin = CreateFrame("Frame")

local _G = _G
local TukuiPopups = T["Popups"]
local Miscellaneous = T["Miscellaneous"]
local StaticPopups = Miscellaneous.StaticPopups

StaticPopups.Popups = {
	StaticPopup1,
	StaticPopup2,
	StaticPopup3,
	StaticPopup4,
}

------------------------------------------------------------------------------------------
-- SKIN WhatsNew
------------------------------------------------------------------------------------------
local function SkinTukuiPopupsFrame()
	for i = 1, TukuiPopups.Total do
		local Frames = TukuiPopups.Frames
		
		if (i == 1) then
			Frames[i].Anchor:SetAlpha(0)
		end
		
		Frames[i]:SkinMaxUIBaseFrame(nil, true)
		Frames[i]:SetFrameStrata(TukuiGUI:GetFrameStrata())
		Frames[i]:SetFrameLevel(TukuiGUI:GetFrameLevel()+10)
		
		Frames[i]:ClearAllPoints()
		Frames[i]:SetPoint("TOP", UIParent, "TOP", 0, -100)
		Frames[i].ClearAllPoints = function() end
		Frames[i].SetPoint = function() end
		
		Frames[i].Button1:SkinMaxUIButton(true)
		Frames[i].Button2:SkinMaxUIButton(true)
	end
end

local function SkinBlizzardPopupsFrame()
	StaticPopup1Button1:SkinMaxUIButton(true)
	StaticPopup1Button2:SkinMaxUIButton(true)
	StaticPopup1Button3:SkinMaxUIButton(true)
	StaticPopup1Button4:SkinMaxUIButton(true)

	for _, Frame in pairs(StaticPopups.Popups) do
		Frame:SkinMaxUIBaseFrame(nil, true)
	end
end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function PopupsSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	--if not T.Retail then return end
	--if not C.Skins.MaxUISkinsBlizzard then return end

	if C["Skins"]["Popups"] then
		SkinTukuiPopupsFrame()
		SkinBlizzardPopupsFrame()
	end
	self:UnregisterAllEvents()
end

PopupsSkin:RegisterEvent("PLAYER_LOGIN")
PopupsSkin:SetScript("OnEvent", PopupsSkin.OnEvent)