------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-07-2021
------------------------------------------------------------------------------------------

-- setting up STANCE BAR.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local ActionBars = T.ActionBars
local baseUpdateStanceBar = ActionBars.UpdateStanceBar
local _G = _G

------------------------------------------------------------------------------------------
-- STANCEBAR
------------------------------------------------------------------------------------------
function ActionBars:VisibilityStanceBar()
	local StanceBar = ActionBars.Bars.Stance

	if C["ActionBars"]["Stancebar"]["Value"] == "Show"  then
		StanceBar:SetAlpha(1)
	end
	
	if C["ActionBars"]["Stancebar"]["Value"] == "Hide"  then
		StanceBar:Kill()
	end

	if C["ActionBars"]["Stancebar"]["Value"] == "Mouseover"  then
		StanceBar:SetAlpha(C["ActionBars"]["StanceBarAlpha"])
		
		StanceBar:SetScript("OnEnter", function(self)
			StanceBar:SetAlpha(1)
		end)

		StanceBar:SetScript("OnLeave", function(self)
			StanceBar:SetAlpha(C["ActionBars"]["StanceBarAlpha"])
		end)
		
		for i = 1, NUM_STANCE_SLOTS do
			local Button = _G["StanceButton"..i]

			Button:SetAlpha(C["ActionBars"]["StanceBarAlpha"])

			Button:HookScript("OnEnter", function(self)
				StanceBar:SetAlpha(1)
				Button:SetAlpha(1)
			end)
				
			Button:HookScript("OnLeave", function(self)
				StanceBar:SetAlpha(C["ActionBars"]["StanceBarAlpha"])
				Button:SetAlpha(C["ActionBars"]["StanceBarAlpha"])
			end)
		end
	end
end

function ActionBars:CombatStateStanceBar()
	if C["ActionBars"]["ActionBarStanceCombatState"]["Value"] == "Hide" then
		RegisterStateDriver(StanceBarFrame, "visibility", "[combat] hide; show")
	end

	if C["ActionBars"]["ActionBarStanceCombatState"]["Value"] == "Show" then
		RegisterStateDriver(StanceBarFrame, "visibility", "[combat] show; hide")
	end
end

function ActionBars:LayoutStanceBar()
	local StanceBar = ActionBars.Bars.Stance
	local NumForms = GetNumShapeshiftForms()
	local Size = C.ActionBars.StanceBarButtonSize
	local Spacing = C.ActionBars.ButtonSpacing

	if NumForms > 0 then 
		if C["ActionBars"]["StancebarLayout"]["Value"] == "Vertical" then 
			StanceBar:SetWidth(Spacing*2 + Size)
			StanceBar:SetHeight(Spacing*(NumForms +1) + Size*NumForms)
			StanceBar.Backdrop:SetWidth(Spacing*2 + Size)
			StanceBar.Backdrop:SetHeight(Spacing*(NumForms +1) + Size*NumForms)
		else
			StanceBar:SetHeight(Spacing*2 + Size)
			StanceBar:SetWidth(Spacing*(NumForms +1) + Size*NumForms)
			StanceBar.Backdrop:SetHeight(Spacing*2 + Size)
			StanceBar.Backdrop:SetWidth(Spacing*(NumForms +1) + Size*NumForms)
		end
	else
		StanceBar:Hide()
	end
	
	-- BUTTON: Size and orientation
	for i = 1, NUM_STANCE_SLOTS do
		local Button = _G["StanceButton"..i]
		Button:SetWidth(Size)
		Button:SetHeight(Size)
		
		if C["ActionBars"]["StancebarLayout"]["Value"] == "Vertical" then 
			if (i ~= 1) then
				local Previous = _G["StanceButton"..i-1]

				Button:ClearAllPoints()
				Button:SetPoint("TOP", Previous, "BOTTOM", 0, -Spacing)
			else
				Button:ClearAllPoints()
				Button:SetPoint("TOPLEFT", StanceBar, "TOPLEFT", Spacing, -Spacing)
			end
		end
	end
end

function ActionBars:PositionStanceBar()
	local StanceBar = ActionBars.Bars.Stance
	local ActionBar1 = ActionBars.Bars.Bar1
	local LeftChatBG = ChatLeftBackground

	-- basic position
	StanceBar:EnableMouse(true)
	StanceBar:SetMovable(true)
	StanceBar:SetUserPlaced(true)
	
	--StanceBar:ClearAllPoints()
	--StanceBar:SetPoint("BOTTOMLEFT", ActionBar1, "TOPLEFT", 0, 7)

	-- layout specific anchoring
	--if C["ActionBars"]["StancebarLayout"]["Value"] == "Vertical" then 
	--	StanceBar:ClearAllPoints()
	--	StanceBar:SetPoint("TOP", UIParent, "CENTER", 0, 0)
	--end
end

function ActionBars:MaxUIStyleStanceBar()
	local StanceBar = ActionBars.Bars.Stance
	local BackdropR, BackdropG, BackdropB = unpack(C["General"]["BackdropColor"])
	local BackdropAlpha = (C["ActionBars"]["ABAlpha"])

	StanceBar:SetFrameLevel(4)
	StanceBar:SetFrameStrata("BACKGROUND")
	for i = 1, NUM_STANCE_SLOTS do
		local Button = _G["StanceButton"..i]
		Button:SetSize(C["ActionBars"]["StanceBarButtonSize"], C["ActionBars"]["StanceBarButtonSize"])
	end	

	if C["ActionBars"]["StanceBarBackdrop"]== true then 
		StanceBar.Shadow:SetAlpha(1)
		StanceBar.Backdrop:SetOutside()
		StanceBar.Backdrop:SetAlpha(BackdropAlpha)
		StanceBar.Backdrop:SetBackdropColor(BackdropR, BackdropG, BackdropB)
	else
		StanceBar.Shadow:Hide()
		StanceBar.Shadow:SetAlpha(0)
		StanceBar.Backdrop:SetAlpha(0)
		for i = 1, NUM_STANCE_SLOTS do
			local Button = _G["StanceButton"..i]
			Button:CreateShadow()
		end	
	end
end

function ActionBars:StylingStanceBar()
	local StanceBar = ActionBars.Bars.Stance
	
	if C["ActionBars"]["ActionBarStanceEdges"]["Value"] == "Top" then
		StanceBar:CreateMaxUITopEdge("Stance")
		
	elseif C["ActionBars"]["ActionBarStanceEdges"]["Value"] == "Bottom" then
		StanceBar:CreateMaxUIBottomEdge()
	
	elseif C["ActionBars"]["ActionBarStanceEdges"]["Value"] == "Left" then
		StanceBar:CreateMaxUILeftEdge()
	
	elseif C["ActionBars"]["ActionBarStanceEdges"]["Value"] == "Right" then
		StanceBar:CreateMaxUIRightEdge()
	
	elseif C["ActionBars"]["ActionBarStanceEdges"]["Value"] == "LeftRight" then
		StanceBar:CreateMaxUILeftEdge()
		StanceBar:CreateMaxUIRightEdge()
	
	elseif C["ActionBars"]["ActionBarStanceEdges"]["Value"] == "TopBottom" then
		StanceBar:CreateMaxUITopEdge("Stance")
		StanceBar:CreateMaxUIBottomEdge()
	
	elseif C["ActionBars"]["ActionBarStanceEdges"]["Value"] == "All" then
		StanceBar:CreateMaxUITopEdge("Stance")
		StanceBar:CreateMaxUIBottomEdge()
		StanceBar:CreateMaxUILeftEdge()
		StanceBar:CreateMaxUIRightEdge()
	
	elseif C["ActionBars"]["ActionBarStanceEdges"]["Value"] == "None" then

	end
end

function ActionBars:UpdateStanceBar()
	-- Tukui
	baseUpdateStanceBar(self)

	if InCombatLockdown() then return end
	if (not C.ActionBars.ShapeShift) then return end

	self.VisibilityStanceBar()
	
	if C["ActionBars"]["ActionBarStanceCombatState"]["Value"] ~= "Nothing" then 
		selfCombatStateStanceBar()
	end	
	
	self:LayoutStanceBar()
	self:PositionStanceBar()
	
	if (C.General.Themes.Value == "MaxUI") then
		self:MaxUIStyleStanceBar()
	end
	
	self:StylingStanceBar()	
end