<!-- Start of the header File include //-->
<% if navlink.length <> 0 and hideNav <> "true" then %>


<script>
<!--

var navDropAry = new Array(); 

function navDropObj(name){
	this.name = name
}

<% for i = 1 to navlink.length %>
		navDropAry[<%= i - 1 %>] = new navDropObj('<%= navlink.item(i - 1).getAttribute("navlinkId") %>Drop')
<% next %>

function showDrop(navObj){
	for(var x = 0; x != navDropAry.length; x++){
		if (navObj == navDropAry[x].name){
			show(navDropAry[x].name)
		} else (
			hide(navDropAry[x].name)
		)
	}
}

//-->
</script>
<%if partnerid = "glh" then %>
<table cellpadding="0" cellspacing="0" border="0" width="100%"><tr><td align="left" width="602"><img src="../image/000/glh-banner.gif" alt=""></td></tr></table>
<% end if %>
<%
	if centerId <> "" Then 
		for i = 1 to centerLink.length
			if centerLink.item(i - 1).getAttribute("centerId") = centerId Then
				centerHeader = centerLink.item(i - 1).text
				headerType = "true"
			end if 
		next
%>

<table cellpadding="0" cellspacing="0" border="0" width="100%"><tr><td align="left" width="126"><img src="../image/partner/partner_<%= partnerId %>.gif" alt=""></td><td align="center" valign="middle" class="headshim"><%= centerHeader %><br><font class="smlgray"><%= formatdatetime((now),vblongdate) %></font></td><td align="right" width="107"><img src="../image/000/<%= siteId %>/powered.gif" class="homeHead" alt="" border="0"></td></tr></table>
<% 
	elseif headerType = "true" Then 
%>
<table cellpadding="0" cellspacing="0" border="0" width="100%"><tr><td align="left" width="126"><img src="../image/partner/partner_<%= partnerId %>.gif" alt=""></td><td align="center" valign="middle" class="headshim"><%= pageTitle %><br><font class="smlgray"><%= formatdatetime((now),vblongdate) %></font></td><td align="right" width="107"><img src="../image/000/<%= siteId %>/powered.gif" class="homeHead" alt="" border="0"></td></tr></table>
<% 
	elseif headerType = "relation" Then 
%>
	<table cellpadding="0" cellspacing="0" border="0" width="100%"><tr><td align="left" width="126"><img src="../image/partner/partner_<%= partnerId %>.gif" alt=""></td><td align="center" valign="middle" class="headshim">
      <p><font class="smlgray">PostCare&trade; Tasks for<br>
        </font><font class="medviolet"> <%= Session("prodName") %></font><br>
        <font class="smlgray"><%= formatdatetime((now),vblongdate) %></font></p>
      </td><td align="right" width="107"><img src="../image/000/<%= siteId %>/powered.gif" class="homeHead" alt="" border="0"></td></tr></table>
<% 
	end if 
%>
<div align="left" class="divContHeader">
	<div class="backImg">
<% if headerType = "false" Then %>
		<img src="../image/000/nav_bar2.gif" class="navBar">
<% else %>
		<img src="../image/000/nav_bar.gif" class="navBar">
<% end if  %>
	</div>
	<div class="divContNav">
	<table border="0" cellspacing="0" cellpadding="0" width="100%"><tr>
<% 
	cellWidth = int(100 / navlink.length)
for i = 1 to navlink.length %>
	<td width="<%= cellWidth %>%" align="center"  valign="top">
	<div id="<%= navlink.item(i - 1).getAttribute("navlinkId") %>Head" class="navHeader"><a href="<%= navlink.item(i - 1).getAttribute("url") %>&<%= navQueryString %>" class="NavHead" onMouseOver="showDrop('<%= navlink.item(i - 1).getAttribute("navlinkId") %>Drop')"><%= navlink.item(i - 1).text %></a></div>
	<div id="<%= navlink.item(i - 1).getAttribute("navlinkId") %>Drop" class="navDrop" onMouseOver="showDrop('<%= navlink.item(i - 1).getAttribute("navlinkId") %>Drop')" onMouseOut="showDrop('none')">
	<table cellpadding="2" cellspacing="0" class="lrblines">
<% for e = 1 to navdrop.length %>
	<% if navlink.item(i - 1).getAttribute("navlinkId") = navdrop.item(e - 1).getAttribute("navlinkId") Then %>
	<tr><td><a href="<%= navdrop.item(e - 1).getAttribute("url") %>&<%= navQueryString %>" class="navLink"><%= navdrop.item(e - 1).text %></a></td></tr>
	<% end if %>
<% next %>
</table>
	</div>
</td>
<% next %>		
	</tr></table>
</div>
<br>
<% else %>
<img src="../image/000/top_cap2.gif" class="topCap">
<% end if %>
<!-- End of the header File include //-->