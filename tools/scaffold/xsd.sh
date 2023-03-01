#!/bin/bash
SAMPLE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )/../.." &> /dev/null && pwd )
SAXON="tools/SaxonHE12-0J/saxon-he-12.0.jar"

yes | rm $SAMPLE_DIR/schema/include/enumerate_categories.xsd 2>/dev/null

java -jar $SAXON -s:$SAMPLE_DIR/source/categories.xml -xsl:$SAMPLE_DIR/transform/enumerate_categories.xsd.xsl -o:$SAMPLE_DIR/schema/include/enumerate_categories.xsd

echo $SAMPLE_DIR/schema/include/enumerate_categories.xsd generated
