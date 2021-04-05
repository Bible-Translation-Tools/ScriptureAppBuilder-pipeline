.PHONY: build-dev run-dev

build-dev:
	cd ContainerImage \
	&& docker build --tag sab-local .

run-dev:
	TEMP_KEYSTORE_DIR=$$(mktemp -d /tmp/sab-keystore-XXXXXX) \
	&& cd ContainerImage \
	&& docker run \
	   --entrypoint /root/sab-build-debug-keystore.sh \
	   --volume $${TEMP_KEYSTORE_DIR}:/working \
	   sab-local \
    && docker run \
	   --volume $${TEMP_KEYSTORE_DIR}/keystore3.keystore:/root/keystore3.keystore \
	   sab-local \
		   en_ulb \
		   https://content.bibletranslationtools.org/WycliffeAssociates/en_ulb \
		   debugpass
			  
