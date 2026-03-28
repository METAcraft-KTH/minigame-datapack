# ============================================================
# exact:adv/11
# Advancement handler for round 11
# Check if round matches, then award win tag
# ============================================================

advancement revoke @s only exact:11
execute if score ?round exact.state matches 11 run tag @s add exact.win
