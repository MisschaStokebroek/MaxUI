------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- setting up BATTLEGROUND.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()

local DataText = T["DataTexts"]
local Movers = T["Movers"]
local Minimap = T.Maps.Minimap
local UIWidgets = T.Miscellaneous.UIWidgets

local baseDataTextEnable = DataText.Enable
local baseUIWidgetsEnable = UIWidgets.Enable

local Texture = T.GetTexture(C.General.HeaderTexture)

local MapHeight = C["Location"]["MapHeight"]
local MapWidth = C["Location"]["MapWidth"]

------------------------------------------------------------------------------------------
-- Battleground Datatext
------------------------------------------------------------------------------------------
local function MaxUIBattlegroundDataText()
	local BGFrame = DataText.BGFrame
	local Text1 = DataText.BGFrame.Text1
	local Text2 = DataText.BGFrame.Text2
	local Text3 = DataText.BGFrame.Text3
	local BottomLine = BottomLine
	
	local BGFrameHolder = CreateFrame("Frame", "BGFrameHolder", BGFrame)
	BGFrameHolder:SetHeight(90) 
	BGFrameHolder:SetWidth(Minimap:GetWidth())
	BGFrameHolder:SetPoint("TOP", Minimap, "BOTTOM", 0, -31)
	BGFrameHolder:CreateMaxUIHeader("Battleground statistics")
	Movers:RegisterFrame(BGFrameHolder, "Battleground statistics")
	
	BGFrame:ClearAllPoints()
	BGFrame:SetAllPoints(BGFrameHolder)
	BGFrame:SetFrameLevel(2)
	BGFrame:SetFrameStrata("MEDIUM")
	BGFrame.Backdrop:SetAlpha(C["General"]["GeneralPanelAlpha"])
	BGFrame:CreateShadow()

	Text1:ClearAllPoints()
	Text1:SetPoint("TOP", BGFrame, "TOP", 0, -6)
	Text1:SetHeight(20)
	Text1:SetJustifyH("CENTER")
	Text1:SetFontObject(T.GetFont(C["DataTexts"]["Font"]))
	Text1:SetScale(C["DataTexts"]["FontSize"]/10)

	Text2:ClearAllPoints()
	Text2:SetPoint("TOP", Text1, "BOTTOM", 0, -3)
	Text2:SetHeight(20)
	Text2:SetJustifyH("CENTER")
	Text2:SetFontObject(T.GetFont(C["DataTexts"]["Font"]))
	Text2:SetScale(C["DataTexts"]["FontSize"]/10)

	Text3:ClearAllPoints()
	Text3:SetPoint("TOP", Text2, "BOTTOM", 0, -3)
	Text3:SetHeight(20)
	Text3:SetJustifyH("CENTER")
	Text3:SetFontObject(T.GetFont(C["DataTexts"]["Font"]))
	Text3:SetScale(C["DataTexts"]["FontSize"]/10)

	if C["Skins"]["BattlegroundTrackerFilter"] == true then 
		BGFrame:CreateMaxUIFilter()
	end
end

function DataText:Enable()
	baseDataTextEnable(self)
	
	if not (C.DataTexts.Battleground) then return end
	if not (C.General.Themes.Value == "MaxUI") then return end
	MaxUIBattlegroundDataText()
end

------------------------------------------------------------------------------------------
-- Battleground Timer.
------------------------------------------------------------------------------------------
if T.Retail then
	local Timer = T.Miscellaneous.TimerTracker
	local baseTimerUpdateBar = Timer.UpdateBar

	function Timer:UpdateBar(Bar)
		baseTimerUpdateBar(self, Bar)
		
		if not (C.General.Themes.Value == "MaxUI") then return end
		
		self:SetStatusBarTexture(T.GetTexture(C["Misc"]["BarTexture"]))
		self.Backdrop:SetAlpha(0.7)
		if C["Skins"]["DataBarFilter"] == true then 
			self:CreateMaxUIFilter()
		end
		
		for i = 1, self:GetNumRegions() do
			local Region = select(i, self:GetRegions())
			if Region:GetObjectType() == "FontString" then
				Region:SetFont(C.Medias.Font, 14, "OUTLINE")
				Region:SetShadowOffset(0, 0)
			end
		end
	end
end

--------------------------------------------------------------------------------------
-- Moves The PvP Resource Bar Below Locator
--------------------------------------------------------------------------------------
function UIWidgets:Enable()
	baseUIWidgetsEnable(self)
	
	if not (C.General.Themes.Value == "MaxUI") then return end

	self.Holder:ClearAllPoints()
	self.Holder:SetPoint("TOP", 420, -66)
	
	local ResourceBar = UIWidgetTopCenterContainerFrame
	ResourceBar:ClearAllPoints()
	ResourceBar:SetWidth(220)
	ResourceBar:SetHeight(20)
	Movers:RegisterFrame(ResourceBar, "UI Widgets #2")
	ResourceBar:SetPoint("TOP", 420, -88)
end