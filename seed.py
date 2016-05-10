from sqlalchemy import func
from model import Park
from flask import requests

from model import connect_to_db, connect_to_db
from server import app

#Need to write the function that will call the api from opendata to seed my parks table

def load_sf_parks():
    """Load full park list from sf opendata"""

>>> import requests
>>> r = requests.get("https://data.sfgov.org/resource/94uf-amnx.json")
>>> info = r.json()
>>> for item in info:
...     location = item.get('location_1')
...     if location != None:
...             coordinates = location.get('coordinates')
...             print coordinates[0] or [1]

[0] longitude 
[1] latitutde

# to access latitude and longitute separately item['location_1']['coordinates']
# Parks in SF DATA that return None for location_1 lat/lon:  

# Arkansas Friendship Garden
# ESPRIT PARK
# HOLLY PARK
# Hooker Alley Community Garden
# CRAGS COURT GARDEN
# MT DAVIDSON PARK
# TELEGRAPH HILL/PIONEER PARK
# BAY VIEW PARK
# BERNAL HEIGHTS PARK
# MT OLYMPUS
# Connecticut Friendship Garden
# Dog Patch-Miller Memorial Comm. Garden
# Garden for the Environment
# GOLDEN GATE PARK - Section 1
# GOLDEN GATE PARK - Section 2
# GOLDEN GATE PARK - Section 3 (Arboretum)
# GOLDEN GATE PARK - Section 4
# GOLDEN GATE PARK - Section 5
# GOLDEN GATE PARK - Section 6
# LAKE MERCED PARK
# O'SHAUGHNESSY HOLLOW
# PARK PRESIDIO BLVD
# RIDGETOP PLAZA
# TOPAZ OPEN SPACE
# TWIN PEAKS
# WILLIE WOO WOO WONG PLAYGROUND
# YACHT HARBOR AND MARINA GREEN








