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

        return "<Park park_id=%s park_name=%s address=%s latitude=%s longitude=%s on_leash=%s off_leash_enclosed=%s off_leash_unenclosed=%s park_url=%s>" % (self.park_id, self.park_name, self.address, self.latitude, self.longitude, self.on_leash,
            self.off_leash_enclosed, self.off_leash_unenclosed, self.park_url)

class User(db.Model):
    """User list"""

    __tablename__ = "users"

    user_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    user_name = db.Column(db.String(15), nullable=False, unique=True)
    email = db.Column(db.String(64), nullable=False, unique=True)
    password = db.Column(db.String(64), nullable=False)
    created_at = db.Column(db.DateTime, nullable=False)

    def __repr__(self):
        """Provide helpful representation when printed"""

        return "<User user_id=%s user_name=%s email=%s password=%s created_at=%s>" % (self.user_id, self.user_name, self.email, self.password, self.created_at)

class Comment(db.Model):
    """Comment list"""

    __tablename__ = "comments"

    comment_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False)
    park_id = db.Column(db.Integer, db.ForeignKey('parks.park_id'), nullable=False)
    created_at = db.Column(db.DateTime, nullable=False)
    content = db.Column(db.String(2000), nullable=False)

    # Define relationship to user

    user = db.relationship("User", backref=db.backref('comments', order_by=comment_id))

    # Define relationship to park

    park = db.relationship("Park", backref=db.backref('comments', order_by=comment_id))

    def __repr__(self):
        """Provide helpful representation when printed"""

        return "<Comment comment_id=%s user_id=%s park_id=%s created_at=%s content=%s>" % (self.comment_id,
            self.user_id, self.park_id, self.created_at, self.content)

class Photo(db.Model):
    """Photo list"""

    __tablename__ = "photos"

    photo_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    park_id = db.Column(db.Integer, db.ForeignKey('parks.park_id'), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False)
    created_at = db.Column(db.DateTime, nullable=False)
    url = db.Column(db.Unicode(2083), nullable=False)
    description = db.Column(db.String(200), nullable=False)

    # Define relationship to user

    user = db.relationship("User", backref=db.backref('photos', order_by=photo_id))

    # Define relationship to park

    park = db.relationship("Park", backref=db.backref('photos', order_by=photo_id))

    def __repr__(self):
        """Provide helpful representation when printed"""

        return "<Photo photo_id=%s park_id=%s user_id=%s created_at=%s url=%s description=%s>" % (self.photo_id,
            self.park_id, self.user_id, self.created_at, self.url, self.description)


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