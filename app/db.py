from flask_sqlalchemy import SQLAlchemy
from .app_enums import Gender

db = SQLAlchemy()


class User(db.Model):
    __tablename__ = 'user'
    uuid = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False)
    netid = db.Column(db.String, nullable=False)
    grad_year = db.Column(db.Integer, nullable=False)
    age = db.Column(db.Integer, nullable=False)
    gender = db.Column(db.Enum(Gender), nullable=False)
    cleanliness = db.Column(db.Integer, nullable=False)
    location = db.Column()
    bio = db.Column(db.String, nullable=False)
    email = db.Column(db.String)
    phone = db.Column(db.String)

    def __init__(self, **kwargs):
        self.uuid = kwargs.get('uuid')
        self.name = kwargs.get('name')
        self.grad_year = kwargs.get('grad_year')
        self.age = kwargs.get('age')
        self.gender = kwargs.get('gender')
        self.cleanliness = kwargs.get('cleanliness')
        self.bio = kwargs.get('bio')

    def serialize(self):
        return {
            "id": self.id,
            "first_name": self.first_name,
            "last_name": self.last_name,
            "netid": self.netid,
            "grad_year": self.grad_year,
            "age": self.age,
            "gender": self.gender,
            "cleanliness": self.cleanliness,
            "bio": self.bio
        }
