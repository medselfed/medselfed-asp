<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="global.inc" -->
<!--#include file="chromehead.inc" -->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><%= pageTitle %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="<%= cssDir %>/keyframe.css" rel="stylesheet" type="text/css">
<link href="<%= cssDir %>/fonts.css" rel="stylesheet" type="text/css">
<link href="<%= cssDir %>/layout.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%= jsDir %>/common.js"></script>
<script type="text/javascript" src="<%= jsDir %>/MM_functions.js"></script>
</head>
<% headerImage = "true" 
	siteId = "postcare"
%>
<body>
<center>
<div class="topdiv">
<!--#include file="header.inc" -->
<div class="lrlines">&nbsp;<br>
<br>
<font class="medred">Surgery Centers</font>
	<table cellpadding="0" cellspacing="3" border="1" width="95%">
		<% for x = 1 to centerLink.length %>
		<% if centerLink.item(x-1).getAttribute("siteId") = siteId then %>
	<tr><td align="left" valign="top"><a href="/asp/center.asp?centerId=<%= centerLink.item(x-1).getAttribute("centerId") %>&<%= navQueryString %>"><%=  centerLink.item(x-1).text %></a></td><td width="40%">http://<%= subDomain %>.medselfed.com/asp/center.asp?centerId=<%= centerLink.item(x-1).getAttribute("centerId") %><br></td></tr>
		<% end if %>	
		<% next %>
	</table><br>
<font class="medred">Procedure Display</font>
	<table cellpadding="0" cellspacing="3" border="1" width="95%">
		<% for x = 1 to prodLink.length %>
		<% if prodLink.item(x-1).getAttribute("siteId") = siteId then %>
	<tr><td align="left" valign="top"><a href="/asp/prodDisplay.asp?prodId=<%= prodLink.item(x-1).getAttribute("prodId") %>&secId=2&<%= navQueryString %>"><%=  prodLink.item(x-1).text %></a></td><td width="40%">http://<%= subDomain %>.medselfed.com/asp/prodDisplay.asp?prodId=<%= prodLink.item(x-1).getAttribute("prodId") %><br></td></tr>
		<% end if %>
		<% next %>
	</table><br><a href="webmasters.asp">Back to Guide</a><br><br>
</div>
<!--#include file="footer.inc" -->
</div>
</center>
</body>
</html>
<!--#include file="chromefoot.inc" -->
<%
Session("homelink") = "/asp/preop.asp"
%>
