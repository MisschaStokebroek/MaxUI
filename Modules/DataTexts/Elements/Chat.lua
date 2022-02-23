------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 01-08-2021
------------------------------------------------------------------------------------------

-- Setting up datatext for showing and hiding damagemeters.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local DataText = T["DataTexts"]

------------------------------------------------------------------------------------------
-- CHAT DATATEXT 
------------------------------------------------------------------------------------------
local Update = function(self)
	if C["Tools"]["Chat"] == true then
		self.Text:SetFormattedText("%s", DataText.NameColor .. "Chat|r")

		if C["DataTexts"]["Icons"] == true then
			self.icon = self:CreateTexture(nil, "OVERLAY")
			self.icon:SetWidth(17)
			self.icon:SetHeight(17)
			self.icon:SetPoint("LEFT", self, "CENTER", 26, 0)
			self.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\menuicons\chat.tga]])
			self.icon:SetVertexColor(unpack(C["DataTexts"].ValueColor))
		end
		
		self:SetScript("OnEnter", function(self)
			self.Text:SetFormattedText("%s", DataText.HighlightColor .. "Chat|r")
			if C["DataTexts"]["Icons"] == true then
				self.icon:SetVertexColor(unpack(C["DataTexts"].HighlightColor))
			end
			GameTooltip:SetOwner(self:GetTooltipAnchor())
			GameTooltip:AddLine("Chat:")
			GameTooltip:AddLine("Chat functions and slash commands for chat", 1, 1, 1, 1, 1, 1)
			GameTooltip:Show()
		end)
		
		self:SetScript("OnLeave", function(self)
			self.Text:SetFormattedText("%s", DataText.NameColor .. "Chat|r")
			if C["DataTexts"]["Icons"] == true then
				self.icon:SetVertexColor(unpack(C["DataTexts"].ValueColor))
			end	
			GameTooltip:Hide()
		end)
	end	
end

local OnMouseDown = function(self, Button)
	local LeftBG = T.Chat.Panels.LeftChat
	if (Button == "LeftButton") then
		if InCombatLockdown() then
			T.Print(ERR_NOT_IN_COMBAT)

			return
		end
		ToggleFrame(ChatMenu)
		ChatMenu:ClearAllPoints()
		ChatMenu:SetPoint("BOTTOMLEFT", LeftBG, "TOPLEFT", -1, 32)
	end
end

local Enable = function(self)
	if C["Tools"]["Chat"] == true then
		self:SetScript("OnMouseDown", OnMouseDown)
		self:Update()
	end	
end

local Disable = function(self)
	if C["Tools"]["Chat"] == true then
		self:SetScript("OnMouseDown", nil)
	end	
end

DataText:Register("|cffFFFF99Chat|r", Enable, Disable, Update)