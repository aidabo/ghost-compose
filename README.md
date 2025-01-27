# Ghost-compose to deploy ghost as container

## About Mail template

Mail template is changed for custom front end, ghost is used as backend Api Server.

### Set environment in compose 

```yaml
services:
  ghost-prd:
    image: ghost:5.89.3-alpine
    container_name: ghost-prd
    restart: unless-stopped
    environment:
      - NODE_ENV=production
      - TZ=Asia/Tokyo    
#      - url=http://60-legacy.com
      - FRONT_END_URL=http://your.frontend.com
      # Production MYSQL configuration
      - database__client=mysql
      - database__connection__host=mysql
      - database__connection__user=root
      - database__connection__password=ghost
      - database__connection__database=ghost
    ports:
      - "80:2368"
      - "465:465"
    volumes:
      - ./ghost/content:/var/lib/ghost/content
      - ./ghost/mail:/var/lib/ghost/current/core/server/services/mail
      - type: bind
        source: ./ghost/config/config.production.json
        target: /var/lib/ghost/config.production.json
    depends_on:
      - mysql

  mysql:
    build: ./mysql
    container_name: ghost-mysql
    restart: always
    environment:
      MYSQL_USER: root
      MYSQL_ROOT_PASSWORD: ghost
      MYSQL_DATABASE: ghost
      MYSQL_PASSWORD: ghost
    ports:
      - "3306:3306"
    volumes:
      - ./mysql-data:/var/lib/mysql
```
