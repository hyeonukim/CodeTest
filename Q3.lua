-- Q3 - Fix or improve the name and the implementation of the below method

-- function do_sth_with_PlayerParty(playerId, membername)
--     player = Player(playerId)
--     local party = player:getParty()
    
--     for k,v in pairs(party:getMembers()) do
--         if v == Player(membername) then
--             party:removeMember(Player(membername))
--         end
--     end
-- end

-- changed the name of function to RemovePlayerFrom party to be more precise on what function is supposed to do
-- We could also change then name of the parameters for more clairty, but this is not done as this could be objective, 
-- I would change playerId to partyLeaderId, membername to removeMemberName
function RemovePlayerFromParty(playerId, membername)
    player = Player(playerId)

    -- check if player is valid
    if not player then
        print("Error: player is invalid or playerId does not exist")
        return
    end

    local party = player:getParty()

    -- check if party exists
    if not party then
        print("Error: Player is not in the party")
        return
    end

    -- we do not need the for loop here since we already have the information of the party, and the player that we want to remove
    -- we also want to check if removeMember function is successful
    if party:removeMember(Player(membername)) ~= nil then
        print("Player", membername, "removed from the party")
    else
        pritn("Error: Failed to remove player from the party")
    end
end
