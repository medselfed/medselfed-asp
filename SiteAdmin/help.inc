<%
	<!-- dynamically include xml files -->
	fileName = "help.xml"

	<!-- using the MSXML Document object model  -->
	set navDoc = Server.CreateObject("Microsoft.XMLDOM") 
	navDoc.validateOnParse = false 
	navDoc.load(Server.MapPath(fileName))
	' begin to read XML file
	set navDocRoot = navDoc.documentElement
	set helpElement = navDocRoot.getElementsByTagName("helpElement")
%>
<% for i = 1 to helpElement.length %>
<% if pagename = "all" or helpElement.item(i - 1).getAttribute("pagename") = pagename Then %>
<tr><td class="sml" colspan="2"><p align="justify"><%= helpElement.item(i - 1).text %></p></td></tr>
<% end if %>
<% next %>