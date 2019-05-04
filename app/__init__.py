import json
import os
from enum import Enum
from flask import Flask, request
from collections import defaultdict
from .db import db, User, Location
import geocoder

GOOGLE_API_KEY = os.environ['GOOGLE_API_KEY']

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = os.environ['DATABASE_URL']
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True

db.init_app(app)
with app.app_context():
    db.create_all()


@app.route('/')
def root():
    return "Hello world!"


@app.route('/api/users/', methods=['GET'])
def get_users():
    users = User.query.all()
    data = [user.serialize() for user in users]
    return json.dumps({"success": True, "data": data}), 200


@app.route('/api/users/', methods=['POST'])
def post_user():
    body = json.loads(request.data.decode('utf-8'))
    # uuid = body.get('uuid')
    # if User.query.filter_by(uuid=uuid).first():
    #     return json.dumps({"success": False, "error": "User already exists"}), 400
    city = body.get('city')     # make capitalization consistent
    state = body.get('state')   # turn into abbreviation
    address = body.get('address')
    g = geocoder.google(
        "{}, {}, {}".format(address, city, state))
    if not g.ok:
        return json.dumps({"success": False, "error": "Invalid location"}), 400
    latitude, longitude = g.latlng
    location = Location.query.filter_by(
        latitude=latitude, longitude=longitude).first()
    if not location:
        location = Location(
            city=city,
            state=state,
            address=address,
            latitude=latitude,
            longitute=longitude
        )
        print("Location created")
        print(location.id)
    print("Location found")
    user = User(
        uuid=body.get('uuid'),
        name=body.get('name'),
        netid=body.get('netid'),
        grad_year=body.get('grad_year'),
        age=body.get('age'),
        gender=body.get('gender'),
        sleep_time=body.get('sleep_time'),
        cleanliness=body.get('cleanliness'),
        bio=body.get('bio'),
        email=body.get('email'),
        phone=body.get('phone'),
        location=location.id
    )
    db.session.add(user)
    db.session.commit()
    res = {"success": True, "data": user.serialize()}
    return json.dumps(res), 201


@app.route('/api/user/<int:user_id>/', methods=['GET'])
def get_user(user_id):
    user = User.query.filter_by(uuid=user_id).first()
    if not user:
        return json.dumps({"success": False, "error": "User not found"}), 404
    data = user.serialize()
    return json.dumps({"success": True, "data": data}), 200


@app.route('/api/user/<int:user_id>/', methods=['DELETE'])
def delete_user(user_id):
    user = User.query.filter_by(uuid=user_id).first()
    if not user:
        return json.dumps({"success": False, "error": "User not found"}), 404
    db.session.delete(user)
    db.session.commit()
    return json.dumps({"success": True, "data": user.serialize()}), 200
