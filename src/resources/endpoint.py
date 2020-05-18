from flask_restful import Resource

class Endpoint(Resource):
    def get(self):
        return {'api_version' : '0.0.1'}