------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- setting up ACTION BAR 8.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local ActionBars = T.ActionBars
local Chat = T["Chat"]
local baseCreateBar8 = ActionBars.CreateBar8
local Num = NUM_ACTIONBAR_BUTTONS

------------------------------------------------------------------------------------------
-- ACTIONBAR 8
------------------------------------------------------------------------------------------
function ActionBars:SizingAB8()
	local ActionBar8 = ActionBars.Bars.Bar8
	local ButtonsPerRow = C.ActionBars.Bar8ButtonsPerRow
	local NumButtons = C.ActionBars.Bar8NumButtons
	local Size = C["ActionBars"]["ActionBar8ButtonSize"]
	local Spacing = C.ActionBars.ButtonSpacing
	
	if NumButtons <= ButtonsPerRow then
		ButtonsPerRow = NumButtons
	end
	
	local NumRow = ceil(NumButtons / ButtonsPerRow)

	ActionBar8:SetWidth((Size * ButtonsPerRow) + (Spacing * (ButtonsPerRow + 1)))
	ActionBar8:SetHeight((Size * NumRow) + (Spacing * (NumRow + 1)))
	
	for i = 1, Num do
		local Button = _G["MultiBar7Button"..i]
		
		Button:SetSize(Size, Size)
	end
end

function ActionBars:VisibilityAB8()
	local ActionBar8 = ActionBars.Bars.Bar8

	if C["ActionBars"]["Actionbar8"]["Value"] == "Show" then
		ActionBar8:SetAlpha(1)
	end

	if C["ActionBars"]["Actionbar8"]["Value"] == "Hide" then
		ActionBar8:Kill()
		
		for i = 1, Num do
			local Button = _G["MultiBar7Button"..i]
			Button:Kill()
			ActionBar8["MultiBar7Button"..i] = Button
		end
	end

	if C["ActionBars"]["Actionbar8"]["Value"] == "Mouseover"  then
		ActionBar8:SetAlpha(C["ActionBars"]["ActionBar8Alpha"])
	
		ActionBar8:SetScript("OnEnter", function(self)
			ActionBar8:SetAlpha(1)
		end)
		
		ActionBar8:SetScript("OnLeave", function(self)
			ActionBar8:SetAlpha(C["ActionBars"]["ActionBar8Alpha"])
		end)

		for i = 1, Num do
			local Button = _G["MultiBar7Button"..i]

			Button:HookScript("OnEnter", function(self)
				ActionBar8:SetAlpha(1)
			end)
			
			Button:HookScript("OnLeave", function(self)
				ActionBar8:SetAlpha(C["ActionBars"]["ActionBar8Alpha"])
			end)
		
			ActionBar8["MultiBar7Button"..i] = Button
		end
	end
end

function ActionBars:CombatStateAB8()
	local ActionBar8 = ActionBars.Bars.Bar8

	if C["ActionBars"]["ActionBar8CombatState"]["Value"] == "Hide" then
		RegisterStateDriver(ActionBar8, "visibility", "[combat] hide; show")
	end

	if C["ActionBars"]["ActionBar8CombatState"]["Value"] == "Show" then
		RegisterStateDriver(ActionBar8, "visibility", "[combat] show; hide")
	end
end

function ActionBars:PositionAB8()
	local ActionBar1 = ActionBars.Bars.Bar1
	local ActionBar2 = ActionBars.Bars.Bar2
	local ActionBar3 = ActionBars.Bars.Bar3
	local ActionBar4 = ActionBars.Bars.Bar4
	local ActionBar5 = ActionBars.Bars.Bar5
	local ActionBar6 = ActionBars.Bars.Bar6
	local ActionBar7 = ActionBars.Bars.Bar7
	local ActionBar8 = ActionBars.Bars.Bar8

	ActionBar8:ClearAllPoints()
	ActionBar8:SetPoint("RIGHT", UIParent, "CENTER", -100, 0)

	-- Healer
	if C["Layout"]["LayoutRole"]["Value"] == "Healer" then
		
		-- basic
		if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
		
		-- single
		elseif C["Layout"]["LayoutAB"]["Value"] == "Single" then
		
		-- double
		elseif C["Layout"]["LayoutAB"]["Value"] == "Double" then
		
		else

		end
	end
	
	-- Tank or Melee
	if C["Layout"]["LayoutRole"]["Value"] == "Melee" or C["Layout"]["LayoutRole"]["Value"] == "Tank" then
		
		-- basic
		if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
			ActionBar8:ClearAllPoints()
			ActionBar8:SetPoint("BOTTOM", ActionBar1, "TOp", 0, 4)

		-- single
		elseif C["Layout"]["LayoutAB"]["Value"] == "Single" then
		
		-- double
		elseif C["Layout"]["LayoutAB"]["Value"] == "Double" then

		end
	end
	
	-- Range
	if C["Layout"]["LayoutRole"]["Value"] == "Range" then
		
		-- basic
		if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
		
		-- single
		elseif C["Layout"]["LayoutAB"]["Value"] == "Single" then
		
		-- double
		elseif C["Layout"]["LayoutAB"]["Value"] == "Double" then

		end
	end
end

function ActionBars:MaxUIStyleAB8()
	local BackdropR, BackdropG, BackdropB = unpack(C["General"]["BackdropColor"])
	local BackdropAlpha = (C["ActionBars"]["ABAlpha"])
	local ActionBar8 = ActionBars.Bars.Bar8

	if C["ActionBars"]["ActionBar8Backdrop"]== true then 
		ActionBar8.Shadow:SetAlpha(1)
		ActionBar8.Backdrop:SetOutside()
		ActionBar8.Backdrop:SetAlpha(BackdropAlpha)
		ActionBar8.Backdrop:SetBackdropColor(BackdropR, BackdropG, BackdropB)
	else
		for i = 1, Num do
			local Button = _G["MultiBar7Button"..i]
			Button:CreateShadow()
			ActionBar8["MultiBar7Button"..i] = Button
		end
		
		ActionBar8.Shadow:SetAlpha(0)
		ActionBar8.Backdrop:SetAlpha(0)
	end
end

function ActionBars:StylingAB8()
	local ActionBar8 = ActionBars.Bars.Bar8

	if C["ActionBars"]["ActionBar8Edges"]["Value"] == "Top" then
		ActionBar8:CreateMaxUITopEdge("8")
		
	elseif C["ActionBars"]["ActionBar8Edges"]["Value"] == "Bottom" then
		ActionBar8:CreateMaxUIBottonmEdge()
	
	elseif C["ActionBars"]["ActionBar8Edges"]["Value"] == "Left" then
		ActionBar8:CreateMaxUILeftEdge()
	
	elseif C["ActionBars"]["ActionBar8Edges"]["Value"] == "Right" then
		ActionBar8:CreateMaxUIRightEdge()
	
	elseif C["ActionBars"]["ActionBar8Edges"]["Value"] == "LeftRight" then
		ActionBar8:CreateMaxUILeftEdge()
		ActionBar8:CreateMaxUIRightEdge()
	
	elseif C["ActionBars"]["ActionBar8Edges"]["Value"] == "TopBottom" then
		ActionBar8:CreateMaxUITopEdge("8")
		ActionBar8:CreateMaxUIBottomEdge()
	
	elseif C["ActionBars"]["ActionBar8Edges"]["Value"] == "All" then
		ActionBar8:CreateMaxUITopEdge("8")
		ActionBar8:CreateMaxUIBottomEdge()
		ActionBar8:CreateMaxUILeftEdge()
		ActionBar8:CreateMaxUIRightEdge()
	end
end

function ActionBars:CreateBar8()
    baseCreateBar8(self)
	
	if not C.ActionBars.Bar8 then return end

	self:VisibilityAB8()
	
	if C["ActionBars"]["ActionBar5CombatState"]["Value"] ~= "Nothing" then 
		self:CombatStateAB8()
	end
	
	self:SizingAB8()
	self:PositionAB8()
	
	if (C.General.Themes.Value == "MaxUI") then
		self:MaxUIStyleAB8()
	end
	
	self:StylingAB8()	
end