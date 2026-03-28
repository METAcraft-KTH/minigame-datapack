# ============================================================
# exact:adv/1
# Advancement handler for round 1
# Check if round matches, then award win tag
# ============================================================

advancement revoke @s only exact:1
execute if score ?round exact.state matches 1 run tag @s add exact.win
