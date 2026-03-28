# ============================================================
# exact:adv/3
# Advancement handler for round 3
# Check if round matches, then award win tag
# ============================================================

advancement revoke @s only exact:3
execute if score ?round exact.state matches 3 run tag @s add exact.win
