# docker-hello-world
Sample image to test Docker deployments, based on the original version by Tutum (a startup company that was acquired by Docker).

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
docker run -d -p 8080 -t user/hello-world
```

It will print the new container ID (like `3b89a0a0a75f`). Get the allocated external port:

```
docker port 3b89a0a0a75f 8080
```

It will print the allocated port (like 32768). Test your deployment:

```
curl http://localhost:32768/
```

Example output:
```
<html>
<head>
        <title>Hello world!</title>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
        <style>
        body {
                background-color: white;
                text-align: center;
                padding: 50px;
                font-family: "Open Sans","Helvetica Neue",Helvetica,Arial,sans-serif;
        }

        #logo {
                margin-bottom: 40px;
        }
        </style>
</head>
<body>
        <img id="logo" src="logo.png" />
        <h1>Hello world!</h1>
        <h3>My hostname is 3b89a0a0a75f</h3>    </body>
</html>
```

## NGINX access and error logs
NGINX access and error logs are diverted to stdout and stderr respectively, so they can be accessed with:

```
docker logs -f 3b89a0a0a75f
```
