import os

# Create output directory if needed
output_dir = "mcfunctions"
os.makedirs(output_dir, exist_ok=True)

# Template for the file content
template = """execute unless score game.id GLOBAL matches 1 run return run advancement revoke @s only exact:{x}
execute unless score ?state exact.game matches 22 run return run advancement revoke @s only exact:{x}
execute unless score ?round.number exact.game matches {x} run return run advancement revoke @s only exact:{x}

function exact:states/ingame_run/win
"""

# Generate 15 files with numbered names
for i in range(1, 16):
    filename = os.path.join(f"{i}.mcfunction")
    with open(filename, "w") as f:
        f.write(template.format(x=i))

print("Files generated successfully.")