<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 

	sessionNum = Request.QueryString("sessionNum")
	partnerId = Request.QueryString("partnerId")
	questionId = Request.QueryString("questionId")
	answerId = Request.QueryString("answerId")
	
	dim SQLString 
	SQLString = "insert into users_choices (partnerId,sessionId,questionId,answerId) values ('" & partnerId &"','" & sessionNum & "','" & questionId & "','" & answerId & "')"
	dim RS            'connection Recordset
	dim objConn        'connection object    
	dim DSNtemp        'connection string    
	Set objConn = Server.CreateObject("ADODB.Connection")
	objConn.Open "DSN=MySqlDSN;database=medselfed_prod"
	Set Rs = objConn.Execute(SQLString)
	
	Session("question" & questionId) = answerId

%>
