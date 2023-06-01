------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 01-05-2023
------------------------------------------------------------------------------------------

-- setting up ACTION BAR 3.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local ActionBars = T.ActionBars
local Chat = T["Chat"]
local baseCreateBar3 = ActionBars.CreateBar3
local Num = NUM_ACTIONBAR_BUTTONS

------------------------------------------------------------------------------------------
-- ACTIONBAR 3
------------------------------------------------------------------------------------------
function ActionBars:SizingAB3()
	local ActionBar3 = ActionBars.Bars.Bar3
	local ButtonsPerRow = C.ActionBars.Bar3ButtonsPerRow
	local NumButtons = C.ActionBars.Bar3NumButtons
	local Size = C["ActionBars"]["ActionBar3ButtonSize"]
	local Spacing = C.ActionBars.ButtonSpacing
	
	if NumButtons <= ButtonsPerRow then
		ButtonsPerRow = NumButtons
	end
	
	local NumRow = ceil(NumButtons / ButtonsPerRow)

	ActionBar3:SetWidth((Size * ButtonsPerRow) + (Spacing * (ButtonsPerRow + 1)))
	ActionBar3:SetHeight((Size * NumRow) + (Spacing * (NumRow + 1)))

	for i = 1, Num do
		local Button = _G["MultiBarBottomRightButton"..i]
		Button:SetSize(Size, Size)
	end
end

function ActionBars:VisibilityAB3()
	local ActionBar3 = ActionBars.Bars.Bar3

	if C["ActionBars"]["Actionbar3"]["Value"] == "Show"  then
		ActionBar3:SetAlpha(1)
	end
	
	if C["ActionBars"]["Actionbar3"]["Value"] == "Hide"  then
		ActionBar3:Kill()
	
		for i = 1, Num do
			local Button = _G["MultiBarBottomRightButton"..i]
			Button:Kill()
			ActionBar3["Button"..i] = Button
		end
	end

	if C["ActionBars"]["Actionbar3"]["Value"] == "Mouseover"  then
		ActionBar3:SetAlpha(C["ActionBars"]["ActionBar3Alpha"])
	
		ActionBar3:SetScript("OnEnter", function(self)
			ActionBar3:SetAlpha(1)
		end)
		
		ActionBar3:SetScript("OnLeave", function(self)
			ActionBar3:SetAlpha(C["ActionBars"]["ActionBar3Alpha"])
		end)

		for i = 1, Num do
			local Button = _G["MultiBarBottomRightButton"..i]
		
			Button:HookScript("OnEnter", function(self)
				ActionBar3:SetAlpha(1)
			end)
			
			Button:HookScript("OnLeave", function(self)
				ActionBar3:SetAlpha(C["ActionBars"]["ActionBar3Alpha"])
			end)
		
			ActionBar3["Button"..i] = Button
		end
	end
end

function ActionBars:CombatStateAB3()
	local ActionBar3 = ActionBars.Bars.Bar3

	if C["ActionBars"]["ActionBar3CombatState"]["Value"] == "Hide" then
		RegisterStateDriver(ActionBar3, "visibility", "[combat] hide; show")
	end

	if C["ActionBars"]["ActionBar3CombatState"]["Value"] == "Show" then
		RegisterStateDriver(ActionBar3, "visibility", "[combat] show; hide")
	end
end

function ActionBars:PositionAB3()
	local ActionBar1 = ActionBars.Bars.Bar1
	local ActionBar3 = ActionBars.Bars.Bar3
	local ActionBar4 = ActionBars.Bars.Bar4
	local RightChatBG = Chat.Panels.RightChat
	local LeftChatBG = Chat.Panels.LeftChat

	-- Tukui
	if C["Layout"]["LayoutRole"]["Value"] == "Tukui" then
		if (C.General.Themes.Value == "MaxUI") then
			ActionBar3:ClearAllPoints()
			ActionBar3:SetPoint("BOTTOM", UIParent, "BOTTOM", 251, 60)
		else
			ActionBar3:ClearAllPoints()
			ActionBar3:SetPoint("BOTTOM", UIParent, "BOTTOM", 251, 12)
		end
	end

	-- Healer
	if C["Layout"]["LayoutRole"]["Value"] == "Healer" then
		
		-- basic
		if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
			ActionBar3:ClearAllPoints()
			ActionBar3:SetPoint("TOPRIGHT", RightChatBG, "TOPLEFT", -6, 0)
		
		-- single
		elseif C["Layout"]["LayoutAB"]["Value"] == "Single" then
			ActionBar3:ClearAllPoints()
			ActionBar3:SetPoint("TOPRIGHT", RightChatBG, "TOPLEFT", -6, 0)
		
		-- double
		elseif C["Layout"]["LayoutAB"]["Value"] == "Double" then
			ActionBar3:ClearAllPoints()
			ActionBar3:SetPoint("TOPRIGHT", RightChatBG, "TOPLEFT", -6, 0)
		end
	end
	
	-- Tank or Melee
	if C["Layout"]["LayoutRole"]["Value"] == "Melee" or C["Layout"]["LayoutRole"]["Value"] == "Tank" then
		
		-- basic
		if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
			ActionBar3:ClearAllPoints()
			ActionBar3:SetPoint("BOTTOMLEFT", ActionBar1, "BOTTOMRIGHT", 4, 0)
		
		-- single
		elseif C["Layout"]["LayoutAB"]["Value"] == "Single" then
			ActionBar3:ClearAllPoints()
			ActionBar3:SetPoint("BOTTOMLEFT", UIParent, "BOTTOM", 2, 60)
		
		-- double
		elseif C["Layout"]["LayoutAB"]["Value"] == "Double" then
			ActionBar3:ClearAllPoints()
			ActionBar3:SetPoint("TOPLEFT", UIParent, "CENTER", 2, -180)
		end
	end
	
	-- Range
	if C["Layout"]["LayoutRole"]["Value"] == "Range" then
		ActionBar3:ClearAllPoints()
		ActionBar3:SetPoint("TOPLEFT", LeftChatBG, "TOPRIGHT", 6, 1)
	end
end

function ActionBars:MaxUIStyleAB3()
	local ActionBar3 = ActionBars.Bars.Bar3
	
	if C["ActionBars"]["ActionBar3Backdrop"]== true then 
		ActionBar3:SkinMaxUIFrame()
	else
		for i = 1, Num do
			local Button = _G["MultiBarBottomRightButton"..i]
			Button:CreateShadow()
			ActionBar3["Button"..i] = Button
		end
		ActionBar3.Shadow:SetAlpha(0)
		ActionBar3.Backdrop:SetAlpha(0)
	end
end

function ActionBars:StylingAB3()
	local ActionBar3 = ActionBars.Bars.Bar3

	if C["ActionBars"]["ActionBar3Edges"]["Value"] == "Top" then
		ActionBar3:CreateMaxUITopEdge("3")
		
	elseif C["ActionBars"]["ActionBar3Edges"]["Value"] == "Bottom" then
		ActionBar3:CreateMaxUIBottomEdge()
	
	elseif C["ActionBars"]["ActionBar3Edges"]["Value"] == "Left" then
		ActionBar3:CreateMaxUILeftEdge()
	
	elseif C["ActionBars"]["ActionBar3Edges"]["Value"] == "Right" then
		ActionBar3:CreateMaxUIRightEdge()
	
	elseif C["ActionBars"]["ActionBar3Edges"]["Value"] == "LeftRight" then
		ActionBar3:CreateMaxUILeftEdge()
		ActionBar3:CreateMaxUIRightEdge()
	
	elseif C["ActionBars"]["ActionBar3Edges"]["Value"] == "TopBottom" then
		ActionBar3:CreateMaxUITopEdge("3")
		ActionBar3:CreateMaxUIBottomEdge()
	
	elseif C["ActionBars"]["ActionBar3Edges"]["Value"] == "All" then
		ActionBar3:CreateMaxUITopEdge("3")
		ActionBar3:CreateMaxUIBottomEdge()
		ActionBar3:CreateMaxUILeftEdge()
		ActionBar3:CreateMaxUIRightEdge()
	end
end

function ActionBars:CreateBar3()
	baseCreateBar3(self)

	if not C.ActionBars.BottomRightBar then return end

	self:VisibilityAB3()
	
	if C["ActionBars"]["ActionBar3CombatState"]["Value"] ~= "Nothing" then 
		self:CombatStateAB3()
	end
	
	self:SizingAB3()
	self:PositionAB3()
	
	if (C.General.Themes.Value == "MaxUI") then
		self:MaxUIStyleAB3()
	end
	
	self:StylingAB3()	
end