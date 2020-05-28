from flask_restx import Resource
from ..app import api


@api.route('/api')
class Endpoint(Resource):
    def get(self):
        return {'api_version' : '0.0.1'}