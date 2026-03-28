# ============================================================
# exact:adv/14
# Advancement handler for round 14
# Check if round matches, then award win tag
# ============================================================

advancement revoke @s only exact:14
execute if score ?round exact.state matches 14 run tag @s add exact.win
