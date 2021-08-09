# A modern word press environment with livereload that actaully works
TLDR (but you probably will want to modify the gruntfile at some point):
```
git clone https://github.com/rlewkowicz/modern-wordpress-development-environment.git
cd modern-wordpress-development-environment
mkdir -p wordpress mariadb; UID=$(id -u) docker-compose up -d --build --remove-orphans; while ! docker logs mariadb 2>&1 | grep -o "ready for connections"; do sleep 1; done; echo "\nYour site should now be ready\n"
```

Your site is now at ./wordpress and you can use native development tools to modify it as needed 

# Live Reload and the Gruntfile


