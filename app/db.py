from flask_sqlalchemy import SQLAlchemy
from .app_enums import Gender


db = SQLAlchemy()

nearby_association_table = db.Table(
    'nearby',
    db.Model.metadata,
    db.Column('location_id', db.Integer, db.ForeignKey('location.id')),
    db.Column('user_id', db.String, db.ForeignKey(
        'user.netid'))
)


class User(db.Model):
    __tablename__ = 'user'
    name = db.Column(db.String, nullable=False)
    netid = db.Column(db.String, nullable=False, primary_key=True)
    grad_year = db.Column(db.Integer, nullable=False)
    age = db.Column(db.Integer, nullable=False)
    gender = db.Column(db.Integer, nullable=False)
    sleep_time = db.Column(db.Integer, nullable=False)
    cleanliness = db.Column(db.Integer, nullable=False)
    min_price = db.Column(db.Integer, nullable=False)
    max_price = db.Column(db.Integer, nullable=False)
    bio = db.Column(db.String, nullable=False)
    fun_fact = db.Column(db.String)
    email = db.Column(db.String)
    phone = db.Column(db.String)
    location_id = db.Column(db.Integer, db.ForeignKey(
        'location.id'), nullable=False)
    location = db.relationship('Location', backref="users")
    profile_pic = db.Column(db.String)

    def __init__(self, **kwargs):
        self.name = kwargs.get('name')
        self.netid = kwargs.get('netid')
        self.grad_year = kwargs.get('grad_year')
        self.age = kwargs.get('age')
        self.gender = kwargs.get('gender')
        self.sleep_time = kwargs.get('sleep_time')
        self.cleanliness = kwargs.get('cleanliness')
        self.min_price = kwargs.get('min_price')
        self.max_price = kwargs.get('max_price')
        self.bio = kwargs.get('bio')
        self.fun_fact = kwargs.get('fun_fact')
        self.email = kwargs.get('email')
        self.phone = kwargs.get('phone')
        self.location_id = kwargs.get('location')
        self.profile_pic = kwargs.get('profile_pic')

    def serialize(self):
        location = Location.query.filter_by(id=self.location_id).first()
        user = {
            "name": self.name,
            "netid": self.netid,
            "grad_year": self.grad_year,
            "age": self.age,
            "gender": self.gender,
            "sleep_time": self.sleep_time,
            "cleanliness": self.cleanliness,
            "min_price": self.min_price,
            "max_price": self.max_price,
            "bio": self.bio,
            "fun_fact": self.fun_fact,
            "email": self.email,
            "phone": self.phone,
            "location": location.serialize()
        }
        if self.profile_pic:
            user['profile_pic'] = self.profile_pic
        return user


class Location(db.Model):
    __tablename__ = 'location'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    city = db.Column(db.String, nullable=False)
    state = db.Column(db.String, nullable=False)
    address = db.Column(db.String)
    longitude = db.Column(db.Float, nullable=False)
    latitude = db.Column(db.Float, nullable=False)
    nearby_users = db.relationship(
        'User', secondary=nearby_association_table, cascade='delete')

    def __init__(self, **kwargs):
        self.city = kwargs.get('city')
        self.state = kwargs.get('state')
        self.address = kwargs.get('address')
        self.longitude = kwargs.get('longitude')
        self.latitude = kwargs.get('latitude')

    def serialize(self):
        location = {"id": self.id,
                    "city": self.city,
                    "state": self.state,
                    "longitude": self.longitude,
                    "latitude": self.latitude}
        if self.address:
            location["address"] = self.address
        return location


class Match(db.Model):
    __tablename__ = 'match'
    id = db.Column(db.Integer, primary_key=True)
    similarity = db.Column(db.Float, nullable=False)
    user_id = db.Column(db.String)
    match_id = db.Column(db.String, db.ForeignKey(
        'user.netid'))
    match = db.relationship('User', backref='matched', cascade='delete')

    def __init__(self, **kwargs):
        self.similarity = kwargs.get('similarity')
        self.user_id = kwargs.get('user_id')
        self.match_id = kwargs.get('match_id')

    def serialize(self):
        return {
            "similarity": self.similarity,
            "user_id": self.user_id,
            "match_id": self.match_id
        }
