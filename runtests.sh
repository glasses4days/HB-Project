#!/bin/bash

# drop test db
dropdb testdb

#recreate test db
createdb testdb

#execute test script with coverage
coverage run tests.py

#check coverage
coverage report -m 

#creates html of coverage
coverage html