<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="global.inc" -->
<%
	<!-- dynamically include xml files -->
	fileName = "/xml/center/"& centerId &".xml"

	<!-- using the MSXML Document object model  -->
	set navDoc = Server.CreateObject("Microsoft.XMLDOM") 
	navDoc.validateOnParse = false 
	navDoc.load(Server.MapPath(fileName))
	' begin to read XML file
	set navDocRoot = navDoc.documentElement
	set centerElement = navDocRoot.getElementsByTagName("centerElement")
	siteId = navDocRoot.selectSingleNode("siteId").text
	
	titleText = "MedSelfEd Patient Education: PreOp.com Home Page"
	
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
<script type="text/javascript" >
// load images for procedure rollovers
var centerImage = new Array(); 
function getCenterImageObj(){
<% for i = 1 to centerElement.length %>
	centerImage[<%= (i - 1) %>] = new Image()
	centerImage[<%= (i - 1) %>].src = '<%= centerElement.item(i - 1).getAttribute("prodImage") %>'
<% next %>
}

function getNavImageObj(){
	genNavImageOn = new Image()
	genNavImageOn.src = imageUrl + '/000/dot3_r.gif'
}
getNavImageObj()
getCenterImageObj()
</script>
</head>
<body>
<center>
<div class="topdiv">
<!--#include file="header.inc" -->
<!--#include file="help.inc" -->
<div class="lrlines">&nbsp;
	<table width="95%" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
		<tr><td colspan="2" align="left" valign="middle" class="medred"><br>&nbsp; &nbsp; Roll-over links and click to go to a procedure.</td></tr>
        <tr><td align="left" valign="middle"> 
		<table bgcolor="#ffffff" border="0" cellspacing="0" cellpadding="5">
			<% for i = 1 to centerElement.length %>
                  <tr> 
                    <td valign="middle"><img src="../image/000/dot3.gif" height="12" width="20" border="0" name="prodDot<%= i - 1 %>"> 
                    </td>
                    <td valign="middle"><a href="/asp/prodDisplay.asp?prodName=<%= centerElement.item(i-1).text %>&prodId=<%= centerElement.item(i - 1).getAttribute("prodId") %>&centerId=<%= centerId %>&<%= navQueryString %>" class="altviolet2" onMouseOut="restoreImage(document.images['prodDot<%= i - 1 %>'])" onMouseOver="swapImage(document.images['prodImage'],centerImage[<%= (i - 1) %>]); swapImage(document.images['prodDot<%= i - 1 %>'],genNavImageOn);"><%= centerElement.item(i-1).text %></a> </td>
                  </tr>
			<% next %>
		</table>
        </td><td align="right" valign="middle"> 
                    <!-- get first image and procedure center !-->
                    <image name="prodImage" src="<%= navDocRoot.selectSingleNode("startImage").getAttribute("src") %>"></td>
		</tr>
	</table><br>
</div>

<script language="JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
<div class="lrtlines" >
<table width="95%" border="0" cellpadding="5" cellspacing="0">
          <tr> 
			<td align="center">
		<table cellspacing="0" cellpadding="0" border="0">
		<tr>
		<td align="center"> <a href="/asp/<% =siteId %>/disclaimer.asp?<%= navQueryString %>" class="smlred">Disclaimer</a></td>
		<td align="center"><font class="smlred">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</font></td>
		<td align="center">  <a href="/asp/<% =siteId %>/legal.asp?<%= navQueryString %>" class="smlred">Legal</a></td>
		</tr>
		<tr></table><center>
		<img src="../image/000/<%= siteId %>/copyright.gif" border="0">
		</center>
	</td></tr></table>
</div>
<img src="../image/000/bottom_cap2.gif" class="bottomCap" alt="" width="32" height="32">
</div>
</center>
<!--#include file="tracking.inc" -->
</body>
</html>
<!--#include file="chromefoot.inc" -->
<% 
	Session("homelink") = "/asp/center.asp?centerId=" & centerId
%>

