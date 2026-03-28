# ============================================================
# exact:adv/12
# Advancement handler for round 12
# Check if round matches, then award win tag
# ============================================================

advancement revoke @s only exact:12
execute if score ?round exact.state matches 12 run tag @s add exact.win
