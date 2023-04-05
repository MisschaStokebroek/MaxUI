------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 30-10-2022
------------------------------------------------------------------------------------------

-- setting up LOADING.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 

------------------------------------------------------------------------------------------
-- WELCOME MESSAGE
------------------------------------------------------------------------------------------
T.version = GetAddOnMetadata("Tukui", "Version")
T.MaxUIversion = GetAddOnMetadata("MaxUI", "Version")
local HexClassColor = T.RGBToHex(unpack(T.Colors.class[T.MyClass]))
print("|cffFFFC01Welcome |r" ..HexClassColor ..UnitName("Player").."|r|cffFFFC01, entering World of Warcraft.|r |cffFFFF99MaxUI v. "..T.MaxUIversion.."|r |cffFFFC01for|r |cffff8000Tukui v. "..T.version.."|r |cffFFFC01loaded. |r|cffFFFC01Use|r |cffff8000/tukui|r |cffFFFC01or|r |cffFFFF99/maxui|r |cffFFFC01for more command options, check|r |cff69CCF0www.tukui.org|r |cffFFFC01or the MaxUI Discord for more information.|r")
