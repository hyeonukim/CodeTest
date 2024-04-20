-- Q2 - Fix or improve the implementation of the below method

-- function printSmallGuildNames(memberCount)
--     -- this method is supposed to print names of all guilds that have less than memberCount max members
--     local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
--     local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
--     local guildName = result.getString("name")
--     print(guildName)
--     end

function printSmallGuildNames(memberCount)
-- this method is supposed to print names of all guilds that have less than memberCount max members
    -- check for edge cases: memberCount < 0, memberCount is digit
    if memberCount < 0 and type(memberCount) ~= "number" then
        print("Invalid syntax: memberCount should be non-negative numbers, and should be a number type")
        return
    end

    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))

    --check if resultId exists after the query, if nothing then return
    if not resultId then
        return
    end

    --Since query exists, we print out all the guild names with query
    --Here, result.getString( resultId , 'name') I've added the "resultId" since we want the result of getString from resultId
    repeat
        local guildName = result.getString(resultId, "name")
        print(guildName)
    until not result.next(resultId)

    -- Free the query data
    result.free(resultId)
end