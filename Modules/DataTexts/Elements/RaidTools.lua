------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
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
	else

	end	
end

function RaidTools:CreateRaidToolsFrame()
	local buttonsize = C["Tools"]["ToolButtonSize"]
	local spacing = 2
	local TabsBGRight = T.Chat.Panels.RightChatTabs
	
	local raidtoolbg = CreateFrame("Frame", "raidtoolbg", UIParent)
	raidtoolbg:CreateBackdrop("Transparent")
	raidtoolbg.Backdrop:CreateShadow()
	raidtoolbg:SetHeight(buttonsize*3 + spacing*4)
	raidtoolbg:SetWidth(buttonsize*11 + spacing*12)
	raidtoolbg:SetPoint("BOTTOM", TabsBGRight, "TOP", 0, 40)
	raidtoolbg:SetFrameLevel(1)
	raidtoolbg:SetFrameStrata("HIGH")
	raidtoolbg:Hide()
	raidtoolbg:SetAlpha(0)
	raidtoolbg:CreateMaxUIHeader("Raid Tools")
	
	Movers:RegisterFrame(raidtoolbg, "Raid Tools")

	local raidtoolClose = CreateFrame("Button", "raidtoolClose", raidtoolbg.MaxUIHeader)
	raidtoolClose:SetWidth(14)
	raidtoolClose:SetHeight(14)
	raidtoolClose:SetAlpha(0)
	raidtoolClose:SetPoint("RIGHT", raidtoolbg.MaxUIHeader, "RIGHT", -8, 0)
	
	raidtoolCloseicon = raidtoolbg.MaxUIHeader:CreateTexture(nil, "OVERLAY")
	raidtoolCloseicon:SetPoint("RIGHT", raidtoolbg.MaxUIHeader, "RIGHT", -8,0)
	raidtoolCloseicon:SetWidth(11)
	raidtoolCloseicon:SetHeight(11)
	raidtoolCloseicon:SetTexture([[Interface\AddOns\Tukui\Medias\Textures\Others\Close.tga]])

	raidtoolClose:SetScript("OnEnter", function(self)
		raidtoolCloseicon:SetVertexColor(1, 0, 0)
	end)
	
	raidtoolClose:SetScript("OnLeave", function(self)
		raidtoolCloseicon:SetVertexColor(1, 1, 1)
	end)

	-- Animation
	raidtoolbg:fadeIn(C["General"]["FaderTime"])
	raidtoolbg:fadeOut(C["General"]["FaderTime"])
	raidtoolClose:SetScript("OnMouseUp", function(self) raidtoolbg:fadeToggle() end)

	function RaidToolsToggle()
	    if raidtoolbg:IsShown() then
			raidtoolbg.fadeOut:Play()
		else
			raidtoolbg:Show()
			raidtoolbg.fadeIn:Play()
	    end
	end

	-- tooltip Anchor
	RaidToolsTooltipAnchor = raidtoolbg.MaxUIHeader
end

function RaidTools:CreateRaidToolsButtonsMarkers()
	local buttonsize = C["Tools"]["ToolButtonSize"]
	local spacing = 2

	-- Button Clear Raid Marker
	raidtoolbg.CreateToolButton("clearraidmarker", raidtoolbg, (buttonsize*3 + spacing*2), buttonsize, "Clear", "Marker: ", "Clear target marker ", RaidToolsTooltipAnchor)
	clearraidmarker:SetPoint("TOPRIGHT", raidtoolbg, "TOPRIGHT", -spacing, -spacing)
	clearraidmarker:SetAttribute("macrotext1", "/tm 0")

	-- Button 8 - Yellow Star
	raidtoolbg.CreateToolButton("mbbutton08", raidtoolbg, buttonsize, buttonsize, "", "Marker: ", "Set target marker |cffFFFF00STAR|r ", RaidToolsTooltipAnchor)
	mbbutton08:SetPoint("RIGHT", clearraidmarker, "LEFT", -spacing, 0)
	mbbutton08:SetAttribute("macrotext1", "/tm 1")
		mbbutton08.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\markers\star.blp]])

	-- Button 7 - Orange/Circle
	raidtoolbg.CreateToolButton("mbbutton07", raidtoolbg, buttonsize, buttonsize, "", "Marker: ", "Set target marker |cffFF8000CIRCLE|r ", RaidToolsTooltipAnchor)
	mbbutton07:SetPoint("RIGHT", mbbutton08, "LEFT", -spacing, 0)
	mbbutton07:SetAttribute("macrotext1", "/tm 2")
		mbbutton07.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\markers\circle.blp]])

	-- Button 6 - Purple/Diamond
	raidtoolbg.CreateToolButton("mbbutton06", raidtoolbg, buttonsize, buttonsize, "", "Marker: ", "Set target marker |cffFF00FFDIAMOND|r ", RaidToolsTooltipAnchor)
	mbbutton06:SetPoint("RIGHT", mbbutton07, "LEFT", -spacing, 0)
	mbbutton06:SetAttribute("macrotext1", "/tm 3")
		mbbutton06.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\markers\diamond.blp]])

	-- Button 5 - Green/Triangle
	raidtoolbg.CreateToolButton("mbbutton05", raidtoolbg, buttonsize, buttonsize, "", "Marker: ", "Set target marker |cff33FF33TRIANGLE|r ", RaidToolsTooltipAnchor)
	mbbutton05:SetPoint("RIGHT", mbbutton06, "LEFT", -spacing, 0)
	mbbutton05:SetAttribute("macrotext1", "/tm 4")
		mbbutton05.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\markers\triangle.blp]])
		
	-- Button 4 - Grey/Moon
	raidtoolbg.CreateToolButton("mbbutton04", raidtoolbg, buttonsize, buttonsize, "", "Marker: ", "Set target marker |cffCCCCFFMOON|r ", RaidToolsTooltipAnchor)
	mbbutton04:SetPoint("RIGHT", mbbutton05, "LEFT", -spacing, 0)
	mbbutton04:SetAttribute("macrotext1", "/tm 5")
		mbbutton04.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\markers\moon.blp]])
		
	-- Button 3 - Blue/Square
	raidtoolbg.CreateToolButton("mbbutton03", raidtoolbg, buttonsize, buttonsize, "", "Marker: ", "Set target marker |cff0080FFSQUARE|r ", RaidToolsTooltipAnchor)
	mbbutton03:SetPoint("RIGHT", mbbutton04, "LEFT", -spacing, 0)
	mbbutton03:SetAttribute("macrotext1", "/tm 6")
		mbbutton03.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\markers\square.blp]])
		
	-- Button 2 - Red/Cross
	raidtoolbg.CreateToolButton("mbbutton02", raidtoolbg, buttonsize, buttonsize, "", "Marker: ", "Set target marker |cffFF0000CROSS|r ", RaidToolsTooltipAnchor)
	mbbutton02:SetPoint("RIGHT", mbbutton03, "LEFT", -spacing, 0)
	mbbutton02:SetAttribute("macrotext1", "/tm 7")
		mbbutton02.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\markers\cross.blp]])

	-- Button 1 - White/Skull
	raidtoolbg.CreateToolButton("mbbutton01", raidtoolbg, buttonsize, buttonsize, "", "Marker: ", "Set target marker |cffFFFFFFSKULL|r ", RaidToolsTooltipAnchor)
	mbbutton01:SetPoint("RIGHT", mbbutton02, "LEFT", -spacing, 0)
	mbbutton01:SetAttribute("macrotext1", "/tm 8")
		mbbutton01.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\markers\skull.blp]])
end

function RaidTools:CreateRaidToolsButtonsFlares()
	local buttonsize = C["Tools"]["ToolButtonSize"]
	local spacing = 2

	-- Button clearworldmarkers
	raidtoolbg.CreateToolButton("clearworldmarkers", raidtoolbg, (buttonsize*3 + spacing*2), buttonsize, "Clear", "World marker: ", "Clear world markers ", RaidToolsTooltipAnchor)
	clearworldmarkers:SetPoint("TOPRIGHT", clearraidmarker, "BOTTOMRIGHT", 0, -spacing)
	clearworldmarkers:SetAttribute("macrotext1", "/cwm 0")

	-- Button 8 - yellow/star
	raidtoolbg.CreateToolButton("wbbutton08", raidtoolbg, buttonsize, buttonsize, "", "World marker: ", "Set world marker |cffFFFF00STAR|r ", RaidToolsTooltipAnchor)
	wbbutton08:SetPoint("RIGHT", clearworldmarkers, "LEFT", -spacing, 0)
	wbbutton08:SetAttribute("macrotext1", "/wm 5")
		wbbutton08.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\flares\yellow.tga]])

	-- Button 7 - orange/circle
	raidtoolbg.CreateToolButton("wbbutton07", raidtoolbg, buttonsize, buttonsize, "", "World marker: ", "Set world marker |cffFF8000CIRCLE|r ", RaidToolsTooltipAnchor)
	wbbutton07:SetPoint("RIGHT", wbbutton08, "LEFT", -spacing, 0)
	wbbutton07:SetAttribute("macrotext1", "/wm 6")
		wbbutton07.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\flares\orange.tga]])
	
	-- Button 6 - purple/diamond
	raidtoolbg.CreateToolButton("wbbutton06", raidtoolbg, buttonsize, buttonsize, "", "World marker: ", "Set world marker |cffFF00FFDIAMOND|r ", RaidToolsTooltipAnchor)
	wbbutton06:SetPoint("RIGHT", wbbutton07, "LEFT", -spacing, 0)
	wbbutton06:SetAttribute("macrotext1", "/wm 3")
		wbbutton06.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\flares\purple.tga]])

	-- Button 5 - green/triangle
	raidtoolbg.CreateToolButton("wbbutton05", raidtoolbg, buttonsize, buttonsize, "", "World marker: ", "Set world marker |cff33FF33TRIANGLE|r ", RaidToolsTooltipAnchor)
	wbbutton05:SetPoint("RIGHT", wbbutton06, "LEFT", -spacing, 0)
	wbbutton05:SetAttribute("macrotext1", "/wm 2")
		wbbutton05.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\flares\green.tga]])
	
	-- Button 4 - gray/moon
	raidtoolbg.CreateToolButton("wbbutton04", raidtoolbg, buttonsize, buttonsize, "", "World marker: ", "Set world marker |cffCCCCFFMOON|r ", RaidToolsTooltipAnchor)
	wbbutton04:SetPoint("RIGHT", wbbutton05, "LEFT", -spacing, 0)
	wbbutton04:SetAttribute("macrotext1", "/wm 7")
		wbbutton04.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\flares\grey.tga]])

	-- Button 3 - blue/square
	raidtoolbg.CreateToolButton("wbbutton03", raidtoolbg, buttonsize, buttonsize, "", "World marker: ", "Set world marker |cff0080FFSQUARE|r ", RaidToolsTooltipAnchor)
	wbbutton03:SetPoint("RIGHT", wbbutton04, "LEFT", -spacing, 0)
	wbbutton03:SetAttribute("macrotext1", "/wm 1")
		wbbutton03.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\flares\blue.tga]])
	
	-- Button 2 - Red/Cross
	raidtoolbg.CreateToolButton("wbbutton02", raidtoolbg, buttonsize, buttonsize, "", "World marker: ", "Set world marker |cffFF0000CROSS|r ", RaidToolsTooltipAnchor)
	wbbutton02:SetPoint("RIGHT", wbbutton03, "LEFT", -spacing, 0)
	wbbutton02:SetAttribute("macrotext1", "/wm 4")
		wbbutton02.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\flares\red.tga]])
	
	-- Button 1 - White/Skull
	raidtoolbg.CreateToolButton("wbbutton01", raidtoolbg, buttonsize, buttonsize, "", "World marker: ", "Set world marker |cffFFFFFFSKULL|r ", RaidToolsTooltipAnchor)
	wbbutton01:SetPoint("RIGHT", wbbutton02, "LEFT", -spacing, 0)
	wbbutton01:SetAttribute("macrotext1", "/wm 8")
		wbbutton01.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\flares\white.tga]])
end

function RaidTools:CreateRaidToolsButtonsCommands()
	local buttonsize = C["Tools"]["ToolButtonSize"]
	local spacing = 2

	-- Pull Timer
	raidtoolbg.CreateToolButton("pulltimer", raidtoolbg, (buttonsize*3 + spacing*2), buttonsize, "Pull", "Timer: ", "Start a pull timer ", RaidToolsTooltipAnchor)
	pulltimer:SetPoint("TOPRIGHT", clearworldmarkers, "BOTTOMRIGHT", 0, -spacing)
	pulltimer:SetScript("OnClick", RaidTools.SetCountdown)

	-- Button Set Main Assist
	raidtoolbg.CreateToolButton("mainassistbutton", raidtoolbg, (buttonsize*2 + spacing*1), buttonsize, "", "Assisting: ", "Set main assist(s) ", RaidToolsTooltipAnchor)
	mainassistbutton:SetPoint("RIGHT", pulltimer, "LEFT", -spacing, 0)
	mainassistbutton:SetAttribute("macrotext1", "/ma")
		mainassistbutton.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\roleicons\mainassist.tga]])
		mainassistbutton.icon:SetWidth(buttonsize-8)
		mainassistbutton.icon:SetHeight(buttonsize-8)

	-- Button Set Main Tank
	raidtoolbg.CreateToolButton("maintankbutton", raidtoolbg, (buttonsize*2 + spacing*1), buttonsize, "", "Tanking: ", "Set main tank(s) ", RaidToolsTooltipAnchor)
	maintankbutton:SetPoint("RIGHT", mainassistbutton, "LEFT", -spacing, 0)
	maintankbutton:SetAttribute("macrotext1", "/mt")
		maintankbutton.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\roleicons\Maxtank.tga]])
		maintankbutton.icon:SetWidth(buttonsize-4)

	-- Button Readycheck
	raidtoolbg.CreateToolButton("rcbutton", raidtoolbg, (buttonsize*2 + spacing*1), buttonsize, "", "Checking: ", "Start a readycheck ", RaidToolsTooltipAnchor)
	rcbutton:SetPoint("RIGHT", maintankbutton, "LEFT", -spacing, 0)
	rcbutton:SetAttribute("macrotext1", "/readycheck")
		rcbutton.icon:SetWidth(34)
		rcbutton.icon:SetHeight(17)
		rcbutton.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\roleicons\readycheck.tga]])

	-- Button Role check
	raidtoolbg.CreateToolButton("RoleCheckButton", raidtoolbg, (buttonsize*2 + spacing*1), buttonsize, "", "Checking: ", "Start a role check", RaidToolsTooltipAnchor)
	RoleCheckButton:SetPoint("RIGHT", rcbutton, "LEFT", -spacing, 0)
	RoleCheckButton:SetScript("OnClick", InitiateRolePoll)
		RoleCheckButton.icon:SetWidth(17)
		RoleCheckButton.icon:SetHeight(17)
		RoleCheckButton.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\roleicons\MaxLeader.tga]])
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
			self.icon:SetWidth(17)
			self.icon:SetHeight(17)
			self.icon:SetPoint("LEFT", self, "CENTER", 40, 0)
			self.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\markers\skull.blp]])
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
	RaidToolsToggle()
end

local Enable = function(self)
	self:SetScript("OnMouseDown", OnMouseDown)
	self:Update()
end

local Disable = function(self)
	self:SetScript("OnMouseDown", nil)
end
DataText:Register("|cffFFFF99Raid Tools|r", Enable, Disable, Update)