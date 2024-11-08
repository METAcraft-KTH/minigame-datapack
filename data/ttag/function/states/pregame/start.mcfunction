# This state is not used, since we jump from lobby straight into the game.
#scoreboard players set ?state ttag.game 1

# various configs
function ttag:states/pregame/configure_gamerule

# call game start
function ttag:states/ingame_tag/start