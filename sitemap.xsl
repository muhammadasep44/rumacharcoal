<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:html="http://www.w3.org/TR/REC-html40"
    xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="en">
      <head>
        <title>XML Sitemap | Ruma Charcoal (PT. Bumi Ruma Nusantara)</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="icon" href="/assets/images/favicon.png" type="image/png" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
        <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet" />
        <style type="text/css">
          * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
          }
          body {
            font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: #0B1120;
            color: #E2E8F0;
            font-size: 14px;
            line-height: 1.6;
            padding-bottom: 60px;
          }
          a {
            color: #FB923C;
            text-decoration: none;
            transition: color 0.2s ease;
          }
          a:hover {
            color: #F97316;
            text-decoration: underline;
          }
          .container {
            max-width: 1280px;
            margin: 0 auto;
            padding: 0 24px;
          }
          
          /* Top Header Bar */
          header {
            background: #070B14;
            border-bottom: 1px solid rgba(255, 255, 255, 0.08);
            padding: 24px 0;
          }
          .header-inner {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 16px;
          }
          .brand {
            display: flex;
            align-items: center;
            gap: 12px;
          }
          .brand-logo {
            width: 38px;
            height: 38px;
            object-fit: contain;
          }
          .brand-name {
            font-size: 22px;
            font-weight: 800;
            letter-spacing: -0.5px;
            color: #FFFFFF;
          }
          .brand-dot {
            color: #EA580C;
          }
          .badge-sitemap {
            background: rgba(234, 88, 12, 0.15);
            color: #FB923C;
            border: 1px solid rgba(234, 88, 12, 0.35);
            font-size: 11px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 4px 12px;
            border-radius: 999px;
          }

          /* Hero Info Box */
          .hero-box {
            background: linear-gradient(135deg, rgba(234, 88, 12, 0.08) 0%, rgba(15, 23, 42, 0.6) 100%);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 20px;
            padding: 32px;
            margin: 32px 0 24px 0;
          }
          .hero-title {
            font-size: 26px;
            font-weight: 800;
            color: #FFFFFF;
            margin-bottom: 8px;
          }
          .hero-desc {
            color: #94A3B8;
            font-size: 14px;
            max-width: 820px;
            margin-bottom: 20px;
          }
          .stats-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 16px;
          }
          .stat-pill {
            background: rgba(255, 255, 255, 0.04);
            border: 1px solid rgba(255, 255, 255, 0.08);
            padding: 10px 18px;
            border-radius: 12px;
            display: flex;
            flex-direction: column;
          }
          .stat-label {
            font-size: 11px;
            color: #64748B;
            text-transform: uppercase;
            font-weight: 700;
            letter-spacing: 0.5px;
          }
          .stat-value {
            font-size: 16px;
            font-weight: 800;
            color: #F1F5F9;
          }

          /* Filter and Search Bar */
          .controls {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 16px;
            flex-wrap: wrap;
            gap: 12px;
          }
          .search-input {
            background: #111827;
            border: 1px solid rgba(255, 255, 255, 0.12);
            color: #F8FAFC;
            padding: 10px 18px;
            border-radius: 12px;
            font-size: 13px;
            width: 320px;
            max-width: 100%;
            outline: none;
            transition: border-color 0.2s;
          }
          .search-input:focus {
            border-color: #EA580C;
          }
          .count-indicator {
            font-size: 13px;
            color: #94A3B8;
          }

          /* Data Table */
          .table-card {
            background: #0F172A;
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 10px 30px -10px rgba(0, 0, 0, 0.5);
          }
          table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
          }
          thead {
            background: #1E293B;
            border-bottom: 1px solid rgba(255, 255, 255, 0.08);
          }
          th {
            padding: 14px 20px;
            font-size: 11px;
            font-weight: 700;
            color: #94A3B8;
            text-transform: uppercase;
            letter-spacing: 0.8px;
          }
          tbody tr {
            border-bottom: 1px solid rgba(255, 255, 255, 0.04);
            transition: background 0.15s ease;
          }
          tbody tr:hover {
            background: rgba(234, 88, 12, 0.05);
          }
          tbody tr:last-child {
            border-bottom: none;
          }
          td {
            padding: 14px 20px;
            font-size: 13px;
            vertical-align: middle;
          }
          .row-index {
            color: #64748B;
            font-weight: 600;
            width: 50px;
          }
          .url-link {
            font-weight: 500;
            word-break: break-all;
          }
          .badge-priority {
            display: inline-block;
            padding: 2px 8px;
            border-radius: 6px;
            font-weight: 700;
            font-size: 11px;
          }
          .priority-high {
            background: rgba(34, 197, 94, 0.15);
            color: #4ADE80;
            border: 1px solid rgba(34, 197, 94, 0.3);
          }
          .priority-med {
            background: rgba(234, 88, 12, 0.15);
            color: #FB923C;
            border: 1px solid rgba(234, 88, 12, 0.3);
          }
          .priority-low {
            background: rgba(59, 130, 246, 0.15);
            color: #60A5FA;
            border: 1px solid rgba(59, 130, 246, 0.3);
          }
          .badge-freq {
            background: rgba(255, 255, 255, 0.06);
            color: #CBD5E1;
            padding: 3px 8px;
            border-radius: 6px;
            font-size: 11px;
            text-transform: uppercase;
            font-weight: 600;
          }
          .date-cell {
            color: #94A3B8;
            font-family: monospace;
            font-size: 12px;
            white-space: nowrap;
          }

          /* Footer */
          footer {
            margin-top: 48px;
            text-align: center;
            color: #64748B;
            font-size: 12px;
            border-top: 1px solid rgba(255, 255, 255, 0.06);
            padding-top: 24px;
          }
        </style>
        <script type="text/javascript">
          <![CDATA[
          function filterTable() {
            var input = document.getElementById("search-input");
            var filter = input.value.toLowerCase();
            var table = document.getElementById("sitemap-table");
            var trs = table.getElementsByTagName("tbody")[0].getElementsByTagName("tr");
            var visibleCount = 0;
            for (var i = 0; i < trs.length; i++) {
              var td = trs[i].getElementsByTagName("td")[1];
              if (td) {
                var txt = td.textContent || td.innerText;
                if (txt.toLowerCase().indexOf(filter) > -1) {
                  trs[i].style.display = "";
                  visibleCount++;
                } else {
                  trs[i].style.display = "none";
                }
              }
            }
            var countEl = document.getElementById("visible-count");
            if (countEl) countEl.innerText = visibleCount;
          }
          ]]>
        </script>
      </head>
      <body>
        <header>
          <div class="container header-inner">
            <div class="brand">
              <img src="/assets/images/logo-white.png" alt="Ruma Charcoal Logo" class="brand-logo" />
              <span class="brand-name">RUMA CHARCOAL<span class="brand-dot">.</span></span>
            </div>
            <div class="badge-sitemap">Official XML Sitemap</div>
          </div>
        </header>

        <div class="container">
          <xsl:apply-templates />
          
          <footer>
            <p>&#169; 2026 <strong>PT. Bumi Ruma Nusantara</strong> &#8226; Sukabumi, West Java, Indonesia. IMDG 42-24 &amp; EUDR Compliant.</p>
            <p style="margin-top: 4px;">Search engine crawlers (Googlebot, Bingbot, Yandex) parse the underlying XML standard nodes directly.</p>
          </footer>
        </div>
      </body>
    </html>
  </xsl:template>

  <!-- ========================================================
       TEMPLATE: SITEMAP INDEX (sitemap.xml)
       ======================================================== -->
  <xsl:template match="sitemap:sitemapindex">
    <div class="hero-box">
      <h1 class="hero-title">XML Sitemap Index Directory</h1>
      <p class="hero-desc">
        This XML Sitemap Index coordinates our global B2B charcoal export portal. It breaks down all 6,913 verified landing pages into organized, crawlable subsets for Google Search Console, Bing Webmaster Tools, and AI search engines.
      </p>
      <div class="stats-grid">
        <div class="stat-pill">
          <span class="stat-label">Sitemap Subsets</span>
          <span class="stat-value"><xsl:value-of select="count(sitemap:sitemap)" /> Subsets</span>
        </div>
        <div class="stat-pill">
          <span class="stat-label">Total Indexed Pages</span>
          <span class="stat-value">6,913 Pages</span>
        </div>
        <div class="stat-pill">
          <span class="stat-label">Global Coverage</span>
          <span class="stat-value">195 Countries</span>
        </div>
        <div class="stat-pill">
          <span class="stat-label">Primary Port</span>
          <span class="stat-value">Tanjung Priok (IDJKT)</span>
        </div>
      </div>
    </div>

    <div class="controls">
      <input type="text" id="search-input" class="search-input" placeholder="Filter sitemaps by keyword..." onkeyup="filterTable()" />
      <span class="count-indicator">Showing <strong id="visible-count"><xsl:value-of select="count(sitemap:sitemap)" /></strong> of <xsl:value-of select="count(sitemap:sitemap)" /> sitemaps</span>
    </div>

    <div class="table-card">
      <table id="sitemap-table">
        <thead>
          <tr>
            <th class="row-index">#</th>
            <th>Sitemap Sub-Directory URL</th>
            <th>Last Modified</th>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="sitemap:sitemap">
            <tr>
              <td class="row-index"><xsl:value-of select="position()" /></td>
              <td class="url-link">
                <a href="{sitemap:loc}"><xsl:value-of select="sitemap:loc" /></a>
              </td>
              <td class="date-cell"><xsl:value-of select="sitemap:lastmod" /></td>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
    </div>
  </xsl:template>

  <!-- ========================================================
       TEMPLATE: URLSET (Individual Sitemaps)
       ======================================================== -->
  <xsl:template match="sitemap:urlset">
    <div class="hero-box">
      <h1 class="hero-title">XML Page Sitemap</h1>
      <p class="hero-desc">
        Direct canonical URL entries for PT. Bumi Ruma Nusantara B2B charcoal export offerings, factory specifications, and regional shipping corridors.
      </p>
      <div class="stats-grid">
        <div class="stat-pill">
          <span class="stat-label">Total URLs</span>
          <span class="stat-value"><xsl:value-of select="count(sitemap:url)" /> URLs</span>
        </div>
        <div class="stat-pill">
          <span class="stat-label">Index Status</span>
          <span class="stat-value">index, follow</span>
        </div>
        <div class="stat-pill">
          <span class="stat-label">Parent Index</span>
          <span class="stat-value"><a href="/sitemap.xml" style="color: #FB923C;">sitemap.xml</a></span>
        </div>
      </div>
    </div>

    <div class="controls">
      <input type="text" id="search-input" class="search-input" placeholder="Search / filter URLs in this list..." onkeyup="filterTable()" />
      <span class="count-indicator">Showing <strong id="visible-count"><xsl:value-of select="count(sitemap:url)" /></strong> of <xsl:value-of select="count(sitemap:url)" /> URLs</span>
    </div>

    <div class="table-card">
      <table id="sitemap-table">
        <thead>
          <tr>
            <th class="row-index">#</th>
            <th>Canonical Page URL</th>
            <th>Priority</th>
            <th>Change Frequency</th>
            <th>Last Modified</th>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="sitemap:url">
            <tr>
              <td class="row-index"><xsl:value-of select="position()" /></td>
              <td class="url-link">
                <a href="{sitemap:loc}" target="_blank"><xsl:value-of select="sitemap:loc" /></a>
              </td>
              <td>
                <xsl:choose>
                  <xsl:when test="sitemap:priority &gt;= 0.9">
                    <span class="badge-priority priority-high"><xsl:value-of select="sitemap:priority" /></span>
                  </xsl:when>
                  <xsl:when test="sitemap:priority &gt;= 0.85">
                    <span class="badge-priority priority-med"><xsl:value-of select="sitemap:priority" /></span>
                  </xsl:when>
                  <xsl:otherwise>
                    <span class="badge-priority priority-low"><xsl:value-of select="sitemap:priority" /></span>
                  </xsl:otherwise>
                </xsl:choose>
              </td>
              <td>
                <span class="badge-freq"><xsl:value-of select="sitemap:changefreq" /></span>
              </td>
              <td class="date-cell"><xsl:value-of select="sitemap:lastmod" /></td>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
    </div>
  </xsl:template>

</xsl:stylesheet>
