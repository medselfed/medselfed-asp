<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 
 orderBy =  Request.QueryString("orderBy")
 createNew =  Request.QueryString("createNew")
 
dim SQLString 
if orderBy <> "" Then
	SQLString = "SELECT * FROM partners order by " & orderBy
else 
	SQLString = "SELECT * FROM partners"
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
	<tr><td class="med" align="left">MedSelfEd Partners</td></tr></table>
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
  <tr> 
    <td class="medred" colspan="2">Partner Information</td>
	<td class="medred">Action</td>
    <td class="medred">Options</td>
  </tr>
<% if createNew = "" then
colorOn = "true"
 DO WHILE NOT Rs.EOF
on error resume next
%>
  <form name="partnerUpdate" action="editDatabase.asp">
    <input type="hidden" name="tablename" value="partners">
    <input type="hidden" name="reflink" value="editPartner.asp?<%= Request.QueryString %>">
    <input type="hidden" name="key" value="partnerId">
    <input type="hidden" name="keyval" value="<% = Rs.Fields("partnerId") %>">
    <input type="hidden" name="partnerId" value="<% = Rs.Fields("partnerId") %>">
	<input type="hidden" name="jsDir" value="<%= Rs.Fields("jsDir") %>">
	<tr><td colspan="4"> <font class="med">Partner ID: <% = Rs.Fields("partnerId") %></font></td></tr>
  <tr <% if colorOn = "true" then %> bgcolor="#CCCCCC" <% colorOn = "false"%><% else %><% colorOn = "true"%><% end if %> >
      <td class="smlred">Parters Name:<br>
	  	<input class="sml" type="text" size="35" name="name" value="<%= Rs.Fields("name") %>">
        <br>Show the header?<br>
        <select name="headerType" class="sml">
          <% if Rs.Fields("headerType") = "true" then %>
          <option selected>true</option>
          <option >false</option>
          <% elseif Rs.Fields("headerType") = "false" then %>
          <option >true</option>
          <option selected>false</option>
          <% end if %>
        </select>
        <br>Header Text:<br>
        <input class="sml" type="text" size="35" name="headerName" value="<%= Rs.Fields("headerName") %>">
        <br>Access to PostCare?<br>
        <select name="postcare" class="sml">
          <% if Rs.Fields("postcare") = "true" then %>
          <option selected>true</option>
          <option >false</option>
          <% elseif Rs.Fields("postcare") = "false" then %>
          <option >true</option>
          <option selected>false</option>
          <% end if %>
        </select></td>
      <td class="smlred">Procedure layout?<br>
        <select name="prodLayout" class="sml">
	<option value="0" <% if Rs.Fields("prodLayout") = "0" then %>selected<% end if %>>Standard</option>
	<option value="1" <% if Rs.Fields("prodLayout") = "1" then %>selected<% end if %>>Single Video</option>
	   </select>
        <br>Show advertising?<br>
        <select name="showads" class="sml">
          <% if Rs.Fields("showads") = "true" then %>
          <option selected>true</option>
          <option >false</option>
          <% elseif Rs.Fields("showads") = "false" then %>
          <option >true</option>
          <option selected>false</option>
          <% end if %>
        </select>
        <br>Style sheet directory:<br>
        <select name="cssDir" class="sml">
	<option value="/css/main" <% if Rs.Fields("cssDir") = "/css/main" then %>selected<% end if %>>Standard</option>
	<option value="/css/preop" <% if Rs.Fields("cssDir") = "/css/preop" then %>selected<% end if %>>Standard /w Stripes</option>
	<option value="/css/sample" <% if Rs.Fields("cssDir") = "/css/sample" then %>selected<% end if %>>Sample</option>
        </select>
		        <br>Show questions:<br>
        <select name="questions" class="sml">
	<option value="1" <% if Rs.Fields("questions") = "1" then %>selected<% end if %>>Yes</option>
	<option value="0" <% if Rs.Fields("questions") = "0" then %>selected<% end if %>>No</option>
        </select> 
        </td>
       <td> <input class="altButtonFormat" type="submit" name="action" value="update"/>
        <input class="altButtonFormat" type="submit" name="action" value="delete"/> </td>
      <td class="sml"><a href="editPartnerBar.asp?partnerId=<% = Rs.Fields("partnerId") %>">navigation</a><br> 
        <a href="editPartnerCenters.asp?partnerId=<% = Rs.Fields("partnerId") %>">centers</a><br> 
        <a href="editPartnerProds.asp?partnerId=<% = Rs.Fields("partnerId") %>">procedures</a><br> 
        <a href="editSpecailInstr.asp?partnerId=<% = Rs.Fields("partnerId") %>">special instructions</a><br>
		<a href="generatePartner.asp?partnerId=<% = Rs.Fields("partnerId") %>">Generate 
        XML</a><br>
		<a href="http://<% = Rs.Fields("partnerId") %>.medselfed.com/asp/home.asp" target="_blank">Go To Site</a><br></td>
    </tr>
  </form>
  <% Rs.MoveNext %>
  <% Loop %>
  <% else %>
  <form name="partnerUpdate" action="editDatabase.asp">
    <input type="hidden" name="tablename" value="partners">
    <input type="hidden" name="reflink" value="editPartner.asp">
	<input type="hidden" name="jsDir" value="/js/preop">
    <tr bgcolor="#CCCCCC"> 
      <td class="smlred">
	  Partner ID:<br>
	  <input class="sml" type="text" size="5" name="partnerId" value=""/>
	  <br>Parters Name:<br>
	  <input class="sml" type="text" size="35" name="name" value=""/>
        <br>Show the header?<br>
        <select name="headerType" class="sml">
          <option selected>true</option>
          <option >false</option>
        </select>
         <br>Text used in the Header:<br>
        <input class="sml" type="text" size="35" name="headerName" value=""/>
        <br>Access to PostCare related tasks?<br>
        <select name="postcare" class="sml">
          <option selected>true</option>
          <option >false</option>
        </select></td>
      <td class="smlred">What procedure layout is to be used?<br>
        <select name="prodLayout" class="sml">
	<option value="0" >Standard</option>
	<option value="1" >Single Video</option>
	   </select>
        <br>Show our affiate advertising?<br>
        <select name="showads" class="sml">
          <option selected>true</option>
          <option >false</option>
        </select>
        <br>Style sheet directory:<br>
        <select name="cssDir" class="sml">
	<option value="/css/main" >Standard</option>
	<option value="/css/preop" >Standard /w Stripes</option>
	<option value="/css/sample" >Sample</option>
        </select> 
        </td>
	  <td colspan="3"><input class="altButtonFormat" type="submit" name="action" value="insert"/></td></td>
    </tr>
  </form>
 <% end if %>
</table>
<!--#include file="footer.inc" -->
<img src="/image/000/top_cap2.gif" width="600"><div class="lrlines">
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
	<tr><td class="med" align="left">
<% pagename = "editPartner.asp" %>
<!--#include file="help.inc" -->
</td></tr></table>
</div>
<img src="/image/000/bottom_cap2.gif" width="600">