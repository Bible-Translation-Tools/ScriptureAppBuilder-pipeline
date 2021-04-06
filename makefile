.PHONY: build-dev run-dev shell-dev

build-dev:
	cd ContainerImage \
	&& docker build --tag sab-local .

run-dev:
	TEMP_KEYSTORE_DIR=$$(mktemp -d /tmp/sab-keystore-XXXXXX) \
	&& cd ContainerImage \
	&& docker run \
	   --rm \
	   --entrypoint /root/sab-build-debug-keystore.sh \
	   --volume $${TEMP_KEYSTORE_DIR}:/working \
	   sab-local \
	&& docker run \
	   --rm \
	   --volume $${TEMP_KEYSTORE_DIR}/keystore3.keystore:/root/keystore3.keystore \
	   sab-local \
	       en_ulb \
	       https://content.bibletranslationtools.org/WycliffeAssociates/en_ulb \
	       debugpass

shell-dev:
	TEMP_KEYSTORE_DIR=$$(mktemp -d /tmp/sab-keystore-XXXXXX) \
	&& cd ContainerImage \
	&& docker run \
	   --rm \
	   --entrypoint /root/sab-build-debug-keystore.sh \
	   --volume $${TEMP_KEYSTORE_DIR}:/working \
	   sab-local \
	&& docker run --interactive --tty \
	   --rm \
	   --env DISPLAY=$${DISPLAY} \
	   --volume $${TEMP_KEYSTORE_DIR}/keystore3.keystore:/root/keystore3.keystore \
	   --entrypoint /bin/bash \
	   sab-local
