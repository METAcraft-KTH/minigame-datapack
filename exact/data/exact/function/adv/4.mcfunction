# ============================================================
# exact:adv/4
# Advancement handler for round 4
# Check if round matches, then award win tag
# ============================================================

advancement revoke @s only exact:4
execute if score ?round exact.state matches 4 run tag @s add exact.win
