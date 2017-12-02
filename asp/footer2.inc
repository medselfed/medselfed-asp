
<script language="JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
<div class="lrlines" >
<table width="95%" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="40%" >&nbsp;</td>
			<td width="60%" >
	<div align="center">
		<table cellspacing="0" cellpadding="0" border="0" width="280">
		<tr>
		<% if prodId <> "" Then %>
		<td align="center"><a href="javascript:;" onClick="MM_openBrWindow('/asp/printFrame.asp?prodId=<%= prodId %>&secId=<%= secId %>&spotId=<%= spotId %>&partnerId=<%= partnerId %>','printPage','width=600,height=500')" class="smlred">Print </a></td>
		<td align="center"><font class="smlred">&nbsp;|&nbsp;</font></td>
		<% end if %>
		<td align="center"> <a href="/asp/<% =siteId %>/disclaimer.asp?siteId=<% =siteId %>&<%= navQueryString %>" class="smlred">Disclaimer</a></td>
		<td align="center"><font class="smlred">&nbsp;|&nbsp;</font></td>
		<td align="center">  <a href="/asp/<% =siteId %>/legal.asp?siteId=<% =siteId %>&<%= navQueryString %>" class="smlred">Legal</a></td>
		<td align="center"><font class="smlred">&nbsp;|&nbsp;</font></td>
		<td align="center">  <a href="/asp/privacy.asp?siteId=<% =siteId %>&<%= navQueryString %>" class="smlred">Privacy</a></td>		
		
		</tr>
		<tr></table><center>
		<img src="../image/000/<%= siteId %>/copyright.gif" border="0">
		</center>
		
	</td></tr></table>
</div>
<img src="../image/000/bottom_cap2.gif" class="bottomCap" alt="" width="32" height="32">