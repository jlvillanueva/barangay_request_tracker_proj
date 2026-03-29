from mobile_sql_alchemy import mobile_db
from datetime import datetime

db = mobile_db

class ServiceRequest(db.Model):
    __tablename__ = 'service_requests'

    id = db.Column(db.Integer, primary_key=True)
    request_code = db.Column(db.String(30), unique=True)
    user_id = db.Column(db.Integer)
    description = db.Column(db.Text)
    location = db.Column(db.String(100))
    status = db.Column(db.String(20), default="Pending")
    priority = db.Column(db.String(20), default="Medium")
    created_at = db.Column(db.DateTime, default=datetime.utcnow)