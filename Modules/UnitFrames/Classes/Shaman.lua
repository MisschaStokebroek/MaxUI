------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up PLAYER FRAMES.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Movers = T["Movers"]
local basePlayer = UnitFrames.Player

if (Class ~= "SHAMAN") then
	return
end

------------------------------------------------------------------------------------------
-- CLASS RESOURCES
------------------------------------------------------------------------------------------
function UnitFrames:Player()
	-- Tukui
	basePlayer(self)

	if not (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then return end
	
	local Health = self.Health
	local TotemIcon = [[Interface\AddOns\MaxUI\Medias\MaxUI\totemwhite.tga]]

	if C["UnitFrames"]["TotemBar"]  == true then
		local TotemBars = self.Totems
		local ActionBar1 = T.ActionBars.Bars.Bar1
		local TotemSpacing = C["ClassOptions"]["ShamanTotemSpace"]
	
		TotemBars:ClearAllPoints()
		TotemBars:SetPoint("BOTTOM", ActionBar1, "TOP", 0, 7)
		Movers:RegisterFrame(TotemBars, "Totem Bar")

		if C.UnitFrames.TotemBarStyle.Value == "On Screen" then
			local TotemSize = C["ClassOptions"]["ShamanTotemSize"]
			TotemBars:SetSize((TotemSize*4) + (TotemSpacing*5), (TotemSize) + (TotemSpacing*2))
			if C["ClassOptions"]["ShamanTotemBackdrop"] then
				TotemBars:CreateBackdrop("Transparent")
				TotemBars.Backdrop:CreateShadow()
			end
		
			if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
				TotemBars:SetSize((TotemSize) + (TotemSpacing*2), (TotemSize*4) + (TotemSpacing*5))
			end
		
			for i = 1, MAX_TOTEMS do
				if C.UnitFrames.TotemBarStyle.Value == "On Player" then
					TotemBars[i]:CreateBackdrop()
					TotemBars[i].Backdrop:CreateShadow()
					TotemBars[i].Background:SetAlpha(1)
					TotemBars[i].Background:SetInside(TotemBars[i])
				end
				
				if C["ClassOptions"]["ShamanTotemBackdrop"] then
					TotemBars[i].Backdrop.Shadow:Hide()
				end
				
				TotemBars[i]:SetHeight(TotemSize)
				TotemBars[i]:SetWidth(TotemSize)

				if i == 1 then
					TotemBars[i]:SetPoint("TOPLEFT", TotemBars, "TOPLEFT", TotemSpacing, -TotemSpacing)
				else
					TotemBars[i]:SetPoint("LEFT", TotemBars[i-1], "RIGHT", TotemSpacing, 0)
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical"  then
						TotemBars[i]:ClearAllPoints()
						TotemBars[i]:SetPoint("TOP", TotemBars[i-1], "BOTTOM", 0, -TotemSpacing)
					end
				end
				
				TotemBars[i].Backdrop:SetAlpha(0.7)
				
				TotemBars[i].Backdrop.BackgroundTexture:SetTexture(nil)
				TotemBars[i].Backdrop:SetBorderColor(unpack(T.Colors.totems[i]))

				TotemBars[i].Backdrop.OverlayIcon = TotemBars[i].Backdrop:CreateTexture(nil, "OVERLAY", 1)
				TotemBars[i].Backdrop.OverlayIcon:SetPoint("CENTER", TotemBars[i].Backdrop, "CENTER", 0, 0)
				TotemBars[i].Backdrop.OverlayIcon:SetSize(TotemSize -8, TotemSize -8)
				TotemBars[i].Backdrop.OverlayIcon:SetTexture(TotemIcon)
				TotemBars[i].Backdrop.OverlayIcon:SetVertexColor(unpack(T.Colors.totems[i]))
			end

		elseif C.UnitFrames.TotemBarStyle.Value == "On Player" then
			local TotemSize = C["ClassOptions"]["ShamanTotemSize"]
			self.Shadow:SetPoint("TOPLEFT", -4, 3)
			TotemBars:SetWidth((TotemSize*4) + 10)
			TotemBars.Backdrop:CreateShadow()
		
			if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
				TotemBars:SetWidth(TotemSize + 2)
				TotemBars:SetHeight(32 + 4)
				TotemBars.Backdrop.OverlayIcon = TotemBars.Backdrop:CreateTexture(nil, "OVERLAY", 1)
				TotemBars.Backdrop.OverlayIcon:SetPoint("CENTER", TotemBars.Backdrop, "CENTER", 0, 0)
				TotemBars.Backdrop.OverlayIcon:SetSize(24, 24)
				TotemBars.Backdrop.OverlayIcon:SetAlpha(0.5)
				TotemBars.Backdrop.OverlayIcon:SetTexture(TotemIcon)
			end
	
			for i = 1, 4 do
				TotemBars[i]:SetWidth(TotemSize)

				if i == 1 then
					TotemBars[i]:ClearAllPoints()
					TotemBars[i]:SetPoint("TOPLEFT", TotemBars, "TOPLEFT", 1, -1)
				else
					TotemBars[i]:ClearAllPoints()
					TotemBars[i]:SetPoint("LEFT", TotemBars[i-1], "RIGHT", 3, 0)
					if C["ClassOptions"]["ClassResourcesOrientation"]["Value"] == "Vertical" then
						TotemBars[i]:ClearAllPoints()
						TotemBars[i]:SetPoint("TOP", TotemBars[i-1], "BOTTOM", 0, -1)
					end
				end
			end
		end
	end
end