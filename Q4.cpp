//Q4 - Assume all method calls work fine. Fix the memory leak issue in below method

// void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
// {
//     Player* player = g_game.getPlayerByName(recipient);
//     if (!player) {
//         player = new Player(nullptr);
//         if (!IOLoginData::loadPlayerByName(player, recipient)) {
//             return;
//         }
//     }

//     Item* item = Item::CreateItem(itemId);
//     if (!item) {
//         return;
//     }

//     g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

//     if (player->isOffline()) {
//         IOLoginData::savePlayer(player);
//     }
// }

void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    //get the recipient's name, initialize that player variable is created
    Player* player = g_game.getPlayerByName(recipient);
    bool playerCreated = true;

    //if the player is invalid
    if (!player) {
        //initialize player
        player = new Player(nullptr);

        //if loadPlayerByName fails
        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            // we want to free up the memory that we created if we aren't able to loadPlayerByName (memory leak)
            // since we freed up the space we switch the flag of playerCreated to false
            delete player;
            playerCreated = false;
            return;
        }   

        //since loadPlayerByName succeeded
        playerCreated = true;
    }

    //create the item with the itemId
    Item* item = Item::CreateItem(itemId);

    //if item is invalid, we delete the player pointer since we don't need the player
    if (!item) {
        if (playerCreated) {
            delete player;
            playerCreated = false;
        }
        return;
    }
    //initialize the itemCreated flag
    bool itemCreated = true;

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
    }

    //Since we're done using the player pointer, we delete the player pointer
    if (playerCreated) { 
        delete player;
        playerCreated = false;
    }

    //Since we're done using the item pointer, we delete the item pointer
    if (itemCreated) { 
        delete item;
        itemCreated = false;
    }
}