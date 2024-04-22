/*
    Q4 - Assume all method calls work fine. Fix the memory leak issue in below method

    void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
    {
    Player* player = g_game.getPlayerByName(recipient);
    if (!player) {
    player = new Player(nullptr);
    if (!IOLoginData::loadPlayerByName(player, recipient)) {
    return;
    }
    }

    Item* item = Item::CreateItem(itemId);
    if (!item) {
    return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
    IOLoginData::savePlayer(player);
    }
    }

    Q4 - Changes:

    - Changed the line "new Player(nullptr)" to allocate in stack memory instead of heap allocation
*/

void Game::addItemToPlayer(const std::string &recipient, uint16_t itemId)
{
    Player *player = g_game.getPlayerByName(recipient);
    if (!player)
    {
        player = &Player(nullptr);
        if (!IOLoginData::loadPlayerByName(player, recipient))
        {
            return;
        }
    }

    Item *item = Item::CreateItem(itemId);
    if (!item)
    {
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline())
    {
        IOLoginData::savePlayer(player);
    }
}
