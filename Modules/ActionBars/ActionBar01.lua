------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 30-10-2022
------------------------------------------------------------------------------------------

-- setting up ACTION BAR 1.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local ActionBars = T.ActionBars
local baseCreateBar1 = ActionBars.CreateBar1
local Num = NUM_ACTIONBAR_BUTTONS

------------------------------------------------------------------------------------------
-- ACTIONBAR 1
------------------------------------------------------------------------------------------
function ActionBars:SizingAB1()
	local ActionBar1 = ActionBars.Bars.Bar1
	local ButtonsPerRow = C.ActionBars.Bar1ButtonsPerRow
	local NumButtons = C.ActionBars.Bar1NumButtons
	local Size = C["ActionBars"]["ActionBar1ButtonSize"]
	local Spacing = C.ActionBars.ButtonSpacing
	
	if NumButtons <= ButtonsPerRow then
		ButtonsPerRow = NumButtons
	end

	local NumRow = ceil(NumButtons / ButtonsPerRow)

	ActionBar1:SetWidth((Size * ButtonsPerRow) + (Spacing * (ButtonsPerRow + 1)))
	ActionBar1:SetHeight((Size * NumRow) + (Spacing * (NumRow + 1)))
end

function ActionBars:ButtonsAB1()
	local NumPerRows = C.ActionBars.Bar1ButtonsPerRow
	local NextRowButtonAnchor = _G["ActionButton1"]
	local ActionBar1 = self.Bars.Bar1
	local Size = C["ActionBars"]["ActionBar1ButtonSize"]
	local NumButtons = C.ActionBars.Bar1NumButtons
	local Spacing = C.ActionBars.ButtonSpacing
	local ButtonsPerRow = C.ActionBars.Bar1ButtonsPerRow

	for i = 1, Num do
		local Button = _G["ActionButton"..i]
		local PreviousButton = _G["ActionButton"..i-1]
			
		Button:SetSize(Size, Size)
		Button:ClearAllPoints()
	
		if i <= NumButtons then
			if (i == 1) then
				Button:SetPoint("TOPLEFT", ActionBar1, "TOPLEFT", Spacing, -Spacing)
			elseif (i == NumPerRows + 1) then
				Button:SetPoint("TOPLEFT", NextRowButtonAnchor, "BOTTOMLEFT", 0, -Spacing)
					
				NumPerRows = NumPerRows + ButtonsPerRow
				NextRowButtonAnchor = _G["ActionButton"..i]
			else
				Button:SetPoint("LEFT", PreviousButton, "RIGHT", Spacing, 0)
			end
		end
	end
end

function ActionBars:VisibilityAB1()
	local ActionBar1 = ActionBars.Bars.Bar1
	
	if C["ActionBars"]["Actionbar1"]["Value"] == "Show"  then
		ActionBar1:SetAlpha(1)
	end
	
	if C["ActionBars"]["Actionbar1"]["Value"] == "Hide"  then
		ActionBar1:Kill()

		for i = 1, Num do
			local Button = _G["ActionButton"..i]
			Button:Kill()
			ActionBar1["Button"..i] = Button
		end
	end
	
	if C["ActionBars"]["Actionbar1"]["Value"] == "Mouseover"  then
		ActionBar1:SetAlpha(C["ActionBars"]["ActionBar1Alpha"])
		
		ActionBar1:SetScript("OnEnter", function(self)
			ActionBar1:SetAlpha(1)
		end)
		
		ActionBar1:SetScript("OnLeave", function(self)
			ActionBar1:SetAlpha(C["ActionBars"]["ActionBar1Alpha"])
		end)

		for i = 1, Num do
			local Button = _G["ActionButton"..i]

			Button:HookScript("OnEnter", function(self)
				ActionBar1:SetAlpha(1)
			end)
			
			Button:HookScript("OnLeave", function(self)
				ActionBar1:SetAlpha(C["ActionBars"]["ActionBar1Alpha"])
			end)
			
			ActionBar1["Button"..i] = Button
		end
	end
end

function ActionBars:CombatStateAB1()
	local ActionBar1 = ActionBars.Bars.Bar1

	RegisterStateDriver(ActionBar1, "visibility", "[petbattle] hide; show")

	if C["ActionBars"]["ActionBar1CombatState"]["Value"] == "Hide" then
		RegisterStateDriver(ActionBar1, "visibility", "[combat] hide; show")
	end

	if C["ActionBars"]["ActionBar1CombatState"]["Value"] == "Show" then
		RegisterStateDriver(ActionBar1, "visibility", "[combat] show; hide")
	end
end

function ActionBars:PositionAB1()
	local ActionBar1 = ActionBars.Bars.Bar1

	-- Tukui
	if C["Layout"]["LayoutRole"]["Value"] == "Tukui" and C.General.Themes.Value == "MaxUI" then
		ActionBar1:ClearAllPoints()
		ActionBar1:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 60)
	end
	
	-- Healer
	if C["Layout"]["LayoutRole"]["Value"] == "Healer" then
		
		-- basic
		if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
			ActionBar1:ClearAllPoints()
			ActionBar1:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 30)
		
		-- single
		elseif C["Layout"]["LayoutAB"]["Value"] == "Single" then
			ActionBar1:ClearAllPoints()
			ActionBar1:SetPoint("TOP", UIParent, "CENTER", 0, -160)
		
		-- double
		elseif C["Layout"]["LayoutAB"]["Value"] == "Double" then
			ActionBar1:ClearAllPoints()
			ActionBar1:SetPoint("TOPRIGHT", UIParent, "CENTER", -2, -154)
		end
	end
	
	-- Tank or Melee
	if C["Layout"]["LayoutRole"]["Value"] == "Melee" or C["Layout"]["LayoutRole"]["Value"] == "Tank" then
		
		-- basic
		if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
			ActionBar1:ClearAllPoints()
			ActionBar1:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 60)
		
		-- single
		elseif C["Layout"]["LayoutAB"]["Value"] == "Single" then
			ActionBar1:ClearAllPoints()
			ActionBar1:SetPoint("TOP", UIParent, "CENTER", 0, -180)
		
		-- double
		elseif C["Layout"]["LayoutAB"]["Value"] == "Double" then
			ActionBar1:ClearAllPoints()
			ActionBar1:SetPoint("TOPRIGHT", UIParent, "CENTER", -2, -180)
		end
	end
	
	-- Range
	if C["Layout"]["LayoutRole"]["Value"] == "Range" then
		
		-- basic
		if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
			ActionBar1:ClearAllPoints()
			ActionBar1:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 60)
		
		-- single
		elseif C["Layout"]["LayoutAB"]["Value"] == "Single" then
			ActionBar1:ClearAllPoints()
			ActionBar1:SetPoint("TOP", UIParent, "CENTER", 0, -160)
		
		-- double
		elseif C["Layout"]["LayoutAB"]["Value"] == "Double" then
			ActionBar1:ClearAllPoints()
			ActionBar1:SetPoint("TOPRIGHT", UIParent, "CENTER", -2, -160)
		end
	end
end

function ActionBars:MaxUIStyleAB1()
	local BackdropR, BackdropG, BackdropB = unpack(C["General"]["BackdropColor"])
	local BackdropAlpha = (C["ActionBars"]["ABAlpha"])
	local ActionBar1 = ActionBars.Bars.Bar1
	
	if C["ActionBars"]["ActionBar1Backdrop"]== true then 
		ActionBar1.Shadow:SetAlpha(1)
		ActionBar1.Backdrop:SetOutside()
		ActionBar1.Backdrop:SetAlpha(BackdropAlpha)
		ActionBar1.Backdrop:SetBackdropColor(BackdropR, BackdropG, BackdropB)
	else
		for i = 1, Num do
			local Button = _G["ActionButton"..i]
			Button:CreateShadow()
			ActionBar1["Button"..i] = Button
		end
		
		ActionBar1.Shadow:SetAlpha(0)
		ActionBar1.Backdrop:SetAlpha(0)
	end
end

function ActionBars:StylingAB1()
	local ActionBar1 = ActionBars.Bars.Bar1

	if C["ActionBars"]["ActionBar1Edges"]["Value"] == "Top" then
		ActionBar1:CreateMaxUITopEdge("1")
		
	elseif C["ActionBars"]["ActionBar1Edges"]["Value"] == "Bottom" then
		ActionBar1:CreateMaxUIBottomEdge()
	
	elseif C["ActionBars"]["ActionBar1Edges"]["Value"] == "Left" then
		ActionBar1:CreateMaxUILeftEdge()
	
	elseif C["ActionBars"]["ActionBar1Edges"]["Value"] == "Right" then
		ActionBar1:CreateMaxUIRightEdge()
	
	elseif C["ActionBars"]["ActionBar1Edges"]["Value"] == "LeftRight" then
		ActionBar1:CreateMaxUILeftRightEdge()
	
	elseif C["ActionBars"]["ActionBar1Edges"]["Value"] == "TopBottom" then
		ActionBar1:CreateMaxUITopEdge("1")
		ActionBar1:CreateMaxUIBottomEdge()
	
	elseif C["ActionBars"]["ActionBar1Edges"]["Value"] == "All" then
		ActionBar1:CreateMaxUITopEdge("1")
		ActionBar1:CreateMaxUIBottomEdge()
		ActionBar1:CreateMaxUILeftEdge()
		ActionBar1:CreateMaxUIRightEdge()
	end
end

function ActionBars:CreateBar1()
    baseCreateBar1(self)

	if C["Layout"]["LayoutCustomize"]["Value"] == "Fixed" then 
		T.LoadActionBarLayouts()
	end

	self:PositionAB1()
	self:SizingAB1()
	self:VisibilityAB1()
	self:StylingAB1()	
	self:ButtonsAB1()
	
	if C["ActionBars"]["ActionBar1CombatState"]["Value"] ~= "Nothing" then 
		self:CombatStateAB1()
	end
	
	if (C.General.Themes.Value == "MaxUI") then
		self:MaxUIStyleAB1()
	end
end