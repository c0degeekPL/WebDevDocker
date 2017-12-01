# WebDevDocker

Docker container with clean Apache2, PHP7.0 and MariaDB Envoirment. This container was created only for my personal purposes. It is not perfect but for me it is enough. Feel free to contribute github repo to make it perfect :) Cheers! 

## Usage
This container allows you to manage your Apache websites and Virtual Hosts. You can connect your websites repo and directory with vhost configs to container using classic docker volumes.


1. Create external volume form MySQL data:
<pre>docker volume create --name mysql-data</pre>


2. Pull and run container
<pre>docker run -d --name my-developing-machine \
           -v /path/to/websites:/websites:rw \
           -v /path/to/apache_vhosts:/etc/apache2/vhosts:rw \
           -v mysql-data:/var/lib/mysql \
           -p 80:80 \
           
           matimoto87/webdevdocker           
</pre>
To manage your docker envoirment run <code>docker exec -it my-developing-machine bash</code> to log into container as root. 
