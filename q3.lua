--[[
    Q3 - Fix or improve the name and the implementation of the below method

    function do_sth_with_PlayerParty(playerId, membername)
    player = Player(playerId)
    local party = player:getParty()

    for k,v in pairs(party:getMembers()) do 
    if v == Player(membername) then 
    party:removeMember(Player(membername))
    end
    end
    end

    Q3 - Changes:

    - Changed name for better understanding
    - Method name to camelcase to be in line with coding conventions.
    - Added docstring 
    - Separated necessary variables for decoupling and facilitate maintanance and readability
    - Break from loop when member found to avoind unnecessary interations
]]--

-- Removes a member from the given player's party.
--
---@param playerId number The ID of the player initiating the removal.
---@param membername string The name of the player to be removed from the party.
function removePlayerPartyMember(playerId, membername)
    local player = Player(playerId)
    local member = Player(membername)

    local party = player:getParty()
    local membersList = party:getMembers()
	
    for i = 1, #membersList do
		local currMember = membersList[i]

        if currMember == member then 
            party:removeMember(currMember)
            return
        end
    end
end
