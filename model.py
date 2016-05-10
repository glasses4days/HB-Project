"""Models and database functions for Bark Park"""

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

##############################################################################
# Model definitions

class Park(db.Model):
    """Park list"""

    __tablename__ = "parks"

    park_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    park_name = db.Column(db.String(50), nullable=False)
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
#Helper functions

def connect_to_db(app):
    """Connect the database to Flask app."""

    # Configure to use PstgreSQL database
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///barkParkdb'
    db.app = app
    db.init_app(app)

if __name__ == "__main__":
    # As a convenience, if we run this module interactively, it will leave
    # you in a state of being able to work with the database directly.

    from server import app
    connect_to_db(app)
    print "Connected to DB."