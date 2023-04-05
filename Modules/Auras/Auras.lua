------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 02-10-2022
------------------------------------------------------------------------------------------

-- setting up BUFFS AND DEBUFFS.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Auras = T["Auras"]
local Minimap = T.Maps.Minimap

-- functions
local baseAurasSkin = Auras.Skin
local baseCreateHeaders = Auras.CreateHeaders
local baseAurasUpdateAura = Auras.OnUpdate

------------------------------------------------------------------------------------------
-- AURAS (BUFFS AND DEBUFFS)	
------------------------------------------------------------------------------------------
function Auras:Skin()
	baseAurasSkin(self)
	
	local Count = self.Count
	local Duration = self.Duration
	local Bar = self.Bar
	local Holder = self.Holder

	--if not InCombatLockdown() then
	--	self:SetScale(C["Auras"]["AurasSize"]/100)
	--end


	if (C["Auras"]["Duration"]) then
		Duration:ClearAllPoints()
		Duration:SetFontObject(T.GetFont(C["Auras"]["DurationFont"]))
		Duration:SetScale(C["Auras"]["DurationFontSize"]/10)
		--Duration:SetTextColor(unpack(C["Auras"]["DurationColor"]))
		Duration:SetPoint(C["Auras"]["DurationPosition"]["Value"], self, C["Auras"]["DurationPosition"]["Value"], C["Auras"]["DurationOffsetH"], C["Auras"]["DurationOffsetV"])
		Duration:SetJustifyH(C["ActionBars"]["HotKeyJustifyH"]["Value"])
	else
		Duration:Hide()	
	end

	if (C["Auras"]["Count"]) then
		Count:ClearAllPoints()
		Count:SetFontObject(T.GetFont(C["Auras"]["CountFont"]))
		Count:SetScale(C["Auras"]["CountFontSize"]/10)
		Count:SetTextColor(unpack(C["Auras"]["CountColor"]))
		Count:SetPoint(C["Auras"]["CountPosition"]["Value"], self, C["Auras"]["CountPosition"]["Value"], C["Auras"]["CountOffsetH"], C["Auras"]["CountOffsetV"])
		Count:SetJustifyH(C["Auras"]["CountJustifyH"]["Value"])
	else
		Count:Hide()	
	end

	Holder:SetHeight(C["Auras"]["AurasBarSize"])
	Holder.Backdrop:SetOutside()

	Bar:ClearAllPoints()
	Bar:SetInside()

	self.Backdrop:SetOutside()

	if C["Skins"]["AurasFilter"] == true then 
		self:CreateMaxUIFilterInside()
		Bar:CreateMaxUIFilter()
	end
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
 	if (not C.Auras.Enable) then return	end
   baseCreateHeaders(self)
	
	self:PositionAuras()
	self:CombatStateAuras()
end