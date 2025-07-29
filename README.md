# n8n Workflow Docker Deployment Automation

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Last Commit](https://img.shields.io/github/last-commit/yourusername/your-repo-name)
![Repo Size](https://img.shields.io/github/repo-size/yourusername/your-repo-name)
![Platform](https://img.shields.io/badge/platform-Windows-blue)

## Overview  
This project provides a minimal, script-driven Docker Compose environment for deploying n8n workflow automation on Windows. It includes automated batch scripts for container lifecycle management, real-time log monitoring, desktop shortcut integration, and straightforward configuration via a .env file.

Designed to streamline container orchestration, this setup facilitates rapid startup, health checks, and clean shutdown of n8n workflows, making it suitable for developers and DevOps practitioners seeking an efficient local environment. The project also includes an Electron wrapper option for a native desktop application experience.

---

## 🚀 Quick Start

```bash
# Clone the repository
git clone https://github.com/dylantroy/n8n-docker-starter.git
cd n8n-docker-starter

# Set up environment configuration
copy .env.example .env
# Edit .env to set your login credentials and port

# Start n8n (choose one option)
scripts\run_silent.bat    # Silent mode - starts in background
# OR
scripts\run_verbose.bat   # Verbose mode - shows logs in separate window
```

**That's it!** n8n will be available at `http://${host}:${port}` once the container is healthy.

To stop n8n: `scripts\down.bat`

---

## Prerequisites

- [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop) installed and running  
- Windows OS (batch scripts and shortcuts tested on Windows 10+)

---

## Usage

### Start n8n silently (no logs window)  
Run `run_silent.bat` or double-click the desktop shortcut **n8n up (silent)**.  
The container will start detached, the script waits for the container to become healthy, then opens `http://localhost:5678` in your default browser.

### Start n8n with verbose logs  
Run `run_verbose.bat` or use the shortcut **n8n up (verbose)**.  
This will start the container, open a new console window streaming Docker logs live, and display health check status until ready. The browser will open automatically afterward.

### Stop n8n  
Run `stop.bat` or `down.bat`, or use the shortcut **n8n down** to cleanly stop and remove the container.

---

## Configuration

- Copy `.env.example` to `.env` and edit it to configure environment variables such as ports, credentials, and workflow-specific settings.
- Modify `n8n-docker-compose.yaml` if you want to add volumes, change images, or update service parameters.

---

## Future Enhancements

- Create an installer or setup script to automate
- Package Electron wrapper into native executable
- Add troubleshooting section
- Add screenshots
- Setup/installer tasks:
	- generate .env if missing and prompt user for .env auth vars
	- create desktop shortcuts
	- docker setup checks
	- electron setup checks
	- electron install
	- pull latest docker n8n image
	- create .gitignore if missing
	- open readme
	- launch localhost

---

## Contents

- `n8n-docker-compose.yaml` — Docker Compose configuration for the n8n container  
- `.env` — User-defined environment variables (e.g., ports, credentials)  
- `.env.example` — Template environment variables file for creating `.env`  
- `.gitignore` — Lists files/folders (like `.env`) to exclude from Git version control  
- `LICENSE` — Project license file (e.g., MIT)

### Data and Workflows  
- `n8n-data/` — Persistent runtime data volume for n8n (database, credentials, etc.)  
- `n8n-workflows/` — Folder for your n8n workflow JSON files (can be a separate repo)  

### Scripts (`scripts/` folder)
- `run_silent.bat` — Starts n8n container quietly in background, waits for health check, opens browser  
- `run_verbose.bat` — Starts container with logs in a separate console, includes health check feedback  
- `stop.bat` — Stops and removes the running n8n container  
- `down.bat` — Alternative shutdown script (functionally similar to `stop.bat`)

### Shortcuts (`shortcuts/` folder)
- `n8n up (silent).lnk` — Shortcut to `run_silent.bat`  
- `n8n up (verbose).lnk` — Shortcut to `run_verbose.bat`  
- `n8n down.lnk` — Shortcut to `down.bat`

### Assets
- `icons/` — Contains custom `.ico` icons used for desktop shortcuts
- `n8n-electron-wrapper/` — Electron app wrapper for native desktop experience

---

## Documentation

- Official n8n Documentation: [https://docs.n8n.io](https://docs.n8n.io)
- Docker Compose Reference: [https://docs.docker.com/compose/](https://docs.docker.com/compose/)

---

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

## Contact / Support

Feel free to open issues or pull requests if you want to contribute or report bugs.

---

Enjoy automating with n8n! 🚀
