import unittest

import server
import creategeojson

class ParkTests(unittest.TestCase):
    """Tests for barkPark"""

    def setUp(self):
        self.client = server.app.test_client()
        server.app.config['TESTING'] = True
         # Connect to test database
        connect_to_db(app, "postgresql:///testdb")

        # Create tables and add sample data
        db.create_all()
        example_data()

    def tearDown(self):
        """Do at end of every test."""

        db.session.close()
        db.drop_all()

    def test_homepage(self):
        result = self.client.get("/")
        self.assertIn("<h1>Bark Park!!</h1>", result.data)

    def test_creategeojson(self):
        assert creategeojson()

if __name__ == "__main__":
    unittest.main()
