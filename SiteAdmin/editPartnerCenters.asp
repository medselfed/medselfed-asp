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

SQLString = "SELECT * FROM centers"
Set centers = objConn.Execute(SQLString)

SQLString = "SELECT * FROM partner_center_rel, centers where partner_center_rel.partnerId = '" & partnerId & "' and partner_center_rel.centerId = centers.centerId"
Set partner_center_rel = objConn.Execute(SQLString)

%>
<!--#include file="header.inc" -->
<script type="text/javascript">
var partner_center_rel = new Array()

function partner_center_relAry(centerId){
	this.centerId = centerId
}

function setCheckBoxes(){
	var frmObj = document.forms['0']
	
	for(var x = 0; x != frmObj.elements.length; x++){
		if(frmObj.elements[x].name == 'centerId'){
			for(var y = 0; y != partner_center_rel.length; y++){
				if(frmObj.elements[x].value == partner_center_rel[y].centerId){
					frmObj.elements[x].checked = true
				}
			}
		}
	}
}

function selectAllBoxes(){
var frmObj = document.forms['0']
	for(var x = 0; x != frmObj.elements.length; x++){
		if(frmObj.elements[x].name == 'centerId'){
			
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
DO WHILE NOT partner_center_rel.EOF
on error resume next
%>
partner_center_rel[<%= rowNum %>] = new partner_center_relAry('<%= partner_center_rel.Fields("centerId") %>')
<% 
rowNum = rowNum + 1
partner_center_rel.MoveNext
 Loop %>
</script>
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
	<tr><td class="med" align="left">Centers available to Partner: </font><font class="medred"><%= partnerId %></td><td align="right"><a href="editPartner.asp" class="sml">Back to Partners</a></td></tr>
</table>
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
   <form name="partnerUpdate" action="editDatabase.asp">
  <input type="hidden" name="tablename" value="partner_center_rel">
  <input type="hidden" name="reflink" value="editPartnerCenters.asp?<%= Request.QueryString %>">
  <input type="hidden" name="multiField" value="centerId">
  <input type="hidden" name="partnerId" value="<% = partnerId %>">
  <tr> 
    <td class="medred">Available Centers</td><td class="medred" align="right"><input class="altButtonFormat" type="submit" name="action" value="multi"/></td></tr>
  <tr> 
    <td class="sml" valign="top" colspan="2">
	<input type="checkbox" name="selectAll" onClick="selectAllBoxes()"> Select All<br>
<% 
DO WHILE NOT centers.EOF
on error resume next
%>
	<input type="checkbox" name="centerId" value="<% = centers.Fields("centerId") %>"><% = centers.Fields("centerId") %> - <% = centers.Fields("text") %>
<br>
<% centers.MoveNext
 Loop %>
</td>
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
<% pagename = "editPartnerCenters.asp" %>
<!--#include file="help.inc" -->
</td></tr></table>
</div>
<img src="/image/000/bottom_cap2.gif" width="600">