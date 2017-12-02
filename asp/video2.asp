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
		set videoImage = navDocRoot.getElementsByTagName("videoImage")
		set navElement = navDocRoot.getElementsByTagName("navElement")
		siteId = navDocRoot.selectSingleNode("siteId").text

thisSpotId = "end"
thisSpotIdFound = false
prevSpotId = "end"
prevSpotIdFound = false
nextSpotId = "end"
nextSpotIdFound = false
numSpots = 0
thisSpot = 0
for i = 1 to videoImage.length
	if videoImage.item(i - 1).getAttribute("secId") = secId Then
	numSpots = numSpots + 1
		if videoImage.item(i - 1).getAttribute("spotId") = spotId Then
			thisSpot = numSpots
			if thisSpotIdFound = false Then
				thisSpotId = videoImage.item(i - 1).getAttribute("spotId")
				thisSpotIdFound = true
			end if
		elseif int(videoImage.item(i - 1).getAttribute("spotId")) < int(spotId) Then
			'response.write(videoImage.item(i - 1).getAttribute("spotId") & " is less then " & spotId)
			'if prevSpotIdFound = false Then
				prevSpotId = videoImage.item(i - 1).getAttribute("spotId")
				'prevSpotIdFound = true
			'end if		
		elseif int(videoImage.item(i - 1).getAttribute("spotId")) > int(spotId) Then
			if nextSpotIdFound = false Then
				nextSpotId = videoImage.item(i - 1).getAttribute("spotId")
				nextSpotIdFound = true
			end if		
		end if
	end if	
next 
		
	
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
<script type="text/javascript">
getImageObj();
</script>
</head>
<body>
<center>
<div class="topdiv">
<!--#include file="header.inc" -->
<div class="lrlines">&nbsp;
<table width="95%" border="0" cellpadding="5" cellspacing="0">
          <% 
		for x = 1 to videoImage.length
			if videoImage.item(x-1).getAttribute("secId") = secId Then
				if videoImage.item(x-1).getAttribute("spotId") = spotId Then
		   %>
          <tr> 
            <td width="40%" align="center" valign="bottom" bgcolor="#ffffff" height="140"> 
              <img src="../image/000/<%= siteId %>/logo.gif"><br>
              <br>
            </td>
            <td valign="middle" width="60%" rowspan="2" align="center" bgcolor="#ffffff"> 
			<% if mediaType = "qt" then %>
				<EMBED SRC="/media/<%= videoImage.item(x-1).getAttribute("videoMapQT") %>" PLUGINSPAGE="http://quicktime.apple.com" WIDTH=320 HEIGHT=256 CONTROLLER=true LOOP=false AUTOPLAY=true></embed>
			<% else %>
				<EMBED SRC="/media/<%= videoImage.item(x-1).getAttribute("videoMapWM") %>" PLUGINSPAGE="http://www.microsoft.com/Windows/mediaxPlayer/" WIDTH=280 HEIGHT=256 type="application/x-mplayer2" name=MediaPlayer1 autostart=true> 
			<% end if %>
			</td></tr>
          <tr>
            <td height="140" align="center" valign="top" bgcolor="#ffffff"> <% if prevSpotId = "end" Then %> 
              <p><img src="/image/000/nav/picbackend2.gif"> <% else %> <a href="/asp/video2.asp?prodId=<%=  prodId %>&secId=<%= secId %>&spotId=<%= prevSpotId %>&mediaType=<%= mediaType %>&<%= navQueryString %>&relProdId=<%= relProdId %>"><img src="/image/000/nav/picback2.gif" onMouseOver="swapImage(this,navigationImage[7])" onMouseOut="restoreImage(this)" border="0"></a> 
                <% end if %> <a href="/asp/prodDisplay.asp?prodId=<%=  prodId %>&secId=<%= secId %>&<%= navQueryString %>&relProdId=<%= relProdId %>"><img src="../image/000/nav/picnav_0<%= thisSpot %>.gif" onMouseOver="swapImage(this,navigationImage[6])" onMouseOut="restoreImage(this)" border="0"></a> 
                <% if nextSpotId = "end" Then %> <img src="/image/000/nav/picnextend2.gif"> 
                <% else %> <a href="/asp/video2.asp?prodId=<%=  prodId %>&secId=<%= secId %>&spotId=<%= nextSpotId %>&mediaType=<%= mediaType %>&<%= navQueryString %>&relProdId=<%= relProdId %>"><img src="/image/000/nav/picnext2.gif" onMouseOver="swapImage(this,navigationImage[5])" onMouseOut="restoreImage(this)" border="0" width="35" height="20"></a></p>
              <p><a href="/asp/video2.asp?prodId=<%=  prodId %>&secId=<%= secId %>&spotId=<%= nextSpotId %>&mediaType=<%= mediaType %>&<%= navQueryString %>&relProdId=<%= relProdId %>"><img src="../image/000/nav/continue.gif" onMouseOver="swapImage(this,navigationImage[8])" onMouseOut="restoreImage(this)" width="131" height="29" border="0"></a> 
                <% end if %> </p>
            </td>
          </tr>
            <%
				end if
	   		end if			
		next
%>
        </table>
</div>
<!--#include file="footer2.inc" -->
</div>
<!--#include file="ads_horizonal.inc" -->
</center>
</body>
</html>
<!--#include file="chromefoot.inc" -->