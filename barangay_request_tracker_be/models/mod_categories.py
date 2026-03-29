from mobile_sql_alchemy import mobile_db

db = mobile_db

class ServiceCategory(db.Model):
    __tablename__ = 'service_categories'


    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50))
    description = db.Column(db.Text)