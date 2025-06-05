data modify storage stringlib:input replace set value {Find: ":", Replace: ".", n: 1}
$data modify storage stringlib:input replace.String set from $(src)
function stringlib:util/replace
$data modify $(dst) set from storage stringlib:output replace
