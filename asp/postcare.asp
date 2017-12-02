<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="domain.inc" -->
<%
	' These NVP are for EHC Caching and Chrome Data
		cachedate = Request.QueryString("cachedate")
		id = Request.QueryString("id")
	
	<!-- dynamically include xml files -->
	fileName = "/xml/postcare.xml"

	<!-- using the MSXML Document object model  -->
	set navDoc = Server.CreateObject("MSXML.DOMDocument") 

	<!-- Do not validate against dtd file -->
	navDoc.validateOnParse = false 
	<!-- load the document in the MSXML document object -->
	navDoc.load(Server.MapPath(fileName))

	<!-- create all the main objects for the parser  -->
	set navDocRoot = navDoc.documentElement
	set homeElement = navDocRoot.getElementsByTagName("homeLink")
	set centerElement = navDocRoot.getElementsByTagName("centerLink")
	set prodElement = navDocRoot.getElementsByTagName("prodLink")
	siteId = "postcare"
	
		Session.Contents.RemoveAll()		
		Session("siteId") = siteId
		Session("homelink") = "/asp/postcare.asp"
		
%>
<!--#include file="chromehead.inc" -->
<!--#include file="partners.inc" -->
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
<body>
<center>
<div class="topdiv">
<!--#include file="header.inc" -->
<div class="lrlines">&nbsp;
	<table cellpadding="0" cellspacing="0" width="95%">
		<% for x = 1 to homeElement.length %>
	<tr><td align="left"><a href="/asp/postcare.asp?<%= ehcQueryString %>"><%=  homeElement.item(x-1).text %></a></td></tr>
		<% next %>
	</table><br>
	<table cellpadding="0" cellspacing="0" width="95%">
		<% for x = 1 to centerElement.length %>
	<tr><td align="left"><a href="/asp/center.asp?centerId=<%= centerElement.item(x-1).getAttribute("centerId") %>&<%= ehcQueryString %>"><%=  centerElement.item(x-1).text %></a></td></tr>
		<% next %>
	</table><br>
	<table cellpadding="0" cellspacing="0" width="95%">
		<% for x = 1 to prodElement.length %>
	<tr><td align="left"><a href="/asp/prodDisplay.asp?prodId=<%= prodElement.item(x-1).getAttribute("prodId") %>&secId=2&<%= ehcQueryString %>"><%=  prodElement.item(x-1).text %></a></td></tr>
		<% next %>
	</table><br><br>
</div>
<!--#include file="footer.inc" -->
</div>
</center>
</body>
</html>
<!--#include file="chromefoot.inc" -->

