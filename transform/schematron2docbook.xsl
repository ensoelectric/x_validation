<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:sch="http://purl.oclc.org/dsdl/schematron"
                xmlns:db="http://docbook.org/ns/docbook">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">

        <db:book>
            <db:bookinfo>
                <db:title><xsl:value-of select="sch:schema/sch:title"/></db:title>
                <db:pubdate><xsl:value-of select="current-dateTime()"/></db:pubdate>
            </db:bookinfo>

            <xsl:apply-templates/>
        </db:book>

    </xsl:template>

    <xsl:template match="sch:schema/sch:pattern">
        <db:article>
            <db:artheader>
                <db:title><xsl:value-of select="sch:title"/></db:title>
            </db:artheader>

            <db:epigraph>
                <xsl:value-of select="sch:annotation/sch:documentation"/>
            </db:epigraph>

            <xsl:apply-templates select="sch:rule"/>
        </db:article>

    </xsl:template>

    <xsl:template match="sch:rule">
            <db:chapter>
                <db:title>
                    <xsl:choose>
                        <xsl:when test="not(sch:title)">
                            Untitled rule
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="sch:title"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </db:title>

                <xsl:choose>
                    <xsl:when test="not(sch:annotation/sch:documentation)">
                        Undefined description for the rule
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="sch:annotation/sch:documentation"/>
                    </xsl:otherwise>
                </xsl:choose>

                <xsl:apply-templates select="sch:assert|sch:report"/>
            </db:chapter>
    </xsl:template>

    <xsl:template match="sch:assert">
        <db:simplesect>
            <db:title>Assert</db:title>
            <db:para>Приоритет: <xsl:value-of select="@role"/></db:para>
            <db:para>Schematron Assertion: <xsl:value-of select="@test"/></db:para>
            <db:para>Schematron Message: <xsl:value-of select="."/></db:para>
        </db:simplesect>
    </xsl:template>

    <xsl:template match="sch:report">
        <db:simplesect>
            <db:title>Report</db:title>
            <db:para>Приоритет: <xsl:value-of select="@role"/></db:para>
            <db:para>Schematron Reporting: <xsl:value-of select="@test"/></db:para>
            <db:para>Schematron Message: <xsl:value-of select="."/></db:para>
        </db:simplesect>
    </xsl:template>


</xsl:stylesheet>
