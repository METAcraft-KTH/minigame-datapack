$data modify storage buildmart:valid_items items append from storage buildmart:valid_items item_generator[$(random)]
$data remove storage buildmart:valid_items item_generator[$(random)]
