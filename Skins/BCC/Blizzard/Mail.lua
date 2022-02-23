------------------------------------------------------------------------------------------
-- MaxUI 6 - SHADOWLANDS / TUKUI 20
-- latest update: 27-10-2020
------------------------------------------------------------------------------------------

-- setting up MaxUISkins

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
if not IsAddOnLoaded('AddonSkins') then 
	return
end

local AS, ASL = unpack(AddOnSkins)
if not AS:CheckAddOn('Tukui') then return end
local T, C
local _G = _G

------------------------------------------------------------------------------------------
-- MAIL
------------------------------------------------------------------------------------------
local AS_Blizzard_Calendar = AS.Blizzard_Mail
function AS:Blizzard_Mail()
	AS_Blizzard_Calendar(self)
	
	if not Tukui then return end
	if not T then
		T, C = Tukui:unpack()
	end

	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	
	-- adjustments
	MailFrameInset:StripTextures()
	--MailFrameInset.NineSlice:StripTextures()

	MailItem1:ClearAllPoints()
	MailItem1:SetPoint("TOP", MailFrame, "TOP", 0, -64)
	
	-- header
	MailFrame:CreateMaxUIHeader("Mail")
	MailFrame:CreateShadow()
	MailFrame.MaxUIHeader:SetFrameLevel(15)
	
	-- close button
	MailFrameCloseButton:ClearAllPoints()
	MailFrameCloseButton:SetFrameLevel(16)
	MailFrameCloseButton:SetFrameStrata("HIGH")
	MailFrameCloseButton:SetPoint("RIGHT", MailFrame.MaxUIHeader, "RIGHT", 4, 0)

	-- relocate
	MailFrame:ClearAllPoints()
	MailFrame:SetPoint("TOPRIGHT", UIParent, "TOP", -300, -100)
	MailFrame.ClearAllPoints = function() end
	MailFrame.SetPoint = function() end

end
AS:RegisterSkin('Blizzard_Mail', AS.Blizzard_Mail)