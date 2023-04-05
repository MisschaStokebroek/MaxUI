------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

--setting up TAGS for UNITFRAMES.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local UnitFrames = T["UnitFrames"]

local oUF = Tukui.oUF or oUF
local ClassColor = ClassColor

local _G = _G
local tonumber, next = tonumber, next
local gmatch, gsub, format = gmatch, gsub, format
local unpack, pairs, wipe, floor, ceil = unpack, pairs, wipe, floor, ceil
local strfind, strmatch, strlower, strsplit = strfind, strmatch, strlower, strsplit
local utf8lower, utf8sub, utf8len = string.utf8lower, string.utf8sub, string.utf8len


------------------------------------------------------------------------------------------
-- NAME TAG FUNCTIONS
------------------------------------------------------------------------------------------

-- abbreviate names
local function Abbrev(name)
	local letters, lastWord = '', strmatch(name, '.+%s(.+)$')
	if lastWord then
		for word in gmatch(name, '.-%s') do
			local firstLetter = utf8sub(gsub(word, '^[%s%p]*', ''), 1, 1)
			if firstLetter ~= utf8lower(firstLetter) then
				letters = format('%s%s. ', letters, firstLetter)
			end
		end
		name = format('%s%s', letters, lastWord)
	end
	return name
end

oUF.Tags.Events['name:abbrev'] = 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT'
oUF.Tags.Methods['name:abbrev'] = function(unit)
	local name = UnitName(unit)  or "???"
	if name and strfind(name, '%s') then
		name = Abbrev(name)
	end

	return name
end

-- Name coloring
oUF.Tags.Events["MaxUI:GetNameColor"] = "UNIT_POWER_UPDATE"
oUF.Tags.Methods["MaxUI:GetNameColor"] = function(unit)
	local Reaction = UnitReaction(unit, "player")
	
	if C["Raid"]["NameColor"]["Value"] == "Class" then 
		if (UnitIsPlayer(unit)) then
			return _TAGS["raidcolor"](unit)
		elseif (Reaction) then
			local c = T.Colors.reaction[Reaction]

			return string.format("|cff%02x%02x%02x", c[1] * 255, c[2] * 255, c[3] * 255)
		else
			return string.format("|cff%02x%02x%02x", 1, 1, 1)
		end
	else
		local c = C["Raid"]["CustomNameColor"]
	
		return string.format("|cff%02x%02x%02x", c[1] * 255, c[2] * 255, c[3] * 255)
	end
end

oUF.Tags.Events["Tukui:NameShort"] = "UNIT_NAME_UPDATE PARTY_LEADER_CHANGED GROUP_ROSTER_UPDATE"
oUF.Tags.Methods["Tukui:NameShort"] = function(unit)
	local Name = UnitName(unit) or "???"

	return UnitFrames.UTF8Sub(Name, UnitFrames.ShortNameLength, false)
end

------------------------------------------------------------------------------------------
-- SETUP HEALTH TAGS
------------------------------------------------------------------------------------------

-- health value color
oUF.Tags.Events["MaxUI:HealthColor"] = "UNIT_HEALTH UNIT_MAXHEALTH"
oUF.Tags.Methods["MaxUI:HealthColor"] = function(unit)
	local r, g, b

	if C["UnitFrames"]["HealthValueColors"]["Value"] == "GradientColor" then 
		r, g, b = 0.33, 0.59, 0.33
		--r, g, b = T.ColorGradient(min, max, 0.69, 0.31, 0.31, 0.65, 0.63, 0.35, 0.33, 0.59, 0.33)
	elseif C["UnitFrames"]["HealthValueColors"]["Value"] == "ClassColor" then 
		ClassColor = {unpack(T.Colors.class[select(2, UnitClass(unit))])}
		r, g, b = unpack(ClassColor)
	elseif C["UnitFrames"]["HealthValueColors"]["Value"] == "Custom" then 
		r, g, b = unpack(C["UnitFrames"]["CustomHealthValueColors"])
	end

	return string.format("|cff%02x%02x%02x", r * 255, g * 255, b * 255)
end

-- MAX HP
oUF.Tags.Events["MaxUI:MaxHP"] = "UNIT_HEALTH UNIT_MAXHEALTH"
oUF.Tags.Methods["MaxUI:MaxHP"] = function(unit)
	local HP
	
	if C["UnitFrames"]["TagFormat"]["Value"] == "Short" then
		HP = UnitFrames.ShortValue(UnitHealthMax(unit))
	else
		HP = UnitHealthMax(unit)
	end	
	
	return HP
end

-- MISSING HP
oUF.Tags.Events["MaxUI:MisHP"] = "UNIT_HEALTH UNIT_MAXHEALTH"
oUF.Tags.Methods["MaxUI:MisHP"] = function(unit)
	local HP
	
	if C["UnitFrames"]["TagFormat"]["Value"] == "Short" then
		HP = UnitFrames.ShortValue(UnitHealthMax(unit) - UnitHealth(unit))
	else
		HP = UnitHealthMax(unit) - UnitHealth(unit)
	end	

	if (HP > 0) then
		return HP
	end	
end

-- CURRENT HP
oUF.Tags.Events["MaxUI:CurHP"] = "UNIT_HEALTH UNIT_MAXHEALTH"
oUF.Tags.Methods["MaxUI:CurHP"] = function(unit)
	local HP
	
	if C["UnitFrames"]["TagFormat"]["Value"] == "Short" then
		HP = UnitFrames.ShortValue(UnitHealth(unit))
	else
		HP = UnitHealth(unit)
	end	
	
	return HP
end

------------------------------------------------------------------------------------------
-- SETUP POWER TAGS
------------------------------------------------------------------------------------------

-- power tag color
oUF.Tags.Events["MaxUI:PowerColor"] = "UNIT_MAXPOWER UNIT_POWER_UPDATE"
oUF.Tags.Methods["MaxUI:PowerColor"] = function(unit)
	local r, g, b
	local pType, pToken = UnitPowerType(unit)
	local Colors = T["Colors"]
	local Color = Colors.power[pToken]

	if Color then
		if C["UnitFrames"]["PowerValueColors"]["Value"] == "PowerColor" then 
			r, g, b = Color[1], Color[2], Color[3]
		elseif C["UnitFrames"]["PowerValueColors"]["Value"] == "ClassColor" then 
			local ClassColor = {unpack(T.Colors.class[select(2, UnitClass(unit))])}
			r, g, b = unpack(ClassColor)
		elseif C["UnitFrames"]["PowerValueColors"]["Value"] == "Custom" then 
			r, g, b = unpack(C["UnitFrames"]["CustomPowerValueColors"])
		end
	
		return string.format("|cff%02x%02x%02x", r * 255, g * 255, b * 255)
	end
end

-- MAX POWER
oUF.Tags.Events["MaxUI:MaxPP"] = "UNIT_MAXPOWER UNIT_POWER_UPDATE"
oUF.Tags.Methods["MaxUI:MaxPP"] = function(unit)
	local power
	
	if C["UnitFrames"]["TagFormat"]["Value"] == "Short" then
		power = UnitFrames.ShortValue(UnitPowerMax(unit))
	else
		power = UnitPowerMax(unit)
	end	
	
	return power
end

-- MISSING POWER
oUF.Tags.Events["MaxUI:MisPP"] = "UNIT_MAXPOWER UNIT_POWER_UPDATE"
oUF.Tags.Methods["MaxUI:MisPP"] = function(unit)
	local power
	
	if C["UnitFrames"]["TagFormat"]["Value"] == "Short" then
		power = UnitFrames.ShortValue(UnitPowerMax(unit) - UnitPower(unit))
	else
		power = UnitPowerMax(unit) - UnitPower(unit)
	end	

	if (power > 0) then
		return power
	end	
end

-- CURRENT POWER
oUF.Tags.Events["MaxUI:CurPP"] = "UNIT_MAXPOWER UNIT_POWER_UPDATE"
oUF.Tags.Methods["MaxUI:CurPP"] = function(unit)
	local power
	
	if C["UnitFrames"]["TagFormat"]["Value"] == "Short" then
		power = UnitFrames.ShortValue(UnitPower(unit))
	else
		power = UnitPower(unit)
	end	
	
	return power
end

