# APT-Mirror
# dev branch

# To build 
docker build --tag custom-apt-mirror:dev .

# To run

docker run --publish 3142:3142 --name custom-apt-mirror --detach --volume /var/spool/apt-mirror --restart always custom-apt-mirror:dev