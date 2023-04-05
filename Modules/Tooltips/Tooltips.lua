------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

--setting up TOOLTIP.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Tooltips = T["Tooltips"]
local baseCreateAnchor = Tooltips.CreateAnchor
local baseTooltipSkin = Tooltips.Skin
local baseEnable = Tooltips.Enable

Tooltips.BackdropStyle = {
	bgFile = nil,
}

------------------------------------------------------------------------------------------
-- TOOLTIP ANCHORING
------------------------------------------------------------------------------------------
function Tooltips:MaxUITooltipAnchor()
	local Anchor = Tooltips.Anchor
	local RightChatBG = T.Chat.Panels.RightChat
	
	Anchor:ClearAllPoints()
	Anchor:SetPoint("BOTTOMRIGHT", RightChatBG, "TOPRIGHT", 0, 4)
end

function Tooltips:CreateAnchor()
	baseCreateAnchor(self)
	
	if (C.General.Themes.Value == "MaxUI") then
		self:MaxUITooltipAnchor()
	end	
end

------------------------------------------------------------------------------------------
-- COLOR, BACKDROP, ...
------------------------------------------------------------------------------------------
function Tooltips:MaxUITooltipStyle()
	
	local HealthBar = GameTooltipStatusBar
	local BackdropR, BackdropG, BackdropB = unpack(C["General"]["BackdropColor"])

	HealthBar:ClearAllPoints()
	HealthBar:SetPoint("BOTTOMLEFT", HealthBar:GetParent(), "TOPLEFT", 1, 4)
	HealthBar:SetPoint("BOTTOMRIGHT", HealthBar:GetParent(), "TOPRIGHT", -1, 4)
	if C["Skins"]["TooltipFilter"] == true then 
		HealthBar:CreateMaxUIFilter()
	end

	HealthBar.Backdrop:SetOutside(Health)
	HealthBar.Backdrop:SetBorderColor(0,0,0)
	HealthBar.Backdrop:SetBackdropColor(0,0,0)
	
	HealthBar.Text:SetScale(C.Tooltips.HealthFontSize/10)
end

function Tooltips:Skin()
	baseTooltipSkin(self)
	
	if not (C.General.Themes.Value == "MaxUI") then return end
	local BackdropAlpha = (C["Tooltips"]["TooltipAlpha"])
	if self ~= GameTooltipTooltip then
		local Backdrop = self.Backdrop
		Backdrop:SetAlpha(BackdropAlpha)
		
		if C["Skins"]["TooltipFilter"] == true then 
			Backdrop:CreateMaxUIFilterInside()
		end
	end
end
------------------------------------------------------------------------------------------
-- HEALTHBAR POSITION
------------------------------------------------------------------------------------------
function Tooltips:Enable()
	if not C["Tooltips"]["Enable"] then return end
	baseEnable(self)

	if not (C.General.Themes.Value == "MaxUI") then return end
	self:MaxUITooltipStyle()

	if C["Tooltips"]["HideInCombat"] == true then
		RegisterStateDriver(self, "visibility", "[combat] hide; show")
	end

end