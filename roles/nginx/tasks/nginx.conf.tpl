user www-data;
#worker_processes auto;
#pid /var/run/nginx.pid;
#error_log /var/log/nginx/error.log;

events {
 worker_connections 1024;
}


http {
 upstream wordpress {
   server {{ groups['backend'][0] }};

#   access_log /var/log/nginx/access.log timed_combined;
 }

 server {
 listen 80;

  location / {
   proxy_pass http://wordpress;
  }

 }

}
