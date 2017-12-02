<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="global.inc" -->
<%
	if sexId = "shemale" or sexId = "male" Then
		sex = "m"
	else
		sex = "f"
	end if
		Session("sexId") = sexId

fileName = "/xml/center/body.xml"

<!-- using the MSXML Document object model  -->
set navDoc = Server.CreateObject("MSXML.DOMDocument") 

<!-- Do not validate against dtd file -->
navDoc.validateOnParse = false 
<!-- load the document in the MSXML document object -->
navDoc.load(Server.MapPath(fileName))

<!-- create all the main objects for the parser  -->
set navDocRoot = navDoc.documentElement
set genElement = navDocRoot.getElementsByTagName("genElement")
set bodyElement = navDocRoot.getElementsByTagName("bodyElement")
siteId = navDocRoot.selectSingleNode("siteId").text

%>
<!--#include file="chromehead.inc" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><%= pageTitle %></title>
<!--#include file="meta.inc" -->

<link href="<%= cssDir %>/keyframe.css" rel="stylesheet" type="text/css">
<link href="<%= cssDir %>/fonts.css" rel="stylesheet" type="text/css">
<link href="<%= cssDir %>/layout.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%= jsDir %>/common.js"></script>
<script type="text/javascript" src="<%= jsDir %>/MM_functions.js"></script>
<script language="JavaScript"><!--
function getBodyImageObj(){
	headImgOrg = '/image/body/head_<%= sex %>.gif'
	chestImgOrg = '/image/body/chest_<%= sex %>.gif'
	midbodyImgOrg = '/image/body/midbody_<%= sex %>.gif'
	legImgOrg = '/image/body/leg_<%= sex %>.gif'

	navigationImage[0] = new Image()
	navigationImage[0].src = '/image/body/headon_<%= sex %>.gif'

	navigationImage[1] = new Image()
	navigationImage[1].src = '/image/body/cheston_<%= sex %>.gif'
	
	navigationImage[2] = new Image()
	navigationImage[2].src = '/image/body/cheston2_<%= sex %>.gif'	
	
	navigationImage[3] = new Image()
	navigationImage[3].src = '/image/body/midbodyon_<%= sex %>.gif'
	
	navigationImage[4] = new Image()
	navigationImage[4].src = '/image/body/midbodyon2_<%= sex %>.gif'	
	
	navigationImage[5] = new Image()
	navigationImage[5].src = '/image/body/legon_<%= sex %>.gif'
	
	navigationImage[6] = new Image()
	navigationImage[6].src = '/image/body/midbodyon3_<%= sex %>.gif'
}
var genNavImage = new Array(); 
function getNavImageObj(){
	genNavImage[0] = new Image()
	genNavImage[0].src = '/image/336/336_s.gif'
	
	genNavImage[1] = new Image()
	genNavImage[1].src = '/image/337/337_s.gif'
	
	genNavImage[2] = new Image()
	genNavImage[2].src = '/image/338/338_s.gif'
	
	genNavImage[3] = new Image()
	genNavImage[3].src = '/image/000/dot3_r.gif'
	
	genNavImage[4] = new Image()
	genNavImage[4].src = '/image/000/dot3.gif'	
}
getBodyImageObj()
getNavImageObj()
//--></script>
</head>
<body onload="P7_ExpMenu()">
<center>
<div class="topdiv">
<!--#include file="header.inc" -->
<!--#include file="help.inc" -->
<div class="lrlines">&nbsp;
<table width="99%" border="0" cellspacing="10" cellpadding="0"> 
<tr>
          <td align="center"><font class="smlred2">Please rollover the body.</font><br>
<img width="147" height="72" src="../image/body/head_<%= sex %>.gif" border="0" name="headImg" onMouseOver="swapBodyHead(); show('head'); hide('breast'); hide('abs');  hide('leg'); hide('welcome');"><br> 
<img width="147" height="50" src="../image/body/chest_<%= sex %>.gif" border="0" name="chestImg" onMouseOver="swapBodyChest(); show('breast'); hide('head'); hide('abs');  hide('leg'); hide('welcome');"><br> 
<img width="147" height="100" src="../image/body/midbody_<%= sex %>.gif" border="0" name="midbodyImg" onMouseOver="swapBodyMid(); show('abs'); hide('head'); hide('breast'); hide('leg'); hide('welcome');"><br> 
<img width="147" height="140" src="../image/body/leg_<%= sex %>.gif" border="0" name="legImg" onMouseOver="swapBodyLeg(); show('leg'); hide('head'); hide('breast'); hide('abs'); hide('welcome');"><br>
          </td>
          <td width="253" valign="top">
<div class="divContBody"> 
              <div id="welcome" class="bodyDivWelcome"> 
                <img src="../image/body/txt_welcome_<%= sex %>.gif" border="0"> </div>
              <div id="head" class="bodyDivHead"> 
                <table cellpadding="2" cellspacing="0" border="0">
                  <% for i = 1 to bodyElement.length 
	if sexId = bodyElement.item(i-1).getAttribute("sexId") or bodyElement.item(i-1).getAttribute("sexId") = "shemale" Then
		if bodyElement.item(i-1).getAttribute("region") = "head" Then
%>
                  <tr> 
                    <td valign="top"> <img src="../image/000/dot3.gif" height="12" width="20" border="0" name="prodDot<%= i - 1 %>"> 
                    </td>
                    <td valign="top"> <a href="/asp/prodDisplay.asp?prodName=<%= bodyElement.item(i-1).getAttribute("prodName1") %><%= bodyElement.item(i-1).getAttribute("prodName2") %>&prodId=<%= bodyElement.item(i - 1).getAttribute("prodId") %>&<%= navQueryString %>" class="altviolet2" onMouseOut="restoreImage(document.images['prodDot<%= i - 1 %>'])" onMouseOver="swapImage(document.images['prodDot<%= i - 1 %>'],genNavImage[3]);"><%= bodyElement.item(i-1).getAttribute("prodName1") %><%= bodyElement.item(i-1).getAttribute("prodName2") %></a> </td>
                  </tr>
                  <% 
		end if
	end if
next %>
                </table>
              </div>
              <div id="breast" class="bodyDivBreast"> 
                <table cellpadding="2" cellspacing="0" border="0">
                  <% for i = 1 to bodyElement.length 
	if sexId = bodyElement.item(i-1).getAttribute("sexId") or bodyElement.item(i-1).getAttribute("sexId") = "shemale" Then
		if bodyElement.item(i-1).getAttribute("region") = "breast" Then
%>
                  <tr> 
                    <td valign="top"> <img src="../image/000/dot3.gif" height="12" width="20" border="0" name="prodDot<%= i - 1 %>"> 
                    </td>
                    <td valign="top"> <a href="/asp/prodDisplay.asp?prodName=<%= bodyElement.item(i-1).getAttribute("prodName1") %><%= bodyElement.item(i-1).getAttribute("prodName2") %>&prodId=<%= bodyElement.item(i - 1).getAttribute("prodId") %>&<%= navQueryString %>" class="altviolet2" onMouseOut="restoreImage(document.images['prodDot<%= i - 1 %>'])" onMouseOver="swapImage(document.images['prodDot<%= i - 1 %>'],genNavImage[3]);"><%= bodyElement.item(i-1).getAttribute("prodName1") %><%= bodyElement.item(i-1).getAttribute("prodName2") %></a> </td>
                  </tr>
                  <% 
		end if
	end if
next %>
                </table>
              </div>
              <div id="abs" class="bodyDivAbs"> 
                <table cellpadding="2" cellspacing="0" border="0">
                  <% for i = 1 to bodyElement.length 
	if sexId = bodyElement.item(i-1).getAttribute("sexId") or bodyElement.item(i-1).getAttribute("sexId") = "shemale" Then
		if bodyElement.item(i-1).getAttribute("region") = "abs" Then
%>
                  <tr> 
                    <td valign="top"> <img src="../image/000/dot3.gif" height="12" width="20" border="0" name="prodDot<%= i - 1 %>"> 
                    </td>
                    <td valign="top"> <a href="/asp/prodDisplay.asp?prodName=<%= bodyElement.item(i-1).getAttribute("prodName1") %><%= bodyElement.item(i-1).getAttribute("prodName2") %>&prodId=<%= bodyElement.item(i - 1).getAttribute("prodId") %>&<%= navQueryString %>" class="altviolet2" onMouseOut="restoreImage(document.images['prodDot<%= i - 1 %>'])" onMouseOver="swapImage(document.images['prodDot<%= i - 1 %>'],genNavImage[3]);"><%= bodyElement.item(i-1).getAttribute("prodName1") %><%= bodyElement.item(i-1).getAttribute("prodName2") %></a> </td>
                  </tr>
                  <% 
		end if
	end if
next %>
                </table>
              </div>
              <div id="leg" class="bodyDivLeg"> 
                <table cellpadding="2" cellspacing="0" border="0">
                  <% for i = 1 to bodyElement.length 
	if sexId = bodyElement.item(i-1).getAttribute("sexId") or bodyElement.item(i-1).getAttribute("sexId") = "shemale" Then
		if bodyElement.item(i-1).getAttribute("region") = "leg" Then
%>
                  <tr> 
                    <td valign="top"> <img src="../image/000/dot3.gif" height="12" width="20" border="0" name="prodDot<%= i - 1 %>"> 
                    </td>
                    <td valign="top"> <a href="/asp/prodDisplay.asp?prodName=<%= bodyElement.item(i-1).getAttribute("prodName1") %><%= bodyElement.item(i-1).getAttribute("prodName2") %>&prodId=<%= bodyElement.item(i - 1).getAttribute("prodId") %>&<%= navQueryString %>" class="altviolet2" onMouseOut="restoreImage(document.images['prodDot<%= i - 1 %>'])" onMouseOver="swapImage(document.images['prodDot<%= i - 1 %>'],genNavImage[3]);"><%= bodyElement.item(i-1).getAttribute("prodName1") %><%= bodyElement.item(i-1).getAttribute("prodName2") %></a> </td>
                  </tr>
                  <% 
		end if
	end if
next %>
                </table>
              </div>
            </div>
	</td>
<% if partnerId <> "chp" then %>
    <td valign="top" align="center">
		<img src="../image/000/preop/logo_body.gif" border="0" name="logoImage"><br><br>
		<table border="2" cellspacing="1" width="136" height="29"><tr><td align="center" valign="middle"><font class="medred">Click on a procedure.</font></td></tr></table>
		    <br>
            <br><p class="smlblue">If you don't see your<br>procedure, please view<br>one of the General surgeries.</p>
<table cellpadding="2" cellspacing="0" border="0">
<% for i = 1 to genElement.length %>
	<tr>
	<td><img src="../image/000/dot3.gif" align="top" border="0" height="12" width="20" name="genDot<%= i - 1 %>"></td>
	<td valign="top">
		<a href="/asp/prodDisplay.asp?prodName=<%= bodyElement.item(i-1).getAttribute("prodName1") %><%= bodyElement.item(i-1).getAttribute("prodName2") %>&prodId=<%= genElement.item(i - 1).getAttribute("prodId") %>&<%= navQueryString %>" class="altviolet2" onMouseOut="restoreImage2(document.images['genDot<%= i - 1 %>']); restoreImage(document.images['logoImage'])" onMouseOver="swapImage2(document.images['genDot<%= i - 1 %>'],genNavImage[3]); swapImage(document.images['logoImage'],genNavImage[<%= i - 1 %>]);"><b><%= genElement.item(i-1).text %></b></a>
	</td></tr>
<% next %>
</table>
	</td>
<% end if %>
  </tr>
</table>
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