from model import Park
import requests
from model import connect_to_db, db
from server import app


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
            #sets on_leash to True for all SF parks (this is their dog policy!)
            on_leash = True
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
                        longitude=longitude,
                        on_leash=on_leash)

            db.session.add(park)

    db.session.commit()


def load_oak_parks():
    """Load parks from oakland opendata"""

    r = requests.get("https://data.oaklandnet.com/resource/bus4-zq9x.json")
    oak_info = r.json()

    for item in oak_info:
        #Leaves out park types that don't apply
        if item.get('facility_type', None) == 'Park' or item.get('facility_type', None) == 'Dog Play Area':
            park_name = item.get('parks_and_recreation_facilities')
            address = item.get('location_1_location')
            lat_long = item.get('location_1')
            if lat_long != None:
                coordinates = lat_long.get('coordinates')
                latitude = coordinates[1]
                longitude = coordinates[0]
            else:
                latitude = None
                longitude = None
            if item.get('facility_type', None) == 'Dog Play Area':
            #Auto sets "dog play areas" to on_leash and off_leash_enclosed
                on_leash = True
                off_leash_enclosed = True
            else:
                #Set on leash to None because that will change
                on_leash = None
                #Set off leash enclosed to 0 because these are the only off leash
                #enclosed parks
                off_leash_enclosed = False

            park = Park(park_name=park_name,
                        address=address,
                        latitude=latitude,
                        longitude=longitude,
                        on_leash=on_leash,
                        off_leash_enclosed=off_leash_enclosed)

            db.session.add(park)

    db.session.commit()


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
    # load_sf_parks()
    # load_oak_parks()
