------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- setting up DRUID.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local basePlayer = UnitFrames.Player

if (Class ~= "DRUID") then return end

------------------------------------------------------------------------------------------
-- CLASS RESOURCES
------------------------------------------------------------------------------------------
function UnitFrames:Player()
	basePlayer(self)

	if not (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then return end

	-- elements
	local Health = self.Health
	local AdditionalPower = self.AdditionalPower
	local Health = self.Health
	local Power = self.Power

	-- settings
	local PowerHeight = C["UF: Player"]["PowerHeight"]
	local PowerWidth = C["UF: Player"]["PowerWidth"]

	-- textures
	local PowerTexture = T.GetTexture(C["UF: Player"]["PowerTexture"])

	if T.Retail then

	elseif T.BCC then
		local DruidMana = self.DruidMana
		local Background = self.DruidMana.bg
		
		if C["ClassOptions"]["Druid"] == true then
			DruidMana:ClearAllPoints()
			DruidMana:SetParent(Health)
			DruidMana:SetPoint("RIGHT", Health, "TOPRIGHT", -10, 0)
			DruidMana:SetHeight(PowerHeight)
			DruidMana:SetWidth(PowerWidth)
			DruidMana:SetFrameStrata("HIGH")
			DruidMana:SetFrameLevel(5)
			DruidMana:SetStatusBarTexture(PowerTexture)
			DruidMana:SetStatusBarColor(unpack(T.Colors.power["MANA"]))
			
			if C["UnitFrames"]["HorVer"]["Value"] == "Vertical" then
				DruidMana:ClearAllPoints()
				DruidMana:SetPoint("BOTTOM", Health, "BOTTOMRIGHT", 0, 10)
				DruidMana:SetHeight(PowerWidth)
				DruidMana:SetWidth(PowerHeight)
				DruidMana:SetOrientation("VERTICAL")
			end

			DruidMana:CreateBackdrop()
			DruidMana.Backdrop:CreateShadow()
			Background:Hide()
		
			-- highlighting
			self:HookScript("OnEnter", function(self)
				DruidMana.Backdrop:SetBorderColor(DruidMana:GetStatusBarColor())
			end)

			self:HookScript("OnLeave", function(self)
				DruidMana.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
			end)
			
			if C["Skins"]["UnitFramesFilter"] == true then 
				DruidMana.Backdrop:CreateMaxUIFilter()
			end
		else
			DruidMana:ClearAllPoints()
		end	
	end	
end