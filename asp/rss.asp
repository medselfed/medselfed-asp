<?xml version="1.0" encoding="iso-8859-1"?>


<!--#include file="global.inc" -->
<%
siteId = "preop"
titleText = "MedSelfEd Patient Education: Site RSS"	
%>







<% Response.Buffer = true
   Response.ContentType = "text/xml"
   
Function ApplyXMLFormatting(strInput)
  strInput = Replace(strInput,"&", "&amp;")
  strInput = Replace(strInput,"'", "'")
  strInput = Replace(strInput,"""", "&quot;")
  strInput = Replace(strInput, ">", "&gt;")
  strInput = Replace(strInput,"<","&lt;")
  
  ApplyXMLFormatting = strInput
End Function   
    %>

<rss version="2.0">
<channel>
<title><%= titleText %></title>
<link>http://www.<%= siteId %>.com/</link>
<description>
MedSelfEd Patient Education
</description>
<language>en-us</language>
<copyright>Copyright 2008 MedSelfEd Inc. All Rights Reserved.</copyright>
<lastBuildDate>Tue, 12 Jun 2008 14:21:32 EST</lastBuildDate>
<ttl>240</ttl>
<image>
<url> </url>
</image>
<title><%= titleText %></title>
<link>http://<%= siteId %>.medselfed.com/</link>


<% if centerLink.length <> 0 and siteId = "preop" Then %>
		<% for x = 1 to centerLink.length %>
			<% if centerLink.item(x-1).getAttribute("siteId") = "preop" Then %>

<item>
<title>
<%=  ApplyXMLFormatting(centerLink.item(x-1).text) %>
</title>
<link>http://<%= siteId %>.medselfed.com/asp/center.asp?centerId=<%= centerLink.item(x-1).getAttribute("centerId") %></link>
<description>
<%=  ApplyXMLFormatting(centerLink.item(x-1).text) %>
</description>
<pubDate>Tue, 12 Apr 2005 13:59:56 EST</pubDate>
</item>
			<% end if %>
		<% next %>
<% end if %>		

<% if prodLink.length <> 0 and siteId = "preop" Then %>
		<% for x = 1 to prodLink.length %>
			<% if prodLink.length <> 0 and siteId = "preop" Then %>
<item>
<title><%=  ApplyXMLFormatting(prodLink.item(x-1).text) %></title>
<link>http://<%= siteId %>.medselfed.com/asp/prodDisplay.asp?prodId=<%= prodLink.item(x-1).getAttribute("prodId") %></link>
<description>
<%
prodfileName = "/xml/"& prodLink.item(x-1).getAttribute("prodId")&".xml"

<!-- using the MSXML Document object model  -->
set navDoc = Server.CreateObject("MSXML.DOMDocument") 

<!-- Do not validate against dtd file -->
navDoc.validateOnParse = false 
<!-- load the document in the MSXML document object -->
navDoc.load(Server.MapPath(prodfileName ))

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

%>



<%= ApplyXMLFormatting(procedureInfo.item(0).text) %><%= ApplyXMLFormatting(" " + procedureInfo.item(1).text) %>


</description>
 <% if procedureInfo.item(0).getAttribute("image") <> "" Then %>
 <% end if %>
<pubDate>Tue, 12 Apr 2005 13:59:56 EST</pubDate>
</item>
			<% end if %>
		<% next %>
<% end if %>



</channel>
</rss>
