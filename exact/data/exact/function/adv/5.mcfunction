# ============================================================
# exact:adv/5
# Advancement handler for round 5
# Check if round matches, then award win tag
# ============================================================

advancement revoke @s only exact:5
execute if score ?round exact.state matches 5 run tag @s add exact.win
