------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up DRUID.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local basePlayer = UnitFrames.Player

if (Class ~= "DRUID") then
	return
end

------------------------------------------------------------------------------------------
-- CLASS RESOURCES
------------------------------------------------------------------------------------------
function UnitFrames:Player()
	-- Tukui
	basePlayer(self)

	if not (C["UnitFrames"]["Style"]["Value"] == "MaxUI") then return end

	-- MaxUI
	local PowerTexture = T.GetTexture(C["UF: Player"]["PowerTexture"])
	local PowerHeight = C["UF: Player"]["PowerHeight"]
	local PowerWidth = C["UF: Player"]["PowerWidth"]
	local Health = self.Health
	local AdditionalPower = self.AdditionalPower
	local Health = self.Health
	local Power = self.Power
	
	if T.Retail then

	elseif T.BCC then
		local DruidMana = self.DruidMana
		local Background = self.DruidMana.bg
		
		if C["ClassOptions"]["Druid"] == true then
			DruidMana:ClearAllPoints()
			DruidMana:SetParent(Health)
			DruidMana:CreateShadow()
			DruidMana:SetPoint("RIGHT", Health, "TOPRIGHT", -10, 0)
			DruidMana:SetHeight(PowerHeight)
			DruidMana:SetWidth(PowerWidth)
			DruidMana:SetFrameLevel(15)
			DruidMana:SetFrameStrata("MEDIUM")
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
			DruidMana.Backdrop:SetFrameLevel(15)
			DruidMana.Backdrop:SetFrameStrata("MEDIUM")
			Background:Hide()
			
			-- highlighting
			self:HookScript("OnEnter", function(self)
				DruidMana.Backdrop:SetBorderColor(DruidMana:GetStatusBarColor())
			end)

			self:HookScript("OnLeave", function(self)
				DruidMana.Backdrop:SetBorderColor(unpack(C["General"]["BorderColor"]))
			end)
		
		else
			--DruidMana:Hide()
			DruidMana:ClearAllPoints()
		end	
	end	
end