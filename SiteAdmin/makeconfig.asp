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

<% 

 DO WHILE NOT Rs.EOF
on error resume next
%>
        <server url="http://<% = Rs.Fields("partnerId") %>.medselfed.com" name="MedSelfEd (<% = Rs.Fields("partnerId") %>)">
            <logfile format="auto">C:\web\medselfed\logs\parsedLogs\<% = Rs.Fields("partnerId") %>*.*</logfile>
        </server>
<br>  <% Rs.MoveNext %>
  <% Loop %>