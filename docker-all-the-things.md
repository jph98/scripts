Docker
######

Docker Machine - 
Docker Engine - docker binary
Docker Composer - 

Uses the machine: default (in Virtualbox)

Downloads the hello-world image, creates a container and ran the image

	docker run hello-world

Adventure:

	docker run -it ubuntu bash

Step: Download and run an image. https://docs.docker.com/mac/step_two/
----------------------------------------------------------------------

Docker Hub - https://hub.docker.com/?utm_source=getting_started_guide&utm_medium=embedded_MacOSX&utm_campaign=find_whalesay

	https://hub.docker.com/

Run whalesay:

	docker run docker/whalesay cowsay budsy-boo-bear

Display ALL the images:

	docker images

Step: Build Your Own Image - https://docs.docker.com/mac/step_four/
-------------------------------------------------------------------

Simple as taking an existing base image and customising a bit to add fortunes:

	FROM docker/whalesay:latest
	RUN apt-get -y update && apt-get install -y fortunes
	CMD /usr/games/fortune -a | cowsay

then build with the following to build a Docker image (view with docker images):

	docker build -t my-whale .

Finally, let's run it:

  docker run my-whale

Next steps, Dockerhub -> Create Repository.  Tag your docker instance with:

  docker tag <imageid> <accountname>/<dockername>:<versionlabel>
  docker tag 39c8a1513c69 jph98/my-whale:latest
  
Login and push:

  docker login --username <username> --email <email>
  docker push jph98/my-whale
  
Remove with:

  docker rmi -f <imageid>
  
Download with:

   docker pull yourusername/docker-whale
   
You can search for a particular image on the command line with:

  docker search java:java8
  
Install Docker toolbox - https://docs.docker.com/installation/mac/
Products - http://www.docker.com/products/overview
Setup an automated build - https://docs.docker.com/docker-hub/
