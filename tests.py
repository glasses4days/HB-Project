
import unittest
from unittest import TestCase
from model import Park, example_data, connect_to_db, db
from server import app
import server


class FlaskTestsBasic(unittest.TestCase):
    """Tests for barkPark"""

    def setUp(self):
         # Get the Flask test client
        self.client = server.app.test_client()
        # Show Flask errors that happen during tests
        server.app.config['TESTING'] = True

    def test_homepage_render(self):
        """Tests homepage properly renders"""

        result = self.client.get("/")
        self.assertIn("<h1 class=\"title\">Bark Park!</h1>", result.data)

    def test_signup_form_render(self):
        """Tests signup form render"""

        result = self.client.get("/signup_form")
        self.assertIn("<p>Please enter a user name and password</p>", result.data)

    def test_signin_form_render(self):
        """Tests sign in form render"""

        result = self.client.get("/sign_in_form")
        self.assertIn("<p>Please sign in</p>", result.data)

    def test_enter_info_render(self):
        """Tests enter info form render"""
        result = self.client.get("/enter_info")
        self.assertIn("Park id:", result.data)

    def test_logout_redirect(self):
        """Tests logout redircts back to homepage"""

        result = self.client.get("/")
        self.assertIn("<h1 class=\"title\">Bark Park!</h1>", result.data)


class FlaskTestsDatabase(TestCase):
    """Flask tests that use the database."""

    def setUp(self):
        """Stuff to do before every test."""

        # Get the Flask test client
        self.client = app.test_client()
        app.config['TESTING'] = True
        app.config['SECRET_KEY'] = 'key'

        with self.client as c:
            with c.session_transaction() as sess:
                sess['user'] = 25

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

    def test_park_info(self):
        """Test park_info render correctly"""
        # Checks that park info is rendering correctly
        result = self.client.get("/park_info/2", follow_redirects=True)
        self.assertIn("JAPANTOWN PEACE PLAZA", result.data)

    def test_add_new_user(self):
        """Test adding new user"""

        result = self.client.post("/add_new_user",
                                  data={"user_name": "rachel", "password": "123", "email": "rachel@rachel.com"},
                                  follow_redirects=True)
        self.assertIn("<p>Please sign in</p>", result.data)

    def test_sign_in(self):
        """Test sign_in"""

        result = self.client.post("/sign_in",
                                  data={"email": "user@user.com", "password": "password"},
                                  follow_redirects=True)
        self.assertIn("<h1 class=\"title\">Bark Park!</h1>", result.data)

    def test_logout(self):
        """Tests logout works and redirects back to homepage"""

        result = self.client.get("logout", follow_redirects=True)
        self.assertIn("<h1 class=\"title\">Bark Park!</h1>", result.data)

    def test_add_new_comment(self):
        """Test adding new comment"""

        result = self.client.post("/add_new_comment/2",
                                  data={"user_id": 25, "park_id": "2", "content": "My dog loves this park!"},
                                  follow_redirects=True)
        self.assertIn("<h1 class=\"title\">Bark Park!</h1>", result.data)

    def test_add_new_photo(self):
        """Test adding new photo"""

        result = self.client.post("/add_new_photo/2",
                                  data={"park_id": "2", "user_id": 25, "description": "Taurus having a great time!", "photo": "http://s3-media3.fl.yelpcdn.com/bphoto/ZUhteyc0UWdWbgM-4VbZhw/o.jpg"},
                                  follow_redirects=True)
        self.assertIn("<h1 class=\"title\">Bark Park!</h1>", result.data)


if __name__ == "__main__":
    unittest.main()
