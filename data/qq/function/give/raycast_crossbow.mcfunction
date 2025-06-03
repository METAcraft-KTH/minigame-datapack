#  you will also need to update qq:states/ingame/reset_inventory

# Not charged
#give @s crossbow[custom_data={raycast:1b}, enchantments={quick_charge:2}, unbreakable={}, tooltip_display={hidden_components:[enchantments,unbreakable]}]
give @s crossbow[custom_data={raycast:1b}, enchantments={"qq:ray":1,quick_charge:2}, unbreakable={}, tooltip_display={hidden_components:[unbreakable]}]

# Charged
#give @s crossbow[unbreakable={show_in_tooltip:false}, custom_data={raycast:1b}, enchantments={levels:{quick_charge:2},show_in_tooltip:true}, charged_projectiles=[{id:"minecraft:arrow"}], hide_additional_tooltip={}]