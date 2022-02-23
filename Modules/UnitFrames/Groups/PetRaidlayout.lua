------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

--setting up RAID LAYOUT.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
T, C, L = Tukui:unpack()
local TukuiUnitFrames = T.UnitFrames

------------------------------------------------------------------------------------------
-- PET RAIDFRAME ATTRIBUTES
------------------------------------------------------------------------------------------
function TukuiUnitFrames:GetPetRaidFramesAttributes()

	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then

		if C["Raid"]["GrowDirection"]["Value"] == "VerticalDown" then 
			local Properties = C.Party.Enable and "custom [@raid26,exists] hide; [@raid6,exists] show; hide" or "custom [@raid26,exists] hide; [@raid1,exists] show; [@party1,exists] show; hide"
				return
				"TukuiRaidPet", 
				"SecureGroupPetHeaderTemplate", 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.WidthSize,
				"initial-height", C.Raid.HeightSize,
				"showParty", true,
				"showRaid", C["Raid"].ShowPets,
				"showSolo", C["Raid"]["ShowSolo"],
				"maxColumns", math.ceil(40/5),
				"point", "TOP",
				"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["HorSpacing"]),
				"columnAnchorPoint", "LEFT",
				"yOffset", (-C["Raid"]["VerSpacing"])

		elseif C["Raid"]["GrowDirection"]["Value"] == "HorizontalDown" then 
			local Properties = C.Party.Enable and "custom [@raid26,exists] hide; [@raid6,exists] show; hide" or "custom [@raid26,exists] hide; [@raid1,exists] show; [@party1,exists] show; hide"
				return
				"TukuiRaidPet", 
				"SecureGroupPetHeaderTemplate", 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.WidthSize,
				"initial-height", C.Raid.HeightSize,
				"showParty", true,
				"showRaid", C["Raid"].ShowPets,
				"showSolo", C["Raid"]["ShowSolo"],
				"maxColumns", math.ceil(40/5),
				"point", "LEFT",
				"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["VerSpacing"]),
				"columnAnchorPoint", "TOP",
				"xOffset", (C["Raid"]["HorSpacing"])
		
		
		elseif C["Raid"]["GrowDirection"]["Value"] == "VerticalUp" then 
			local Properties = C.Party.Enable and "custom [@raid26,exists] hide; [@raid6,exists] show; hide" or "custom [@raid26,exists] hide; [@raid1,exists] show; [@party1,exists] show; hide"
				return
				"TukuiRaidPet", 
				"SecureGroupPetHeaderTemplate", 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.WidthSize,
				"initial-height", C.Raid.HeightSize,
				"showParty", true,
				"showRaid", C["Raid"].ShowPets,
				"showSolo", C["Raid"]["ShowSolo"],
				"maxColumns", math.ceil(40/5),
				"point", "BOTTOM",
				"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["HorSpacing"]),
				"columnAnchorPoint", "LEFT",
				"yOffset", (C["Raid"]["VerSpacing"])
		
		elseif C["Raid"]["GrowDirection"]["Value"] == "HorizontalUp" then 
			local Properties = C.Party.Enable and "custom [@raid26,exists] hide; [@raid6,exists] show; hide" or "custom [@raid26,exists] hide; [@raid1,exists] show; [@party1,exists] show; hide"
				return
				"TukuiRaidPet", 
				"SecureGroupPetHeaderTemplate", 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.WidthSize,
				"initial-height", C.Raid.HeightSize,
				"showParty", true,
				"showRaid", C["Raid"].ShowPets,
				"showSolo", C["Raid"]["ShowSolo"],
				"maxColumns", math.ceil(40/5),
				"point", "LEFT",
				"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["VerSpacing"]),
				"columnAnchorPoint", "BOTTOM",
				"xOffset", (C["Raid"]["HorSpacing"])
		end
			
	else
		if C["Raid"]["GrowDirection"]["Value"] == "VerticalDown" then 
			local Properties = C.Party.Enable and "custom [@raid26,exists] hide; [@raid6,exists] show; hide" or "custom [@raid26,exists] hide; [@raid1,exists] show; [@party1,exists] show; hide"
				return
				"TukuiRaidPet", 
				"SecureGroupPetHeaderTemplate", 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.WidthSize,
				"initial-height", C.Raid.HeightSize,
				"showParty", true,
				"showRaid", C["Raid"].ShowPets,
				"showSolo", C["Raid"]["ShowSolo"],
				"maxColumns", math.ceil(40/5),
				"point", "TOP",
				"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["HorSpacing"]),
				"columnAnchorPoint", "LEFT",
				"yOffset", (-C["Raid"]["VerSpacing"])

		elseif C["Raid"]["GrowDirection"]["Value"] == "HorizontalDown" then 
			local Properties = C.Party.Enable and "custom [@raid26,exists] hide; [@raid6,exists] show; hide" or "custom [@raid26,exists] hide; [@raid1,exists] show; [@party1,exists] show; hide"
				return
				"TukuiRaidPet", 
				"SecureGroupPetHeaderTemplate", 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.WidthSize,
				"initial-height", C.Raid.HeightSize,
				"showParty", true,
				"showRaid", C["Raid"].ShowPets,
				"showSolo", C["Raid"]["ShowSolo"],
				"maxColumns", math.ceil(40/5),
				"point", "LEFT",
				"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
				"columnSpacing", (-C["Raid"]["VerSpacing"]),
				"columnAnchorPoint", "TOP",
				"xOffset", (C["Raid"]["HorSpacing"])
		
		
		elseif C["Raid"]["GrowDirection"]["Value"] == "VerticalUp" then 
			local Properties = C.Party.Enable and "custom [@raid26,exists] hide; [@raid6,exists] show; hide" or "custom [@raid26,exists] hide; [@raid1,exists] show; [@party1,exists] show; hide"
				return
				"TukuiRaidPet", 
				"SecureGroupPetHeaderTemplate", 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.WidthSize,
				"initial-height", C.Raid.HeightSize,
				"showParty", true,
				"showRaid", C["Raid"].ShowPets,
				"showSolo", C["Raid"]["ShowSolo"],
				"maxColumns", math.ceil(40/5),
				"point", "BOTTOM",
				"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["HorSpacing"]),
				"columnAnchorPoint", "LEFT",
				"yOffset", (C["Raid"]["VerSpacing"])
		
		elseif C["Raid"]["GrowDirection"]["Value"] == "HorizontalUp" then 
			local Properties = C.Party.Enable and "custom [@raid26,exists] hide; [@raid6,exists] show; hide" or "custom [@raid26,exists] hide; [@raid1,exists] show; [@party1,exists] show; hide"
				return
				"TukuiRaidPet", 
				"SecureGroupPetHeaderTemplate", 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.WidthSize,
				"initial-height", C.Raid.HeightSize,
				"showParty", true,
				"showRaid", C["Raid"].ShowPets,
				"showSolo", C["Raid"]["ShowSolo"],
				"maxColumns", math.ceil(40/5),
				"point", "LEFT",
				"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["VerSpacing"]),
				"columnAnchorPoint", "BOTTOM",
				"xOffset", (C["Raid"]["HorSpacing"])
		end
	end		
end

function TukuiUnitFrames:GetBigPetRaidFramesAttributes()

	if C["UnitFrames"]["Style"]["Value"] == "MaxUI" then

		if C["Raid"]["GrowDirection"]["Value"] == "VerticalDown" then 
				local Properties = "custom [@raid26,exists] show; hide"
				return
				"TukuiRaid40Pet", 
				"SecureGroupPetHeaderTemplate", 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.Raid40WidthSize,
				"initial-height", C.Raid.Raid40HeightSize,
				"showParty", true,
				"showRaid", C["Raid"].ShowPets,
				"showSolo", C["Raid"]["ShowSolo"],
				"maxColumns", math.ceil(40/5),
				"point", "TOP",
				"unitsPerColumn", C["Raid"].Raid40MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["HorSpacing"]),
				"columnAnchorPoint", "LEFT",
				"yOffset", (-C["Raid"]["VerSpacing"])

		elseif C["Raid"]["GrowDirection"]["Value"] == "HorizontalDown" then 
				local Properties = "custom [@raid26,exists] show; hide"
				return
				"TukuiRaid40Pet", 
				"SecureGroupPetHeaderTemplate", 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.Raid40WidthSize,
				"initial-height", C.Raid.Raid40HeightSize,
				"showParty", true,
				"showRaid", C["Raid"].ShowPets,
				"showSolo", C["Raid"]["ShowSolo"],
				"maxColumns", math.ceil(40/5),
				"point", "LEFT",
				"unitsPerColumn", C["Raid"].Raid40MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["VerSpacing"]),
				"columnAnchorPoint", "TOP",
				"xOffset", (C["Raid"]["HorSpacing"])
		
		
		elseif C["Raid"]["GrowDirection"]["Value"] == "VerticalUp" then 
				local Properties = "custom [@raid26,exists] show; hide"
				return
				"TukuiRaid40Pet", 
				"SecureGroupPetHeaderTemplate", 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.Raid40WidthSize,
				"initial-height", C.Raid.Raid40HeightSize,
				"showParty", true,
				"showRaid", C["Raid"].ShowPets,
				"showSolo", C["Raid"]["ShowSolo"],
				"maxColumns", math.ceil(40/5),
				"point", "BOTTOM",
				"unitsPerColumn", C["Raid"].Raid40MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["HorSpacing"]),
				"columnAnchorPoint", "LEFT",
				"yOffset", (C["Raid"]["VerSpacing"])
		
		elseif C["Raid"]["GrowDirection"]["Value"] == "HorizontalUp" then 
				local Properties = "custom [@raid26,exists] show; hide"
				return
				"TukuiRaid40Pet", 
				"SecureGroupPetHeaderTemplate", 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.Raid40WidthSize,
				"initial-height", C.Raid.Raid40HeightSize,
				"showParty", true,
				"showRaid", C["Raid"].ShowPets,
				"showSolo", C["Raid"]["ShowSolo"],
				"maxColumns", math.ceil(40/5),
				"point", "LEFT",
				"unitsPerColumn", C["Raid"].Raid40MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["VerSpacing"]),
				"columnAnchorPoint", "BOTTOM",
				"xOffset", (C["Raid"]["HorSpacing"])
		end
			
	else
		if C["Raid"]["GrowDirection"]["Value"] == "VerticalDown" then 
				local Properties = "custom [@raid26,exists] show; hide"
				return
				"TukuiRaid40Pet", 
				"SecureGroupPetHeaderTemplate", 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.Raid40WidthSize,
				"initial-height", C.Raid.Raid40HeightSize,
				"showParty", true,
				"showRaid", C["Raid"].ShowPets,
				"showSolo", C["Raid"]["ShowSolo"],
				"maxColumns", math.ceil(40/5),
				"point", "TOP",
				"unitsPerColumn", C["Raid"].Raid40MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["HorSpacing"]),
				"columnAnchorPoint", "LEFT",
				"yOffset", (-C["Raid"]["VerSpacing"])

		elseif C["Raid"]["GrowDirection"]["Value"] == "Horizontal Down" then 
				local Properties = "custom [@raid26,exists] show; hide"
				return
				"TukuiRaid40Pet", 
				"SecureGroupPetHeaderTemplate", 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.Raid40WidthSize,
				"initial-height", C.Raid.Raid40HeightSize,
				"showParty", true,
				"showRaid", C["Raid"].ShowPets,
				"showSolo", C["Raid"]["ShowSolo"],
				"maxColumns", math.ceil(40/5),
				"point", "LEFT",
				"unitsPerColumn", C["Raid"].Raid40MaxUnitPerColumn,
				"columnSpacing", (-C["Raid"]["VerSpacing"]),
				"columnAnchorPoint", "TOP",
				"xOffset", (C["Raid"]["HorSpacing"])
		
		
		elseif C["Raid"]["GrowDirection"]["Value"] == "VerticalUp" then 
				local Properties = "custom [@raid26,exists] show; hide"
				return
				"TukuiRaid40Pet", 
				"SecureGroupPetHeaderTemplate", 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.Raid40WidthSize,
				"initial-height", C.Raid.Raid40HeightSize,
				"showParty", true,
				"showRaid", C["Raid"].ShowPets,
				"showSolo", C["Raid"]["ShowSolo"],
				"maxColumns", math.ceil(40/5),
				"point", "BOTTOM",
				"unitsPerColumn", C["Raid"].Raid40MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["HorSpacing"]),
				"columnAnchorPoint", "LEFT",
				"yOffset", (C["Raid"]["VerSpacing"])
		
		elseif C["Raid"]["GrowDirection"]["Value"] == "HorizontalUp" then 
				local Properties = "custom [@raid26,exists] show; hide"
				return
				"TukuiRaid40Pet", 
				"SecureGroupPetHeaderTemplate", 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.Raid40WidthSize,
				"initial-height", C.Raid.Raid40HeightSize,
				"showParty", true,
				"showRaid", C["Raid"].ShowPets,
				"showSolo", C["Raid"]["ShowSolo"],
				"maxColumns", math.ceil(40/5),
				"point", "LEFT",
				"unitsPerColumn", C["Raid"].Raid40MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["VerSpacing"]),
				"columnAnchorPoint", "BOTTOM",
				"xOffset", (C["Raid"]["HorSpacing"])
		end
	end		
end