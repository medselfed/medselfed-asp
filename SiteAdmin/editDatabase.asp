<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
	' These NVP are for EHC Caching and Chrome Data
		tablename = Request.QueryString("tablename")
		reflink = Request.QueryString("reflink")
		action = Request.QueryString("action")
		key = Request.QueryString("key")
		keyval = Request.QueryString("keyval")
		multiField = Request.QueryString("multiField")
		partnerId = Request.QueryString("partnerId")
		
dim SQLString 
	SQLString = "desc "& tablename
dim RS            'connection Recordset
dim objConn        'connection object    
dim DSNtemp        'connection string    
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "DSN=MySqlDSN;database=medselfed_prod"
Set Rs = objConn.Execute(SQLString)


if action = "special" Then 

	dim fs, f 
	set fs=Server.CreateObject("Scripting.FileSystemObject") 
	set f=fs.CreateTextFile(Server.MapPath("/special/" & partnerId & "-" & Request.QueryString("prodId") & ".html")) 
	f.WriteLine(Request.QueryString("html"))
	
	SQLString = "insert into " & tablename & " (partnerId,prodId,url) values ('" & partnerId &"','" & Request.QueryString("prodId") &"','/special/" & partnerId & "-" & Request.QueryString("prodId") & ".html')"
	Set Rs = objConn.Execute(SQLString)

elseif action = "multi" Then

SQLString = "delete from " & tablename & " where partnerId = '" & partnerId & "'"
Set Rs = objConn.Execute(SQLString)

for x = 1 to Request.QueryString(multiField).Count
SQLString = "insert into " & tablename & " (partnerId," & Request.QueryString("multiField") &") values ('" & partnerId &"','" & Request.QueryString(multiField)(x) &"')"
Set Rs = objConn.Execute(SQLString)
next

elseif action = "update" Then
SQLString = "update " & tablename & " set "
	DO WHILE NOT Rs.EOF on error resume next
		newValue = Replace(Request.QueryString(Rs.Fields("Field")), "'", "\'")
		SQLString = SQLString + Rs.Fields("Field") & " = '" & newValue & "'"
		Rs.MoveNext

		if Rs.EOF Then
		else
			SQLString = SQLString + ", "
		end if
	Loop

	SQLString = SQLString + " where "& key & " = '" & keyval & "'"


	
	Set Rs = objConn.Execute(SQLString)
elseif action = "insert" Then
	SQLString = "insert into " & tablename & " ("
	DO WHILE NOT Rs.EOF on error resume next
	  if Request.QueryString(Rs.Fields("Field")) <> "" Then
		SQLString = SQLString + Rs.Fields("Field")
		Rs.MoveNext
		if Rs.EOF Then

		else
			SQLString = SQLString + ", "
		end if
	   else
	   	Rs.MoveNext	
	   end if
	Loop
	SQLString = SQLString + ") values ("
	Rs.MoveFirst
	DO WHILE NOT Rs.EOF on error resume next
	if Request.QueryString(Rs.Fields("Field")) <> "" Then
		SQLString = SQLString + "'" & Request.QueryString(Rs.Fields("Field")) & "'"
		Rs.MoveNext

		if Rs.EOF Then
		else
			SQLString = SQLString + ", "
		end if
	   else
	   	Rs.MoveNext	
	   end if
	Loop
	
	SQLString = SQLString + ")"
	
	Set Rs = objConn.Execute(SQLString)
elseif action = "delete" Then
	SQLString = "delete from " & tablename & " where "& key & " = '" & keyval & "'"
	Set Rs = objConn.Execute(SQLString)
end if
'******DEBUG******
'response.Write(SQLString)
'response.end
'*****************

response.Redirect(reflink)
%><%= SQLString %>
