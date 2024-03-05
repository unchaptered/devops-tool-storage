```shell
docker build -t unch .
docker run --name unch --rm unch

docker run --name unch --rm -p 8000:8000 unch

docker rm $(docker ps -aq)
docker rmi $(docker images -q)

for /f %i in ('docker ps -aq') do docker rm %i
for /f %i in ('docker images -q') do docker rmi %i
```

```shell
conda create --name unch python=3.10
conda activate unch
```