--[[
    Q2 - Fix or improve the implementation of the below method

    function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
    local guildName = result.getString("name")
    print(guildName)
    end

    Q2 - Changes:

    - Added docstring 
    - Added validation for query return 
    - Iterate over each returned guild name to print its name
    - Added reset to the storeQuery global variable with .free()
]]--

-- Prints the names of guilds with a maximum member count lower than the specified threshold.
--
-- Parameters:
---@param memberCount number The maximum member count threshold.
function printSmallGuildNames(memberCount)
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
    if not resultId then
        return
    end

    -- Print all guilds names returned
    repeat
        local guildName = result.getString(resultId, "name")
        print(guildName)
    until not result.next(resultId)
    result.free(resultId)
end
