# Student E-Learning Portal

A Flask-based e-learning platform for students to access courses, materials, videos, and quizzes.

## Features

- 👤 **Student Registration & Login** - Secure authentication for students
- 📚 **Courses** - Browse and enroll in available courses
- 📄 **Study Materials** - Download course materials and resources
- 🎥 **Videos** - Watch educational videos
- 📝 **Quizzes** - Take online quizzes and assess knowledge
- 📊 **Results** - View quiz scores and performance tracking
- 🔐 **Admin Dashboard** - Manage courses, materials, videos, and quizzes

## Tech Stack

- **Backend**: Python Flask
- **Database**: SQLite
- **Frontend**: HTML, CSS, Jinja2 Templates
- **Security**: Werkzeug (password hashing)

## Installation

### Prerequisites
- Python 3.8+
- pip

### Local Setup

> For Windows 64-bit systems, use the 64-bit version of the app executable. The packaged build is configured for x86_64 architecture.

1. Clone the repository:
```bash
git clone https://github.com/yourusername/student-elearning-portal.git
cd student-elearning-portal
```

2. Create and activate virtual environment:
```bash
python -m venv .venv
# Windows
.\.venv\Scripts\activate
# macOS/Linux
source .venv/bin/activate
```

3. Install dependencies:
```bash
pip install -r requirements.txt
```

4. Run the application:
```bash
python run.py
```

5. Access the portal:
```
http://127.0.0.1:5000
```

## Default Admin Credentials

- **Username**: `admin`
- **Password**: `admin123`

## Usage

### For Students
1. Register at `/register`
2. Login with your credentials
3. Browse courses in student dashboard
4. Access materials, videos, and quizzes for each course

### For Admins
1. Login at `/admin/login`
2. Add courses, materials, videos, and quizzes from admin dashboard
3. View student results and registered students

## GitHub Upload

Do not upload `.venv`, `env`, `build`, `*.db`, `.env`, or uploaded files. They are covered by `.gitignore`.

```bash
git init
git add .
git commit -m "Prepare Flask portal for deployment"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/student-elearning-portal.git
git push -u origin main
```

Create the GitHub repository first, keep it empty, and replace `YOUR_USERNAME` with your GitHub username.

## Deploy to Render

1. Create an account at [render.com](https://render.com) and sign in with GitHub. A Persistent Disk requires a paid web service plan.
2. Open **New + > Web Service**, select this GitHub repository, and choose **Python**.
3. Use these settings:
	- Build Command: `pip install -r requirements.txt`
	- Start Command: `gunicorn --bind 0.0.0.0:$PORT wsgi:app`
	- Instance type: Starter or another plan that supports Persistent Disk
4. Add environment variables:
	- `SECRET_KEY`: a long random value
	- `ADMIN_USERNAME`: your private admin username
	- `ADMIN_PASSWORD`: a strong private admin password
	- `RENDER`: `true`
5. Click **Create Web Service** and wait for the deploy to finish.

The included `render.yaml` can also configure these settings automatically through Render Blueprint.

## SQLite on Render

The included `render.yaml` attaches a 1 GB Render **Persistent Disk** at `/var/data` and sets:

```text
DATABASE_PATH=/var/data/database.db
UPLOAD_FOLDER=/var/data/uploads
```

The disk mount path must be `/var/data`. Persistent disks may require a paid Render web service. For larger or multi-instance production use, move the database to managed PostgreSQL and files to object storage.

## Open on Mobile and Get the Public Link

After Render shows **Live**, copy the URL ending in `.onrender.com`, for example `https://student-elearning-portal.onrender.com`. Open that URL in Chrome or Safari on the phone. The same URL is the final public link; use HTTPS and do not use `localhost` on mobile.

## File Structure

```
project/
├── app.py                 # Main Flask application
├── run.py                # Entry point
├── wsgi.py               # WSGI configuration
├── requirements.txt      # Python dependencies
├── database.db           # SQLite database
├── template/             # HTML templates
│   ├── base.html
│   ├── index.html
│   ├── login.html
│   ├── register.html
│   ├── std_dashbrd.html
│   ├── course.html
│   ├── add_course.html
│   ├── add_materials.html
│   ├── add_video.html
│   ├── add_quiz.html
│   └── quiz_result.html
├── static/               # CSS and static files
│   └── style.css
└── uploads/              # Uploaded materials
```

## License

MIT License

## Author

Student E-Learning Portal Team

## Support

For issues and questions, please create an issue on GitHub.
