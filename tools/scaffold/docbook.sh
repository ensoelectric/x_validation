#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )/../.." &> /dev/null && pwd )
SAXON="tools/SaxonHE12-0J/saxon-he-12.0.jar"
NEW_DOCBOOK="docbook"$(date '+%Y%m%d-%H:%M:%S')

for f in $(ls $SCRIPT_DIR/tools/output/docbook*) ; do
  yes | rm "$f" #2>/dev/null
  echo $f deleted
done

java -jar $SAXON -s:$SCRIPT_DIR/schematron/main.sch -xsl:$SCRIPT_DIR/transform/schematron2docbook.xsl -o:$SCRIPT_DIR/tools/output/$NEW_DOCBOOK.xml -xi 
java -jar $SAXON -s:$SCRIPT_DIR/tools/output/$NEW_DOCBOOK.xml -xsl:$SCRIPT_DIR/transform/docbook-xsl/website/website.xsl -o:$SCRIPT_DIR/tools/output/$NEW_DOCBOOK.html -xi 2>/dev/null

echo $SCRIPT_DIR/tools/output/$NEW_DOCBOOK.xml generated
echo $SCRIPT_DIR/tools/output/$NEW_DOCBOOK.html generated
