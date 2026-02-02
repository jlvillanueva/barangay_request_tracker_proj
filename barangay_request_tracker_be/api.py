import os
from dotenv import load_dotenv
load_dotenv(dotenv_path=os.path.join(os.path.dirname(__file__), '.env'))
from common import *

import mobile

if __name__ == "__main__":
    # Ensure all models are imported before creating tables
    app.run(threaded=True,debug=True,host='0.0.0.0', port=5001)