------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- Setting up datatext for Durability.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local DataText = T["DataTexts"]
local format = format
local Total = 0
local Current, Max

------------------------------------------------------------------------------------------
-- BLIZZARD DATATEXT
------------------------------------------------------------------------------------------
local Update = function(self)
	for i = 1, 11 do
		if (GetInventoryItemLink("player", L.DataText.Slots[i][1]) ~= nil) then
			Current, Max = GetInventoryItemDurability(L.DataText.Slots[i][1])

			if Current then
				L.DataText.Slots[i][3] = Current / Max
				Total = Total + 1
			end
		end
	end

	table.sort(L.DataText.Slots, function(a, b) return a[3] < b[3] end)

	if (Total > 0) then
		self.Text:SetFormattedText("%s %s", DataText.NameColor .. RESISTANCE0_NAME .. "|r", DataText.ValueColor .. floor(L.DataText.Slots[1][3] * 100) .. "%|r")
	else
		self.Text:SetFormattedText("%s %s", DataText.NameColor .. RESISTANCE0_NAME .. "|r", DataText.ValueColor .. "100" .. "%|r")
	end

	if C["DataTexts"]["Icons"] == true then
		self.icon = self:CreateTexture(nil, "OVERLAY")
		self.icon:SetWidth(20)
		self.icon:SetHeight(20)
		self.icon:SetPoint("LEFT", self, "CENTER", 45, 0)
		self.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cDura.tga]])
		self.icon:SetVertexColor(unpack(C["DataTexts"].ValueColor))
	end
end

local OnEnter = function(self)
	if (not InCombatLockdown()) then
		GameTooltip:SetOwner(self:GetTooltipAnchor())
		GameTooltip:ClearLines()
		GameTooltip:AddLine("Durability:")

		for i = 1, 11 do
			if (L.DataText.Slots[i][3] ~= 1000) then
				local Green, Red
				Green = L.DataText.Slots[i][3] * 2
				Red = 1 - Green
				GameTooltip:AddDoubleLine(L.DataText.Slots[i][2], floor(L.DataText.Slots[i][3] * 100).."%", 1, 1, 1, Red + 1, Green, 0)
			end
		end

		GameTooltip:Show()
	end
	
	if (Total > 0) then
		self.Text:SetFormattedText("%s %s", DataText.HighlightColor .. RESISTANCE0_NAME .. "|r", DataText.HighlightColor .. floor(L.DataText.Slots[1][3] * 100) .. "%|r")
	else
		self.Text:SetFormattedText("%s %s", DataText.HighlightColor .. RESISTANCE0_NAME .. "|r", DataText.HighlightColor .. "100" .. "%|r")
	end

	if C["DataTexts"]["Icons"] == true then
		self.icon:SetVertexColor(unpack(C["DataTexts"].HighlightColor))
	end
end

local OnLeave = function(self)
	GameTooltip_Hide()
	if (Total > 0) then
		self.Text:SetFormattedText("%s %s", DataText.NameColor .. RESISTANCE0_NAME .. "|r", DataText.ValueColor .. floor(L.DataText.Slots[1][3] * 100) .. "%|r")
	else
		self.Text:SetFormattedText("%s %s", DataText.NameColor .. RESISTANCE0_NAME .. "|r", DataText.ValueColor .. "100" .. "%|r")
	end
	
	if C["DataTexts"]["Icons"] == true then
		self.icon:SetVertexColor(unpack(C["DataTexts"].ValueColor))
	end
end

local OnMouseDown = function(self)
	if InCombatLockdown() then
		T.Print(ERR_NOT_IN_COMBAT)

		return
	end
	ToggleCharacter("PaperDollFrame")
end

local Enable = function(self)
	self:RegisterEvent("MERCHANT_SHOW")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("UPDATE_INVENTORY_DURABILITY")
	self:SetScript("OnEvent", Update)
	self:SetScript("OnEnter", OnEnter)
	self:SetScript("OnLeave", OnLeave)
	self:SetScript("OnMouseDown", OnMouseDown)
	self:Update()
end

local Disable = function(self)
	self.Text:SetText("")
	self:UnregisterAllEvents()
	self:SetScript("OnEvent", nil)
	self:SetScript("OnEnter", nil)
	self:SetScript("OnLeave", nil)
	self:SetScript("OnMouseDown", nil)
end

DataText:Register("|cffFFFF99Durability|r", Enable, Disable, Update)