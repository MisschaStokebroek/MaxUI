------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-07-2021
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
local UFanchorwidth = UFanchorwidth
local UFverticaladjust = UFverticaladjust
local Movers = T["Movers"]

------------------------------------------------------------------------------------------
-- PANELS
------------------------------------------------------------------------------------------
function Minimap:MaxUIScreenFilter()
	local R, G, B = unpack(C.Skins.ScreenFilterColor)

	WorldFrame.TOPFilter = WorldFrame:CreateTexture("BACKGROUND")
	WorldFrame.TOPFilter:SetPoint("TOPLEFT", UIParent, "TOPLEFT", -100, 0)
	WorldFrame.TOPFilter:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", 100, 0)
	WorldFrame.TOPFilter:SetHeight(C.Skins.FilterSize)
	WorldFrame.TOPFilter:SetVertexColor(R, G, B, C["Skins"]["ScreenFilterAlpha"])
	WorldFrame.TOPFilter:SetTexture([[Interface\AddOns\MaxUI\Medias\Textures\GradationTop.tga]])
	
	WorldFrame.BOTTOMFilter = WorldFrame:CreateTexture("BACKGROUND")
	WorldFrame.BOTTOMFilter:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", -100, 0)
	WorldFrame.BOTTOMFilter:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 100, 0)
	WorldFrame.BOTTOMFilter:SetHeight(C.Skins.FilterSize)
	WorldFrame.BOTTOMFilter:SetVertexColor(R, G, B, C["Skins"]["ScreenFilterAlpha"])
	WorldFrame.BOTTOMFilter:SetTexture([[Interface\AddOns\MaxUI\Medias\Textures\GradationBottom.tga]])

	WorldFrame.LEFTFilter = WorldFrame:CreateTexture("BACKGROUND")
	WorldFrame.LEFTFilter:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, 100)
	WorldFrame.LEFTFilter:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 0, -100)
	WorldFrame.LEFTFilter:SetWidth(C.Skins.FilterSize)
	WorldFrame.LEFTFilter:SetVertexColor(R, G, B, C["Skins"]["ScreenFilterAlpha"])
	WorldFrame.LEFTFilter:SetTexture([[Interface\AddOns\MaxUI\Medias\Textures\Gradation.tga]])
	
	WorldFrame.RIGHTFilter = WorldFrame:CreateTexture("BACKGROUND")
	WorldFrame.RIGHTFilter:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", 0, 100)
	WorldFrame.RIGHTFilter:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, -100)
	WorldFrame.RIGHTFilter:SetWidth(C.Skins.FilterSize)
	WorldFrame.RIGHTFilter:SetVertexColor(R, G, B, C["Skins"]["ScreenFilterAlpha"])
	WorldFrame.RIGHTFilter:SetTexture([[Interface\AddOns\MaxUI\Medias\Textures\GradationRight.tga]])
end

------------------------------------------------------------------------------------------
-- TOP Panels
------------------------------------------------------------------------------------------
function Minimap:MaxUITopPanels()
	local Texture = T.GetTexture(C.General.LineTexture)
	thickness = C["General"]["thickness"] 
	local LeftHeight = C["Chat"]["LeftHeight"]
	local RightHeight = C["Chat"]["RightHeight"]
	local LeftWidth = C["Chat"]["LeftWidth"]
	local RightWidth = C["Chat"]["RightWidth"]

	local TopLine = CreateFrame("Frame", "TopLine", UIParent)
	TopLine:SetParent(UIParent)
	TopLine:SetHeight(thickness)
	
	if thickness <= 6 then
		TopLine:SetPoint("TOPLEFT", 6, -10)
		TopLine:SetPoint("TOPRIGHT", -6, -10)
	else
		TopLine:SetPoint("TOPLEFT", 6, -6)
		TopLine:SetPoint("TOPRIGHT", -6, -6)
	end
	
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
	else
		TopLine.Backdrop:SetBackdropColor(0.43, 0.43, 0.43)
	end
	
	if C["DataTexts"]["Topline"] == false then
		TopLine:SetAlpha(0)
	end
	
	Minimap.TopLine = TopLine
end

------------------------------------------------------------------------------------------
-- BOTTOM Panels
------------------------------------------------------------------------------------------
function Minimap:MaxUIBottomPanels()
	local TopLine = Minimap.TopLine
	local Texture = T.GetTexture(C.General.LineTexture)
	thickness = C["General"]["thickness"] 
	local LeftHeight = C["Chat"]["LeftHeight"]
	local RightHeight = C["Chat"]["RightHeight"]
	local LeftWidth = C["Chat"]["LeftWidth"]
	local RightWidth = C["Chat"]["RightWidth"]

	local BottomLine = CreateFrame("Frame", "BottomLine", UIParent)
	BottomLine:SetParent(UIParent)
	BottomLine:SetHeight(thickness)
	
	if thickness <= 6 then
		BottomLine:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 6, 10)
		BottomLine:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT",  -6, 10)
	else
		BottomLine:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 6, 6)
		BottomLine:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT",  -6, 6)
	end
	
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
	else
		BottomLine.Backdrop:SetBackdropColor(0.43, 0.43, 0.43)
	end

	if C["DataTexts"]["Bottomline"] == false then
		BottomLine:SetAlpha(0)
	end
	
	Minimap.BottomLine = BottomLine
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
		local width = ((TopLine:GetWidth() / AmountTop) -1)
		local amount = C["DataTexts"]["AmountDataCenterDataTexts"]

		local y
		if C["General"]["thickness"] <=19 then
			y = 12
		else
			y = 6 
		end

		local DataCenter = CreateFrame("Frame", "DataCenter", UIParent)
		DataCenter:SetWidth(width)
		DataCenter:SetHeight((amount * height) + ((amount+1)*spacing))
		DataCenter:SetPoint("TOPLEFT", Minimap.TopLine, "BOTTOMLEFT", 0, -y)
		DataCenter:SetFrameStrata("BACKGROUND")
		DataCenter:SetFrameLevel(2)
		
		DataCenter:CreateBackdrop(nil, Texture)
		DataCenter.Backdrop:SetOutside()
		DataCenter.Backdrop:CreateShadow()
		DataCenter.Backdrop:SetAlpha(C["DataTexts"]["DataCenterAlpha"])
		DataCenter.Backdrop:SetBackdropColor(unpack(C.General.BackdropColor))
		
		if C["DataTexts"]["DataCenterClassLogo"] then
			DataCenter.Logoclass = DataCenter:CreateTexture(nil, "ART")
			DataCenter.Logoclass:SetWidth(width/1.5)
			DataCenter.Logoclass:SetHeight(width/1.5)
			DataCenter.Logoclass:SetPoint("CENTER", DataCenter, "CENTER", 0, 0)
				
			if select(2, UnitClass('player')) == "DRUID" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\DRUID.tga]])
			end
			
			if select(2, UnitClass('player')) == "MONK" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\MONK.tga]])
			end
			
			if select(2, UnitClass('player')) == "ROGUE" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\ROGUE.tga]])
			end
			
			if select(2, UnitClass('player')) == "MAGE" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\MAGE.tga]])
			end
			
			if select(2, UnitClass('player')) == "PRIEST" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\PRIEST.tga]])
			end
			
			if select(2, UnitClass('player')) == "WARLOCK" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\WARLOCK.tga]])
			end
			
			if select(2, UnitClass('player')) == "SHAMAN" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\SHAMAN.tga]])
			end
			
			if select(2, UnitClass('player')) == "HUNTER" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\HUNTER.tga]])
			end
			
			if select(2, UnitClass('player')) == "DEATHKNIGHT" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\DEATHKNIGHT.tga]])
			end
			
			if select(2, UnitClass('player')) == "WARRIOR" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\WARRIOR.tga]])
			end

			if select(2, UnitClass('player')) == "PALADIN" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\PALADIN.tga]])
			end

			if select(2, UnitClass('player')) == "DEMONHUNTER" then
				DataCenter.Logoclass:SetTexture([[Interface\AddOns\MaxUI\Medias\ClassIcons\DEMONHUNTER.tga]])
			end
		end
		Movers:RegisterFrame(DataCenter, "Data Center")
		
		-- Animation
		DataCenter:Hide()
		DataCenter:SetAlpha(0)	
		DataCenter:fadeIn(C["General"]["FaderTime"])
		DataCenter:fadeOut(C["General"]["FaderTime"])

		-- temp fix for datatext not running function from API.
		function DataCenterFadeToggle()
			if DataCenter:IsShown() then
				DataCenter.fadeOut:Play()
			else
				DataCenter:Show()
				DataCenter.fadeIn:Play()
			end
		end
		
		-- Combat State
	--	RegisterStateDriver(DataCenter, "visibility", "[combat] hide; nil")
		
		Minimap.DataCenter = DataCenter
	end	
end

------------------------------------------------------------------------------------------
-- Combat State Bottom and Top Panels
------------------------------------------------------------------------------------------
function Minimap:MaxUITopPanelCombatState()
	local TopLine = Minimap.TopLine

	if C["DataTexts"]["ToplineCombatState"]["Value"] == "Hide" then
		RegisterStateDriver(TopLine, "visibility", "[combat] hide; show")
	end

	if C["DataTexts"]["ToplineCombatState"]["Value"] == "Show" then
		RegisterStateDriver(TopLine, "visibility", "[combat] show; hide")
	end
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
-- execute
------------------------------------------------------------------------------------------
function Minimap:Enable()

	-- MaxUI
	if (C.General.Themes.Value == "MaxUI") then
		self:MaxUITopPanels()
		self:MaxUIBottomPanels()
		self:MaxUIDatatextCenter()
		
		if C["Skins"]["UIParentFilter"] == true then
			self:MaxUIScreenFilter()
		end
		
		if C["DataTexts"]["ToplineCombatState"]["Value"] ~= "Nothing" then 
			self:MaxUITopPanelCombatState()
		end

		if C["DataTexts"]["BottomlineCombatState"]["Value"] ~= "Nothing" then 
			self:MaxUIBottomPanelCombatState()
		end
	end
	
	baseMinimapEnable(self)
end