------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- Setting up datatext for Currency.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local DataText = T["DataTexts"]
local format = format
local strsub = strsub
local strsplit = strsplit
local Data

if not T.Retail then return end

------------------------------------------------------------------------------------------
-- CURRENCY DATATEXT
------------------------------------------------------------------------------------------
local OnMouseDown = function()
	if InCombatLockdown() then
		T.Print(ERR_NOT_IN_COMBAT)

		return
	end
	ToggleCharacter("TokenFrame")
end

local Update = function()
	local Text = DataText.NameColor.. "Currencies|r"

	for i = 1, MAX_WATCHED_TOKENS do
		local Name, Count = GetBackpackCurrencyInfo(i)

		if Name and Count then
			if (i ~= 1) then
				Text = Text .. " "
			else
				Text = ""
			end

			local Words = {strsplit(" ", Name)}

			for _, Word in ipairs(Words) do
				Text = Text .. DataText.NameColor .. strsub(Word, 1, 1) .. "|r"
			end

			Text = Text .. DataText.NameColor .. ": |r" .. DataText.ValueColor .. Count .. "|r"
		end
	end
	Data.Text:SetText(Text)
end

local Enable = function(self)
	Data = self

	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:SetScript("OnEvent", Update)
	self:SetScript("OnMouseDown", OnMouseDown)
	hooksecurefunc("BackpackTokenFrame_Update", Update)
	self:Update()
end

local Disable = function(self)
	self.Text:SetText("")
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	self:SetScript("OnEvent", nil)
	self:SetScript("OnMouseDown", nil)
end

DataText:Register("|cffFFFF99Currency|r", Enable, Disable, Update)