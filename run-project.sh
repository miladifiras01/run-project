#!/bin/bash
stop_default_apache() {
  if sudo lsof -i:80 | grep -q "LISTEN"; then
    echo "Another Apache service is running on port 80. Stopping it..."
    sudo systemctl stop apache2 2>/dev/null || echo "Failed to stop system Apache. Check manually."
  fi
}
stop_process_on_port() {
  PORT=$1
  if sudo lsof -i:$PORT | grep -q "LISTEN"; then
    echo "Stopping process running on port $PORT..."
   PID=$(sudo lsof -t -i:$PORT)
    sudo kill -9 $PID
    echo "Process on port $PORT stopped."
  fi
}

start_xampp_services() {
  echo "Starting XAMPP services..."
  sudo /opt/lampp/lampp start
}
open_laravel_project() {
  stop_process_on_port $2
  code $1
  gnome-terminal -- bash -c "cd $1 && php artisan serve; exec bash"
}
run_laravel_app() {
	stop_default_apache
	start_xampp_services
	open_laravel_project "$1" "$2"
	
}
run_angular_app() {
  stop_process_on_port $2
  code $1
  gnome-terminal -- bash -c "cd $1 && ng serve --open --port=$2; exec bash" 
}

run_fastapi_app() {
code $1 &

cd $1

python3 -m venv venv
source venv/bin/activate

uvicorn app.main:app --host 0.0.0.0 --port $2
}
read -p "Enter Project Root: " project_root 

echo "1) Laravel"
echo "2) Angular"
echo "3) FastApi"
read -p "Choose Project Language/Framework: " project_framework

case "$project_framework" in
1) 
	read -p "Type app port:(default: 8000) " port
	if [[ -z "$port" ]]; then
		port=8000
	fi
	echo "Running laravel application..."
	run_laravel_app "$project_root" "$port"
	
	;;
2) 
	read -p "Type app port:(default: 4200) " port
	if [[ -z "$port" ]]; then
		port=4200
	fi
	echo "Running angular application..."
	run_angular_app "$project_root" "$port"
	;;
3)
	read -p "Type app port:(default: 8000) " port
	if [[ -z "$port" ]]; then
		port=8000
	fi
	echo "Running fastApi application..."
	run_fastapi_app "$project_root" "$port"
	;;
*)
	echo "other"
	;;
esac
