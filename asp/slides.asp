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
		set procedureInfo = navDocRoot.getElementsByTagName("procedureInfo")
		siteId = navDocRoot.selectSingleNode("siteId").text

		  for i = 1 to procedureInfo.length
				if procedureInfo.item(i-1).getAttribute("secId") = secId Then
					numSpots = numSpots + 1
					if procedureInfo.item(i-1).getAttribute("spotId") = spotId Then
						thisSpot = numSpots
					end if
				end if
			next 
	for i = 1 to navElement.length
		if navElement.item(i-1).getAttribute("secId") = secId Then
			prodName = navElement.item(i-1).text
		end if
	next
			
	titleText = "MedSelfEd Patient Education: " & prodName & " Slide " & thisSpot & " of " & numSpots & " - " & navDocRoot.selectSingleNode("pageHeader1").text & " " & navDocRoot.selectSingleNode("pageHeader2").text	
		numSpots = 0
	
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
getImageObj();
</script>
</head>
<body>
<center>
<div class="topdiv">
<!--#include file="header.inc" -->
<!--#include file="help.inc" -->
<div class="lrlines"><center>&nbsp;
      <table width="95%" border="0" cellpadding="0" style="padding:0px 5px 0px 5px" cellspacing="0">
        <% 
		  navQueryString = navQueryString + centerQueryString
		  navQueryString = navQueryString + relQueryString
		  for i = 1 to procedureInfo.length
				if procedureInfo.item(i-1).getAttribute("secId") = secId Then
					numSpots = numSpots + 1
					if procedureInfo.item(i-1).getAttribute("spotId") = spotId Then
					thisSpot = numSpots
					prodText = procedureInfo.item(i-1).text
					prodLen = Len(prodText)
					firstChar = Left(procedureInfo.item(i-1).text,1)
					restChar = Right(prodText,(prodLen - 1))
					if firstChar = "<" Then
						firstChar = ""
						restChar = prodText
				end if
		%>
        <tr> 
          <td width="40%" align="center" valign="bottom" bgcolor="#ffffff" height="80"> 
            <img src="../image/000/<%= siteId %>/logo.gif"><br> <br> </td>
          <td valign="middle" width="60%" rowspan="2" align="center" bgcolor="#ffffff"> 
            <img style="padding-top:5px;" src="../image<%= procedureInfo.item(i-1).getAttribute("slideimage") %>" width="320" height="240"> 
          </td>
        </tr>
        <%
		end if			
	end if
next %>
        <tr> 
          <td height="80" align="center" valign="top" bgcolor="#ffffff"> 
            <% if spotId  = 1 Then %>
            <img src="../image/000/nav/picbackend2.gif"> 
            <% else %>
            <a href="/asp/slides.asp?prodId=<%= prodId %>&secId=<%= secId %>&spotId=<%= (thisSpot - 1) %>&<%= navQueryString%>"><img src="../image/000/nav/picback2.gif" onMouseOver="swapImage(this,navigationImage[7])" onMouseOut="restoreImage(this)" border="0"></a> 
            <% end if %>
            <% 
	for x = 1 to navElement.length
		if navElement.item(x-1).getAttribute("secId") = secId Then
			if thisSpot > 9 Then %>
            <a href="/asp/prodDisplay.asp?prodId=<%=  prodId %>&secId=<%= secId %>&<%= navQueryString%>"><img src="../image/000/nav/picnav_<%= spotId %>.gif" onMouseOver="swapImage(this,navigationImage[6])" onMouseOut="restoreImage(this)" border="0"></a> 
            <% else %>
            <a href="/asp/prodDisplay.asp?prodId=<%=  prodId %>&secId=<%= secId %>&<%= navQueryString%>"><img src="../image/000/nav/picnav_0<%= spotId %>.gif" onMouseOver="swapImage(this,navigationImage[6])" onMouseOut="restoreImage(this)" border="0"></a> 
            <% end if
		end if
	next 
%>
            <% if thisSpot = numSpots Then %>
            <img src="../image/000/nav/picnextend2.gif"> 
            <% else %>
            <a href="/asp/slides.asp?prodId=<%= prodId %>&secId=<%= secId %>&spotId=<%= (thisSpot + 1) %>&<%= navQueryString%>"><img src="../image/000/nav/picnext2.gif" onMouseOver="swapImage(this,navigationImage[5])" onMouseOut="restoreImage(this)" border="0"></a> 
            <% end if %>
          </td>
        </tr>
        <tr>
          <td height="140" align="center" valign="top" bgcolor="#ffffff">&nbsp;</td>
          <td valign="top" align="center" bgcolor="#ffffff">
<table width="320" border="0" cellpadding="5" cellspacing="0">
              <tr> 
                <td bordercolor="#CCCCCC" bgcolor="#F3F3F3"><font class="largeviolet"><%= firstChar %></font><%= restChar %> 
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
</center>
</div>
<!--#include file="footer2.inc" -->
</div>
</center>
<!--#include file="tracking.inc" -->
</body>
</html>
<!--#include file="chromefoot.inc" -->