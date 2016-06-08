# Bark Park!
Bark Park is a web app that gives users an easy way to find dog friendly parks in both San Francisco and Oakland. Users can filter to find the right park for them and their dog, whether their needs are "on leash”, “off leash”, or “enclosed”. Using the Mapbox API park locations are conveniently displayed on a map with interactive markers. 


![Bark Park main](https://raw.githubusercontent.com/glasses4days/HB-Project/master/static/img/ss_2.png)

Designed to be user friendly, once a marker is selected a sidebar displays further park information; including a link to a park’s website, comments about the park from other users, and park photos.

![Bark Park park info](https://raw.githubusercontent.com/glasses4days/HB-Project/master/static/img/ss_3a.png)

Once a park is selected, users can also add their own comments and photos for any park that they’ve experienced with their pooch.

![Bark Park add comment or photo](https://raw.githubusercontent.com/glasses4days/HB-Project/master/static/img/ss_4a.png)

## <a name="technologiesused"></a>Technologies Used

* Python
* Flask
* PostgresSQL
* SQLAlchemy
* Javascript/jQuery
* Jinja2
* Bootstrap
* MapBox API

### Running locally

  * Set up and activate a python virtualenv, and install all dependencies:
    * `pip install -r requirements.txt`
  * Make sure you have PostgreSQL running. Create a new database in psql named barkParkdb:
	* `psql`
  	* `CREATE DATABASE barkParkdb;`
  * Create the tables in your database:
    * `python -i model.py`
    * While in interactive mode, create tables: `db.create_all()`
    * Seed the tables: `psql barkParkdb < dump.sql`
  * Now, quit interactive mode. Start up the flask server:
    * `python server.py`
  * Go to localhost:5000 to see the web app

## <a name="v2"></a>Version 2.0
Next steps for Bark Park include implementing a secure user login, user park input handled via moderation, directions/route to park from user location.

## <a name="author"></a>Author
Cooper is a software engineer living in the Bay Area.
