------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

--setting up RAID LAYOUT.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
T, C, L = Tukui:unpack()
local TukuiUnitFrames = T.UnitFrames

------------------------------------------------------------------------------------------
-- UNIT RAIDFRAME ATTRIBUTES
------------------------------------------------------------------------------------------
function TukuiUnitFrames:GetRaidFramesAttributes()
	if InCombatLockdown() then return end -- taint problem for anchoring?

	if C["Raid"]["Style"]["Value"] == "Tukui" then

		-- Vertical (down)
		if C["Raid"]["GrowDirection"]["Value"] == "VerticalDown" then 
			local Properties = C.Party.Enable and "custom [@raid26,exists] hide; [@raid6,exists] show; hide" or 
			"custom [@raid26,exists] hide; [@raid1,exists] show; [@party1,exists] show; hide"
			return
				"TukuiRaid", 
				nil, 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.WidthSize,
				"initial-height", C.Raid.HeightSize,
				"showParty", true,
				"showRaid", true,
				"showPlayer", true,
				"showSolo", C["Raid"]["ShowSolo"],
				"groupFilter", "1,2,3,4,5,6,7,8",
				"groupingOrder", "1,2,3,4,5,6,7,8",
				"yOffset", (-C["Raid"]["VerSpacing"]),
				"point", "TOP",
				"maxColumns", math.ceil(40/5),
				"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["HorSpacing"]),
				"columnAnchorPoint", "LEFT"
				
		-- Vertical (up)
		elseif C["Raid"]["GrowDirection"]["Value"] == "VerticalUp" then 
			local Properties = C.Party.Enable and "custom [@raid26,exists] hide; [@raid6,exists] show; hide" or 
			"custom [@raid26,exists] hide; [@raid1,exists] show; [@party1,exists] show; hide"
			return
				"TukuiRaid", 
				nil, 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.WidthSize,
				"initial-height", C.Raid.HeightSize,
				"showParty", true,
				"showRaid", true,
				"showPlayer", true,
				"showSolo", C["Raid"]["ShowSolo"],
				"groupFilter", "1,2,3,4,5,6,7,8",
				"groupingOrder", "1,2,3,4,5,6,7,8",
				"yOffset", (C["Raid"]["VerSpacing"]),
				"point", "BOTTOM",
				"maxColumns", math.ceil(40/5),
				"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["HorSpacing"]),
				"columnAnchorPoint", "LEFT"
		
		-- Horizontal (up)
		elseif C["Raid"]["GrowDirection"]["Value"] == "HorizontalUp" then 
			local Properties = C.Party.Enable and "custom [@raid26,exists] hide; [@raid6,exists] show; hide" or 
			"custom [@raid26,exists] hide; [@raid1,exists] show; [@party1,exists] show; hide"
			return
				"TukuiRaid", 
				nil, 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.WidthSize,
				"initial-height", C.Raid.HeightSize,
				"showParty", true,
				"showRaid", true,
				"showPlayer", true,
				"showSolo", C["Raid"]["ShowSolo"],
				"groupFilter", "1,2,3,4,5,6,7,8",
				"groupingOrder", "1,2,3,4,5,6,7,8",
				"xoffset", (C["Raid"]["HorSpacing"]),
				"point", "LEFT",
				"maxColumns", math.ceil(40/5),
				"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
				"columnSpacing", (-C["Raid"]["VerSpacing"]),
				"columnAnchorPoint", "BOTTOM"
		end

		-- Horizontal (down)
		if C["Raid"]["GrowDirection"]["Value"] == "HorizontalDown" then 
			local Properties = C.Party.Enable and "custom [@raid26,exists] hide; [@raid6,exists] show; hide" or 
			"custom [@raid26,exists] hide; [@raid1,exists] show; [@party1,exists] show; hide"
			return
				"TukuiRaid", 
				nil, 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.WidthSize,
				"initial-height", C.Raid.HeightSize,
				"showParty", true,
				"showRaid", true,
				"showPlayer", true,
				"showSolo", C["Raid"]["ShowSolo"],
				"groupFilter", "1,2,3,4,5,6,7,8",
				"groupingOrder", "1,2,3,4,5,6,7,8",
				"xoffset", (C["Raid"]["HorSpacing"]),
				"point", "LEFT",
				"maxColumns", math.ceil(40/5),
				"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["VerSpacing"]),
				"columnAnchorPoint", "TOP"
		end
	
	else -- maxui / other

		-- Vertical (down)
		if C["Raid"]["GrowDirection"]["Value"] == "VerticalDown" then 
			local Properties = C.Party.Enable and "custom [@raid26,exists] hide; [@raid6,exists] show; hide" or
			 "custom [@raid26,exists] hide; [@raid1,exists] show; [@party1,exists] show; hide" or "solo,party,raid"
			 return
				"TukuiRaid", 
				nil, 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.WidthSize,
				"initial-height", C.Raid.HeightSize,
				"showParty", true,
				"showRaid", true,
				"showPlayer", true,
				"showSolo", C["Raid"]["ShowSolo"],
				"groupFilter", "1,2,3,4,5,6,7,8",
				"groupingOrder", "1,2,3,4,5,6,7,8",
				"yOffset", (-C["Raid"]["VerSpacing"]),
				"point", "TOP",
				"maxColumns", math.ceil(40/5),
				"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["HorSpacing"]),
				"columnAnchorPoint", "LEFT"
				
		-- Vertical (up)
		elseif C["Raid"]["GrowDirection"]["Value"] == "VerticalUp" then 
			local Properties = C.Party.Enable and "custom [@raid26,exists] hide; [@raid6,exists] show; hide" or 
			"custom [@raid26,exists] hide; [@raid1,exists] show; [@party1,exists] show; hide"
			return
				"TukuiRaid", 
				nil, 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.WidthSize,
				"initial-height", C.Raid.HeightSize,
				"showParty", true,
				"showRaid", true,
				"showPlayer", true,
				"showSolo", C["Raid"]["ShowSolo"],
				"groupFilter", "1,2,3,4,5,6,7,8",
				"groupingOrder", "1,2,3,4,5,6,7,8",
				"yOffset", (C["Raid"]["VerSpacing"]),
				"point", "BOTTOM",
				"maxColumns", math.ceil(40/5),
				"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["HorSpacing"]),
				"columnAnchorPoint", "LEFT"
		
		-- Horizontal (up)
		elseif C["Raid"]["GrowDirection"]["Value"] == "HorizontalUp" then 
			local Properties = C.Party.Enable and "custom [@raid26,exists] hide; [@raid6,exists] show; hide" or 
			"custom [@raid26,exists] hide; [@raid1,exists] show; [@party1,exists] show; hide"
			return
				"TukuiRaid", 
				nil, 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.WidthSize,
				"initial-height", C.Raid.HeightSize,
				"showParty", true,
				"showRaid", true,
				"showPlayer", true,
				"showSolo", C["Raid"]["ShowSolo"],
				"groupFilter", "1,2,3,4,5,6,7,8",
				"groupingOrder", "1,2,3,4,5,6,7,8",
				"xoffset", (C["Raid"]["HorSpacing"]),
				"point", "LEFT",
				"maxColumns", math.ceil(40/5),
				"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["VerSpacing"]),
				"columnAnchorPoint", "BOTTOM"
		end

		-- Horizontal (down)
		if C["Raid"]["GrowDirection"]["Value"] == "HorizontalDown" then 
			local Properties = C.Party.Enable and "custom [@raid26,exists] hide; [@raid6,exists] show; hide" or 
			"custom [@raid26,exists] hide; [@raid1,exists] show; [@party1,exists] show; hide"
			return
				"TukuiRaid", 
				nil, 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.WidthSize,
				"initial-height", C.Raid.HeightSize,
				"showParty", true,
				"showRaid", true,
				"showPlayer", true,
				"showSolo", C["Raid"]["ShowSolo"],
				"groupFilter", "1,2,3,4,5,6,7,8",
				"groupingOrder", "1,2,3,4,5,6,7,8",
				"xoffset", (C["Raid"]["HorSpacing"]),
				"point", "LEFT",
				"maxColumns", math.ceil(40/5),
				"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["VerSpacing"]),
				"columnAnchorPoint", "TOP"
		end
	end
end

function TukuiUnitFrames:GetBigRaidFramesAttributes()
	if InCombatLockdown() then return end -- taint problem for anchoring?

	if C["Raid"]["Style"]["Value"] == "Tukui" then

		-- Vertical (down)
		if C["Raid"]["GrowDirection"]["Value"] == "VerticalDown" then 
			local Properties = "custom [@raid26,exists] show; hide"
			return
				"TukuiRaid40", 
				nil, 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.Raid40WidthSize,
				"initial-height", C.Raid.Raid40HeightSize,
				"showParty", true,
				"showRaid", true,
				"showPlayer", true,
				"groupFilter", "1,2,3,4,5,6,7,8",
				"groupingOrder", "1,2,3,4,5,6,7,8",
				"yOffset", (-C["Raid"]["VerSpacing"]),
				"point", "TOP",
				"maxColumns", math.ceil(40/5),
				"unitsPerColumn", C["Raid"].Raid40MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["HorSpacing"]),
				"columnAnchorPoint", "LEFT"
				
		-- Vertical (up)
		elseif C["Raid"]["GrowDirection"]["Value"] == "VerticalUp" then 
			local Properties = "custom [@raid26,exists] show; hide"
			return
				"TukuiRaid40", 
				nil, 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.Raid40WidthSize,
				"initial-height", C.Raid.Raid40HeightSize,
				"showParty", true,
				"showRaid", true,
				"showPlayer", true,
				"groupFilter", "1,2,3,4,5,6,7,8",
				"groupingOrder", "1,2,3,4,5,6,7,8",
				"yOffset", (C["Raid"]["VerSpacing"]),
				"point", "BOTTOM",
				"maxColumns", math.ceil(40/5),
				"unitsPerColumn", C["Raid"].Raid40MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["HorSpacing"]),
				"columnAnchorPoint", "LEFT"
		
		-- Horizontal (down)
		elseif C["Raid"]["GrowDirection"]["Value"] == "HorizontalUp" then 
			local Properties = "custom [@raid26,exists] show; hide"
			return
				"TukuiRaid40", 
				nil, 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.Raid40WidthSize,
				"initial-height", C.Raid.Raid40HeightSize,
				"showParty", true,
				"showRaid", true,
				"showPlayer", true,
				"groupFilter", "1,2,3,4,5,6,7,8",
				"groupingOrder", "1,2,3,4,5,6,7,8",
				"xoffset", (C["Raid"]["HorSpacing"]),
				"point", "LEFT",
				"maxColumns", math.ceil(40/5),
				"unitsPerColumn", C["Raid"].Raid40MaxUnitPerColumn,
				"columnSpacing", (-C["Raid"]["VerSpacing"]),
				"columnAnchorPoint", "BOTTOM"
		end

		-- Horizontal (up)
		if C["Raid"]["GrowDirection"]["Value"] == "HorizontalDown" then 
			local Properties = "custom [@raid26,exists] show; hide"
			return
				"TukuiRaid40", 
				nil, 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.Raid40WidthSize,
				"initial-height", C.Raid.Raid40HeightSize,
				"showParty", true,
				"showRaid", true,
				"showPlayer", true,
				"groupFilter", "1,2,3,4,5,6,7,8",
				"groupingOrder", "1,2,3,4,5,6,7,8",
				"xoffset", (C["Raid"]["HorSpacing"]),
				"point", "LEFT",
				"maxColumns", math.ceil(40/5),
				"unitsPerColumn", C["Raid"].Raid40MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["VerSpacing"]),
				"columnAnchorPoint", "TOP"
		end

	else -- maxui / orbs

		-- Vertical (down)
		if C["Raid"]["GrowDirection"]["Value"] == "VerticalDown" then 
			local Properties = "custom [@raid26,exists] show; hide"
			return
				"TukuiRaid40", 
				nil, 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.Raid40WidthSize,
				"initial-height", C.Raid.Raid40HeightSize,
				"showParty", true,
				"showRaid", true,
				"showPlayer", true,
				"groupFilter", "1,2,3,4,5,6,7,8",
				"groupingOrder", "1,2,3,4,5,6,7,8",
				"yOffset", (-C["Raid"]["VerSpacing"]),
				"point", "TOP",
				"maxColumns", math.ceil(40/5),
				"unitsPerColumn", C["Raid"].Raid40MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["HorSpacing"]),
				"columnAnchorPoint", "LEFT"
				
		-- Vertical (up)
		elseif C["Raid"]["GrowDirection"]["Value"] == "VerticalUp" then 
			local Properties = "custom [@raid26,exists] show; hide"
			return
				"TukuiRaid40", 
				nil, 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.Raid40WidthSize,
				"initial-height", C.Raid.Raid40HeightSize,
				"showParty", true,
				"showRaid", true,
				"showPlayer", true,
				"groupFilter", "1,2,3,4,5,6,7,8",
				"groupingOrder", "1,2,3,4,5,6,7,8",
				"yOffset", (C["Raid"]["VerSpacing"]),
				"point", "BOTTOM",
				"maxColumns", math.ceil(40/5),
				"unitsPerColumn", C["Raid"].Raid40MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["HorSpacing"]),
				"columnAnchorPoint", "LEFT"
		
		-- Horizontal (up)
		elseif C["Raid"]["GrowDirection"]["Value"] == "HorizontalUp" then 
			local Properties = "custom [@raid26,exists] show; hide"
			return
				"TukuiRaid40", 
				nil, 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.Raid40WidthSize,
				"initial-height", C.Raid.Raid40HeightSize,
				"showParty", true,
				"showRaid", true,
				"showPlayer", true,
				"groupFilter", "1,2,3,4,5,6,7,8",
				"groupingOrder", "1,2,3,4,5,6,7,8",
				"xoffset", (C["Raid"]["HorSpacing"]),
				"point", "LEFT",
				"maxColumns", math.ceil(40/5),
				"unitsPerColumn", C["Raid"].Raid40MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["VerSpacing"]),
				"columnAnchorPoint", "BOTTOM"
		end

		-- Horizontal (down)
		if C["Raid"]["GrowDirection"]["Value"] == "HorizontalDown" then 
			local Properties = "custom [@raid26,exists] show; hide"
			return
				"TukuiRaid40", 
				nil, 
				Properties,
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", C.Raid.Raid40WidthSize,
				"initial-height", C.Raid.Raid40HeightSize,
				"showParty", true,
				"showRaid", true,
				"showPlayer", true,
				"groupFilter", "1,2,3,4,5,6,7,8",
				"groupingOrder", "1,2,3,4,5,6,7,8",
				"xoffset", (C["Raid"]["HorSpacing"]),
				"point", "LEFT",
				"maxColumns", math.ceil(40/5),
				"unitsPerColumn", C["Raid"].Raid40MaxUnitPerColumn,
				"columnSpacing", (C["Raid"]["VerSpacing"]),
				"columnAnchorPoint", "TOP"
		end
	end
end