<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
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
%>
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

function showvideo(prodId){
	document.getElementById('videoFrame').src = "/asp/videoFile.asp?prodId=" + prodId;

	document.getElementById('prodImageDiv').style.visibility = "hidden";
	document.getElementById('prodListDiv').style.visibility = "hidden";
	document.getElementById('prodTextDiv').style.visibility = "hidden";


	document.getElementById('prodTextDivOn').style.visibility = "visible";
	document.getElementById('prodListDivOn').style.visibility = "visible";

	document.getElementById('prodVideoDiv').style.visibility = "visible";

}

function hidevideo(){
	document.getElementById('videoFrame').src = "/asp/videoBlank.asp";

	document.getElementById('prodImageDiv').style.visibility = "visible";
	document.getElementById('prodListDiv').style.visibility = "visible";
	document.getElementById('prodTextDiv').style.visibility = "visible";


	document.getElementById('prodTextDivOn').style.visibility = "hidden";
	document.getElementById('prodListDivOn').style.visibility = "hidden";

	document.getElementById('prodVideoDiv').style.visibility = "hidden";
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
		<tr><td colspan="2" align="left" valign="middle" >
		<div id="prodTextDiv" class="medred" style="position:absolute; top:10px; visibility:visible">
			<br>&nbsp; &nbsp; Roll-over links and click to watch full video.
		</div>
		<div id="prodTextDivOn" class="medred" style="position:absolute; top:10px; visibility:hidden">
			<br>&nbsp; &nbsp; Click close to return to procedure list.
		</div>
		</td></tr>
        <tr><td align="left" valign="middle"> 
		<div id="prodListDiv" style="position:absolute; top:40px; visibility:visible">
		<table bgcolor="#ffffff" border="0" cellspacing="0" cellpadding="5">
			<% for i = 1 to centerElement.length %>
                  <tr> 
                    <td valign="middle"><img src="../image/000/dot3.gif" height="12" width="20" border="0" name="prodDot<%= i - 1 %>"> 
                    </td>
                    <td valign="middle"><a href="javascript:;" onclick="showvideo('<%= centerElement.item(i - 1).getAttribute("prodId") %>')" onMouseOut="restoreImage(document.images['prodDot<%= i - 1 %>'])" onMouseOver="swapImage(document.images['prodImage'],centerImage[<%= (i - 1) %>]); swapImage(document.images['prodDot<%= i - 1 %>'],genNavImageOn);"><%= centerElement.item(i-1).text %></a> </td>
                  </tr>
			<% next %>
		</table>
		</div>
		<div id="prodListDivOn" style="position:absolute; top:110px; left:100px; visibility:hidden">
			<a href="javascript:;" onClick="hidevideo()"> Close </close>
		</div>
        </td><td align="right" valign="middle" height="260"> 
                    <!-- get first image and procedure center !-->
                    <div id="prodImageDiv" style="position:relative; top:0px; width:320px; visibility:visible">
			<image name="prodImage" src="<%= navDocRoot.selectSingleNode("startImage").getAttribute("src") %>">
		    </div>
                    <div id="prodVideoDiv" style="position:absolute; top:30px; left:260px; width:320px; align:right; visibility:hidden">
			<iframe frameborder="0" id="videoFrame" src="/asp/videoblank.asp" height="280" width="330"></iframe>
		    </div>
		</td>
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

