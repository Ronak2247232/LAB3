<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
    <head>
        <style>
            th{
                color:white;
            }
            td{
                text-align:center;
            }
            </style>
    </head>
  <body>
  <h2>Music Streaming Platform</h2>
  <table border="1" >
    <tr bgcolor="blue" >
      <th >Artist Name</th>
      <th>Genre</th>
      <th>Popularity</th>
      <th>Albums</th>
      <th>Singles</th>
      <th>Monthly Listeners</th>
    </tr>
    <xsl:for-each select="MSP/Artist">
    <xsl:sort select="Name"/>
    <xsl:if test="Popularity &lt; 500">
    <tr> 
      <td><xsl:value-of select="Name"/></td>
      <td><xsl:value-of select="Genre"/></td>
      <td><xsl:value-of select="Popularity"/></td>
      <td><xsl:value-of select="Albums"/></td>
      <td><xsl:value-of select="Singles"/></td>
      <xsl:choose>
        <xsl:when test="MonthlyListeners &gt; 10000000">
          <td bgcolor="#fa7946">
          <xsl:value-of select="MonthlyListeners"/></td>
        </xsl:when>
        <xsl:otherwise>
          <td bgcolor="#ff70e5"><xsl:value-of select="MonthlyListeners"/></td>
        </xsl:otherwise>
      </xsl:choose>
    </tr>
    </xsl:if>
    </xsl:for-each>
  </table>
  <h2>Classic Artists Info</h2>
  <xsl:apply-templates/>
  </body>
  </html>
</xsl:template>
<xsl:template match="Artist">
    <p>
      <xsl:apply-templates select="Name"/>  
      <xsl:apply-templates select="Genre"/>
      <xsl:apply-templates select="Popularity"/>
      <xsl:apply-templates select="Albums"/>
      <xsl:apply-templates select="Singles"/>
      <xsl:apply-templates select="MonthlyListeners"/>
    </p>
  </xsl:template>
  
  <xsl:template match="Name">
    Name: <span style="color:#ff0000">
    <xsl:value-of select="."/></span>
    <br /></xsl:template>
  
  <xsl:template match="Genre">
    Genre: <span style="color:#6c4fc4">
    <xsl:value-of select="."/></span><br/></xsl:template>

    <xsl:template match="Popularity">
    Popularity: <span style="color:#ff6d12">
    <xsl:value-of select="."/></span><br/></xsl:template>

    <xsl:template match="Albums">
    Albums: <span style="color:#019134">
    <xsl:value-of select="."/></span><br/></xsl:template>

    <xsl:template match="Singles">
    Singles: <span style="color:#f01adb">
    <xsl:value-of select="."/></span><br/></xsl:template>

    <xsl:template match="MonthlyListeners">
    Monthly Listeners: <span style="color:#bfc902">
    <xsl:value-of select="."/></span>
    <br/>
  </xsl:template>
</xsl:stylesheet>