#!/bin/sh
keytool \
    -genkey \
    -noprompt \
    -alias sab-debug \
    -dname "CN=mqttserver.ibm.com, OU=ID, O=IBM, L=Hursley, S=Hants, C=GB" \
    -keystore /working/keystore3.keystore \
    -storepass debugpass \
    -keypass debugpass
