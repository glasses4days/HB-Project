""" Bark Park server """

from flask import Flask, render_template, redirect, request, flash, session, g, jsonify
from flask_debugtoolbar import DebugToolbarExtension
from jinja2 import StrictUndefined
from sqlalchemy import update
import simplejson as json
from model import connect_to_db, db, Park, User, Comment, Photo
from creategeojson import create_geojson
from datetime import datetime

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

    #This for loop builds the dictionary that will be the base for the geojson
    #for map markers.
    for park in parks_all_data:
        #calls helper function create_geojson() for each park
        park_dict = create_geojson(park)
        #Appends each dictionary to the geo_json objects list
        geojson_objects.append(park_dict)
    #Intializes empty dictionary marker
    markers = {}
    #Creates key: value pair for type: feature collection
    markers["type"] = "FeatureCollection"
    #creates key value pair for feature: entire geojson_objects
    markers["features"] = geojson_objects

    return jsonify(markers)

@app.route('/park_info/<park_id>')
def display_park_info(park_id):
    """Renders template dispaying the chosen park"""

    park = Park.query.filter(Park.park_id==park_id).one()

    return render_template("park_info.html", park=park)

@app.route('/signup_form')
def render_signup():
    """Render signup form template"""

    return render_template("signup.html")

@app.route('/add_new_user', methods=["POST"])
def add_new_user():
    """Check for user and add to database"""

    user_name = request.form.get("user_name")
    email = request.form.get("email")
    password = request.form.get("password")
    created_at = datetime.now()

    new_user = User(user_name=user_name, email=email, password=password, created_at=created_at)

    try:
        User.query.filter(User.email == email).one()
        # Probably need to do somthing else here instead of just printing that
        # the user exists
        print "This user exists"
    except:
        db.session.add(new_user)
        flash("Successfully signed up. Please login.")

    db.session.commit()

    return redirect('/sign_in_form')

@app.route('/sign_in_form')
def render_sign_in_form():
    """Renders sign in form template"""

    return render_template('sign_in_form.html')

@app.route('/sign_in', methods=["POST"])
def sign_in():
    """Checks if username/password is correct and logs in"""

    email = request.form.get("email")
    password = request.form.get("password")

    try:
        User.query.filter(User.email == email, User.password == password).one()
        session['user'] = email
        print session
        return redirect('/')
    except:
        print email, password
        return "False"

@app.route('/logout')
def logout():
    """User is logged out of session"""

    session['user'] = ''

    flash('Logged out punk')
    print "Logged out"

    return redirect('/')

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
