# ============================================================
# exact:adv/16
# Advancement handler for round 16
# Check if round matches, then award win tag
# ============================================================

advancement revoke @s only exact:16
execute if score ?round exact.state matches 16 run tag @s add exact.win
