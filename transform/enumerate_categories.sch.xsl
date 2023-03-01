<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes"/>
<xsl:template match="/">
	<xsl:variable name="categories" >
		<xsl:value-of select="//DATA_RECORD/name" separator="','" />
	</xsl:variable>

	<pattern name="Enumerate of categories" xmlns="http://purl.oclc.org/dsdl/schematron">
		<title>Проверка существования категории</title>
		<rule context="License/Categories/Category">
				<xsl:element name="assert">
					<xsl:attribute name="test">
						<xsl:text>Name = ('</xsl:text>
						<xsl:value-of select="$categories"/>
						<xsl:text>')</xsl:text>
					</xsl:attribute>

					<xsl:attribute name="role">
						<xsl:text>ERROR</xsl:text>
					</xsl:attribute>

					<xsl:element name="value-of">
						<xsl:attribute name="select">
							<xsl:text>Name</xsl:text>
						</xsl:attribute>
					</xsl:element>

					<xsl:text> - не является категорией ТС</xsl:text>
				</xsl:element>
			</rule>
		</pattern>
</xsl:template>

</xsl:stylesheet> 
