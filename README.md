# docker-hello-world
Sample image to test Docker deployments, based on the original version by Tutumi (a startup company that was acquired by Docker).

## Usage
To create the image `user/hello-world`, execute the following command within the docker-hello-world folder:

```
docker build -t user/hello-world .
```

You can now push your new image to the registry:

```
sudo docker push user/hello-world
```

## Running your Hello World docker image
Start your image:

```
docker run -d -p 80 user/hello-world
```

It will print the new container ID (like `d35bf1374e88`). Get the allocated external port:

```
docker port d35bf1374e88 80
```

It will print the allocated port (like 32768). Test your deployment:

```
curl http://localhost:32768/
```

Hello world!

## NGINX access log
Run the following:

```
docker exec -it d35bf1374e88 tail -f /var/log/nginx/access.log
```
