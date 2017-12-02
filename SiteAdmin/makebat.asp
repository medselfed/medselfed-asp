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
set SubDomian="<% = Rs.Fields("partnerId") %>"<br>
LogParser "SELECT date, time, c-ip, cs-username, s-ip, s-port, cs-method, cs-uri-stem, cs-uri-query, sc-status, sc-bytes, cs-bytes, time-taken, cs-version, cs-host, cs(User-Agent), cs(Referer) from %ServerLog% where cs-host = '%subDomian%.%Domain%'" -o:W3C -q:ON > %LogRoot%%SubDomian%%YesterDay%.log<br>
<br>  <% Rs.MoveNext %>
  <% Loop %>