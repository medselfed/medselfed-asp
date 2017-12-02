<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 
 partnerId =  Request.QueryString("partnerId")

dim SQLString 

dim centers            'connection Recordset
dim partner_center_rel            'connection Recordset
dim objConn        'connection object    
dim DSNtemp        'connection string    
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "DSN=MySqlDSN;database=medselfed_prod"

SQLString = "SELECT * FROM procedures, partner_prods_rel where partnerId = '" & partnerId & "' and partner_prods_rel.prodId = procedures.prodId"
Set procedures = objConn.Execute(SQLString)

SQLString = "SELECT * FROM partner_special_rel where partnerId = '" & partnerId & "'"
Set partner_prods_rel = objConn.Execute(SQLString)

%>
<!--#include file="header.inc" -->
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
	<tr><td class="med" align="left">Special Instructions for Partner: </font><font class="medred"><%= partnerId %></td><td align="right"><a href="editPartner.asp" class="sml">Back to Partners</a></td></tr></table>
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
  <tr> 
    <td class="medred" valign="top">Procedure / Instructions</td>
	<td class="medred" valign="top">Action</td>
	</tr>
	<% 
	 colorOn = "true"
DO WHILE NOT partner_prods_rel.EOF
on error resume next
%> 
  <form name="partnerUpdate" action="editDatabase.asp">
    <input type="hidden" name="tablename" value="partner_special_rel">
    <input type="hidden" name="reflink" value="editSpecailInstr.asp?<%= Request.QueryString %>">
    <input type="hidden" name="key" value="partner_special_relId">
    <input type="hidden" name="keyval" value="<%= partner_prods_rel.Fields("partner_special_relId") %>">
    <input type="hidden" name="partnerId" value="<%= partner_prods_rel.Fields("partnerId") %>">
  <tr <% if colorOn = "true" then %> bgcolor="#CCCCCC" <% colorOn = "false"%><% else %><% colorOn = "true"%><% end if %> >
    <td class="smlred" valign="top">
	What procedure should thes instructions show up on?<br>
	  <select class="sml" name="prodId">
<% DO WHILE NOT procedures.EOF
on error resume next
%>
	<option <%if procedures.Fields("prodId") = partner_prods_rel.Fields("prodId") then %>selected<% end if %> value="<% = procedures.Fields("prodId") %>"><% = procedures.Fields("prodId") %> - <% = procedures.Fields("text") %></option>
<% procedures.MoveNext
 Loop 
 procedures.MoveFirst
 %>
	</select><br>
	Enter plain text of the special instructions here:<br>
	<textarea name="text" cols="50" rows="8"><% = partner_prods_rel.Fields("text") %></textarea>
	</td>
	<td class="medred" valign="middle"><input class="altButtonFormat" type="submit" name="action" value="update"/>&nbsp;<input class="altButtonFormat" type="submit" name="action" value="delete"/></td>
	 </tr>
</form>
<% partner_prods_rel.MoveNext
 Loop %>

  <form name="partnerUpdate" action="editDatabase.asp">
  <input type="hidden" name="tablename" value="partner_special_rel">
    <input type="hidden" name="reflink" value="editSpecailInstr.asp?<%= Request.QueryString %>">
	<input type="hidden" name="partnerId" value="<%= partnerId %>">
  <tr><td class="med" colspan="2" height="30" valign="bottom">Use this area for new Special Instructions</td></tr>
    <tr> 
      <td class="smlred">What procedure should thes instructions show up on?
	  <select class="sml" name="prodId">
<% DO WHILE NOT procedures.EOF
on error resume next
%>
	<option value="<% = procedures.Fields("prodId") %>"><% = procedures.Fields("prodId") %> - <% = procedures.Fields("text") %></option>
<% procedures.MoveNext
 Loop %>
	</select><br>
	Enter plain text of the special instructions here:<br>
	<textarea name="text" cols="50" rows="8"></textarea></td>
      <td><input class="altButtonFormat" type="submit" name="action" value="insert"/></td></td>
    </tr>
  </form>

</table>
<!--#include file="footer.inc" -->
<img src="/image/000/top_cap2.gif" width="600"><div class="lrlines">
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
	<tr><td class="med" align="left">
<% pagename = "editSpecailInstr.asp" %>
<!--#include file="help.inc" -->
</td></tr></table>
</div>
<img src="/image/000/bottom_cap2.gif" width="600">