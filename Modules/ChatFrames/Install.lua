------------------------------------------------------------------------------------------
-- MaxUI 6.5 - TUKUI 20
-- latest update: 15-07-2021
------------------------------------------------------------------------------------------

-- setting up CHAT INSTALLER / RESET
-- NOTE: copied Tukui code, convert to MaxUI code?

------------------------------------------------------------------------------------------
-- SETUP
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Chat = T.Chat
local baseSetChatFramePosition = Chat.SetChatFramePosition
local baseInstall = Chat.Install
local baseMoveChannels = Chat.MoveChannels

------------------------------------------------------------------------------------------
-- BLIZZARD CHAT ANCHORING TO NEW CHAT FRAMES
------------------------------------------------------------------------------------------
function Chat:SetChatFramePosition()
	local Frame = self
	local ID = Frame:GetID()
	local Settings = TukuiDatabase.Variables[T.MyRealm][T.MyName].Chat.Positions["Frame" .. ID]

	if Settings then
		if C.General.Themes.Value == "Tukui" then
			local Anchor1, Anchor2, X, Y, Width, Height = unpack(Settings)

			if ID == 1 then
				Frame:SetParent(T.DataTexts.Panels.Left)
				Frame:SetUserPlaced(true)
				Frame:ClearAllPoints()
				Frame:SetSize(C.Chat.LeftWidth -4, C.Chat.LeftHeight - 62)
				Frame:SetPoint("BOTTOMLEFT", T.DataTexts.Panels.Left, "TOPLEFT", 0, 2)

			elseif (ID == 4) then
				if Frame:IsShown() and not Frame.isDocked then
					Frame:SetParent(T.DataTexts.Panels.Right)
					Frame:SetUserPlaced(true)
					Frame:ClearAllPoints()
					Frame:SetSize(C.Chat.RightWidth -4, C.Chat.RightHeight - 62)
					Frame:SetPoint("BOTTOMLEFT", T.DataTexts.Panels.Right, "TOPLEFT", 0, 2)

					if C.Chat.RightChatAlignRight then
						Frame:SetJustifyH("RIGHT")
					end
				end
			end
			
		elseif C.General.Themes.Value == "MaxUI" then
			local LeftChatBG = T.Chat.Panels.LeftChat
			local Height = (C["Chat"]["LeftHeight"])
			local Width = (C["Chat"]["LeftWidth"])

			-- Set default chat frame position
			if (ID == 1) then
				Frame:SetParent(LeftChatBG)
				Frame:SetUserPlaced(true)
				Frame:ClearAllPoints()
				Frame:SetSize(C.Chat.LeftWidth -4, C.Chat.LeftHeight-25)
				Frame:SetPoint("BOTTOMLEFT", LeftChatBG, "BOTTOMLEFT", 2, 2)
			
				if C["DataTexts"]["Slidable"] == true then 
					Frame:ClearAllPoints()
					Frame:SetSize(C.Chat.LeftWidth -4, C.Chat.LeftHeight-25)
					Frame:SetPoint("BOTTOMLEFT", LeftChatBG, "BOTTOMLEFT", 2, 2)
				end
			end

		else
			if not Frame:IsMovable() then
				return
			end

			local Anchor1, Anchor2, X, Y, Width, Height = unpack(Settings)

			Frame:SetUserPlaced(true)
			Frame:ClearAllPoints()
			Frame:SetPoint(Anchor1, UIParent, Anchor2, X, Y)
			Frame:SetSize(Width, Height)

			if (ID == 4) and (C.Chat.RightChatAlignRight) then
				Frame:SetJustifyH("RIGHT")
			end
		end
	end
end


function Chat:Reset()
	local IsPublicChannelFound = EnumerateServerChannels()
	
	if not IsPublicChannelFound then
		-- Restart this function until we are able to query public channels
		C_Timer.After(1, Chat.Reset)
		return
	end
	
	-- Reset chat database
	TukuiDatabase.Variables[T.MyRealm][T.MyName].Chat.Positions = Chat.Positions
	
	-- Reset right chat frame detection
	IsRightChatFound = false

	-- Create our custom chatframes
	FCF_ResetChatWindows()
	FCF_SetLocked(ChatFrame1, 1)
	
	FCF_DockFrame(ChatFrame2)
	FCF_SetLocked(ChatFrame2, 1)
	
	if T.BCC then
		FCF_OpenNewWindow(TRADE)
		FCF_SetWindowName(ChatFrame3, "Trade")
	end
	FCF_SetLocked(ChatFrame3, 1)
	FCF_DockFrame(ChatFrame3)
	
	FCF_OpenNewWindow(LOOT)
	FCF_SetLocked(ChatFrame4, 1)
	FCF_DockFrame(ChatFrame4)

	FCF_OpenNewWindow(LFG)
	FCF_SetLocked(ChatFrame5, 1)
	FCF_DockFrame(ChatFrame5)


	if T.Retail then
		FCF_OpenNewWindow(TRADE)
		FCF_SetLocked(ChatFrame6, 1)
		FCF_DockFrame(ChatFrame6)
		FCF_SetChatWindowFontSize(nil, ChatFrame6, 12)
		FCF_SetWindowName(ChatFrame6, "Trade")
	end
	
	FCF_SetChatWindowFontSize(nil, ChatFrame1, 12)
	FCF_SetChatWindowFontSize(nil, ChatFrame2, 12)
	FCF_SetChatWindowFontSize(nil, ChatFrame3, 12)
	FCF_SetChatWindowFontSize(nil, ChatFrame4, 12)
	FCF_SetChatWindowFontSize(nil, ChatFrame5, 12)

	FCF_SetWindowName(ChatFrame1, "General")
	FCF_SetWindowName(ChatFrame2, "Log")
	FCF_SetWindowName(ChatFrame4, "Loot")
	FCF_SetWindowName(ChatFrame5, "LFG")

	DEFAULT_CHAT_FRAME:SetUserPlaced(true)

	-- Fix a editbox texture
	ChatEdit_ActivateChat(ChatFrame1EditBox)
	ChatEdit_DeactivateChat(ChatFrame1EditBox)

	-- Adjust Chat Colors
	ChangeChatColor('CHANNEL1', 254/255, 193/255, 193/255) -- General
	ChangeChatColor('CHANNEL2', 254/255, 193/255, 193/255) -- Trade
	ChangeChatColor('CHANNEL3', 254/255, 193/255, 193/255) -- Local Defense
	ChangeChatColor('CHANNEL4', 254/255, 193/255, 193/255) -- Looking for Group
	ChangeChatColor('CHANNEL5', 254/255, 193/255, 193/255) -- World Defense
	ChangeChatColor('CHANNEL6', 254/255, 193/255, 193/255) -- Guild Recruitment

	local ChatGroup = {}
	local Channels = {}
	
	for i = 1, 5 do
		if i ~= 2 then
			local ChatFrame = _G["ChatFrame"..i]

			ChatFrame_RemoveAllMessageGroups(ChatFrame)
		end
	end

	-- CHATFRAME 1 - GENERAL
	ChatGroup = {
	-- categories: chat
	"SAY",
	"EMOTE",
	"YELL",
	"GUILD",
	"OFFICER",
	"GUILD_ACHIEVEMENT",
	"WHISPER",
	"PARTY",
	"PARTY_LEADER",
	"YELL",
	"GUILD",
	"OFFICER",
	"WHISPER",
	"PARTY",
	"PARTY_LEADER",
	"RAID",
	"RAID_LEADER",
	"RAID_WARNING",
	"INSTANCE_CHAT",
	"INSTANCE_CHAT_LEADER",
	"BN_WHISPER",
	"BN_INLINE_TOAST_ALERT",
	
	-- categories: Global channels
	-- categories: Other
	-- combat
	"COMBAT_XP_GAIN",
	"COMBAT_HONOR_GAIN",
	"COMBAT_FACTION_CHANGE",
	"OPENING",
	"PET_INFO",
	"COMBAT_MISC_INFO",
	"SKILL",
	"LOOT",
	"MONEY",
	
	-- pvp
	"BG_HORDE",
	"BG_ALLIANCE",
	"BG_NEUTRAL",

	-- other
	"SYSTEM",
	"ERRORS",
	"AFK",
	"DND",
	"IGNORED",
	'CHANNEL',
	'TARGETICONS',
	
	-- creature messages
	"MONSTER_SAY",
	"MONSTER_EMOTE",
	"MONSTER_YELL",
	"MONSTER_WHISPER",
	"MONSTER_BOSS_EMOTE",
	"MONSTER_BOSS_WHISPER",
	}

	ChatFrame_RemoveChannel(_G.ChatFrame1, "Trade")
	ChatFrame_AddChannel(_G.ChatFrame1, "General")
	
	for _, v in ipairs(ChatGroup) do
		ChatFrame_AddMessageGroup(_G.ChatFrame1, v)
	end

	-- CHATFRAME 6 - TRADE
	ChatGroup = {
	"SYSTEM",
	"WHISPER",
	"ERRORS",
	"AFK",
	"DND",
	"IGNORED",
	'CHANNEL',
	'TARGETICONS',
	}
	
	ChatFrame_RemoveChannel(_G.ChatFrame6, "General")
	ChatFrame_RemoveChannel(_G.ChatFrame6, "LocalDefense")
	ChatFrame_AddChannel(_G.ChatFrame6, "Trade")

	for _, v in ipairs(ChatGroup) do
		ChatFrame_AddMessageGroup(_G.ChatFrame6, v)
	end

	-- CHATFRAME 4 - LOOT
	ChatGroup = {
	"BN_WHISPER",
	"BN_INLINE_TOAST_ALERT",
	"SYSTEM",
	"CURRENCY",
	"TRADESKILLS",
	"LOOT",
	"MONEY",
	"SKILL",
	"COMBAT_XP_GAIN",
	"COMBAT_HONOR_GAIN",
	"COMBAT_FACTION_CHANGE",
	"ERRORS",
	"AFK",
	"DND",
	"IGNORED",
	'CHANNEL',
	'TARGETICONS',
	}	
	
	for _, v in ipairs(ChatGroup) do
		ChatFrame_AddMessageGroup(_G.ChatFrame4, v)
	end
	
	-- CHATFRAME 5 - LFG
	ChatGroup = {
	"SYSTEM",
	"WHISPER",
	"ERRORS",
	"AFK",
	"DND",
	"IGNORED",
	'CHANNEL',
	'TARGETICONS',
	}
	
	ChatFrame_AddChannel(_G.ChatFrame5, "LocalDefense")
	ChatFrame_AddChannel(_G.ChatFrame5, "LookingForGroup")
	ChatFrame_AddChannel(_G.ChatFrame5, "GuildRecruitment")
	ChatFrame_AddChannel(_G.ChatFrame5, "WorldDefense")

	for _, v in ipairs(ChatGroup) do
		ChatFrame_AddMessageGroup(_G.ChatFrame5, v)
	end
end