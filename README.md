# WebDevDocker

Docker container with clean Apache2, PHP7.0 and MariaDB Envoirment. This container was created only for my personal purposes. It is not perfect but for me it is enough. Feel free to contribute github repo to make it perfect :) Cheers! 

### Usage
This container allows you to manage your Apache websites and Virtual Hosts. You can connect your websites repo and directory with vhost configs to container using classic docker volumes.


Create external volume form MySQL data:
```docker volume create --name mysql-data```

Think about pre-config for Apache UID. It should be the same user as website's repo owner. The running script will create that user in container.

Pull and run container
```
docker run -d --name my-developing-machine \

           -e APACHE_RUN_USER=user \
           -e APACHE_RUN_GROUP=user \

           -v /path/to/websites:/websites:rw \
           -v /path/to/apache_vhosts:/etc/apache2/vhosts:rw \
           -v mysql-data:/var/lib/mysql \

           -p 80:80 \
      
           matimoto87/webdevdocker           
```
To manage your docker envoirment run <code>docker exec -it my-developing-machine bash</code> to log into container as root. 