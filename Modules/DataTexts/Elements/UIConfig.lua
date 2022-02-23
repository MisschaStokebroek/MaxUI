------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- Setting up datatext for showing and hiding UI Config.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local DataText = T["DataTexts"]

------------------------------------------------------------------------------------------
-- UI CONFIG DATATEXT
------------------------------------------------------------------------------------------
local Update = function(self)
	if C["Tools"]["UIConfig"] == true then
		self.Text:SetFormattedText("%s", DataText.NameColor .. "UI Config|r")
		self.icon = self:CreateTexture(nil, "OVERLAY")
		
		if C["DataTexts"]["Icons"] == true then
			self.icon:SetWidth(17)
			self.icon:SetHeight(17)
			self.icon:SetPoint("LEFT", self, "CENTER", 35, 0)
			self.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\menuicons\acp.tga]])
			self.icon:SetVertexColor(unpack(C["DataTexts"].ValueColor))
		end
		
		self:SetScript("OnEnter", function(self)
			self.Text:SetFormattedText("%s", DataText.HighlightColor .. "UI Config|r")
			if C["DataTexts"]["Icons"] == true then
				self.icon:SetVertexColor(unpack(C["DataTexts"].HighlightColor))
			end
			GameTooltip:SetOwner(self:GetTooltipAnchor())
			GameTooltip:AddLine("UI Config:")
			GameTooltip:AddLine("Toggle UI Configuration ", 1, 1, 1, 1, 1, 1)
			GameTooltip:Show()
		end)
		
		self:SetScript("OnLeave", function(self)
			self.Text:SetFormattedText("%s", DataText.NameColor .. "UI Config|r")
			if C["DataTexts"]["Icons"] == true then
				self.icon:SetVertexColor(unpack(C["DataTexts"].ValueColor))
			end
			GameTooltip:Hide()
		end)
	end	
end

local OnMouseDown = function()
	if InCombatLockdown() then
		T.Print(ERR_NOT_IN_COMBAT)

		return
	end
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui c")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox,0)
end

local Enable = function(self)
	self:SetScript("OnMouseDown", OnMouseDown)
	self:Update()
end

local Disable = function(self)
	self:UnregisterAllEvents()
	self:SetScript("OnMouseUp", nil)
	self:SetScript("OnMouseDown", nil)
end
DataText:Register("|cffFFFF99UI Config|r", Enable, Disable, Update)