# ============================================================
# exact:adv/6
# Advancement handler for round 6
# Check if round matches, then award win tag
# ============================================================

advancement revoke @s only exact:6
execute if score ?round exact.state matches 6 run tag @s add exact.win
