from model import Park
import requests
from model import connect_to_db, db
from server import app

#Need to write the function that will call the api from opendata to seed my parks table


def load_sf_parks():
    """Load full park list from sf opendata"""

    Park.query.delete()

    r = requests.get("https://data.sfgov.org/resource/94uf-amnx.json")
    sf_info = r.json()

    for item in sf_info:
        #Leaves out park types that don't apply
        if item['parktype'] != 'Community Garden' and item['parktype'] != 'Concession' and item['parktype'] != 'Zoological Garden':
            park_name = item.get('parkname')
            address = item.get('location_1_location')
            lat_long = item.get('location_1')
            #Checks to see if the lat/long has a value, and if it does, it gets it
            if lat_long != None:
                coordinates = lat_long.get('coordinates')
                latitude = coordinates[1]
                longitude = coordinates[0]
            else:
                latitude = None
                longitude = None

            park = Park(park_name=park_name,
                        address=address,
                        latitude=latitude,
                        longitude=longitude)

            db.session.add(park)

    db.session.commit()

# >>> import requests
# >>>
# >>> info = r.json()

# >>> for item in info:
# ...     park_names = item.get('parkname')
# ...     print park_names


#  for item in info:
# ...     addresses = item.get('location_1_location')
# ...     print address

# >>> for item in info:
# ...     location = item.get('location_1')
# ...     if location != None:
# ...             coordinates = location.get('coordinates')
# ...             print coordinates[0] or [1]

# [0] longitude
# [1] latitutde

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

if __name__ == "__main__":
    connect_to_db(app)

    # In case tables haven't been created, create them
    db.create_all()

    # Import different types of data
    load_sf_parks()
