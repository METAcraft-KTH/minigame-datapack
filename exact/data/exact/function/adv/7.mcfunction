# ============================================================
# exact:adv/7
# Advancement handler for round 7
# Check if round matches, then award win tag
# ============================================================

advancement revoke @s only exact:7
execute if score ?round exact.state matches 7 run tag @s add exact.win
