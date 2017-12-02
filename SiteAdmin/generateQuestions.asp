<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%

dim fs, f 
set fs=Server.CreateObject("Scripting.FileSystemObject") 

dim centers        'connection Recordset
dim objConn        'connection object    
dim DSNtemp        'connection string    
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "DSN=MySqlDSN;database=medselfed_prod"


	set f=fs.CreateTextFile(Server.MapPath("/xml/questions.xml")) 
	f.WriteLine("<?xml version=""1.0"" encoding=""UTF-8""?>")
	f.WriteLine("<preopData>")
	
	SQLString = "SELECT * FROM questions"
	Set questions = objConn.Execute(SQLString)
	
DO WHILE NOT questions.EOF 
	on error resume next
		f.WriteLine("<question questionId=""" & questions.Fields("questionId") & """ prodId=""" & questions.Fields("prodId") & """ secId=""" & questions.Fields("secId") & """>" & questions.Fields("text") & "</question>")
	questions.MoveNext
Loop

	SQLString = "SELECT * FROM answers"
	Set answers = objConn.Execute(SQLString)
	
DO WHILE NOT answers.EOF 
	on error resume next
		f.WriteLine("<answers answerId=""" & answers.Fields("answerId") & """ questionId=""" & answers.Fields("questionId") & """ correct=""" & answers.Fields("correct") & """>" & answers.Fields("text") & "</answers>")
	answers.MoveNext
Loop

	f.WriteLine("</preopData>")
response.Redirect("editQuestions.asp")
%>