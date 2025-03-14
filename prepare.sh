#!/bin/bash

set -e

if [[ "$#" -ne 1 || ( "$1" != "fetch-only" && "$1" != "fetch-and-update" ) ]]; then
    echo "Usage: $0 {fetch-only|fetch-and-update}"
    exit 1
fi


script_dir=$(dirname "$0")
cd ${script_dir}


if [[ "$1" == "fetch-only" || "$1" == "fetch-and-update" ]]; then
    git fetch origin
fi


modules="qtbase qtconnectivity qtfeedback qthttpserver qtlottie qtopcua qtquick3d qtremoteobjects qtserialbus qtsvg qtvirtualkeyboard qtwebglplugin qt3d qtcanvas3d qtdatavis3d qtgamepad qtimageformats qtmqtt qtpim qtquick3dphysics qtrepotools qtserialport qtsystems qtwayland qtwebsockets qt5compat qtcharts qtdeclarative qtgraphs qtlanguageserver qtmultimedia qtpositioning qtquickeffectmaker qtscxml qtshadertools qttools qtwebchannel qtwebview qtactiveqt qtcoap qtdoc qtgrpc qtlocation qtnetworkauth qtqa qtquicktimeline qtsensors qtspeech qttranslations qtwebengine qtxmlpatterns"


if [[ "$1" == "fetch-and-update" ]]; then
    git submodule update --init --recursive
fi
