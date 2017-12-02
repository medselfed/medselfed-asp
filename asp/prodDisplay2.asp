<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="global.inc" -->
<%
		if secId = "" Then
			secId = "2"
		end if
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
set videoImage = navDocRoot.getElementsByTagName("videoImage")
set audioImage = navDocRoot.getElementsByTagName("audioImage")
set procedureInfo = navDocRoot.getElementsByTagName("procedureInfo")
set prodRelation = navDocRoot.getElementsByTagName("prodRelation")

	siteId = navDocRoot.selectSingleNode("siteId").text
	phdivision = navDocRoot.selectSingleNode("phdivision").text

	Session("siteId") = siteId
	thisSec = secId
	firstSec = "2"
	for i = 1 to navElement.length
		if navElement.item(i-1).getAttribute("secId") = secId Then
			prodName = navElement.item(i-1).text
		end if
		lastSec = navElement.item(i-1).getAttribute("secId")
	next
	if siteId = "preop" Then
		relProdId = ""
	end if
	
	titleText = navDocRoot.selectSingleNode("pageHeader1").text & " " & navDocRoot.selectSingleNode("pageHeader2").text & " - " & prodName & " - MedSelfEd Patient Education Videos and Pictures"	
	
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
<script type="text/javascript">
var postcareImage = new Array(); 
function getPostCareImg(){
	postcareImage[0] = new Image()
	postcareImage[0].src = '/image/000/preop/goto_pc_on.gif'
	postcareImage[1] = new Image()
	postcareImage[1].src = '/image/000/preop/goto_pc.gif'
}
getImageObj()
getPostCareImg()
</script>

</head>
<body style="margin: 0px; padding: 0px;" >
<a name="top"></a> 
<center>
<div class="topdiv">
<!--#include file="header.inc" -->
<!--#include file="help.inc" -->
<div class="lrlines">
<%
navQueryString = navQueryString + centerQueryString
%>
<!--#include file="prodLayout3.inc" -->
<!--#include file="questions.inc" -->
</div>
<!--#include file="footer.inc" -->
</div>
</div>

<div class="topdiv" style="visibility:hidden; height:0px; overflow:hidden">
<img src="../image/000/top_cap2.gif" class="topCap" alt=""><div class="lrlines">
<table bgcolor="#ffffff" width="95%" border="0" cellspacing="0" cellpadding="5" align="center">
<tr>
<td valign="top" colspan="3" style="font-size:9px; color:#999999; text-align:justify">
<strong>Keyword Info:</strong><br>
<%= divText %>
 </td>
      </tr>
    </table>
  </div>
</div>
<div align="center" style="visibility:hidden"><img src="/image/000/bottom_cap2.gif" class="bottomCap" alt="" width="32" height="32"></div>
</center>
<!--#include file="tracking.inc" -->
</body>
</html>
<!--#include file="chromefoot.inc" -->
