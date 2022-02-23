------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-07-2021
------------------------------------------------------------------------------------------

-- setting up BUFFS AND DEBUFFS.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Auras = T["Auras"]
local Minimap = T.Maps.Minimap
local baseCreateHeaders = Auras.CreateHeaders
local baseAurasSkin = Auras.Skin
local thickness = thickness

------------------------------------------------------------------------------------------
-- AURAS (BUFFS AND DEBUFFS)	
------------------------------------------------------------------------------------------
function Auras:Skin()
	baseAurasSkin(self)
	local Count = self.Count
	local Duration = self.Duration
	
	Duration:SetScale(C.Auras.AurasFontSize/10)
	Duration:ClearAllPoints()
	Duration:SetPoint("TOP", self, "BOTTOM", 0, -2)
	
	Count:SetScale(C.Auras.AurasFontSize/10)
	Count:ClearAllPoints()
	Count:SetPoint("TOP", self, "TOP", 0, -2)
end

function Auras:PositionAuras()
	local Headers = Auras.Headers
	local Buffs = Headers[1]
	local Debuffs = Headers[2]
	
	local y
	if C["General"]["thickness"] <=19 then
		y = 6 + C["General"]["thickness"] + 12
	else
		y = 6 + C["General"]["thickness"] + 6
	end

	Buffs:SetUserPlaced(true)
	Debuffs:SetUserPlaced(true)

	if C["Auras"]["Position"]["Value"] == "Left" then
		Buffs:ClearAllPoints()
		Buffs:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 24, -y)
		if C["Location"]["Position"]["Value"] == "Topleft" then
			Buffs:SetPoint("TOPLEFT", Minimap, "TOPRIGHT", 8, 1)
		end	

	elseif C["Auras"]["Position"]["Value"] == "Center" then 	
		Buffs:ClearAllPoints()
		Buffs:SetPoint("TOP", UIParent, "TOP", 0, -y)
		
		if C["Location"]["Position"]["Value"] == "Center" then
			Buffs:SetPoint("TOPRIGHT", Minimap, "TOPLEFT", -6, 0)
			Debuffs:ClearAllPoints()
			Debuffs:SetPoint("TOPLEFT", Minimap, "TOPRIGHT", 6, 0)
		end	

	elseif C["Auras"]["Position"]["Value"] == "Right" then 	
		Buffs:ClearAllPoints()
		Buffs:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -24, -y)
		if C["Location"]["Position"]["Value"] == "Topright" then
			Buffs:SetPoint("TOPRIGHT", Minimap, "TOPLEFT", -8, 1)
		end	
	end
end

function Auras:CombatStateAuras()
	local Headers = Auras.Headers
	local Buffs = Headers[1]
	local Debuffs = Headers[2]

	if C["Auras"]["AurasBuffCombatState"]["Value"] == "Hide" and C["Auras"]["HideBuffs"] == false then
		RegisterStateDriver(Buffs, "visibility", "[combat] hide; show")
	end

	if C["Auras"]["AurasBuffCombatState"]["Value"] == "Show" and C["Auras"]["HideBuffs"] == false then
		RegisterStateDriver(Buffs, "visibility", "[combat] show; hide")
	end
	
	if C["Auras"]["AurasDebuffCombatState"]["Value"] == "Hide" and C["Auras"]["HideDebuffs"] == false then
		RegisterStateDriver(Debuffs, "visibility", "[combat] hide; show")
	end
	
	if C["Auras"]["AurasDebuffCombatState"]["Value"] == "Show" and C["Auras"]["HideDebuffs"] == false then
		RegisterStateDriver(Debuffs, "visibility", "[combat] show; hide")
	end
end

function Auras:CreateHeaders()
   -- Tukui
    baseCreateHeaders(self)
	
	--- MaxUI
	if (not C.Auras.Enable) then return	end
	self:PositionAuras()
	self:CombatStateAuras()
end