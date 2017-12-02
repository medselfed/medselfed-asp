<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 
 orderBy =  Request.QueryString("orderBy")
 createNew =  Request.QueryString("createNew")

dim SQLString 
if orderBy <> "" Then
	SQLString = "SELECT * FROM centers order by " & orderBy
else 
	SQLString = "SELECT * FROM centers"
end if

dim RS            'connection Recordset
dim objConn        'connection object    
dim DSNtemp        'connection string    
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "DSN=MySqlDSN;database=medselfed_prod"
Set Rs = objConn.Execute(SQLString)
%>
<!--#include file="header.inc" -->
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
	<tr><td class="med" align="left">MedSelfEd Centers</td><td align="right"><a href="generateCenters.asp" class="sml">Generate XML</a></td></tr>
</table>
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
  <tr> 
    <td class="medred">Center ID</td>
    <td class="medred">Name</td>
    <td class="medred">Site Id</td>
    <td class="medred">Action</td>
    <td class="medred" align="center">Procedures</td>
  </tr>
<% 
if createNew = "" then
 colorOn = "true"
DO WHILE NOT Rs.EOF
on error resume next
%>
  <form name="partnerUpdate" action="editDatabase.asp">
  <input type="hidden" name="tablename" value="centers">
  <input type="hidden" name="reflink" value="editCenters.asp?<%= Request.QueryString %>">
  <input type="hidden" name="key" value="centerId">
  <input type="hidden" name="keyval" value="<% = Rs.Fields("centerId") %>">
  <input type="hidden" name="centerId" value="<% = Rs.Fields("centerId") %>">
  <tr <% if colorOn = "true" then %> bgcolor="#CCCCCC" <% colorOn = "false"%><% else %><% colorOn = "true"%><% end if %> >
    <td class="sml" align="center"><% = Rs.Fields("centerId") %></td>
    <td class="sml"><input class="sml" type="text" size="50" maxlength="100" name="text" value="<% = Rs.Fields("text") %>"/></td>
    <td class="sml"><input class="sml" type="text" size="10" maxlength="10" name="siteId" value="<% = Rs.Fields("siteId") %>"/></td>
    <td class="sml"><input class="altButtonFormat" type="submit" name="action" value="update"/>&nbsp;<input class="altButtonFormat" type="submit" name="action" value="delete"/></td>
    <td class="sml" align="center"><a href="editCentersProds.asp?centerId=<% = Rs.Fields("centerId") %>&siteId=<% = Rs.Fields("siteId") %>" class="sml">procedures</a></td>
  </tr>
</form>
<% Rs.MoveNext
 Loop %>
 <% else %>
  <form name="partnerUpdate" action="editDatabase.asp">
  <input type="hidden" name="tablename" value="centers">
  <input type="hidden" name="reflink" value="editCenters.asp?<%= Request.QueryString %>">
  <tr bgcolor="#CCCCCC"> 
    <td class="sml"><input class="sml" type="text" size="10" maxlength="10" name="centerId" value=""/></td>
    <td class="sml"><input class="sml" type="text" size="50" maxlength="100" name="text" value=""/></td>
    <td class="sml"><input class="sml" type="text" size="10" maxlength="10" name="siteId" value=""/></td>
    <td class="sml" colspan="2"><input class="altButtonFormat" type="submit" name="action" value="insert"/></td>
  </tr>
</form>
<% end if %>
</table>
<!--#include file="footer.inc" -->
<img src="/image/000/top_cap2.gif" width="600"><div class="lrlines">
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
	<tr><td class="med" align="left">
<% pagename = "editCenters.asp" %>
<!--#include file="help.inc" -->
</td></tr></table>
</div>
<img src="/image/000/bottom_cap2.gif" width="600">