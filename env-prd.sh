# Docker compose environment variables defined in host

# Production
export GHOST_NODE_ENV=production
# don't set to https://60-legacy.com, otherwise will redirect to front end and get status 301 
# on Next api/* function
export GHOST_BACKEND_URL = http://localhost/ghost
export GHOST_FRONT_END_URL=http://localhost
export GHOST_MYSQL_USER=mysql
export GHOST_MYSQL_PASSWORD=mysql
export GHOST_MYSQL_DB=ghost_db
export GHOST_CONFIG_JSON=config.production.json
export GHOST_DEBUG=false
export GHOST_LOG_LEVEL=info
export GHOST_HOST_PORT=80


