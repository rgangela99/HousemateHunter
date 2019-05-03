from flask_sqlalchemy import SQLAlchemy
from .app_enums import Gender
import geocoder
import os

os.environ['GOOGLE_API_KEY'] = "AIzaSyAQE2g8Vgb9YcEI6JZ_Bxnaeo59X0w3FqU"

db = SQLAlchemy()


class User(db.Model):
    __tablename__ = 'user'
    uuid = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False)
    netid = db.Column(db.String, nullable=False)
    grad_year = db.Column(db.Integer, nullable=False)
    age = db.Column(db.Integer, nullable=False)
    gender = db.Column(db.Boolean, nullable=False)
    sleep_time = db.Column(db.Integer, nullable=False)
    cleanliness = db.Column(db.Integer, nullable=False)
    bio = db.Column(db.String, nullable=False)
    email = db.Column(db.String)
    phone = db.Column(db.String)
    location = db.relationship('Location')

    def __init__(self, **kwargs):
        self.uuid = kwargs.get('uuid')
        self.name = kwargs.get('name')
        self.netid = kwargs.get('netid')
        self.grad_year = kwargs.get('grad_year')
        self.age = kwargs.get('age')
        self.gender = kwargs.get('gender')
        self.sleep_time = kwargs.get('sleep_time')
        self.cleanliness = kwargs.get('cleanliness')
        self.bio = kwargs.get('bio')
        self.email = kwargs.get('email')
        self.phone = kwargs.get('phone')

    def serialize(self):
        return {
            "id": self.id,
            "name": self.name,
            "netid": self.netid,
            "grad_year": self.grad_year,
            "age": self.age,
            "gender": self.gender,
            "sleep_time": self.sleep_time,
            "cleanliness": self.cleanliness,
            "bio": self.bio,
            "email": self.email,
            "phone": self.phone
        }


class Location(db.Model):
    __tablename__ = 'location'
    id = db.Column(db.Integer, primary_key=True)
    city = db.Column(db.String, nullable=False)
    state = db.Column(db.String, nullable=False)
    address = db.Column(db.String)
    users = db.relationship("User", back_populates="location")


class Match(db.Model):
    __tablename__ = 'match'
    id = db.Column(db.Integer, primary_key=True)
