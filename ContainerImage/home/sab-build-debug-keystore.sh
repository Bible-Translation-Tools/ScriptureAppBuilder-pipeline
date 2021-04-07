#!/bin/sh
keytool \
    -genkey \
    -noprompt \
    -alias key1 \
    -dname "CN=sab.example.com, OU=ID, O=WA, L=Orlando, S=Florida, C=USA" \
    -keyalg RSA \
    -keysize 2048 \
    -validity 10000 \
    -keystore /working/keystore3.keystore \
    -storepass debugpass \
    -keypass debugpass
