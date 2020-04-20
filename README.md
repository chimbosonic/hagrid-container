# Hagrid Docker Container

A simple container that runs https://gitlab.com/hagrid-keyserver/hagrid

Source code: https://gitlab.com/chimbosonic/hagrid-docker

Docker repo: https://hub.docker.com/r/chimbosonic/hagrid

To Run it:
```
docker run --rm -it -p 7272:7272\
	-v $(shell pwd)/data:/var/lib/hagrid\
	-e port=7272\
	-e base_URI="https://localhost:7272"\
	-e from="noreply@localhost"\
	-e x_accel_redirect=false\
	-e token_secret="hagrid"\
	-e token_validity=3600\
	-e mail_rate_limit=60 hagrid:latest
```
On first run it will poplate the data folder with the default distribution files I recommend editing them.
The Rocket.toml contains the config of hagrid and should also be changed accordingly the environment values let you edit some of the fields during generation.

All credit goes to the maintainers of Hagrid