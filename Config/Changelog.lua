------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 10-01-2023
------------------------------------------------------------------------------------------

-- CHANGELOG for Extended GUI

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local GUI = T["GUI"]

-- MaxUI Welcome
T.version = GetAddOnMetadata("Tukui", "Version")
T.MaxUIversion = GetAddOnMetadata("MaxUI", "Version")
local MaxUIVersion = "|cffFFFF99version:|r "..T.MaxUIversion..""
local TukuiVersion = "|cffFFFF99version:|r "..T.version..""

------------------------------------------------------------------------------------------
-- CHANGELOG WINDOW
------------------------------------------------------------------------------------------
local MaxUIChangelog = function(self)
	local Window = self:CreateWindow("Changelog")

	-- adjust windowheight
	self.WindowCount = self.WindowCount -1

	Window:CreateWindowLogo("All", "|cffFFFF99Changelog|r")
	Window:CreateSpacer("All", 2)
	Window:CreateSpacer("All", 3)
	Window:CreateSpacer("All", 4)
	Window:CreateSpacer("All", 5)
	Window:CreateExplanationText("All", 6, "Shortened information about changes made in this version.")
	Window:CreateSpacer("All", 7)
	
	Window:CreateSection("All", "MAXUI")
	Window:CreateTextLine("All", "|cffFFFF99VERSION AND  CLIENT:|r")
	Window:CreateTextLine("All", "|cffFFFF99Previous version:|r 6.608")
	Window:CreateSpacerNoPos("All")
	Window:CreateTextLine("All", "|cffFFFF99ALL: changes apply to all clients, Retail, WotLK, Classic")
	Window:CreateTextLine("All", "|cffFFFF99RETAIL: changes apply to Dragonflight")
	Window:CreateTextLine("All", "|cffFFFF99WOTLK: changes apply to the Wrath of the Lich King version")
	Window:CreateTextLine("All", "|cffFFFF99CLASSIC: changes apply to the Classic and Season of Mastery version")
	Window:CreateSpacerNoPos("All")
	Window:CreateTextLine("All", "|cffFFFF99HOW TO REPORT BUGS:|r")
	Window:CreateTextLine("All", "|cffFFFF99Report an error on the MaxUI Discord, create a post|r")
	Window:CreateTextLine("All", "|cffFFFF99with a screenshot and a textmessage of the lua error.|r")
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "MaxUI 6.700")
	Window:CreateTextLine("All", "TUKUI 20.36/37")
	Window:CreateTextLine("All", "- WOTLK: updated, matched or fixed bugs for Tukui 20.37")
	Window:CreateTextLine("All", "GUI")
	Window:CreateTextLine("All", "- ALL: Reworked all kinds of elements for the complete GUI. Skinning, button order, ...")
	Window:CreateTextLine("All", "ACTIONBARS")
	Window:CreateTextLine("All", "- ALL: incorporated Tukui ab 6 7 8 options.")
	Window:CreateTextLine("All", "- ALL: hiding blizzard stancebar when disabling MaxUI/Tukui stancebar.")
	Window:CreateTextLine("All", "LOOT")
	Window:CreateTextLine("All", "- ALL: added skinning options for Grouploot.")
	Window:CreateTextLine("All", "- ALL: adjusted tukui lootframe slightly when filters are on.")
	Window:CreateTextLine("All", "FILTERS")
	Window:CreateTextLine("All", "- ALL: added seperate Filters section.")
	Window:CreateTextLine("All", "SKINS")
	Window:CreateTextLine("All", "- RETAIL: started own skinnning module instead of ADDONSKINS, too many bugs for AS.")
	Window:CreateTextLine("All", "- 2 types of MaxUI skinning modules, Blizzard frames, MaxUI supported Addons")
	Window:CreateTextLine("All", "- Skinned addons: Immersion, Simluationcraft, Bugsack, ...")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "MaxUI 6.608")
	Window:CreateTextLine("All", "TUKUI")
	Window:CreateTextLine("All", "- checked all minor changes and matched them.")
	Window:CreateTextLine("All", "ACTIONBARS")
	Window:CreateTextLine("All", "- checked AB1 code and default loadouts.")
	Window:CreateTextLine("All", "- checked and matched Tukui changes.")
	Window:CreateTextLine("All", "INVENTORY/BAGS")
	Window:CreateTextLine("All", "- adjusted the bags and bank code to match tukui")
	Window:CreateTextLine("All", "- reanchored the standalone reagent bag and gave it a header.")
	Window:CreateSpacerNoPos("All")
	
	Window:CreateSection("All", "MaxUI 6.607")
	Window:CreateTextLine("All", "CHAT")
	Window:CreateTextLine("All", "- Fixed chat anchoring and resetting/installing.")
	Window:CreateTextLine("All", "ACTIONBARS")
	Window:CreateTextLine("All", "- Matched the Tukui changes to stancebar, seems to be working,")
	Window:CreateTextLine("All", "also vertical layout usable again.")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "MaxUI 6.606")
	Window:CreateTextLine("All", "SKINS")
	Window:CreateTextLine("All", "- AddonSkins support needs to be redone, not been able to that, work in progress.")
	Window:CreateTextLine("All", "- Some popups have MaxUI styled buttons and headers, still work in progress.")
	Window:CreateTextLine("All", "ACTIONBARS")
	Window:CreateTextLine("All", "- matched some code changes to get the MaxUI look back for buttons and backdrops.")
	Window:CreateTextLine("All", "- Stancebar vertical layout not working atm.")
	Window:CreateTextLine("All", "UNITFRAMES")
	Window:CreateTextLine("All", "- Working on a colored staged overlay for empowered castbars, not yet available.")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "MaxUI 6.604-6.605")
	Window:CreateTextLine("All", "UNITFRAMES")
	Window:CreateTextLine("All", "- Buffs and Debuffs only self created seems to work again,")
	Window:CreateTextLine("All", "thanks Tukz for all the hard work")
	Window:CreateTextLine("All", "- Evoker class power Essence adjusted to MaxUI options.")
	Window:CreateTextLine("All", "- Evoker art added")
	Window:CreateTextLine("All", "- Evoker empowered casting now working. click once to start the cast,")
	Window:CreateTextLine("All", "click again to release, the castbar showing stages, referencing")
	Window:CreateTextLine("All", "not empowered, stage 1, stage 2, stage 3, stage 4.")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "MaxUI 6.603")
	Window:CreateTextLine("All", "UNITFRAMES")
	Window:CreateTextLine("All", "- Buffs and Debuffs Remaining Time, Count now customizable again,")
	Window:CreateTextLine("All", "with a whole new set of options, for position, color, alignment,")
	Window:CreateTextLine("All", "check the Unitfr. All section, Buffs and Debuffs.")
	Window:CreateSpacerNoPos("All")
	Window:CreateTextLine("All", "ACTIONBARS")
	Window:CreateTextLine("All", "- Split the actionbars sections in two, now ")
	Window:CreateTextLine("All", "Actionbars* = general settings and Actionbars** = individual bars.")
	Window:CreateTextLine("All", "- Stancebar and Petbar fixes.")
	Window:CreateTextLine("All", "- Added options for customizing COUNT, HOTKEY, MACRO/NAME and COOLDOWN")
	Window:CreateTextLine("All", "texts on actionbars. Similar to the REMAINING TIME and COUNT for buffs/debuffs.")
	Window:CreateSpacerNoPos("All")
	Window:CreateTextLine("All", "MINIMAP")
	Window:CreateTextLine("All", "- Removed tracking button, rightclick the map.")
	Window:CreateTextLine("All", "- Mail icon in color now in the topright corner.")
	Window:CreateSpacerNoPos("All")
	Window:CreateTextLine("All", "AURAS")
	Window:CreateTextLine("All", "- Added same text customization options for the ")
	Window:CreateTextLine("All", "COUNT and DURATION on the central AURAS.")
	Window:CreateSpacerNoPos("All")

	Window:CreateSection("All", "MaxUI 6.600")
	Window:CreateTextLine("All", "GENERAL")
	Window:CreateTextLine("All", "- added a changelog section in game (for more info check Discord).")
	Window:CreateTextLine("All", "- added an option to set screen spacing for bottom/toppanels in general section.")
	Window:CreateTextLine("All", "- moved filter options from Skins to general section.")
	Window:CreateTextLine("All", "- added filter options for almost every element.")
	Window:CreateTextLine("All", "- more customization options with new filter settings.")
	Window:CreateTextLine("All", "- added some textures to the texture dropdowns.")
	Window:CreateTextLine("All", "- changed expansion art backdrop code now showing current expansion.")
	Window:CreateTextLine("All", "- added WotLK Classic.")
	Window:CreateSpacerNoPos("All")
	Window:CreateTextLine("All", "AURAS")
	Window:CreateTextLine("All", "- added scaling option for the buffs and debuffs (Auras) bartimer.")
	Window:CreateSpacerNoPos("All")
	Window:CreateTextLine("All", "BAGS")
	Window:CreateTextLine("All", "- added textures and filters to most button elements for bank and bag.")
	Window:CreateSpacerNoPos("All")
	Window:CreateTextLine("All", "CHAT")
	Window:CreateTextLine("All", "- added an option to unlink the chat input panel, making it movable/placable.")
	Window:CreateSpacerNoPos("All")
	Window:CreateTextLine("All", "DATABARS")
	Window:CreateTextLine("All", "- moved threat, mirror, alternative power to the databars sections.")
	Window:CreateSpacerNoPos("All")
	Window:CreateTextLine("All", "DATATEXTS")
	Window:CreateTextLine("All", "- added mouseover coloring when selecting a dt input field.")
	Window:CreateTextLine("All", "- Changed the battleground statistics panel/datatext, now below minimap")
	Window:CreateSpacerNoPos("All")
	Window:CreateTextLine("All", "LOOT")
	Window:CreateTextLine("All", "- added a header and filters for the loot window.")
	Window:CreateSpacerNoPos("All")
	Window:CreateTextLine("All", "MAPS")
	Window:CreateTextLine("All", "- Adjusted some of the elements on the minimap, matching style and mouseover.")
	Window:CreateSpacerNoPos("All")
	Window:CreateTextLine("All", "MISC")
	Window:CreateTextLine("All", "- Adjusted the tukui micromenu versions to match MaxUI style.")
	Window:CreateSpacerNoPos("All")
	Window:CreateTextLine("All", "NAMEPLATES")
	Window:CreateTextLine("All", "- slightly adjusted the castbar position and icon aligment.")
	Window:CreateSpacerNoPos("All")
	Window:CreateTextLine("All", "PARTY")
	Window:CreateTextLine("All", "- there is now an option for alignment, Left, Center, Right.")
	Window:CreateTextLine("All", "- castbar rewritten, extra options like Unlink")
	Window:CreateTextLine("All", "- buff and debuff setting added")
	Window:CreateTextLine("All", "- reanchored the part and partpet frames")
	Window:CreateTextLine("All", "- partypet frames have a scaling option and some elements hidden")
	Window:CreateSpacerNoPos("All")
	Window:CreateTextLine("All", "RAID")
	Window:CreateTextLine("All", "- there is now an option for orientation, Horizontal or Vertical.")
	Window:CreateTextLine("All", "- the MaxUI raidframes slightly changed, name below the power bar")
	Window:CreateTextLine("All", "- the MaxUI alternative raidframes are now part of the raidframe Style dropdown.")
	Window:CreateTextLine("All", "- the New MaxUI raidframes can be aligned left, center and right.")
	Window:CreateSpacerNoPos("All")
	Window:CreateTextLine("All", "UNITFRAMES")
	Window:CreateTextLine("All", "- reworked and reorganised code Player, Target, ToT and Pet UF's.")
	Window:CreateTextLine("All", "- added a portrait option for vertical frames, now named outside instead of side.")
	Window:CreateTextLine("All", "- reworked and reorganised code Focus and Focus Target, Boss and Arena UF's.")
	Window:CreateTextLine("All", "- added portrait styles, buff/debuff options and castbar settings.")
	Window:CreateTextLine("All", "- minor changes to name and other elements anchoring.")
	Window:CreateTextLine("All", "- portrait settings adjusted.")
	Window:CreateTextLine("All", "- cast bar unlink option.")
	Window:CreateTextLine("All", "- buff and debuff setting added")
	Window:CreateSpacerNoPos("All")
end
GUI:AddWidgets(MaxUIChangelog)