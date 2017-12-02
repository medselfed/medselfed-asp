<%
dim objConn        'connection object    
dim DSNtemp        'connection string    
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "DSN=MySqlDSN;database=medselfed_emkt"

if prodId <> "" Then
SQLString = "select keyword from keywords a where a.prodId = '" & prodId & "' and rank < 5 order by rank"
Set keywords = objConn.Execute(SQLString)

%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Expires" content="Mon, 01 Jan 1996 01:01:01 GMT">
<meta http-equiv="Pragma" content="no-cache">	
<meta name="description" content="Preop.com Patient Education is a comprehensive guide to medical surgery procedures online including videos, slide shows,  pictures and other media-flexible content">

<meta name="keywords" content="<%
DO WHILE NOT keywords.EOF 
	on error resume next
	divText = divText + keywords.Fields("keyword") + ", "
%><%= keywords.Fields("keyword") %>,<%
keywords.MoveNext
Loop
%>">
<% end if %>