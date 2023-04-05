------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkins

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local BugSackSkin = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- SKIN BugSack
------------------------------------------------------------------------------------------
local function SkinBugSackToMaxUIStyle()
	hooksecurefunc(BugSack, "OpenSack", function()
		
		if BugSackFrame.IsSkinned then return end

		-- cleanup
		BugSackFrame:SkinMaxUIBaseFrame(true)
		BugSackFrame:SetHeight(C.AddOns.BugSackHeight)
		--BugSackFrame:SetWidth(C.AddOns.BugSackWidth)
		BugSackFrame:SetFrameStrata("HIGH")

		BugSackPrevButton:SkinMaxUIButton(true)
		BugSackSendButton:SkinMaxUIButton(true)
		BugSackNextButton:SkinMaxUIButton(true)

		BugSackSendButton:ClearAllPoints()

		BugSackSendButton:SetPoint("TOPLEFT", BugSackPrevButton, "TOPRIGHT", 8, 0)
		BugSackSendButton:SetPoint("BOTTOMRIGHT", BugSackNextButton, "BOTTOMLEFT", -8, 0)

		BugSackTabLast:SkinMaxUITab(true)
		BugSackTabSession:SkinMaxUITab(true)
		BugSackTabAll:SkinMaxUITab(true)

		BugSackScrollScrollBar:SkinMaxUIScrollBar(true)

		-- close button
		BugSackFrame:CreateBlizzardCloseButton(BugSackFrame.MaxUIHeader)
		BugSackFrame.BlizzardCloseButton:SetScript("OnMouseDown", function(self)
			BugSack.CloseSack()
		end)

		BugSackFrame.IsSkinned = true
	end)
end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function BugSackSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsAddons then return end

	if IsAddOnLoaded('BugSack') and C["AddOns"]["BugSackSkin"] then 
		SkinBugSackToMaxUIStyle()
	end
	self:UnregisterAllEvents()
end

BugSackSkin:RegisterEvent("PLAYER_LOGIN")
BugSackSkin:SetScript("OnEvent", BugSackSkin.OnEvent)