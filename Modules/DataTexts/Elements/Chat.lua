------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 30-10-2022
------------------------------------------------------------------------------------------

-- Setting up datatext for showing and hiding damagemeters.
-- Can I add the Chattool to the datatext? rewrite?

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local DataText = T["DataTexts"]

------------------------------------------------------------------------------------------
-- CHAT DATATEXT 
------------------------------------------------------------------------------------------
local Update = function(self)

	self.Text:SetFormattedText("%s", DataText.NameColor .. "Chat / Emotes|r")
	if C["DataTexts"]["Icons"] == true then
		self.icon = self:CreateTexture(nil, "OVERLAY")
		self.icon:SetWidth(20)
		self.icon:SetHeight(20)
		self.icon:SetPoint("LEFT", self, "CENTER", 50, 0)
		self.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\Chat.tga]])
		self.icon:SetVertexColor(unpack(C["DataTexts"].ValueColor))
	end
	
	self:SetScript("OnEnter", function(self)
		self.Text:SetFormattedText("%s", DataText.HighlightColor .. "Chat / Emotes|r")
		if C["DataTexts"]["Icons"] == true then
			self.icon:SetVertexColor(unpack(C["DataTexts"].HighlightColor))
		end
		GameTooltip:SetOwner(self:GetTooltipAnchor())
		GameTooltip:AddLine("Chat / Emotes:")
		GameTooltip:AddLine("Chat functions and slash commands for chat", 1, 1, 1, 1, 1, 1)
		GameTooltip:Show()
	end)
	
	self:SetScript("OnLeave", function(self)
		self.Text:SetFormattedText("%s", DataText.NameColor .. "Chat / Emotes|r")
		if C["DataTexts"]["Icons"] == true then
			self.icon:SetVertexColor(unpack(C["DataTexts"].ValueColor))
		end	
		GameTooltip:Hide()
	end)
end	

local OnMouseDown = function(self, Button)
	if (Button == "LeftButton") then
		if InCombatLockdown() then
			T.Print(ERR_NOT_IN_COMBAT)

			return
		end
		ToggleFrame(ChatMenu)
		ChatMenu:ClearAllPoints()
		ChatMenu:SetPoint("BOTTOM", self, "TOP", 0, 32)
	end
end

local Enable = function(self)
	self:SetScript("OnMouseDown", OnMouseDown)
	self:Update()
end

local Disable = function(self)
	self:SetScript("OnMouseDown", nil)
end

DataText:Register("|cffFFFF99Chat / Emotes|r", Enable, Disable, Update)