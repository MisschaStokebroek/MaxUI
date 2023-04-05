------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 20-10-2022
------------------------------------------------------------------------------------------

-- Setting up datatext for Talents.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local DataText = T["DataTexts"]

if T.Retail then

	local format = format
	local CharacterSpec = ""
	local LootSpec = ""
	local Movers = T["Movers"]
	local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
	local SpecTool = CreateFrame("Frame")

	-- Lib Globals
	local _G = _G
	local select = select
	local unpack = unpack
	local pairs = pairs

	-- WoW Globals
	local GetTalentInfo = GetTalentInfo
	local GetSpecialization = GetSpecialization
	local SetSpecialization = SetSpecialization
	local GetNumSpecializations = GetNumSpecializations
	local GetSpecializationInfo = GetSpecializationInfo
	local GetLootSpecialization = GetLootSpecialization
	local SetLootSpecialization = SetLootSpecialization

	-- BLIZZARD BUTTON
	function OpenBlizzardTalentUI()
		if not PlayerTalentFrame then
			LoadAddOn("Blizzard_TalentUI")
		end

		if not PlayerTalentFrame:IsShown() then
			ShowUIPanel(PlayerTalentFrame)
		else
			HideUIPanel(PlayerTalentFrame)
		end
	end

	function SpecTool:CreateBlizzardButtonBar()
		local Spacing = 3
		local buttonsize = C["General"]["ButtonSize"]
		local SpecBar = self.SpecBar
		
		local BlizzardButtonBar = CreateFrame("Frame", "BlizzardButtonBar", SpecBar)
		BlizzardButtonBar:SetSize(buttonsize*7 + Spacing *8, buttonsize + Spacing*2)
		BlizzardButtonBar:SetPoint("TOPLEFT", SpecBar, "BOTTOMLEFT", 0, -3)
		BlizzardButtonBar:CreateBackdrop("Transparent")
		BlizzardButtonBar.Backdrop:CreateShadow()
		
		BlizzardButtonBar.CreateMaxUIButton("BlizzardUIButton", BlizzardButtonBar, buttonsize *7 + Spacing *6, buttonsize, "Blizzard UI", "Talents:", "Open the Blizzard Talent UI ", BlizzardButtonBar)
		BlizzardUIButton:SetPoint("TOPLEFT", BlizzardButtonBar, "TOPLEFT", Spacing, -Spacing)
		BlizzardUIButton:SetScript("OnMouseUp", function(self)
			--OpenBlizzardTalentUI()
			ToggleTalentFrame()
		end)
	end

	-- TALENTS SPECS
	function SpecTool:OnClickLeft(Button)
		if (Button == "LeftButton") then
			if self:GetID() ~= GetSpecialization() then
				SetSpecialization(self:GetID())
			end
		end
	end

	function SpecTool:OnClickRight(Button)
		if (Button == "RightButton") then
			local SpecID = GetSpecializationInfo(self:GetID())
			
			if (GetLootSpecialization() == SpecID) then
				SpecID = 0
			end
			
			SetLootSpecialization(SpecID)
		end
	end

	function SpecTool:SpecButtonUpdate()
		if self:GetID() == GetSpecialization() then
			--self.CurrentSpecArrow:SetAlpha(1)
			self:GetNormalTexture():SetVertexColor(1, 1, 1)
			if C["General"]["ClassColorHeaders"]["Value"] == "Dark" then 
				self.Backdrop:SetBorderColor(0.11, 0.11, 0.11)
			
			elseif C["General"]["ClassColorHeaders"]["Value"] == "ClassColor" then 
				self.Backdrop:SetBorderColor(unpack(ClassColor))
			
			elseif C["General"]["ClassColorHeaders"]["Value"] == "Grey" then 
				self.Backdrop:SetBorderColor(0.43, 0.43, 0.43)
			else			
				self.Backdrop:SetBorderColor(unpack(C.General.BackdropColor))
			end
		else
			--self.CurrentSpecArrow:SetAlpha(0)
			self:GetNormalTexture():SetVertexColor(0.2, 0.2, 0.2)
			self.Backdrop:SetBorderColor(0, 0, 0)
		end
	end

	function SpecTool:UpdateLootIcon()
		if (GetLootSpecialization() == GetSpecializationInfo(self:GetID())) then
			self.CurrentLootSpecIcon:SetAlpha(1)
		else
			self.CurrentLootSpecIcon:SetAlpha(0)
		end
	end

	function SpecTool:CreateSpecBar()
		local GetNumSpecializations = GetNumSpecializations()
		local Spacing = 3
		local buttonsize = C["General"]["ButtonSize"]

		-- backdrop
		local SpecBar = CreateFrame("Frame", "SpecBar", UIParent)
		for i = 1, GetNumSpecializations do
			if GetNumSpecializations == 3 then
				SpecBar:SetSize(buttonsize*7 + Spacing*8, ((buttonsize*7 + Spacing*3) /3) + Spacing*2)
			else
				SpecBar:SetSize(buttonsize*7 + Spacing*8, ((buttonsize*7 + Spacing*3) /4) + Spacing*2)
			end
		end
		SpecBar:SetPoint("CENTER", UIParent, 0, 60)
		SpecBar:SkinMaxUIFrame()
		SpecBar:SetFrameLevel(1)
		SpecBar:SetFrameStrata("HIGH")
		SpecBar:Hide()
		SpecBar:SetAlpha(0)	
		Movers:RegisterFrame(SpecBar, "Spec / Talent Bar")

		-- header
		SpecBar:CreateMaxUIHeader("Spec & Talents")
		SpecBar:CreateMaxUICloseButton(SpecBar.MaxUIHeader)

		-- Combat State
		RegisterStateDriver(SpecBar, "visibility", "[combat] hide; nil")

		SpecBar.Button = {}

		-- Button
		for i = 1, GetNumSpecializations do
			local SpecID, SpecName, Description, Icon = GetSpecializationInfo(i)
			
			local Button = CreateFrame("Button", nil, SpecBar)
			Button:CreateBackdrop()
			Button.Backdrop:CreateShadow()

			if GetNumSpecializations == 3 then
				Button:SetSize((buttonsize*7 + Spacing*3) /3, (buttonsize*7 + Spacing*3) /3)
			else
				Button:SetSize((buttonsize*7 + Spacing*3) /4, (buttonsize*7 + Spacing*3) /4)
			end

			Button:SetID(i)
			Button:SetNormalTexture(Icon)
			Button:GetNormalTexture():SetInside()
			Button:GetNormalTexture():SetTexCoord(0.07, 0.93, 0.07, 0.93)

			Button:SetHighlightTexture(Icon)
			Button:GetHighlightTexture():SetInside()
			Button:GetHighlightTexture():SetTexCoord(0.07, 0.93, 0.07, 0.93)

			if C["Skins"]["ButtonFilter"]  then
				Button:CreateMaxUIFilterInside()
			end

			if (i == 1) then
				Button:SetPoint("LEFT", SpecBar, Spacing+1, 0)
			else
				Button:SetPoint("LEFT", SpecBar.Button[i - 1], "RIGHT", Spacing, 0)
			end
		
			Button:SetScript("OnEnter", function(self)
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT", 12, 0)
				GameTooltip:AddLine(SpecName)
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine(Description, 1, 1, 1, true)
				GameTooltip:Show()
			end)

			Button:SetScript("OnLeave", function(self)
				GameTooltip:Hide()
			end)

			--Button.CurrentSpecArrow = Button:CreateTexture(nil, "OVERLAY")
			--Button.CurrentSpecArrow:SetPoint("CENTER", Button, "BOTTOM", 0, 0)
			--Button.CurrentSpecArrow:SetAlpha(0)
			--Button.CurrentSpecArrow:SetWidth(24)
			--Button.CurrentSpecArrow:SetHeight(12)
			--Button.CurrentSpecArrow:SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\ArrowDown.tga]])
				
			Button.CurrentLootSpecIcon = Button:CreateTexture(nil, "OVERLAY")
			Button.CurrentLootSpecIcon:SetPoint("TOPRIGHT", Button, "TOPRIGHT", -2, -2)
			Button.CurrentLootSpecIcon:SetVertexColor(1, 1, 0)
			Button.CurrentLootSpecIcon:SetWidth(14)
			Button.CurrentLootSpecIcon:SetHeight(14)
			Button.CurrentLootSpecIcon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cJournal.tga]])

			--if C["General"]["ClassColorHeaders"]["Value"] == "Dark" then 
			--	Button.CurrentSpecArrow:SetVertexColor(0.11, 0.11, 0.11)
			--elseif C["General"]["ClassColorHeaders"]["Value"] == "ClassColor" then 
			--	Button.CurrentSpecArrow:SetVertexColor(unpack(ClassColor))
			--elseif C["General"]["ClassColorHeaders"]["Value"] == "Grey" then 
			--	Button.CurrentSpecArrow:SetVertexColor(0.43, 0.43, 0.43)
			--else			
			--	Button.CurrentSpecArrow:SetVertexColor(unpack(C.General.BackdropColor))
			--end

			Button:RegisterForClicks("AnyDown")
			Button:RegisterEvent("PLAYER_ENTERING_WORLD")
			Button:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
			Button:RegisterEvent("PLAYER_LOOT_SPEC_UPDATED")
			Button:SetScript("OnClick", self.OnClickLeft)
			Button:SetScript("OnEvent", self.SpecButtonUpdate)

			SpecBar.Button[i] = Button
		end
		
		for Frames, Button in pairs(SpecBar.Button) do
			Button:HookScript("OnClick", self.OnClickRight)
			Button:HookScript("OnEvent", self.UpdateLootIcon)
		end

		self.SpecBar = SpecBar
	end

	-- TAlENTS CHOOSEN
	function SpecTool:UpdateTalentButtonBar(event)
		for i = 1, MAX_TALENT_TIERS do
			for j = 1, 3 do
				local _, Name, Icon, Selected, Available = GetTalentInfo(i, j, 1)

				if (Selected) then
					SpecTool.TalentBar.Button[i]:SetNormalTexture(Icon)			
					SpecTool.TalentBar.Button[i]:GetNormalTexture():SetInside()
					SpecTool.TalentBar.Button[i]:GetNormalTexture():SetTexCoord(0.07, 0.93, 0.07, 0.93)

					SpecTool.TalentBar.Button[i]:SetScript("OnEnter", function(self)
						if C["General"]["ClassColorHeaders"]["Value"] == "Dark" then 
							SpecTool.TalentBar.Button[i].Backdrop:SetBorderColor(0.11, 0.11, 0.11)
						
						elseif C["General"]["ClassColorHeaders"]["Value"] == "ClassColor" then 
							SpecTool.TalentBar.Button[i].Backdrop:SetBorderColor(unpack(ClassColor))
						
						elseif C["General"]["ClassColorHeaders"]["Value"] == "Grey" then 
							SpecTool.TalentBar.Button[i].Backdrop:SetBorderColor(0.43, 0.43, 0.43)
						else			
							SpecTool.TalentBar.Button[i].Backdrop:SetBorderColor(unpack(C.General.BackdropColor))
						end
						GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT", 12, 0)
						GameTooltip:AddLine(Name)
						GameTooltip:Show()
					end)

					SpecTool.TalentBar.Button[i]:SetScript("OnLeave", function(self)
						SpecTool.TalentBar.Button[i].Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
						GameTooltip:Hide()
					end)
				end
			end
		end
	end

	-- CREATE
	function SpecTool:CreateTalentButtonBar()
		local Spacing = 3
		local buttonsize = C["General"]["ButtonSize"]
		local SpecBar = self.SpecBar
		
		local TalentBar = CreateFrame("Frame", "TalentBar", SpecBar)
		TalentBar:SetSize(buttonsize * 7 + Spacing *8, buttonsize + Spacing*2)
		TalentBar:SetPoint("TOPLEFT", SpecBar, "BOTTOMLEFT", 0, -3)
		TalentBar:CreateBackdrop("Transparent")
		TalentBar.Backdrop:CreateShadow()

		TalentBar.Button = {}

		for i = 1, MAX_TALENT_TIERS do
				local Button = CreateFrame("Button", nil, TalentBar)
				Button:CreateBackdrop()
				Button.Backdrop:CreateShadow()
				Button:SetSize(buttonsize, buttonsize)
				
				--Button:GetNormalTexture():SetTexCoord(0.07, 0.93, 0.07, 0.93)
					
				if C["Skins"]["ButtonFilter"] then
					Button:CreateMaxUIFilterInside()
				end

				if (i == 1) then
					Button:SetPoint("LEFT", TalentBar, Spacing, 0)
				else
					Button:SetPoint("LEFT", TalentBar.Button[i - 1], "RIGHT", Spacing, 0)
				end

				Button:RegisterEvent("PLAYER_ENTERING_WORLD")
				Button:RegisterEvent("PLAYER_TALENT_UPDATE")
				Button:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
				Button:RegisterEvent("PLAYER_PVP_TALENT_UPDATE")
				Button:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
				Button:RegisterEvent("SPELL_UPDATE_USABLE")
				Button:RegisterEvent("SPELLS_CHANGED")
				Button:HookScript("OnEvent", self.UpdateTalentButtonBar)

				TalentBar.Button[i] = Button
		end
		self.TalentBar = TalentBar
	end

	-- EXECUTE
	function SpecTool:Enable()
		self:CreateSpecBar()
		--self:CreateTalentButtonBar()
		self:CreateBlizzardButtonBar()
	end	

	function SpecTool:OnEvent(event)
		self:Enable()
	end

	SpecTool:RegisterEvent("PLAYER_LOGIN")
	SpecTool:SetScript("OnEvent", SpecTool.OnEvent)

	DataText.SpecTool = SpecTool
end

------------------------------------------------------------------------------------------
-- TALENT DATATEXT
------------------------------------------------------------------------------------------
local Update = function(self)
	if T.Retail then
		local Tree = GetSpecialization()

		if (not Tree) then
			self.Text:SetText("No Talents")
		else
			local Spec = select(2, GetSpecializationInfo(Tree)) or ""
			local Loot = GetLootSpecialization()

			if (Loot == 0) then
				Loot = select(2, GetSpecializationInfo(Tree))
			else
				Loot = select(2, GetSpecializationInfoByID(Loot))
			end

			CharacterSpec = Spec
			LootSpec = Loot

			if ((CharacterSpec == "") or (LootSpec == "")) then
				return
			end
			
			self.Text:SetFormattedText("%s %s", DataText.NameColor.."Spec:|r "..DataText.ValueColor..Spec.."|r", DataText.NameColor.."Loot:|r "..DataText.ValueColor..Loot.."|r")
		end
	else
			self.Text:SetFormattedText("%s  %s", DataText.NameColor.."Talents|r", DataText.ValueColor.."Current Build|r")
	end

end

local OnEnter = function(self)
	if T.Retail then
		local Tree = GetSpecialization()

		if (not Tree) then
			self.Text:SetText("No Talents")
		else
			local Spec = select(2, GetSpecializationInfo(Tree)) or ""
			local Loot = GetLootSpecialization()

			if (Loot == 0) then
				Loot = select(2, GetSpecializationInfo(Tree))
			else
				Loot = select(2, GetSpecializationInfoByID(Loot))
			end

			CharacterSpec = Spec
			LootSpec = Loot

			self.Text:SetFormattedText("%s %s", DataText.HighlightColor.."Spec:|r "..DataText.HighlightColor..Spec.."|r", DataText.HighlightColor.."Loot:|r "..DataText.HighlightColor..Loot.."|r")
		end

		if InCombatLockdown() then
			return
		end

		if ((CharacterSpec == "") or (LootSpec == "")) then
			return
		end

		GameTooltip:SetOwner(self:GetTooltipAnchor())
		GameTooltip:ClearLines()

		GameTooltip:AddLine("Specialization & Loot Preferences:")
		GameTooltip:AddDoubleLine("Current specialization:", CharacterSpec, 1, 1, 1)
		GameTooltip:AddDoubleLine("Loot preference specialization:", LootSpec, 1, 1, 1)
	else
		
		self.Text:SetFormattedText("%s  %s", DataText.HighlightColor.."Talents|r", DataText.HighlightColor.."Current Build|r")
	
		GameTooltip:SetOwner(self:GetTooltipAnchor())
		GameTooltip:ClearLines()

		GameTooltip:AddLine("Talent Tree:")
		GameTooltip:AddDoubleLine("Current specialization:", "to be done" , 1, 1, 1)
	
	end
	GameTooltip:Show()
end

local OnLeave = function(self)
	self:Update()
	GameTooltip:Hide()
end

local OnMouseDown = function()
	if InCombatLockdown() then
		T.Print(ERR_NOT_IN_COMBAT)

		return
	end
	if T.Retail then 
		SpecBar:fadeToggle()
	end
end

local Enable = function(self)
	
	if T.Retail then 
		self:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
		self:RegisterEvent("PLAYER_TALENT_UPDATE")
		self:RegisterEvent("PLAYER_LOOT_SPEC_UPDATED")
	end	
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("CONFIRM_TALENT_WIPE")
	self:SetScript("OnEvent", Update)
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

DataText:Register("|cffFFFF99Talents|r", Enable, Disable, Update)