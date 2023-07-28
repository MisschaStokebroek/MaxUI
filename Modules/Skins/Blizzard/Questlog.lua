------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkinsBlizzard

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local QuestlogWorldmapSkin = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- SKIN questlog and worldframe
------------------------------------------------------------------------------------------
local function SkinBlizzardToMaxUIStyleQuestLog()
	local WorldMapFrame = _G.WorldMapFrame
	local QuestScrollFrame = _G.QuestScrollFrame
	local QuestMapFrame = _G.QuestMapFrame

	-- basic
	WorldMapFrame:SkinMaxUIBaseFrame()
	WorldMapFrame:StripTextures()
	
	WorldMapFrame.BorderFrame.PortraitContainer:Kill()
	WorldMapFramePortrait:Hide()
	WorldMapFrameBg:Hide()

	WorldMapFrameCloseButton:SkinMaxUICloseButton(true)
	WorldMapFrameCloseButton:ClearAllPoints()
	WorldMapFrameCloseButton:SetPoint("RIGHT", WorldMapFrame.MaxUIHeader, "RIGHT", -4, 0)
	
	WorldMapFrame.BorderFrame.CloseButton:SkinMaxUICloseButton(true)
	WorldMapFrame.BorderFrame.CloseButton:ClearAllPoints()
	WorldMapFrame.BorderFrame.CloseButton:SetPoint("RIGHT", WorldMapFrame.MaxUIHeader, "RIGHT", -4, 0)

	WorldMapFrame.BorderFrame:SetFrameStrata(WorldMapFrame:GetFrameStrata())
	WorldMapFrame.BorderFrame:StripTextures()
	WorldMapFrame.BorderFrame.NineSlice:Hide()
	WorldMapFrame.BorderFrame.Tutorial:Kill()
	
	WorldMapFrame.BorderFrame.MaximizeMinimizeFrame:SkinMaxUIButton(true)


	WorldMapFrame.ScrollContainer:SkinMaxUIFrame(true)

			
	-- NavBar
	WorldMapFrame.NavBar:StripTextures()
	WorldMapFrame.NavBar.overlay:StripTextures()
	WorldMapFrame.NavBar:SetPoint('TOPLEFT', 1, -40)
	--WorldMapFrame.NavBar.homeButton:SkinMaxUIButton(true)


	-- Questlog
	QuestMapFrame.CampaignOverview.Header:SkinMaxUIFrame(true)
	QuestMapFrame.CampaignOverview.ScrollFrame:StripTextures()
	QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar:SkinMaxUIScrollBarNew(true)

	QuestMapFrame.VerticalSeparator:Hide()
	QuestMapFrame.Background:Hide()
	QuestMapFrame.DetailsFrame.RewardsFrame:StripTextures()
	
	if QuestMapFrame.Background then
		QuestMapFrame.Background:SetAlpha(0)
	end

	if QuestMapFrame.DetailsFrame.SealMaterialBG then
		QuestMapFrame.DetailsFrame.SealMaterialBG:SetAlpha(0)
	end


	QuestScrollFrame:SkinMaxUIFrame(true)
	QuestScrollFrame.ScrollBar:SkinMaxUIScrollBarNew(true)
	
	QuestScrollFrame.Edge:SetAlpha(0)

	QuestScrollFrame.DetailFrame:StripTextures()
	QuestScrollFrame.DetailFrame.BottomDetail:Hide()
	QuestScrollFrame.Contents.Separator.Divider:Hide()

	QuestScrollFrame.Contents.StoryHeader:SkinMaxUIFrame()

	QuestMapDetailsScrollFrame.ScrollBar:SkinMaxUIScrollBarNew(true)

	QuestMapFrame.DetailsFrame.BackButton:SkinMaxUIButton(true)
	QuestMapFrame.DetailsFrame.AbandonButton:SkinMaxUIButton(true)
	QuestMapFrame.DetailsFrame.ShareButton:SkinMaxUIButton(true)
	QuestMapFrame.DetailsFrame.TrackButton:SkinMaxUIButton(true)
	QuestMapFrame.DetailsFrame.CompleteQuestFrame.CompleteButton:SkinMaxUIButton(true)
	
	-- Map




	-- backdrop
	--WorldMapFrame:CreateBackdrop("Transparent")
	--WorldMapFrame.Backdrop:SetAlpha(0.7)
	--WorldMapFrame.Backdrop:SetOutside(WorldMapFrame)
	--WorldMapFrame.Backdrop:SetFrameLevel(0)
	--WorldMapFrame.Backdrop:CreateShadow()

end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function QuestlogWorldmapSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsBlizzard then return end

	if C["Skins"]["WorldMapQuestlog"] then
		if not IsAddOnLoaded("BlizzardQuestFrames") then
			LoadAddOn("BlizzardQuestFrames")
		end		
	SkinBlizzardToMaxUIStyleQuestLog()
	end
	self:UnregisterAllEvents()
end

QuestlogWorldmapSkin:RegisterEvent("PLAYER_LOGIN")
QuestlogWorldmapSkin:SetScript("OnEvent", QuestlogWorldmapSkin.OnEvent)