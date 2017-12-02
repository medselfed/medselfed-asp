<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
dim objConn        'connection object    
dim DSNtemp        'connection string    
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "DSN=medselfed_emkt;database=medselfed_emkt"

' THIS VARIABLE SETS THE RADIUS IN MILES
 iRadius =  Request.QueryString("radius")
 iZip =  Request.QueryString("zip")
 
if iZip = "" Then
Dim objHttp, strQuery
license_key = "sPhhJgFli70S"
ipaddress =  Request.Servervariables("REMOTE_HOST")

strQuery = "http://maxmind.com:8010/b?l=" & license_key & _
	"&i=" & ipaddress
set objHttp = Server.CreateObject("Msxml2.ServerXMLHTTP")
objHttp.open "GET", strQuery, false
objHttp.send
strLocation =  objHttp.ResponseText
Set objHttp = Nothing
aryLocation = Split(strLocation,",")
iStartLat = aryLocation(3)
iStartLong = aryLocation(4)
%>
Here is your location:<br>
Country: <%= aryLocation(0) %><br>
State: <%= aryLocation(1) %><br>
City: <%= aryLocation(2) %><br>
Latitude: <%= aryLocation(3) %><br>
Longitude: <%= aryLocation(4) %><br>
<%
else 

SQLString = "select Latitude, Longitude, City, State, ZipCode from locations where ZipCode = " & iZip
Set zipLocs = objConn.Execute(SQLString)
DO WHILE NOT zipLocs.EOF 
	on error resume next
	
	iStartLat = zipLocs.Fields("Latitude") 
	istartlong = zipLocs.Fields("Longitude")
%>
Location:<br>
State: <%= zipLocs.Fields("State") %><br>
City: <%= zipLocs.Fields("City") %><br>
Latitude: <%= zipLocs.Fields("Latitude") %><br>
Longitude: <%= zipLocs.Fields("Longitude") %><br><br>
<%

zipLocs.MoveNext
Loop

end if

LatRange = iradius / ((6076 / 5280) * 60)
LongRange = iRadius / (((cos(cdbl(iStartLat * _
            3.141592653589 / 180)) * 6076.) / 5280.) * 60)

LowLatitude = istartlat - LatRange
HighLatitude = istartlat + LatRange
LowLongitude = istartlong - LongRange
HighLongitude = istartlong + LongRange

%>
LowLatitude: <%= LowLatitude %><br>
HighLatitude: <%= HighLatitude %><br>
LowLongitude: <%= LowLongitude %><br>
HighLongitude: <%= HighLongitude %><br>
<br>
<br>
Hosptials <%= iradius %> Miles from <%= iZip %>:<br>
<%


	SQLString = "select url, city, state from partners, locations where zip = ZipCode and Latitude <= " & HighLatitude & " AND Latitude >= " & LowLatitude & " AND Longitude >= " & LowLongitude & " AND Longitude <= " & HighLongitude

Set locations = objConn.Execute(SQLString)

'SQLString = "select url from partners"

DO WHILE NOT locations.EOF 
	on error resume next
%>
<% = locations.Fields("url") %> in <% = locations.Fields("city") %>, <% = locations.Fields("state") %><br>
<%
locations.MoveNext
Loop
%>