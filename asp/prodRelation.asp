<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="global.inc" -->
<%
	' These NVP are for EHC Caching and Chrome Data
		cachedate = Request.QueryString("cachedate")
		id = Request.QueryString("id")
		prodId = Request.QueryString("prodId")
	
<!-- dynamically include xml files -->
fileName = "/xml/"& prodId &".xml"

<!-- using the MSXML Document object model  -->
set navDoc = Server.CreateObject("MSXML.DOMDocument") 

<!-- Do not validate against dtd file -->
navDoc.validateOnParse = false 
<!-- load the document in the MSXML document object -->
navDoc.load(Server.MapPath(fileName))

set navDocRoot = navDoc.documentElement
set prodRelation = navDocRoot.getElementsByTagName("prodRelation")
siteId = "postcare"

	if Session("sexId") <> "" Then
		sexId = Session("sexId")
	else 
		sexId = "shemale"
	end if
%>
<!--#include file="chromehead.inc" -->
<%
Session("prodName")= navDocRoot.selectSingleNode("pageHeader1").text & " " & navDocRoot.selectSingleNode("pageHeader2").text
headerImage = "relation"
	titleText = "PostCare&trade; tasks for " & navDocRoot.selectSingleNode("pageHeader1").text & " " & navDocRoot.selectSingleNode("pageHeader2").text	

%>
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
var postcareImage = new Array(); 
function getPostCareImg(){
	postcareImage[0] = new Image()
	postcareImage[0].src = '/image/000/postcare/goto_po_on.gif'
	postcareImage[1] = new Image()
	postcareImage[1].src = '/image/000/postcare/goto_po.gif'
}
getPostCareImg()

var prodRelation = new Array(); 
function getprodRelationImageObj(){
<% for i = 1 to prodRelation.length 
	if sexId = prodRelation.item(i - 1).getAttribute("sexId") or prodRelation.item(i - 1).getAttribute("sexId") = "shemale" Then
%>
	prodRelation[<%= (i - 1) %>] = new Image()
	prodRelation[<%= (i - 1) %>].src = '/image/<%= prodRelation.item(i - 1).getAttribute("prodId") %>/<%= prodRelation.item(i - 1).getAttribute("prodId") %>.gif'
<%
	end if
 next %>
}

function getNavImageObj(){
	genNavImageOn = new Image()
	genNavImageOn.src = '../image/000/dot3_r.gif'
}
getNavImageObj()
getprodRelationImageObj()
</script>
</head>
<body>
<center>
<div class="topdiv">
<!--#include file="header.inc" -->
<div class="lrlines">&nbsp;
	<table width="95%" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
		<tr><td colspan="2" align="left" valign="middle" class="medred"><br>&nbsp; &nbsp; Roll-over links and click to go to a care task.</td></tr>
        <tr><td align="left" valign="middle" width="60%"> 
		<table bgcolor="#ffffff" border="0" cellspacing="0" cellpadding="5">
			<% for i = 1 to prodRelation.length
				if sexId = prodRelation.item(i - 1).getAttribute("sexId") or prodRelation.item(i - 1).getAttribute("sexId") = "shemale" Then
			 %>
                  <tr> 
                    <td valign="middle"><img src="../image/000/dot3.gif" border="0" name="prodDot<%= i - 1 %>"> 
                    </td>
                    <td valign="middle"><a href="/asp/prodDisplay.asp?prodId=<%= prodRelation.item(i - 1).getAttribute("prodId") %>&secId=2&relProdId=<%= prodId %>&<%= navQueryString %>" class="altviolet2" onMouseOut="restoreImage(document.images['prodDot<%= i - 1 %>'])" onMouseOver="swapImage(document.images['prodImage'],prodRelation[<%= (i - 1) %>]); swapImage(document.images['prodDot<%= i - 1 %>'],genNavImageOn);"><%= prodRelation.item(i-1).text %></a> </td>
                  </tr>
			<% 
				end if
			next %>
		</table>
        </td>
          <td align="center" valign="middle"> <!-- get first image and procedure center !--> 
            <image name="prodImage" src="../image/<%= prodRelation.item(0).getAttribute("prodId") %>/<%= prodRelation.item(0).getAttribute("prodId") %>.gif"> 
            <br>
            <br><a href="/asp/prodDisplay.asp?prodId=<%= prodId %>&<%= navQueryString %>" onMouseOut="swapImage(document.images['gotopreop'],postcareImage[1])" onMouseOver="swapImage(document.images['gotopreop'],postcareImage[0])"><img src="/image/000/postcare/goto_po.gif" border="0" name="gotopreop"></a>
					</td>
		</tr>
	</table><br>
</div>
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