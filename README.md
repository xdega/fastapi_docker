# FastAPI Docker Project

A simple, containerized FastAPI application using **Gunicorn** + **Uvicorn** and following Docker best practices (multi-stage builds, non-root user, pinned dependencies, etc.).

---

## Table of Contents

1. [Project Overview](#project-overview)
2. [Requirements](#requirements)
3. [Folder Structure](#folder-structure)
4. [Quick Start](#quick-start)
   - [Build the Image](#build-the-image)
   - [Run the Container](#run-the-container)
   - [Access the App](#access-the-app)
   - [Restart the Container](#restart-the-container)
5. [Development Workflow](#development-workflow)
6. [Using the Helper Scripts](#using-the-helper-scripts)
7. [Contributing](#contributing)

---

## Project Overview

This project utilizes:

- **FastAPI** for building a high-performance Python web API.
- **Docker** for containerization (multi-stage builds, non-root user).
- **Gunicorn** with **Uvicorn** workers for production-ready server infrastructure.
- A streamlined development and deployment workflow using simple scripts and Docker.

---

## Requirements

To develop or run this project locally, ensure you have:

1. **Python 3.9+** (if you plan to run code locally outside of Docker)
2. **Docker** (v20+ recommended)

> **Note**: If you only plan to use Docker containers, you don’t strictly need Python installed on your host machine, since all Python commands will run inside the container. But it is still reccomended that you have Python installed locally, and an IDE that will ensure your syntax is clean and well formatted.

---

## Folder Structure

```
fastapi-docker/
├─ app/
│  └─ main.py               # Your FastAPI application code
├─ scripts/
│  ├─ build.sh              # Builds Docker image
│  ├─ run.sh                # Runs Docker container
│  └─ restart.sh            # Stops & removes existing container, then re-runs
├─ requirements.txt         # Pinned Python dependencies
├─ Dockerfile               # Multi-stage Docker build file
└─ README.md                # This file
```

---

## Quick Start

### Build the Image

1. Clone this repository (or download the code).
2. From the project root, run:

   ```bash
   docker build -t my-fastapi-app .
   ```

   This uses the **Dockerfile** to create an image named `my-fastapi-app`.

### Run the Container

```bash
docker run -d --name my-fastapi-container -p 8000:8000 my-fastapi-app
```

- `-d` runs the container in the background (detached).
- `--name` gives the container a human-readable name.
- `-p 8000:8000` publishes container port 8000 to host port 8000.

### Access the App

Open your browser to [http://localhost:8000](http://localhost:8000/healthcheck). You should see JSON output from FastAPI, something like:

```json
{
  "message": "Hello from FastAPI!"
}
```

For interactive API documentation, visit [http://localhost:8000/docs](http://localhost:8000/docs).

### Restart the Container

If you ever need to stop and remove the container and run it again:

```bash
docker stop my-fastapi-container
docker rm my-fastapi-container
docker run -d --name my-fastapi-container -p 8000:8000 my-fastapi-app
```

Alternatively, see the [Using the Helper Scripts](#using-the-helper-scripts) section for a faster approach.

---

## Development Workflow

1. **Edit Code**

   - Work on your FastAPI routes in `app/main.py` or create new modules in the `app/` directory.

2. **Rebuild & Re-Run**

   - Anytime you change dependencies or code, rebuild the Docker image and re-run.

3. **Check Logs**

   - `docker logs -f my-fastapi-container` to follow container logs in real-time.

4. **Iterate**
   - Repeat until your feature/fix is complete.

> **Tip**: If you use **Docker Compose**, you can run `docker-compose up --build -d` to automatically rebuild the image whenever you’ve changed your Docker configuration or Python dependencies.

---

## Using the Helper Scripts

Inside the `scripts/` directory, we have three Bash scripts that streamline common tasks. Make sure they’re executable:

```bash
chmod +x scripts/*.sh
```

Then run them from the project root:

### 1. `build.sh`

```bash
./scripts/build.sh
```

- Builds the Docker image as `my-fastapi-app` using the local `Dockerfile`.

### 2. `run.sh`

```bash
./scripts/run.sh
```

- Runs a new container named `my-fastapi-container`, publishing port 8000.

### 3. `restart.sh`

```bash
./scripts/restart.sh
```

- Stops and removes any existing container named `my-fastapi-container`.
- Runs a fresh container from the previously built image.

> **Note**: You can customize the **container name**, **image name**, and **ports** by editing the environment variables at the top of each script.

## Contributing

1. **Fork** this repository (if using GitHub).
2. Create a **feature branch**: `git checkout -b feature/awesome-feature`
3. Make your changes and **commit**: `git commit -m "Add an awesome feature"`
4. **Push** the branch: `git push origin feature/awesome-feature`
5. Create a **Pull Request** to the main repo.

---

### Thank You!

Enjoy building with **FastAPI** and **Docker**. If you run into any issues or have ideas for improving this setup, don’t hesitate to open an issue or submit a pull request. Happy coding!
