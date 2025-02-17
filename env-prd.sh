# Docker compose environment variables defined in host

# Production
export GHOST_NODE_ENV=production
# used by process.env for mail and other template
export GHOST_BACKEND_URL = https://60-legacy.com/ghost
export GHOST_FRONT_END_URL=https://60-legacy.com
export GHOST_MYSQL_USER=mysql
export GHOST_MYSQL_PASSWORD=mysql
export GHOST_MYSQL_DB=ghost_db
export GHOST_CONFIG_JSON=config.production.json
export GHOST_DEBUG=false
export GHOST_LOG_LEVEL=info
export GHOST_HOST_PORT=80


