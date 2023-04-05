------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 30-10-2022
------------------------------------------------------------------------------------------

-- setting up ACTION BAR 6.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local ActionBars = T.ActionBars
local Chat = T["Chat"]
local baseCreateBar6 = ActionBars.CreateBar6
local Num = NUM_ACTIONBAR_BUTTONS

------------------------------------------------------------------------------------------
-- ACTIONBAR 6
------------------------------------------------------------------------------------------
function ActionBars:SizingAB6()
	local ActionBar6 = ActionBars.Bars.Bar6
	local ButtonsPerRow = C.ActionBars.Bar6ButtonsPerRow
	local NumButtons = C.ActionBars.Bar6NumButtons
	local Size = C["ActionBars"]["ActionBar6ButtonSize"]
	local Spacing = C.ActionBars.ButtonSpacing
	
	if NumButtons <= ButtonsPerRow then
		ButtonsPerRow = NumButtons
	end
	
	local NumRow = ceil(NumButtons / ButtonsPerRow)

	ActionBar6:SetWidth((Size * ButtonsPerRow) + (Spacing * (ButtonsPerRow + 1)))
	ActionBar6:SetHeight((Size * NumRow) + (Spacing * (NumRow + 1)))
	
	for i = 1, Num do
		local Button = _G["MultiBar5Button"..i]
		Button:SetSize(Size, Size)
	end
end

function ActionBars:VisibilityAB6()
	local ActionBar6 = ActionBars.Bars.Bar6

	if C["ActionBars"]["Actionbar6"]["Value"] == "Show"  then
		ActionBar6:SetAlpha(1)
	end

	if C["ActionBars"]["Actionbar6"]["Value"] == "Hide"  then
		ActionBar6:Kill()
		
		for i = 1, Num do
			local Button = _G["MultiBar5Button"..i]
			Button:Kill()
			ActionBar6["MultiBar5Button"..i] = Button
		end
	end

	if C["ActionBars"]["Actionbar6"]["Value"] == "Mouseover"  then
		ActionBar6:SetAlpha(C["ActionBars"]["ActionBar6Alpha"])
	
		ActionBar6:SetScript("OnEnter", function(self)
			ActionBar6:SetAlpha(1)
		end)
		
		ActionBar6:SetScript("OnLeave", function(self)
			ActionBar6:SetAlpha(C["ActionBars"]["ActionBar6Alpha"])
		end)

		for i = 1, Num do
			local Button = _G["MultiBar5Button"..i]

			Button:HookScript("OnEnter", function(self)
				ActionBar6:SetAlpha(1)
			end)
			
			Button:HookScript("OnLeave", function(self)
				ActionBar6:SetAlpha(C["ActionBars"]["ActionBar5Alpha"])
			end)
		
			ActionBar6["MultiBar5Button"..i] = Button
		end
	end
end

function ActionBars:CombatStateAB6()
	local ActionBar6 = ActionBars.Bars.Bar6

	if C["ActionBars"]["ActionBar6CombatState"]["Value"] == "Hide" then
		RegisterStateDriver(ActionBar6, "visibility", "[combat] hide; show")
	end

	if C["ActionBars"]["ActionBar6CombatState"]["Value"] == "Show" then
		RegisterStateDriver(ActionBar6, "visibility", "[combat] show; hide")
	end
end

function ActionBars:PositionAB6()
	local ActionBar1 = ActionBars.Bars.Bar1
	local ActionBar2 = ActionBars.Bars.Bar2
	local ActionBar3 = ActionBars.Bars.Bar3
	local ActionBar4 = ActionBars.Bars.Bar4
	local ActionBar5 = ActionBars.Bars.Bar5
	local ActionBar6 = ActionBars.Bars.Bar6

	ActionBar6:ClearAllPoints()
	ActionBar6:SetPoint("CENTER", UIParent, "CENTER", 0, 0)

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
			ActionBar6:ClearAllPoints()
			ActionBar6:SetPoint("BOTTOMRIGHT", ActionBar4, "BOTTOMLEFT", -4, 0)

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

function ActionBars:MaxUIStyleAB6()
	local BackdropR, BackdropG, BackdropB = unpack(C["General"]["BackdropColor"])
	local BackdropAlpha = (C["ActionBars"]["ABAlpha"])
	local ActionBar6 = ActionBars.Bars.Bar6

	if C["ActionBars"]["ActionBar6Backdrop"]== true then 
		ActionBar6.Shadow:SetAlpha(1)
		ActionBar6.Backdrop:SetOutside()
		ActionBar6.Backdrop:SetAlpha(BackdropAlpha)
		ActionBar6.Backdrop:SetBackdropColor(BackdropR, BackdropG, BackdropB)
	else
		for i = 1, Num do
			local Button = _G["MultiBarLeftButton"..i]
			Button:CreateShadow()
			ActionBar6["MultiBar5Button"..i] = Button
		end
		
		ActionBar6.Shadow:SetAlpha(0)
		ActionBar6.Backdrop:SetAlpha(0)
	end
end

function ActionBars:StylingAB6()
	local ActionBar6 = ActionBars.Bars.Bar6

	if C["ActionBars"]["ActionBar6Edges"]["Value"] == "Top" then
		ActionBar6:CreateMaxUITopEdge("5")
		
	elseif C["ActionBars"]["ActionBar6Edges"]["Value"] == "Bottom" then
		ActionBar6:CreateMaxUIBottonmEdge()
	
	elseif C["ActionBars"]["ActionBar6Edges"]["Value"] == "Left" then
		ActionBar6:CreateMaxUILeftEdge()
	
	elseif C["ActionBars"]["ActionBar6Edges"]["Value"] == "Right" then
		ActionBar6:CreateMaxUIRightEdge()
	
	elseif C["ActionBars"]["ActionBar6Edges"]["Value"] == "LeftRight" then
		ActionBar6:CreateMaxUILeftEdge()
		ActionBar6:CreateMaxUIRightEdge()
	
	elseif C["ActionBars"]["ActionBar6Edges"]["Value"] == "TopBottom" then
		ActionBar6:CreateMaxUITopEdge("5")
		ActionBar6:CreateMaxUIBottomEdge()
	
	elseif C["ActionBars"]["ActionBar6Edges"]["Value"] == "All" then
		ActionBar6:CreateMaxUITopEdge("5")
		ActionBar6:CreateMaxUIBottomEdge()
		ActionBar6:CreateMaxUILeftEdge()
		ActionBar6:CreateMaxUIRightEdge()
	end
end

function ActionBars:CreateBar6()
    baseCreateBar6(self)

	if not C.ActionBars.Bar6 then return end

	self:VisibilityAB6()
	
	if C["ActionBars"]["ActionBar5CombatState"]["Value"] ~= "Nothing" then 
		self:CombatStateAB6()
	end
	
	self:SizingAB6()
	self:PositionAB6()
	
	if (C.General.Themes.Value == "MaxUI") then
		self:MaxUIStyleAB6()
	end
	
	self:StylingAB6()	
end