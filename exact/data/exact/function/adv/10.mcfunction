# ============================================================
# exact:adv/10
# Advancement handler for round 10
# Check if round matches, then award win tag
# ============================================================

advancement revoke @s only exact:10
execute if score ?round exact.state matches 10 run tag @s add exact.win
