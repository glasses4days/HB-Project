"""Models and database functions for Bark Park"""

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

##############################################################################
# Model definitions

class Park(db.Model):
    """Park list"""

    __tablename__ = "parks"

    park_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    park_name = db.Column(db.String(100), nullable=False)
    address = db.Column(db.String(100))
    latitude = db.Column(db.Numeric)
    longitude = db.Column(db.Numeric)
    on_leash = db.Column(db.Boolean)
    off_leash_enclosed = db.Column(db.Boolean)
    off_leash_unenclosed = db.Column(db.Boolean)
    park_url = db.Column(db.String(100))

    def __repr__(self):
        """Provide helpful representation when printed"""

        return "<Parks park_id=%s park_name=%s address=%s latitude=%s longitude=%s on_leash=%s off_leash_enclosed=%s off_leash_unenclosed=%s park_url=%s>" % (self.park_id, self.park_name, self.address, self.latitude, self.longitude, self.on_leash,
            self.off_leash_enclosed, self.off_leash_unenclosed, self.park_url)

##############################################################################
#Creates test database

def example_data():
    """Create some sample data."""

    park_one = Park(park_id = 1, 
                    park_name = 'INDIA BASIN SHORELINE PARK',
                    address = 'Evans',
                    latitude = 37.73366342,
                    longitude = -122.37371901,
                    on_leash = True, 
                    off_leash_enclosed = False,
                    off_leash_unenclosed = False,
                    park_url = None)

    park_two = Park(park_id = 2, 
                    park_name = 'JAPANTOWN PEACE PLAZA',
                    address = 'Post',
                    latitude = 37.78520911,
                    longitude = -122.42975098,
                    on_leash = True, 
                    off_leash_enclosed = False,
                    off_leash_unenclosed = False,
                    park_url = None)

    park_three = Park(park_id = 3, 
                    park_name = 'JOSEPH CONRAD MINI PARK',
                    address = '601 Beach St',
                    latitude = 37.80667244,
                    longitude = -122.41906274,
                    on_leash = True, 
                    off_leash_enclosed = True,
                    off_leash_unenclosed = False,
                    park_url = 'http://sfrecpark.org/destination/joseph-conrad-mini-park/')

    db.session.add_all([park_one, park_two, park_three])
    db.session.commit()

##############################################################################
#Helper functions

def connect_to_db(app, db_uri="postgresql:///barkParkdb"):
    """Connect the database to Flask app."""

    # Configure to use PstgreSQL database
    app.config['SQLALCHEMY_DATABASE_URI'] = db_uri
    db.app = app
    db.init_app(app)

if __name__ == "__main__":
    # As a convenience, if we run this module interactively, it will leave
    # you in a state of being able to work with the database directly.

    from server import app
    connect_to_db(app)
    print "Connected to DB."