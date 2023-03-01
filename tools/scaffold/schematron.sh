#!/bin/bash
SAMPLE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )/../.." &> /dev/null && pwd )
SAXON="tools/SaxonHE12-0J/saxon-he-12.0.jar"

yes | rm $SAMPLE_DIR/schematron/include/age_restriction.sch 2>/dev/null
yes | rm $SAMPLE_DIR/schematron/include/enumerate_categories.sch 2>/dev/null
yes | rm $SAMPLE_DIR/schematron/include/pre-training.sch 2>/dev/null

java -jar $SAXON -s:$SAMPLE_DIR/source/categories.xml -xsl:$SAMPLE_DIR/transform/age_restriction.sch.xsl -o:$SAMPLE_DIR/schematron/include/age_restriction.sch
java -jar $SAXON -s:$SAMPLE_DIR/source/categories.xml -xsl:$SAMPLE_DIR/transform/enumerate_categories.sch.xsl -o:$SAMPLE_DIR/schematron/include/enumerate_categories.sch
java -jar $SAXON -s:$SAMPLE_DIR/source/pre-training.xml -xsl:$SAMPLE_DIR/transform/pre-training.sch.xsl -o:$SAMPLE_DIR/schematron/include/pre-training.sch

echo $SAMPLE_DIR/schematron/include/age_restriction.sch generated
echo $SAMPLE_DIR/schematron/include/enumerate_categories.sch generated
echo $SAMPLE_DIR/schematron/include/pre-training.sch generated
