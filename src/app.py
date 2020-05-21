from flask import Flask
from flask_restx import Api

app = Flask(__name__)
api = Api(app = app)

from .resources.endpoint import Endpoint

api.add_resource(Endpoint)

