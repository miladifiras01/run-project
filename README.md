# Run Project Script

This project is a Bash script that automates the process of launching development environments for three different frameworks:

* Laravel (PHP)
* Angular (TypeScript)
* FastAPI (Python)

## Prerequisites

Make sure the following are installed on your system:

* VS Code (`code` command available)
* XAMPP (for Laravel, located in `/opt/lampp/`)
* Python 3 and `uvicorn` for FastAPI
* Angular CLI (`ng`)

## Script Features

* Stops the default Apache server if it's running on port 80
* Starts XAMPP for Laravel projects
* Allows you to choose which framework to run (Laravel, Angular, or FastAPI)
* Opens the project in VS Code and starts a development server in a new terminal
* Prompts for a port, with a default fallback

## How to Use

1. Open terminal and navigate to the script's directory:

   ```bash
   cd /path/to/script
   ```

2. Make the script executable if not already:

   ```bash
   chmod +x run-project.sh
   ```

3. Run the script:

   ```bash
   ./run-project.sh
   ```

4. Follow the prompts:

   * Enter the project root path
   * Choose the framework (1 for Laravel, 2 for Angular, 3 for FastAPI)
   * Enter a custom port or press Enter to use the default

## Example

```bash
Enter Project Root: /home/user/my-project
1) Laravel
2) Angular
3) FastApi
Choose Project Language/Framework: 1
Type app port:(default: 8000):
Running laravel application...
```

## Function Descriptions

* `stop_default_apache`: Stops system Apache if running
* `stop_process_on_port`: Kills any process using a specified port
* `start_xampp_services`: Starts XAMPP services
* `open_laravel_project`, `run_angular_app`, `run_fastapi_app`: Opens the project and starts its development server

## Troubleshooting

* Make sure the paths (e.g., to Laravel or Angular CLI) are correct
* Ensure XAMPP is installed in `/opt/lampp/`
* Check port availability if the server doesn’t start
* For FastAPI, ensure `uvicorn` is installed in the virtual environment

## License

This script is provided "as is" with no warranty. Feel free to modify it for your use.
