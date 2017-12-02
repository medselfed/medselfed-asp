<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%

dim fs, f 
set fs=Server.CreateObject("Scripting.FileSystemObject") 

dim centers        'connection Recordset
dim objConn        'connection object    
dim DSNtemp        'connection string    
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "DSN=MySqlDSN;database=medselfed_prod"

SQLString = "SELECT * FROM centers"
Set centers = objConn.Execute(SQLString)

DO WHILE NOT centers.EOF 
	on error resume next

	set f=fs.CreateTextFile(Server.MapPath("/xml/center/" & centers.Fields("centerId") & ".xml")) 
	f.WriteLine("<?xml version=""1.0"" encoding=""UTF-8""?>")
	f.WriteLine("<preopData>")
	f.WriteLine("<pageHeader>" & centers.Fields("text") & "</pageHeader>")
	f.WriteLine("<siteId>" & centers.Fields("siteId") & "</siteId>")
	f.WriteLine("<startImage src=""/image/center/" & centers.Fields("centerId") & ".gif"" />")
	SQLString = "SELECT * FROM prods_center_rel, procedures where prods_center_rel.prodId = procedures.prodId and centerId = '" & centers.Fields("centerId") & "'"
	Set prods_center_rel = objConn.Execute(SQLString)
	
DO WHILE NOT prods_center_rel.EOF 
	on error resume next
		f.WriteLine("<centerElement prodId=""" & prods_center_rel.Fields("prodId") & """ prodImage=""/image/" & prods_center_rel.Fields("prodId") & "/" & prods_center_rel.Fields("prodId") & ".gif"">" & prods_center_rel.Fields("text") & "</centerElement>")
	prods_center_rel.MoveNext
Loop

	f.WriteLine("</preopData>")
	centers.MoveNext
Loop
response.Redirect("editCenters.asp")
%>