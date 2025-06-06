with open("summon_markers.mcfunction", "w") as file:
    file.write(f'kill @e[tag=spleef.floor,type=marker]\n')
    
    n = 48  # floor 1 width
    for x in range(n):
        for y in range(n):
            tags = ["spleef.floor","spleef.floor1"]
            if y==0 or y==47 or x==0 or x==47:
                tags.append("spleef.border")
            file.write(f'summon marker {x+50000} 10 {y} {{Tags:{tags}}}\n')

    n = 40  # floor 2 width
    for x in range(n):
        for y in range(n):
            tags = ["spleef.floor","spleef.floor2"]
            if y==0 or y==39 or x==0 or x==39:
                tags.append("spleef.border")
            file.write(f'summon marker {x+50004} 15 {y+4} {{Tags:{tags}}}\n')

    n = 32  # floor 3 width
    for x in range(n):
        for y in range(n):
            tags = ["spleef.floor","spleef.floor3"]
            if y==0 or y==31 or x==0 or x==31:
                tags.append("spleef.border")
            file.write(f'summon marker {x+50008} 20 {y+8} {{Tags:{tags}}}\n')

    n = 24  # floor 4 width
    for x in range(n):
        for y in range(n):
            tags = ["spleef.floor","spleef.floor4"]
            if y==0 or y==23 or x==0 or x==23:
                tags.append("spleef.border")
            file.write(f'summon marker {x+50012} 25 {y+12} {{Tags:{tags}}}\n')