<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 
dim DSNtemp        'connection string    
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "DSN=MySqlDSN;database=medselfed_prod"

SQLString = "SELECT * FROM centers"
Set centers = objConn.Execute(SQLString)

call makeSql("prods_center_rel",centers,"centerId")
response.Write(SQLString &"<br>")

call makeSql("partner_center_rel",centers,"centerId")
response.Write(SQLString &"<br>")

SQLString = "SELECT * FROM procedures"
Set procedures = objConn.Execute(SQLString)

call makeSql("prods_center_rel",procedures,"prodId")
response.Write(SQLString &"<br>")

call makeSql("partner_prods_rel",procedures,"prodId")
response.Write(SQLString &"<br>")

call makeSql("prods_gender_rel",procedures,"prodId")
response.Write(SQLString &"<br>")

call makeSql("prods_questions_rel",procedures,"prodId")
response.Write(SQLString &"<br>")

SQLString = "SELECT * FROM partners"
Set partners = objConn.Execute(SQLString)

call makeSql("partner_center_rel",partners,"partnerId")
response.Write(SQLString &"<br>")

call makeSql("partner_bodylink_rel",partners,"partnerId")
response.Write(SQLString &"<br>")

call makeSql("partner_prods_rel",partners,"partnerId")
response.Write(SQLString &"<br>")

call makeSql("partner_navlink_rel",partners,"partnerId")
response.Write(SQLString &"<br>")

call makeSql("partner_navdrop_rel",partners,"partnerId")
response.Write(SQLString &"<br>")

Sub makeSql(tablename,records,key)
SQLString = "delete from " & tablename & " where " & key & " not in ("
DO WHILE NOT records.EOF
on error resume next
SQLString = SQLString + "'" & records.Fields(key) & "'"
records.MoveNext
if records.EOF Then
	SQLString = SQLString + ")"
else
	SQLString = SQLString + ", "
end if
Loop
records.moveFirst

Set rs = objConn.Execute(SQLString)
end sub
%>
