------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-08-2022
------------------------------------------------------------------------------------------

-- setting up SCROLLING TEXT.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = unpack(Tukui) 
local SCT = CreateFrame("Frame")

function SCT:Enable()
	if C["Scrolling Text"]["Pet"]["Value"] == "Show" then
		SetCVar("floatingCombatTextPetMeleeDamage", 1)
		SetCVar("floatingCombatTextPetSpellDamage", 1)
	else
		SetCVar("floatingCombatTextPetMeleeDamage", 0)
		SetCVar("floatingCombatTextPetSpellDamage", 0)
	end

	if C["Scrolling Text"]["Healing"]["Value"] == "Show" then
		SetCVar("floatingCombatTextCombatHealing", 1)
	else
		SetCVar("floatingCombatTextCombatHealing", 0)
	end
	
	if C["Scrolling Text"]["Shields"]["Value"] == "Show" then
		SetCVar("floatingCombatTextCombatHealingAbsorbTarget", 1)
	else
		SetCVar("floatingCombatTextCombatHealingAbsorbTarget", 0)
	end

	if C["Scrolling Text"]["Damage"]["Value"] == "Show" then
		SetCVar("floatingCombatTextCombatDamage", 1)
	else
		SetCVar("floatingCombatTextCombatDamage", 0)
	end
	
	if C["Scrolling Text"]["FloatMode"]["Value"] == "Up" then
		SetCVar("WorldTextGravity", -1)
	else
		SetCVar("WorldTextGravity", 1)
	end
	
	SetCVar("floatingCombatTextCombatDamageDirectionalScale", C["Scrolling Text"]["Direction"])
	SetCVar("WorldTextScale", C["Scrolling Text"]["Scale"])
	SetCVar("WorldTextScreenY", C["Scrolling Text"]["YOffset"])
	SetCVar("WorldTextCritScreenY", C["Scrolling Text"]["YOffset"])
end

function SCT:OnEvent(event)
	self:Enable()
end

SCT:RegisterEvent("PLAYER_LOGIN")
SCT:SetScript("OnEvent", SCT.OnEvent)