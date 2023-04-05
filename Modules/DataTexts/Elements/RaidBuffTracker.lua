------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

--setting up RAID Buff Tracker.

-- to do:
-- tooltip on mousover, HOW DO WE GET THE ACTUAL TOOLTIP TO SHOW FOR THE CORRESPONDING ICON/BUFF????
-- check spell ID's for list

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local DataText = T["DataTexts"]
local Movers = T["Movers"]
local RaidBuffs = CreateFrame("Frame")

------------------------------------------------------------------------------------------
-- RAIDBUFFTRACKER - Basic Frame
------------------------------------------------------------------------------------------
local function CreateRaidBuffsFrame()
	local buttonsize = C["General"]["ButtonSize"]
	local spacing = 3

	local RBTFrame = CreateFrame("Frame", "RBTFrame", UIParent)
	RBTFrame:SkinMaxUIFrame()
	RBTFrame:SetWidth(buttonsize*5 + spacing*6)
	RBTFrame:SetHeight((buttonsize*3) + (spacing*4))

	if C["Location"]["Position"]["Value"] == "Topleft" then
		RBTFrame:SetPoint("TOPLEFT", Minimap, "TOPRIGHT", 8, -24)
	elseif C["Location"]["Position"]["Value"] == "Center" then
		RBTFrame:SetPoint("TOP", Minimap, "BOTTOM", 0, -24)
	elseif C["Location"]["Position"]["Value"] == "Bottom" then
		RBTFrame:SetPoint("BOTTOM", Minimap, "TOP", 0, 24)
	else
		RBTFrame:SetPoint("TOPRIGHT", Minimap, "TOPLEFT", -8, -24)
	end	
	RBTFrame:SetFrameLevel(1)
	RBTFrame:SetFrameStrata("HIGH")
	RBTFrame:Hide()
	RBTFrame:SetAlpha(0)
	RBTFrame:CreateMaxUIHeader("Raid Buffs")
	RBTFrame:CreateMaxUICloseButton(RBTFrame.MaxUIHeader)

	Movers:RegisterFrame(RBTFrame, "Buff Tracker")

	-- tooltip Anchor
	RBTFrameAnchor = RBTFrame.MaxUIHeader
end

local function CreateRaidBuffsSpellList()

	if T.Retail then 
		-- Spell Buff type 1 - Deathknight
		Spell1Buff	 = { 
			61999,				-- Raise Ally, battle res
		}

		-- Spell Buff type 2 - Demon Hunter
		Spell2Buff	 = { 
			1490,				-- Chaos Brand
		}

		-- Spell Buff type 3 - Druid
		Spell3Buff	 = { 
			50769,				-- Revive, battle res
		}

		-- Spell Buff type 4 - Hunter
		Spell4Buff	 = { 
			00000,				-- Aspect of the Pack
			34477,				-- misdirection on you
		}

		-- Spell Buff type 5 - Mage
		Spell5Buff	 = { 
			158201,				-- War-Scroll of Intellect
			1459,				-- Arcane Intellect
		}

		-- Spell Buff type 6 - Monk
		Spell6Buff	 = { 
			8647,				-- Mystic Touch
		}

		-- Spell Buff type 7 - Paladin
		Spell7Buff	 = { 
			203538,				-- Greater Blessing of Kings
			203539,				-- Greater Blessing of Wisdom
		}

		-- Spell Buff type 8 - Priest
		Spell8Buff	 = { 
			21562,				-- Power Word: Fortitude
		}

		-- Spell Buff type 9 - Rogue
		Spell9Buff	 = { 
			00000,				-- Expose Armor
			57934, 				-- Tricks of the Trade
		}

		-- Spell Buff type 10 - Shaman
		Spell10Buff	 = { 
			80353,				-- Time Warp
			32182,				-- Heroïsm
		}

		-- Spell Buff type 11 - Warlock
		Spell11Buff	 = { 
			20707,				-- Soulstone on me
		}

		-- Spell Buff type 12 - Warrior
		Spell12Buff	 = { 
			158202,				-- War Scroll of Battle Shout
			6673,				-- Battle Shout
		}
		
		-- Spell Buff type 13 - Flask/Elixir
		Spell13Buff	 = { 		
			-- LEVEL 90 FLASKS --
			105617,				-- Alchemist's Flask (75525) Agility, Strength, or Intellect
			105689,				-- Flask of Spring Blossoms (76084)
			105691,				-- Flask of the Warm Sun (76085)
			105693,				-- Flask of Falling Leaves (76086)
			105694,				-- Flask of the Earth (76087)
			105696,				-- Flask of Winter's Bite (76088)
			127230,				-- Crystal of Insanity (86569)

			-- LEVEL 100 FLASKS --
			156079,     		-- Greater Draenic Intellect Flask (109155)
			156070,				-- Draenic Intellect Flask (109147)
			156064,				-- Greater Draenic Agility Flask (109153)
			156071,				-- Draenic Strength Flask (109148)
			156073,				-- Draenic Agility Flask (109145)
			156077,				-- Draenic Stamina Flask (109152)
			156080,				-- Greater Draenic Strength Flask (109156)
			156084,				-- Greater Draenic Stamina Flask (109160)
			176151,    			-- Crystal of Insanity (127230)
			
			-- LEVEL 110 FLASKS --
			188034,				-- flask of the countless armies (1300 str)					
			188035,				-- flask of the thousand Scars (1950 Sta)					
			188033,				-- flask of the Seventh Demon (1300 agi)					
			188031,				-- flask of the Whispered Pact (1300 int)					
			242551,				-- Fel Focus Str, Agi and Int +500, stam + 750
			
			-- battle elixirs 
			105682,				-- Mad Hozen Elixir (76076)  Battle
			105683,				-- Elixir of Weaponry (76077)  Battle
			105684,				-- Elixir of the Rapids (76078)  Battle
			105685,				-- Elixir of Peace (76079)  Battle
			105686,				-- Elixir of Perfection (76080)  Battle
			105688,				-- Monk's Elixir (76083)  Battle
			-- guardian elixirs
			105681,				-- Mantid Elixir (76075)  Guardian
			105687,				-- Elixir of Mirrors (76081)  Guardian
			
			105694,				-- Flask of the Earth (76087) (DEFAULT)
			
			-- LEVEL 120 FLASKS -- 
			251839, 			-- Flask of the Undertow (Cauldron)
			
		}
		
		-- Spell Buff type 14 - Food / Well Fed
		Spell14Buff	 = {
		-- Level 90
			146804,		-- Fluffy Silkfeather Omelet (101750)
			104272,		-- Black Pepper Ribs and Shrimp (74646)
			104271,		-- Eternal Blossom Fish (74645)
			104267,		-- Charbroiled Tiger Steak (74642)
			
			146805,		-- Seasoned Pomfruit Slices (101746)
			104275,		-- Sea Mist Rice Noodles (74648)
			104274,		-- Valley Stir Fry (74647)
			104273,		-- Sauteed Carrots (74643)
			
			146806,		-- Spiced Blossom Soup (101748)
			104277,		-- Mogu Fish Stew (74650)
			104276,		-- Braised Turtle (74649)
			104264,		-- Swirling Mist Soup (74644)
			
			146807,		-- Farmer's Delight (101747)
			104280,		-- Steamed Crab Surprise (74653)
			104279,		-- Fire Spirit Salmon (74652)
			104278,		-- Shrimp Dumplings (74651)
			
			104283,		-- Chun Tian Spring Rolls (74656)
			146808,		-- Stuffed Lushrooms (101749)
			104282,		-- Twin Fish Platter (74655)
			104281,		-- Wildfowl Roast (74654)
			111840,		-- Half a Lovely Apple (79320)
			
			124219,		-- Pearl Milk Tea (81414)
			146809,		-- Mango Ice (101745)
			124219,		-- Hot Papaya Milk (105721)
			124219,		-- Dented Can of Kaja'Cola (98127)
			124219,		-- Grilled Dinosaur Haunch (94535)
			124213,		-- Roasted Barley Tea (81406)
			131828,		-- Mah's Warm Yak-Tail Stew (90457)
			
			125113,		-- Spicy Salmon (86073)
			125106,		-- Wildfowl Ginseng Soup (86070)
			124221,		-- Peanut Pork Chops (105723)
			124221,		-- Skewered Peanut Chicken (81413)
			124221,		-- Mechanopeep Foie Gras (98126)
			124221,		-- Spicy Mushan Noodles (104342)
			124215,		-- Boiled Silkworm Pupa (81405)
			
			125115,		-- Spicy Vegetable Chips (86074)
			125108,		-- Rice Pudding (86069)
			124216,		-- Red Bean Bun (81408)
			124210,		-- Pounded Rice Cake (81400)
			
			124220,		-- Blanched Needle Mushrooms (81412)
			124220,		-- Shaved Zangar Truffles (98125)
			124220,		-- Crazy Snake Noodles (104340)
			124220,		-- Rice-Wine Mushrooms (105717)
			124214,		-- Dried Needle Mushrooms (81404)
			
			125071,		-- Peach Pie (81411)
			125071,		-- Candied Apple (105720)
			125071,		-- Bloodberry Tart (98124)
			125071,		-- Harmonious River Noodles (104339)
			125070,		-- Dried Peaches (81403)
			
			124218,		-- Brew-Curried Whitefish (105719)
			124218,		-- Green Curry Fish (81410)
			124218,		-- Lucky Mushroom Noodles (104344)
			124218,		-- Whale Shark Caviar (98123)
			124212,		-- Toasted Fish Jerky (81402)
			
			124217,		-- Steaming Goat Noodles (104341)
			124217,		-- Camembert du Clefthoof (98122)
			124216,		-- Nutty Brew-Bun (105722)
			124217,		-- Tangy Yogurt (81409)
			124216,		-- Golden Dragon Noodles (104343)
			124217,		-- Fried Cheese Dumplings (105724)
			124211,		-- Yak Cheese Curds (81401)
						
			-- Level 100
			174077,		-- Perfect Fuzzy Pear (118274)
			160897,		-- Sleeper Surprise (111452)
			160793,		-- Fuzzy Pear (118268)
			160793,		-- Braised Riverbeast (111436)
			160793,		-- Fat Sleeper Cakes (111444)
			
			160893,		-- Frosty Stew (111450)
			174079,		-- Perfect O'ruk Orange (118273)
			160726,		-- Pan-Seared Talbuk (111434)
			160726,		-- O'ruk Orange (118270)
			160726,		-- Sturgeon Stew (111442)
			
			160883,		-- Hearty Elekk Steak (111431)
			160600,		-- Steamed Scorpion (111439)
			
			160889,		-- Blackrock Barbecue (111449)
			174062,		-- Perfect Nagrand Cherry (118275)
			160724,		-- Blackrock Ham (111433)
			160724,		-- Giant Nagrand Cherry (118272)
			160724,		-- Grilled Gulper (111441)
			
			160900,		-- Calamari Crepes (111453)
			174080,		-- Perfect Greenskin Apple (118276)
			160832,		-- Greenskin Apple (118269)
			160832,		-- Rylak Crepes (111437)
			160832,		-- Fiery Calamari (111445)
			
			160902,		-- Gorgrond Chowder (111454)
			177931,		-- Pre-Mixed Pot of Noodles (120168)
			174078,		-- Perfect Ironpeel Plantain (118277)
			160839,		-- Ironpeel Plantain (118271)
			160839,		-- Clefthoof Sausages (111438)
			160839,		-- Skulker Chowder (111446)		
			
			174551,		-- Fish Roe (118416)
			174707,		-- Legion Chili (118428)
			175215,		-- Savage Feast (118576)
			160740,		-- Feast of Blood (111457)
			160914,		-- Feast of the Waters (111458)
			178398,		-- Lukewarm Yak Roast Broth (120293)
			
			-- LEVEL 110 -- 
			-- 225 stats
			201223,		-- Critical
			201330,		-- Haste
			201332,		-- Mastery
			201336,		-- Versatility
			201334,		-- Pepper
			
			-- 300 stats
			225597,		-- Critical Leybeque Ribs
			225598,		-- Haste Suramar Surf And Turf
			225599,		-- Mastery Barracuda Mrglgagh
			225600,		-- Versatility Koi-Scented Stormray
			225601,		-- Pepper
			
			-- 375 stats
			225602,		-- Critical
			225603,		-- Haste
			225604,		-- Mastery
			225605,		-- Versatility
			225606,		-- Pepper
			
			
			-- LEVEL 120 --
			-- 55 stats
			257410, 		-- Critical
							-- Mastery
							-- Haste
							-- Versatility
							--
		}

		-- Spell Buff type 15 - Augmentation Rune
		Spell15Buff = { 
			175439, 		-- Stout (50 str)
			175456,			--	Hyper (50 agi)
			175457,			-- Focus (50 int)
			224001,			-- Defiled Augumentation (325 primary stat)
			270058,			-- Battle Scared Augmentation
		}
		
	else -- CLASSIC / TBC Buffs

		-- Spell Buff type 1 - Stamina
		Spell1Buff	 = { 
			1243,		-- Power:Word: Fortitude (Priest) rank 1

			21562,		-- Prayer of Fortitude (Priest) rank 1
			21564,		-- Prayer of Fortitude (Priest) rank 2
		}

		-- Spell Buff type 2 - Intellect
		Spell2Buff	 = { 
			1459,		-- Arcane Intellect (1)
			23028,		-- Arcane Brilliance (all)
		}

		-- Spell Buff type 3 - Spirit
		Spell3Buff	 = { 
			27681,		-- Prayer of Spirit (Priest)
			14818,		-- Divine Spirit (Priest)
		}

		-- Spell Buff type 4 - All Stats
		Spell4Buff	 = { 
			1126,		-- Mark of the Wild (Druid), rank 1
			21849,		-- Gift/Mark of the Wild (Druid), rank 1
			21850,		-- Gift/Mark of the Wild (Druid), rank 2
		}


		-- Spell Buff type 5 - Melee Attack Power
		Spell5Buff	 = { 
			6673,		-- Battle Shout rank 1
			5242,		-- Battle Shout rank 2
			6192,		-- Battle Shout rank 3
			11549,		-- Battle Shout rank 4
			11550,		-- Battle Shout rank 5
			11551,		-- Battle Shout rank 6
			25289,		-- Battle Shout rank 7

		}

		-- Spell Buff type 6 - Blessings (Paladin)
		Spell6Buff	 = { 
			19742,		-- Blessing of Wisdom, rank 1
			19850,		-- Blessing of Wisdom, rank 2
			19852,		-- Blessing of Wisdom, rank 3
			19853,		-- Blessing of Wisdom, rank 4
			19854,		-- Blessing of Wisdom, rank 5
			25290,		-- Blessing of Wisdom, rank 6
			25894,		-- Greater Blessing of Wisdom, rank 1
			25918,		-- Greater Blessing of Wisdom, rank 2
			
			20217,		-- Blessing of Kings
			25898,		-- Greater Blessing of Kings
			
			19740,		-- Blessing of Might rank 1
			19834,		-- Blessing of Might rank 2
			19835,		-- Blessing of Might rank 3
			19836,		-- Blessing of Might rank 4
			19837,		-- Blessing of Might rank 5
			19838,		-- Blessing of Might rank 6
			25291,		-- Blessing of Might rank 7
			25782,		-- Greater Blessing of Might rank 1
			25916,		-- Greater Blessing of Might rank 2

			20911,		-- 20911 of Sanctuary rank 1
			20912,		-- Blessing of Sanctuary rank 2
			20913,		-- Blessing of Sanctuary rank 3
			20914,		-- Blessing of Sanctuary rank 4
			25899,		-- Greater Blessing of Sanctuary
			
			1038,		-- Blessing of Salvation
			25895,		-- Greater Blessing of Salvation
		}

		-- Spell Buff type 7 - Auras (Paladin)
		Spell7Buff	 = { 
			465,		-- Devotion Aura, rank 1
			10290,		-- Devotion Aura, rank 2
			643,		-- Devotion Aura, rank 3
			10291,		-- Devotion Aura, rank 4
			1032,		-- Devotion Aura, rank 5
			10292,		-- Devotion Aura, rank 6
			10293,		-- Devotion Aura, rank 7
			
			7294,		-- Retribution Aura, rank 1
			7296,		-- Retribution Aura, rank 1
			10298,		-- Retribution Aura, rank 2
			10299,		-- Retribution Aura, rank 3
			10300,		-- Retribution Aura, rank 4
			10301,		-- Retribution Aura, rank 5

			19891,		-- Fire Resistance Aura, rank 1
			19899,		-- Fire Resistance Aura, rank 2
			19900,		-- Fire Resistance Aura, rank 3

			19888,		-- Frost Resistance Aura, rank 1
			19897,		-- Frost Resistance Aura, rank 2
			19898,		-- Frost Resistance Aura, rank 3

			19876,		-- Shadow Resistance Aura, rank 1
			19895,		-- Shadow Resistance Aura, rank 2
			19896,		-- Shadow Resistance Aura, rank 3
		}

		-- Spell Buff type 8 - Resistances
		Spell8Buff	 = { 
			24488,		-- Prayer of Shadow Resistance 1
			24490,		-- Prayer of Shadow Resistance 1
			24505,		-- Prayer of Shadow Resistance 2
			24514,		-- Prayer of Shadow Resistance 2
			24506,		-- Prayer of Shadow Resistance 3
			24515,		-- Prayer of Shadow Resistance 3
			24507,		-- Prayer of Shadow Resistance 4
			24516,		-- Prayer of Shadow Resistance 4
		}

		-- Spell Buff type 9 - True Shot Aura
		Spell9Buff	 = { 
			19506,		-- Trueshot Aura (Hunter talent). rank 1
			20905,		-- Trueshot Aura (Hunter Talent), rank 2
			20906,		-- Trueshot Aura (Hunter Talent), rank 3

		}

		-- Spell Buff type 10 - Leader of the Pack, Crit increase
		Spell10Buff	 = { 
			17007,		-- Leader of the Pack, crit increase, feral druid.
			24858,		-- Moonkin Aura, increased spell crit.
		}

		-- Spell Buff type 11 - Hunter Pets
		Spell11Buff	 = { 
			24604,		-- Furious Howl rank 1
			24608,		-- Furious Howl rank 1
			24605,		-- Furious Howl rank 2
			24608,		-- Furious Howl rank 2
			24603,		-- Furious Howl rank 3
			24607,		-- Furious Howl rank 3
			24597,		-- Furious Howl rank 4
			24599,		-- Furious Howl rank 4
		}

		-- Spell Buff type 12 - Other Pets
		Spell12Buff	 = { 
			6307,		-- Blood Pact (warlock pet), rank 1
			7804,		-- Blood Pact (warlock pet), rank 2
			7805,		-- Blood Pact (warlock pet), rank 3
			11766,		-- Blood Pact (warlock pet), rank 4
			11767,		-- Blood Pact (warlock pet), rank 5
		}
		
		-- Spell Buff type 13 - 
		Spell13Buff	 = { 		
			
		}
		
		-- Spell Buff type 14 - Hunter Pets
		Spell14Buff	 = {

		}

		-- Spell Buff type 15 - other Pets
		Spell15Buff = { 

		}

		-- Spell Buff type 16
		Spell16Buff	 = { 
			0,			-- Black Backdrop for now
		}

		-- Spell Buff type 17 - Food
		Spell17Buff	 = { 
			0,			-- Black Backdrop for now
		}
		
		-- Spell Buff type 18 - Potions
		Spell18Buff	 = { 		
			0,			-- Black Backdrop for now
		}
		
		-- Spell Buff type 19 - Elixirs
		Spell19Buff	 = {
			9187,		-- Elixir of Greater Agility
			8951,		-- Elixir of Greater Defense
			21546,		-- Elixir of Greater Firepower
			9179,		-- Elixir of Greater Intellect
			9187,		-- Elixir of Greater Agility
			13452,		-- Elixir of the Mongoose
			20007,		-- Mageblood Potion
			3825,		-- Elixir of Fortitude
			20004,		-- Major Troll's Blood Potion
			13445,		-- Elixir of Superior Defense
			0,			-- Black Backdrop for now
		}

		-- Spell Buff type 20 - Flasks
		Spell20Buff = { 
			13506,		-- Flask of Petrification
			13510,		-- Flask of the Titans, 1200 Health
			13511,		-- Flask of Distilled Wisdom
			13512,		-- Flask of Supreme Power
			13513,		-- Flask of Chromatic Resistance
			0,			-- Black Backdrop for now
		}
	end
end

local function SetSpells()
	local function OnAuraChange(self, event, arg1)
		if event == "UNIT_AURA" and arg1 ~= "player" then 
			return
		end

		-- spellframe 1
		for i, Spell1Buff in pairs(Spell1Buff) do
			local spellname = select(1, GetSpellInfo(Spell1Buff))
			if AuraUtil.FindAuraByName(spellname, "player") then
				Spell1Frame.icon:SetAlpha(1)
				Spell1Frame.icon:SetTexture(select(3, GetSpellInfo(Spell1Buff)))
				Spell1Frame.id = Spell1Buff
				break
			else
				Spell1Frame.icon:SetAlpha(0.3)
				Spell1Frame.icon:SetTexture(select(3, GetSpellInfo(Spell1Buff)))
			end
			Spell1Frame.id = Spell1Buff
		end	

		-- spellframe 2
		for i, Spell2Buff in pairs(Spell2Buff) do
			local spellname = select(1, GetSpellInfo(Spell2Buff))
			if AuraUtil.FindAuraByName(spellname, "player") then
				Spell2Frame.icon:SetAlpha(1)
				Spell2Frame.icon:SetTexture(select(3, GetSpellInfo(Spell2Buff)))
				Spell2Frame.id = Spell2Buff
				break
			else
				Spell2Frame.icon:SetAlpha(0.3)
				Spell2Frame.icon:SetTexture(select(3, GetSpellInfo(Spell2Buff)))
			end
			Spell2Frame.id = Spell2Buff
		end	

		-- spellframe 3
		for i, Spell3Buff in pairs(Spell3Buff) do
			local spellname = select(1, GetSpellInfo(Spell3Buff))
			if AuraUtil.FindAuraByName(spellname, "player") then
				Spell3Frame.icon:SetAlpha(1)
				Spell3Frame.icon:SetTexture(select(3, GetSpellInfo(Spell3Buff)))
				Spell3Frame.id = Spell3Buff
				break
			else
				Spell3Frame.icon:SetAlpha(0.3)
				Spell3Frame.icon:SetTexture(select(3, GetSpellInfo(Spell3Buff)))
			end
			Spell3Frame.id = Spell3Buff
		end	

		-- spellframe 4
		for i, Spell4Buff in pairs(Spell4Buff) do
			local spellname = select(1, GetSpellInfo(Spell4Buff))
			if AuraUtil.FindAuraByName(spellname, "player") then
				Spell4Frame.icon:SetAlpha(1)
				Spell4Frame.icon:SetTexture(select(3, GetSpellInfo(Spell4Buff)))
				Spell4Frame.id = Spell4Buff
				break
			else
				Spell4Frame.icon:SetAlpha(0.3)
				Spell4Frame.icon:SetTexture(select(3, GetSpellInfo(Spell4Buff)))
			end
			Spell4Frame.id = Spell4Buff
		end	
	
		-- spellframe 9
		for i, Spell9Buff in pairs(Spell9Buff) do
			local spellname = select(1, GetSpellInfo(Spell9Buff))
			if AuraUtil.FindAuraByName(spellname, "player") then
				Spell9Frame.icon:SetAlpha(1)
				Spell9Frame.icon:SetTexture(select(3, GetSpellInfo(Spell9Buff)))
				Spell9Frame.id = Spell9Buff
				break
			else
				Spell9Frame.icon:SetAlpha(0.3)
				Spell9Frame.icon:SetTexture(select(3, GetSpellInfo(Spell9Buff)))
			end
			Spell9Frame.id = Spell9Buff
		end	

		-- spellframe 10
		for i, Spell10Buff in pairs(Spell10Buff) do
			local spellname = select(1, GetSpellInfo(Spell10Buff))
			if AuraUtil.FindAuraByName(spellname, "player") then
				Spell10Frame.icon:SetAlpha(1)
				Spell10Frame.icon:SetTexture(select(3, GetSpellInfo(Spell10Buff)))
				Spell10Frame.id = Spell10Buff
				break
			else
				Spell10Frame.icon:SetAlpha(0.3)
				Spell10Frame.icon:SetTexture(select(3, GetSpellInfo(Spell10Buff)))
			end
			Spell10Frame.id = Spell10Buff
		end	

		-- spellframe 11
		for i, Spell11Buff in pairs(Spell11Buff) do
			local spellname = select(1, GetSpellInfo(Spell11Buff))
			if AuraUtil.FindAuraByName(spellname, "player") then
				Spell11Frame.icon:SetAlpha(1)
				Spell11Frame.icon:SetTexture(select(3, GetSpellInfo(Spell11Buff)))
				Spell11Frame.id = Spell11Buff
				break
			else
				Spell11Frame.icon:SetAlpha(0.3)
				Spell11Frame.icon:SetTexture(select(3, GetSpellInfo(Spell11Buff)))
			end
			Spell11Frame.id = Spell11Buff
		end	
		
		-- spellframe 6
		for i, Spell6Buff in pairs(Spell6Buff) do
			local spellname = select(1, GetSpellInfo(Spell6Buff))
			if AuraUtil.FindAuraByName(spellname, "player") then
				Spell6Frame.icon:SetAlpha(1)
				Spell6Frame.icon:SetTexture(select(3, GetSpellInfo(Spell6Buff)))
				Spell6Frame.id = Spell6Buff
				break
			else
				Spell6Frame.icon:SetAlpha(0.3)
				Spell6Frame.icon:SetTexture(select(3, GetSpellInfo(Spell6Buff)))
			end
			Spell6Frame.id = Spell6Buff
		end	

		-- spellframe 7
		for i, Spell7Buff in pairs(Spell7Buff) do
			local spellname = select(1, GetSpellInfo(Spell7Buff))
			if AuraUtil.FindAuraByName(spellname, "player") then
				Spell7Frame.icon:SetAlpha(1)
				Spell7Frame.icon:SetTexture(select(3, GetSpellInfo(Spell7Buff)))
				Spell7Frame.id = Spell7Buff
				break
			else
				Spell7Frame.icon:SetAlpha(0.3)
				Spell7Frame.icon:SetTexture(select(3, GetSpellInfo(Spell7Buff)))
			end
			Spell7Frame.id = Spell7Buff
		end	
		
		-- spellframe 5
		for i, Spell5Buff in pairs(Spell5Buff) do
			local spellname = select(1, GetSpellInfo(Spell5Buff))
			if AuraUtil.FindAuraByName(spellname, "player") then
				Spell5Frame.icon:SetAlpha(1)
				Spell5Frame.icon:SetTexture(select(3, GetSpellInfo(Spell5Buff)))
				Spell5Frame.id = Spell5Buff
				break
			else
				Spell5Frame.icon:SetAlpha(0.3)
				Spell5Frame.icon:SetTexture(select(3, GetSpellInfo(Spell5Buff)))
			end
			Spell5Frame.id = Spell5Buff
		end	

		-- spellframe 8
		for i, Spell8Buff in pairs(Spell8Buff) do
			local spellname = select(1, GetSpellInfo(Spell8Buff))
			if AuraUtil.FindAuraByName(spellname, "player") then
				Spell8Frame.icon:SetAlpha(1)
				Spell8Frame.icon:SetTexture(select(3, GetSpellInfo(Spell8Buff)))
				Spell8Frame.id = Spell8Buff
				break
			else
				Spell8Frame.icon:SetAlpha(0.3)
				Spell8Frame.icon:SetTexture(select(3, GetSpellInfo(Spell8Buff)))
			end
			Spell8Frame.id = Spell8Buff
		end	

		-- spellframe 12
		for i, Spell12Buff in pairs(Spell12Buff) do
			local spellname = select(1, GetSpellInfo(Spell12Buff))
			if AuraUtil.FindAuraByName(spellname, "player") then
				Spell12Frame.icon:SetAlpha(1)
				Spell12Frame.icon:SetTexture(select(3, GetSpellInfo(Spell12Buff)))
				Spell12Frame.id = Spell12Buff
				break
			else
				Spell12Frame.icon:SetAlpha(0.3)
				Spell12Frame.icon:SetTexture(select(3, GetSpellInfo(Spell12Buff)))
			end
			Spell12Frame.id = Spell12Buff
		end	

		-- spellframe 13
		for i, Spell13Buff in pairs(Spell13Buff) do
			local spellname = select(1, GetSpellInfo(Spell13Buff))
			if AuraUtil.FindAuraByName(spellname, "player") then
				Spell13Frame.icon:SetAlpha(1)
				Spell13Frame.icon:SetTexture(select(3, GetSpellInfo(Spell13Buff)))
				Spell13Frame.id = Spell13Buff
				break
			else
				Spell13Frame.icon:SetAlpha(0.3)
				Spell13Frame.icon:SetTexture(select(3, GetSpellInfo(Spell13Buff)))
			end
			Spell13Frame.id = Spell13Buff
		end	

		-- spellframe 14
		for i, Spell14Buff in pairs(Spell14Buff) do
			local spellname = select(1, GetSpellInfo(Spell14Buff))
			if AuraUtil.FindAuraByName(spellname, "player") then
				Spell14Frame.icon:SetAlpha(1)
				Spell14Frame.icon:SetTexture(select(3, GetSpellInfo(Spell14Buff)))
				Spell14Frame.id = Spell14Buff
				break
			else
				Spell14Frame.icon:SetAlpha(0.3)
				Spell14Frame.icon:SetTexture(select(3, GetSpellInfo(Spell14Buff)))
			end
			Spell14Frame.id = Spell14Buff
		end	

		-- spellframe 15
		for i, Spell15Buff in pairs(Spell15Buff) do
			local spellname = select(1, GetSpellInfo(Spell15Buff))
			if AuraUtil.FindAuraByName(spellname, "player") then
				Spell15Frame.icon:SetAlpha(1)
				Spell15Frame.icon:SetTexture(select(3, GetSpellInfo(Spell15Buff)))
				Spell15Frame.id = Spell15Buff
				break
			else
				Spell15Frame.icon:SetAlpha(0.3)
				Spell15Frame.icon:SetTexture(select(3, GetSpellInfo(Spell15Buff)))
			end
			Spell15Frame.id = Spell15Buff
		end	
	end
		
	
	if T.Retail then
		RBTFrame:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
	end
	RBTFrame:RegisterEvent("UNIT_AURA", "player")
	RBTFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
	RBTFrame:SetScript("OnEvent", OnAuraChange)
end

local function CreateRaidBuffsButtons()
	local buttonsize = C["General"]["ButtonSize"]
	local spacing = 3

	-- Button 1  Deathknight
	RBTFrame.CreateMaxUIButton("Spell1Frame", RBTFrame, buttonsize, buttonsize, "", "", "", RBTFrameAnchor)
	Spell1Frame:SetPoint("TOPLEFT", RBTFrame, "TOPLEFT", spacing, -spacing)
	Spell1Frame.icon:SetTexture(Spell1Buff)
	if T.Retail then
		Spell1Frame.Backdrop:SetBackdropColor(0.77, 0.12, 0.23)
	end
	-- Button 2 - Demonhunter
	RBTFrame.CreateMaxUIButton("Spell2Frame", RBTFrame, buttonsize, buttonsize, "", "", "", RBTFrameAnchor)
	Spell2Frame:SetPoint("LEFT", Spell1Frame, "RIGHT", spacing, 0)
	Spell2Frame.icon:SetTexture(Spell2Buff)
	if T.Retail then
		Spell2Frame.Backdrop:SetBackdropColor(0.64, 0.19, 0.79)
	end
	
	-- Button 3 - Druid
	RBTFrame.CreateMaxUIButton("Spell3Frame", RBTFrame, buttonsize, buttonsize, "", "", "", RBTFrameAnchor)
	Spell3Frame:SetPoint("LEFT", Spell2Frame, "RIGHT", spacing, 0)
	Spell3Frame.icon:SetTexture(Spell3Buff)
	if T.Retail then
		Spell3Frame.Backdrop:SetBackdropColor(1.00, 0.49, 0.04)
	end
	
	-- Button 4 - Hunter
	RBTFrame.CreateMaxUIButton("Spell4Frame", RBTFrame, buttonsize, buttonsize, "", "", "", RBTFrameAnchor)
	Spell4Frame:SetPoint("LEFT", Spell3Frame, "RIGHT", spacing, 0)
	Spell4Frame.icon:SetTexture(Spell4Buff)
	if T.Retail then
		Spell4Frame.Backdrop:SetBackdropColor(0.67, 0.83, 0.45)
	end
	
	-- Button 5 - Mage
	RBTFrame.CreateMaxUIButton("Spell5Frame", RBTFrame, buttonsize, buttonsize, "", "", "", RBTFrameAnchor)
	Spell5Frame:SetPoint("LEFT", Spell4Frame, "RIGHT", spacing, 0)
	Spell5Frame.icon:SetTexture(Spell5Buff)
	if T.Retail then
		Spell5Frame.Backdrop:SetBackdropColor(0.41, 0.80, 0.94)
	end
	
	-- Button 6 - Monk
	RBTFrame.CreateMaxUIButton("Spell6Frame", RBTFrame, buttonsize, buttonsize, "", "", "", RBTFrameAnchor)
	Spell6Frame:SetPoint("TOPLEFT", Spell1Frame, "BOTTOMLEFT", 0, -spacing)
	Spell6Frame.icon:SetTexture(Spell6Buff)
	if T.Retail then
		Spell6Frame.Backdrop:SetBackdropColor(0.33, 0.54, 0.52)
	end
	
	-- Button 7 - Paladin
	RBTFrame.CreateMaxUIButton("Spell7Frame", RBTFrame, buttonsize, buttonsize, "", "", "", RBTFrameAnchor)
	Spell7Frame:SetPoint("LEFT", Spell6Frame, "RIGHT", spacing, 0)
	Spell7Frame.icon:SetTexture(Spell7Buff)
	if T.Retail then
		Spell7Frame.Backdrop:SetBackdropColor(0.96, 0.55, 0.73)
	end
	
	-- Button 8 - Priest
	RBTFrame.CreateMaxUIButton("Spell8Frame", RBTFrame, buttonsize, buttonsize, "", "", "", RBTFrameAnchor)
	Spell8Frame:SetPoint("LEFT", Spell7Frame, "RIGHT", spacing, 0)
	Spell8Frame.icon:SetTexture(Spell8Buff)
	if T.Retail then
		Spell8Frame.Backdrop:SetBackdropColor(1, 1, 1)
	end
	
	-- Button 9 - Rogue
	RBTFrame.CreateMaxUIButton("Spell9Frame", RBTFrame, buttonsize, buttonsize, "", "", "", RBTFrameAnchor)
	Spell9Frame:SetPoint("LEFT", Spell8Frame, "RIGHT", spacing, 0)
	Spell9Frame.icon:SetTexture(Spell9Buff)
	if T.Retail then
		Spell9Frame.Backdrop:SetBackdropColor(1, 0.96, 0.41)
	end
	
	-- Button 10 - Shaman
	RBTFrame.CreateMaxUIButton("Spell10Frame", RBTFrame, buttonsize, buttonsize, "", "", "", RBTFrameAnchor)
	Spell10Frame:SetPoint("LEFT", Spell9Frame, "RIGHT", spacing, 0)
	Spell10Frame.icon:SetTexture(Spell10Frame)
	if T.Retail then
		Spell10Frame.Backdrop:SetBackdropColor(0.00, 0.44, 0.67)
	end
	-- Button 11 - Warlock
	RBTFrame.CreateMaxUIButton("Spell11Frame", RBTFrame, buttonsize, buttonsize, "", "", "", RBTFrameAnchor)
	Spell11Frame:SetPoint("TOPLEFT", Spell6Frame, "BOTTOMLEFT", 0, -spacing)
	Spell11Frame.icon:SetTexture(Spell11Buff)
	if T.Retail then
		Spell11Frame.Backdrop:SetBackdropColor(0.58, 0.51, 0.79)
	end
	
	-- Button 12 - Warrior
	RBTFrame.CreateMaxUIButton("Spell12Frame", RBTFrame, buttonsize, buttonsize, "", "", "", RBTFrameAnchor)
	Spell12Frame:SetPoint("LEFT", Spell11Frame, "RIGHT", spacing, 0)
	Spell12Frame.icon:SetTexture(Spell12Buff)
	if T.Retail then
		Spell12Frame.Backdrop:SetBackdropColor(0.78, 0.61, 0.43)
	end
	
	-- Button 13 - Flask or Elixir
	RBTFrame.CreateMaxUIButton("Spell13Frame", RBTFrame, buttonsize, buttonsize, "", "", "", RBTFrameAnchor)
	Spell13Frame:SetPoint("LEFT", Spell12Frame, "RIGHT", spacing, 0)
	Spell13Frame.icon:SetTexture(Spell13Buff)
	
	-- Button 14 - Food
	RBTFrame.CreateMaxUIButton("Spell14Frame", RBTFrame, buttonsize, buttonsize, "", "", "", RBTFrameAnchor)
	Spell14Frame:SetPoint("LEFT", Spell13Frame, "RIGHT", spacing, 0)
	Spell14Frame.icon:SetTexture(Spell14Buff)
	
	-- Button 15 - Rune
	RBTFrame.CreateMaxUIButton("Spell15Frame", RBTFrame, buttonsize, buttonsize, "", "", "", RBTFrameAnchor)
	Spell15Frame:SetPoint("LEFT", Spell14Frame, "RIGHT", spacing, 0)
	Spell15Frame.icon:SetTexture(Spell15Buff)
end

function RaidBuffs:Enable()
	CreateRaidBuffsFrame()
	CreateRaidBuffsSpellList()
	SetSpells()
	CreateRaidBuffsButtons()	
end	

function RaidBuffs:OnEvent(event)
	if C["Tools"]["RaidBuffTracking"] == true then
		self:Enable()
	end
end

RaidBuffs:RegisterEvent("PLAYER_LOGIN")
RaidBuffs:SetScript("OnEvent", RaidBuffs.OnEvent)

DataText.RaidBuffs = RaidBuffs

------------------------------------------------------------------------------------------
-- RaidBuffs DATATEXT
------------------------------------------------------------------------------------------
local Update = function(self)
	if C["Tools"]["RaidBuffTracking"] == true then
		self.Text:SetFormattedText("%s", DataText.NameColor .. "Buff Tracker|r")

		if C["DataTexts"]["Icons"] == true then
			self.icon = self:CreateTexture(nil, "OVERLAY")
			self.icon:SetWidth(20)
			self.icon:SetHeight(20)
			self.icon:SetPoint("LEFT", self, "CENTER", 50, 1)
			self.icon:SetTexture([[Interface\AddOns\MaxUI\Medias\Icons\Menu\cBuffTracker.tga]])
			self.icon:SetVertexColor(unpack(C["DataTexts"].ValueColor))
		end
		
		self:SetParent(TopHorizontalLine)
		
		self:SetScript("OnEnter", function(self)
			self.Text:SetFormattedText("%s", DataText.HighlightColor .. "Buff Tracker|r")
			if C["DataTexts"]["Icons"] == true then
				self.icon:SetVertexColor(unpack(C["DataTexts"].HighlightColor))
			end	
			GameTooltip:SetOwner(self:GetTooltipAnchor())
			GameTooltip:AddLine("Buff Tracker:")
			GameTooltip:AddLine("Toggle the Buff Tracker ", 1, 1, 1, 1, 1, 1)
			GameTooltip:Show()
		end)
		
		self:SetScript("OnLeave", function(self)
			self.Text:SetFormattedText("%s", DataText.NameColor .. "Buff Tracker|r")
			if C["DataTexts"]["Icons"] == true then
				self.icon:SetVertexColor(unpack(C["DataTexts"].ValueColor))
			end	
			GameTooltip:Hide()
		end)
	end	
end

local OnMouseDown = function()
	if InCombatLockdown() then
		T.Print(ERR_NOT_IN_COMBAT)

		return
	end
	RBTFrame:fadeToggle()
end

local Enable = function(self)
	self:SetScript("OnMouseDown", OnMouseDown)
	self:Update()
end

local Disable = function(self)
	self:SetScript("OnMouseDown", nil)
	self:SetScript("OnMouseUp", nil)
end
DataText:Register("|cffFFFF99Buff Tracker|r", Enable, Disable, Update)