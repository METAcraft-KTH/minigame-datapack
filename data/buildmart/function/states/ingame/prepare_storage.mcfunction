from buildmart:lib import getItems

itemList = getItems()

data modify storage buildmart:valid_items items set value []
data modify storage buildmart:valid_items item_generator set value []
for item in itemList:
	data modify storage buildmart:valid_items item_generator append value item

for item in itemList:
	$execute unless data storage buildmart:valid_items items[$(count)] run function buildmart:states/ingame/helper/for_item

data remove storage buildmart:valid_items item_generator
