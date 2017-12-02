<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 
 orderBy =  Request.QueryString("orderBy")
 partnerId = Request.QueryString("partnerId")

dim SQLString 
SQLString = "SELECT * FROM partner_navlink_rel where partnerId = '" & partnerId & "' order by sequence"

dim RS            'connection Recordset
dim objConn        'connection object    
dim DSNtemp        'connection string    
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "DSN=MySqlDSN;database=medselfed_prod"
Set Rs = objConn.Execute(SQLString)

SQLString = "SELECT * FROM navlinks"
Set navlinks = objConn.Execute(SQLString)

%>
<!--#include file="header.inc" -->
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
	<tr><td class="med" align="left">Navigation Bar for Partner: </font><font class="medred"><%= partnerId %></td><td align="right"><a href="editPartner.asp" class="sml">Back to Partners</a></td></tr></table>
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
  <tr> 
	<td class="medred">Navigation Bar Information</td>
    <td class="medred">Action</td>
    <td class="medred">Edit Drop Down</td>
  </tr>
<%
 colorOn = "true"
 DO WHILE NOT Rs.EOF
on error resume next
%>
  <form name="partnerUpdate" action="editDatabase.asp">
  <input type="hidden" name="tablename" value="partner_navlink_rel">
  <input type="hidden" name="reflink" value="editPartnerBar.asp?<%= Request.QueryString %>">
   <input type="hidden" name="key" value="partner_navlink_relId">
  <input type="hidden" name="keyval" value="<% = Rs.Fields("partner_navlink_relId") %>">
  <input type="hidden" name="partner_navlink_relId" value="<% = Rs.Fields("partner_navlink_relId") %>"/>
  <input type="hidden" name="partnerId" value="<% = Rs.Fields("partnerId") %>">
  <tr <% if colorOn = "true" then %> bgcolor="#CCCCCC" <% colorOn = "false"%><% else %><% colorOn = "true"%><% end if %> >
    <td class="smlred">Sequence within top navigation bar?<br><input type="text" name="sequence" value="<% = Rs.Fields("sequence") %>" class="sml">
	<br>Choose an option from available Navigation elements:<br><select name="navlinkId" class="sml">
<% DO WHILE NOT navlinks.EOF
on error resume next
	if Rs.Fields("navlinkId") = navlinks.Fields("navlinkId") Then
%>
	<option selected value="<% = navlinks.Fields("navlinkId") %>"><% = navlinks.Fields("navlinkId") %> - <% = navlinks.Fields("text") %></option>
<% else %>
	<option  value="<% = navlinks.Fields("navlinkId") %>"><% = navlinks.Fields("navlinkId") %> - <% = navlinks.Fields("text") %></option>
<% end if %>
<% navlinks.MoveNext 
 Loop
 navlinks.MoveFirst
  %>
 </select>	
		</td>
    <td><input class="altButtonFormat" type="submit" name="action" value="update"/>&nbsp;<input class="altButtonFormat" type="submit" name="action" value="delete"/> </td>
    <td><a href="editPartnerDrop.asp?partnerId=<%= partnerId %>&navlinkId=<%= Rs.Fields("navlinkId") %>" class="sml">Edit Drop Downs</a></td>
  </tr>
  </form>
<% Rs.MoveNext 
 Loop 
  %> 
  <form name="partnerUpdate" action="editDatabase.asp">
  <input type="hidden" name="tablename" value="partner_navlink_rel">
  <input type="hidden" name="reflink" value="editPartnerBar.asp?<%= Request.QueryString %>">
  <input type="hidden" name="partnerId" value="<% = partnerId %>">
 <tr><td class="med" colspan="3" height="30" valign="bottom">Use this area to add top navigation elements</td></tr>

  <tr> 
	<td class="smlred">Sequence within top navigation bar?<br><input type="text" name="sequence" value="" class="sml">
	<br>Choose an option from available Navigation elements:<br><select name="navlinkId" class="sml">
<% 
DO WHILE NOT navlinks.EOF
on error resume next
%>
<option value="<% = navlinks.Fields("navlinkId") %>"><% = navlinks.Fields("navlinkId") %> - <% = navlinks.Fields("text") %></option>
<% navlinks.MoveNext 
 Loop %>
 </select>	
		</td>
	<td colspan="2"><input class="altButtonFormat" type="submit" name="action" value="insert"/></td>  
 </tr>
 </form>
</table>
<!--#include file="footer.inc" -->
<img src="/image/000/top_cap2.gif" width="600"><div class="lrlines">
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
	<tr><td class="med" align="left">
<% pagename = "editPartnerBar.asp" %>
<!--#include file="help.inc" -->
</td></tr></table>
</div>
<img src="/image/000/bottom_cap2.gif" width="600">