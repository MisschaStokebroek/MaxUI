------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 27-12-2022
------------------------------------------------------------------------------------------

-- setting up MaxUISkins

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local DBMSkin = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- SKIN simc
------------------------------------------------------------------------------------------
local function SkinBars(self)
	for bar in self:GetBarIterator() do
		if not bar.isMaxUISkinned then
			
			hooksecurefunc(bar, "Update", function()
				local sparkEnabled = DBT.Options.Spark
				local spark = _G[bar.frame:GetName().."BarSpark"]
				local a, b, c, d = spark:GetPoint()
				
				spark:SetSize(12, ((bar.enlarged and DBT.Options.HugeHeight or DBT.Options.Height) * 3) - 2)
				spark:SetPoint(a, b, c, d, 0)
			end)
			
			hooksecurefunc(bar, "ApplyStyle", function()
				local frame = bar.frame
				local tbar = _G[frame:GetName()..'Bar']
				local icon1 = _G[frame:GetName()..'BarIcon1']
				local icon2 = _G[frame:GetName()..'BarIcon2']
				local name = _G[frame:GetName()..'BarName']
				local timer = _G[frame:GetName()..'BarTimer']

				local IconSpacing = C["AddOns"]["DBMIconBarSpacing"]

				local iconSize = bar.enlarged and DBT.Options.HugeHeight or DBT.Options.Height
				iconSize = iconSize + 2

				if DBT.Options.IconLeft then 
					icon1:ClearAllPoints()
					icon1:SetAlpha(1)
					icon1:SkinMaxUIIcon(nil, true)
				end	

				if DBT.Options.IconRight then
					icon2:ClearAllPoints()
					icon2:SkinMaxUIIcon(nil, true)
				end

				tbar:SkinMaxUIStatusBar()

				frame:SkinMaxUIFrame()
				frame.Backdrop:SetAlpha(C["AddOns"]["DBMBarBackdropAlpha"])

				name:ClearAllPoints()
				name:SetJustifyH('LEFT')

				timer:ClearAllPoints()
				timer:SetJustifyH('RIGHT')

				if C["AddOns"]["DBMBarTextPosition"]["Value"] == "Above" then
					name:SetPoint('BOTTOMLEFT', frame, 'TOPLEFT', 0, 3)
					timer:SetPoint('BOTTOMRIGHT', frame, 'TOPRIGHT', 0, 3)

					if DBT.Options.IconLeft then 
						icon1:SetPoint('TOPRIGHT', name, 'TOPLEFT', -IconSpacing, 0)
						icon1:SetPoint('BOTTOMRIGHT', frame, 'BOTTOMLEFT', -IconSpacing, -1)
						icon1:SetWidth(iconSize + name:GetHeight() + 3)
					end	
					
					if DBT.Options.IconRight then
						icon2:SetPoint('TOPLEFT', timer, 'TOPRIGHT', IconSpacing, 0)
						icon2:SetPoint('BOTTOMLEFT', frame, 'BOTTOMRIGHT', IconSpacing, -1)
						icon2:SetWidth(iconSize + timer:GetHeight() + 3)
					end

				elseif C["AddOns"]["DBMBarTextPosition"]["Value"] == "Below" then
					name:SetPoint('TOPLEFT', frame, 'BOTTOMLEFT', 0, -3)
					timer:SetPoint('TOPRIGHT', frame, 'BOTTOMRIGHT', 0, -3)
					
					if DBT.Options.IconLeft then 
						icon1:SetPoint('TOPRIGHT', frame, 'TOPLEFT', -IconSpacing, 0)
						icon1:SetPoint('BOTTOMRIGHT', name, 'BOTTOMLEFT', -IconSpacing, -1)
						icon1:SetWidth(iconSize + name:GetHeight() + 3)
					end	
					
					if DBT.Options.IconRight then
						icon2:SetPoint('TOPLEFT', frame, 'TOPRIGHT', IconSpacing, 0)
						icon2:SetPoint('BOTTOMLEFT', timer, 'BOTTOMRIGHT', IconSpacing, -1)
						icon2:SetWidth(iconSize + timer:GetHeight() + 3)
					end
					
				else -- Inside
					if DBT.Options.IconLeft then 
						icon1:SetPoint('BOTTOMRIGHT', frame, 'BOTTOMLEFT', -IconSpacing, -1)
						icon1:SetSize(iconSize, iconSize)
					end	

					if DBT.Options.IconRight then
						icon2:SetPoint('BOTTOMLEFT', frame, 'BOTTOMRIGHT', IconSpacing, -1)
						icon2:SetSize(iconSize, iconSize)
					end

					name:SetPoint('LEFT', frame, 'LEFT', 4, 0)
					timer:SetPoint('RIGHT', frame, 'RIGHT', -4, 0)
				end

				bar.isMaxUISkinned = true
			end)
			bar:ApplyStyle()
		end
	end
end

local function SkinRange(self)
	if DBM.Options.DontShowRangeFrame and not forceshow then return end
	if DBMRangeCheck then
		DBMRangeCheck:SkinMaxUIFrame()
		DBMRangeCheckRadar:SkinMaxUIFrame()
		DBMRangeCheckRadar.text:ClearAllPoints()
		DBMRangeCheckRadar.text:SetJustifyH('CENTER')

		if C["AddOns"]["DBMSkinEdge"] == true then
			DBMRangeCheck:CreateMaxUITopEdge()
			DBMRangeCheckRadar:CreateMaxUITopEdge()

			DBMRangeCheckRadar.text:SetPoint("BOTTOM", DBMRangeCheckRadar.MaxUITopEdge, "TOP", 0, 3)
		else	
			DBMRangeCheckRadar.text:SetPoint("BOTTOM", DBMRangeCheckRadar, "TOP", 0, 3)
		end	
	end	
end

local function SkinInfo(self)
	if DBM.Options.DontShowInfoFrame and (event or 0) ~= "test" then return end
	if DBMInfoFrame then
		DBMInfoFrame:SkinMaxUIFrame()
		DBMInfoFrame.header:ClearAllPoints()
		DBMInfoFrame.header:SetJustifyH('CENTER')

		if C["AddOns"]["DBMSkinEdge"] == true then
			DBMInfoFrame:CreateMaxUITopEdge()
			DBMInfoFrame.header:SetPoint("BOTTOM", DBMInfoFrame.MaxUITopEdge, "TOP", 0, 3)
		else	
			DBMInfoFrame.header:SetPoint("BOTTOM", DBMInfoFrame, "TOP", 0, 3)
		end	
	end
end

------------------------------------------------------------------------------------------
-- SKIN Execute
------------------------------------------------------------------------------------------
function DBMSkin:OnEvent(event)
	if IsAddOnLoaded('AddonSkins') then return end
	if not T.Retail then return end
	if not C.Skins.MaxUISkinsAddons then return end

	if IsAddOnLoaded('DBM-Core') and C["AddOns"]["DBMSkin"] then 
		hooksecurefunc(DBT, 'CreateBar', SkinBars)
		hooksecurefunc(DBM.RangeCheck, 'Show', SkinRange)
		hooksecurefunc(DBM.InfoFrame, 'Show', SkinInfo)
	end
	self:UnregisterAllEvents()
end

DBMSkin:RegisterEvent("PLAYER_LOGIN")
DBMSkin:SetScript("OnEvent", DBMSkin.OnEvent)