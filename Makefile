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
	@docker run -it --rm --name $(PROJECT) -p 8080:8080\
		-v $(shell pwd)/temp:/var/lib/hagrid\
		-t $(LATEST)

run-bash:
	@docker run -it --rm --name $(PROJECT) -t $(LATEST) /bin/bash