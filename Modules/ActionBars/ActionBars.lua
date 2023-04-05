------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 30-10-2022
------------------------------------------------------------------------------------------

-- setting up ACTION BARS.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local ActionBars = T.ActionBars
local baseEnable = ActionBars.Enable
local baseSkinButton = ActionBars.SkinButton
local baseSkinPetAndShiftButton = ActionBars.SkinPetAndShiftButton

------------------------------------------------------------------------------------------
-- FIX FOR PETBAR ERROR
------------------------------------------------------------------------------------------
--function ActionBars:MovePetBar()
--	return
--end

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
	baseEnable(self)
	self:CooldownFlashOption()
end

------------------------------------------------------------------------------------------
-- ACTIONBAR SKINNING
------------------------------------------------------------------------------------------
function ActionBars:SkinButton(button)
  baseSkinButton(self, button)
	
	if not (C.General.Themes.Value == "MaxUI") then return end

	local BackdropR, BackdropG, BackdropB = unpack(C["General"]["BackdropColor"])
	local BackdropAlpha = (C["ActionBars"]["ABAlpha"])
	local Button = button
	local Name = button:GetName()
	local Cooldown = _G[Name.."Cooldown"]
	local CooldownFont = T.GetFont(C["Cooldowns"].Font)
	local HotKey = _G[Name.."HotKey"]
	local HotKeyFont = T.GetFont(C["ActionBars"].HotKeyFont)
	local Count = _G[Name.."Count"]
	local CountFont = T.GetFont(C["ActionBars"].CountFont)
	local Btname = _G[Name.."Name"]
	local MacroFont = T.GetFont(C["ActionBars"].MacroFont)

	-- cooldown
	local Region = Cooldown:GetRegions()
	if (C.ActionBars.CoolDown) then
		if Region.GetText then
			local Font = T.GetFont(C["Cooldowns"].Font)

			Font = _G[Font]:GetFont()

			Region:ClearAllPoints()
			Region:SetFont(Font, 10, "OUTLINE")
			Region:SetScale(C["ActionBars"]["CoolDownFontSize"]/10)
			Region:SetTextColor(unpack(C["ActionBars"]["CoolDownColor"]))
			Region:SetPoint(C["ActionBars"]["CoolDownPosition"]["Value"], Button, C["ActionBars"]["CoolDownPosition"]["Value"], C["ActionBars"]["CoolDownOffsetH"], C["ActionBars"]["CoolDownOffsetV"])
			Region:SetJustifyH(C["ActionBars"]["CoolDownJustifyH"]["Value"])
		end
	else
		Cooldown:SetHideCountdownNumbers(true)
	end	

	-- hotkey
	if (C.ActionBars.HotKey) then
		HotKey:ClearAllPoints()
		HotKey:SetWidth(Button:GetWidth()-4)
		HotKey:SetFontObject(HotKeyFont)
		HotKey:SetScale(C["ActionBars"]["HotKeyFontSize"]/10)
		HotKey:SetTextColor(unpack(C["ActionBars"]["HotKeyColor"]))
		HotKey:SetPoint(C["ActionBars"]["HotKeyPosition"]["Value"], Button, C["ActionBars"]["HotKeyPosition"]["Value"], C["ActionBars"]["HotKeyOffsetH"], C["ActionBars"]["HotKeyOffsetV"])
		HotKey:SetJustifyH(C["ActionBars"]["HotKeyJustifyH"]["Value"])
	end

	-- count
	if (C.ActionBars.Count) then
		Count:ClearAllPoints()
		Count:SetWidth(Button:GetWidth()-4)
		Count:SetFontObject(CountFont)
		Count:SetScale(C["ActionBars"]["CountFontSize"]/10)
		Count:SetTextColor(unpack(C["ActionBars"]["CountColor"]))
		Count:SetPoint(C["ActionBars"]["CountPosition"]["Value"], Button, C["ActionBars"]["CountPosition"]["Value"], C["ActionBars"]["CountOffsetH"], C["ActionBars"]["CountOffsetV"])
		Count:SetJustifyH(C["ActionBars"]["CountJustifyH"]["Value"])
	end

	-- macro
	if (Btname) then
		if (C.ActionBars.Macro) then
			Btname:ClearAllPoints()
			Btname:SetFontObject(MacroFont)
			Btname:SetScale(C["ActionBars"]["MacroFontSize"]/10)
			Btname:SetTextColor(unpack(C["ActionBars"]["MacroColor"]))
			Btname:SetPoint(C["ActionBars"]["MacroPosition"]["Value"], Button, C["ActionBars"]["MacroPosition"]["Value"], C["ActionBars"]["MacroOffsetH"], C["ActionBars"]["MacroOffsetV"])
			Btname:SetJustifyH(C["ActionBars"]["MacroJustifyH"]["Value"])
		end
	end

	if not Button.IsSkinned then
		Button.Backdrop:SetParent(Button)
		Button.Backdrop:SetBackdropColor(BackdropR, BackdropG, BackdropB)
		Button.Backdrop:SetAlpha(BackdropAlpha)
		Button.Backdrop:SetFrameLevel(Button:GetFrameLevel())
		
		-- temp fix for icons not sizing correctly?
		if T.Retail then
			Button.IconMask:ClearAllPoints()
			Button.IconMask:SetPoint("TOPLEFT", Button, -15, 15)
			Button.IconMask:SetPoint("BOTTOMRIGHT", Button, 15, -15)
		end
		
		if C["Skins"]["ActionBarButtonFilter"] == true then 
			Button:CreateMaxUIFilterInside()
		end
	end	
end

function ActionBars:SkinPetAndShiftButton(Normal, Button, Icon, Name, Pet)
    baseSkinPetAndShiftButton(self, Normal, Button, Icon, Name, Pet)
	
	if not (C.General.Themes.Value == "MaxUI") then return end

	local BackdropR, BackdropG, BackdropB = unpack(C["General"]["BackdropColor"])
	local BackdropAlpha = (C["ActionBars"]["ABAlpha"])
	local HotKey = _G[Button:GetName().."HotKey"]

	Button.Backdrop:SetBackdropColor(BackdropR, BackdropG, BackdropB, BackdropAlpha)
		
	if C["Skins"]["ActionBarButtonFilter"] == true then 
		Button:CreateMaxUIFilterInside()
	end

	if (C.ActionBars.HotKey) then
		HotKey:SetScale(C.ActionBars.ABFontSize/10)
	end
end