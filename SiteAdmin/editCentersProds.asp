<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 

centerId = Request.QueryString("centerId")
siteId = Request.QueryString("siteId")

dim SQLString 
dim procedures      'connection Recordset
dim prods_center_rel 'connection Recordset
dim objConn         'connection object    
dim DSNtemp         'connection string    
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "DSN=MySqlDSN;database=medselfed_prod"

SQLString = "SELECT * FROM procedures where siteId= '"& siteId &"' order by prodId"
Set procedures = objConn.Execute(SQLString)
SQLString = "SELECT * FROM prods_center_rel a, procedures b where a.prodId = b.prodId and a.centerId = '" & centerId & "'"
Set prods_center_rel = objConn.Execute(SQLString)
SQLString = "SELECT * FROM centers where centerId = '" & centerId & "'"
Set centers = objConn.Execute(SQLString)


%>
<!--#include file="header.inc" -->
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
	<tr><td class="med" align="left">MedSelfEd Center/Procedure Relation</td><td align="right"><a href="editCenters.asp" class="sml">Back to Centers</a></td></tr>
<tr><td class="med" colspan="2">These are the procedures within the center:<br><font class="medred"><%= centers.fields("text") %></font></td></tr>
</table>
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
  <tr> 
    <td class="medred">Procedure</td>
    <td class="medred">Action</td>
  </tr>
<% 
 colorOn = "true"
DO WHILE NOT prods_center_rel.EOF
on error resume next
%>
  <form name="partnerUpdate" action="editDatabase.asp">
  <input type="hidden" name="tablename" value="prods_center_rel">
  <input type="hidden" name="reflink" value="editCentersProds.asp?<%= Request.QueryString %>">
  <input type="hidden" name="key" value="prods_center_relId">
  <input type="hidden" name="keyval" value="<% = prods_center_rel.Fields("prods_center_relId") %>">
  <input type="hidden" name="centerId" value="<% = prods_center_rel.Fields("centerId") %>">
  <tr <% if colorOn = "true" then %> bgcolor="#CCCCCC" <% colorOn = "false"%><% else %><% colorOn = "true"%><% end if %> >
    <td class="sml"><% = prods_center_rel.Fields("prodId") %> - <% = prods_center_rel.Fields("text") %></td>
    <td class="sml"><input class="altButtonFormat" type="submit" name="action" value="delete"/></td>
  </tr>
</form>
<% prods_center_rel.MoveNext
 Loop %>
  <form name="partnerUpdate" action="editDatabase.asp">
  <input type="hidden" name="tablename" value="prods_center_rel">
  <input type="hidden" name="reflink" value="editCentersProds.asp?<%= Request.QueryString %>">
  <input type="hidden" name="centerId" value="<%= centerId %>"/>
  <tr><td class="med" colspan="2" height="30" valign="bottom">Use this area to add new procedures</td></tr>
    <td class="sml">
	<select class="sml" name="prodId">
<% DO WHILE NOT procedures.EOF
on error resume next
%>
	<option value="<% = procedures.Fields("prodId") %>"><% = procedures.Fields("prodId") %> - <% = procedures.Fields("text") %></option>
<% procedures.MoveNext
 Loop %>
	</select>
	</td>
    <td class="sml" colspan="2"><input class="altButtonFormat" type="submit" name="action" value="insert"/></td>
  </tr>
</form>
</table>
<!--#include file="footer.inc" -->
<img src="/image/000/top_cap2.gif" width="600"><div class="lrlines">
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
	<tr><td class="med" align="left">
<% pagename = "editCentersProds.asp" %>
<!--#include file="help.inc" -->
</td></tr></table>
</div>
<img src="/image/000/bottom_cap2.gif" width="600">