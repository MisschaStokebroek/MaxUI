------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up EXPERIENCE BAR

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local DataText = T["DataTexts"]
local Experience = T.Miscellaneous.Experience
local baseSetTooltip = Experience.SetTooltip
local baseCreate = Experience.Create
local baseUpdate = Experience.Update
local baseEnable = Experience.Enable
local baseDisplayMenu = Experience.DisplayMenu
local Movers = T["Movers"]

local Class = select(2, UnitClass("player"))
local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
Experience.RestedColor = {0/255, 144/255, 255/255}
Experience.XPColor = {163/255, 53/255, 238/255}
Experience.PetXPColor = {255 / 255, 255 / 255, 105 / 255}
local Bars = 20
Experience.NumBars = 2

local XPFrameHolder = CreateFrame("Frame", "XPFrameHolder", UIParent)
XPFrameHolder:SetHeight(22) 
XPFrameHolder:SetWidth(200)
XPFrameHolder:SetPoint("CENTER", UIParent, "CENTER", 0, -120)

function Experience:DisplayMenu()
	if (C.General.Themes.Value == "MaxUI") then return end
	baseDisplayMenu(self)
end

------------------------------------------------------------------------------------------
-- EXPERIENCE TOOLTIP
------------------------------------------------------------------------------------------
function Experience:SetTooltip()
	baseSetTooltip(self)
	
	if not (C.General.Themes.Value == "MaxUI") then return end
	if not C.Misc.ExperienceEnable then return end

	local BarType = self.BarType
	local Current, Max, Pts

	GameTooltip:SetOwner(self, "ANCHOR_CURSOR", 0, 8)

	if BarType == "XP" then
		local Rested = GetXPExhaustion()
		local IsRested = GetRestState()
		
		Current, Max = Experience:GetExperience()
		
		if Max == 0 then
			return
		end
		
		GameTooltip:AddLine("Experience:")
		GameTooltip:AddLine("Current experience and rested state", 1, 1, 1, 1, 1, 1)
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine("|cffA335EE"..XP..": " .. Current .. " / " .. Max .. " (" .. floor(Current / Max * 100) .. "% - " .. floor(Bars - (Bars * (Max - Current) / Max)) .. "/" .. Bars .. ")|r")
	
		if (IsRested == 1 and Rested) then
			GameTooltip:AddLine("|cff0090FF"..TUTORIAL_TITLE26..": +" .. Rested .." (" .. floor(Rested / Max * 100) .. "%)|r")
		end
	end
	
	GameTooltip:Show()
end

------------------------------------------------------------------------------------------
-- EXPERIENCE CREATE ADJUST
------------------------------------------------------------------------------------------
function Experience:Create()
	baseCreate(self)
	
	if not (C.General.Themes.Value == "MaxUI") then return end
	if not C.Misc.ExperienceEnable then return end

	local XPBar = self.XPBar1
	local XPBar2 = self.XPBar2
	local RestedBar = self.RestedBar1
	local BarHeight = C["Misc"]["XPBarHeight"]
	local BarWidth = C["Misc"]["XPBarWidth"]
	local BarTexture = C["Misc"]["XPBarTexture"]
	local PlayerLevel = UnitLevel("player")

	XPBar:ClearAllPoints()
	XPBar2:ClearAllPoints()
	
	XPBar:ClearAllPoints()
	XPBar:SetParent(XPFrameHolder)
	XPBar:SetPoint("CENTER", XPFrameHolder, "CENTER", 0, 0)
	XPBar:SetWidth(BarWidth)
	XPBar:SetHeight(BarHeight)
	XPBar.Backdrop:SetOutside()

	XPBar:SetOrientation'HORIZONTAL'
	XPBar:SetFrameLevel(11)
	XPBar:SetStatusBarTexture(T.GetTexture(BarTexture))
	
	XPtext = XPBar:CreateFontString(nil, "OVERLAY")
	XPtext:SetFontObject(T.GetFont(C["DataTexts"].Font))
	XPtext:SetScale(C.DataTexts.FontSize/10)
	XPtext:SetText("Exp")

	--if PlayerLevel == MAX_PLAYER_LEVEL then
		--XPtext:ClearAllPoints()
		--XPtext:SetPoint("CENTER", XPBar, "CENTER", 0, 0)
	--end

	XPpercenttext = XPBar:CreateFontString(nil, "OVERLAY")
	if C["Misc"]["PercentageTag"] == true then
		XPpercenttext:SetFontObject(T.GetFont(C["DataTexts"].Font))
		XPpercenttext:SetScale(C.DataTexts.FontSize/10)
	end	

	if C["Misc"]["XPBarTextPlacement"]["Value"] == "Inside" then
		XPpercenttext:SetPoint("RIGHT", XPBar, "RIGHT", -6, 0)
		XPtext:SetPoint("LEFT", XPBar, "LEFT", 6, 0)
	
	elseif C["Misc"]["HONORBarTextPlacement"]["Value"] == "Outside" then
		XPpercenttext:SetPoint("LEFT", XPBar, "RIGHT", 6, 0)
		XPtext:SetPoint("RIGHT", XPBar, "LEFT", -6, 0)
	end	

	RestedBar:SetParent(XPBar)
	RestedBar:SetStatusBarTexture(T.GetTexture(BarTexture))
	RestedBar:SetAlpha(0.5)

	XPBar:HookScript("OnEnter", function(self)
		XPBar.Backdrop:SetBorderColor(XPBar:GetStatusBarColor())
	end)

	XPBar:HookScript("OnLeave", function(self)
		XPBar.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
	end)
	
	if C["Skins"]["DataBarFilter"] == true then 
		XPBar:CreateMaxUIFilter()
	end
	
	XPBar2:Kill()
end

------------------------------------------------------------------------------------------
-- EXPERIENCE UPDATE
------------------------------------------------------------------------------------------
function Experience:Update()
	baseUpdate(self)

	if not (C.General.Themes.Value == "MaxUI") then return end
	if not C.Misc.ExperienceEnable then return end

	local PlayerLevel = UnitLevel("player")
	local Current, Max = self:GetExperience()
	local XPBar = self.XPBar1

	if C["Misc"]["PercentageTag"] == true then
		XPpercenttext:SetText("".. floor(Current / Max * 100) .."%")
	end	

	--if PlayerLevel == MAX_PLAYER_LEVEL then
		--XPpercenttext:Hide()
		--XPtext:SetText("Max level reached")
		--XPtext:SetPoint("CENTER", XPBar, "CENTER", 0, 0)
		--XPBar:Hide()
	--end
end

------------------------------------------------------------------------------------------
-- EXPERIENCE ENABLE/DISABLE
------------------------------------------------------------------------------------------
function Experience:Enable()

	if (C.General.Themes.Value == "MaxUI") then
	if not C.Misc.ExperienceEnable then return end -- tukui
	if not C["Misc"]["XPBarEnable"] then return end -- maxui
		
		if not C["Misc"]["XPBarDTEnable"] then
			if C["Misc"]["XPBarTextPlacement"]["Value"] == "Inside" then
				XPFrameHolder:SetHeight(C["Misc"]["XPBarHeight"] + 12) 
				XPFrameHolder:SetWidth(C["Misc"]["XPBarWidth"] + 12)
			elseif C["Misc"]["HONORBarTextPlacement"]["Value"] == "Outside" then
				XPFrameHolder:SetHeight(C["Misc"]["XPBarHeight"] + 12) 
				XPFrameHolder:SetWidth(C["Misc"]["XPBarWidth"] + 120)
			else	
				XPFrameHolder:SetHeight(C["Misc"]["XPBarHeight"] + 12) 
				XPFrameHolder:SetWidth(C["Misc"]["XPBarWidth"] + 12)
			end	
			
			if C["Misc"]["XPBarBackdrop"] == true and (C.General.Themes.Value == "MaxUI") then
				XPFrameHolder:CreateBackdrop(nil, Texture)
				XPFrameHolder.Backdrop:SetOutside()
				XPFrameHolder.Backdrop:CreateShadow()
				XPFrameHolder.Backdrop:SetAlpha(C["Misc"]["XPBarAlpha"])
			end
			Movers:RegisterFrame(XPFrameHolder, "Experience DataBar")
			
			if C["Misc"]["XPBarCombatState"]["Value"] == "Hide" then
				RegisterStateDriver(XPFrameHolder, "visibility", "[combat] hide; show")
			end
		end
	
		baseEnable(self)
	end
end

------------------------------------------------------------------------------------------
-- EXPERIENCE DATATEXT 
------------------------------------------------------------------------------------------
local Update = function(self)
	if not C.Misc.XPBarDTEnable then return end

	XPFrameHolder:ClearAllPoints()
	XPFrameHolder:SetPoint("CENTER", self, "CENTER", 0, 0)
	XPFrameHolder:SetParent(self)
end

local Enable = function(self)
	if not (C.General.Themes.Value == "MaxUI") then return end
	if not C.Misc.XPBarDTEnable then return end
	self:Update()
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:SetScript("OnEvent", self.Update)
end

local Disable = function(self)
	if not C.Misc.XPBarDTEnable then return end
	self.Text:SetText("")
	self:SetScript("OnUpdate", nil)
end

DataText:Register("|cffFFFF99Experience|r", Enable, Disable, Update)