<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 
 orderBy =  Request.QueryString("orderBy")
 createNew =  Request.QueryString("createNew")

dim SQLString 
if orderBy <> "" Then
	SQLString = "Select * from procedures order by " & orderBy
else 
	SQLString = "Select * from procedures"
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
	<tr><td class="med" align="left">MedSelfEd Procedures</td><td align="right"><a href="generateXML.asp" class="sml">Generate XML</a></td></tr>
</table>
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
  <tr> 
    <td class="medred">Prod ID</td>
	<td class="medred"></td>
    <td class="medred"></td>
    <td class="medred">Action</td>
  </tr>
<% if createNew = "" then
colorOn = "true"

DO WHILE NOT Rs.EOF
on error resume next
%>
  <form name="partnerUpdate" action="editDatabase.asp">
  <input type="hidden" name="tablename" value="procedures">
  <input type="hidden" name="reflink" value="editProds.asp?<%= Request.QueryString %>">
  <input type="hidden" name="key" value="prodId">
  <input type="hidden" name="keyval" value="<% = Rs.Fields("prodId") %>">
  <input type="hidden" name="prodId" value="<% = Rs.Fields("prodId") %>">
  <input type="hidden" name="dvd_price" value="<% = Rs.Fields("dvd_price") %>">
  <input type="hidden" name="day_price" value="<% = Rs.Fields("day_price") %>">
  <input type="hidden" name="stream_price" value="<% = Rs.Fields("stream_price") %>">
  <tr <% if colorOn = "true" then %> bgcolor="#CCCCCC" <% else %><% end if %> >
    <td class="sml" align="center"><% = Rs.Fields("prodId") %></td>
    <td class="sml"><span class="medred">Site ID </span><input class="sml" type="text" size="10" maxlength="10" name="siteId" value="<% = Rs.Fields("siteId") %>"/></td>
    <td class="sml"><span class="medred">Text </span><input class="sml" type="text" size="50" maxlength="100" name="text" value="<% = Rs.Fields("text") %>"/></td>
    <td class="sml"><input class="altButtonFormat" type="submit" name="action" value="update"/>&nbsp;<input class="altButtonFormat" type="submit" name="action" value="delete"/></td>
  </tr>
   <tr <% if colorOn = "true" then %> bgcolor="#CCCCCC" <% else %><% end if %> >
    <td class="sml" align="center"></td>
    <td class="sml" colspan="2"><span class="medred">Title </span><input class="sml" type="text" size="80" maxlength="255" name="title" value="<% = Rs.Fields("title") %>"/></td>
    <td class="sml"></td>
  </tr>
  <tr <% if colorOn = "true" then %> bgcolor="#CCCCCC" <% else %><% end if %> >
    <td class="sml" align="center" valign="top"></td>
    <td class="sml" colspan="2" valign="top"><span class="medred">Description </span><textarea class="sml" rows="3" cols="65" maxlength="255" name="description"><% = Rs.Fields("description") %></textarea></td>
    <td class="sml"></td>
  </tr>
  <tr <% if colorOn = "true" then %> bgcolor="#CCCCCC" <% else %><% end if %> >
    <td class="sml" align="center"></td>
    <td class="sml" colspan="2" valign="top"><span class="medred">FLV </span><input class="sml" type="text" size="80" maxlength="255" name="flv" value="<% = Rs.Fields("flv") %>"/></td>
    <td class="sml"></td>
  </tr>
  <tr <% if colorOn = "true" then %> bgcolor="#CCCCCC" <% colorOn = "false"%><% else %><% colorOn = "true"%><% end if %> >
    <td class="sml" align="center" valign="top"></td>
    <td class="sml" colspan="2"><span class="medred">Image </span><input class="sml" type="text" size="76" maxlength="255" name="image" value="<% = Rs.Fields("image") %>"/></td>
    <td class="sml"></td>
  </tr>
</form>
<% Rs.MoveNext
 Loop %>
<% else %>
  <form name="partnerUpdate" action="editDatabase.asp">
  <input type="hidden" name="tablename" value="procedures">
  <input type="hidden" name="reflink" value="editProds.asp?<%= Request.QueryString %>">

  <input type="hidden" name="dvd_price" value="0">
  <input type="hidden" name="day_price" value="0">
  <input type="hidden" name="stream_price" value="0">
  <tr>
    <td class="sml"><input class="sml" type="text" size="10" maxlength="10" name="prodId" value=""/></td>
    <td class="sml"><span class="medred">Site ID </span><input class="sml" type="text" size="10" maxlength="10" name="siteId" value=""/></td>
    <td class="sml"><span class="medred">Text </span><input class="sml" type="text" size="50" maxlength="100" name="text" value=""/></td>
    <td class="sml"><input class="altButtonFormat" type="submit" name="action" value="insert"/></td>
  </tr>
   <tr >
    <td class="sml" align="center"></td>
    <td class="sml" colspan="2"><span class="medred">Title </span><input class="sml" type="text" size="80" maxlength="255" name="title" value=""/></td>
    <td class="sml"></td>
  </tr>
  <tr >
    <td class="sml" align="center" valign="top"></td>
    <td class="sml" colspan="2" valign="top"><span class="medred">Description </span><textarea class="sml" rows="3" cols="65" maxlength="255" name="description"></textarea></td>
    <td class="sml"></td>
  </tr>
  <tr >
    <td class="sml" align="center"></td>
    <td class="sml" colspan="2" valign="top"><span class="medred">FLV </span><input class="sml" type="text" size="80" maxlength="255" name="flv" value=""/></td>
    <td class="sml"></td>
  </tr>
  <tr >
    <td class="sml" align="center" valign="top"></td>
    <td class="sml" colspan="2"><span class="medred">Image </span><input class="sml" type="text" size="76" maxlength="255" name="image" value=""/></td>
    <td class="sml"></td>
  </tr>


  <!-- OLD

  <tr bgcolor="#CCCCCC"> 
    <td class="sml"><input class="sml" type="text" size="10" maxlength="10" name="prodId" value=""/></td>
    <td class="sml"><input class="sml" type="text" size="10" maxlength="10" name="siteId" value=""/></td>
    <td class="sml"><input class="sml" type="text" size="50" maxlength="100" name="text" value=""/></td>
    <td class="sml" colspan="2"><input class="altButtonFormat" type="submit" name="action" value="insert"/></td>
  </tr>

  -->

<% end if %>
</table>
<!--#include file="footer.inc" -->
<img src="/image/000/top_cap2.gif" width="600"><div class="lrlines">
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
	<tr><td class="med" align="left">
<% pagename = "editProds.asp" %>
<!--#include file="help.inc" -->
</td></tr></table>
</div>
<img src="/image/000/bottom_cap2.gif" width="600">