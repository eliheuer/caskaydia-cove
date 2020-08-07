#!/bin/bash
# source venv/bin/activate
set -e

# BUILD SETTINGS
GOOGLE_FONTS_DIR="~/Google/fonts"  # Where the Google Fonts repo is cloned: https://github.com/google/fonts
BUILD_STATIC_FONTS=false            # Set to `true` if you want to build static fonts

# BUILD SETUP
source venv/bin/activate
mkdir -p fonts
mkdir -p fonts/ttf
mkdir -p fonts/otf
mkdir -p fonts/variable

# BUILD PROCESS
echo "\n****** STARTING THE CASKAYDIA COVE BUILD SCRIPT"
echo "BUILD START TIME: \c"
date

if [ "$1" = "-gf" ]; then
    echo "\nPREPARING A PULL REQUEST TO GOOGLE FONTS AT: $GOOGLE_FONTS_DIR";
fi

if [ "$BUILD_STATIC_FONTS" = "true" ]; then
    echo "\nBUILD STATIC FONTS = TRUE"
else
    echo "\nBUILD STATIC FONTS = FALSE"
fi

echo "\nBUILDING VARIABLE FONTS WITH FONTMAKE..."
fontmake --mm-designspace sources/CaskaydiaCove.designspace -o variable \
  --output-path fonts/variable/CaskaydiaCove\[wght\].ttf
#  --verbose ERROR

if [ "$BUILD_STATIC_FONTS" = "true" ]; then
    echo "\nBUILDING STATIC TTF FONTS WITH FONTMAKE..."
    fontmake --mm-designspace sources/CaskaydiaCove.designspace -i -o ttf \
        --output-dir fonts/ttf/ \
        --verbose ERROR
    echo "\nBUILDING STATIC OTF FONTS WITH FONTMAKE..."
    fontmake --mm-designspace sources/CaskaydiaCove.designspace -i -o otf \
        --output-dir fonts/otf/ \
        --verbose ERROR
fi

echo "\nPOST-PROCESSING VFS"
vfs=$(ls fonts/variable/*.ttf)
for vf in $vfs
do
    gftools fix-dsig --autofix $vf
    gftools fix-nonhinting $vf $vf.fix
    mv $vf.fix $vf
    rm -rf fonts/variable/*-backup-fonttools-prep-gasp.ttf
done

if [ "$BUILD_STATIC_FONTS" = "true" ]; then
    echo "\nPOST-PROCESSING STATIC TTFS"
    ttfs=$(ls fonts/ttf/*.ttf)
    echo $ttfs
    for ttf in $ttfs
    do
        gftools fix-dsig --autofix $ttf
        ttfautohint $ttf $ttf.fix
        [ -f $ttf.fix ] && mv $ttf.fix $ttf
        gftools fix-hinting $ttf
        [ -f $ttf.fix ] && mv $ttf.fix $ttf
    done
    otfs=$(ls fonts/otf/*.otf)
    for otf in $otfs
    do
        gftools fix-dsig -f $otf
    done
fi

# GOOGLE FONTS FLAG (-gf) SECTION
METADATA='name: "Caskaydia Cove"
designer: "Aaron Bell"
license: "OFL"
category: "MONOSPACE"
date_added: "2020-07-20"
fonts {
  name: "Caskaydia Cove"
  style: "normal"
  weight: 400
  filename: "CaskaydiaCove[wght].ttf"
  post_script_name: "CaskaydiaCove-Regular"
  full_name: "Caskaydia Cove Regular"
  copyright: "Copyright 2020 The Caskaydia Cove Project Authors (https://github.com/eliheuer/caskaydia-cove)"
}
subsets: "latin"
subsets: "menu"
axes {
  tag: "wght"
  min_value: 200.0
  max_value: 700.0
}'

if [ "$1" = "-gf" ]; then
  echo "\nMOVING FILES FOR A NEW PR TO ~/Google/fonts/ofl/caskaydiacove";
  cp DESCRIPTION.en_us.html ~/Google/fonts/ofl/caskaydiacove/
  cp FONTLOG.txt ~/Google/fonts/ofl/caskaydiacove/
  echo "$METADATA" > ~/Google/fonts/ofl/caskaydiacove/METADATA.pb
  cp OFL.txt ~/Google/fonts/ofl/caskaydiacove/OFL.txt
  cp fonts/variable/CaskaydiaCove\[wght\].ttf ~/Google/fonts/ofl/caskaydiacove/
  mkdir -p ~/Google/fonts/ofl/caskaydiacove/static
  cp fonts/ttf/* ~/Google/fonts/ofl/caskaydiacove/static/
fi

# CLEAN UP BUILD FILES
rm -rf sources/instance_ufos

echo "\nDONE!😃"
