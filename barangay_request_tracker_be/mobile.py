from common import app, api
import resources as apir 

api.add_resource(apir.MobileLogin, '/mobile/MobileLogin')
api.add_resource(apir.MobileRegistration, '/mobile/MobileRegistration')
api.add_resource(apir.ServiceRequestLists, '/mobile/MobileServiceRequestLists')
api.add_resource(apir.ServiceRequest, '/mobile/MobileServiceRequest')
api.add_resource(apir.GetUserDetails, '/mobile/MobileGetUserDetails')