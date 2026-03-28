# ============================================================
# exact:adv/2
# Advancement handler for round 2
# Check if round matches, then award win tag
# ============================================================

advancement revoke @s only exact:2
execute if score ?round exact.state matches 2 run tag @s add exact.win
