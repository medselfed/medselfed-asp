<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="global.inc" -->
<%
    Response.Buffer = true
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

	titleText = "MedSelfEd Patient Education: " & prodName & " Printing Slide - " & thisSpot & " of " & numSpots & " " & navDocRoot.selectSingleNode("pageHeader1").text & " " & navDocRoot.selectSingleNode("pageHeader2").text	
	numSpots = 0
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><%= titleText %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="<%= cssDir %>/keyframe.css" rel="stylesheet" type="text/css">
<link href="<%= cssDir %>/fonts.css" rel="stylesheet" type="text/css">
<link href="<%= cssDir %>/layout.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%= jsDir %>/common.js"></script>
<script type="text/javascript" src="<%= jsDir %>/MM_functions.js"></script>
<script type="text/javascript">
getImageObj();
</script>
</head>
<body onLoad="self.focus()">
<center>
<table bgcolor="#ffffff" width="100%" border="0" cellspacing="6" cellpadding="0">
    <tr>
	<td align="left" valign="middle" width="33%" class="sml"><img src="../image/000/<% =siteId %>/logo_b.gif"></td>
    <td align="center" valign="middle" width="33%" class="headersec"><%= prodName %></td>
	<td align="right" valign="middle" width="33%"><div class="header"><%= navDocRoot.selectSingleNode("pageHeader1").text %></div><br><div class="headerit2"><%= navDocRoot.selectSingleNode("pageHeader2").text %></div></td>
	</tr>
    <tr>
	<td colspan="3"><img src="/image/000/grey_dot.gif" width="100%" height="1"></td>
	</tr>
</table>
<table width="95%" border="0" cellpadding="5" cellspacing="0">
          <% for i = 1 to procedureInfo.length
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
            <td width="40%" align="center" valign="bottom" bgcolor="#ffffff" height="140"> 
              <img src="../image/000/<%= siteId %>/logo.gif"><br>
              <br>
            </td>
            <td valign="middle" width="60%" rowspan="2" align="center" bgcolor="#ffffff"> 
              <img src="../image/<%= procedureInfo.item(i-1).getAttribute("slideimage") %>" width="320" height="240"> 
              <table width="320" border="0" cellpadding="5" cellspacing="0">
                <tr> 
                  <td bordercolor="#CCCCCC" bgcolor="#F3F3F3"><font class="largeviolet"><%= firstChar %></font><%= restChar %> 
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <%
		end if			
	end if
next %>
          <tr> 
            <td height="140" align="center" valign="top" bgcolor="#ffffff"> 
              <% if spotId  = 1 Then %>
              <img src="../image/000/nav/picbackend2.gif"> 
              <% else %>
              <a href="/asp/slidePrint.asp?prodId=<%= prodId %>&secId=<%= secId %>&spotId=<%= (thisSpot - 1) %>"><img src="../image/000/nav/picback2.gif" onMouseOver="swapImage(this,navigationImage[7])" onMouseOut="restoreImage(this)" border="0"></a> 
              <% end if %>
              <% 
	for x = 1 to navElement.length
		if navElement.item(x-1).getAttribute("secId") = secId Then
			if thisSpot > 9 Then %>
              <a href="javascript:;" onClick="parent.self.close()"><img src="../image/000/nav/picnav_<%= spotId %>.gif" onMouseOver="swapImage(this,navigationImage[6])" onMouseOut="restoreImage(this)" border="0"></a> 
              <% else %>
              <a href="javascript:;" onClick="parent.self.close()"><img src="../image/000/nav/picnav_0<%= spotId %>.gif" onMouseOver="swapImage(this,navigationImage[6])" onMouseOut="restoreImage(this)" border="0"></a> 
              <% end if
		end if
	next 
%>
              <% if thisSpot = numSpots Then %>
              <img src="../image/000/nav/picnextend2.gif"> 
              <% else %>
              <a href="/asp/slidePrint.asp?prodId=<%= prodId %>&secId=<%= secId %>&spotId=<%= (thisSpot + 1) %>"><img src="../image/000/nav/picnext2.gif" onMouseOver="swapImage(this,navigationImage[5])" onMouseOut="restoreImage(this)" border="0"></a> 
              <% end if %>
            </td>
          </tr>
        </table>
          <table width="70%" border="0">
            <tr>
              <td>
                <div align="center">
                  <p><img src="../image/000/<% =siteId %>/copyright.gif"></p>
                  <p class="smlred">This information is not intended to replace the advice of 
                    your doctor. MedSelfEd, Inc. disclaims any liability for the 
                    decisions you make based on this information.</p>
                </div>
              </td>
            </tr>
          </table>
</center>
<!--#include file="tracking.inc" -->
</body>
</html>
