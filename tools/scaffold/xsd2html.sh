#!/bin/bash
SAMPLE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )/../.." &> /dev/null && pwd )
OUTPUT=$SAMPLE_DIR/tools/output/xsd2html.html
SAXON=$SAMPLE_DIR/tools/SaxonHE12-0J/saxon-he-12.0.jar

yes | rm $OUTPUT 2>/dev/null

java -jar $SAXON -s:$SAMPLE_DIR/schema/main.xsd -xsl:$SAMPLE_DIR/transform/xsd2html2xml-3.3/xsd2html2xml.xsl -o:$OUTPUT

echo $OUTPUT generated