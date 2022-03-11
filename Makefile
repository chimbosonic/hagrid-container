PROJECT := hagrid
NAME   := $(PROJECT)
TAG    := dev-$$(git rev-parse --short HEAD)
IMG    := $(NAME):$(TAG)
LATEST := $(NAME):latest-dev

.PHONY: build force-build run push

ARGS= -t $(IMG)
BUILD=@docker build
TAGS=@docker tag $(IMG) $(LATEST)

build:
	$(BUILD) $(ARGS) .
	$(TAGS)

force-build:
	$(BUILD) --no-cache $(ARGS) .
	$(TAGS)

run:
	@docker run -it --rm --name $(PROJECT) -p 7272:7272\
		-v $(shell pwd)/temp:/var/lib/hagrid\
		-e port=7272\
		-e base_URI="https://localhost:7272"\
		-e from="noreply@localhost"\
		-e x_accel_redirect=false\
		-e token_secret="hagrid"\
		-e token_validity=3600\
		-e mail_rate_limit=60 -t $(LATEST)

run-bash:
	@docker run -it --rm --name $(PROJECT) -t $(LATEST) /bin/bash