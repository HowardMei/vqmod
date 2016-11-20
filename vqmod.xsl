<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="/">
    <html>
      <head>
        <title><xsl:value-of select="modification/id"/></title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <style>
        .operation {
          border-bottom: 1px #ccc dotted;
        }
        pre {
          margin: 0;
        }
        </style>
      </head>
      <body class="container">
      
        <h1><img src="https://www.litecart.net/images/logotype.png" alt="LiteCart" style="float: right; max-height: 80px;" />vQmod</h1>
        
        <h2><xsl:value-of select="modification/id"/></h2>
        <p>Developed by <xsl:value-of select="modification/author"/></p>
        
        <h3>Modification Instructions</h3>
        
        <p>
          <xsl:value-of select="modification/description"/>
        </p>
        
        <xsl:for-each select="modification/file">
          <div class="file panel panel-primary">
            <div class="panel-heading">Open the file <code><xsl:value-of select="@name"/></code></div>
      
            <xsl:for-each select="operation">
            <div class="operation panel-body">
              <div class="row">
                <div class="col-md-6">
                
                  <xsl:choose>
                    <xsl:when test="search/@position = 'top'">
                    At the beginning of the file
                    </xsl:when>
                  
                    <xsl:otherwise>
                      <xsl:choose>
                        <xsl:when test="search/@index = 1">
                        Find the 1st occurrence of
                        <pre><xsl:value-of select="search"/></pre>
                        </xsl:when>
                        
                        <xsl:when test="search/@index = 2">
                        Find the 2nd occurrence of
                        <pre><xsl:value-of select="search"/></pre>
                        </xsl:when>
                        
                        <xsl:when test="search/@index = 3">
                        Find the 3rd occurrence of
                        <pre><xsl:value-of select="search"/></pre>
                        </xsl:when>
                        
                        <xsl:when test="search/@index &gt; 3">
                        Find the <xsl:value-of select="search/@index"/>th occurrence of
                        <pre><xsl:value-of select="search"/></pre>
                        </xsl:when>
                        
                        <xsl:otherwise>
                        Find all occurrences of
                        <pre><xsl:value-of select="search"/></pre>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:otherwise>
                  </xsl:choose>
                  
                  <xsl:if test="search/@offset &gt; 0">
                  <strong style="color: red;">... including the next <xsl:value-of select="search/@offset"/> lines</strong>
                  </xsl:if>
                </div>
                
                <xsl:choose>
                  <xsl:when test="search/@position = 'replace'">
                  <div class="col-md-6">Replace with <pre><xsl:value-of select="add"/></pre></div>
                  </xsl:when>

                  <xsl:when test="search/@position='before'">
                  <div class="col-md-6">Before that, add <pre><xsl:value-of select="add"/></pre></div>
                  </xsl:when>
                  
                  <xsl:when test="search/@position='after'">
                  <div class="col-md-6">After that, add <pre><xsl:value-of select="add"/></pre></div>
                  </xsl:when>
                  
                  <xsl:when test="search/@position='top'">
                  <div class="col-md-6">Insert <pre><xsl:value-of select="add"/></pre></div>
                  </xsl:when>

                  <xsl:when test="search/@position='bottom'">
                  <div class="col-md-6">Insert <pre><xsl:value-of select="add"/></pre></div>
                  </xsl:when>
                  
                  <xsl:otherwise>
                  <div class="col-md-6">#!¤% <pre><xsl:value-of select="add"/></pre></div>
                  </xsl:otherwise>
                </xsl:choose>
              </div>
            </div>
            </xsl:for-each>
            
          </div>
        </xsl:for-each>
        
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>