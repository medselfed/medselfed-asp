<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 
 orderBy =  Request.QueryString("orderBy")
 createNew =  Request.QueryString("createNew")
 
dim SQLString 
if orderBy <> "" Then
	SQLString = "SELECT * FROM questions order by " & orderBy
else 
	SQLString = "SELECT * FROM questions"
end if

dim RS            'connection Recordset
dim objConn        'connection object    
dim DSNtemp        'connection string    
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "DSN=MySqlDSN;database=medselfed_prod"
Set Rs = objConn.Execute(SQLString)

SQLString = "SELECT * FROM procedures"
Set procedures = objConn.Execute(SQLString)

%>
<!--#include file="header.inc" -->
<table cellpadding="5" align="center" cellspacing="0" border="0" width="95%">
	<tr><td class="med" align="left">MedSelfEd Questions&nbsp;&nbsp;&nbsp;&nbsp;</td><td align="right"><a href="generateQuestions.asp" class="sml">Generate XML</a></td></tr>
</table>
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
  <tr> 
    <td class="medred">Questions</td>
    <td class="medred">Action</td>
    <td class="medred">Edit Answers</td>
  </tr>
<% if createNew = "" then
colorOn = "true"
 DO WHILE NOT Rs.EOF
on error resume next
%>
  <form name="questionUpdate<% = Rs.Fields("questionId") %>" action="editDatabase.asp">
  <input type="hidden" name="tablename" value="questions">
  <input type="hidden" name="reflink" value="editQuestions.asp?<%= Request.QueryString %>">
  <input type="hidden" name="key" value="questionId">
  <input type="hidden" name="keyval" value="<% = Rs.Fields("questionId") %>">
  <input type="hidden" name="questionId" value="<% = Rs.Fields("questionId") %>"/>
  <tr <% if colorOn = "true" then %> bgcolor="#CCCCCC" <% colorOn = "false"%><% else %><% colorOn = "true"%><% end if %> >
      <td class="smlred">Show Question on Procedure:<br>
	  <select class="sml" name="prodId">
	  	<option value="all">all</option>
<% DO WHILE NOT procedures.EOF
on error resume next

if Rs.Fields("prodId") = procedures.Fields("prodId") then
%>
	<option selected value="<% = procedures.Fields("prodId") %>"><% = procedures.Fields("prodId") %> - <% = procedures.Fields("text") %></option>
<%
else
%>
	<option value="<% = procedures.Fields("prodId") %>"><% = procedures.Fields("prodId") %> - <% = procedures.Fields("text") %></option>
<%
end if
 procedures.MoveNext
 Loop 
 procedures.MoveFirst
 %>
	</select><br>Enter the text for your question:<br><textarea class="sml" name="text" cols="80" rows="3"><%= Rs.Fields("text") %></textarea></td>
      <td valign="middle"><input class="altButtonFormat" type="submit" name="action" value="update"/>&nbsp;<input class="altButtonFormat" type="submit" name="action" value="delete"/> </td>
      <td valign="middle" align="center"><a href="editAnswers.asp?questionId=<% = Rs.Fields("questionId") %>" class="sml">Edit Answers</a></tr>
  </form>
<% Rs.MoveNext %>
<% Loop %> 
<% else %>
  <form name="partnerUpdate" action="editDatabase.asp">
  <input type="hidden" name="tablename" value="questions">
  <input type="hidden" name="reflink" value="editQuestions.asp">
    <tr bgcolor="#CCCCCC">
  	 <td valign="middle" class="smlred">Show Question on Procedure:<br><select class="sml" name="prodId">
	  	<option value="all">all</option>
<% DO WHILE NOT procedures.EOF
on error resume next
%>
	<option value="<% = procedures.Fields("prodId") %>"><% = procedures.Fields("prodId") %> - <% = procedures.Fields("text") %></option>
<% procedures.MoveNext
 Loop %>
	</select><br>Enter the text for your question:<br><textarea class="sml" name="text" cols="80" rows="3"></textarea></td>
      <td colspan="3" valign="middle"><input class="altButtonFormat" type="submit" name="action" value="insert"/>
        </td></td>
      </tr>
</form>
<% end if %>
</table>
<!--#include file="footer.inc" -->
<img src="/image/000/top_cap2.gif" width="600"><div class="lrlines">
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
	<tr><td class="med" align="left">
<% pagename = "editQuestions.asp" %>
<!--#include file="help.inc" -->
</td></tr></table>
</div>
<img src="/image/000/bottom_cap2.gif" width="600">