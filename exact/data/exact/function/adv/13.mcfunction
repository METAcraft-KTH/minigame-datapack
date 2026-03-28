# ============================================================
# exact:adv/13
# Advancement handler for round 13
# Check if round matches, then award win tag
# ============================================================

advancement revoke @s only exact:13
execute if score ?round exact.state matches 13 run tag @s add exact.win
