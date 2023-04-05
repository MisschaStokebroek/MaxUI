------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- setting up RAID TOOLS.

-- TO DO: Test flares and other functions

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local DataText = T["DataTexts"]
local Movers = T["Movers"]
local RaidTools = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- RAID TOOLS
------------------------------------------------------------------------------------------
function RaidTools:SetCountdown()
	if T.Retail then
		C_PartyInfo.DoCountdown(10)
	end	
end

function RaidTools:CreateRaidToolsFrame()
	local buttonsize = C["General"]["ButtonSize"]
	local spacing = 3
	local TabsBGRight = T.Chat.Panels.RightChatTabs
	
	local raidtoolbg = CreateFrame("Frame", "raidtoolbg", UIParent)
	raidtoolbg:SkinMaxUIFrame()
	raidtoolbg:SetHeight(buttonsize*3 + spacing*4)
	raidtoolbg:SetWidth(buttonsize*11 + spacing*12)
	raidtoolbg:SetPoint("BOTTOM", TabsBGRight, "TOP", 0, 40)
	raidtoolbg:SetFrameLevel(1)
	raidtoolbg:SetFrameStrata("HIGH")
	raidtoolbg:Hide()
	raidtoolbg:SetAlpha(0)
	raidtoolbg:CreateMaxUIHeader("Raid Tools")
	raidtoolbg:CreateMaxUICloseButton(raidtoolbg.MaxUIHeader)
	
	Movers:RegisterFrame(raidtoolbg, "Raid Tools")

	-- tooltip Anchor
	RaidToolsTooltipAnchor = raidtoolbg.MaxUIHeader
end

function RaidTools:CreateRaidToolsButtonsMarkers()
	local buttonsize = C["General"]["ButtonSize"]
	local spacing = 3

	-- Button Clear Raid Marker
	raidtoolbg.CreateMaxUIButton("clearraidmarker", raidtoolbg, (buttonsize*3 + spacing*2), buttonsize, "Clear", "Marker: ", "Clear target marker ", RaidToolsTooltipAnchor)
	clearraidmarker:SetPoint("TOPRIGHT", raidtoolbg, "TOPRIGHT", -spacing, -spacing)
	clearraidmarker:SetAttribute("macrotext1", "/tm 0")

	-- Button 8 - Yellow Star
	raidtoolbg.CreateMaxUIButton("mbbutton08", raidtoolbg, buttonsize, buttonsize, "", "Marker: ", "Set target marker |cffFFFF00STAR|r ", RaidToolsTooltipAnchor)
	mbbutton08:SetPoint("RIGHT", clearraidmarker, "LEFT", -spacing, 0)
	mbbutton08:SetAttribute("macrotext1", "/tm 1")
		mbbutton08.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Markers\star.blp]])

	-- Button 7 - Orange/Circle
	raidtoolbg.CreateMaxUIButton("mbbutton07", raidtoolbg, buttonsize, buttonsize, "", "Marker: ", "Set target marker |cffFF8000CIRCLE|r ", RaidToolsTooltipAnchor)
	mbbutton07:SetPoint("RIGHT", mbbutton08, "LEFT", -spacing, 0)
	mbbutton07:SetAttribute("macrotext1", "/tm 2")
		mbbutton07.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Markers\circle.blp]])

	-- Button 6 - Purple/Diamond
	raidtoolbg.CreateMaxUIButton("mbbutton06", raidtoolbg, buttonsize, buttonsize, "", "Marker: ", "Set target marker |cffFF00FFDIAMOND|r ", RaidToolsTooltipAnchor)
	mbbutton06:SetPoint("RIGHT", mbbutton07, "LEFT", -spacing, 0)
	mbbutton06:SetAttribute("macrotext1", "/tm 3")
		mbbutton06.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Markers\diamond.blp]])

	-- Button 5 - Green/Triangle
	raidtoolbg.CreateMaxUIButton("mbbutton05", raidtoolbg, buttonsize, buttonsize, "", "Marker: ", "Set target marker |cff33FF33TRIANGLE|r ", RaidToolsTooltipAnchor)
	mbbutton05:SetPoint("RIGHT", mbbutton06, "LEFT", -spacing, 0)
	mbbutton05:SetAttribute("macrotext1", "/tm 4")
		mbbutton05.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Markers\triangle.blp]])
		
	-- Button 4 - Grey/Moon
	raidtoolbg.CreateMaxUIButton("mbbutton04", raidtoolbg, buttonsize, buttonsize, "", "Marker: ", "Set target marker |cffCCCCFFMOON|r ", RaidToolsTooltipAnchor)
	mbbutton04:SetPoint("RIGHT", mbbutton05, "LEFT", -spacing, 0)
	mbbutton04:SetAttribute("macrotext1", "/tm 5")
		mbbutton04.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Markers\moon.blp]])
		
	-- Button 3 - Blue/Square
	raidtoolbg.CreateMaxUIButton("mbbutton03", raidtoolbg, buttonsize, buttonsize, "", "Marker: ", "Set target marker |cff0080FFSQUARE|r ", RaidToolsTooltipAnchor)
	mbbutton03:SetPoint("RIGHT", mbbutton04, "LEFT", -spacing, 0)
	mbbutton03:SetAttribute("macrotext1", "/tm 6")
		mbbutton03.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Markers\square.blp]])
		
	-- Button 2 - Red/Cross
	raidtoolbg.CreateMaxUIButton("mbbutton02", raidtoolbg, buttonsize, buttonsize, "", "Marker: ", "Set target marker |cffFF0000CROSS|r ", RaidToolsTooltipAnchor)
	mbbutton02:SetPoint("RIGHT", mbbutton03, "LEFT", -spacing, 0)
	mbbutton02:SetAttribute("macrotext1", "/tm 7")
		mbbutton02.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Markers\cross.blp]])

	-- Button 1 - White/Skull
	raidtoolbg.CreateMaxUIButton("mbbutton01", raidtoolbg, buttonsize, buttonsize, "", "Marker: ", "Set target marker |cffFFFFFFSKULL|r ", RaidToolsTooltipAnchor)
	mbbutton01:SetPoint("RIGHT", mbbutton02, "LEFT", -spacing, 0)
	mbbutton01:SetAttribute("macrotext1", "/tm 8")
		mbbutton01.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Markers\skull.blp]])
end

function RaidTools:CreateRaidToolsButtonsFlares()
	local buttonsize = C["General"]["ButtonSize"]
	local spacing = 3

	-- Button clearworldmarkers
	raidtoolbg.CreateMaxUIButton("clearworldmarkers", raidtoolbg, (buttonsize*3 + spacing*2), buttonsize, "Clear", "World marker: ", "Clear world markers ", RaidToolsTooltipAnchor)
	clearworldmarkers:SetPoint("TOPRIGHT", clearraidmarker, "BOTTOMRIGHT", 0, -spacing)
	clearworldmarkers:SetAttribute("macrotext1", "/cwm 0")

	-- Button 8 - yellow/star
	raidtoolbg.CreateMaxUIButton("wbbutton08", raidtoolbg, buttonsize, buttonsize, "", "World marker: ", "Set world marker |cffFFFF00STAR|r ", RaidToolsTooltipAnchor)
	wbbutton08:SetPoint("RIGHT", clearworldmarkers, "LEFT", -spacing, 0)
	wbbutton08:SetAttribute("macrotext1", "/wm 5")
		wbbutton08.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Flares\yellow.tga]])

	-- Button 7 - orange/circle
	raidtoolbg.CreateMaxUIButton("wbbutton07", raidtoolbg, buttonsize, buttonsize, "", "World marker: ", "Set world marker |cffFF8000CIRCLE|r ", RaidToolsTooltipAnchor)
	wbbutton07:SetPoint("RIGHT", wbbutton08, "LEFT", -spacing, 0)
	wbbutton07:SetAttribute("macrotext1", "/wm 6")
		wbbutton07.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Flares\orange.tga]])
	
	-- Button 6 - purple/diamond
	raidtoolbg.CreateMaxUIButton("wbbutton06", raidtoolbg, buttonsize, buttonsize, "", "World marker: ", "Set world marker |cffFF00FFDIAMOND|r ", RaidToolsTooltipAnchor)
	wbbutton06:SetPoint("RIGHT", wbbutton07, "LEFT", -spacing, 0)
	wbbutton06:SetAttribute("macrotext1", "/wm 3")
		wbbutton06.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Flares\purple.tga]])

	-- Button 5 - green/triangle
	raidtoolbg.CreateMaxUIButton("wbbutton05", raidtoolbg, buttonsize, buttonsize, "", "World marker: ", "Set world marker |cff33FF33TRIANGLE|r ", RaidToolsTooltipAnchor)
	wbbutton05:SetPoint("RIGHT", wbbutton06, "LEFT", -spacing, 0)
	wbbutton05:SetAttribute("macrotext1", "/wm 2")
		wbbutton05.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Flares\green.tga]])
	
	-- Button 4 - gray/moon
	raidtoolbg.CreateMaxUIButton("wbbutton04", raidtoolbg, buttonsize, buttonsize, "", "World marker: ", "Set world marker |cffCCCCFFMOON|r ", RaidToolsTooltipAnchor)
	wbbutton04:SetPoint("RIGHT", wbbutton05, "LEFT", -spacing, 0)
	wbbutton04:SetAttribute("macrotext1", "/wm 7")
		wbbutton04.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Flares\grey.tga]])

	-- Button 3 - blue/square
	raidtoolbg.CreateMaxUIButton("wbbutton03", raidtoolbg, buttonsize, buttonsize, "", "World marker: ", "Set world marker |cff0080FFSQUARE|r ", RaidToolsTooltipAnchor)
	wbbutton03:SetPoint("RIGHT", wbbutton04, "LEFT", -spacing, 0)
	wbbutton03:SetAttribute("macrotext1", "/wm 1")
		wbbutton03.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Flares\blue.tga]])
	
	-- Button 2 - Red/Cross
	raidtoolbg.CreateMaxUIButton("wbbutton02", raidtoolbg, buttonsize, buttonsize, "", "World marker: ", "Set world marker |cffFF0000CROSS|r ", RaidToolsTooltipAnchor)
	wbbutton02:SetPoint("RIGHT", wbbutton03, "LEFT", -spacing, 0)
	wbbutton02:SetAttribute("macrotext1", "/wm 4")
		wbbutton02.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Flares\red.tga]])
	
	-- Button 1 - White/Skull
	raidtoolbg.CreateMaxUIButton("wbbutton01", raidtoolbg, buttonsize, buttonsize, "", "World marker: ", "Set world marker |cffFFFFFFSKULL|r ", RaidToolsTooltipAnchor)
	wbbutton01:SetPoint("RIGHT", wbbutton02, "LEFT", -spacing, 0)
	wbbutton01:SetAttribute("macrotext1", "/wm 8")
		wbbutton01.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Flares\white.tga]])
end

function RaidTools:CreateRaidToolsButtonsCommands()
	local buttonsize = C["General"]["ButtonSize"]
	local spacing = 3

	-- Pull Timer
	raidtoolbg.CreateMaxUIButton("pulltimer", raidtoolbg, (buttonsize*3 + spacing*2), buttonsize, "Pull", "Timer: ", "Start a pull timer ", RaidToolsTooltipAnchor)
	pulltimer:SetPoint("TOPRIGHT", clearworldmarkers, "BOTTOMRIGHT", 0, -spacing)
	pulltimer:SetScript("OnClick", RaidTools.SetCountdown)

	-- Button Set Main Assist
	raidtoolbg.CreateMaxUIButton("mainassistbutton", raidtoolbg, (buttonsize*2 + spacing*1), buttonsize, "", "Assisting: ", "Set main assist(s) ", RaidToolsTooltipAnchor)
	mainassistbutton:SetPoint("RIGHT", pulltimer, "LEFT", -spacing, 0)
	mainassistbutton:SetAttribute("macrotext1", "/ma")
		mainassistbutton.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Role\mainassist.tga]])
		mainassistbutton.icon:SetWidth(buttonsize-8)
		mainassistbutton.icon:SetHeight(buttonsize-8)

	-- Button Set Main Tank
	raidtoolbg.CreateMaxUIButton("maintankbutton", raidtoolbg, (buttonsize*2 + spacing*1), buttonsize, "", "Tanking: ", "Set main tank(s) ", RaidToolsTooltipAnchor)
	maintankbutton:SetPoint("RIGHT", mainassistbutton, "LEFT", -spacing, 0)
	maintankbutton:SetAttribute("macrotext1", "/mt")
		maintankbutton.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Role\Maxtank.tga]])
		maintankbutton.icon:SetWidth(buttonsize-4)

	-- Button Readycheck
	raidtoolbg.CreateMaxUIButton("rcbutton", raidtoolbg, (buttonsize*2 + spacing*1), buttonsize, "", "Checking: ", "Start a readycheck ", RaidToolsTooltipAnchor)
	rcbutton:SetPoint("RIGHT", maintankbutton, "LEFT", -spacing, 0)
	rcbutton:SetAttribute("macrotext1", "/readycheck")
		rcbutton.icon:SetWidth(34)
		rcbutton.icon:SetHeight(17)
		rcbutton.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Role\readycheck.tga]])

	-- Button Role check
	raidtoolbg.CreateMaxUIButton("RoleCheckButton", raidtoolbg, (buttonsize*2 + spacing*1), buttonsize, "", "Checking: ", "Start a role check", RaidToolsTooltipAnchor)
	RoleCheckButton:SetPoint("RIGHT", rcbutton, "LEFT", -spacing, 0)
	RoleCheckButton:SetScript("OnClick", InitiateRolePoll)
		RoleCheckButton.icon:SetWidth(17)
		RoleCheckButton.icon:SetHeight(17)
		RoleCheckButton.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Role\MaxLeader.tga]])
end

function RaidTools:Enable()
	self:CreateRaidToolsFrame()
	self:CreateRaidToolsButtonsMarkers()
	self:CreateRaidToolsButtonsFlares()
	self:CreateRaidToolsButtonsCommands()
end

function RaidTools:OnEvent(event)
	if C["Tools"]["RaidTools"] == true then
		self:Enable()
	end
end

RaidTools:RegisterEvent("PLAYER_LOGIN")
RaidTools:SetScript("OnEvent", RaidTools.OnEvent)

DataText.RaidTools = RaidTools

------------------------------------------------------------------------------------------
-- RAIDTOOLS DATATEXT
------------------------------------------------------------------------------------------
local Update = function(self)
	if C["Tools"]["RaidTools"] == true then
		self.Text:SetFormattedText("%s", DataText.NameColor .. "Raid Tools|r")

		if C["DataTexts"]["Icons"] == true then
			self.icon = self:CreateTexture(nil, "OVERLAY")
			self.icon:SetWidth(20)
			self.icon:SetHeight(20)
			self.icon:SetPoint("LEFT", self, "CENTER", 40, 1)
			self.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Markers\skull.blp]])
			self.icon:SetVertexColor(unpack(C["DataTexts"].ValueColor))
		end
		
		self:SetScript("OnEnter", function(self)
			self.Text:SetFormattedText("%s", DataText.HighlightColor .. "Raid Tools|r")
			if C["DataTexts"]["Icons"] == true then
				self.icon:SetVertexColor(unpack(C["DataTexts"].HighlightColor))
			end
			GameTooltip:SetOwner(self:GetTooltipAnchor())
			GameTooltip:AddLine("Raid Tools:")
			GameTooltip:AddLine("Open the Raid Tools ", 1, 1, 1, 1, 1, 1)
			GameTooltip:Show()
		end)
		
		self:SetScript("OnLeave", function(self)
			self.Text:SetFormattedText("%s", DataText.NameColor .. "Raid Tools|r")
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
	raidtoolbg:fadeToggle()
end

local Enable = function(self)
	self:SetScript("OnMouseDown", OnMouseDown)
	self:Update()
end

local Disable = function(self)
	self:SetScript("OnMouseDown", nil)
end
DataText:Register("|cffFFFF99Raid Tools|r", Enable, Disable, Update)