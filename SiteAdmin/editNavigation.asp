<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 
 table =  Request.QueryString("table")
 key = Request.QueryString("key")

dim SQLString 
SQLString = "SELECT * FROM " & table

dim RS            'connection Recordset
dim objConn        'connection object    
dim DSNtemp        'connection string    
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "DSN=MySqlDSN;database=medselfed_prod"
Set Rs = objConn.Execute(SQLString)
%>
<!--#include file="header.inc" -->
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
	<tr><td class="med" align="left">MedSelfEd Navigation</td></tr>
</table>
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
  <tr> 
    <td class="medred"><%= key %></td>
    <td class="medred">Navigation Info</td>
	<td class="medred">Action</td>
  </tr>
<%
colorOn = "true"
 DO WHILE NOT Rs.EOF
on error resume next
%>
  <form name="partnerUpdate" action="editDatabase.asp">
  <input type="hidden" name="tablename" value="<%= table %>">
  <input type="hidden" name="reflink" value="editNavigation.asp?<%= Request.QueryString %>">
  <input type="hidden" name="key" value="<%= key %>">
  <input type="hidden" name="keyval" value="<% = Rs.Fields(key) %>">
  <input type="hidden" name="<%= key %>" value="<% = Rs.Fields(key) %>">
  <tr <% if colorOn = "true" then %> bgcolor="#CCCCCC" <% colorOn = "false"%><% else %><% colorOn = "true"%><% end if %> >
    <td class="sml" align="center"><% = Rs.Fields(key) %></td>
    <td class="smlred">Place the url of the navigation element here:<br><input class="sml" type="text" size="50" maxlength="100" name="url" value="<% = Rs.Fields("url") %>"/><br>Place the text of the navigation element:<br><input class="sml" type="text" size="50" maxlength="100" name="text" value="<% = Rs.Fields("text") %>"/></td>
	<td class="sml"><input class="altButtonFormat" type="submit" name="action" value="update"/>&nbsp;<input class="altButtonFormat" type="submit" name="action" value="delete"/></td>
   </tr>
</form>
<% Rs.MoveNext
 Loop %>
  <form name="partnerUpdate" action="editDatabase.asp">
  <input type="hidden" name="tablename" value="<%= table %>">
  <input type="hidden" name="reflink" value="editNavigation.asp?<%= Request.QueryString %>">
  <tr><td class="med" colspan="2" height="30" valign="bottom">Use this area to add new navigation elements</td></tr>
  <tr> 
    <td class="sml" align="center"><input class="sml" type="text" size="10" maxlength="10" name="<%= key %>" value=""/></td>
   <td class="smlred">Place the url of the navigation element here:<br><input class="sml" type="text" size="50" maxlength="100" name="url" value=""/><br>Place the text of the navigation element:<br><input class="sml" type="text" size="50" maxlength="100" name="text" value=""/></td>
    <td class="sml" colspan="2"><input class="altButtonFormat" type="submit" name="action" value="insert"/></td>
  </tr>
  </form>
  </table>
<!--#include file="footer.inc" -->
<img src="/image/000/top_cap2.gif" width="600"><div class="lrlines">
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
	<tr><td class="med" align="left">
<% pagename = "editNavigation.asp" %>
<!--#include file="help.inc" -->
</td></tr></table>
</div>
<img src="/image/000/bottom_cap2.gif" width="600">