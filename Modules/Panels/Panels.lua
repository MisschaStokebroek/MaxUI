------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 05-10-2023
------------------------------------------------------------------------------------------

-- setting up CUSTOM PANELS AND FRAMES.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Minimap = T.Maps.Minimap
local baseMinimapEnable = Minimap.Enable
local ClassColor = {unpack(T.Colors.class[select(2, UnitClass("player"))])}
local thickness = thickness
local Movers = T["Movers"]

------------------------------------------------------------------------------------------
-- PANELS
------------------------------------------------------------------------------------------
function Minimap:MaxUIScreenFilter()
	local R, G, B = unpack(C.Skins.ScreenFilterColor)

	WorldFrame.TOPFilter = WorldFrame:CreateTexture(nil, "BACKGROUND")
	WorldFrame.TOPFilter:SetPoint("TOPLEFT", UIParent, "TOPLEFT", -10, 0)
	WorldFrame.TOPFilter:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", 10, 0)
	WorldFrame.TOPFilter:SetHeight(C.Skins.FilterSize)
	WorldFrame.TOPFilter:SetVertexColor(R, G, B, C["Skins"]["ScreenFilterAlpha"])
	WorldFrame.TOPFilter:SetTexture([[Interface\AddOns\MaxUI\Medias\Textures\GradationTopV.tga]])

	WorldFrame.BOTTOMFilter = WorldFrame:CreateTexture(nil, "BACKGROUND")
	WorldFrame.BOTTOMFilter:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", -10, 0)
	WorldFrame.BOTTOMFilter:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 10, 0)
	WorldFrame.BOTTOMFilter:SetHeight(C.Skins.FilterSize)
	WorldFrame.BOTTOMFilter:SetVertexColor(R, G, B, C["Skins"]["ScreenFilterAlpha"])
	WorldFrame.BOTTOMFilter:SetTexture([[Interface\AddOns\MaxUI\Medias\Textures\GradationBottomV.tga]])

	WorldFrame.LEFTFilter = WorldFrame:CreateTexture(nil, "BACKGROUND")
	WorldFrame.LEFTFilter:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, 10)
	WorldFrame.LEFTFilter:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 0, -10)
	WorldFrame.LEFTFilter:SetWidth(C.Skins.FilterSize)
	WorldFrame.LEFTFilter:SetVertexColor(R, G, B, C["Skins"]["ScreenFilterAlpha"])
	WorldFrame.LEFTFilter:SetTexture([[Interface\AddOns\MaxUI\Medias\Textures\GradationLeftV.tga]])

	WorldFrame.RIGHTFilter = WorldFrame:CreateTexture(nil, "BACKGROUND")
	WorldFrame.RIGHTFilter:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", 0, 10)
	WorldFrame.RIGHTFilter:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, -10)
	WorldFrame.RIGHTFilter:SetWidth(C.Skins.FilterSize)
	WorldFrame.RIGHTFilter:SetVertexColor(R, G, B, C["Skins"]["ScreenFilterAlpha"])
	WorldFrame.RIGHTFilter:SetTexture([[Interface\AddOns\MaxUI\Medias\Textures\GradationRightV.tga]])
end

------------------------------------------------------------------------------------------
-- TOP Panels
------------------------------------------------------------------------------------------
function Minimap:MaxUITopPanels()
	local Texture = T.GetTexture(C.General.LineTexture)
	thickness = C["General"]["thickness"] 

	local TopLine = CreateFrame("Frame", "TopLine", UIParent)
	TopLine:SetParent(UIParent)
	TopLine:SetHeight(thickness)
	TopLine:SetPoint("TOPLEFT", C["DataTexts"]["ScreenSpacing"], -C["DataTexts"]["ScreenSpacing"])
	TopLine:SetPoint("TOPRIGHT", -C["DataTexts"]["ScreenSpacing"], -C["DataTexts"]["ScreenSpacing"])

	TopLine:SetFrameStrata("BACKGROUND")
	TopLine:SetFrameLevel(2)

	TopLine:CreateBackdrop(nil, Texture)
	TopLine.Backdrop:SetOutside()
	TopLine.Backdrop:CreateShadow()
	TopLine.Backdrop:SetAlpha(C["General"]["GeneralPanelAlpha"])

	if C["General"]["ClassColorLines"]["Value"] == "Dark" then 
		TopLine.Backdrop:SetBackdropColor(0.11, 0.11, 0.11)
	elseif C["General"]["ClassColorLines"]["Value"] == "ClassColor" then 
		TopLine.Backdrop:SetBackdropColor(unpack(ClassColor))
	elseif C["General"]["ClassColorLines"]["Value"] == "BackdropColor" then 
		TopLine.Backdrop:SetBackdropColor(unpack(C.General.BackdropColor))
	elseif C["General"]["ClassColorLines"]["Value"] == "Custom" then 
		TopLine.Backdrop:SetBackdropColor(unpack(C.General.CustomColor))
	else
		TopLine.Backdrop:SetBackdropColor(0.43, 0.43, 0.43)
	end

	if C["DataTexts"]["Topline"] == false then
		TopLine:SetAlpha(0)
	end

	Minimap.TopLine = TopLine
end

function Minimap:MaxUITopPanelCombatState()
	local TopLine = Minimap.TopLine

	if C["DataTexts"]["ToplineCombatState"]["Value"] == "Hide" then
		RegisterStateDriver(TopLine, "visibility", "[combat] hide; show")
	end

	if C["DataTexts"]["ToplineCombatState"]["Value"] == "Show" then
		RegisterStateDriver(TopLine, "visibility", "[combat] show; hide")
	end
end

------------------------------------------------------------------------------------------
-- TOP Panels
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- BOTTOM Panels
------------------------------------------------------------------------------------------
function Minimap:MaxUIBottomPanels()
	local Texture = T.GetTexture(C.General.LineTexture)
	thickness = C["General"]["thickness"] 

	local BottomLine = CreateFrame("Frame", "BottomLine", UIParent)
	BottomLine:SetParent(UIParent)
	BottomLine:SetHeight(thickness)

	BottomLine:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", C["DataTexts"]["ScreenSpacing"], C["DataTexts"]["ScreenSpacing"])
	BottomLine:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT",  -C["DataTexts"]["ScreenSpacing"], C["DataTexts"]["ScreenSpacing"])

	BottomLine:SetFrameStrata("BACKGROUND")
	BottomLine:SetFrameLevel(2)

	BottomLine:CreateBackdrop(nil, Texture)
	BottomLine.Backdrop:SetOutside()
	BottomLine.Backdrop:CreateShadow()
	BottomLine.Backdrop:SetAlpha(C["General"]["GeneralPanelAlpha"])

	if C["General"]["ClassColorLines"]["Value"] == "Dark" then 
		BottomLine.Backdrop:SetBackdropColor(0.11, 0.11, 0.11)
	elseif C["General"]["ClassColorLines"]["Value"] == "ClassColor" then 
		BottomLine.Backdrop:SetBackdropColor(unpack(ClassColor))
	elseif C["General"]["ClassColorLines"]["Value"] == "BackdropColor" then 
		BottomLine.Backdrop:SetBackdropColor(unpack(C.General.BackdropColor))
	elseif C["General"]["ClassColorLines"]["Value"] == "Custom" then 
		BottomLine.Backdrop:SetBackdropColor(unpack(C.General.CustomColor))
	else
		BottomLine.Backdrop:SetBackdropColor(0.43, 0.43, 0.43)
	end

	if C["DataTexts"]["Bottomline"] == false then
		BottomLine:SetAlpha(0)
	end

	Minimap.BottomLine = BottomLine
end

function Minimap:MaxUIBottomPanelCombatState()
	local BottomLine = Minimap.BottomLine

	if C["DataTexts"]["BottomlineCombatState"]["Value"] == "Hide" then
		RegisterStateDriver(BottomLine, "visibility", "[combat] hide; show")
	end

	if C["DataTexts"]["BottomlineCombatState"]["Value"] == "Show" then
		RegisterStateDriver(BottomLine, "visibility", "[combat] show; hide")
	end
end

------------------------------------------------------------------------------------------
-- DATATEXT CENTER Panels
------------------------------------------------------------------------------------------
function Minimap:MaxUIDatatextCenter()
	if C["DataTexts"]["DataCenter"] == true then
		local TopLine = self.TopLine
		local Texture = T.GetTexture(C.General.LineTexture)
		local AmountTop = C["DataTexts"]["AmountTopDataTexts"]
		local spacing = 1
		local height = 20
		local width = ((TopLine:GetWidth() / AmountTop))-1
		local amount = C["DataTexts"]["AmountDataCenterDataTexts"]

		local y
		if C["General"]["thickness"] <= 19 then
			y = 12
		else
			y = 6 
		end

		local DataCenter = CreateFrame("Frame", "DataCenter", UIParent)
		DataCenter:SetWidth(width)
		DataCenter:SetHeight((amount * height) + ((amount+1)*spacing))
		DataCenter:SetPoint("TOPLEFT", Minimap.TopLine, "BOTTOMLEFT", 0, -y)
		DataCenter:SetFrameStrata("HIGH")
		DataCenter:SetFrameLevel(2)
		
		DataCenter:SkinMaxUIFrame()
		
		if C["DataTexts"]["DataCenterClassLogo"] then
			DataCenter.Logoclass = DataCenter:CreateTexture(nil, "ARTWORK")
			DataCenter.Logoclass:SetWidth(width/1.5)
			DataCenter.Logoclass:SetHeight(width/1.5)
			DataCenter.Logoclass:SetPoint("CENTER", DataCenter, "CENTER", 0, 0)

			if select(2, UnitClass('player')) == "DRUID" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\DRUID.tga]])
			end

			if select(2, UnitClass('player')) == "EVOKER" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\EVOKER.tga]])
			end

			if select(2, UnitClass('player')) == "MONK" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\MONK.tga]])
			end

			if select(2, UnitClass('player')) == "ROGUE" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\ROGUE.tga]])
			end

			if select(2, UnitClass('player')) == "MAGE" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\MAGE.tga]])
			end

			if select(2, UnitClass('player')) == "PRIEST" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\PRIEST.tga]])
			end

			if select(2, UnitClass('player')) == "WARLOCK" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\WARLOCK.tga]])
			end

			if select(2, UnitClass('player')) == "SHAMAN" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\SHAMAN.tga]])
			end

			if select(2, UnitClass('player')) == "HUNTER" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\HUNTER.tga]])
			end

			if select(2, UnitClass('player')) == "DEATHKNIGHT" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\DEATHKNIGHT.tga]])
			end

			if select(2, UnitClass('player')) == "WARRIOR" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\WARRIOR.tga]])
			end

			if select(2, UnitClass('player')) == "PALADIN" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\PALADIN.tga]])
			end

			if select(2, UnitClass('player')) == "DEMONHUNTER" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\Class\DEMONHUNTER.tga]])
			end
		end

		--Movers:RegisterFrame(DataCenter, "Data Center")

		-- Animation
		DataCenter:Hide()
		DataCenter:SetAlpha(0)	
		DataCenter:fadeIn(C["General"]["FaderTime"])
		DataCenter:fadeOut(C["General"]["FaderTime"])

		function DataCenterFadeToggle()
			if DataCenter:IsShown() then
				DataCenter.fadeOut:Play()
			else
				DataCenter:Show()
				DataCenter.fadeIn:Play()
			end
		end

		Minimap.DataCenter = DataCenter
	end	
end

function Minimap:MaxUIDataCenterCombatState()
	local DataCenter = Minimap.DataCenter

	if C["DataTexts"]["DataCenterCombatState"]["Value"] == "Hide" then
		RegisterStateDriver(DataCenter, "visibility", "[combat] hide; nil")
	end
end

------------------------------------------------------------------------------------------
-- ADDITIONAL ANCHORS
------------------------------------------------------------------------------------------
function Minimap:MaxUIQuestLogHolder()
	local MaxUIQuestLogHolder = CreateFrame("Frame", "MaxUIQuestLogHolder", UIParent)
	MaxUIQuestLogHolder:SetFrameLevel(1)
	MaxUIQuestLogHolder:SetFrameStrata("BACKGROUND")

	if T.Retail and C["Quests"]["TrackerPosition"]["Value"] == "Movable" then
		MaxUIQuestLogHolder:CreateMaxUIHeader("Objectives", false, C["Quests"]["TrackerMovableHeader"])
	end

	-- testing purposes:
	--MaxUIQuestLogHolder:CreateBackdrop()
	--MaxUIQuestLogHolder.Backdrop:SetBackdropColor(1, 1, 0)

	Minimap.MaxUIQuestLogHolder = MaxUIQuestLogHolder
end	

function Minimap:MaxUIQuestLogHolderCombatState()
	local MaxUIQuestLogHolder = Minimap.MaxUIQuestLogHolder
	RegisterStateDriver(MaxUIQuestLogHolder, "visibility", "[combat] hide; nil")
end

------------------------------------------------------------------------------------------
-- execute
------------------------------------------------------------------------------------------
function Minimap:Enable()
	if (C.General.Themes.Value == "MaxUI") then
		self:MaxUITopPanels()
		self:MaxUIBottomPanels()
		self:MaxUIDatatextCenter()
		self:MaxUIQuestLogHolder()
		
		if C["Skins"]["UIParentFilter"] == true then
			self:MaxUIScreenFilter()
		end
		
		if C["DataTexts"]["ToplineCombatState"]["Value"] ~= "Nothing" then 
			self:MaxUITopPanelCombatState()
		end

		if C["DataTexts"]["BottomlineCombatState"]["Value"] ~= "Nothing" then 
			self:MaxUIBottomPanelCombatState()
		end
		
		if C["DataTexts"]["DataCenterCombatState"]["Value"] ~= "Nothing" then 
			self:MaxUIDataCenterCombatState()
		end
		
		if C["Quests"]["QuestTrackerCombatState"]["Value"] ~= "Nothing" then 
			--self:MaxUIQuestLogHolderCombatState()
		end
	end
	baseMinimapEnable(self)
end