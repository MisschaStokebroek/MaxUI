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
-- CALENDAR
------------------------------------------------------------------------------------------
local AS_Blizzard_Calendar = AS.Blizzard_Calendar
function AS:Blizzard_Calendar(event, addon)

	if not Tukui then return end
	if not T then T, C = Tukui:unpack()	end
	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	if addon ~= 'Blizzard_Calendar' then return end

	_G.CalendarCreateEventTitleFrame = _G.CalendarCreateEventFrame.Header
	_G.CalendarTexturePickerTitleFrame = _G.CalendarTexturePickerFrame.Header
	_G.CalendarMassInviteTitleFrame	= _G.CalendarMassInviteFrame.Header
	_G.CalendarViewRaidTitleFrame = _G.CalendarViewRaidFrame.Header
	_G.CalendarViewHolidayTitleFrame = _G.CalendarViewHolidayFrame.Header
	_G.CalendarViewEventTitleFrame = _G.CalendarViewEventFrame.Header
	_G.CalendarEventPickerTitleFrame = _G.CalendarEventPickerFrame.Header
	
	AS_Blizzard_Calendar(self, event, addon)

	-- adjustments
	local Font = C.Medias.MaxUIFont
	
	-- create
	_G.CalendarCreateEventFrame:ClearAllPoints()
	_G.CalendarCreateEventFrame:CreateShadow()
	_G.CalendarCreateEventFrame:SetPoint("TOPLEFT", _G.CalendarFrame, "TOPRIGHT", 3, 0)
	_G.CalendarCreateEventFrame:SetPoint("BOTTOMLEFT", _G.CalendarFrame, "BOTTOMRIGHT", 3, 0)
	

	_G.CalendarCreateEventInviteList:ClearAllPoints()
	_G.CalendarCreateEventInviteList:SetWidth(_G.CalendarCreateEventInviteList:GetWidth()+4)
	_G.CalendarCreateEventInviteList:SetPoint("BOTTOM", _G.CalendarCreateEventFrame , "BOTTOM", 0, 61)
	
	_G.CalendarCreateEventInviteEdit:ClearAllPoints()
	_G.CalendarCreateEventInviteEdit:SetPoint("TOPLEFT", _G.CalendarCreateEventInviteList, "BOTTOMLEFT", 1, -4)
	
	_G.CalendarCreateEventMassInviteButton:ClearAllPoints()
	_G.CalendarCreateEventMassInviteButton:SetPoint("TOPLEFT", _G.CalendarCreateEventInviteEdit, "BOTTOMLEFT", -1, -4)
	
	local SetName = _G.CalendarCreateEventFrame:CreateFontString(nil, "OVERLAY")  
	SetName:SetPoint("TOPLEFT", _G.CalendarCreateEventFrame, "TOPLEFT", 8, -90)
	SetName:SetFont(Font, 10, 0, 0)
	SetName:SetText("Set Title")

	_G.CalendarCreateEventTitleEdit:SetHeight(26)
	_G.CalendarCreateEventTitleEdit:ClearAllPoints()
	_G.CalendarCreateEventTitleEdit:SetPoint("LEFT", SetName, "RIGHT", 8, 0)
	_G.CalendarCreateEventTitleEdit:SetWidth(248)

	local SetType = _G.CalendarCreateEventFrame:CreateFontString(nil, "OVERLAY")  
	SetType:SetPoint("TOPLEFT", _G.CalendarCreateEventFrame, "TOPLEFT", 8, -130)
	SetType:SetFont(Font, 10, 0, 0)
	SetType:SetText("Set Type")
	
	_G.CalendarCreateEventTypeDropDown:ClearAllPoints()
	_G.CalendarCreateEventTypeDropDown:SetPoint("LEFT", SetType, "RIGHT", 0, 0)
	_G.CalendarCreateEventTypeDropDown:SetWidth(144)
	
	_G.CalendarCreateEventDifficultyOptionDropDown:ClearAllPoints()		
	_G.CalendarCreateEventDifficultyOptionDropDown:SetPoint("LEFT", _G.CalendarCreateEventTypeDropDown, "RIGHT", -24, 0)		
	_G.CalendarCreateEventDifficultyOptionDropDown:SetWidth(144)		
	
	local SetTime = _G.CalendarCreateEventFrame:CreateFontString(nil, "OVERLAY")  
	SetTime:SetPoint("TOPLEFT", _G.CalendarCreateEventFrame, "TOPLEFT", 8, -170)
	SetTime:SetFont(Font, 10, 0, 0)
	SetTime:SetText("Set Time")

	_G.CalendarCreateEventHourDropDown:SetWidth(102)
	_G.CalendarCreateEventMinuteDropDown:SetWidth(102)	
	_G.CalendarCreateEventAMPMDropDown:SetWidth(102)
	
	_G.CalendarCreateEventHourDropDown:ClearAllPoints()
	_G.CalendarCreateEventHourDropDown:SetPoint("LEFT", SetTime, "RIGHT", 0, 0)

	local SetDesc = _G.CalendarCreateEventFrame:CreateFontString(nil, "OVERLAY")  
	SetDesc:SetPoint("TOPLEFT", _G.CalendarCreateEventFrame, "TOPLEFT", 8, -210)
	SetDesc:SetFont(Font, 10, 0, 0)
	SetDesc:SetText("Set Description")

	_G.CalendarCreateEventDescriptionContainer:ClearAllPoints()
	_G.CalendarCreateEventDescriptionContainer:SetPoint("BOTTOM", _G.CalendarCreateEventInviteList, "TOP", 0, 20)
	_G.CalendarCreateEventDescriptionContainer:SetWidth(_G.CalendarCreateEventDescriptionContainer:GetWidth()+12)

	_G.CalendarCreateEventLockEventCheck:ClearAllPoints()
	_G.CalendarCreateEventLockEventCheck:SetPoint("BOTTOMRIGHT", _G.CalendarCreateEventDescriptionContainer , "TOPRIGHT", -64, 2)

	for i = 1, 12 do
		local Button = _G["CalendarClassButton"..i]
		Button:SetSize(32, 32)
		Button:CreateShadow()
	end
	
	_G.CalendarClassTotalsButton:SetHeight(32)
	_G.CalendarClassTotalsButton:SetWidth(32)
	_G.CalendarClassTotalsButton:CreateShadow()
	_G.CalendarClassTotalsButton.Backdrop:SetBackdrop(nil)

	-- view
	_G.CalendarViewEventFrame:ClearAllPoints()
	_G.CalendarViewEventFrame:CreateShadow()
	_G.CalendarViewEventFrame:SetPoint("TOPLEFT", _G.CalendarFrame, "TOPRIGHT", 3, 0)
	_G.CalendarViewEventFrame:SetPoint("BOTTOMLEFT", _G.CalendarFrame, "BOTTOMRIGHT", 3, 0)

	-- header
	_G.CalendarFrame:CreateMaxUIHeader("Calendar")
	_G.CalendarFrame:CreateShadow()
	_G.CalendarFrame.MaxUIHeader:SetFrameLevel(15)
	
	_G.CalendarCreateEventFrame:CreateMaxUIHeader(" ")
	_G.CalendarCreateEventFrame:CreateShadow()
	_G.CalendarCreateEventFrame.MaxUIHeader:SetFrameLevel(15)
	
	-- close button
	_G.CalendarCloseButton:ClearAllPoints()
	_G.CalendarCloseButton:SetFrameLevel(16)
	_G.CalendarCloseButton:SetFrameStrata("HIGH")
	_G.CalendarCloseButton:SetPoint("RIGHT", _G.CalendarFrame.MaxUIHeader, "RIGHT", 4, 0)

	-- relocate
	_G.CalendarFrame:ClearAllPoints()
	_G.CalendarFrame:SetPoint("TOP", UIParent, "TOP", 0, -100)
	_G.CalendarFrame.ClearAllPoints = function() end
	_G.CalendarFrame.SetPoint = function() end

	AS:UnregisterSkinEvent(addon, event)
end
AS:RegisterSkin('Blizzard_Calendar', AS.Blizzard_Calendar, 'ADDON_LOADED')