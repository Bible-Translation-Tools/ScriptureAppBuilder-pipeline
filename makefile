.PHONY: build-dev run-dev shell-dev

build-dev:
	# Builds the container.
	cd ContainerImage \
	&& docker build --tag sab-local .

run-dev:
	# Runs the project headless.  Output should be an Android APK.
	TEMP_KEYSTORE_DIR=$$(mktemp -d /tmp/sab-keystore-XXXXXX) \
	&& APK_OUTPUT_DIR=/tmp/sab-output \
	&& mkdir -p $${APK_OUTPUT_DIR} \
	&& cd ContainerImage \
	&& docker run \
	   --rm \
	   --entrypoint /root/sab-build-debug-keystore.sh \
	   --volume $${TEMP_KEYSTORE_DIR}:/working \
	   sab-local \
	&& docker run \
	   --rm \
	   --volume $${TEMP_KEYSTORE_DIR}/keystore3.keystore:/root/keystore3.keystore \
	   --volume "$${APK_OUTPUT_DIR}:/root/App Builder/Scripture Apps/Apk Output" \
	   sab-local \
	       en_ulb \
	       https://content.bibletranslationtools.org/WycliffeAssociates/en_ulb \
	       debugpass

gui-dev:
	# Runs the Scripture App Builder GUI
	TEMP_KEYSTORE_DIR=$$(mktemp -d /tmp/sab-keystore-XXXXXX) \
	&& APK_OUTPUT_DIR=/tmp/sab-output \
	&& mkdir -p $${APK_OUTPUT_DIR} \
	&& cd ContainerImage \
	&& docker run \
	   --rm \
	   --entrypoint /root/sab-build-debug-keystore.sh \
	   --volume $${TEMP_KEYSTORE_DIR}:/working \
	   sab-local \
	&& docker run --interactive --tty --rm --net=host \
	   --env DISPLAY="$${DISPLAY}" \
	   --volume="${XAUTHORITY}:/root/.Xauthority:rw" \
	   --volume $${TEMP_KEYSTORE_DIR}/keystore3.keystore:/root/keystore3.keystore \
	   --volume "$${APK_OUTPUT_DIR}:/root/App Builder/Scripture Apps/Apk Output" \
	   --entrypoint scripture-app-builder \
	   sab-local

shell-dev:
	# Invokes the container and opens a prompt.  
	# To run the GUI, type 'scripture-app-builder'
	TEMP_KEYSTORE_DIR=$$(mktemp -d /tmp/sab-keystore-XXXXXX) \
	&& APK_OUTPUT_DIR=/tmp/sab-output \
	&& mkdir -p $${APK_OUTPUT_DIR} \
	&& cd ContainerImage \
	&& docker run \
	   --rm \
	   --entrypoint /root/sab-build-debug-keystore.sh \
	   --volume $${TEMP_KEYSTORE_DIR}:/working \
	   sab-local \
	&& docker run --interactive --tty --rm --net=host \
	   --env DISPLAY="$${DISPLAY}" \
	   --volume="${XAUTHORITY}:/root/.Xauthority:rw" \
	   --volume $${TEMP_KEYSTORE_DIR}/keystore3.keystore:/root/keystore3.keystore \
	   --volume "$${APK_OUTPUT_DIR}:/root/App Builder/Scripture Apps/Apk Output" \
	   --volume /tmp/sab-working:/working \
	   --entrypoint /bin/bash \
	   sab-local
