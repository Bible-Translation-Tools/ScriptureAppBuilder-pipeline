#!/bin/bash

#usage: './sab-run-build.sh <REPO_NAME> <REPO_URL> <KEYSTORE_AND_ALIAS_PASSWORD'
#keystore and alias password must be the same

if [ -z $1 ];
then echo "\$REPO not set" && exit
fi

if [ -z $2 ];
then echo "\$REPOURL not set" && exit
fi

if [ -z $3 ];
then echo "\$KEYPASS not set" && exit
fi

REPO=$1
REPOURL=$2
KEYPASS=$3

wget ${REPOURL}/archive/master.zip

/usr/share/scripture-app-builder/sab.sh -new -n "${REPO}" \
    -p org.example.${REPO} \
    -b master.zip \
    -f "/root/fonts/JameelNooriNastaleeq.ttf" \
    -f "/root/fonts/CharisSILCompact-B.ttf" \
    -f "/root/fonts/CharisSILCompact-R.ttf" \
    -f "/root/fonts/JameelNooriNastaleeq.ttf" \
    -f "/root/fonts/NotoKufiArabic-Regular.ttf" \
    -f "/root/fonts/NotoMono-Regular.ttf" \
    -f "/root/fonts/NotoNaskhArabic-Regular.ttf" \
    -f "/root/fonts/NotoNaskhArabicUI-Regular.ttf" \
    -f "/root/fonts/NotoSansAdlam-Regular.ttf" \
    -f "/root/fonts/NotoSansAdlamUnjoined-Regular.ttf" \
    -f "/root/fonts/NotoSansAnatolianHieroglyphs-Regular.ttf" \
    -f "/root/fonts/NotoSansArabic-Regular.ttf" \
    -f "/root/fonts/NotoSansArabicUI-Regular.ttf" \
    -f "/root/fonts/NotoSansArmenian-Regular.ttf" \
    -f "/root/fonts/NotoSansAvestan-Regular.ttf" \
    -f "/root/fonts/NotoSansBalinese-Regular.ttf" \
    -f "/root/fonts/NotoSansBamum-Regular.ttf" \
    -f "/root/fonts/NotoSansBatak-Regular.ttf" \
    -f "/root/fonts/NotoSansBengali-Regular.ttf" \
    -f "/root/fonts/NotoSansBengaliUI-Regular.ttf" \
    -f "/root/fonts/NotoSansBrahmi-Regular.ttf" \
    -f "/root/fonts/NotoSansBuginese-Regular.ttf" \
    -f "/root/fonts/NotoSansBuhid-Regular.ttf" \
    -f "/root/fonts/NotoSansCanadianAboriginal-Regular.ttf" \
    -f "/root/fonts/NotoSansCarian-Regular.ttf" \
    -f "/root/fonts/NotoSansChakma-Regular.ttf" \
    -f "/root/fonts/NotoSansCham-Regular.ttf" \
    -f "/root/fonts/NotoSansCherokee-Regular.ttf" \
    -f "/root/fonts/NotoSansCoptic-Regular.ttf" \
    -f "/root/fonts/NotoSansCuneiform-Regular.ttf" \
    -f "/root/fonts/NotoSansCypriot-Regular.ttf" \
    -f "/root/fonts/NotoSansDeseret-Regular.ttf" \
    -f "/root/fonts/NotoSansDevanagari-Regular.ttf" \
    -f "/root/fonts/NotoSansDisplay-Regular.ttf" \
    -f "/root/fonts/NotoSansEgyptianHieroglyphs-Regular.ttf" \
    -f "/root/fonts/NotoSansEthiopic-Regular.ttf" \
    -f "/root/fonts/NotoSansGeorgian-Regular.ttf" \
    -f "/root/fonts/NotoSansGlagolitic-Regular.ttf" \
    -f "/root/fonts/NotoSansGothic-Regular.ttf" \
    -f "/root/fonts/NotoSansGujarati-Regular.ttf" \
    -f "/root/fonts/NotoSansGujaratiUI-Regular.ttf" \
    -f "/root/fonts/NotoSansGurmukhi-Regular.ttf" \
    -f "/root/fonts/NotoSansGurmukhiUI-Regular.ttf" \
    -f "/root/fonts/NotoSansHanunoo-Regular.ttf" \
    -f "/root/fonts/NotoSansHebrew-Regular.ttf" \
    -f "/root/fonts/NotoSansImperialAramaic-Regular.ttf" \
    -f "/root/fonts/NotoSansInscriptionalPahlavi-Regular.ttf" \
    -f "/root/fonts/NotoSansInscriptionalParthian-Regular.ttf" \
    -f "/root/fonts/NotoSansJavanese-Regular.ttf" \
    -f "/root/fonts/NotoSansKaithi-Regular.ttf" \
    -f "/root/fonts/NotoSansKannada-Regular.ttf" \
    -f "/root/fonts/NotoSansKannadaUI-Regular.ttf" \
    -f "/root/fonts/NotoSansKayahLi-Regular.ttf" \
    -f "/root/fonts/NotoSansKharoshthi-Regular.ttf" \
    -f "/root/fonts/NotoSansKhmer-Regular.ttf" \
    -f "/root/fonts/NotoSansKhmerUI-Regular.ttf" \
    -f "/root/fonts/NotoSansLao-Regular.ttf" \
    -f "/root/fonts/NotoSansLaoUI-Regular.ttf" \
    -f "/root/fonts/NotoSansLepcha-Regular.ttf" \
    -f "/root/fonts/NotoSansLimbu-Regular.ttf" \
    -f "/root/fonts/NotoSansLinearB-Regular.ttf" \
    -f "/root/fonts/NotoSansLisu-Regular.ttf" \
    -f "/root/fonts/NotoSansLycian-Regular.ttf" \
    -f "/root/fonts/NotoSansLydian-Regular.ttf" \
    -f "/root/fonts/NotoSansMalayalam-Regular.ttf" \
    -f "/root/fonts/NotoSansMalayalamUI-Regular.ttf" \
    -f "/root/fonts/NotoSansMandaic-Regular.ttf" \
    -f "/root/fonts/NotoSansMeeteiMayek-Regular.ttf" \
    -f "/root/fonts/NotoSansMongolian-Regular.ttf" \
    -f "/root/fonts/NotoSansMono-Regular.ttf" \
    -f "/root/fonts/NotoSansMyanmar-Regular.ttf" \
    -f "/root/fonts/NotoSansMyanmarUI-Regular.ttf" \
    -f "/root/fonts/NotoSansNewTaiLue-Regular.ttf" \
    -f "/root/fonts/NotoSansNKo-Regular.ttf" \
    -f "/root/fonts/NotoSansOgham-Regular.ttf" \
    -f "/root/fonts/NotoSansOlChiki-Regular.ttf" \
    -f "/root/fonts/NotoSansOldItalic-Regular.ttf" \
    -f "/root/fonts/NotoSansOldPersian-Regular.ttf" \
    -f "/root/fonts/NotoSansOldSouthArabian-Regular.ttf" \
    -f "/root/fonts/NotoSansOldTurkic-Regular.ttf" \
    -f "/root/fonts/NotoSansOriya-Regular.ttf" \
    -f "/root/fonts/NotoSansOriyaUI-Regular.ttf" \
    -f "/root/fonts/NotoSansOsage-Regular.ttf" \
    -f "/root/fonts/NotoSansOsmanya-Regular.ttf" \
    -f "/root/fonts/NotoSansPhagsPa-Regular.ttf" \
    -f "/root/fonts/NotoSansPhoenician-Regular.ttf" \
    -f "/root/fonts/NotoSans-Regular.ttf" \
    -f "/root/fonts/NotoSansRejang-Regular.ttf" \
    -f "/root/fonts/NotoSansRunic-Regular.ttf" \
    -f "/root/fonts/NotoSansSamaritan-Regular.ttf" \
    -f "/root/fonts/NotoSansSaurashtra-Regular.ttf" \
    -f "/root/fonts/NotoSansShavian-Regular.ttf" \
    -f "/root/fonts/NotoSansSinhala-Regular.ttf" \
    -f "/root/fonts/NotoSansSinhalaUI-Regular.ttf" \
    -f "/root/fonts/NotoSansSundanese-Regular.ttf" \
    -f "/root/fonts/NotoSansSylotiNagri-Regular.ttf" \
    -f "/root/fonts/NotoSansSymbols2-Regular.ttf" \
    -f "/root/fonts/NotoSansSymbols-Regular.ttf" \
    -f "/root/fonts/NotoSansSyriacEastern-Regular.ttf" \
    -f "/root/fonts/NotoSansSyriacEstrangela-Regular.ttf" \
    -f "/root/fonts/NotoSansSyriacWestern-Regular.ttf" \
    -f "/root/fonts/NotoSansTagalog-Regular.ttf" \
    -f "/root/fonts/NotoSansTagbanwa-Regular.ttf" \
    -f "/root/fonts/NotoSansTaiLe-Regular.ttf" \
    -f "/root/fonts/NotoSansTaiTham-Regular.ttf" \
    -f "/root/fonts/NotoSansTaiViet-Regular.ttf" \
    -f "/root/fonts/NotoSansTamil-Regular.ttf" \
    -f "/root/fonts/NotoSansTamilUI-Regular.ttf" \
    -f "/root/fonts/NotoSansTelugu-Regular.ttf" \
    -f "/root/fonts/NotoSansTeluguUI-Regular.ttf" \
    -f "/root/fonts/NotoSansThaana-Regular.ttf" \
    -f "/root/fonts/NotoSansThai-Regular.ttf" \
    -f "/root/fonts/NotoSansThaiUI-Regular.ttf" \
    -f "/root/fonts/NotoSansTibetan-Regular.ttf" \
    -f "/root/fonts/NotoSansTifinagh-Regular.ttf" \
    -f "/root/fonts/NotoSansUgaritic-Regular.ttf" \
    -f "/root/fonts/NotoSansVai-Regular.ttf" \
    -f "/root/fonts/NotoSansYi-Regular.ttf" \
    -f "/root/fonts/NotoSerifArmenian-Regular.ttf" \
    -f "/root/fonts/NotoSerifBengali-Regular.ttf" \
    -f "/root/fonts/NotoSerifDevanagari-Regular.ttf" \
    -f "/root/fonts/NotoSerifDisplay-Regular.ttf" \
    -f "/root/fonts/NotoSerifEthiopic-Regular.ttf" \
    -f "/root/fonts/NotoSerifGeorgian-Regular.ttf" \
    -f "/root/fonts/NotoSerifGujarati-Regular.ttf" \
    -f "/root/fonts/NotoSerifHebrew-Regular.ttf" \
    -f "/root/fonts/NotoSerifKannada-Regular.ttf" \
    -f "/root/fonts/NotoSerifKhmer-Regular.ttf" \
    -f "/root/fonts/NotoSerifLao-Regular.ttf" \
    -f "/root/fonts/NotoSerifMalayalam-Regular.ttf" \
    -f "/root/fonts/NotoSerifMyanmar-Regular.ttf" \
    -f "/root/fonts/NotoSerif-Regular.ttf" \
    -f "/root/fonts/NotoSerifSinhala-Regular.ttf" \
    -f "/root/fonts/NotoSerifTamil-Regular.ttf" \
    -f "/root/fonts/NotoSerifTelugu-Regular.ttf" \
    -f "/root/fonts/NotoSerifThai-Regular.ttf" \
    -ic "/root/images/xxhdpi_launcher.png" \
    -ic "/root/images/hdpi_launcher.png" \
    -ks "/root/keystore3.keystore" \
    -ksp "$KEYPASS" \
    -ka "key1" \
    -kap "$KEYPASS" \
    -cs "Royal Blue" \
    -a "/root/about.txt" \
    -build
