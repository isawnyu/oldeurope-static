<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select="//img[starts-with(@src, 'http')]"/>
    </xsl:template>
    
    <xsl:template match="img">
        <xsl:text>curl -o </xsl:text>
        <xsl:for-each select="tokenize(normalize-space(@src),'/')[last()]">
            <xsl:sequence select="."/>
        </xsl:for-each>
        <xsl:text> </xsl:text>
        <xsl:value-of select="normalize-space(@src)"/><xsl:text>
</xsl:text>
    </xsl:template>
    <xsl:template match="*"/>
</xsl:stylesheet>