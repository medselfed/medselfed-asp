<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 
 questionId =  Request.QueryString("questionId")

dim SQLString 
SQLString = "SELECT * FROM questions"


dim objConn        'connection object    
dim DSNtemp        'connection string    
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "DSN=MySqlDSN;database=medselfed_prod"

dim questions            'connection Recordset
Set questions = objConn.Execute(SQLString)

sub getAnswers(questionId)
	SQLString = "SELECT * FROM answers where questionId = '" & questionId & "'"
	dim answers            'connection Recordset
	Set answers = objConn.Execute(SQLString)
	
	response.write("<table cellpading=0 cellwidth=0 border=0 width=500>")
	DO WHILE NOT answers.EOF
	on error resume next
		response.write("<tr><td class=medred width=""50%"">")
		response.write(answers.Fields("text"))
		response.write("</td><td>")
			call getResponse(questionId,answers.Fields("answerId"))
		response.write("</td></tr>")
	answers.MoveNext 
	Loop 
	response.write("</table>")
end sub

dim totalUsersResp
sub getTotalResponses(questionId)
	SQLString = "SELECT * FROM users_choices where questionId = '" & questionId & "'"
	dim total_choices            'connection Recordset
	Set total_choices = objConn.Execute(SQLString)
	totalUsersResp = 0
	DO WHILE NOT total_choices.EOF
		on error resume next
			totalUsersResp = totalUsersResp + 1
		total_choices.MoveNext 
	Loop 
	response.write("&nbsp;<font class=sml>(" & totalUsersResp & " responses ) </font>")
end sub

dim totalUsers
sub getTotalUsers()
	SQLString = "SELECT sessionId FROM users_choices"
	dim total_users            'connection Recordset
	Set total_users = objConn.Execute(SQLString)
	totalUsers = 0
	currSession = ""
	DO WHILE NOT total_users.EOF
		on error resume next
			if currSession <> total_users.Fields("sessionId") Then
				totalUsers = totalUsers + 1
				currSession = total_users.Fields("sessionId")
			end if
		total_users.MoveNext 
	Loop 
	response.write("&nbsp;<font class=sml>(" & totalUsers & " total users ) </font>")
end sub

sub getResponse(questionId, answerId)
	SQLString = "SELECT * FROM users_choices where questionId = '" & questionId & "' and answerId = '" & answerId & "'"
	dim users_choices            'connection Recordset
	Set users_choices = objConn.Execute(SQLString)
	totalUsersAns = 0
	DO WHILE NOT users_choices.EOF
		on error resume next
			totalUsersAns = totalUsersAns + 1
		users_choices.MoveNext 
	Loop 
	totalPercentage = int((totalUsersAns / totalUsersResp) * 100)
	response.write("<table height=15><tr><td width=" & totalPercentage & " bgcolor=""#000000"">&nbsp;</td><td>" & totalPercentage & "%</tr></tr></table>")
end sub

%>
<!--#include file="header.inc" -->
<table cellpadding="5" align="center" cellspacing="0" border="0" width="95%">
	<tr><td class="med" align="left">MedSelfEd Responses <% call getTotalUsers() %></td></tr>
</table>
<%
colorOn = "true"
questionNum = 1
DO WHILE NOT questions.EOF
on error resume next

%>
<table cellpadding="2" align="center" cellspacing="0" width="95%" <% if colorOn = "true" then %> bgcolor="#CCCCCC" <% colorOn = "false"%><% else %><% colorOn = "true"%><% end if %>>
<tr><td class="med"><%= questionNum %>) <%= questions.Fields("text") %> <% call getTotalResponses(questions.Fields("questionId")) %></td></tr>
<tr><td colspan="2"><%call getAnswers(questions.Fields("questionId"))%></td></tr>
</table>
<% 
questionNum = questionNum + 1
questions.MoveNext 
Loop 
%>
<!--#include file="footer.inc" -->