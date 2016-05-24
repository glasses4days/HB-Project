""" Bark Park server """

from flask import Flask, render_template, redirect, request, flash, session, g, jsonify
from flask_debugtoolbar import DebugToolbarExtension
from jinja2 import StrictUndefined
from sqlalchemy import update
import simplejson as json
from model import connect_to_db, db, Park

app = Flask(__name__)

app.secret_key = "very_very_secret"

app.jinja_env.undefined = StrictUndefined


@app.route('/')
def index():
    """Homepage"""


    return render_template("homepage.html")


@app.route('/create_map_features.json')
def create_map_features():
    """Creating park features on map"""


    #This will give me the data for all the park I want to work with
    #Filters using on_leash as this is how I'm keeping bad data out
    parks_all_data = Park.query.filter(Park.on_leash==True).order_by(Park.park_name).all()

    geojson_objects = []

    # Can this be simplified?
    for park in parks_all_data:
        park_name = park.park_name
        if park.on_leash:
            on_leash = True
        else:
            on = False
        if park.off_leash_unenclosed:
            off_un = True
        else:
            off_un = False
        if park.off_leash_enclosed:
            off_en = True
        else:
            off_en = False
        longitude = park.longitude
        latitude = park.latitude
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
        geojson_objects.append(park_dict)

    markers = {}
    markers["type"] = "FeatureCollection"
    markers["features"] = geojson_objects

    return jsonify(markers)


@app.route('/enter_info')
def enter_park_info():
    """Form to enter information missing from db"""

    return render_template("enter_missing_info.html")


@app.route('/enter_info', methods=["POST"])
def update_info_in_db():
    """Updates db from info entered into form."""

    park_id = request.form.get("park_id")
    latitude = request.form.get("latitude")
    longitude = request.form.get("longitude")
    # Commented out code below depending on what info I need to add to db.

    # on_leash = request.form.get("on_leash")
    # off_leash_enclosed = request.form.get("off_leash_enclosed")
    # off_leash_unenclosed= request.form.get("off_leash_unenclosed")
    # park_url = request.form.get("park_url")

    # update_park = """
    #     UPDATE parks
    #     SET latitude = :latitude, longitude = :longitude, on_leash = :on_leash, off_leash_enclosed = :off_leash_enclosed, off_leash_unenclosed = :off_leash_unenclosed, park_url = :park_url
    #     WHERE park_id = :park_id
    #     """

    # To update just lat/long
    update_park = """
        UPDATE parks
        SET latitude = :latitude, longitude = :longitude
        WHERE park_id = :park_id
        """
    db.session.execute(update_park, {'park_id': park_id, 'latitude': latitude, 'longitude': longitude})
    #This is for adding park type filter and url.
    # db.session.execute(update_park, {'latitude': latitude, 'longitude':longitude, 'on_leash': on_leash, 'off_leash_enclosed': off_leash_enclosed, 'off_leash_unenclosed': off_leash_unenclosed, 'park_url': park_url})
    db.session.commit()

    return redirect('/enter_info')

if __name__ == "__main__":
    app.debug = True

    connect_to_db(app)

    DebugToolbarExtension(app)

    app.run()
