<%
Dim objHttp, strQuery
license_key = "sPhhJgFli70S"
ipaddress =  Request.Servervariables("REMOTE_HOST")

strQuery = "http://maxmind.com:8010/b?l=" & license_key & _
	"&i=" & ipaddress
set objHttp = Server.CreateObject("Msxml2.ServerXMLHTTP")
objHttp.open "GET", strQuery, false
objHttp.send
Response.Write objHttp.ResponseText
Set objHttp = Nothing

%>