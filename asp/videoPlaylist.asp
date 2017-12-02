<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
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

set prodPlaylist = navDocRoot.getElementsByTagName("playlist")


%>
<%if prodPlaylist.length = 0 Then %>
<ASX version = "3.0">
<% for x = 1 to videoImage.length %>
<Entry>
    <Ref href="http://www.preop.com/media/<%= videoImage.item(x-1).getAttribute("videoMapWM") %>"/>
</Entry>
<% next %>
</ASX>
<% else
	playlistUrl = "http://www.preop.com" & prodPlaylist.item(0).getAttribute("asx")
	Response.Redirect playlistUrl 

end if %>

