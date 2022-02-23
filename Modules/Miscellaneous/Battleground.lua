------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-07-2021
------------------------------------------------------------------------------------------

-- setting up BATTLEGROUND.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()

--if not T.Retail then return end

local Movers = T["Movers"]
local Texture = T.GetTexture(C.General.HeaderTexture)
local DataText = T["DataTexts"]
local baseDataTextEnable = DataText.Enable
local UIWidgets = T.Miscellaneous.UIWidgets
local baseUIWidgetsEnable = UIWidgets.Enable

------------------------------------------------------------------------------------------
-- Battleground Datatext
------------------------------------------------------------------------------------------
local function MaxUIBattlegroundDataText()
	local BGFrame = DataText.BGFrame
	local Text1 = DataText.BGFrame.Text1
	local Text2 = DataText.BGFrame.Text2
	local Text3 = DataText.BGFrame.Text3
	local BottomLine = BottomLine
	
	local BGFrameHolder = CreateFrame("Frame", "BGFrameHolder", UIParent)
	BGFrameHolder:SetHeight(22) 
	BGFrameHolder:SetWidth(350)
	BGFrameHolder:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 28)
	Movers:RegisterFrame(BGFrameHolder)
	
	BGFrame:ClearAllPoints()
	BGFrame:SetAllPoints(BGFrameHolder)
	BGFrame:CreateShadow()

	BGFrame:SetFrameLevel(2)
	BGFrame:SetFrameStrata("MEDIUM")
	Text1:SetPoint("LEFT", 10, -1)
	Text3:SetPoint("RIGHT", -10, -1)
	
	Text1:SetFontObject(T.GetFont(C["DataTexts"]["Font"]))
	Text2:SetFontObject(T.GetFont(C["DataTexts"]["Font"]))
	Text3:SetFontObject(T.GetFont(C["DataTexts"]["Font"]))
	Text1:SetScale(C["DataTexts"]["FontSize"]/10)
	Text2:SetScale(C["DataTexts"]["FontSize"]/10)
	Text3:SetScale(C["DataTexts"]["FontSize"]/10)

	
	if (C["General"]["Themes"]["Value"] == "MaxUI") then 
		-- texture
		BGFrame.Texture = BGFrame:CreateTexture(nil, "ART")
		BGFrame.Texture:SetInside(BGFrame)
		BGFrame.Texture:SetTexture(Texture)
		BGFrame.Texture:SetVertexColor(unpack(C["General"]["BackdropColor"]))
	end
end

function DataText:Enable()
	-- Tukui
	baseDataTextEnable(self)
	
	-- MaxUI
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
		-- Tukui
		baseTimerUpdateBar(self, Bar)
		
		-- MaxUI
		if not (C.General.Themes.Value == "MaxUI") then return end
		
		self:SetStatusBarTexture(T.GetTexture(C["Misc"]["BarTexture"]))
		self.Backdrop:SetAlpha(0.7)
		
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