<?php

$pipelineXsl = realpath(__DIR__ . '/../transform/schxslt-1.9.4/2.0/pipeline-for-svrl.xsl');
$svrl2htmlXsl = realpath(__DIR__ . '/../transform/svrl-to-html.xsl');
$svrl2intXsl = realpath(__DIR__ . '/../transform/svrl-to-int.xsl');

$schFile = realpath(__DIR__ . '/../schematron/main.sch');
$xmlFile = realpath(__DIR__ . '/../source/main.xml');

$saxonProc = new Saxon\SaxonProcessor();
$proc = $saxonProc->newXslt30Processor();

#First transformation to create Schematron processor
$pipeline = $proc->compileFromFile($pipelineXsl);
$firstTransform= $pipeline->transformToString( $saxonProc->parseXmlFromFile($schFile) ) ;

$schematron = $proc->compileFromString($firstTransform);

#Create validation report (SVRL)
$xml = $saxonProc->parseXmlFromFile($xmlFile);
$svrl = $schematron->transformToString($xml);

#SVRL to BOOL
$executable = $proc->compileFromFile($svrl2intXsl);
$inputNode = $saxonProc->parseXmlFromString($svrl);
$countErrs = (int) $executable->transformToString($inputNode);

if ( $countErrs > 0 ) {
    #SVRL to HTML
    $executable = $proc->compileFromFile($svrl2htmlXsl);
    $inputNode = $saxonProc->parseXmlFromString($svrl);
    echo $executable->transformToString($inputNode);

} else {
    echo "No problems were found.";
}
