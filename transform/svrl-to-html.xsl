<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
        xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xhtml="http://www.w3.org/1999/xhtml"
        xmlns:j4r="http://jats4r.org/ns"
        version="2.0" exclude-result-prefixes="svrl">

    <xsl:output method="html" omit-xml-declaration="yes" standalone="no" indent="yes"/>

    <xsl:template match="svrl:schematron-output">
        <xsl:result-document>
            <div>
                <p>Checks performed:</p>
                <ul>
                    <xsl:apply-templates select="svrl:active-pattern"/>
                </ul>

                <xsl:variable name='problems' select='svrl:failed-assert|svrl:successful-report'/>
                <xsl:choose>
                    <xsl:when test="$problems">
                        <table class='results'>
                            <thead>
                                <tr>
                                    <th>Severity level</th>
                                    <th>Location</th>
                                    <th>Message</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="$problems">
                                    <xsl:call-template name='problem-report'/>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </xsl:when>
                    <xsl:otherwise>
                        <p>No problems were found.</p>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
        </xsl:result-document>
    </xsl:template>

    <xsl:template match="svrl:active-pattern">
        <li>
            <xsl:value-of select="@name"/>
        </li>
    </xsl:template>

    <xsl:template name='problem-report'>
        <xsl:variable name='role'>
            <xsl:choose>
                <xsl:when test="contains(@role, 'ERROR') or contains(@role, 'WARNING') or contains(@role, 'FATAL')">
                    <xsl:value-of select="@role"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'undefined'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <tr class='{$role}'>
            <td>
                <xsl:value-of select='$role'/>
            </td>
            <td>
                <!-- Insert zero-width spaces to allow the browser to wrap the location cell -->
                <span class='xpath-display'>
                    <xsl:value-of select="replace(@location, '/', '&#x200B;/&#x200B;')"/>
                </span>
                <span class='xpath-location'>
                    <xsl:value-of select='@location'/>
                </span>
            </td>
            <td>
                <xsl:apply-templates select="svrl:text"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
