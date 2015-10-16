<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:outline="http://wkhtmltopdf.org/outline"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
        indent="yes"
/>

<xsl:template match="outline:outline">
    <html>
      <head>
        <title>Table of Contents</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <style>
          * {
              font-family: "Liberation Sans";
          }
          body {
              height: 90%;
              font-size: 10px;
              line-height: 13px;
              padding-top: 0px !important;
              padding-bottom: 0px !important;
          }
          body ul li li li { display: none; }
        h1 {
            text-align: center;
            font-size: 14px;
            line-height: 14px;
            font-weight: bold;
            margin: 0px;
          }
          span.page {
              float: right;
              padding-left: 1em;
              background: white;
              position: relative;
              z-index: 1;
          }
          li li span.filler {
              border-style: none !important;
          }
          li {
              list-style: none;
              margin: 0;
              padding-top: 0px;
              padding-bottom: 0px;
          }
          ul {
              margin: 0;
              overflow-x: hidden;
              padding-left: 0em;
              padding-top: 0px;
              padding-bottom: 0px;
          }

          li div {
              margin: 0;
              padding-top: 0px;
              padding-bottom: 0px;
              margin-top: 12px;
              font-weight: bold;
          }
          li li div {
              margin: 0;
              font-weight: normal;
              margin-top: 2px;
              width: 100%;
          }
          ul ul {
              padding-left: 1em;
          }
          a {
              text-decoration:none;
              color: black;
          }
          body ul {
          }
          a:first-child {
              padding-right: 1em;
              background: white;
          }

          li div:before {
            margin: 0px;
            padding: 0px;
            float: left;
            width: 0;
            white-space: nowrap;
            content:
 ". . . . . . . . . . . . . . . . . . . . "
 ". . . . . . . . . . . . . . . . . . . . "
 ". . . . . . . . . . . . . . . . . . . . "
 ". . . . . . . . . . . . . . . . . . . . "
 ". . . . . . . . . . . . . . . . . . . . "
 ". . . . . . . . . . . . . . . . . . . . "
 ". . . . . . . . . . . . . . . . . . . . "
 ". . . . . . . . . . . . . . . . . . . . "
 ". . . . . . . . . . . . . . . . . . . . "
 ". . . . . . . . . . . . . . . . . . . . "
 ". . . . . . . . . . . . . . . . . . . . "
 ". . . . . . . . . . . . . . . . . . . . "
 ". . . . . . . . . . . . . . . . . . . . "
 ". . . . . . . . . . . . . . . . . . . . ";
            }
            li li div:before {
                content: "";
            }
      </style>
      </head>
      <body>
        <h1>Table of Contents</h1>
        <ul>
          <xsl:comment>added to prevent self-closing tags in QtXmlPatterns</xsl:comment>
          <xsl:apply-templates select="outline:item/outline:item"/>
        </ul>
      </body>
    </html>
</xsl:template>
<xsl:template match="outline:item">
    <li>
      <xsl:if test="@title!=''">
        <div>
          <a>
            <xsl:if test="@link">
              <xsl:attribute name="href"><xsl:value-of select="@link"/></xsl:attribute>
            </xsl:if>
            <xsl:if test="@backLink">
              <xsl:attribute name="name"><xsl:value-of select="@backLink"/></xsl:attribute>
            </xsl:if>
            <xsl:value-of select="@title" />
          </a>
          <span class="page"> <xsl:value-of select="@page" /> </span>
        </div>
      </xsl:if>
      <ul>
        <xsl:comment>added to prevent self-closing tags in QtXmlPatterns</xsl:comment>
        <xsl:apply-templates select="outline:item"/>
      </ul>
    </li>
</xsl:template>
</xsl:stylesheet>

