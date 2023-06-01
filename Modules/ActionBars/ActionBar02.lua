------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 01-05-2023
------------------------------------------------------------------------------------------

-- setting up ACTION BAR 2.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local ActionBars = T.ActionBars
local Chat = T["Chat"]
local baseCreateBar2 = ActionBars.CreateBar2
local Num = NUM_ACTIONBAR_BUTTONS

------------------------------------------------------------------------------------------
-- ACTIONBAR 2
------------------------------------------------------------------------------------------
function ActionBars:SizingAB2()
	local ActionBar2 = ActionBars.Bars.Bar2
	local ButtonsPerRow = C.ActionBars.Bar2ButtonsPerRow
	local NumButtons = C.ActionBars.Bar2NumButtons
	local Size = C["ActionBars"]["ActionBar2ButtonSize"]
	local Spacing = C.ActionBars.ButtonSpacing
	
	if NumButtons <= ButtonsPerRow then
		ButtonsPerRow = NumButtons
	end
	
	local NumRow = ceil(NumButtons / ButtonsPerRow)

	ActionBar2:SetWidth((Size * ButtonsPerRow) + (Spacing * (ButtonsPerRow + 1)))
	ActionBar2:SetHeight((Size * NumRow) + (Spacing * (NumRow + 1)))

	for i = 1, Num do
		local Button = _G["MultiBarBottomLeftButton"..i]
		Button:SetSize(Size, Size)
	end
end

function ActionBars:VisibilityAB2()
	local ActionBar2 = ActionBars.Bars.Bar2

	if C["ActionBars"]["Actionbar2"]["Value"] == "Show"  then
		ActionBar2:SetAlpha(1)
	end	

	if C["ActionBars"]["Actionbar2"]["Value"] == "Hide"  then
		ActionBar2:Kill()
		
		for i = 1, Num do
			local Button = _G["MultiBarBottomLeftButton"..i]
			Button:Kill()
			ActionBar2["Button"..i] = Button
		end
	end
	
	if C["ActionBars"]["Actionbar2"]["Value"] == "Mouseover"  then
		ActionBar2:SetAlpha(C["ActionBars"]["ActionBar2Alpha"])
	
		ActionBar2:SetScript("OnEnter", function(self)
			ActionBar2:SetAlpha(1)
		end)
		
		ActionBar2:SetScript("OnLeave", function(self)
			ActionBar2:SetAlpha(C["ActionBars"]["ActionBar2Alpha"])
		end)

		for i = 1, Num do
			local Button = _G["MultiBarBottomLeftButton"..i]
		
			Button:HookScript("OnEnter", function(self)
				ActionBar2:SetAlpha(1)
			end)
			
			Button:HookScript("OnLeave", function(self)
				ActionBar2:SetAlpha(C["ActionBars"]["ActionBar2Alpha"])
			end)
		
			ActionBar2["Button"..i] = Button
		end
	end
end

function ActionBars:CombatStateAB2()
	local ActionBar2 = ActionBars.Bars.Bar2

	if C["ActionBars"]["ActionBar2CombatState"]["Value"] == "Hide" then
		RegisterStateDriver(ActionBar2, "visibility", "[combat] hide; show")
	end

	if C["ActionBars"]["ActionBar2CombatState"]["Value"] == "Show" then
		RegisterStateDriver(ActionBar2, "visibility", "[combat] show; hide")
	end
end

function ActionBars:PositionAB2()
	local ActionBar1 = ActionBars.Bars.Bar1
	local ActionBar2 = ActionBars.Bars.Bar2
	local RightChatBG = Chat.Panels.RightChat
	local LeftChatBG = Chat.Panels.LeftChat

	-- Tukui
	if C["Layout"]["LayoutRole"]["Value"] == "Tukui" then
		if (C.General.Themes.Value == "MaxUI") then
			ActionBar2:ClearAllPoints()
			ActionBar2:SetPoint("BOTTOM", UIParent, "BOTTOM", -251, 60)
		else
			ActionBar2:ClearAllPoints()
			ActionBar2:SetPoint("BOTTOM", UIParent, "BOTTOM", -251, 12)
		end
	end
	
	-- Healer
	if C["Layout"]["LayoutRole"]["Value"] == "Healer" then
		-- basic
		if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
			ActionBar2:ClearAllPoints()
			ActionBar2:SetPoint("TOPLEFT", LeftChatBG, "TOPRIGHT", 6, 1)
		
		-- single
		elseif C["Layout"]["LayoutAB"]["Value"] == "Single" then
			ActionBar2:ClearAllPoints()
			ActionBar2:SetPoint("TOPLEFT", LeftChatBG, "TOPRIGHT", 6, 1)
		
		-- double
		elseif C["Layout"]["LayoutAB"]["Value"] == "Double" then
			ActionBar2:ClearAllPoints()
			ActionBar2:SetPoint("TOPLEFT", LeftChatBG, "TOPRIGHT", 6, 1)
		end
	end
	
	-- Tank or Melee
	if C["Layout"]["LayoutRole"]["Value"] == "Melee" or C["Layout"]["LayoutRole"]["Value"] == "Tank" then
		
		-- basic
		if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
			ActionBar2:ClearAllPoints()
			ActionBar2:SetPoint("BOTTOMRIGHT", ActionBar1, "BOTTOMLEFT", -4, 0)
		
		-- single
		elseif C["Layout"]["LayoutAB"]["Value"] == "Single" then
			ActionBar2:ClearAllPoints()
			ActionBar2:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOM", -2, 60)
		
		-- double
		elseif C["Layout"]["LayoutAB"]["Value"] == "Double" then
			ActionBar2:ClearAllPoints()
			ActionBar2:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 60)
		end
	end
	
	-- Range
	if C["Layout"]["LayoutRole"]["Value"] == "Range" then
		ActionBar2:ClearAllPoints()
		ActionBar2:SetPoint("TOPRIGHT", RightChatBG, "TOPLEFT", -6, 1)
	end
end

function ActionBars:MaxUIStyleAB2()
	local ActionBar2 = ActionBars.Bars.Bar2
	
	if C["ActionBars"]["ActionBar2Backdrop"] == true then 
		ActionBar2:SkinMaxUIFrame()
	else
		for i = 1, Num do
			local Button = _G["MultiBarBottomLeftButton"..i]
			Button:CreateShadow()
			ActionBar2["Button"..i] = Button
		end
		ActionBar2.Shadow:SetAlpha(0)
		ActionBar2.Backdrop:SetAlpha(0)
	end
end

function ActionBars:StylingAB2()
	local ActionBar2 = ActionBars.Bars.Bar2

	if C["ActionBars"]["ActionBar2Edges"]["Value"] == "Top" then
		ActionBar2:CreateMaxUITopEdge("2")
		
	elseif C["ActionBars"]["ActionBar2Edges"]["Value"] == "Bottom" then
		ActionBar2:CreateMaxUIBottomEdge()
	
	elseif C["ActionBars"]["ActionBar2Edges"]["Value"] == "Left" then
		ActionBar2:CreateMaxUILeftEdge()
	
	elseif C["ActionBars"]["ActionBar2Edges"]["Value"] == "Right" then
		ActionBar2:CreateMaxUIRightEdge()
	
	elseif C["ActionBars"]["ActionBar2Edges"]["Value"] == "LeftRight" then
		ActionBar2:CreateMaxUILeftRightEdge()
	
	elseif C["ActionBars"]["ActionBar2Edges"]["Value"] == "TopBottom" then
		ActionBar2:CreateMaxUITopEdge("2")
		ActionBar2:CreateMaxUIBottomEdge()
	
	elseif C["ActionBars"]["ActionBar2Edges"]["Value"] == "All" then
		ActionBar2:CreateMaxUITopEdge("2")
		ActionBar2:CreateMaxUIBottomEdge()
		ActionBar2:CreateMaxUILeftEdge()
		ActionBar2:CreateMaxUIRightEdge()
	end
end

function ActionBars:CreateBar2()
   baseCreateBar2(self)
 
 	if not C.ActionBars.BottomLeftBar then return end

	self:VisibilityAB2()
	
	if C["ActionBars"]["ActionBar2CombatState"]["Value"] ~= "Nothing" then 
		self:CombatStateAB2()
	end
	
	self:SizingAB2()
	self:PositionAB2()
	
	if (C.General.Themes.Value == "MaxUI") then
		self:MaxUIStyleAB2()
	end
	
	self:StylingAB2()	
end