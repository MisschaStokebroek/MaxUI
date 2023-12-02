------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 10-10-2023
------------------------------------------------------------------------------------------

-- setting up Objective Tracker.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local ObjectiveTracker = T.Miscellaneous.ObjectiveTracker

local baseSkin = ObjectiveTracker.Skin
local baseSetDefaultPosition = ObjectiveTracker.SetDefaultPosition

------------------------------------------------------------------------------------------
-- QUESTWATCHFRAME - SKIN
------------------------------------------------------------------------------------------
local function MaxUISkinObjectiveTracker()
	local ObjectiveFrameHolder = ObjectiveTracker.Holder
	local HeaderBar = CreateFrame("StatusBar", nil, ObjectiveFrameHolder)
	local HeaderText = HeaderBar:CreateFontString(nil, "OVERLAY")
	local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
	local thickness = C["General"]["thickness"]
	local Width = (TopLine:GetWidth() / C["DataTexts"]["AmountTopDataTexts"]) or 266
	local Font = C.Medias.Font
	local Texture = T.GetTexture(C.General.LineTexture)

	if C["Quests"]["QuestHeaderLines"] == true then 
		HeaderBar:SetHeight(thickness)
		HeaderBar:SetWidth(Width-1)
		HeaderBar:SetPoint("BOTTOMLEFT", QuestWatchFrame, "TOPLEFT", 0, 0)
		
		HeaderBar:CreateBackdrop(nil, Texture)
		HeaderBar.Backdrop:SetOutside()
		HeaderBar.Backdrop:CreateShadow()
		HeaderBar.Backdrop:SetAlpha(C["General"]["GeneralPanelAlpha"])
	
		if C["General"]["ClassColorLines"]["Value"] == "Dark" then 
			HeaderBar.Backdrop:SetBackdropColor(0.11, 0.11, 0.11)
		elseif C["General"]["ClassColorLines"]["Value"] == "ClassColor" then 
			HeaderBar.Backdrop:SetBackdropColor(unpack(ClassColor))
		elseif C["General"]["ClassColorLines"]["Value"] == "BackdropColor" then 
			HeaderBar.Backdrop:SetBackdropColor(unpack(C.General.BackdropColor))
		elseif C["General"]["ClassColorLines"]["Value"] == "Custom" then 
			HeaderBar.Backdrop:SetBackdropColor(unpack(C.General.CustomColor))
		else
			HeaderBar.Backdrop:SetBackdropColor(0.43, 0.43, 0.43, 1)
		end
	end

	HeaderText:SetFont(Font, 16)
	HeaderText:SetTextColor(unpack(C["DataTexts"]["NameColor"]))
	HeaderText:SetDrawLayer("OVERLAY", 7)
	HeaderText:SetText(CURRENT_QUESTS)
	HeaderText:SetPoint("LEFT", HeaderBar, "LEFT", 12, 0)
	HeaderText:SetShadowColor(0, 0, 0)
	HeaderText:SetShadowOffset(1.25, -1.25)

	-- Change font of watched quests
	for i = 1, 30 do
		local Line = _G["QuestWatchLine"..i]

		Line:SetFont(Font, 12)
	end
	
	ObjectiveTracker.HeaderBar = HeaderBar
	ObjectiveTracker.HeaderText = HeaderText
end

function ObjectiveTracker:Skin()
	if (C.General.Themes.Value == "MaxUI") then
		MaxUISkinObjectiveTracker()	
	else
		baseSkin(self)
	end
end

------------------------------------------------------------------------------------------
-- QUESTWATCHFRAME - POSTIONING
------------------------------------------------------------------------------------------
function ObjectiveTracker:SetDefaultPosition()
	baseSetDefaultPosition(self)
	
	if (C.General.Themes.Value == "MaxUI") then
		local MaxUIQuestLogHolder = MaxUIQuestLogHolder
		local Anchor1, Parent, Anchor2, X, Y = "RIGHT", UIParent, "RIGHT", -48, 300
		local Data = TukuiDatabase.Variables[GetRealmName()][UnitName("Player")]
		local ObjectiveFrameHolder = self.Holder
		local Width = (TopLine:GetWidth() / C["DataTexts"]["AmountTopDataTexts"]) or 266

		QuestWatchFrame:ClearAllPoints()
		QuestWatchFrame:SetPoint("TOPLEFT", MaxUIQuestLogHolder, "BOTTOMLEFT", 0, 0)

		if C["Quests"]["QuestTrackerCombatState"]["Value"] ~= "Nothing" then 
			QuestWatchFrame:HookScript("OnUpdate", function(self)
				if InCombatLockdown() then
					self:SetAlpha(0)
					if MouseIsOver(self) then
						self:SetAlpha(1)
					end	
				else
					self:SetAlpha(1)
				end
			end)
		end

		if C["Quests"]["TrackerPosition"]["Value"] == "Movable" then
			ObjectiveFrameHolder:SetSize(Width, 22)
			ObjectiveFrameHolder:ClearAllPoints()
			ObjectiveFrameHolder:SetPoint(Anchor1, Parent, Anchor2, X, Y)
			
			MaxUIQuestLogHolder:ClearAllPoints()
			MaxUIQuestLogHolder:SetPoint("CENTER", ObjectiveFrameHolder)

			if Data and Data.Move and Data.Move.TukuiObjectiveTracker then
				ObjectiveFrameHolder:ClearAllPoints()
				ObjectiveFrameHolder:SetPoint(unpack(Data.Move.TukuiObjectiveTracker))
			end
		else
			ObjectiveFrameHolder:ClearAllPoints()
		end
	end	
end

------------------------------------------------------------------------------------------
-- QUESTWATCHFRAME - TOGGLE
------------------------------------------------------------------------------------------
local baseObjectiveTrackerAddToggle = ObjectiveTracker.AddToggle

function ObjectiveTracker:AddToggle()
	baseObjectiveTrackerAddToggle(self)

	if (C.General.Themes.Value == "MaxUI") then
		local ObjectiveFrameHolder = self.Holder

		self.Toggle:SetFrameStrata(ObjectiveFrameHolder:GetFrameStrata())
		self.Toggle:SetFrameLevel(ObjectiveFrameHolder:GetFrameLevel()+1)
		
		if C["Quests"]["TrackerPosition"]["Value"] == "Movable" then
			self.Toggle:ClearAllPoints()
			self.Toggle:SetPoint("RIGHT", ObjectiveFrameHolder, "RIGHT", -4, 0)
		end

		if C["Quests"]["TrackerPosition"]["Value"] == "Anchored" then
			self.Toggle:ClearAllPoints()
			self.Toggle:SetPoint("RIGHT", MaxUIQuestLogHolder, "RIGHT", -4, 0)
		end
	end
end

------------------------------------------------------------------------------------------
-- QUESTWATCHFRAME - OTHER ELEMENTS
------------------------------------------------------------------------------------------
