------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-07-2021
------------------------------------------------------------------------------------------

-- setting up EXTRA BAR.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local ActionBars = T.ActionBars
local Movers = T["Movers"]
local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}

local baseSetupExtraButton = ActionBars.SetupExtraButton
local _G = _G

--if IsAddOnLoaded("MaxUI") then return end

------------------------------------------------------------------------------------------
-- EXTRA BAR
------------------------------------------------------------------------------------------
function ActionBars:VisibilityExtraBar()
	local Container = ExtraAbilityContainer
	local Button = ExtraActionButton1
	local Holder = TukuiExtraActionButton

	if C["ActionBars"]["Extrabar"]["Value"] == "Show"  then
		Button:SetAlpha(1)
		Container:SetAlpha(1)
		TukuiExtraActionButton:SetAlpha(1)
	end
	
	if C["ActionBars"]["Extrabar"]["Value"] == "Hide"  then
		Button:Kill()
		Container:Kill()
		TukuiExtraActionButton:Kill()
	end

	if C["ActionBars"]["Extrabar"]["Value"] == "Mouseover"  then
	Button:SetAlpha(C["ActionBars"]["ExtraBarAlpha"])
	ZoneAbilityFrame:SetAlpha(C["ActionBars"]["ExtraBarAlpha"])
	TukuiExtraActionButton:SetAlpha(C["ActionBars"]["ExtraBarAlpha"])
	ZoneAbilityFrame.SpellButtonContainer:SetAlpha(1)
	
		ZoneAbilityFrame:HookScript("OnEnter", function(self)
			Button:SetAlpha(1)
			ZoneAbilityFrame:SetAlpha(1)
			--TukuiExtraActionButton:SetAlpha(1)
			--ZoneAbilityFrame.SpellButtonContainer:SetAlpha(1)
		end)
		
		ZoneAbilityFrame:HookScript("OnLeave", function(self)
			Button:SetAlpha(C["ActionBars"]["ExtraBarAlpha"])
			ZoneAbilityFrame:SetAlpha(C["ActionBars"]["ExtraBarAlpha"])
			--TukuiExtraActionButton:SetAlpha(C["ActionBars"]["ExtraBarAlpha"])
			--ZoneAbilityFrame.SpellButtonContainer:SetAlpha(1)
		end)
		
	end
end

function ActionBars:CombatStateExtraBar()
	if C["ActionBars"]["ActionBarExtraCombatState"]["Value"] == "Hide" then
		RegisterStateDriver(TukuiExtraActionButton, "visibility", "[combat] hide; show")
	end

	if C["ActionBars"]["ActionBarExtraCombatState"]["Value"] == "Show" then
		RegisterStateDriver(TukuiExtraActionButton, "visibility", "[combat] show; hide")
	end
end

function ActionBars:MaxUIStyleExtraBar()
	local Container = ExtraAbilityContainer
	local Holder = TukuiExtraActionButton
	local Button = ExtraActionButton1
	local BackdropR, BackdropG, BackdropB = unpack(C["General"]["BackdropColor"])
	local BackdropAlpha = (C["ActionBars"]["ABAlpha"])

	ZoneAbilityFrame:CreateBackdrop()
	ZoneAbilityFrame:CreateShadow()
	
	if C["ActionBars"]["ExtraBarBackdrop"]== true then 
		ZoneAbilityFrame.Shadow:SetAlpha(1)
		ZoneAbilityFrame.Backdrop:SetOutside()
		ZoneAbilityFrame.Backdrop:SetAlpha(BackdropAlpha)
		ZoneAbilityFrame.Backdrop:SetBackdropColor(BackdropR, BackdropG, BackdropB)
	else
		ZoneAbilityFrame.Shadow:Hide()
		ZoneAbilityFrame.Shadow:SetAlpha(0)
		ZoneAbilityFrame.Backdrop:SetAlpha(0)
	end
end

function ActionBars:StylingExtraBar()
	local Container = ExtraAbilityContainer
	local Holder = TukuiExtraActionButton
	local Button = ExtraActionButton1
	
	if C["ActionBars"]["ActionBarStanceEdges"]["Value"] == "Top" then
		Holder:CreateMaxUITopEdge("Extra")
		
	elseif C["ActionBars"]["ActionBarStanceEdges"]["Value"] == "Bottom" then
		Holder:CreateMaxUIBottomEdge()
	
	elseif C["ActionBars"]["ActionBarStanceEdges"]["Value"] == "Left" then
		Holder:CreateMaxUILeftEdge()
	
	elseif C["ActionBars"]["ActionBarStanceEdges"]["Value"] == "Right" then
		Holder:CreateMaxUIRightEdge()
	
	elseif C["ActionBars"]["ActionBarStanceEdges"]["Value"] == "LeftRight" then
		Holder:CreateMaxUILeftEdge()
		Holder:CreateMaxUIRightEdge()
	
	elseif C["ActionBars"]["ActionBarStanceEdges"]["Value"] == "TopBottom" then
		Holder:CreateMaxUITopEdge("Extra")
		Holder:CreateMaxUIBottomEdge()
	
	elseif C["ActionBars"]["ActionBarStanceEdges"]["Value"] == "All" then
		Holder:CreateMaxUITopEdge("Extra")
		Holder:CreateMaxUIBottomEdge()
		Holder:CreateMaxUILeftEdge()
		Holder:CreateMaxUIRightEdge()
	
	elseif C["ActionBars"]["ActionBarStanceEdges"]["Value"] == "None" then

	end
end

function ActionBars:SetupExtraButton()
	baseSetupExtraButton(self)
	
	local Container = ExtraAbilityContainer
	local Holder = TukuiExtraActionButton
	local Button = ExtraActionButton1

--	self.VisibilityExtraBar()
	
	--if C["ActionBars"]["ActionBarExtraCombatState"]["Value"] ~= "Nothing" then 
		--self:CombatStateExtraBar()
	--end	

	--if (C.General.Themes.Value == "MaxUI") then
		--self:MaxUIStyleExtraBar()
	--end
	
	--self:StylingExtraBar()	

end