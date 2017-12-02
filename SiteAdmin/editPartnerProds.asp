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

SQLString = "SELECT * FROM procedures order by text"
Set procedures = objConn.Execute(SQLString)

SQLString = "SELECT * FROM partner_prods_rel, procedures where partnerId = '" & partnerId & "' and partner_prods_rel.prodId = procedures.prodId"
Set partner_prods_rel = objConn.Execute(SQLString)

%>
<!--#include file="header.inc" -->
<script type="text/javascript">
var partner_prods_rel = new Array()

function partner_prods_relAry(prodId){
	this.prodId = prodId
}

function setCheckBoxes(){
	var frmObj = document.forms['0']
	
	for(var x = 0; x != frmObj.elements.length; x++){
		if(frmObj.elements[x].name == 'prodId'){
			for(var y = 0; y != partner_prods_rel.length; y++){
				if(frmObj.elements[x].value == partner_prods_rel[y].prodId){
					frmObj.elements[x].checked = true
				}
			}
		}
	}
}

function selectAllBoxes(){
var frmObj = document.forms['0']
	for(var x = 0; x != frmObj.elements.length; x++){
		if(frmObj.elements[x].name == 'prodId'){
			
			if(frmObj.selectAll.checked){
				frmObj.elements[x].checked = true
			} else {
				frmObj.elements[x].checked = false
			}
		}
	}
}

<% 
rowNum = 0
DO WHILE NOT partner_prods_rel.EOF
on error resume next
%>
partner_prods_rel[<%= rowNum %>] = new partner_prods_relAry('<%= partner_prods_rel.Fields("prodId") %>')
<% 
rowNum = rowNum + 1
partner_prods_rel.MoveNext
 Loop 
 halfrowNum = rowNum / 2
 %>
</script>
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
	<tr><td class="med" align="left">Procedures available to Partner: </font><font class="medred"><%= partnerId %></td><td align="right"><a href="editPartner.asp" class="sml">Back to Partners</a></td></tr></table>
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
  <form name="partnerUpdate" action="editDatabase.asp">
  <input type="hidden" name="tablename" value="partner_prods_rel">
  <input type="hidden" name="reflink" value="editPartnerProds.asp?<%= Request.QueryString %>">
  <input type="hidden" name="multiField" value="prodId">
    <input type="hidden" name="partnerId" value="<% = partnerId %>">
	    <td class="medred">Available Procedures</td><td class="medred" align="right"><input class="altButtonFormat" type="submit" name="action" value="multi"/></td></tr>
  <tr> 
    <td class="sml" valign="top">
	<input type="checkbox" name="selectAll" onClick="selectAllBoxes()"> Select All<br>
<% 
rowNum = 0
DO WHILE NOT procedures.EOF
on error resume next
%>
	<input type="checkbox" name="prodId" value="<% = procedures.Fields("prodId") %>"><% = procedures.Fields("prodId") %> - <% = procedures.Fields("text") %>
<br>
<% if rowNum = 38 Then %>
</td><td  class="sml" valign="top">
<% end if %>
<% 
rowNum = rowNum + 1
procedures.MoveNext
 Loop %></td>
  </tr>
</form>
</table>
<script type="text/javascript">
setCheckBoxes()
</script>
<!--#include file="footer.inc" -->
<img src="/image/000/top_cap2.gif" width="600"><div class="lrlines">
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
	<tr><td class="med" align="left">
<% pagename = "editPartnerProds.asp" %>
<!--#include file="help.inc" -->
</td></tr></table>
</div>
<img src="/image/000/bottom_cap2.gif" width="600">