place template spleef:color1 30000 10 50000 none none
place template spleef:color2 30000 10 50000 none none .5
place template spleef:color3 30000 10 50000 none none .3333
execute if score ?colors spleef.game matches 4.. run place template spleef:color4 30000 10 50000 none none .25
execute if score ?colors spleef.game matches 5.. run place template spleef:color5 30000 10 50000 none none .2
execute if score ?colors spleef.game matches 6.. run place template spleef:color6 30000 10 50000 none none .1667
execute if score ?colors spleef.game matches 7 run place template spleef:color7 30000 10 50000 none none .142857