------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkins

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local ProjectAzilrokaSkin = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- SKIN ProjectAzilroka
------------------------------------------------------------------------------------------
local function SkinProjectAzilrokaToMaxUIStyle()
	local Minimap = T.Maps.Minimap
	if not SquareMinimapButtonBar.IsMaxUISkinned then

		SquareMinimapButtonBar.Backdrop:Kill()

		local SquareMinimapButtonBarBackdrop = CreateFrame("Frame", SquareMinimapButtonBarBackdrop, SquareMinimapButtonBar)
		SquareMinimapButtonBarBackdrop:SetAllPoints(SquareMinimapButtonBar)
		SquareMinimapButtonBarBackdrop:SkinMaxUIFrame(true)

		SquareMinimapButtonBar:ClearAllPoints()
		if C["AddOns"]["MBBMaxUIFrameStyle"] then
			SquareMinimapButtonBar:SetPoint("TOPRIGHT", Minimap, "BOTTOMRIGHT", 0, -29)
			SquareMinimapButtonBar:CreateMaxUIHeader("Minimap buttons", true)
		else	
			SquareMinimapButtonBar:SetPoint("TOPRIGHT", Minimap, "BOTTOMRIGHT", 0, -6)
		end
		SquareMinimapButtonBar.IsMaxUISkinned = true
	end	
end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function ProjectAzilrokaSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	--if not T.Retail then return end
	if not C.Skins.MaxUISkinsAddons then return end

	if IsAddOnLoaded('ProjectAzilroka') and C["AddOns"]["ProjectAzilrokaSkin"] then 
		SkinProjectAzilrokaToMaxUIStyle()
	end
	self:UnregisterAllEvents()
end

ProjectAzilrokaSkin:RegisterEvent("PLAYER_LOGIN")
ProjectAzilrokaSkin:SetScript("OnEvent", ProjectAzilrokaSkin.OnEvent)