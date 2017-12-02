<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
	 partnerId =  Request.QueryString("partnerId")

dim fs, f 
set fs=Server.CreateObject("Scripting.FileSystemObject") 

dim centers        'connection Recordset
dim objConn        'connection object    
dim DSNtemp        'connection string    
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "DSN=MySqlDSN;database=medselfed_prod"

SQLString = "SELECT * FROM partners where partnerId like '" & partnerId & "'"

Set partners = objConn.Execute(SQLString)

DO WHILE NOT partners.EOF 
	on error resume next


	set f=fs.CreateTextFile(Server.MapPath("/xml/partners/" & partners.Fields("partnerId") & ".xml"))
	f.WriteLine("<?xml version=""1.0"" encoding=""iso-8859-1""?>")
	f.WriteLine("<preopData>")
	f.WriteLine("<partnerId>" & partners.Fields("partnerId") & "</partnerId>")
	f.WriteLine("<name>" & partners.Fields("name") & "</name>")
	f.WriteLine("<subDomain>" & partners.Fields("subDomain") & "</subDomain>")
	f.WriteLine("<headerType>" & partners.Fields("headerType") & "</headerType>")
	f.WriteLine("<headerName>" & partners.Fields("headerName") & "</headerName>")
	f.WriteLine("<cssDir>" & partners.Fields("cssDir") & "</cssDir>")
	f.WriteLine("<jsDir>" & partners.Fields("jsDir") & "</jsDir>")
	f.WriteLine("<postcare>" & partners.Fields("postcare") & "</postcare>")
	f.WriteLine("<prodLayout>" & partners.Fields("prodLayout") & "</prodLayout>")
	f.WriteLine("<showads>" & partners.Fields("showads") & "</showads>")
	f.WriteLine("<questions>" & partners.Fields("questions") & "</questions>")

%><%= partners.Fields("partnerId") %><%
	
	SQLString = "SELECT * FROM partner_navlink_rel, navlinks where partner_navlink_rel.navlinkId = navlinks.navlinkId and partner_navlink_rel.partnerId = '" & partners.Fields("partnerId") & "' order by sequence"
	Set partner_navlink_rel = objConn.Execute(SQLString)
	
DO WHILE NOT partner_navlink_rel.EOF 
	on error resume next
		f.WriteLine("<navlink navlinkId=""" & partner_navlink_rel.Fields("navlinkId") & """ url=""" & partner_navlink_rel.Fields("url") & """>" & partner_navlink_rel.Fields("text") & "</navlink>")
	partner_navlink_rel.MoveNext
Loop

	SQLString = "SELECT * FROM partner_navdrop_rel, navdrops where partner_navdrop_rel.navdropId = navdrops.navdropId and partner_navdrop_rel.partnerId = '" & partners.Fields("partnerId") & "' order by sequence"
	Set partner_navdrop_rel = objConn.Execute(SQLString)
	
DO WHILE NOT partner_navdrop_rel.EOF 
	on error resume next
		f.WriteLine("<navdrop navdropId=""" & partner_navdrop_rel.Fields("navdropId") & """ navlinkId=""" & partner_navdrop_rel.Fields("navlinkId") & """ url=""" & partner_navdrop_rel.Fields("url") & """>" & partner_navdrop_rel.Fields("text") & "</navdrop>")
	partner_navdrop_rel.MoveNext
Loop



	SQLString = "SELECT * FROM partner_center_rel, centers where partner_center_rel.centerId = centers.centerId and partner_center_rel.partnerId = '" & partners.Fields("partnerId") & "'"
	Set partner_center_rel = objConn.Execute(SQLString)
	
DO WHILE NOT partner_center_rel.EOF 
	on error resume next
		f.WriteLine("<centerLink siteId=""" & partner_center_rel.Fields("siteId") & """ centerId=""" & partner_center_rel.Fields("centerId") & """>" & partner_center_rel.Fields("text") & "</centerLink>")
	partner_center_rel.MoveNext
Loop

	SQLString = "SELECT * FROM partner_prods_rel, procedures where partner_prods_rel.prodId = procedures.prodId and partner_prods_rel.partnerId = '" & partners.Fields("partnerId") & "' order by procedures.text"
	Set partner_prods_rel = objConn.Execute(SQLString)
	
DO WHILE NOT partner_prods_rel.EOF 
	on error resume next
		f.WriteLine("<prodLink siteId=""" & partner_prods_rel.Fields("siteId") & """ prodId=""" & partner_prods_rel.Fields("prodId") & """>" & partner_prods_rel.Fields("text") & "</prodLink>")
	partner_prods_rel.MoveNext
Loop

	f.WriteLine("</preopData>")
%>
Created XML for <%= partners.Fields("partnerId") %><br>
<%
	partners.MoveNext
Loop
%>