#!/bin/bash
#SDK_DIR=$1
SDK_DIR=/Users/sg/Documents/cod4mw_modtools_v1
SRC_DIR=`pwd`
OUT_DIR=build/tactical
[ -e "${SRC_DIR}/${OUT_DIR}/mod.ff" ] && rm -f "${SRC_DIR}/${OUT_DIR}/mod.ff"
#Any additional resources should be moved in to appropriate folder inside $SDK_DIR/raw 
cp -rf ./ui_mp/* "${SDK_DIR}/raw/ui_mp/"
#cp -f "./sound/whizbys/*" "${SDK_DIR}/raw/sound/whizby/"
cp -rf soundaliases/tactical.csv "${SDK_DIR}/raw/soundaliases/"
cp -f mod.csv "${SDK_DIR}/zone_source/"
cd "${SDK_DIR}/bin/"
wine linker_pc.exe -language english -compress -cleanup mod

cp -f "${SDK_DIR}/zone/english/mod.ff" "${SRC_DIR}/${OUT_DIR}/mod.ff"


