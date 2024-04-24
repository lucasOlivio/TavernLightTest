--[[
	ModalWindowHelper Example
]]--
local talkAction = TalkAction("!modal")

function talkAction.onSay(player, words, param, type)
	local modalWindow = ModalWindow{}
	modalWindow:addButton("Jump!", function(player, button, choice)
									end)
	modalWindow:sendToPlayer(player)
	return false
end

talkAction:separator(" ")
talkAction:register()
