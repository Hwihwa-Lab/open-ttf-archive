import urllib.request
import zipfile
import os
import shutil

FONTS = [
    "Pacifico",
    "Lobster",
    "Yellowtail",
    "Great+Vibes",
    "Titan+One",
    "Fredoka",
    "Bebas+Neue",
    "Luckiest+Guy",
    "Chewy",
    "Cookie",
    "Abril+Fatface",
    "Permanent+Marker",
    "Shrikhand",
    "Oleo+Script",
    "Playfair+Display",
    "Black+Han+Sans"
]

BASE_URL = "https://fonts.google.com/download?family="
FONTS_DIR = "fonts"
TEMP_DIR = "temp_fonts"

if not os.path.exists(FONTS_DIR):
    os.makedirs(FONTS_DIR)

if not os.path.exists(TEMP_DIR):
    os.makedirs(TEMP_DIR)

for font in FONTS:
    url = BASE_URL + font
    zip_path = os.path.join(TEMP_DIR, f"{font}.zip")
    print(f"Downloading {font}...")
    try:
        req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
        with urllib.request.urlopen(req) as response, open(zip_path, 'wb') as out_file:
            shutil.copyfileobj(response, out_file)
            
        with zipfile.ZipFile(zip_path, 'r') as zip_ref:
            zip_ref.extractall(TEMP_DIR)
            
        print(f"Successfully extracted {font}")
    except Exception as e:
        print(f"Failed to download/extract {font}: {e}")

# Move TTF files to fonts directory
for root, dirs, files in os.walk(TEMP_DIR):
    for file in files:
        if file.endswith('.ttf'):
            shutil.move(os.path.join(root, file), os.path.join(FONTS_DIR, file))

# Cleanup
shutil.rmtree(TEMP_DIR)
print("Done!")
