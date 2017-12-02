
<script language="JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
<div class="lrtlines" align="center"> 
  <div class="bottomCopy" align="center"> <% if prodId <> "" Then %> 
    <table cellspacing="5" cellpadding="0" border="0">
      <tr> 
        <td align="center"><a href="javascript:;" onClick="MM_openBrWindow('<%= baseHref %>/asp/printFrame.asp?prodId=<%= prodId %>&secId=<%= secId %>&spotId=<%= spotId %>&partnerId=<%= partnerId %>','printPage','width=600,height=500')" class="smlred">Print 
          Page</a></td>
      </tr>
    </table>
    <% end if %> 
    <table cellspacing="5" cellpadding="0" border="0">
      <tr> 
        <td align="center" class="sml"> 
          <p>NOTE: By viewing this site you have read and agreed to the <a href="<%= baseHref %>/asp/<% =siteId %>/disclaimer.asp?siteId=<%= siteId %>&<%= navQueryString %>">DISCLAIMER<br>
            </a> - See <a href="<%= baseHref %>/asp/<% =siteId %>/legal.asp?siteId=<%= siteId %>&<%= navQueryString %>">legal</a> or <a href="<%= baseHref %>/asp/privacy.asp?siteId=<%= siteId %>&<%= navQueryString %>">privacy</a> 
            section for your security and rights information -<br>
            <img src="<%= baseHref %>/image/000/<%= siteId %>/copyright.gif"> </p>
        </td>
      </tr>
    </table>
  </div>
</div>
<div align="center"><img src="<%= baseHref %>/image/000/bottom_cap2.gif" class="bottomCap" alt="" width="32" height="32"></div>
<!-- test -->