<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="drbdsetup_options">
    <!-- ignore -->
  </xsl:template>

  <xsl:template match="pick_drbdsetup_option">
    <xsl:variable name="name" select="@name"/>
    <varlistentry>
      <xsl:apply-templates select="//drbdsetup_options/drbdsetup_option[@name=$name]/term"/>
      <listitem>
	<xsl:apply-templates select="//drbdsetup_options/drbdsetup_option[@name=$name]/definition/*"/>
      </listitem>
    </varlistentry>
  </xsl:template>

  <xsl:template match="drbdsetup_option//indexterm">
    <!-- ignore -->
  </xsl:template>

  <xsl:template match="drbdsetup_option//only-drbdsetup">
    <xsl:copy-of select="node()"/>
  </xsl:template>

  <xsl:template match="drbdsetup_option//only-drbd-conf">
    <!-- ignore -->
  </xsl:template>

  <xsl:template match="drbdsetup_option/term/option">
    <xsl:variable name="args" select="@*"/>
    <option>
      <xsl:text>--</xsl:text>
      <xsl:copy-of select="node()"/>
    </option>
  </xsl:template>
</xsl:stylesheet>
