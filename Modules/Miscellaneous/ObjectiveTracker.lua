------------------------------------------------------------------------------------------
-- MaxUI 6.5 - SHADOWLANDS / TUKUI 20
-- latest update: 05-08-2020
------------------------------------------------------------------------------------------

-- setting up Objective Tracker.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local ObjectiveTracker = T.Miscellaneous.ObjectiveTracker
local baseEnable = ObjectiveTracker.Enable
local baseSkin = ObjectiveTracker.Skin

if T.Retail then 
	local baseCreateToggleButtons = ObjectiveTracker.CreateToggleButtons
	local baseUpdateProgressBar = ObjectiveTracker.UpdateProgressBar
	local ObjectiveTrackerFrameHeaderMenuMinimizeButton = ObjectiveTrackerFrame.HeaderMenu.MinimizeButton
	local FadeTimer = C["General"]["FaderTime"]

	-- Animation
	ObjectiveTrackerFrame:fadeOut(FadeTimer)
	ObjectiveTrackerFrame:fadeIn(FadeTimer)

	function ObjectiveTrackerFrameFadeToggle()

		if ObjectiveTrackerFrame:IsShown() then
			ObjectiveTrackerFrame.fadeOut:Play()
		else
			ObjectiveTrackerFrame:Show()
			ObjectiveTrackerFrame.fadeIn:Play()
		end
	end

	function ObjectiveTracker:UpdateProgressBarColors(Min)
		if (self.Bar and Min) then
			local R, G, B = unpack(T.Colors.class[T.MyClass])
			
			self.Bar:SetStatusBarColor(R, G, B)
			
			if self.Bar.Backdrop then
				self.Bar.Backdrop:SetBackdropColor(R * .2, G * .2, B * .2)
			end
		end
	end

	------------------------------------------------------------------------------------------
	-- OBJECTIVE TRACKER FRAME
	------------------------------------------------------------------------------------------
	-- TOGGLE BUTTONS
	function ObjectiveTracker:CreateToggleButtons()
		if C["Quests"]["TrackerFixed"] ~= true then
			baseCreateToggleButtons(self)
		end
	end

	-- OBJECTIVE TRACKER
	local function MaxUISkinObjectiveTracker()
		local Frame = ObjectiveTrackerFrame.MODULES
		local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
		local thickness = C["General"]["thickness"]
		local Texture = T.GetTexture(C.General.LineTexture)
		
		if (Frame) then
			for i = 1, #Frame do

				local Modules = Frame[i]
				if (Modules) then
					local Header = Modules.Header

					local Background = Modules.Header.Background
					Background:SetAtlas(nil)

					local Text = Modules.Header.Text
					Text:SetFont(C.Medias.Font, 16)
					Text:SetTextColor(unpack(ClassColor))
					Text:SetDrawLayer("OVERLAY", 7)
					Text:SetParent(Header)

					if not (Modules.IsSkinned) then
						local HeaderPanel = CreateFrame("Frame", nil, Header)
						HeaderPanel:SetFrameLevel(Header:GetFrameLevel() - 1)
						HeaderPanel:SetFrameStrata("BACKGROUND")
						HeaderPanel:SetOutside(Header, 1, 1)
						
						if C["Quests"]["QuestHeaderBackdrops"] == true then 
							HeaderPanel.Gradation = HeaderPanel:CreateTexture(nil, "ART")
							HeaderPanel.Gradation:SetHeight(24)
							HeaderPanel.Gradation:SetWidth(266)
							HeaderPanel.Gradation:SetPoint("LEFT", HeaderPanel, "LEFT", -15, -1)
							
							HeaderPanel.Gradation:SetTexture([[Interface\AddOns\MaxUI\Medias\Textures\Gradation.tga]])
							HeaderPanel.Gradation:SetVertexColor(.1, .1, .1, 0.7)
						end
						
						if C["Quests"]["QuestHeaderLines"] == true then 
							local HeaderBar = CreateFrame("Frame", nil, HeaderPanel)
							HeaderBar:SetPoint("LEFT", HeaderPanel, -13, -0)
							HeaderBar:SetHeight(thickness)
							HeaderBar:SetWidth(266)
							
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
							else
								HeaderBar.Backdrop:SetBackdropColor(0.43, 0.43, 0.43, 1)
							end
						end

						local Minimize = Header.MinimizeButton
						Minimize.SetCollapsed = function() return end
						Minimize:StripTextures()
						Minimize:ClearAllPoints()
						Minimize:SetAllPoints(HeaderPanel)
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

	-- SCENARIO
	local baseSkinScenario = ObjectiveTracker.SkinScenario
	local function MaxUISkinScenario()
		local StageBlock = _G["ScenarioStageBlock"]
		StageBlock.Stage:SetFont(C.Medias.MaxUIFont, 17)
	end

	function ObjectiveTracker:SkinScenario()
		baseSkinScenario(self)
		
		if (C.General.Themes.Value == "MaxUI") then
			MaxUISkinScenario()
		end	
	end

	-- QUESTITEM
	local baseUpdateQuestItem = ObjectiveTracker.UpdateQuestItem
	function ObjectiveTracker:UpdateQuestItem(block)
		baseUpdateQuestItem(self, block)

		if not (C.General.Themes.Value == "MaxUI") then return end
		if C["Quests"]["TrackerFixed"] == true then
			local width = ((TopLine:GetWidth()/9)-1)
			local QuestItemButton = block.itemButton
			if (QuestItemButton) then
				local PointA, PointB, PointC, PointD, PointE = QuestItemButton:GetPoint()
				QuestItemButton:ClearAllPoints()
				QuestItemButton:SetPoint(PointA, PointB, PointC, 24, -1)
			end
		end
	end

	-- PROGRESSBAR
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

	function ObjectiveTracker:Enable()
		-- Tukui
		baseEnable(self)
		
		if C["Quests"]["TrackerFixed"] == true then
			ObjectiveTrackerFrameHeaderMenuMinimizeButton:Hide()
		end
	end

else

------------------------------------------------------------------------------------------
-- CLASSIC / TBC
------------------------------------------------------------------------------------------
	local function MaxUISkinObjectiveTracker()
		local HeaderBar = CreateFrame("StatusBar", nil, QuestWatchFrame)
		local HeaderText = HeaderBar:CreateFontString(nil, "OVERLAY")
		local Font = C.Medias.Font
		local Texture = T.GetTexture(C.General.LineTexture)
		
		HeaderBar:SetPoint("BOTTOMLEFT", QuestWatchFrame, "TOPLEFT", 0, 0)
		HeaderBar:SetHeight(thickness)
		HeaderBar:SetWidth(266)

		if C["Quests"]["QuestHeaderBackdrops"] == true then 
			QuestWatchFrame.Gradation = QuestWatchFrame:CreateTexture(nil, "ART")
			QuestWatchFrame.Gradation:SetHeight(24)
			QuestWatchFrame.Gradation:SetWidth(266)
			QuestWatchFrame.Gradation:SetPoint("LEFT", HeaderBar, "LEFT", 0, 0)
			
			QuestWatchFrame.Gradation:SetTexture([[Interface\AddOns\MaxUI\Medias\Textures\Gradation.tga]])
			QuestWatchFrame.Gradation:SetVertexColor(.1, .1, .1, 0.7)
		end
		
		if C["Quests"]["QuestHeaderLines"] == true then 
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
			else
				HeaderBar.Backdrop:SetBackdropColor(0.43, 0.43, 0.43, 1)
			end
		end
		
		HeaderText:SetFont(Font, 12)
		HeaderText:SetPoint("LEFT", HeaderBar, "LEFT", 6, 0)
		HeaderText:SetText(CURRENT_QUESTS)
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

	--function ObjectiveTracker:Enable()
	--	local TopLine = TopLine

		-- Tukui
	--	baseEnable(self)
		
		--if C["Quests"]["TrackerFixed"] == true then
		--	TukuiObjectiveTracker:ClearAllPoints()
		--	TukuiObjectiveTracker:SetPoint("LEFT", TopLine, "LEFT", (((TopLine:GetWidth()/9)*2)+2), 0)
		--	TukuiObjectiveTracker:SetWidth(266)
		--	self.Toggle:Kill()
		--end
	--end
end

------------------------------------------------------------------------------------------
-- TRACK ONLY zone and active quests
------------------------------------------------------------------------------------------
if T.Retail then 

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

		--AQT_PrintDebugMsg("Updating quests for: " .. currentZone .. " or " .. minimapZone)

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
end