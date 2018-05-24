# docker-falcon

for build:

docker build -t docker-falcon .

for run:

if you want expose a port:
- docker run -d -p 8000:8000 docker-falcon

if you want use iptables for filter port:
- docker run -d --net=host docker-falcon
