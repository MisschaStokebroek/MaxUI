------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 30-10-2022
------------------------------------------------------------------------------------------

-- setting up TRINKET BAR.
-- thanks to Aftermathh!

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()

local ActionBars = T.ActionBars
local baseEnable = ActionBars.Enable
local Movers = T["Movers"]

-- wow
local GetInventorySlotInfo = GetInventorySlotInfo
local GetInventoryItemTexture = GetInventoryItemTexture
local GetInventoryItemID = GetInventoryItemID
local GetItemInfo = GetItemInfo
local GetItemCooldown = GetItemCooldown

------------------------------------------------------------------------------------------
-- STANCEBAR
------------------------------------------------------------------------------------------
function ActionBars:CreateTrinketBar()
	local height = C["ActionBars"]["TrinketBarButtonSize"]
	local width = C["ActionBars"]["TrinketBarButtonSize"]
	local spacing = C.ActionBars.ButtonSpacing
	local slotId1, textureName1 = GetInventorySlotInfo("Trinket0Slot")
	local slotId2, textureName2 = GetInventorySlotInfo("Trinket1Slot")

	local T1texture = GetInventoryItemTexture("player", slotId1)
	local T2texture = GetInventoryItemTexture("player", slotId2)
	local itemId1 = GetInventoryItemID("player", slotId1) or "no trinket"
	local itemId2 = GetInventoryItemID("player", slotId2) or "no trinket"
	local itemName1 = GetItemInfo(itemId1) 
	local itemName2 = GetItemInfo(itemId2)
	local start1, duration1, enable1 = GetItemCooldown(itemId1)
	local start2, duration2, enable2 = GetItemCooldown(itemId2)

	-- Trinketbar
	local TrinketBar = CreateFrame("Frame", "TrinketBar", UIParent)
	TrinketBar:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	TrinketBar:SetHeight(height + spacing*2)
	TrinketBar:SetWidth(width*2 + spacing*3)
	TrinketBar:SetAlpha(1) 
	TrinketBar:SetFrameStrata("BACKGROUND")
	TrinketBar:SetFrameLevel(5)
	
	TrinketBar.CreateMaxUIButton("Trinket1", TrinketBar, height, width, "", "Trinket 1:", itemName1, TrinketBar)
	Trinket1:SetPoint("TOPLEFT", TrinketBar, "TOPLEFT", spacing, -spacing)
	Trinket1.highlight:SetVertexColor(1, 1, 1)
	Trinket1:SetAttribute("macrotext1", "/use 13")
	Trinket1:SetNormalTexture(T1texture)
	Trinket1:GetNormalTexture():SetAllPoints()

	TrinketBar.CreateMaxUIButton("Trinket2", TrinketBar, height, width, "", "Trinket 2:", itemName2, TrinketBar)
	Trinket2:SetPoint("RIGHT", TrinketBar, "RIGHT", -spacing, 0)
	Trinket2.highlight:SetVertexColor(1, 1, 1)
	Trinket2:SetAttribute("macrotext1", "/use 14")
	Trinket2:SetNormalTexture(T2texture)
	Trinket2:GetNormalTexture():SetAllPoints()
	
	Trinket1:GetNormalTexture():SetTexCoord(unpack(T.IconCoord))
	Trinket2:GetNormalTexture():SetTexCoord(unpack(T.IconCoord))

	if C["Skins"]["ActionBarButtonFilter"] == true then 
		Trinket1:CreateMaxUIFilter()
		Trinket2:CreateMaxUIFilter()
	end

	Movers:RegisterFrame(TrinketBar, "Trinket Bar")
	self.TrinketBar = TrinketBar
end

function ActionBars:VisibilityTrinketBar()
	local TrinketBar = ActionBars.TrinketBar

	if C["ActionBars"]["TrinketBar"]["Value"] == "Show"  then
		TrinketBar:SetAlpha(1)
	end
	
	if C["ActionBars"]["TrinketBar"]["Value"] == "Hide"  then
		TrinketBar:Kill()
	end

	if C["ActionBars"]["TrinketBar"]["Value"] == "Mouseover"  then
		TrinketBar:SetAlpha(C["ActionBars"]["TrinketBarAlpha"])
		
		TrinketBar:SetScript("OnEnter", function(self)
			TrinketBar:SetAlpha(1)
		end)

		TrinketBar:SetScript("OnLeave", function(self)
			TrinketBar:SetAlpha(C["ActionBars"]["TrinketBarAlpha"])
		end)
		
		Trinket1:SetScript("OnEnter", function(self)
			TrinketBar:SetAlpha(1)
		end)

		Trinket1:SetScript("OnLeave", function(self)
			TrinketBar:SetAlpha(C["ActionBars"]["TrinketBarAlpha"])
		end)
		
		Trinket2:SetScript("OnEnter", function(self)
			TrinketBar:SetAlpha(1)
		end)

		Trinket2:SetScript("OnLeave", function(self)
			TrinketBar:SetAlpha(C["ActionBars"]["TrinketBarAlpha"])
		end)
	end
end

function ActionBars:CombatStateTrinketBar()
	if C["ActionBars"]["TrinketBarCombatState"]["Value"] == "Hide" then
		RegisterStateDriver(TrinketBar, "visibility", "[combat] hide; show")
	end

	if C["ActionBars"]["TrinketBarCombatState"]["Value"] == "Show" then
		RegisterStateDriver(TrinketBar, "visibility", "[combat] show; hide")
	end
end

function ActionBars:LayoutTrinketBar()
	local height = C["ActionBars"]["TrinketBarButtonSize"]
	local width = C["ActionBars"]["TrinketBarButtonSize"]
	local spacing = C.ActionBars.ButtonSpacing

	if C["ActionBars"]["TrinketBarLayout"]["Value"] == "Vertical" then 
		TrinketBar:SetWidth(width + spacing*2)
		TrinketBar:SetHeight(height*2 + spacing*3)
		Trinket2:SetPoint("TOP", Trinket1, "BOTTOM", 0, -spacing)
	end
end

function ActionBars:PositionTrinketBar()
	local ActionBar1 = ActionBars.Bars.Bar1
	local LeftChatBG = ChatLeftBackground

	-- basic position
	TrinketBar:EnableMouse(true)
	TrinketBar:SetMovable(true)
	TrinketBar:SetUserPlaced(true)
	
	TrinketBar:ClearAllPoints()
	TrinketBar:SetPoint("BOTTOM", ActionBar1, "TOP", 0, 7)
end

function ActionBars:MaxUIStyleTrinketBar()
	local BackdropR, BackdropG, BackdropB = unpack(C["General"]["BackdropColor"])
	local BackdropAlpha = (C["ActionBars"]["ABAlpha"])

	if C["ActionBars"]["TrinketBarBackdrop"] then
		TrinketBar:CreateBackdrop()
		TrinketBar.Backdrop:SetAlpha(BackdropAlpha)
		TrinketBar.Backdrop:SetBackdropColor(BackdropR, BackdropG, BackdropB)
		TrinketBar.Backdrop:CreateShadow()
	else
		Trinket1:CreateBackdrop()
		Trinket1.Backdrop:SetAlpha(BackdropAlpha)
		Trinket1.Backdrop:SetBackdropColor(BackdropR, BackdropG, BackdropB)
		Trinket1.Backdrop:CreateShadow()

		Trinket2:CreateBackdrop()
		Trinket2.Backdrop:SetAlpha(BackdropAlpha)
		Trinket2.Backdrop:SetBackdropColor(BackdropR, BackdropG, BackdropB)
		Trinket2.Backdrop:CreateShadow()
	end
end

function ActionBars:StylingTrinketBar()
	
	if C["ActionBars"]["TrinketBarEdges"]["Value"] == "Top" then
		TrinketBar:CreateMaxUITopEdge("Stance")
		
	elseif C["ActionBars"]["TrinketBarEdges"]["Value"] == "Bottom" then
		TrinketBar:CreateMaxUIBottomEdge()
	
	elseif C["ActionBars"]["TrinketBarEdges"]["Value"] == "Left" then
		TrinketBar:CreateMaxUILeftEdge()
	
	elseif C["ActionBars"]["TrinketBarEdges"]["Value"] == "Right" then
		TrinketBar:CreateMaxUIRightEdge()
	
	elseif C["ActionBars"]["TrinketBarEdges"]["Value"] == "LeftRight" then
		TrinketBar:CreateMaxUILeftEdge()
		TrinketBar:CreateMaxUIRightEdge()
	
	elseif C["ActionBars"]["TrinketBarEdges"]["Value"] == "TopBottom" then
		TrinketBar:CreateMaxUITopEdge("Stance")
		TrinketBar:CreateMaxUIBottomEdge()
	
	elseif C["ActionBars"]["TrinketBarEdges"]["Value"] == "All" then
		TrinketBar:CreateMaxUITopEdge("Trinkets")
		TrinketBar:CreateMaxUIBottomEdge()
		TrinketBar:CreateMaxUILeftEdge()
		TrinketBar:CreateMaxUIRightEdge()
	end
end

function ActionBars:UpdateTrinketBar()
	local slotId1, textureName1 = GetInventorySlotInfo("Trinket0Slot")
	local slotId2, textureName2 = GetInventorySlotInfo("Trinket1Slot")
	local T1texture = GetInventoryItemTexture("player", slotId1)
	local T2texture = GetInventoryItemTexture("player", slotId2)
	local itemId1 = GetInventoryItemID("player", slotId1) or "no trinket"
	local itemId2 = GetInventoryItemID("player", slotId2) or "no trinket"
	local itemName1 = GetItemInfo(itemId1)
	local itemName2 = GetItemInfo(itemId2)
	local start1, duration1, enable1 = GetItemCooldown(itemId1)
	local start2, duration2, enable2 = GetItemCooldown(itemId2)

	Trinket1:SetNormalTexture(T1texture)
	Trinket2:SetNormalTexture(T2texture)

	if enable1 == 1 and duration1 == 0 then
		Trinket1:GetNormalTexture():SetVertexColor(1, 1, 1)
		--Trinket1:SetHighlightTexture(T1texture)
	else
		Trinket1:GetNormalTexture():SetVertexColor(0.2, 0.2, 0.2)
	end
	
	if enable2 == 1 and duration2 == 0 then
		Trinket2:GetNormalTexture():SetVertexColor(1, 1, 1)
		--Trinket2:SetHighlightTexture(T2texture)
	else
		Trinket2:GetNormalTexture():SetVertexColor(0.2, 0.2, 0.2)
	end
end

function ActionBars:Enable()
	baseEnable(self)

	if C["ActionBars"]["TrinketBarEnable"] == true then 
		self:CreateTrinketBar()
		
		self:VisibilityTrinketBar()
		self:CombatStateTrinketBar()
		self:LayoutTrinketBar()
		self:PositionTrinketBar()
		self:MaxUIStyleTrinketBar()
		self:StylingTrinketBar()
		
		TrinketBar:SetScript("OnUpdate", self.UpdateTrinketBar)
	end	
end