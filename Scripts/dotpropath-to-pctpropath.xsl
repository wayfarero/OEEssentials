<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output omit-xml-declaration="yes" indent="yes"/>
	<xsl:strip-space elements="*"/>
	
	<xsl:param name="standardpaths-file" />
	<xsl:variable name="lookup-standardpaths" select="document($standardpaths-file)" />
	<xsl:variable name="CONTAINER" select="'con'" />
	<xsl:variable name="SOURCE_DIRECTORY" select="'src'" />
	<xsl:variable name="PROCEDURE_LIBRARY" select="'lib'" />
	<xsl:variable name="PROPATH_DIRECTORY" select="'dir'" />
	<xsl:variable name="FOLDER_REFERENCE" select="'folder'" />
	
	<xsl:template match="/">
		<project name="propath">
		<propath pathid="compilation.propath">
		  <xsl:for-each select="propath/propathentry">
			<xsl:if test="(@kind = $SOURCE_DIRECTORY) or (@kind = $PROCEDURE_LIBRARY) or (@kind = $PROPATH_DIRECTORY) or (@kind = $FOLDER_REFERENCE)">
				<xsl:choose>
				<xsl:when test="starts-with(@path, '@{ROOT}')  or starts-with(@path, '@{DLC}') or starts-with(@path, '@{WORK}')">
					<xsl:variable name="PATH_LINUX" select="translate(@path,'\','/')"/>
					<pathelement path="${substring($PATH_LINUX,2)}" />
				</xsl:when>
				<xsl:otherwise>
					<pathelement path="{@path}" />
				</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			
			<xsl:variable name="PATH_ID" select="@path" />
			<xsl:if test="(@kind = $CONTAINER)">
				<xsl:for-each select="$lookup-standardpaths/containers/container[@id = $PATH_ID]/propathentry">					
					<pathelement path="${substring(@path,2)}" />
				</xsl:for-each>
			</xsl:if>
		  </xsl:for-each>
		</propath>
		</project>
	</xsl:template>
</xsl:stylesheet>