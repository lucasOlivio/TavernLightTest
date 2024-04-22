--[[
    Q1 - Fix or improve the implementation of the below methods

    local function releaseStorage(player)
    player:setStorageValue(1000, -1)
    end

    function onLogout(player)
    if player:getStorageValue(1000) == 1 then
    addEvent(releaseStorage, 1000, player)
    end
    return true
    end

    Q1 - Changes:

    - Added docstring for all methods
    - Added storageID parameter for releaseStorage for possibilitie of reuse
    - Separated parameters from addEvent call for decoupling, to improve readability and facilitate maintanance
]]--

-- Release the given storage by setting it to -1.
--
-- Parameters:
---@param storageID number The ID of the storage to modify.
---@param player Player The player whose storage value will be modified.
local function releaseStorage(storageID, player)
    player:setStorageValue(storageID, -1)
end

-- Logs out the player and releases its storage.
--
-- Parameters:
---@param player Player The player who is logging out.
--
-- Return:
---@return boolean Returns true if the player logged out successfully, otherwise false.
function onLogout(player)
    local storageID = 1000

    if player:getStorageValue(storageID) == 1 then
        -- Schedule the releaseStorage function to be executed after the specified time
        addEvent(releaseStorage, 1000, storageID, player)
    end
    
    return true
end
