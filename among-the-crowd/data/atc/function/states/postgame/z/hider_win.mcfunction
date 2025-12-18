title @a title {"text": "Hiders win!", "color": "green"}
tellraw @a {"text": "Hiders win!", "color": "green"}
tellraw @a {"text": "Remaining Players: ", "extra": [{"selector": "@a[team=atc.hiders]", "color": "green", "separator": {"text": ", ", "color": "yellow"}}], "color": "yellow"}
