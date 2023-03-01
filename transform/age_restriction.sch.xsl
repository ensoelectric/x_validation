<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/">
		<pattern name="Driver age constraints"
				 xmlns="http://purl.oclc.org/dsdl/schematron">
			<title>Проверка ограничений по возрасту</title>

			<annotation>
				<documentation>Получить права может водитель определенного возраста. Условия такие:</documentation>
			</annotation>

			<rule context="License/Driver">
				<let name="DriverAge" value="floor(days-from-duration(current-date()-xs:date(DateOfBirth)) div 365.25)"/>
				<xsl:for-each-group select="//DATA_RECORD" group-by="age">
					<xsl:element name="report">

						<xsl:attribute name="test">
							<xsl:text>$DriverAge &lt; </xsl:text>
							<xsl:value-of select="age" />
							<xsl:text> and ../Categories/Category/Name = ('</xsl:text>
							<xsl:value-of select="current-group()/name" separator="','"/>
							<xsl:text>')</xsl:text>
						</xsl:attribute>

						<xsl:attribute name="role">
							<xsl:text>ERROR</xsl:text>
						</xsl:attribute>

						<xsl:text>В удостоверении указаны категории ТС, для управления которыми водитель должен быть старше </xsl:text>
						<xsl:value-of select="age"/>
						<xsl:text> лет</xsl:text>

					</xsl:element>
				</xsl:for-each-group>

			</rule>
		</pattern>
	</xsl:template>

</xsl:stylesheet> 
