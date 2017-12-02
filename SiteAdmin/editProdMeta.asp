<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 
	prodId = Request.QueryString("prodId")

dim SQLString 
dim procedures      'connection Recordset
dim prods_center_rel 'connection Recordset
dim objConn         'connection object    
dim DSNtemp         'connection string    
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "DSN=MySqlDSN;database=medselfed_prod"

SQLString = "SELECT * FROM prod_meta_rel where prodId = '" & prodId & "'"
Set prod_meta_rel = objConn.Execute(SQLString)

SQLString = "SELECT * FROM procedures where prodId = '" & prodId & "'"
Set procedures = objConn.Execute(SQLString)

%>
<!--#include file="header.inc" -->
    <table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
      <tr>
        <td class="med" align="left">Procedure Meta Information</td>
        <td align="right"><a href="editProds.asp" class="sml">Back to Procedure</a></td>
      </tr>
      <tr>
        <td class="med" colspan="2">These are the meta tags for procedure:<br>
          <font class="medred"><%= procedures.fields("text") %></font></td>
      </tr>
    </table>
    <table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
      <tr> 
        <td class="medred">Meta Tags</td>
        <td class="medred">Action</td>
      </tr>
      <% 
DO WHILE NOT prod_meta_rel.EOF
on error resume next
%>
      <form name="partnerUpdate" action="editDatabase.asp">
        <input type="hidden" name="tablename" value="prods_center_rel">
        <input type="hidden" name="reflink" value="editProdsMeta.asp?<%= Request.QueryString %>">
        <input type="hidden" name="key" value="prod_meta_relId">
        <input type="hidden" name="keyval" value="<% = prod_meta_rel.Fields("prod_meta_relId") %>">
        <input type="hidden" name="prodId" value="<% = prod_meta_rel.Fields("prodId") %>">
        <tr> 
          <td class="sml"><% = prod_meta_rel.Fields("prodId") %></td>
          <td class="sml"><input class="altButtonFormat" type="submit" name="action" value="insert"/>&nbsp;<input class="altButtonFormat" type="submit" name="action" value="delete"/></td>
        </tr>
      </form>
      <% prod_meta_rel.MoveNext
 Loop %>
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