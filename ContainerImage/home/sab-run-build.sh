#!/bin/bash

#usage: './sab-run-build.sh <REPO_NAME> <REPO_URL> <KEYSTORE_AND_ALIAS_PASSWORD'
#keystore and alias password must be the same

/usr/share/scripture-app-builder/sab.sh -load AudioBible -ksp "asdfasdf" \
    -kap "asdfasdf" \
    -a "/root/about.txt" \
    -ic "/root/images/xxhdpi_launcher.png" \
    -ic "/root/images/hdpi_launcher.png" 
/usr/share/scripture-app-builder/sab.sh -load AudioBible -build
