<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="global.inc" -->
<%
	' These NVP are for EHC Caching and Chrome Data
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

	if secId = "" Then
		secId = "2"
	end if

	
<!-- General variables for navigation  -->
numSec = 1
thisSec = 0

<!-- find this navigation element (review) -->
for i = 1 to navElement.length
	numSec = numSec + 1
	if navElement.item(i-1).getAttribute("secId") = secId Then
		thisSec = numSec
		prodName = navElement.item(i-1).text
	end if
next
showads = "false"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<!-- Page title xml include pageTitle -->
<title><%= pageTitle %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="<%= cssDir %>/keyframe.css" rel="stylesheet" type="text/css">
<link href="<%= cssDir %>/fonts.css" rel="stylesheet" type="text/css">
<link href="<%= cssDir %>/layout.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%= jsDir %>/common.js"></script>
<script type="text/javascript" src="<%= jsDir %>/MM_functions.js"></script>
</head>

<body onLoad="self.focus()">
<div align="center">
  <table bgcolor="#ffffff" width="100%" border="0" cellspacing="6" cellpadding="0">
    <tr> 
      <td colspan="3"> 
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
          <tr> 
            <td align="left" valign="top" width="126"><img src="../image/partner/partner_<%= partnerId %>_p.gif"></td>
            <td align="center" valign="middle" class="medgray"><br>
              <%= navDocRoot.selectSingleNode("pageHeader1").text %><br>
              <font class="smlmedgray"><%= navDocRoot.selectSingleNode("pageHeader2").text %></font><br>
              <font class="lrgred"><%= prodName %></font></td>
            <td align="right" width="107"><img src="../image/partner/partner_<%= siteId %>_p.gif"></td>
          </tr>
        </table>
        <hr>
      </table>
  <table bgcolor="#ffffff" width="100%" border="0" cellspacing="6" cellpadding="0">
    <% for x = 1 to topHtml.length 
	if topHtml.item(x-1).getAttribute("secId") = secId Then %> 
    <tr> 
      <td valign="top" colspan="2"><%= topHtml.item(x-1).text %></td>
    </tr>
    <%	end if
next %> <% for i = 1 to procedureInfo.length
	if procedureInfo.item(i-1).getAttribute("secId") = secId Then %> <% for x = 1 to midHtml.length
	if midHtml.item(x-1).getAttribute("secId") = procedureInfo.item(i-1).getAttribute("secId") Then
		if midHtml.item(x-1).getAttribute("spotId") = procedureInfo.item(i-1).getAttribute("spotId") Then %> 
    <tr> 
      <td valign="top" colspan="2"><%= midHtml.item(x-1).text %></td>
    </tr>
    <%		end if
	end if
next %> 
    <tr> 
      <td width="10%" valign="top"> <% if procedureInfo.item(i-1).getAttribute("image") <> "" Then %> 
        <a href="/asp/slidePrint.asp?prodId=<%= prodId %>&secId=<%= secId %>&spotId=<%= procedureInfo.item(i-1).getAttribute("spotId") %>"><img src="../image<%= procedureInfo.item(i-1).getAttribute("image") %>" alt="prodImage" align="middle" border="0"></a> 
        <% end if %> </td>
      <td width="90%" valign="middle"><%= procedureInfo.item(i-1).text %></td>
    </tr>
    <% end if
	next %> <% for w = 1 to botHtml.length
	if botHtml.item(w-1).getAttribute("secId") = secId Then %> 
    <tr> 
      <td colspan="2" valign="top"><%= botHtml.item(w-1).text %></td>
    </tr>

    <% end if
	next %> 
    <tr>
      <td colspan="2" valign="top">
        <div align="center"> 
          <table width="80%" border="0">
            <tr>
              <td>
                <div align="center">
                  <p class="smlred"><br>
                    This information is not intended to replace the advice of 
                    your doctor.<br>
                    MedSelfEd, Inc. disclaims any liability for the decisions 
                    you make based on this information.<br>
                    <img src="../image/000/<% =siteId %>/copyright.gif" height="32"></p>
                </div>
              </td>
            </tr>
          </table>
        </div>
      </td>
    </tr>
  </table>		
</div>
<!--#include file="tracking.inc" -->
</body>
</html>