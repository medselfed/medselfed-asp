<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 
 questionId =  Request.QueryString("questionId")

dim SQLString 
SQLString = "SELECT * FROM answers where questionId = " & questionId

dim RS            'connection Recordset
dim objConn        'connection object    
dim DSNtemp        'connection string    
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "DSN=MySqlDSN;database=medselfed_prod"
Set Rs = objConn.Execute(SQLString)

SQLString = "SELECT * FROM questions where questionId = " & questionId
Set Questions = objConn.Execute(SQLString)
%>
<!--#include file="header.inc" -->
<table cellpadding="5" align="center" cellspacing="0" border="0" width="95%">
	<tr><td class="med" align="left">MedSelfEd Answers</td><td align="right"><a href="editQuestions.asp" class="sml">Back to Questions</a></td></tr>
</table>
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
  <tr> 
    <td class="medred">Choices</td>
    <td class="medred">Action</td>
  </tr>
<%
colorOn = "true"
 DO WHILE NOT Rs.EOF
on error resume next
%>
  <form name="questionUpdate" action="editDatabase.asp">
  <input type="hidden" name="tablename" value="answers">
  <input type="hidden" name="reflink" value="editAnswers.asp?<%= Request.QueryString %>">
  <input type="hidden" name="key" value="answerId">
  <input type="hidden" name="keyval" value="<% = Rs.Fields("answerId") %>">
  <input type="hidden" name="answerId" value="<% = Rs.Fields("answerId") %>"/>
  <input type="hidden" name="questionId" value="<% = Rs.Fields("questionId") %>"/>
    <tr <% if colorOn = "true" then %> bgcolor="#CCCCCC" <% colorOn = "false"%><% else %><% colorOn = "true"%><% end if %>>
      <td class="smlred">Is this the correct choice?<br><select class="sml" name="correct">
<% if Rs.Fields("correct") = "Yes" Then %>
	  		<option value="Yes" selected>Yes</option>
			<option value="No">No</option>
<% else %>
	  		<option value="Yes">Yes</option>
			<option value="No" selected>No</option>
<% end if %>			
		</select><br>This is the text used for the choice:<br><textarea class="sml" name="text" cols="80" rows="3"><%= Rs.Fields("text") %></textarea></td>
      <td> <input class="altButtonFormat" type="submit" name="action" value="update"/>&nbsp;<input class="altButtonFormat" type="submit" name="action" value="delete"/> </td>
    </tr>
  </form>
<% Rs.MoveNext %>
<% Loop %> 
  <form name="partnerUpdate" action="editDatabase.asp">
  <input type="hidden" name="tablename" value="answers">
  <input type="hidden" name="reflink" value="editAnswers.asp?<%= Request.QueryString %>">
  <input type="hidden" name="questionId" value="<%= questionId %>"/>
  <tr><td class="med" colspan="2" height="30" valign="bottom">Use this area to add new choices</td></tr>
    <tr> 
      <td class="smlred">Is this the correct choice?<br><select class="sml" name="correct">
	  		<option value="Yes">Yes</option>
			<option value="No">No</option>			
		</select><br>This is the text used for the choice:<br><textarea class="sml" name="text" cols="80" rows="3"></textarea></td>
      <td><input class="altButtonFormat" type="submit" name="action" value="insert"/></td>
      </tr>
</form>
</table>
<!--#include file="footer.inc" -->
<img src="/image/000/top_cap2.gif" width="600"><div class="lrlines">
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
	<tr><td class="med" align="left">
<% pagename = "showAnswers.asp" %>
<!--#include file="help.inc" -->
</td></tr></table>
</div>
<img src="/image/000/bottom_cap2.gif" width="600">