<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
        xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xhtml="http://www.w3.org/1999/xhtml"
        xmlns:j4r="http://jats4r.org/ns"
        version="2.0" exclude-result-prefixes="svrl">

    <xsl:output method="text"/>

    <xsl:template match="/">
        <xsl:value-of select="count(//svrl:failed-assert|//svrl:successful-report)" />
    </xsl:template>

</xsl:stylesheet>
