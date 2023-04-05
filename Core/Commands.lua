------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 30-10-2022
------------------------------------------------------------------------------------------

-- setting up CUSTOM SLASH COMMANDS.

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()

------------------------------------------------------------------------------------------
-- CUSTOM COMMANDS
------------------------------------------------------------------------------------------
local MaxUICommands = {}

MaxUICommands["help"] = function()
	print("MaxUI HELP:")
	print(format("[|cffffff99/maxui settings|r or |cffffff99/maxui c|r] for opening the MaxUI config"))
	print(format("[|cffffff99/maxui datacenter|r or |cffffff99/maxui dc|r] for opening the MaxUI datacenter"))
	print(format("[|cffffff99/maxui gamemenu|r or |cffffff99/maxui gm|r] for opening the MaxUI game menu"))
	print(format("[|cffffff99/maxui raidtools|r or |cffffff99/maxui rt|r] for opening the MaxUI raid tools"))
	print(format("[|cffffff99/maxui bufftracker|r or |cffffff99/maxui bt|r] for opening the MaxUI bufftracker"))
	print(format("[|cffffff99/maxui ??????|r] more to come in the future"))
end

MaxUICommands["settings"] = function()
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui c")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox,0)
end

MaxUICommands["datacenter"] = function()
	DataCenterFadeToggle()
end

MaxUICommands["gamemenu"] = function()
	GameMenuFadeToggle()
end

MaxUICommands["raidtools"] = function()
	RaidToolsToggle()
end

MaxUICommands["bufftracker"] = function()
	RaidBuffTrackerToggle()
end

MaxUICommands["c"] = function()
	DEFAULT_CHAT_FRAME.editBox:SetText("/tukui c")
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox,0)
end

MaxUICommands["dc"] = function()
	DataCenterFadeToggle()
end

MaxUICommands["gm"] = function()
	GameMenuFadeToggle()
end

MaxUICommands["rt"] = function()
	RaidToolsToggle()
end

MaxUICommands["bt"] = function()
	RaidBuffTrackerToggle()
end

------------------------------------------------------------------------------------------
-- EXECUTE
------------------------------------------------------------------------------------------
local RunCommand = function(arg)
	if MaxUICommands[arg] then
		MaxUICommands[arg]()
	else
		MaxUICommands["help"]()
	end
end

SLASH_MAXUI1 = "/maxui"
SlashCmdList["MAXUI"] = RunCommand

T.MaxUICommands = MaxUICommands