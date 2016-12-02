12-02-2016
Add Dockerfile with ubuntu10.04 and php5.2
RUN:
docker build -t worm-ubuntu10.04/dev <path>
docker run -v /var/www:/var/www -p 80:80 -d -t worm-ubuntu10.04/dev


