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

SQLString = "SELECT * FROM partners where partnerId = '" & partnerId & "'"
Set partners = objConn.Execute(SQLString)

%>
<!--#include file="header.inc" -->
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
	<tr><td class="med" align="left">Discliamer for Partner: </font><font class="medred"><%= partnerId %></td><td align="right"><a href="editPartner.asp" class="sml">Back to Partners</a></td></tr></table>
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
  <tr> 
    <td class="medred" valign="top">Discliamer Text</td>
	<td class="medred" valign="top">Action</td>
	</tr>
  <form name="partnerUpdate" action="editDatabase.asp">
    <input type="hidden" name="tablename" value="partners">
    <input type="hidden" name="reflink" value="editDiscliamer.asp?<%= Request.QueryString %>">
    <input type="hidden" name="key" value="partnerId">
	<input type="hidden" name="keyval" value="<%= partners.Fields("partnerId") %>">
    <input type="hidden" name="partnerId" value="<% = partners.Fields("partnerId") %>">
	<input type="hidden" name="name" value="<% = partners.Fields("name") %>">
	<input type="hidden" name="headerType" value="<% = partners.Fields("headerType") %>"> 
	<input type="hidden" name="showads" value="<% = partners.Fields("showads") %>"> 
	<input type="hidden" name="prodLayout" value="<% = partners.Fields("prodLayout") %>"> 
	<input type="hidden" name="cssDir" value="<% = partners.Fields("cssDir") %>"> 
	<input type="hidden" name="jsDir" value="<% = partners.Fields("jsDir") %>"> 
	<input type="hidden" name="postcare" value="<% = partners.Fields("postcare") %>"> 
	<input type="hidden" name="headerName" value="<% = partners.Fields("headerName") %>"> 
	<input type="hidden" name="questions" value="<% = partners.Fields("questions") %>"> 
  <tr bgcolor="#FFFFFF">
    <td class="smlred" valign="top">
	Enter plain text of the discliamer here:<br>
	<textarea name="discliamer" class="sml" rows="8" cols="100" wrap="hard"><% = partners.Fields("discliamer") %></textarea>
	</td>
	<td class="medred" valign="middle">
	<input class="altButtonFormat" type="submit" name="action" value="update"/></td>
 </tr>
</form>
</table>
<!--#include file="footer.inc" -->
<img src="/image/000/top_cap2.gif" width="600"><div class="lrlines">
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
	<tr><td class="med" align="left">
<% pagename = "editDiscliamer.asp" %>
<!--#include file="help.inc" -->
</td></tr></table>
</div>
<img src="/image/000/bottom_cap2.gif" width="600">