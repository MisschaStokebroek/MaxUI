------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 01-05-2023
------------------------------------------------------------------------------------------

-- setting up ACTION BAR 4.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local ActionBars = T.ActionBars
local Chat = T["Chat"]
local baseCreateBar4 = ActionBars.CreateBar4
local Num = NUM_ACTIONBAR_BUTTONS

------------------------------------------------------------------------------------------
-- ACTIONBAR 4
------------------------------------------------------------------------------------------
function ActionBars:SizingAB4()
	local ActionBar4 = ActionBars.Bars.Bar4
	local ButtonsPerRow = C.ActionBars.Bar4ButtonsPerRow
	local NumButtons = C.ActionBars.Bar4NumButtons
	local Size = C["ActionBars"]["ActionBar4ButtonSize"]
	local Spacing = C.ActionBars.ButtonSpacing
	
	if NumButtons <= ButtonsPerRow then
		ButtonsPerRow = NumButtons
	end
	
	local NumRow = ceil(NumButtons / ButtonsPerRow)

	ActionBar4:SetWidth((Size * ButtonsPerRow) + (Spacing * (ButtonsPerRow + 1)))
	ActionBar4:SetHeight((Size * NumRow) + (Spacing * (NumRow + 1)))

	for i = 1, Num do
		local Button = _G["MultiBarRightButton"..i]
		Button:SetSize(Size, Size)
	end
end

function ActionBars:VisibilityAB4()
	local ActionBar4 = ActionBars.Bars.Bar4

	if C["ActionBars"]["Actionbar4"]["Value"] == "Show"  then
		ActionBar4:SetAlpha(1)
	end	
		
	if C["ActionBars"]["Actionbar4"]["Value"] == "Hide"  then
		ActionBar4:Kill()

		for i = 1, Num do
			local Button = _G["MultiBarRightButton"..i]
			Button:Kill()
			ActionBar4["Button"..i] = Button
		end
	end
	
	if C["ActionBars"]["Actionbar4"]["Value"] == "Mouseover"  then
		ActionBar4:SetAlpha(C["ActionBars"]["ActionBar4Alpha"])
		
		ActionBar4:SetScript("OnEnter", function(self)
			ActionBar4:SetAlpha(1)
		end)
		
		ActionBar4:SetScript("OnLeave", function(self)
			ActionBar4:SetAlpha(C["ActionBars"]["ActionBar4Alpha"])
		end)

		for i = 1, Num do
			local Button = _G["MultiBarRightButton"..i]

			Button:HookScript("OnEnter", function(self)
				ActionBar4:SetAlpha(1)
			end)
			
			Button:HookScript("OnLeave", function(self)
				ActionBar4:SetAlpha(C["ActionBars"]["ActionBar4Alpha"])
			end)
			ActionBar4["Button"..i] = Button
		end
	end
end

function ActionBars:CombatStateAB4()
	local ActionBar4 = ActionBars.Bars.Bar4

	if C["ActionBars"]["ActionBar4CombatState"]["Value"] == "Hide" then
		RegisterStateDriver(ActionBar4, "visibility", "[combat] hide; show")
	end

	if C["ActionBars"]["ActionBar4CombatState"]["Value"] == "Show" then
		RegisterStateDriver(ActionBar4, "visibility", "[combat] show; hide")
	end
end

function ActionBars:PositionAB4()
	local ActionBar1 = ActionBars.Bars.Bar1
	local ActionBar2 = ActionBars.Bars.Bar2
	local ActionBar4 = ActionBars.Bars.Bar4
	local RightChatBG = Chat.Panels.RightChat
	local LeftChatBG = Chat.Panels.LeftChat
	local Size = C.ActionBars.ActionBar4ButtonSize
	local Spacing = C.ActionBars.ButtonSpacing

	-- Healer
	if C["Layout"]["LayoutRole"]["Value"] == "Healer" then
		
		-- basic
		if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
			ActionBar4:ClearAllPoints()
			ActionBar4:SetPoint("TOPLEFT", ActionBar2, "TOPRIGHT", 6, 0)
		
		-- single
		elseif C["Layout"]["LayoutAB"]["Value"] == "Single" then
			ActionBar4:ClearAllPoints()
			ActionBar4:SetPoint("TOPLEFT", ActionBar2, "TOPRIGHT", 6, 0)
		
		-- double
		elseif C["Layout"]["LayoutAB"]["Value"] == "Double" then
			ActionBar4:ClearAllPoints()
			ActionBar4:SetPoint("TOPLEFT", UIParent, "CENTER", 2, -154)
		end
	end
	
	-- Tank or Melee
	if C["Layout"]["LayoutRole"]["Value"] == "Melee" or C["Layout"]["LayoutRole"]["Value"] == "Tank" then
		ActionBar4:ClearAllPoints()

		if ActionBar2 then
			ActionBar4:SetPoint("BOTTOMRIGHT", ActionBar2, "BOTTOMLEFT", -4, 0)
		else
			ActionBar4:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOM", -194, 60)
		end
	end
	
	-- Range
	if C["Layout"]["LayoutRole"]["Value"] == "Range" then
		
		-- basic
		if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
			ActionBar4:ClearAllPoints()
			ActionBar4:SetPoint("BOTTOMRIGHT", ActionBar1, "BOTTOMLEFT", -4, 0)
		
		-- single
		elseif C["Layout"]["LayoutAB"]["Value"] == "Single" then
			ActionBar4:ClearAllPoints()
			ActionBar4:SetPoint("RIGHT", UIParent, "RIGHT", -14, 0)
		
		-- double
		elseif C["Layout"]["LayoutAB"]["Value"] == "Double" then
			ActionBar4:ClearAllPoints()
			ActionBar4:SetPoint("TOPLEFT", UIParent, "CENTER", 2, -160)
		end
	end
end

function ActionBars:MaxUIStyleAB4()
	local ActionBar4 = ActionBars.Bars.Bar4
	
	if C["ActionBars"]["ActionBar4Backdrop"]== true then 
		ActionBar4:SkinMaxUIFrame()
	else
		for i = 1, Num do
			local Button = _G["MultiBarRightButton"..i]
			Button:CreateShadow()
			ActionBar4["Button"..i] = Button
		end
		ActionBar4.Shadow:SetAlpha(0)
		ActionBar4.Backdrop:SetAlpha(0)
	end
end

function ActionBars:StylingAB4()
	local ActionBar4 = ActionBars.Bars.Bar4

	if C["ActionBars"]["ActionBar4Edges"]["Value"] == "Top" then
		ActionBar4:CreateMaxUITopEdge("4")
		
	elseif C["ActionBars"]["ActionBar4Edges"]["Value"] == "Bottom" then
		ActionBar4:CreateMaxUIBottonmEdge()
	
	elseif C["ActionBars"]["ActionBar4Edges"]["Value"] == "Left" then
		ActionBar4:CreateMaxUILeftEdge()
	
	elseif C["ActionBars"]["ActionBar4Edges"]["Value"] == "Right" then
		ActionBar4:CreateMaxUIRightEdge()
	
	elseif C["ActionBars"]["ActionBar4Edges"]["Value"] == "LeftRight" then
		ActionBar4:CreateMaxUILeftEdge()
		ActionBar4:CreateMaxUIRightEdge()
	
	elseif C["ActionBars"]["ActionBar4Edges"]["Value"] == "TopBottom" then
		ActionBar4:CreateMaxUITopEdge("4")
		ActionBar4:CreateMaxUIBottomEdge()
	
	elseif C["ActionBars"]["ActionBar4Edges"]["Value"] == "All" then
		ActionBar4:CreateMaxUITopEdge("4")
		ActionBar4:CreateMaxUIBottomEdge()
		ActionBar4:CreateMaxUILeftEdge()
		ActionBar4:CreateMaxUIRightEdge()
	end
end

function ActionBars:CreateBar4()
    baseCreateBar4(self)

	if not C["ActionBars"]["RightBar"] then return end
	
	self:VisibilityAB4()

	if C["ActionBars"]["ActionBar4CombatState"]["Value"] ~= "Nothing" then 
		self:CombatStateAB4()
	end
	
	self:SizingAB4()
	self:PositionAB4()
	
	if (C.General.Themes.Value == "MaxUI") then
		self:MaxUIStyleAB4()
	end
	
	self:StylingAB4()	
end