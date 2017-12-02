<%
	' Read in the help.xml file
	HelpfileName = "/xml/help.xml"
	set HelpnavDoc = Server.CreateObject("Microsoft.XMLDOM") 
	HelpnavDoc.validateOnParse = false 
	HelpnavDoc.load(Server.MapPath(HelpfileName))
	
	set HelpnavDocRoot = HelpnavDoc.documentElement
	set helpballoon = HelpnavDocRoot.getElementsByTagName("helpBalloon")	
%>
<% for i = 1 to helpballoon.length %>
<% if Request.ServerVariables("PATH_INFO") = helpballoon.item(i-1).getAttribute("path") Then %>
<% if affId = helpballoon.item(i-1).getAttribute("affId") Then %>
<% if campId = helpballoon.item(i-1).getAttribute("campId") Then %>
<div onMouseOut="hide('<%= helpballoon.item(i-1).getAttribute("balloonId") %>');" onMouseOver="show('<%= helpballoon.item(i-1).getAttribute("balloonId") %>');" id="help" style="position:absolute; 
						visibility: <%= helpballoon.item(i-1).getAttribute("visibility") %>;
						top:<%= helpballoon.item(i-1).getAttribute("balloonY") %>px; 
						left:<%= helpballoon.item(i-1).getAttribute("balloonX") %>px;
						position:absolute;
						z-index:999">
		<img src="<%= baseHref %>/image/000/help.gif" style="padding:2px">
</div>
	<div id="<%= helpballoon.item(i-1).getAttribute("balloonId") %>"
		onMouseOver="hide('<%= helpballoon.item(i-1).getAttribute("balloonId") %>');"
		style="border:<%= helpballoon.item(i-1).getAttribute("balloonBorderWidth") %>px solid <%= helpballoon.item(i-1).getAttribute("balloonBorderColor") %>; 
			height:<%= helpballoon.item(i-1).getAttribute("balloonHeight") %>px; 
			width:<%= helpballoon.item(i-1).getAttribute("balloonWidth") %>px;
			top:<%= helpballoon.item(i-1).getAttribute("balloonY") %>px; 
			left:<%= helpballoon.item(i-1).getAttribute("balloonX") %>px;
			position:absolute;
			z-index:997;
			visibility:<%= helpballoon.item(i-1).getAttribute("visibility") %>">
		<div style="position:absolute; 
			top:<%= helpballoon.item(i-1).getAttribute("textY") %>px;  
			left:<%= helpballoon.item(i-1).getAttribute("textX") %>px;
			border:<%= helpballoon.item(i-1).getAttribute("textBorderWidth") %>px solid <%= helpballoon.item(i-1).getAttribute("textBorderColor") %>;
			background-color:<%= helpballoon.item(i-1).getAttribute("textBackground") %>; padding:5px; 
			height:<%= helpballoon.item(i-1).getAttribute("textHeight") %>px;
			width:<%= helpballoon.item(i-1).getAttribute("textWidth") %>px;
			z-index:998;">
			<table width="100%" cellspacing="0" cellpadding="0">
				<tr>
					<% if  helpballoon.item(i-1).getAttribute("image") <> "" then %>
					<td align="center"><img src="<%= baseHref %><%= helpballoon.item(i-1).getAttribute("image") %>" /></td>
					<% end if %>
				</tr>
				<tr>
					<td><%= helpballoon.item(i-1).text %></td>					
				</tr>
			</table>
			</div>
	</div>
	<% end if %>
	<% end if %>
<% end if %>
<% next %>
