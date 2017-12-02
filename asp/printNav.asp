<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="global.inc" -->
<%

<!-- dynamically include xml files -->
fileName = "/xml/"& prodId &".xml"

<!-- using the MSXML Document object model  -->
set navDoc = Server.CreateObject("MSXML.DOMDocument") 

<!-- Do not validate against dtd file -->
navDoc.validateOnParse = false 
<!-- load the document in the MSXML document object -->
navDoc.load(Server.MapPath(fileName))

<!-- create all the main objects for the parser  -->
set navDocRoot = navDoc.documentElement
set navElement = navDocRoot.getElementsByTagName("navElement")
set topHtml = navDocRoot.getElementsByTagName("topHtml")
set midHtml = navDocRoot.getElementsByTagName("midHtml")
set botHtml = navDocRoot.getElementsByTagName("botHtml")
set procedureInfo = navDocRoot.getElementsByTagName("procedureInfo")

siteId = navDocRoot.selectSingleNode("siteId").text

<!-- General variables for navigation  -->
numSec = 1
thisSec = 0

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<!-- Page title xml include pageTitle -->
<title>Print this page</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="<%= cssDir %>/keyframe.css" rel="stylesheet" type="text/css">
<link href="<%= cssDir %>/fonts.css" rel="stylesheet" type="text/css">
<link href="<%= cssDir %>/layout.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%= jsDir %>/common.js"></script>
<script type="text/javascript" src="<%= jsDir %>/MM_functions.js"></script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name="printForm" target="mainFrame" action="/asp/prodPrint.asp">
<table border="0" width="100%" cellpadding="0" cellspacing="6">
<tr><td><img src="/image/000/grey_dot.gif" width="100%" height="1"></td></tr>
</table>
<table border="0" cellpadding="0" cellspacing="6" width="100%">
  <tr>
    <td align="left" valign="middle" width="33%" class="sml"><img src="../image/000/<% =siteId %>/logo.gif"></td>
    <td align="center" valign="middle" width="33%" class="sml">Jump to Section: <select name="secId" class="sml" onChange="document.forms['0'].submit()">
        <% for i = 1 to navElement.length %>
        <option value="<%= navElement.item(i-1).getAttribute("secId") %>"><%= navElement.item(i-1).text %></option>
        <% next %>
      </select></td>
	<td align="right" valign="middle" width="33%" class="sml"><a href="javascript:top.mainFrame.focus();top.mainFrame.print();">Print Now</a></td>
	<input type="hidden" name="prodId" value="<%= prodId %>">
	<input type="hidden" name="partnerId" value="<%= partnerId %>">
  </tr>
</table>
</form>
</body>
</html>