import datetime
import logging

from models.mod_requests import ServiceRequest
from mobile_sql_alchemy import mobile_db

logger = logging.getLogger(__name__)

def getAllServiceRequests():
    try:
        requests = ServiceRequest.query.all()
        request_list = []
        for req in requests:
            request_list.append({
                'requestId': req.id,
                'requestCode': req.request_code,
                'userId': req.user_id,
                'description': req.description,
                'location': req.location,
                'status': req.status,
                'priority': req.priority,
                'createdAt': req.created_at.strftime('%Y-%m-%d %H:%M:%S')
            })

        return {
            'rc': 200,
            'status': 'Success',
            'requests': request_list
        }, 200

    except Exception as e:
        logger.error(f"Fetching requests failed: {e}")
        return {
            'rc': 500,
            'status': 'Internal Server Error'
        }, 500
    return

def createServiceRequest(data):
    data = dict(data)

    try:

        req = ServiceRequest(
            user_id=data.get('user_id'),
            description=data.get('description'),
            location=data.get('location'),
            priority=data.get('priority', 'Medium'),
        )

        mobile_db.session.add(req)
        mobile_db.session.commit()

        return {
            'rc': 201,
            'status': 'Adding Request Successful',
            'requestId': req.id,
            'requestCode': req.request_code,
            'status': req.status
        }, 201

    except Exception as e:
        logger.error(f"Registration failed: {e}")
        return {
            'rc': 401,
            'status': 'Registration Failed'
        }, 401
    return 

def updateServiceRequest(data):
    data = dict(data)

    try:
        req = ServiceRequest.query.filter_by(id=data.get('requestId')).first()

        if not req:
            return {
                'rc': 404,
                'status': 'Request Not Found'
            }, 404

        req.status = data.get('status', req.status)
        req.priority = data.get('priority', req.priority)

        mobile_db.session.commit()

        return {
            'rc': 200,
            'status': 'Update Request Successful',
            'requestId': req.id,
            'requestCode': req.request_code,
            'status': req.status
        }, 200

    except Exception as e:
        logger.error(f"Update failed: {e}")
        return {
            'rc': 401,
            'status': 'Update Failed'
        }, 401
    return