------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 29-11-2022
------------------------------------------------------------------------------------------

-- setting up PET BAR.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local ActionBars = T.ActionBars
local baseCreatePetBar = ActionBars.CreatePetBar
local NUM_PET_ACTION_SLOTS = NUM_PET_ACTION_SLOTS

------------------------------------------------------------------------------------------
-- PET ACTIONBAR
------------------------------------------------------------------------------------------
function ActionBars:VisibilityPetBar()
	local PetBar = ActionBars.Bars.Pet

	if C["ActionBars"]["Petbar"]["Value"] == "Mouseover"  then
		PetBar:SetAlpha(C["ActionBars"]["PetBarAlpha"])
	
		PetBar:SetScript("OnEnter", function(self)
			PetBar:SetAlpha(1)
		end)
		
		PetBar:SetScript("OnLeave", function(self)
			PetBar:SetAlpha(C["ActionBars"]["PetBarAlpha"])
		end)
	
		for i = 1, NUM_PET_ACTION_SLOTS do
		local Button = _G["PetActionButton"..i]

			Button:HookScript("OnEnter", function(self)
				PetBar:SetAlpha(1)
			end)
			
			Button:HookScript("OnLeave", function(self)
				PetBar:SetAlpha(C["ActionBars"]["PetBarAlpha"])
			end)
		
			PetBar["Button"..i] = Button
		end
	end
end

function ActionBars:CombatStatePetBar()
	local PetBar = ActionBars.Bars.Pet

	RegisterStateDriver(PetBar, "visibility", "[@pet,exists,nopossessbar]show;hide")

	if C["ActionBars"]["ActionBarPetCombatState"]["Value"] == "Hide" then
		RegisterStateDriver(PetBar, "visibility", "[combat] hide; show")
	end

	if C["ActionBars"]["ActionBarPetCombatState"]["Value"] == "Show" then
		RegisterStateDriver(PetBar, "visibility", "[combat] show; hide")
	end	
end

function ActionBars:MaxUIStylePetBar()
	local PetBar = ActionBars.Bars.Pet

	PetBar:SetFrameLevel(4)
	PetBar:SetFrameStrata("BACKGROUND")

	if C["ActionBars"]["PetBarBackdrop"]== true then 
		PetBar:SkinMaxUIFrame()
	else
		for i = 1, NUM_PET_ACTION_SLOTS do
			local Button = _G["PetActionButton"..i]
			Button:CreateShadow()
		end
		PetBar.Shadow:SetAlpha(0)
		PetBar.Backdrop:SetAlpha(0)
	end
end

function ActionBars:PositionPetBar()
	local PetBar = ActionBars.Bars.Pet

	PetBar:ClearAllPoints()
	PetBar:SetPoint("RIGHT", UIParent, "RIGHT", -80, 0)
end

function ActionBars:StylingPetBar()
	local PetBar = ActionBars.Bars.Pet
	
	if C["ActionBars"]["ActionBarPetEdges"]["Value"] == "Top" then
		PetBar:CreateMaxUITopEdge("pet")
		
	elseif C["ActionBars"]["ActionBarPetEdges"]["Value"] == "Bottom" then
		PetBar:CreateMaxUIBottomEdge()
	
	elseif C["ActionBars"]["ActionBarPetEdges"]["Value"] == "Left" then
		PetBar:CreateMaxUILeftEdge()
	
	elseif C["ActionBars"]["ActionBarPetEdges"]["Value"] == "Right" then
		PetBar:CreateMaxUIRightEdge()
	
	elseif C["ActionBars"]["ActionBarPetEdges"]["Value"] == "LeftRight" then
		PetBar:CreateMaxUILeftEdge()
		PetBar:CreateMaxUIRightEdge()
	
	elseif C["ActionBars"]["ActionBarPetEdges"]["Value"] == "TopBottom" then
		PetBar:CreateMaxUITopEdge("pet")
		PetBar:CreateMaxUIBottomEdge()
	
	elseif C["ActionBars"]["ActionBarPetEdges"]["Value"] == "All" then
		PetBar:CreateMaxUITopEdge("pet")
		PetBar:CreateMaxUIBottomEdge()
		PetBar:CreateMaxUILeftEdge()
		PetBar:CreateMaxUIRightEdge()
	end
end

function ActionBars:CreatePetBar()
 	if (not C.ActionBars.Pet) then return end
  
   baseCreatePetBar(self)

   for i = 1, NUM_PET_ACTION_SLOTS do
		local Button = _G["PetActionButton"..i]
		local Icon = _G["PetActionButton"..i.."Icon"]

		if T.Retail then
			Button.IconMask:ClearAllPoints()
			Button.IconMask:SetPoint("TOPLEFT", Button, -15, 15)
			Button.IconMask:SetPoint("BOTTOMRIGHT", Button, 15, -15)
		end
	end

	self:VisibilityPetBar()
	if C["ActionBars"]["ActionBarPetCombatState"]["Value"] ~= "Nothing" then 
		self:CombatStatePetBar()
	end
	
	if (C.General.Themes.Value == "MaxUI") then
		self:MaxUIStylePetBar()
	end	
	
	self:PositionPetBar()
	self:StylingPetBar()
end