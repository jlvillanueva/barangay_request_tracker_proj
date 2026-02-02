# Barangay Request Tracker

## Project Overview
Barangay Request Tracker is a full-stack application designed to help barangay staff and residents manage, track, and fulfill service requests efficiently. The system consists of a Flutter frontend (FE) and a Python Flask backend (BE), supporting secure authentication, request creation, and status tracking.

---

## Tech Stack

### Frontend (`barangay_request_tracker_fe`)
- **Framework:** Flutter (Dart)
- **State Management:** flutter_bloc
- **Networking:** dio
- **Secure Storage:** flutter_secure_storage
- **Environment Management:** envied

### Backend (`barangay_request_tracker_be`)
- **Framework:** Python Flask
- **Database:** SQLite (with SQLAlchemy ORM)
- **Authentication:** JWT (PyJWT)
- **CORS:** flask-cors

---

## Installation & Setup

### Prerequisites
- Flutter SDK (for FE)
- Python 3.10+ (for BE)
- pip (Python package manager)

### Backend Setup (`barangay_request_tracker_be`)
1. Navigate to the backend directory:
   ```sh
   cd barangay_request_tracker_be
   ```
2. Create and activate a virtual environment (optional but recommended):
   ```sh
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```
3. Install dependencies:
   ```sh
   pip install -r requirements.txt
   ```
4. Set up environment variables (if needed) in a `.env` file.
5. Run the backend server:
   ```sh
   python api.py
   ```

### Frontend Setup (`barangay_request_tracker_fe`)
1. Navigate to the frontend directory:
   ```sh
   cd barangay_request_tracker_fe
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Set up your `.env` file in the root of `barangay_request_tracker_fe`:
   ```env
   API_BASE_URL=http://your-backend-url:5001
   DIGEST_SALT=your_digest_salt
   API_KEY=your_api_key
   CLIENT_KEY=your_client_key
   CLIENT_SECRET=your_client_secret
   BRGY_CODE=your_brgy_code
   ```
4. Generate environment code:
   ```sh
   dart run build_runner build --delete-conflicting-outputs
   ```
5. Run the Flutter app:
   ```sh
   flutter run
   ```

---

## Notes
- Ensure both backend and frontend `.env` files are properly configured.
- For mobile device testing, ensure your backend is accessible from your device (use LAN IP or tunneling if needed).
- For any issues, check the logs in both FE and BE for error details.

---


---

## Security Approach
**Backend:**
- JWT-based authentication for all API endpoints.
- Passwords and sensitive data are never stored in plain text.
- Environment variables (using `.env`) for secrets and keys.
- CORS enabled and restricted to trusted origins.
- Input validation and error handling on all endpoints.

**Frontend:**
- Sensitive keys and endpoints are obfuscated using the `envied` package.
- Secure storage for tokens and credentials using `flutter_secure_storage`.
- No secrets or credentials are hardcoded in the source code.

---

## Testing Approach
**Backend:**
- Unit tests for core logic and API endpoints (using `pytest` or `unittest`).
- Manual API testing with tools like Postman.
- Error and edge case handling tested for all endpoints.

**Frontend:**
- Widget and integration tests for UI components.
- Manual testing on multiple devices and emulators.
- Automated build and code generation checks (using `build_runner`).

---

## License
This project is for educational and demonstration purposes.

---

## License
This project is for educational and demonstration purposes.
