# Ghost-compose to deploy ghost as container

## About Mail template

Mail template is changed for custom front end, ghost is used as backend Api Server.

`ghost/content/mail`

## Set Environment in compose 

see 
`env-dev.sh`
or
`env-prd.sh`

## Set config in ghost/config

`ghost/config/config.development.json`
or
`ghost/config/config.production.json`

## Create docker shared network

## Create EBS and attache to EC2 for save mysql data

- Create Volume of EBS
- Attache to EC2
- Use the lsblk command to view your available disk devices and their mount points.

`lsblk`
```text
NAME     MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
xvda     202:0    0   16G  0 disk
├─xvda1  202:1    0   15G  0 part /
├─xvda14 202:14   0    4M  0 part
├─xvda15 202:15   0  106M  0 part /boot/efi
└─xvda16 259:0    0  913M  0 part /boot
xvdd     202:48   0   20G  0 disk
```

- Create a file system on the volume

`sudo mkfs -t ext4 /dev/xvdd`

- Create a mount point directoty for the volume

`sudo mkdir mount_point`

- Mount this EBS volume at the location you just created
`sudo mount /dev/xvdd mount_point`

- To check you can perform ls mount_point

- In prodution environment, set ghost url as following

* config.production.json

``` json
  "url": "http://localhost/",
  "server": {
    "port": 2368,
    "host": "::"
  },
  "admin": {
          "url": "http://localhost/ghost"
  },
```

* env-prd.sh

```sh
# Docker compose environment variables defined in host

# Production
export GHOST_NODE_ENV=production
# used by process.env for mail and other template
export GHOST_BACKEND_URL = https://60-legacy.com/ghost
export GHOST_FRONT_END_URL=https://60-legacy.com
```


 