<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
<xsl:template match="/">
	<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
		<xs:simpleType name="categoriesType">
			<xs:restriction base="xs:string">
				<xsl:for-each select="//DATA_RECORD">
					<xsl:element name="xs:enumeration">
						<xsl:attribute name="value">
							<xsl:value-of select="name"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:for-each>
			</xs:restriction>
		</xs:simpleType>
	</xs:schema>

</xsl:template>

</xsl:stylesheet> 
