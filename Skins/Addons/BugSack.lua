------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-06-2021
------------------------------------------------------------------------------------------

-- setting up MaxUISkins

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
if not IsAddOnLoaded('AddonSkins') then 
	return
end

local AS, ASL = unpack(AddOnSkins)
if not AS:CheckAddOn('Tukui') then return end
local T, C
local _G = _G

if not IsAddOnLoaded('BugSack') then 
	return
end

------------------------------------------------------------------------------------------
-- ADDON MANAGER
------------------------------------------------------------------------------------------
local AS_BugSack = AS.BugSack
function AS:BugSack(event, addon)
	AS_BugSack(self, event, addon)

	if not Tukui then return end
	if not T then
		T, C = Tukui:unpack()
	end

	if not C["Skins"]["MaxUIAddOnSkins"] then return end
	
	hooksecurefunc(BugSack, "OpenSack", function()
		
		-- adjustments
		BugSackFrame:CreateShadow()
		BugSackFrame:SetHeight(420)
		
		-- header
		BugSackFrame:CreateMaxUIHeader("BugSack")
		BugSackFrame.MaxUIHeader:SetFrameStrata("LOW")
		BugSackFrame.MaxUIHeader:SetFrameLevel(10)

		-- relocate
		BugSackFrame:ClearAllPoints()
		BugSackFrame:SetPoint("TOP", UIParent, "TOP", 0, -100)
		BugSackFrame.ClearAllPoints = function() end
		BugSackFrame.SetPoint = function() end
		
		for _, child in pairs({BugSackFrame:GetChildren()}) do
			if (child:IsObjectType('Button') and child:GetScript('OnClick') == BugSack.CloseSack) then
				
				-- close button
				child:ClearAllPoints()
				child:SetFrameLevel(16)
				child:SetFrameStrata("HIGH")
				child:SetPoint("RIGHT", BugSackFrame.MaxUIHeader, "RIGHT", 4, 0)
			end
		end
		
	end)
end
AS:RegisterSkin('BugSack', AS.BugSack)