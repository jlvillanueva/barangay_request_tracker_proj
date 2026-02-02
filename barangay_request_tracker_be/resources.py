from collections import OrderedDict
from functools import wraps
import logging


from datetime import datetime

from modules.oauth2 import generate_token
from modules.utilities import VerifyPayload
from flask_restful import Resource
from flask import json, request
from mobile_sql_alchemy import mobile_db

from models.mod_users import Users
from modules.functions import VerifyPhrase, GenerateSaltKey
from modules.services import createServiceRequest, getAllServiceRequests



# Logging config
logger = logging.getLogger(__name__)

def verify_payload():
    def decorator(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            try:
                data = json.loads(request.data, object_pairs_hook=OrderedDict)


                dictdata = data.get('data')

                logger.warning(f"Verifying payload for data: {dictdata}")
            
                verifydata = VerifyPayload(dictdata)

                if not verifydata:
                    return {
                        'rc': 400,
                        'status': 'Invalid payload'
                    }, 400
            except Exception as e:
                logger.error(f"Payload verification failed: {e}")
                return {
                    'rc': 400,
                    'status': 'Invalid payload format'
                }, 400
            return func(*args, **kwargs)
        return wrapper
    return decorator

class MobileLogin(Resource):
    @verify_payload()
    def post(self):

        result = generate_token();

        return result

class MobileRegistration(Resource):
    def post(self):
        data = request.get_json()

        password = data.get('data').get('password')

        reply = GenerateSaltKey(password)

        user = Users(
            username=data.get('data').get('username'),
            firstName=data.get('data').get('firstName'),
            lastName=data.get('data').get('lastName'),
            phoneNumber=data.get('data').get('phoneNumber'),
            middleName=data.get('data').get('middleName'),
            role=data.get('data').get('role', '3'),
            createdAt=datetime.now(),
            password_salt=reply['salt'],
            password_key=reply['key'],
        )

        try:
            mobile_db.session.add(user)
            mobile_db.session.commit()
            # Fetch the user from the database to ensure data is from DB
            db_user = Users.query.filter_by(id=user.id).first()
            return {
                'rc': 201,
                'status': 'Registered Successfully',
                'clientid': db_user.id,
                'cpnumber': db_user.phoneNumber
            }, 201
        except Exception as e:
            logger.error(f"Registration failed: {e}")
            return {
                'rc': 401,
                'status': 'Registration Failed'
            }, 401

class GetUserDetails(Resource):
    @verify_payload()
    def post(self):
        data = json.loads(request.data, object_pairs_hook=OrderedDict)
        dictdata = data.get('data')

        userId = dictdata.get('userId')

        user = Users.query.filter_by(id=userId).first()

        if user:
            return {
                'rc': 200,
                'status': 'User Found',
                'data': {
                    'id': user.id,
                    'username': user.username,
                    'firstName': user.firstName,
                    'lastName': user.lastName,
                    'middleName': user.middleName,
                    'phoneNumber': user.phoneNumber,
                    'role': user.role,
                    'createdAt': user.createdAt.strftime('%Y-%m-%d %H:%M:%S'),
                }
            }, 200
        else:
            return {
                'rc': 404,
                'status': 'User Not Found'
            }, 404
        
class ServiceRequestLists(Resource):
    def get(self):
        # Implementation for fetching service request lists goes here
       result = getAllServiceRequests()
       return result
    
class ServiceRequest(Resource):
    @verify_payload()
    def post(self):

        data = json.loads(request.data, object_pairs_hook=OrderedDict)
        dictdata = data.get('data')

        result = createServiceRequest(dictdata)

        return result

class UpdateServiceRequest(Resource):
    @verify_payload()
    def post(self):
        data = json.loads(request.data, object_pairs_hook=OrderedDict)
        dictdata = data.get('data')

        # Implementation for updating service request goes here

        return {
            'rc': 200,
            'status': 'Service Request Updated Successfully'
        }, 200