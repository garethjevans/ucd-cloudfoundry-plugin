#!/bin/bash

VERSION=$1
if [[ -z $VERSION ]]; then
	VERSION=$(date +%s)
fi
ZIP_NAME=CloudFoundryPlugin_V$VERSION.zip
ZIP=releases/$ZIP_NAME

cd ..

# Add bin files to zip
zip -r $ZIP bin -x \*.project*

# Add classes files to zip
zip -r $ZIP classes -x \*.project*

# Add license to zip
cd license
zip ../$ZIP * -x \*.project*

# Add plugin files to zip
cd ../plugin
zip ../$ZIP * -x \*.project*

# Add src files to zip
cd ../src
zip ../$ZIP * -x \*.project*
