------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- setting up SHAMAN POWERS AND TOTEM.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Movers = T["Movers"]
local basePlayer = UnitFrames.Player

if (Class ~= "SHAMAN") then return end

------------------------------------------------------------------------------------------
-- CLASS RESOURCES
------------------------------------------------------------------------------------------
function UnitFrames:Player()
	local ActionBars = T.ActionBars
	
	basePlayer(self)

	if not (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then return end
	
	-- elements
	local Health = self.Health
	local ActionBar1 = TukuiActionBar1
	local TotemBars = self.Totems

	-- settings
	local TotemSpacing = C["ClassOptions"]["ShamanTotemSpace"]
	local TotemSize = C["ClassOptions"]["ShamanTotemSize"]
	local ClassPowerHeight = C["ClassOptions"]["ClassPowerHeight"]
	local ClassPowerWidth = C["ClassOptions"]["ClassPowerWidth"]
	local ClassPowerSpace = C["ClassOptions"]["ClassPowerSpace"]

	-- textures
	local TotemIcon = [[Interface\AddOns\MaxUI\Medias\Icons\Custom\totemwhite.tga]]
	local ClassPowerTexture = T.GetTexture(C["ClassOptions"]["ClassPowerTexture"])

	if C["UnitFrames"]["TotemBar"]  == true then
		
		-- totem iconbars
		if C.UnitFrames.TotemBarStyle.Value == "On Screen" then
			TotemBars:ClearAllPoints()
			TotemBars:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
			TotemBars:SetFrameStrata("MEDIUM")
			TotemBars:SetFrameLevel(5)

			if C["ClassOptions"]["ClassPowerMover"] then
				Movers:RegisterFrame(TotemBars, "Totem Bar")
			end
			
			if C["ClassOptions"]["ClassPowerBackdrop"] then
				TotemBars:CreateBackdrop("Transparent")
				TotemBars.Backdrop:SetOutside()
				TotemBars.Backdrop:CreateShadow()
				
				--if C["Skins"]["UnitFramesFilter"] == true then 
				--	TotemBars.Backdrop:CreateMaxUIFilter()
				--end
			end

			if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
				TotemBars:SetSize((TotemSize+6), ((TotemSize*4)+(TotemSpacing*3)+6))
			else
				TotemBars:SetSize((TotemSize*4)+(TotemSpacing*3)+6, (TotemSize)+6)
			end
		

			for i = 1, MAX_TOTEMS do
				TotemBars[i]:ClearAllPoints()
				TotemBars[i]:SetHeight(TotemSize)
				TotemBars[i]:SetWidth(TotemSize)

				if i == 1 then
					TotemBars[i]:SetPoint("TOPLEFT", TotemBars, "TOPLEFT", 3, -3)
				else
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
						TotemBars[i]:SetPoint("TOP", TotemBars[i-1], "BOTTOM", 0, -TotemSpacing)
					else
						TotemBars[i]:SetPoint("LEFT", TotemBars[i-1], "RIGHT", TotemSpacing, 0)
					end
				end
				
				if C["ClassOptions"]["ClassPowerBackdrop"] then
					TotemBars[i].Backdrop.Shadow:Hide()
				else
					TotemBars[i].Backdrop:SetOutside(TotemBars[i])
				end
				
				TotemBars[i].Backdrop.BackgroundTexture:SetTexture(nil)
				TotemBars[i].Backdrop:SetBorderColor(unpack(T.Colors.totems[i]))

				TotemBars[i].Backdrop.OverlayIcon = TotemBars[i].Backdrop:CreateTexture(nil, "ARTWORK", nil, 1)
				TotemBars[i].Backdrop.OverlayIcon:SetPoint("CENTER", TotemBars[i].Backdrop, "CENTER", 0, 0)
				TotemBars[i].Backdrop.OverlayIcon:SetSize(TotemSize -8, TotemSize -8)
				TotemBars[i].Backdrop.OverlayIcon:SetTexture(TotemIcon)
				TotemBars[i].Backdrop.OverlayIcon:SetVertexColor(unpack(T.Colors.totems[i]))
				
				if C["Skins"]["UnitFramesFilter"] == true then 
					TotemBars[i].Backdrop:CreateMaxUIFilterInside()
				end
			end

		-- totem statusbars
		elseif C.UnitFrames.TotemBarStyle.Value == "On Player" then
			TotemBars:ClearAllPoints()
			TotemBars:SetPoint("BOTTOM", self, "TOP", 0, 9)
			self.Shadow:SetPoint("TOPLEFT", -4, 3)
			TotemBars:SetFrameStrata("MEDIUM")
			TotemBars:SetFrameLevel(5)
			TotemBars.Backdrop:Hide()

			if C["ClassOptions"]["ClassPowerMover"] then
				Movers:RegisterFrame(TotemBars, "Totem Bar")
			end
			
			if C["ClassOptions"]["ClassPowerBackdrop"] then
				TotemBars.Backdrop:SetBackdropColor(0.11, 0.11, 0.11, .7)
				TotemBars.Backdrop:Show()
				TotemBars.Backdrop:CreateShadow()
				
				if C["Skins"]["UnitFramesFilter"] == true then 
					TotemBars.Backdrop:CreateMaxUIFilter()
				end
			end
			
			if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
				TotemBars:SetSize((ClassPowerWidth*2)+6, (ClassPowerHeight*4)+(ClassPowerSpace*3)+6)
			else
				TotemBars:SetSize(((ClassPowerWidth*4)*2)+(ClassPowerSpace*3)+6, (ClassPowerHeight)+6)
			end
			
			for i = 1, 4 do
				TotemBars[i]:SetFrameStrata("MEDIUM")
				TotemBars[i]:SetFrameLevel(8)
				TotemBars[i]:SetHeight(ClassPowerHeight)
				TotemBars[i]:SetWidth(ClassPowerWidth*2)
				TotemBars[i]:SetStatusBarTexture(ClassPowerTexture)
		
				TotemBars[i]:CreateBackdrop()
				TotemBars[i].Backdrop:SetOutside(TotemBars[i])
				TotemBars[i].Backdrop:CreateShadow()
				if C["General"]["ClassShadowExcludeUF"] then
					TotemBars[i].Backdrop.Shadow:SetBackdropBorderColor(0, 0, 0, .8)
				end

				if C["ClassOptions"]["ClassPowerBackdrop"] then
					TotemBars[i].Backdrop.Shadow:Hide()
				end

				if C["Skins"]["UnitFramesFilter"] == true then 
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Horizontal" then
						TotemBars[i]:CreateMaxUIFilter()
					else
						TotemBars[i]:CreateMaxUIVerticalFilter()
					end	
				end

				if i == 1 then
					TotemBars[i]:ClearAllPoints()
					TotemBars[i]:SetPoint("TOPLEFT", TotemBars, "TOPLEFT", 3, -3)
				else
					TotemBars[i]:ClearAllPoints()
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
							TotemBars[i]:SetPoint("TOP", TotemBars[i-1], "BOTTOM", 0, -ClassPowerSpace)
					else
						TotemBars[i]:SetPoint("LEFT", TotemBars[i-1], "RIGHT", ClassPowerSpace, 0)
					end
				end
			end
		end
	end
end