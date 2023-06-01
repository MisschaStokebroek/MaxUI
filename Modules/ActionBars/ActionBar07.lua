------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 01-05-2023
------------------------------------------------------------------------------------------

-- setting up ACTION BAR 7.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local ActionBars = T.ActionBars
local Chat = T["Chat"]
local baseCreateBar7 = ActionBars.CreateBar7
local Num = NUM_ACTIONBAR_BUTTONS

------------------------------------------------------------------------------------------
-- ACTIONBAR 7
------------------------------------------------------------------------------------------
function ActionBars:SizingAB7()
	local ActionBar7 = ActionBars.Bars.Bar7
	local ButtonsPerRow = C.ActionBars.Bar7ButtonsPerRow
	local NumButtons = C.ActionBars.Bar7NumButtons
	local Size = C["ActionBars"]["ActionBar7ButtonSize"]
	local Spacing = C.ActionBars.ButtonSpacing
	
	if NumButtons <= ButtonsPerRow then
		ButtonsPerRow = NumButtons
	end
	
	local NumRow = ceil(NumButtons / ButtonsPerRow)

	ActionBar7:SetWidth((Size * ButtonsPerRow) + (Spacing * (ButtonsPerRow + 1)))
	ActionBar7:SetHeight((Size * NumRow) + (Spacing * (NumRow + 1)))
	
	for i = 1, Num do
		local Button = _G["MultiBar6Button"..i]
		
		Button:SetSize(Size, Size)
	end
end

function ActionBars:VisibilityAB7()
	local ActionBar7 = ActionBars.Bars.Bar7

	if C["ActionBars"]["Actionbar7"]["Value"] == "Show" then
		ActionBar7:SetAlpha(1)
	end

	if C["ActionBars"]["Actionbar7"]["Value"] == "Hide" then
		ActionBar7:Kill()
		
		for i = 1, Num do
			local Button = _G["MultiBar6Button"..i]
			Button:Kill()
			ActionBar7["MultiBar6Button"..i] = Button
		end
	end

	if C["ActionBars"]["Actionbar7"]["Value"] == "Mouseover"  then
		ActionBar7:SetAlpha(C["ActionBars"]["ActionBar7Alpha"])
	
		ActionBar7:SetScript("OnEnter", function(self)
			ActionBar7:SetAlpha(1)
		end)
		
		ActionBar7:SetScript("OnLeave", function(self)
			ActionBar7:SetAlpha(C["ActionBars"]["ActionBar7Alpha"])
		end)

		for i = 1, Num do
			local Button = _G["MultiBar6Button"..i]

			Button:HookScript("OnEnter", function(self)
				ActionBar7:SetAlpha(1)
			end)
			
			Button:HookScript("OnLeave", function(self)
				ActionBar7:SetAlpha(C["ActionBars"]["ActionBar7Alpha"])
			end)
		
			ActionBar7["MultiBar6Button"..i] = Button
		end
	end
end

function ActionBars:CombatStateAB7()
	local ActionBar7 = ActionBars.Bars.Bar7

	if C["ActionBars"]["ActionBar7CombatState"]["Value"] == "Hide" then
		RegisterStateDriver(ActionBar7, "visibility", "[combat] hide; show")
	end

	if C["ActionBars"]["ActionBar7CombatState"]["Value"] == "Show" then
		RegisterStateDriver(ActionBar7, "visibility", "[combat] show; hide")
	end
end

function ActionBars:PositionAB7()
	local ActionBar1 = ActionBars.Bars.Bar1
	local ActionBar2 = ActionBars.Bars.Bar2
	local ActionBar3 = ActionBars.Bars.Bar3
	local ActionBar4 = ActionBars.Bars.Bar4
	local ActionBar5 = ActionBars.Bars.Bar5
	local ActionBar6 = ActionBars.Bars.Bar6
	local ActionBar7 = ActionBars.Bars.Bar7

	ActionBar7:ClearAllPoints()
	ActionBar7:SetPoint("LEFT", UIParent, "CENTER", 100, 0)

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
			ActionBar7:ClearAllPoints()
			ActionBar7:SetPoint("BOTTOMLEFT", ActionBar5, "BOTTOMRIGHT", 4, 0)

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

function ActionBars:MaxUIStyleAB7()
	local ActionBar7 = ActionBars.Bars.Bar7

	if C["ActionBars"]["ActionBar7Backdrop"]== true then 
		ActionBar7:SkinMaxUIFrame()
	else
		for i = 1, Num do
			local Button = _G["MultiBar6Button"..i]
			Button:CreateShadow()
			ActionBar7["MultiBar6Button"..i] = Button
		end
		ActionBar7.Shadow:SetAlpha(0)
		ActionBar7.Backdrop:SetAlpha(0)
	end
end

function ActionBars:StylingAB7()
	local ActionBar7 = ActionBars.Bars.Bar7

	if C["ActionBars"]["ActionBar7Edges"]["Value"] == "Top" then
		ActionBar7:CreateMaxUITopEdge("7")
		
	elseif C["ActionBars"]["ActionBar7Edges"]["Value"] == "Bottom" then
		ActionBar7:CreateMaxUIBottonmEdge()
	
	elseif C["ActionBars"]["ActionBar7Edges"]["Value"] == "Left" then
		ActionBar7:CreateMaxUILeftEdge()
	
	elseif C["ActionBars"]["ActionBar7Edges"]["Value"] == "Right" then
		ActionBar7:CreateMaxUIRightEdge()
	
	elseif C["ActionBars"]["ActionBar7Edges"]["Value"] == "LeftRight" then
		ActionBar7:CreateMaxUILeftEdge()
		ActionBar7:CreateMaxUIRightEdge()
	
	elseif C["ActionBars"]["ActionBar7Edges"]["Value"] == "TopBottom" then
		ActionBar7:CreateMaxUITopEdge("7")
		ActionBar7:CreateMaxUIBottomEdge()
	
	elseif C["ActionBars"]["ActionBar7Edges"]["Value"] == "All" then
		ActionBar7:CreateMaxUITopEdge("7")
		ActionBar7:CreateMaxUIBottomEdge()
		ActionBar7:CreateMaxUILeftEdge()
		ActionBar7:CreateMaxUIRightEdge()
	end
end

function ActionBars:CreateBar7()
    baseCreateBar7(self)

	if not C.ActionBars.Bar7 then return end

	self:VisibilityAB7()
	
	if C["ActionBars"]["ActionBar5CombatState"]["Value"] ~= "Nothing" then 
		self:CombatStateAB7()
	end
	
	self:SizingAB7()
	self:PositionAB7()
	
	if (C.General.Themes.Value == "MaxUI") then
		self:MaxUIStyleAB7()
	end
	
	self:StylingAB7()	
end