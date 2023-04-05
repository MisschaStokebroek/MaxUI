------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 30-10-2022
------------------------------------------------------------------------------------------

-- setting up Layouts.
-- need to add settings for ab 6 7 8 in different layouts....

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()

T.LoadActionBarLayouts = function()
	-- tukui
	if C["Layout"]["LayoutRole"]["Value"] == "Tukui" then
		C["ActionBars"]["Bar1ButtonsPerRow"] = 6
		C["ActionBars"]["Bar2ButtonsPerRow"] = 6
		C["ActionBars"]["Bar2NumButtons"] = 12
		C["ActionBars"]["Bar3ButtonsPerRow"] = 6
		C["ActionBars"]["Bar3NumButtons"] = 12
		C["ActionBars"]["Bar4ButtonsPerRow"] = 1
		C["ActionBars"]["Bar4NumButtons"] = 12
		C["ActionBars"]["Bar5ButtonsPerRow"] = 1
		C["ActionBars"]["Bar5NumButtons"] = 12

		C["ActionBars"]["ActionBar1ButtonSize"] = 32
		C["ActionBars"]["ActionBar2ButtonSize"] = 32
		C["ActionBars"]["ActionBar3ButtonSize"] = 32
		C["ActionBars"]["ActionBar4ButtonSize"] = 32
		C["ActionBars"]["ActionBar5ButtonSize"] = 32
		C["ActionBars"]["PetBarButtonSize"] = 32
		C["ActionBars"]["StanceBarButtonSize"] = 32

	-- melee or tank
	elseif (C["Layout"]["LayoutRole"]["Value"] == "Melee") or (C["Layout"]["LayoutRole"]["Value"] == "Tank") then 
		
		if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
			C["ActionBars"]["Bar1ButtonsPerRow"] = 4
			C["ActionBars"]["Bar2ButtonsPerRow"] = 4
			C["ActionBars"]["Bar2NumButtons"] = 12
			C["ActionBars"]["Bar3ButtonsPerRow"] = 4
			C["ActionBars"]["Bar3NumButtons"] = 12
			C["ActionBars"]["Bar4ButtonsPerRow"] = 4
			C["ActionBars"]["Bar4NumButtons"] = 12
			C["ActionBars"]["Bar5ButtonsPerRow"] = 4
			C["ActionBars"]["Bar5NumButtons"] = 12
			C["ActionBars"]["Bar6ButtonsPerRow"] = 4
			C["ActionBars"]["Bar6NumButtons"] = 12
			C["ActionBars"]["Bar7ButtonsPerRow"] = 4
			C["ActionBars"]["Bar7NumButtons"] = 12
			C["ActionBars"]["Bar8ButtonsPerRow"] = 12
			C["ActionBars"]["Bar8NumButtons"] = 12
		
		elseif C["Layout"]["LayoutAB"]["Value"] == "Single" then
			C["ActionBars"]["Bar1ButtonsPerRow"] = 4
			C["ActionBars"]["Bar2ButtonsPerRow"] = 6
			C["ActionBars"]["Bar2NumButtons"] = 12
			C["ActionBars"]["Bar3ButtonsPerRow"] = 6
			C["ActionBars"]["Bar3NumButtons"] = 12
			C["ActionBars"]["Bar4ButtonsPerRow"] = 6
			C["ActionBars"]["Bar4NumButtons"] = 12
			C["ActionBars"]["Bar5ButtonsPerRow"] = 6
			C["ActionBars"]["Bar5NumButtons"] = 12
		
		elseif C["Layout"]["LayoutAB"]["Value"] == "Double" then
			C["ActionBars"]["Bar1ButtonsPerRow"] = 4
			C["ActionBars"]["Bar2ButtonsPerRow"] = 6
			C["ActionBars"]["Bar2NumButtons"] = 12
			C["ActionBars"]["Bar3ButtonsPerRow"] = 4
			C["ActionBars"]["Bar3NumButtons"] = 12
			C["ActionBars"]["Bar4ButtonsPerRow"] = 6
			C["ActionBars"]["Bar4NumButtons"] = 12
			C["ActionBars"]["Bar5ButtonsPerRow"] = 6
			C["ActionBars"]["Bar5NumButtons"] = 12
		end
	
	-- healing 
	elseif C["Layout"]["LayoutRole"]["Value"] == "Healer" then 
		
		if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
			C["ActionBars"]["Bar1ButtonsPerRow"] = 12
			C["ActionBars"]["Bar2ButtonsPerRow"] = 3
			C["ActionBars"]["Bar2NumButtons"] = 12
			C["ActionBars"]["Bar3ButtonsPerRow"] = 3
			C["ActionBars"]["Bar3NumButtons"] = 12
			C["ActionBars"]["Bar4ButtonsPerRow"] = 3
			C["ActionBars"]["Bar4NumButtons"] = 12
			C["ActionBars"]["Bar5ButtonsPerRow"] = 3
			C["ActionBars"]["Bar5NumButtons"] = 12
		
		elseif C["Layout"]["LayoutAB"]["Value"] == "Single" then
			C["ActionBars"]["Bar1ButtonsPerRow"] = 12
			C["ActionBars"]["Bar2ButtonsPerRow"] = 3
			C["ActionBars"]["Bar2NumButtons"] = 12
			C["ActionBars"]["Bar3ButtonsPerRow"] = 3
			C["ActionBars"]["Bar3NumButtons"] = 12
			C["ActionBars"]["Bar4ButtonsPerRow"] = 3
			C["ActionBars"]["Bar4NumButtons"] = 12
			C["ActionBars"]["Bar5ButtonsPerRow"] = 3
			C["ActionBars"]["Bar5NumButtons"] = 12
		
		elseif C["Layout"]["LayoutAB"]["Value"] == "Double" then
			C["ActionBars"]["Bar1ButtonsPerRow"] = 6
			C["ActionBars"]["Bar2ButtonsPerRow"] = 3
			C["ActionBars"]["Bar2NumButtons"] = 12
			C["ActionBars"]["Bar3ButtonsPerRow"] = 3
			C["ActionBars"]["Bar3NumButtons"] = 12
			C["ActionBars"]["Bar4ButtonsPerRow"] = 6
			C["ActionBars"]["Bar4NumButtons"] = 12
			C["ActionBars"]["Bar5ButtonsPerRow"] = 1
			C["ActionBars"]["Bar5NumButtons"] = 12
		end
		
	-- range
	elseif C["Layout"]["LayoutRole"]["Value"] == "Range" then 
		
		if C["Layout"]["LayoutAB"]["Value"] == "Basic" then
			C["ActionBars"]["Bar1ButtonsPerRow"] = 6
			C["ActionBars"]["Bar2ButtonsPerRow"] = 2
			C["ActionBars"]["Bar2NumButtons"] = 12
			C["ActionBars"]["Bar3ButtonsPerRow"] = 2
			C["ActionBars"]["Bar3NumButtons"] = 12
			C["ActionBars"]["Bar4ButtonsPerRow"] = 6
			C["ActionBars"]["Bar4NumButtons"] = 12
			C["ActionBars"]["Bar5ButtonsPerRow"] = 6
			C["ActionBars"]["Bar5NumButtons"] = 12

		elseif C["Layout"]["LayoutAB"]["Value"] == "Single" then
			C["ActionBars"]["Bar1ButtonsPerRow"] = 3
			C["ActionBars"]["Bar2ButtonsPerRow"] = 2
			C["ActionBars"]["Bar2NumButtons"] = 12
			C["ActionBars"]["Bar3ButtonsPerRow"] = 2
			C["ActionBars"]["Bar3NumButtons"] = 12
			C["ActionBars"]["Bar4ButtonsPerRow"] = 1
			C["ActionBars"]["Bar4NumButtons"] = 12
			C["ActionBars"]["Bar5ButtonsPerRow"] = 1
			C["ActionBars"]["Bar5NumButtons"] = 12
		
		elseif C["Layout"]["LayoutAB"]["Value"] == "Double" then
			C["ActionBars"]["Bar1ButtonsPerRow"] = 3
			C["ActionBars"]["Bar2ButtonsPerRow"] = 2
			C["ActionBars"]["Bar2NumButtons"] = 12
			C["ActionBars"]["Bar3ButtonsPerRow"] = 2
			C["ActionBars"]["Bar3NumButtons"] = 12
			C["ActionBars"]["Bar4ButtonsPerRow"] = 3
			C["ActionBars"]["Bar4NumButtons"] = 12
			C["ActionBars"]["Bar5ButtonsPerRow"] = 1
			C["ActionBars"]["Bar5NumButtons"] = 12
		end
	end
end