# ============================================================
# exact:adv/15
# Advancement handler for round 15
# Check if round matches, then award win tag
# ============================================================

advancement revoke @s only exact:15
execute if score ?round exact.state matches 15 run tag @s add exact.win
