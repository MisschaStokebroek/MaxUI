------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- Setting up datatext for Avoidance.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local DataText = T["DataTexts"]
local format = format
local abs = abs
local Dodge, Parry, Block, Avoidance, TargetLevel, PlayerLevel, BaseMissChance, LevelDifference
local MyRace = select(2, UnitRace("Player"))
local GetBlockChance = GetBlockChance
local GetParryChance = GetParryChance
local GetDodgeChance = GetDodgeChance
local BaseMissChance, LevelDifference, Avoidance

------------------------------------------------------------------------------------------
-- AVOIDANCE DATATEXT
------------------------------------------------------------------------------------------
local Update = function(self)
	TargetLevel = UnitLevel("target")
	PlayerLevel = UnitLevel("player")

	if TargetLevel == -1 then
		BaseMissChance = (5 - (3 * .2)) --Boss Value
		LevelDifference = 3
	elseif TargetLevel > PlayerLevel then
		BaseMissChance = (5 - ((TargetLevel - PlayerLevel) * .2)) --Mobs above player level
		LevelDifference = (TargetLevel - PlayerLevel)
	elseif TargetLevel < PlayerLevel and TargetLevel > 0 then
		BaseMissChance = (5 + ((PlayerLevel - TargetLevel) * .2)) --Mobs below player level
		LevelDifference = (TargetLevel - PlayerLevel)
	else
		BaseMissChance = 5 --Sets miss chance of attacker level if no target exists, lv80=5, 81=4.2, 82=3.4, 83=2.6
		LevelDifference = 0
	end

	if (MyRace == "NightElf") then
		BaseMissChance = BaseMissChance + 2
	end

	if (LevelDifference >= 0) then
		Dodge = (GetDodgeChance() - LevelDifference * 0.2)
		Parry = (GetParryChance() - LevelDifference * 0.2)
		Block = (GetBlockChance() - LevelDifference * 0.2)
		Avoidance = (Dodge + Parry + Block)

		self.Text:SetText(DataText.NameColor.."Avd: |r"..DataText.ValueColor..format("%.2f", Avoidance).."%|r")
	else
		Dodge = (GetDodgeChance() + abs(LevelDifference * 0.2))
		Parry = (GetParryChance() + abs(LevelDifference * 0.2))
		Block = (GetBlockChance() + abs(LevelDifference * 0.2))
		Avoidance = (Dodge + Parry + Block)

		self.Text:SetText(DataText.NameColor.."Avd: |r"..DataText.ValueColor..format("%.2f", Avoidance).."%|r")
	end

	if C["DataTexts"]["Icons"] == true then
		self.icon = self:CreateTexture(nil, "OVERLAY")
		self.icon:SetWidth(20)
		self.icon:SetHeight(20)
		self.icon:SetPoint("LEFT", self, "CENTER", 52, 1)
		self.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cAvoidance.tga]])
	end
end

local OnEnter = function(self)
	if (LevelDifference >= 0) then
		self.Text:SetText(DataText.HighlightColor.."Avd: |r"..DataText.HighlightColor..format("%.2f", Avoidance).."%|r")
	else
		self.Text:SetText(DataText.HighlightColor.."Avd: |r"..DataText.HighlightColor..format("%.2f", Avoidance).."%|r")
	end
	if C["DataTexts"]["Icons"] == true then
		self.icon:SetVertexColor(unpack(C["DataTexts"].HighlightColor))
	end

	if (not InCombatLockdown()) then
		GameTooltip:SetOwner(self:GetTooltipAnchor())
		GameTooltip:ClearLines()

		GameTooltip:AddLine("Avoidance Breakdown:")
		if (TargetLevel > 1) then
			GameTooltip:AddDoubleLine("Current target: ", "Level "..TargetLevel, 1, 1, 1, 1, 1, 1)
		elseif (TargetLevel == -1) then
			GameTooltip:AddDoubleLine("Current target: ", "Boss", 1, 1, 1, 1, 1, 1)
		else
			GameTooltip:AddDoubleLine("Current target: ", "Level "..TargetLevel, 1, 1, 1, 1, 1, 1)
		end

		GameTooltip:AddDoubleLine("Dodge", format("%.2f", Dodge) .. "%", 1, 1, 1, 1, 1, 1)
		GameTooltip:AddDoubleLine("Parry", format("%.2f", Parry) .. "%", 1, 1, 1, 1, 1, 1)
		GameTooltip:AddDoubleLine("Block", format("%.2f", Block) .. "%", 1, 1, 1, 1, 1, 1)
		GameTooltip:Show()
	end
end

local OnLeave = function(self)
	if (LevelDifference >= 0) then
		self.Text:SetText(DataText.NameColor.."Avd: |r"..DataText.ValueColor..format("%.2f", Avoidance).."%|r")
	else
		self.Text:SetText(DataText.NameColor.."Avd: |r"..DataText.ValueColor..format("%.2f", Avoidance).."%|r")
	end
	if C["DataTexts"]["Icons"] == true then
		self.icon:SetVertexColor(unpack(C["DataTexts"].ValueColor))
	end
	GameTooltip:Hide()
end

local Enable = function(self)
	self:RegisterEvent("UNIT_AURA")
	self:RegisterEvent("UNIT_INVENTORY_CHANGED")
	self:RegisterEvent("PLAYER_TARGET_CHANGED")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:SetScript("OnEvent", Update)
	self:SetScript("OnEnter", OnEnter)
	self:SetScript("OnLeave", OnLeave)
	self:Update()
end

local Disable = function(self)
	self.Text:SetText("")
	self:UnregisterAllEvents()
	self:SetScript("OnEvent", nil)
	self:SetScript("OnEnter", nil)
	self:SetScript("OnLeave", nil)
end

DataText:Register("|cffFFFF99Avoidance|r", Enable, Disable, Update)