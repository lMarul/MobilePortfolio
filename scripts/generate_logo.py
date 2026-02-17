from PIL import Image, ImageDraw, ImageFont, ImageFilter
import os
import math

base_dir = os.getcwd()
images_dir = os.path.join(base_dir, "assets", "images")

if not os.path.exists(images_dir):
    os.makedirs(images_dir)

size = (1024, 1024)
# Colors from AppColors
bg_color = (0, 0, 0, 0)    # Transparent
primary_red = (220, 38, 38) # #DC2626
bright_red = (239, 68, 68)  # #EF4444
dark_red = (185, 28, 28)    # #B91C1C
black = (0, 0, 0)           # #000000 - For M letter

# Create Base Image
img = Image.new('RGBA', size, bg_color)
draw = ImageDraw.Draw(img)

def draw_hexagon(draw, center, radius, color, width):
    points = []
    for i in range(6):
        angle_deg = 60 * i - 30
        angle_rad = math.pi / 180 * angle_deg
        x = center[0] + radius * math.cos(angle_rad)
        y = center[1] + radius * math.sin(angle_rad)
        points.append((x, y))
    
    points.append(points[0]) # close loop
    draw.line(points, fill=color, width=width, joint='curve')

center = (512, 512)
radius = 400

# Draw layered hexagons with Red Theme
# Outer Hex - Dark Red
draw_hexagon(draw, center, radius, dark_red, 40)
# Inner Hex - Bright Red
draw_hexagon(draw, center, radius - 60, primary_red, 20)

# Draw 'M' inside
m_width = 300
m_height = 300
start_x = center[0] - m_width // 2
start_y = center[1] + m_height // 2

# Points for M
p1 = (start_x, start_y)
p2 = (start_x, start_y - m_height)
p3 = (center[0], start_y - m_height * 0.4)
p4 = (start_x + m_width, start_y - m_height)
p5 = (start_x + m_width, start_y)

points_m = [p1, p2, p3, p4, p5]

# Draw M with gradient-like effect (simulated by layering)
# Using black for M to stand out against red background
draw.line(points_m, fill=black, width=50, joint='curve')

# Save logo.png (Square with BG)
logo_path = os.path.join(images_dir, "logo.png")
img.save(logo_path)
print(f"Generated logo at {logo_path}")

# Save icon.png (Square with BG - for simple icon)
icon_path = os.path.join(images_dir, "icon.png")
img.save(icon_path)
print(f"Generated icon at {icon_path}")

# Save icon_foreground.png (Transparent BG)
fg_img = Image.new('RGBA', size, (0, 0, 0, 0))
fg_draw = ImageDraw.Draw(fg_img)
# Draw just the inner hex and M for foreground
draw_hexagon(fg_draw, center, radius - 60, primary_red, 20) 
fg_draw.line(points_m, fill=black, width=50, joint='curve') 

fg_path = os.path.join(images_dir, "icon_foreground.png")
fg_img.save(fg_path)
print(f"Generated icon_foreground at {fg_path}")
