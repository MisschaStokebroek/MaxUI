------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- Setting up datatext for showing and hiding damagemeters.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local DataText = T["DataTexts"]

if IsAddOnLoaded('Skada') == false and IsAddOnLoaded('Recount') == false and IsAddOnLoaded('Details') == false then return end

------------------------------------------------------------------------------------------
-- METERS DATATEXT
------------------------------------------------------------------------------------------
local Update = function(self)
	if C["Tools"]["Meters"] == true then
		self.Text:SetFormattedText("%s", DataText.NameColor .. "Meters|r")

		if C["DataTexts"]["Icons"] == true then
			self.icon = self:CreateTexture(nil, "OVERLAY")
			self.icon:SetSize(17, 17)
			self.icon:SetPoint("LEFT", self, "CENTER", 35, 0)
			self.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\menuicons\damagemeter.tga]])
			self.icon:SetVertexColor(unpack(C["DataTexts"].ValueColor))
		end
		
		self:SetScript("OnEnter", function(self)
			self.Text:SetFormattedText("%s", DataText.HighlightColor .. "Meters|r")
			if C["DataTexts"]["Icons"] == true then
				self.icon:SetVertexColor(unpack(C["DataTexts"].HighlightColor))
			end	
			GameTooltip:SetOwner(self:GetTooltipAnchor())
			GameTooltip:AddLine("Damage Meter:")
			GameTooltip:AddLine("Toggle active Damage Meter ", 1, 1, 1, 1, 1, 1)
			GameTooltip:AddLine("(Skada, Recount, Details) ", 1, 1, 1, 1, 1, 1)
			GameTooltip:Show()
		end)
		
		self:SetScript("OnLeave", function(self)
			self.Text:SetFormattedText("%s", DataText.NameColor .. "Meters|r")
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
	
	if IsAddOnLoaded('Skada') then
		DEFAULT_CHAT_FRAME.editBox:SetText("/Skada toggle")
		ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox,0)
	end
	if IsAddOnLoaded('Recount') then
		DEFAULT_CHAT_FRAME.editBox:SetText("/recount config")
		ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox,0)
	end	
	if IsAddOnLoaded('Details') then
		DEFAULT_CHAT_FRAME.editBox:SetText("/details toggle")
		ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox,0)
	end	
end

local Enable = function(self)
	self:SetScript("OnMouseDown", OnMouseDown)
	self:Update()
end

local Disable = function(self)
	self:SetScript("OnMouseDown", nil)
end
DataText:Register("|cffFFFF99Meters|r", Enable, Disable, Update)