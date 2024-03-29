﻿------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 05-08-2020
------------------------------------------------------------------------------------------

-- setting up Objective Tracker.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local ObjectiveTracker = T.Miscellaneous.ObjectiveTracker
local Movers = T["Movers"]

local baseEnable = ObjectiveTracker.Enable
local baseSkin = ObjectiveTracker.Skin
local baseUpdateProgressBar = ObjectiveTracker.UpdateProgressBar
local baseSetDefaultPosition = ObjectiveTracker.SetDefaultPosition

local ObjectiveTrackerFrameHeaderMenuMinimizeButton = ObjectiveTrackerFrame.HeaderMenu.MinimizeButton
local FadeTimer = C["General"]["FaderTime"]

-- Animation
ObjectiveTrackerFrame:fadeOut(FadeTimer)
ObjectiveTrackerFrame:fadeIn(FadeTimer)

------------------------------------------------------------------------------------------
-- OBJECTIVE TRACKER FRAME
------------------------------------------------------------------------------------------
local function UpdateMinimizeButton(button, collapsed)
	if collapsed then
		button.tex:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowDown.tga]])
	else
		button.tex:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowUp.tga]])
	end
end

local function MaxUISkinObjectiveTracker()
	local Frame = ObjectiveTrackerFrame.MODULES
	local ClassColor = T.Colors.class[select(2, UnitClass("player"))]
	local thickness = C["General"]["thickness"]
	local Width = (TopLine:GetWidth() / C["DataTexts"]["AmountTopDataTexts"]) or 266
	local Texture = T.GetTexture(C.General.LineTexture)

	if (Frame) then
		for i = 1, #Frame do

			local Modules = Frame[i]
			if (Modules) then
				local Header = Modules.Header
				local Background = Modules.Header.Background
				local HeaderText = Modules.Header.Text

				Background:SetAtlas(nil)

				HeaderText:SetFont(C.Medias.Font, 16)
				HeaderText:SetTextColor(unpack(C["DataTexts"]["NameColor"]))
				HeaderText:SetDrawLayer("OVERLAY", 7)
				HeaderText:SetParent(Header)

				if not (Modules.IsSkinned) then
					if C["Quests"]["QuestHeaderLines"] == true then 
						Header:SetHeight(thickness)
						Header:SetWidth(Width-1)
						Header:SetFrameLevel(Header:GetFrameLevel() - 1)
						Header:SetFrameStrata("BACKGROUND")
						
						Header:CreateBackdrop(nil, Texture)
						Header.Backdrop:SetOutside()
						Header.Backdrop:CreateShadow()
						Header.Backdrop:SetAlpha(C["General"]["GeneralPanelAlpha"])

						if C["General"]["ClassColorLines"]["Value"] == "Dark" then 
							Header.Backdrop:SetBackdropColor(0.11, 0.11, 0.11)
						elseif C["General"]["ClassColorLines"]["Value"] == "ClassColor" then 
							Header.Backdrop:SetBackdropColor(unpack(ClassColor))
						elseif C["General"]["ClassColorLines"]["Value"] == "BackdropColor" then 
							Header.Backdrop:SetBackdropColor(unpack(C.General.BackdropColor))
						elseif C["General"]["ClassColorLines"]["Value"] == "Custom" then 
							Header.Backdrop:SetBackdropColor(unpack(C.General.CustomColor))
						else
							Header.Backdrop:SetBackdropColor(0.43, 0.43, 0.43, 1)
						end

						if C["Skins"]["ObjectiveTrackerFilter"] == true then 
							Header:CreateMaxUIFilter()
						end
					end

					local button = Header.MinimizeButton
					if button then
						button:GetNormalTexture():SetAlpha(0)
						button:GetPushedTexture():SetAlpha(0)
						
						button:StripTextures()

						button.tex = button:CreateTexture(nil, 'OVERLAY')
						button.tex:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\ArrowUp.tga]])
						button.tex:SetInside()

						button:HookScript("OnEnter", function(self)
							button.tex:SetVertexColor(1, 1, 0)
						end)

						button:HookScript("OnLeave", function(self)
							button.tex:SetVertexColor(1, 1, 1)
						end)

						hooksecurefunc(button, 'SetCollapsed', UpdateMinimizeButton)
					end

					Modules.IsSkinned = true
				end
			end
		end
	end
end

function ObjectiveTracker:Skin()
	if (C.General.Themes.Value == "MaxUI") then
		MaxUISkinObjectiveTracker()	
	else
		baseSkin(self)
	end
end

------------------------------------------------------------------------------------------
-- SCENARIO
------------------------------------------------------------------------------------------
local function MaxUISkinScenario()
	local StageBlock = _G["ScenarioStageBlock"]
	StageBlock.Stage:SetFont(C.Medias.MaxUIFont, 17)
end

local baseSkinScenario = ObjectiveTracker.SkinScenario
function ObjectiveTracker:SkinScenario()
	baseSkinScenario(self)
	
	if (C.General.Themes.Value == "MaxUI") then
		MaxUISkinScenario()
	end	
end

------------------------------------------------------------------------------------------
-- QUESTITEM
------------------------------------------------------------------------------------------
local baseUpdateQuestItem = ObjectiveTracker.UpdateQuestItem
function ObjectiveTracker:UpdateQuestItem(block)
	baseUpdateQuestItem(self, block)

	if (QuestItemButton) then
		if not (C.General.Themes.Value == "MaxUI") then return end
		
		local QuestItemButton = block.itemButton

		if C["Quests"]["TrackerPosition"]["Value"] == "Anchored" then
			local PointA, PointB, PointC, PointD, PointE = QuestItemButton:GetPoint()
			QuestItemButton:SetSize(120, 120)
			QuestItemButton:ClearAllPoints()
			QuestItemButton:SetPoint(PointA, PointB, PointC, 120, -1)
		end
	end
end

------------------------------------------------------------------------------------------
-- PROGRESSBAR
------------------------------------------------------------------------------------------
function ObjectiveTracker:UpdateProgressBar(_, line)
	baseUpdateProgressBar(self, _, line)
	
	if not (C.General.Themes.Value == "MaxUI") then return end
	local Progress = line.ProgressBar
	local Bar = Progress.Bar
	if (Bar) then
		local Label = Bar.Label
		if (Label) then
			Label:SetFont(C.Medias.Font, 12)
		end
	end
end

function ObjectiveTracker:UpdateProgressBarColors(Min)
	if (self.Bar and Min) then
		local R, G, B = unpack(T.Colors.class[T.MyClass])
		
		self.Bar:SetStatusBarColor(R, G, B)
		
		if self.Bar.Backdrop then
			self.Bar.Backdrop:SetBackdropColor(R * .2, G * .2, B * .2)
		
			if not (self.Bar.Filter) then
				if C["Skins"]["ObjectiveTrackerFilter"] == true then 
					self.Bar:CreateMaxUIFilter()
				end
			end
		end
	end
end

------------------------------------------------------------------------------------------
-- POSITIONING AND DEFAULTS
------------------------------------------------------------------------------------------
function ObjectiveTracker:OnMove()
	ObjectiveTrackerFrame:ClearAllPoints()
	if (C.General.Themes.Value == "MaxUI") then
		ObjectiveTrackerFrame:SetPointBase("TOPLEFT", MaxUIQuestLogHolder, "TOPLEFT", 11, 0)
	else
		ObjectiveTrackerFrame:SetPointBase("TOP", TukuiObjectiveTracker)
	end
end

function ObjectiveTracker:SetDefaultPosition()
	baseSetDefaultPosition(self)
	
	if (C.General.Themes.Value == "MaxUI") then
		local MaxUIQuestLogHolder = MaxUIQuestLogHolder
		local Anchor1, Parent, Anchor2, X, Y = "RIGHT", UIParent, "RIGHT", -48, 300
		local Data = TukuiDatabase.Variables[T.MyRealm][T.MyName]

		ObjectiveTrackerFrame:ClearAllPoints()
		ObjectiveTrackerFrame:SetPoint("TOPLEFT", MaxUIQuestLogHolder, "TOPLEFT", 11, 0)
		ObjectiveTrackerFrame:SetHeight(T.ScreenHeight - 520)
		ObjectiveTrackerFrame:SetClampedToScreen(false)
		
		if C["Quests"]["QuestTrackerCombatState"]["Value"] ~= "Nothing" then 
			ObjectiveTrackerFrame:HookScript("OnUpdate", function(self)
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
			TukuiObjectiveTracker:SetSize(200, 22)
			TukuiObjectiveTracker:ClearAllPoints()
			TukuiObjectiveTracker:SetPoint(Anchor1, Parent, Anchor2, X, Y)
			
			MaxUIQuestLogHolder:ClearAllPoints()
			MaxUIQuestLogHolder:SetPoint("CENTER", TukuiObjectiveTracker)

			if Data and Data.Move and Data.Move.TukuiObjectiveTracker then
				TukuiObjectiveTracker:ClearAllPoints()
				TukuiObjectiveTracker:SetPoint(unpack(Data.Move.TukuiObjectiveTracker))
			end
		else
			TukuiObjectiveTracker:ClearAllPoints()
		end
	end
end

------------------------------------------------------------------------------------------
-- ENABLE
------------------------------------------------------------------------------------------
function ObjectiveTracker:Enable()

	-- Tukui
	baseEnable(self)

	-- MaxUI
	if (C.General.Themes.Value == "MaxUI") then
		ObjectiveTrackerFrameHeaderMenuMinimizeButton:Hide()
	end

	if C["Quests"]["TrackerCollapsedOnLogin"] == true then
		ObjectiveTrackerFrame:Hide()
	end
end

------------------------------------------------------------------------------------------
-- TRACK ONLY zone and active quests
------------------------------------------------------------------------------------------
local AutoQuestTrackerFrame = CreateFrame("Frame")

AutoQuestTrackerFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
AutoQuestTrackerFrame:RegisterEvent("ZONE_CHANGED")
AutoQuestTrackerFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")


function AQT_HandleEvent(self, event, ...)
	-- Wait 2 seconds to reduce loading congestion.
	C_Timer.After(2, function() AQT_UpdateQuestsForZone() end)
end

function AQT_UpdateQuestsForZone()
	local currentZone = GetRealZoneText()
	local minimapZone = GetMinimapZoneText()
	
	if C.Quests.FilterTracking.Value ~= "Zone" then return end
	
	if currentZone == nil and minimapZone == nil then return end

	--print("Updating quests for: " .. currentZone .. " - " .. minimapZone)

	local questZone = nil
	
	for questIndex = 1, C_QuestLog.GetNumQuestLogEntries() do
		local questTitle, isHeader, questId, isWorldQuest, isHidden, isCalling, isOnMap, hasLocalPOI = AQT_getQuestInfo(questIndex)

		if not isWorldQuest and not isHidden then
			if isHeader then
				questZone = questTitle
			else
				if questZone == currentZone or questZone == minimapZone or isOnMap or hasLocalPOI then
					if C_QuestLog.GetQuestWatchType(questId) == nil then
						AQT_ShowOrHideQuest(questIndex, questId, true)
					end
				elseif C_QuestLog.GetQuestWatchType(questId) == 0 then
					AQT_ShowOrHideQuest(questIndex, questId, false)
				end
			end
		end
	end
end

function AQT_ShowOrHideQuest(questIndex, questId, show)
	-- Checks that the quest is still in the quest log, and that we are not in combat lockdown to avoid tainting
	local questTitle, _, id = AQT_getQuestInfo(questIndex)
	if id == questId and not (InCombatLockdown() == 1) then
		if show then
			C_QuestLog.AddQuestWatch(questId)
		else
			C_QuestLog.RemoveQuestWatch(questId)
		end
	end
end

function AQT_getQuestInfo(index)
	local quest = C_QuestLog.GetInfo(index)
	return quest.title, quest.isHeader, quest.questID, C_QuestLog.IsWorldQuest(quest.questID), quest.isHidden, C_QuestLog.IsQuestCalling(quest.questID), quest.isOnMap, quest.hasLocalPOI
end

AutoQuestTrackerFrame:SetScript("OnEvent", AQT_HandleEvent)