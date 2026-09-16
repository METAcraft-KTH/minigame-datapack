# 3 = ticks → mm:ss (with decimals)
$data modify storage main:temp formatted set value "$(min):$(sec_tens)$(sec_ones).$(hundredths_tens)$(hundredths_ones)"
