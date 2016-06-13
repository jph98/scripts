1. Start Virtualbox and the "default" machine

2. Start Docker Terminal

3. Tell Docker about the instance with:

	docker-machine env default

4. Configure Shell

	eval (docker-machine env default)

5. Run an image

	docker run hello-world
