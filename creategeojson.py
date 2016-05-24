# Helper function to create a dictionary of geojson info for each park


def create_geojson(park):
    """creates a geojson from park info in db"""

    park_name = park.park_name
    #checks if on_leash, off_leash_unenclosed, and off_leash_enclosed are
    #True or False in db. Have if/else for each, because each park can have
    #true for more than one filter
    if park.on_leash:
        on_leash = True
    else:
        on_leash = False
    if park.off_leash_unenclosed:
        off_un = True
    else:
        off_un = False
    if park.off_leash_enclosed:
        off_en = True
    else:
        off_en = False
    #Sets longitude and latitude
    longitude = park.longitude
    latitude = park.latitude
    #Creates dictionary for park
    park_dict = {"type": "Feature",
                 "geometry": {
                 "type": "Point",
                 "coordinates": [longitude, latitude]
                 },
                 "properties": {
                 "title": park_name,
                 "marker-symbol": "park",
                 "on_leash": on_leash,
                 "off_leash_open": off_un,
                 "off_leash_fenced": off_en
                 }
                 }
    return park_dict
