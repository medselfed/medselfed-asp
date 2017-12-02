<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 
 orderBy =  Request.QueryString("orderBy")
 partnerId = Request.QueryString("partnerId")
 navlinkId = Request.QueryString("navlinkId")

dim SQLString 
SQLString = "SELECT * FROM partner_navdrop_rel where partnerId = '" & partnerId & "' and navlinkId = '" &  navlinkId & "' order by sequence"

dim RS            'connection Recordset
dim objConn        'connection object    
dim DSNtemp        'connection string    
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "DSN=MySqlDSN;database=medselfed_prod"
Set Rs = objConn.Execute(SQLString)

SQLString = "SELECT * FROM navdrops"
Set navdrops = objConn.Execute(SQLString)

%>
<!--#include file="header.inc" -->
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
	<tr><td class="med" align="left">Navigation Drop Downs for Partner: <font class="medred"><%= partnerId %></font></td><td align="right"><a href="editPartnerBar.asp?partnerId=<% = partnerId %>" class="sml">Back to Navigation Bar</a></td></tr></table>
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
  <tr> 
    <td class="medred">Top Navigation ID</td>
	<td class="medred">Sequence</td>
	<td class="medred">Navigation Drop Down ID</td>
    <td class="medred">Action</td>
  </tr>
<% 
 colorOn = "true"
DO WHILE NOT Rs.EOF
on error resume next
%>
  <form name="partnerUpdate" action="editDatabase.asp">
  <input type="hidden" name="tablename" value="partner_navdrop_rel">
  <input type="hidden" name="reflink" value="editPartnerDrop.asp?<%= Request.QueryString %>">
   <input type="hidden" name="key" value="partner_navdrop_relId">
  <input type="hidden" name="keyval" value="<% = Rs.Fields("partner_navdrop_relId") %>">
  <input type="hidden" name="partner_navdrop_relId" value="<% = Rs.Fields("partner_navdrop_relId") %>"/>
    <input type="hidden" name="partnerId" value="<% = partnerId %>">
  <input type="hidden" name="navlinkId" value="<% = navlinkId %>">
  <tr <% if colorOn = "true" then %> bgcolor="#CCCCCC" <% colorOn = "false"%><% else %><% colorOn = "true"%><% end if %> >
	<td class="sml" align="center"><% = Rs.Fields("navlinkId") %></td>
		<td class="sml"><input type="text" name="sequence" value="<% = Rs.Fields("sequence") %>" class="sml"></td>
    <td class="sml"><select name="navdropId" class="sml">
<% DO WHILE NOT navdrops.EOF
on error resume next
	if Rs.Fields("navdropId") = navdrops.Fields("navdropId") Then
%>
	<option selected value="<% = navdrops.Fields("navdropId") %>"><% = navdrops.Fields("navdropId") %> - <% = navdrops.Fields("text") %></option>
<% else %>
	<option  value="<% = navdrops.Fields("navdropId") %>"><% = navdrops.Fields("navdropId") %> - <% = navdrops.Fields("text") %></option>
<% end if %>
<% navdrops.MoveNext 
 Loop
 navdrops.MoveFirst
  %>
 </select>	
		</td>
    <td><input class="altButtonFormat" type="submit" name="action" value="update"/>&nbsp;<input class="altButtonFormat" type="submit" name="action" value="delete"/> </td>
  </tr>
  </form>
<% Rs.MoveNext 
 Loop 
  %> 
  <form name="partnerUpdate" action="editDatabase.asp">
  <input type="hidden" name="tablename" value="partner_navdrop_rel">
  <input type="hidden" name="reflink" value="editPartnerDrop.asp?<%= Request.QueryString %>">
  <input type="hidden" name="partnerId" value="<% = partnerId %>">
  <input type="hidden" name="navlinkId" value="<% = navlinkId %>">
  <tr><td class="med" colspan="4" height="30" valign="bottom">Use this area to add Navigation Drop Downs</td></tr>
  <tr> 
	<td class="sml" align="center"><% = navlinkId %></td>
		<td class="sml"><input type="text" name="sequence" value="" class="sml"></td>

    <td class="sml"><select name="navdropId" class="sml">
<% DO WHILE NOT navdrops.EOF
on error resume next
	if Rs.Fields("navdropId") = navdrops.Fields("navdropId") Then
%>
	<option selected value="<% = navdrops.Fields("navdropId") %>"><% = navdrops.Fields("navdropId") %> - <% = navdrops.Fields("text") %></option>
<% else %>
	<option  value="<% = navdrops.Fields("navdropId") %>"><% = navdrops.Fields("navdropId") %> - <% = navdrops.Fields("text") %></option>
<% end if %>
<% navdrops.MoveNext 
 Loop
 navdrops.MoveFirst
  %>
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
<% pagename = "editPartnerDrop.asp" %>
<!--#include file="help.inc" -->
</td></tr></table>
</div>
<img src="/image/000/bottom_cap2.gif" width="600">