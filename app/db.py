from flask_sqlalchemy import SQLAlchemy
from .app_enums import Gender


db = SQLAlchemy()


class User(db.Model):
    __tablename__ = 'user'
    uuid = db.Column(db.String, primary_key=True)
    name = db.Column(db.String, nullable=False)
    netid = db.Column(db.String, nullable=False)
    grad_year = db.Column(db.Integer, nullable=False)
    age = db.Column(db.Integer, nullable=False)
    gender = db.Column(db.Integer, nullable=False)
    sleep_time = db.Column(db.Integer, nullable=False)
    cleanliness = db.Column(db.Integer, nullable=False)
    bio = db.Column(db.String, nullable=False)
    email = db.Column(db.String)
    phone = db.Column(db.String)
    location_id = db.Column(db.Integer, db.ForeignKey('location.id'))
    location = db.relationship('Location', backref="users")

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
        self.location_id = kwargs.get('location')

    def serialize(self):
        location = Location.query.filter_by(id=self.location_id).first()
        return {
            "uuid": self.uuid,
            "name": self.name,
            "netid": self.netid,
            "grad_year": self.grad_year,
            "age": self.age,
            "gender": self.gender,
            "sleep_time": self.sleep_time,
            "cleanliness": self.cleanliness,
            "bio": self.bio,
            "email": self.email,
            "phone": self.phone,
            "location": location.serialize()
        }


class Location(db.Model):
    __tablename__ = 'location'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    city = db.Column(db.String, nullable=False)
    state = db.Column(db.String, nullable=False)
    address = db.Column(db.String)
    longitude = db.Column(db.Float, nullable=False)
    latitude = db.Column(db.Float, nullable=False)

    def __init__(self, **kwargs):
        self.city = kwargs.get('city')
        self.state = kwargs.get('country')
        self.address = kwargs.get('address')
        self.longitude = kwargs.get('longitude')
        self.latitude = kwargs.get('latitude')

    def serialize(self):
        if self.address:
            return {
                "id": self.id,
                "city": self.city,
                "state": self.state,
                "address": self.address,
                "longitude": self.longitude,
                "latitude": self.latitude
            }
        return {
            "id": self.id,
            "city": self.city,
            "state": self.state,
            "longitude": self.longitude,
            "latitude": self.latitude
        }


class Match(db.Model):
    __tablename__ = 'match'
    id = db.Column(db.Integer, primary_key=True)
