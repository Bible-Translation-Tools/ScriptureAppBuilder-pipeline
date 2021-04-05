.PHONY: build-dev run-dev

build-dev:
	cd ContainerImage \
	&& docker build --tag sab-local .

run-dev:
	cd ContainerImage \
	&& docker run sab-local
