# 2 = ticks → mm:ss (without decimals)
$data modify storage main:temp formatted set value "$(min):$(sec_tens)$(sec_ones)"
