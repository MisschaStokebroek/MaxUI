------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-07-2021
------------------------------------------------------------------------------------------

-- setting up ACTION BARS.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local ActionBars = T.ActionBars
local baseEnable = ActionBars.Enable

------------------------------------------------------------------------------------------
-- FIX FOR PETBAR ERROR
------------------------------------------------------------------------------------------
function ActionBars:MovePetBar()
	return
end

------------------------------------------------------------------------------------------
-- ACTIONBARS COOLDOWN BLING
------------------------------------------------------------------------------------------
function ActionBars:CooldownFlashOption()
	if C["ActionBars"]["CooldownFlash"] == true then
		return
	else
		for k,v in pairs(_G) do
			if type(v)=="table" and type(v.SetDrawBling)=="function" then
				v:SetDrawBling(false)
			end
		end

		hooksecurefunc(getmetatable(ActionButton1Cooldown).__index, 'SetCooldown', function(self)
			self:SetDrawBling(false)
		end)
	end
end

function ActionBars:Enable()
	-- Tukui
	baseEnable(self)
	
	self:CooldownFlashOption()
end

------------------------------------------------------------------------------------------
-- ACTIONBAR SKINNING
------------------------------------------------------------------------------------------
local baseSkinButton = ActionBars.SkinButton
function ActionBars:SkinButton(button)
    -- Tukui
    baseSkinButton(self, button)
	
	--- MaxUI
	if not (C.General.Themes.Value == "MaxUI") then return end
	local BackdropR, BackdropG, BackdropB = unpack(C["General"]["BackdropColor"])
	local BackdropAlpha = (C["ActionBars"]["ABAlpha"])
	
	local Button = button
	local Name = button:GetName()
	local Count = _G[Name.."Count"]
	local HotKey = _G[Name.."HotKey"]
	local Btname = _G[Name.."Name"]
	local Font = T.GetFont(C["ActionBars"].Font)

	if not Button.IsSkinned then
		Button.Backdrop:SetBackdropColor(BackdropR, BackdropG, BackdropB, BackdropAlpha)
			
		Count:ClearAllPoints()
		Count:SetPoint("BOTTOMRIGHT", 0, 1)
		Count:SetJustifyH("RIGHT")
		Count:SetScale(C.ActionBars.ABFontSize/10)
		Count:SetTextColor(1, 1, 1)

		HotKey:ClearAllPoints()
		HotKey:SetPoint("TOPLEFT", 2, -2)
		HotKey:SetJustifyH("LEFT")
		HotKey:SetScale(C.ActionBars.ABFontSize/10)
		HotKey:SetFontObject(Font)
		HotKey:SetTextColor(1, 1, 1)
		HotKey:SetWidth(C["ActionBars"]["ActionBar1ButtonSize"])
		
		if (Btname) then
			Btname:SetScale(C.ActionBars.ABFontSize/10)
		end
	end	
end

local baseSkinPetButton = ActionBars.SkinPetAndShiftButton
function ActionBars:SkinPetAndShiftButton(Normal, Button, Icon, Name, Pet)

    -- Tukui
    baseSkinPetButton(self, Normal, Button, Icon, Name, Pet)
	
	--- MaxUI
	if not (C.General.Themes.Value == "MaxUI") then return end
	local BackdropR, BackdropG, BackdropB = unpack(C["General"]["BackdropColor"])
	local BackdropAlpha = (C["ActionBars"]["ABAlpha"])
	local HotKey = _G[Button:GetName().."HotKey"]
	local Cooldown = _G[Button:GetName().."Cooldown"]

	Button.Backdrop:SetBackdropColor(BackdropR, BackdropG, BackdropB, BackdropAlpha)
	
	if (C.ActionBars.HotKey) then
		HotKey:SetScale(C.ActionBars.ABFontSize/10)
	end
end