------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- Setting up datatext for Call to Arms.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local DataText = T["DataTexts"]
local format = format
L.DataText.CallToArms = "CallToArms"

local TankString = TANK
local HealerString = HEALER
local DPSString = DAMAGE
local Result = " %s %s %s"

if not T.Retail then return end

------------------------------------------------------------------------------------------
-- CALL TO ARMS DATATEXT
------------------------------------------------------------------------------------------
local MakeString = function(tank, healer, damage, letter)
	local strtank = ""
	local strheal = ""
	local strdps = ""

	if tank then
		if letter then
			strtank = "T"
		else
			strtank = TankString
		end
	end

	if healer then
		if letter then
			strheal = "H"
		else
			strheal = HealerString
		end
	end

	if damage then
		if letter then
			strdps = "D"
		else
			strdps = DPSString
		end
	end

	return format(Result, strtank, strheal, strdps)
end

local Update = function(self)
	local TankReward = false
	local HealerReward = false
	local DPSReward = false
	local Unavailable = true

	for i = 1, GetNumRandomDungeons() do
		local ID = GetLFGRandomDungeonInfo(i)

		for x = 1,LFG_ROLE_NUM_SHORTAGE_TYPES do
			local Eligible, ForTank, ForHealer, ForDamage, ItemCount = GetLFGRoleShortageRewards(ID, x)

			if Eligible then Unavailable = false end
			if Eligible and ForTank and ItemCount > 0 then TankReward = true end
			if Eligible and ForHealer and ItemCount > 0 then HealerReward = true end
			if Eligible and ForDamage and ItemCount > 0 then DPSReward = true end
		end
	end

	if Unavailable then
		self.Text:SetText(DataText.NameColor..QUEUE_TIME_UNAVAILABLE.."|r")
	else
		if (TankReward or HealerReward or DPSReward) then
			self.Text:SetText(DataText.NameColor..L.DataText.CallToArms..":|r"..DataText.ValueColor..MakeString(TankReward, HealerReward, DPSReward, true).."|r")
		else
			self.Text:SetText(DataText.NameColor..LOOKING_FOR_DUNGEON.."|r")
		end
	end

	if C["DataTexts"]["Icons"] == true then
		self.icon = self:CreateTexture(nil, "OVERLAY")
		self.icon:SetWidth(20)
		self.icon:SetHeight(20)
		self.icon:SetPoint("LEFT", self, "CENTER", 52, 1)
		self.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cCallToArms.tga]])
		self.icon:SetVertexColor(unpack(C["DataTexts"].ValueColor))
	end
end

local OnEnter = function(self)
	GameTooltip:SetOwner(self:GetTooltipAnchor())
	GameTooltip:ClearLines()
	GameTooltip:AddLine("Call to Arms:")

	local AllUnavailable = true
	local NumCTA = 0

	if C["DataTexts"]["Icons"] == true then
		self.icon:SetVertexColor(unpack(C["DataTexts"].HighlightColor))
	end

	for i = 1, GetNumRandomDungeons() do
		local ID, Name = GetLFGRandomDungeonInfo(i)
		local TankReward = false
		local HealerReward = false
		local DPSReward = false
		local Unavailable = true

		for x = 1, LFG_ROLE_NUM_SHORTAGE_TYPES do
			local Eligible, ForTank, ForHealer, ForDamage, ItemCount = GetLFGRoleShortageRewards(ID, x)
			if Eligible then Unavailable = false end
			if Eligible and ForTank and ItemCount > 0 then TankReward = true end
			if Eligible and ForHealer and ItemCount > 0 then HealerReward = true end
			if Eligible and ForDamage and ItemCount > 0 then DPSReward = true end
		end

		if (not Unavailable) then
			AllUnavailable = false
			local RolesString = MakeString(TankReward, HealerReward, DPSReward)

			if (RolesString ~= "   ") then
				GameTooltip:AddDoubleLine(Name .. ":", RolesString, 1, 1, 1)
			end

			if (TankReward or HealerReward or DPSReward) then
				NumCTA = NumCTA + 1
			end
		end
	end

	if Unavailable then
		self.Text:SetText(DataText.HighlightColor..QUEUE_TIME_UNAVAILABLE.."|r")
	else
		if (TankReward or HealerReward or DPSReward) then
			self.Text:SetText(DataText.HighlightColor..L.DataText.CallToArms..":|r"..DataText.HighlightColor..MakeString(TankReward, HealerReward, DPSReward, true).."|r")
		else
			self.Text:SetText(DataText.HighlightColor..LOOKING_FOR_DUNGEON.."|r")
		end
	end

	if AllUnavailable then
		GameTooltip:AddLine("Could not get Call to Arms information", 1, 1, 1, 1, 1, 1)
	elseif (NumCTA == 0) then
		GameTooltip:AddLine("No dungeons are currently offering a Call to Arms", 1, 1, 1, 1, 1, 1)
	end

	GameTooltip:Show()
end

local OnLeave = function(self)
	self:Update()
	if C["DataTexts"]["Icons"] == true then
		self.icon:SetVertexColor(unpack(C["DataTexts"].ValueColor))
	end
	GameTooltip:Hide()
end

local OnMouseDown = function()
	if InCombatLockdown() then
		T.Print(ERR_NOT_IN_COMBAT)

		return
	end
	ToggleFrame(LFDParentFrame)
end

local Enable = function(self)
	self:RegisterEvent("LFG_UPDATE_RANDOM_INFO")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:SetScript("OnEvent", OnEvent) -- This is a global call here!
	self:SetScript("OnMouseDown", OnMouseDown)
	self:SetScript("OnEnter", OnEnter)
	self:SetScript("OnLeave", OnLeave)
	self:Update()
end

local Disable = function(self)
	self.Text:SetText("")
	self:UnregisterAllEvents()
	self:SetScript("OnEvent", nil)
	self:SetScript("OnMouseDown", nil)
	self:SetScript("OnEnter", nil)
	self:SetScript("OnLeave", nil)
end

DataText:Register("|cffFFFF99Call to Arms|r", Enable, Disable, Update)