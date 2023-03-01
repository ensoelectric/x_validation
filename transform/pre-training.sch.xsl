<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/">
		<pattern name="Driver age constraints"
				 xmlns="http://purl.oclc.org/dsdl/schematron">
			<title>Проверка необходимого стажа управления</title>

			<annotation>
				<documentation>Получить права может водитель определенного возраста. Условия такие:</documentation>
			</annotation>

			<rule context="License/Categories/Category">
				<xsl:for-each select="//DATA_RECORD">
					<xsl:element name="report">
						<xsl:attribute name="test">
							<xsl:text>Name = '</xsl:text><xsl:value-of select="name"/>
							<xsl:text>' and ( not (</xsl:text>
							<xsl:text> preceding-sibling::Category[Name=('</xsl:text><xsl:value-of select="pre-training"/><xsl:text>') and xs:yearMonthDuration('P0Y</xsl:text>
							<xsl:value-of select="duration"/>
							<xsl:text>M')+xs:date(IssueDate) &lt; current-date()]</xsl:text>
							<xsl:text> or</xsl:text>
							<xsl:text> following-sibling::Category[Name=('</xsl:text><xsl:value-of select="pre-training"/><xsl:text>') and xs:yearMonthDuration('P0Y</xsl:text>
							<xsl:value-of select="duration"/>
							<xsl:text>M')+xs:date(IssueDate) &lt; current-date()]</xsl:text>
							<xsl:text>) )</xsl:text>
						</xsl:attribute>
						<xsl:text>Для получения категории "</xsl:text>
						<xsl:value-of select="name"/>
						<xsl:text>" водитель должен иметь право управления транспортными средствами категории "</xsl:text>
						<xsl:value-of select="pre-training"/>
						<xsl:text>" не менее </xsl:text>
						<xsl:value-of select="duration"/>
						<xsl:text> месяцев</xsl:text>

					</xsl:element>
				</xsl:for-each>

			</rule>
		</pattern>
	</xsl:template>

</xsl:stylesheet> 
