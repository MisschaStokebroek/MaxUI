------------------------------------------------------------------------------------------
-- MaxUI 6 - SHADOWLANDS / TUKUI 20
-- latest update: 27-10-2020
------------------------------------------------------------------------------------------

-- setting up QUEST DATATEXT.
-- (WIP) to do: insert required description and items

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local DataText = T["DataTexts"]
local format = format
local ObjectiveTrackerFrame = ObjectiveTrackerFrame
local QuestWatchFrame = QuestWatchFrame

------------------------------------------------------------------------------------------
-- QUEST DATATEXT
------------------------------------------------------------------------------------------
if T.Retail then

	local Update = function(self)
		if C["Quests"]["TrackerFixed"] == true then
			ObjectiveTrackerFrame:ClearAllPoints()
			ObjectiveTrackerFrame:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 24, -2)
			if C["Quests"]["QuestTrackerCombatState"]["Value"] == "Hide" then
				ObjectiveTrackerFrame:SetParent(self)
			end
		end
		
		local numEntries, numQuests = C_QuestLog.GetNumQuestLogEntries()
		self.Text:SetText(format(DataText.NameColor.."Quests: |r"..DataText.ValueColor.."%s%s".."|r", numQuests, "/25"))
		
		self:SetScript("OnEnter", function(self)
			self.Text:SetText(format(DataText.HighlightColor.."Quests: |r"..DataText.HighlightColor.."%s%s".."|r", numQuests, "/25"))
			GameTooltip:SetOwner(self:GetTooltipAnchor())
			GameTooltip:AddLine("Quest Tracker:")
			GameTooltip:AddLine("Toggle the Quest Log Tracker ", 1, 1, 1, 1, 1, 1)
			GameTooltip:Show()
		end)
			
		self:SetScript("OnLeave", function(self)
			self.Text:SetText(format(DataText.NameColor.."Quests: |r"..DataText.ValueColor.."%s%s".."|r", numQuests, "/25"))
			GameTooltip:Hide()
		end)
	end

	local OnMouseDown = function()
		ObjectiveTrackerFrameFadeToggle()
	end

	local Enable = function(self)
		self:RegisterEvent("PLAYER_ENTERING_WORLD")
		self:RegisterEvent("UNIT_QUEST_LOG_CHANGED")
		self:RegisterEvent("QUEST_LOG_UPDATE")
		self:SetScript("OnEvent", Update)
		self:SetScript("OnMouseDown", OnMouseDown)
		self:Update()
	end

	local Disable = function(self)
		self.Text:SetText("")
		self:UnregisterAllEvents()
		self:SetScript("OnEvent", nil)
		self:SetScript("OnMouseDown", nil)
	end

	DataText:Register("|cffFFFF99Quests|r", Enable, Disable, Update)

else

	local Update = function(self)
		local numEntries, numQuests = GetNumQuestLogEntries()
		self.Text:SetText(format(DataText.NameColor.."Quests: |r"..DataText.ValueColor.."%s%s".."|r", numQuests, "/25"))
		
		--if C["Quests"]["TrackerFixed"] == true then
			--QuestWatchFrame:SetParent(self)
			--QuestWatchFrame:ClearAllPoints()
			--QuestWatchFrame:SetPoint("TOP", self, "TOP", 0, -20)
		--end
		
		self:SetScript("OnEnter", function(self)
			self.Text:SetText(format(DataText.HighlightColor.."Quests: |r"..DataText.HighlightColor.."%s%s".."|r", numQuests, "/25"))
			GameTooltip:SetOwner(self:GetTooltipAnchor())
			GameTooltip:AddLine("Quest Tracker:")
			GameTooltip:AddLine("Toggle the Quest Log Tracker ", 1, 1, 1, 1, 1, 1)
			GameTooltip:Show()
		end)
			
		self:SetScript("OnLeave", function(self)
			self.Text:SetText(format(DataText.NameColor.."Quests: |r"..DataText.ValueColor.."%s%s".."|r", numQuests, "/25"))
			GameTooltip:Hide()
		end)
	end

	local OnMouseDown = function()
		if QuestWatchFrame:IsShown() then
			QuestWatchFrame:Hide()
		else
			QuestWatchFrame:Show()
		end
	end

	local Enable = function(self)
	local numEntries, numQuests = GetNumQuestLogEntries()
		--if C["Quests"]["TrackerFixed"] == true then
		--	self.Text:SetText(format(DataText.ValueColor.."%s%s".."|r", numQuests, "/25"))
		--	self.Text:SetJustifyH("RIGHT")
		--end

		self:RegisterEvent("PLAYER_ENTERING_WORLD")
		self:RegisterEvent("UNIT_QUEST_LOG_CHANGED")
		self:RegisterEvent("QUEST_LOG_UPDATE")
		self:SetScript("OnEvent", Update)
		self:SetScript("OnMouseDown", OnMouseDown)
		self:Update()
	end

	local Disable = function(self)
		self.Text:SetText("")
		self:UnregisterAllEvents()
		self:SetScript("OnEvent", nil)
		self:SetScript("OnMouseDown", nil)
	end

	DataText:Register("|cffFFFF99Quests|r", Enable, Disable, Update)
end	