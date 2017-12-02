<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="global.inc" -->
<%
	if siteId = "preop" Then
		titleText = "MedSelfEd Patient Education: PreOp.com Site Map"	
	elseif siteId = "postcare" Then
		titleText = "MedSelfEd Patient Education: PostCare.com Site Map"	
	else
		titleText = "MedSelfEd Patient Education: Site Map"	
	end if
%>

<!--#include file="chromehead.inc" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><%= titleText %></title>
<!--#include file="meta.inc" -->
<link href="<%= cssDir %>/keyframe.css" rel="stylesheet" type="text/css">
<link href="<%= cssDir %>/fonts.css" rel="stylesheet" type="text/css">
<link href="<%= cssDir %>/layout.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%= jsDir %>/common.js"></script>
<script type="text/javascript" src="<%= jsDir %>/MM_functions.js"></script>
</head>
<body>
<center>
<div class="topdiv">
<!--#include file="header.inc" -->
<!--#include file="help.inc" -->
<div class="lrlines">&nbsp;
<% if centerLink.length <> 0 and siteId = "preop" Then %>
	<table cellpadding="2" cellspacing="0" width="95%">
	<tr><td align="left" class="med">&nbsp;&nbsp;PreOp.com Surgery Centers</td></tr>
		<% for x = 1 to centerLink.length %>
			<% if centerLink.item(x-1).getAttribute("siteId") = "preop" Then %>
	<tr><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<a href="/asp/center.asp?centerId=<%= centerLink.item(x-1).getAttribute("centerId") %>&<%= navQueryString %>"><%=  centerLink.item(x-1).text %></a></td></tr>
			<% end if %>
		<% next %>
	</table><br>
<% end if %>
<% if prodLink.length <> 0 and siteId = "preop" Then %>
	<table cellpadding="2" cellspacing="0" width="95%">
	<tr><td align="left" class="med">&nbsp;&nbsp;PreOp.com Procedures</td></tr>	
		<% for x = 1 to prodLink.length %>
			<% if prodLink.item(x-1).getAttribute("siteId") = "preop" Then %>
	<tr><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<a href="/asp/prodDisplay.asp?prodId=<%= prodLink.item(x-1).getAttribute("prodId") %>&<%= navQueryString %>"><%=  prodLink.item(x-1).text %></a></td></tr>
			<% end if %>
		<% next %>
	</table><br>
<% end if %>
<% if centerLink.length <> 0 and postcare = "true" or siteId = "postcare" Then %>
	<table cellpadding="2" cellspacing="0" width="95%">
	<tr><td align="left" class="med">&nbsp;&nbsp;PostCare.com Task Centers</td></tr>
		<% for x = 1 to centerLink.length %>
			<% if centerLink.item(x-1).getAttribute("siteId") = "postcare" Then %>
	<tr><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<a href="/asp/center.asp?centerId=<%= centerLink.item(x-1).getAttribute("centerId") %>&<%= navQueryString %>"><%=  centerLink.item(x-1).text %></a></td></tr>
			<% end if %>
		<% next %>
	</table><br>
<% end if %>
<% if prodLink.length <> 0 and postcare = "true" or siteId = "postcare" Then %>
	<table cellpadding="2" cellspacing="0" width="95%">
	<tr><td align="left" class="med">&nbsp;&nbsp;PostCare.com Care Tasks</td></tr>	
		<% for x = 1 to prodLink.length %>
			<% if prodLink.item(x-1).getAttribute("siteId") = "postcare" Then %>
	<tr><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<a href="/asp/prodDisplay.asp?prodId=<%= prodLink.item(x-1).getAttribute("prodId") %>&<%= navQueryString %>"><%=  prodLink.item(x-1).text %></a></td></tr>
			<% end if %>
		<% next %>
	</table><br>
<% end if %>
</div>
<!--#include file="footer.inc" -->
</div>
</center>
<!--#include file="tracking.inc" -->
</body>
</html>
<!--#include file="chromefoot.inc" -->
