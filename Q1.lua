-- Q1 - Fix or improve the implementation of the below methods

-- local function releaseStorage(player)
--     player:setStorageValue(1000, -1)
-- end
    
-- function onLogout(player)
--     if player:getStorageValue(1000) == 1 then
--         addEvent(releaseStorage, 1000, player)
--     end
--     return true
-- end

-- I've added these variables so that we do not have to hardcode the value everytime, and clarity reason
local storageID = 1000
local DelayTime = 1000

-- releaseStorage function does not check if player value is valid, this could cause a bug in case player is invalid or not a player
local function releaseStorage(player)
    if not player then
        print("Invalid syntax: player is invalid")
        return
    end
    player:setStorageValue(storageID, -1)
end

-- To increase the clarity, and to not hardcode everytime I added the storageID, DelayTime variable
-- Added the checking if player is valid
-- we should also only return true if we were able to successfully releaseStorage else return false
function onLogout(player)

    if player and player:getStorageValue(storageID) == 1 then
        addEvent(releaseStorage, DelayTime, player)
        return true
    end

    print("onLogout function failed")
    return false
end
