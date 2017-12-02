<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="global.inc" -->
<%
	if subDomain = "postcare" Then
		Response.Redirect("/asp/sitemap.asp?siteId=postcare")
	end if
		
	' This NVP is used to determine the siteId 
	siteId  = "preop"
	
	titleText = "MedSelfEd Patient Education Order Form"
	pageTitle = "Order Form"
%>
<!--#include file="chromehead.inc" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><%= titleText %></title>
<!--#include file="meta.inc" -->
<link href="<%= baseHref %><%= cssDir %>/keyframe.css" rel="stylesheet" type="text/css">
<link href="<%= baseHref %><%= cssDir %>/fonts.css" rel="stylesheet" type="text/css">
<link href="<%= baseHref %><%= cssDir %>/layout.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%= baseHref %><%= jsDir %>/common.js"></script>
<script type="text/javascript" src="<%= baseHref %><%= jsDir %>/MM_functions.js"></script>
<% headerType = "true" %>
</head>
<body>
<center>
<div class="topdiv">
<!--#include file="header.inc" -->
<!--#include file="help.inc" -->
</div>
<div class="lrlines">&nbsp;
<table width="100%" border="0" cellpadding="5" cellspacing="0" style="padding-left:10px">
<tr>
	<td colspan="4" class="lrggray">Place Your Order</td>
</tr>
<tr>
	<td colspan="4">Required fields are indicated with a red asterisk (<span class="lrgred">*</span>).</td>
</tr>
<tr>
	<td colspan="4" class="medred">Name</td>
</tr>
<tr>
	<td width="100" align="right">Title:</td>
	<td width="250" align="left">
		<input type="text" width="300" size="50" style="font-family:Arial, Helvetica, sans-serif;" name="textfield" />
    </td>
	<td width="150">&nbsp;</td>
</tr>
</table>
</div>
<div class="topdiv">
<!--#include file="footer.inc" -->
</div>
</center>
<!--#include file="tracking.inc" -->
</body>
</html>
<!--#include file="chromefoot.inc" -->