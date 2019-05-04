from .db import db, User
from collections import defaultdict
from flask import Flask, request
from flask_sqlalchemy import SQLAlchemy
from enum import Enum
import os
import json

app = Flask(__name__)
app.config.from_object(os.environ["APP_SETTINGS"])
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
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
    # data = [user.serialize() for user in users]
    return json.dumps({"success": True, "data": []}), 200


@app.route('/api/users/', methods=['POST'])
def post_user():
    body = json.loads(request.data.decode('utf-8'))
    user = User(
        uuid=body.get('uuid'),
        first_name=body.get('first_name'),
        last_name=body.get('last_name'),
        grad_year=body.get('grad_year'),
        age=body.get('age'),
        gender=body.get('gender'),
        cleanliness=body.get('cleanliness'),
        bio=body.get('bio')
    )
    db.session.add(user)
    db.session.commit()
    res = {"success": True, "data": user.serialize()}
    return json.dumps(res), 201


@app.route('/api/user/<int:user_id>/', methods=['GET'])
def get_user(user_id):
    user = User.query.filter_by(id=user_id).first()
    if not user:
        return json.dumps({"success": False, "error": "User not found"}), 404
    data = user.serialize()
    return json.dumps({"success": True, "data": data}), 200


@app.route('/api/user/<int:user_id>/', methods=['DELETE'])
def delete_user(user_id):
    user = User.query.filter_by(id=user_id).first()
    if not user:
        return json.dumps({"success": False, "error": "User not found"}), 404
    db.session.delete(user)
    db.session.commit()
    return json.dumps({"success": True, "data": user.serialize()}), 200
