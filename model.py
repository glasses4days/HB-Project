"""Models and database functions for Bark Park"""

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

##############################################################################
# Model definitions

##############################################################################
#Helper functions

# def connect_to_db(app):
#     """Connect the database to Flask app."""

#     # Configure to use PstgreSQL database
#     app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///'
#     db.app = app
#     db.init_app(app)

if __name__ == "__main__":
    # As a convenience, if we run this module interactively, it will leave
    # you in a state of being able to work with the database directly.

    from server import app
    connect_to_db(app)
    print "Connected to DB."