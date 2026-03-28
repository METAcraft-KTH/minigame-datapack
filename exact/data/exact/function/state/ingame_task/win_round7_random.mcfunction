# ============================================================
# exact:state/ingame_task/win_round7_random
# Randomized round 7 win message selection
# ============================================================

execute store result score #round7_msg exact.state run random value 1..10
execute if score #round7_msg exact.state matches 1 run function exact:state/ingame_task/win_tellraw {verb:"te monte yon dezyèm tou!","color":"gray"}
execute if score #round7_msg exact.state matches 2 run function exact:state/ingame_task/win_tellraw {verb:"ਨੇ ਦੂਜਾ ਟਾਵਰ ਖੜਾ ਕੀਤਾ!","color":"gray"}
execute if score #round7_msg exact.state matches 3 run function exact:state/ingame_task/win_tellraw {verb:"가 두 번째 탑을 세웠다!","color":"gray"}
execute if score #round7_msg exact.state matches 4 run function exact:state/ingame_task/win_tellraw {verb:"пабудаваў другую вежу!","color":"gray"}
execute if score #round7_msg exact.state matches 5 run function exact:state/ingame_task/win_tellraw {verb:"இரண்டாவது கோபுரத்தை எழுப்பினார்!","color":"gray"}
execute if score #round7_msg exact.state matches 6 run function exact:state/ingame_task/win_tellraw {verb:"reisti annan turna!","color":"gray"}
execute if score #round7_msg exact.state matches 7 run function exact:state/ingame_task/win_tellraw {verb:"သည် ဒုတိယတိုင်တစ်ခုကို တည်ဆောက်ခဲ့သည်။","color":"gray"}
execute if score #round7_msg exact.state matches 8 run function exact:state/ingame_task/win_tellraw {verb:"მეორე კოშკი ააშენა!","color":"gray"}
execute if score #round7_msg exact.state matches 9 run function exact:state/ingame_task/win_tellraw {verb:"đã xây dựng một tháp thứ hai!","color":"gray"}
execute if score #round7_msg exact.state matches 10 run function exact:state/ingame_task/win_tellraw {verb:"豎咗第二座塔！","color":"gray"}