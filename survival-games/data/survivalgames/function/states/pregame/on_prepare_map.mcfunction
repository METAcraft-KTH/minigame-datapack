#range Range
#chunkrange ChunkRange
$fill ~-$(range) -64 ~-$(range) ~$(range) 319 ~$(range) air replace #survivalgames:remove_on_reset
$for-all-block-entities $(chunkrange) tag survivalgames:valid_loot_container function survivalgames:states/pregame/prepare_loot

