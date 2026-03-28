# ============================================================
# exact:adv/9
# Advancement handler for round 9
# Check if round matches, then award win tag
# ============================================================

advancement revoke @s only exact:9
execute if score ?round exact.state matches 9 run tag @s add exact.win
