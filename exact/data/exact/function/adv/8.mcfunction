# ============================================================
# exact:adv/8
# Advancement handler for round 8
# Check if round matches, then award win tag
# ============================================================

advancement revoke @s only exact:8
execute if score ?round exact.state matches 8 run tag @s add exact.win
