
import unittest
from unittest import TestCase
from model import Park, example_data, connect_to_db, db
from server import app
import server
import creategeojson


class FlaskTestsBasic(unittest.TestCase):
    """Tests for barkPark"""

    def setUp(self):
         # Get the Flask test client
        self.client = server.app.test_client()
        # Show Flask errors that happen during tests
        server.app.config['TESTING'] = True

    def test_homepage(self):
        #Checks that the h1 is rendering in homepage.html
        result = self.client.get("/")
        self.assertIn("<h1>Bark Park!!</h1>", result.data)

    # def test_creategeojson(self):
    #     assert creategeojson()

class FlaskTestsDatabase(TestCase):
    """Flask tests that use the database."""

    def setUp(self):
        """Stuff to do before every test."""

        # Get the Flask test client
        self.client = app.test_client()
        app.config['TESTING'] = True

        # Connect to test database
        connect_to_db(app, "postgresql:///testdb")

        # Create tables and add sample data
        db.create_all()
        example_data()

    def tearDown(self):
        """Do at end of every test."""

        db.session.close()
        db.drop_all()

    def test_park_list(self):
        """Test create_map_features."""

        result = self.client.get("/create_map_features.json")
        self.assertIn("JAPANTOWN PEACE PLAZA", result.data)


    # def test_departments_details(self):
    #     """Test departments page."""

    #     result = self.client.get("/department/fin")
    #     self.assertIn("Phone: 555-1000", result.data)

if __name__ == "__main__":
    unittest.main()
