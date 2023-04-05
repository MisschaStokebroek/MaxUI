------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- setting up DATATEXT CENTER DATATEXT.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local DataText = T["DataTexts"]

------------------------------------------------------------------------------------------
-- GAME MENU DATATEXT
------------------------------------------------------------------------------------------
local Update = function(self)
	if C["DataTexts"]["DataCenter"] == false then return end
	
	if C["DataTexts"]["Icons"] == true then
		self.icon = self:CreateTexture(nil, "OVERLAY")
		self.icon:SetWidth(20)
		self.icon:SetHeight(20)
		self.icon:SetPoint("LEFT", self, "CENTER", 45, 0)
		self.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cChar.tga]])
	end

	self.Text:SetFormattedText("%s", DataText.NameColor .. "Data Center|r")
	
	self:SetScript("OnEnter", function(self)
		self.Text:SetFormattedText("%s", DataText.HighlightColor .. "Data Center|r")
		if C["DataTexts"]["Icons"] == true then
			self.icon:SetVertexColor(unpack(C["DataTexts"].HighlightColor))
		end
		GameTooltip:SetOwner(self:GetTooltipAnchor())
		GameTooltip:AddLine("Data Center:")
		GameTooltip:AddLine("Toggle the MaxUI Datatext Center ", 1, 1, 1, 1, 1, 1)
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine("You can change the info elements")
		GameTooltip:Show()
	end)
	
	self:SetScript("OnLeave", function(self)
		self.Text:SetFormattedText("%s", DataText.NameColor .. "Data Center|r")
		if C["DataTexts"]["Icons"] == true then
			self.icon:SetVertexColor(unpack(C["DataTexts"].ValueColor))
		end
		GameTooltip:Hide()
	end)
end

local OnMouseDown = function()
	if InCombatLockdown() then
		T.Print(ERR_NOT_IN_COMBAT)
		return
	end
	DataCenterFadeToggle()
end

local Enable = function(self)
	if C["DataTexts"]["DataCenter"] == false then return end
	self:SetScript("OnMouseDown", OnMouseDown)
	self:Update()
end

local Disable = function(self)
	self:SetScript("OnMouseDown", nil)
end

DataText:Register("|cffFFFF99Data Center|r", Enable, Disable, Update)