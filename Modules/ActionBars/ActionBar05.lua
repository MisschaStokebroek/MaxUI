------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 30-10-2022
------------------------------------------------------------------------------------------

-- setting up ACTION BAR 5.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local ActionBars = T.ActionBars
local Chat = T["Chat"]
local baseCreateBar5 = ActionBars.CreateBar5
local Num = NUM_ACTIONBAR_BUTTONS

------------------------------------------------------------------------------------------
-- ACTIONBAR 5
------------------------------------------------------------------------------------------
function ActionBars:SizingAB5()
	local ActionBar5 = ActionBars.Bars.Bar5
	local ButtonsPerRow = C.ActionBars.Bar5ButtonsPerRow
	local NumButtons = C.ActionBars.Bar5NumButtons
	local Size = C["ActionBars"]["ActionBar5ButtonSize"]
	local Spacing = C.ActionBars.ButtonSpacing
	
	if NumButtons <= ButtonsPerRow then
		ButtonsPerRow = NumButtons
	end
	
	local NumRow = ceil(NumButtons / ButtonsPerRow)

	ActionBar5:SetWidth((Size * ButtonsPerRow) + (Spacing * (ButtonsPerRow + 1)))
	ActionBar5:SetHeight((Size * NumRow) + (Spacing * (NumRow + 1)))

	for i = 1, Num do
		local ButtonName = "MultiBarLeftButton"..i
		Button = _G[ButtonName]

		Button:SetSize(Size, Size)
	end
end

function ActionBars:VisibilityAB5()
	local ActionBar5 = ActionBars.Bars.Bar5

	if C["ActionBars"]["Actionbar5"]["Value"] == "Show"  then
		ActionBar5:SetAlpha(1)
	end

	if C["ActionBars"]["Actionbar5"]["Value"] == "Hide"  then
		ActionBar5:Kill()
		
		for i = 1, Num do
			local Button = _G["MultiBarLeftButton"..i]
			Button:Kill()
			ActionBar5["Button"..i] = Button
		end
	end

	if C["ActionBars"]["Actionbar5"]["Value"] == "Mouseover"  then
		ActionBar5:SetAlpha(C["ActionBars"]["ActionBar5Alpha"])
	
		ActionBar5:SetScript("OnEnter", function(self)
			ActionBar5:SetAlpha(1)
		end)
		
		ActionBar5:SetScript("OnLeave", function(self)
			ActionBar5:SetAlpha(C["ActionBars"]["ActionBar5Alpha"])
		end)

		for i = 1, Num do
			local Button = _G["MultiBarLeftButton"..i]

			Button:HookScript("OnEnter", function(self)
				ActionBar5:SetAlpha(1)
			end)
			
			Button:HookScript("OnLeave", function(self)
				ActionBar5:SetAlpha(C["ActionBars"]["ActionBar5Alpha"])
			end)
		
			ActionBar5["Button"..i] = Button
		end
	end
end

function ActionBars:CombatStateAB5()
	local ActionBar5 = ActionBars.Bars.Bar5

	if C["ActionBars"]["ActionBar5CombatState"]["Value"] == "Hide" then
		RegisterStateDriver(ActionBar5, "visibility", "[combat] hide; show")
	end

	if C["ActionBars"]["ActionBar5CombatState"]["Value"] == "Show" then
		RegisterStateDriver(ActionBar5, "visibility", "[combat] show; hide")
	end
end

function ActionBars:PositionAB5()
	local ActionBar1 = ActionBars.Bars.Bar1
	local ActionBar2 = ActionBars.Bars.Bar2
	local ActionBar3 = ActionBars.Bars.Bar3
	local ActionBar4 = ActionBars.Bars.Bar4
	local ActionBar5 = ActionBars.Bars.Bar5

	-- Healer
	if C["Layout"]["LayoutRole"]["Value"] == "Healer" then
		
		-- basic
		if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
			ActionBar5:ClearAllPoints()
			ActionBar5:SetPoint("TOPRIGHT", ActionBar3, "TOPLEFT", -6, 0)
		
		-- single
		elseif C["Layout"]["LayoutAB"]["Value"] == "Single" then
			ActionBar5:ClearAllPoints()
			ActionBar5:SetPoint("TOPRIGHT", ActionBar3, "TOPLEFT", -6, 0)
		
		-- double
		elseif C["Layout"]["LayoutAB"]["Value"] == "Double" then
			ActionBar5:ClearAllPoints()
			ActionBar5:SetPoint("RIGHT", UIParent, "RIGHT", -14, 0)
		end
	end
	
	-- Tank or Melee
	if C["Layout"]["LayoutRole"]["Value"] == "Melee" or C["Layout"]["LayoutRole"]["Value"] == "Tank" then
		
		-- basic
		if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
			ActionBar5:ClearAllPoints()
			if ActionBar3 then	
				ActionBar5:SetPoint("BOTTOMLEFT", ActionBar3, "BOTTOMRIGHT", 4, 0)
			else
				ActionBar5:SetPoint("BOTTOMLEFT", UIParent, "BOTTOM", 192, 60)
			end
		-- single
		elseif C["Layout"]["LayoutAB"]["Value"] == "Single" then
			ActionBar5:ClearAllPoints()
			ActionBar5:SetPoint("BOTTOMLEFT", ActionBar3, "BOTTOMRIGHT", 4, 0)
		
		-- double
		elseif C["Layout"]["LayoutAB"]["Value"] == "Double" then
			ActionBar5:ClearAllPoints()
			ActionBar5:SetPoint("BOTTOMLEFT", ActionBar2, "BOTTOMRIGHT", 4, 0)
		end
	end
	
	-- Range
	if C["Layout"]["LayoutRole"]["Value"] == "Range" then
		
		-- basic
		if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
			ActionBar5:ClearAllPoints()
			ActionBar5:SetPoint("BOTTOMLEFT", ActionBar1, "BOTTOMRIGHT", 4, 0)
		
		-- single
		elseif C["Layout"]["LayoutAB"]["Value"] == "Single" then
			ActionBar5:ClearAllPoints()
			ActionBar5:SetPoint("RIGHT", ActionBar4, "LEFT", Spacing, 0)
		
		-- double
		elseif C["Layout"]["LayoutAB"]["Value"] == "Double" then
			ActionBar5:ClearAllPoints()
			ActionBar5:SetPoint("RIGHT", UIParent, "RIGHT", -14, 0)
		end
	end
end

function ActionBars:MaxUIStyleAB5()
	local BackdropR, BackdropG, BackdropB = unpack(C["General"]["BackdropColor"])
	local BackdropAlpha = (C["ActionBars"]["ABAlpha"])
	local ActionBar5 = ActionBars.Bars.Bar5

	if C["ActionBars"]["ActionBar5Backdrop"]== true then 
		ActionBar5.Shadow:SetAlpha(1)
		ActionBar5.Backdrop:SetOutside()
		ActionBar5.Backdrop:SetAlpha(BackdropAlpha)
		ActionBar5.Backdrop:SetBackdropColor(BackdropR, BackdropG, BackdropB)
	else
		for i = 1, Num do
			local Button = _G["MultiBarLeftButton"..i]
			Button:CreateShadow()
			ActionBar5["Button"..i] = Button
		end
		
		ActionBar5.Shadow:SetAlpha(0)
		ActionBar5.Backdrop:SetAlpha(0)
	end
end

function ActionBars:StylingAB5()
	local ActionBar5 = ActionBars.Bars.Bar5

	if C["ActionBars"]["ActionBar5Edges"]["Value"] == "Top" then
		ActionBar5:CreateMaxUITopEdge("5")
		
	elseif C["ActionBars"]["ActionBar5Edges"]["Value"] == "Bottom" then
		ActionBar5:CreateMaxUIBottonmEdge()
	
	elseif C["ActionBars"]["ActionBar5Edges"]["Value"] == "Left" then
		ActionBar5:CreateMaxUILeftEdge()
	
	elseif C["ActionBars"]["ActionBar5Edges"]["Value"] == "Right" then
		ActionBar5:CreateMaxUIRightEdge()
	
	elseif C["ActionBars"]["ActionBar5Edges"]["Value"] == "LeftRight" then
		ActionBar5:CreateMaxUILeftEdge()
		ActionBar5:CreateMaxUIRightEdge()
	
	elseif C["ActionBars"]["ActionBar5Edges"]["Value"] == "TopBottom" then
		ActionBar5:CreateMaxUITopEdge("5")
		ActionBar5:CreateMaxUIBottomEdge()
	
	elseif C["ActionBars"]["ActionBar5Edges"]["Value"] == "All" then
		ActionBar5:CreateMaxUITopEdge("5")
		ActionBar5:CreateMaxUIBottomEdge()
		ActionBar5:CreateMaxUILeftEdge()
		ActionBar5:CreateMaxUIRightEdge()
	end
end

function ActionBars:CreateBar5()
    baseCreateBar5(self)
	
	if not C.ActionBars.LeftBar then return end

	self:VisibilityAB5()
	
	if C["ActionBars"]["ActionBar5CombatState"]["Value"] ~= "Nothing" then 
		self:CombatStateAB5()
	end
	
	self:SizingAB5()
	self:PositionAB5()
	
	if (C.General.Themes.Value == "MaxUI") then
		self:MaxUIStyleAB5()
	end
	
	self:StylingAB5()	
end