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


@app.route('/create_map_features')
def create_map_features():
    """Creating park features on map"""


    parks_all_data = Park.query.filter(Park.on_leash==True).order_by(Park.park_name).all()
    parks_on_leash = Park.query.filter(Park.on_leash==True).order_by(Park.park_name).all()
    parks_off_leash_unenclosed = Park.query.filter(Park.off_leash_unenclosed==True).order_by(Park.park_name).all()
    parks_off_leash_enclosed = Park.query.filter(Park.off_leash_enclosed==True).order_by(Park.park_name).all()

    geojson_objects = []

    for park in parks_all_data:
        park_name = park.park_name
        longitude = park.longitude
        latitude = park.latitude
        park_dict = {"type": "Feature",
                     "geometry": {
                     "type": "Point",
                     "coordinates": [longitude, latitude]
                     },
                     "properties": {
                     "title": park_name,
                     "marker-symbol": "park"
                     }
                     }     
        geojson_objects.append(park_dict)
    # import pdb; pdb.set_trace()
    markers = {}
    markers["type"] = "FeatureCollection"
    markers["features"] = geojson_objects
    # markers_json = json.dumps(geojson_objects)
    # raise Exception("stop here")
    return jsonify(markers)
    # render_template("homepage.html",
    #                         parks_all_data=parks_all_data,
    #                         parks_on_leash=parks_on_leash,
    #                         parks_off_leash_enclosed=parks_off_leash_enclosed,
    #                         parks_off_leash_unenclosed=parks_off_leash_unenclosed,
    #                         markers=markers_json)


@app.route('/markers.json')
def create_markers():
    """markers"""


@app.route('/render_filter_parks')
def render_filter_parks():
    """Renders form for park filter"""

    return render_template("park_filter.html")


@app.route('/parks')
def display_parks():
    """Displays park data from db using user input."""

    #This will give me the data for all the park I want to work with
    #Filters using on_leash as this is how I'm keeping bad data out
    #Able to access this in for loop through jinja so don't need to write one here

    on_leash = request.args.get("on_leash")
    off_leash_unenclosed = request.args.get("off_leash_unenclosed")
    off_leash_enclosed = request.args.get("off_leash_enclosed")
    #This is parks all data because if on_leash is False, it is not a dog park
    parks_all_data = Park.query.filter(Park.on_leash==True).order_by(Park.park_name).all()
    parks_on_leash = Park.query.filter(Park.on_leash==True).order_by(Park.park_name).all()
    parks_off_leash_unenclosed = Park.query.filter(Park.off_leash_unenclosed==True).order_by(Park.park_name).all()
    parks_off_leash_enclosed = Park.query.filter(Park.off_leash_enclosed==True).order_by(Park.park_name).all()

    return render_template("parks.html",
                            on_leash=on_leash,
                            off_leash_unenclosed=off_leash_unenclosed,
                            off_leash_enclosed=off_leash_enclosed,
                            parks_all_data=parks_all_data,
                            parks_on_leash=parks_on_leash,
                            parks_off_leash_unenclosed=parks_off_leash_unenclosed,
                            parks_off_leash_enclosed=parks_off_leash_enclosed)


@app.route('/enter_info')
def enter_park_info():
    """Form to enter information missing from db"""

    return render_template("enter_missing_info.html")


@app.route('/enter_info', methods=["POST"])
def update_info_in_db():
    """Updates db from info entered into form."""

    park_id = request.form.get("park_id")
    on_leash = request.form.get("on_leash")
    off_leash_enclosed = request.form.get("off_leash_enclosed")
    off_leash_unenclosed= request.form.get("off_leash_unenclosed")
    park_url = request.form.get("park_url")

    update_park = """
        UPDATE parks
        SET on_leash = :on_leash, off_leash_enclosed = :off_leash_enclosed, off_leash_unenclosed = :off_leash_unenclosed, park_url = :park_url
        WHERE park_id = :park_id
        """

    db.session.execute(update_park, {'park_id': park_id, 'on_leash': on_leash, 'off_leash_enclosed': off_leash_enclosed, 'off_leash_unenclosed': off_leash_unenclosed, 'park_url': park_url})
    db.session.commit()

    # print park_id, on_leash, off_leash_enclosed, off_leash_unenclosed, park_url

    #assigning park object to park
    #park = Park.query.get(park_id)
    # decided to go with the one above instead of: park = Park.query.filter(Park.park_id==park_id).one()


    #This would be super repetitive, but I think it might work. For later, checking if value exists.
    # if park.on_leash == None:
    #     park.on_leash = on_leash
    # if park.off_leash_enclosed == None:
    #     park.off_leash_enclosed = off_leash_enclosed
    # if park.off_leash_unenclosed == None:
    #     park.off_leash_unenclosed = off_leash_unenclosed
    # if park_url == None:
    #     park.url = park.url

    return redirect('/enter_info')

if __name__ == "__main__":
    app.debug = True

    connect_to_db(app)

    DebugToolbarExtension(app)

    app.run()