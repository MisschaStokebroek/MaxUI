------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

--setting up TOOLTIP.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Tooltips = T["Tooltips"]
local baseCreateAnchor = Tooltips.CreateAnchor
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
	-- Tukui
	baseCreateAnchor(self)
	
	-- MaxUI
	if (C.General.Themes.Value == "MaxUI") then
		self:MaxUITooltipAnchor()
	end	
end

------------------------------------------------------------------------------------------
-- COLOR, BACKDROP, ...
------------------------------------------------------------------------------------------
function Tooltips:MaxUITooltipStyle()

	if not (C.General.Themes.Value == "MaxUI") then return end
	local HealthBar = GameTooltipStatusBar
	local GameTooltip = GameTooltip
	local BackdropR, BackdropG, BackdropB = unpack(C["General"]["BackdropColor"])
	local BackdropAlpha = (C["General"]["GeneralPanelAlpha"])
	local Backdrop = self.Backdrop

	HealthBar:ClearAllPoints()
	HealthBar:SetPoint("BOTTOMLEFT", HealthBar:GetParent(), "TOPLEFT", 1, 4)
	HealthBar:SetPoint("BOTTOMRIGHT", HealthBar:GetParent(), "TOPRIGHT", -1, 4)

	HealthBar.Backdrop:SetOutside(Health)
	HealthBar.Backdrop:SetBorderColor(unpack(C.General.BorderColor))
	HealthBar.Backdrop:SetBackdropColor(BackdropR, BackdropG, BackdropB, 1)
	
	HealthBar.Text:SetScale(C.Tooltips.HealthFontSize/10)
end

baseTooltipSkin = Tooltips.Skin
function Tooltips:Skin(style)
	baseTooltipSkin(self, style)
	
	local BackdropAlpha = (C["Tooltips"]["TooltipAlpha"])
	if self ~= GameTooltipTooltip then
		local Backdrop = self.Backdrop
		Backdrop:SetAlpha(BackdropAlpha)
	end

end
------------------------------------------------------------------------------------------
-- HEALTHBAR POSITION
------------------------------------------------------------------------------------------
function Tooltips:Enable()
	-- Tukui
	baseEnable(self)

	if not C["Tooltips"]["Enable"] then return end

	-- MaxUI
	self:MaxUITooltipStyle()
end