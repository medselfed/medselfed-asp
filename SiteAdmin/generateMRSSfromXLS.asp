<%@  language="VBSCRIPT" codepage="1252" %>


<%
Function return_RFC822_Date(myDate, offset)
   Dim myDay, myDays, myMonth, myYear
   Dim myHours, myMonths, mySeconds

   myDate = CDate(myDate)
   myDay = WeekdayName(Weekday(myDate),true)
   myDays = Day(myDate)
   myMonth = MonthName(Month(myDate), true)
   myYear = Year(myDate)
   myHours = zeroPad(Hour(myDate), 2)
   myMinutes = zeroPad(Minute(myDate), 2)
   mySeconds = zeroPad(Second(myDate), 2)

   return_RFC822_Date = myDay&", "& _
                                  myDays&" "& _
                                  myMonth&" "& _ 
                                  myYear&" "& _
                                  myHours&":"& _
                                  myMinutes&":"& _
                                  mySeconds&" "& _ 
                                  offset
End Function 
Function zeroPad(m, t)
   zeroPad = String(t-Len(m),"0")&m
End Function
%>

<%
importFilename =  Request.QueryString("importFilename")
exportFilename =  Request.QueryString("exportFilename")

'******DEBUG******
'Response.write("importFilename = " & importFilename & "<br>")
'Response.write("exportFilename = " & exportFilename & "<br>")
'*****************

dim fs, f 
set fs=Server.CreateObject("Scripting.FileSystemObject") 

dim centers        'connection Recordset
dim objConn        'connection object    
dim DSNtemp        'connection string    
Set objConn = Server.CreateObject("ADODB.Connection")
'objConn.Open "Driver={Microsoft Excel Driver (*.xls)};DriverId=790;DBQ=" & Server.mappath("/"& importFilename) &";ReadOnly= false ; UID=administrator;"
objConn.Open "Driver={Microsoft Excel Driver (*.xls)};DriverId=790;DBQ=" & Server.mappath("/xml/special/" & importFilename) &";ReadOnly= false; UID=administrator;"


' get all file location for all products that the partner has access to
' this is the old string that uses the procedures_locations table that had to be removed becuase of view issues.
'SQLString = "SELECT partner_prods_rel.partnerid, procedures_locations.* FROM partner_prods_rel Join procedures_locations on procedures_locations.prodid=partner_prods_rel.prodid Where partner_prods_rel.partnerid like '" & partnerId & "'"

SQLString = "SELECT * from [Sheet1$]"



Set videos = objConn.Execute(SQLString)


'create mrss file
set f=fs.CreateTextFile(Server.MapPath("/xml/special/" & exportFilename))
Server.MapPath("/xml/special/" & exportFilename)

'write mrss file headers
f.WriteLine("<?xml version=""1.0"" ?> ")
f.WriteLine("<rss version=""2.0"" xmlns:media=""http://search.yahoo.com/mrss/"">")
f.WriteLine("<channel>")
f.WriteLine("  <title>MedSelfEd PreOp Videos</title>")
f.WriteLine("  <link>http://www.medselfed.com</link>")
f.WriteLine("  <description></description>")

'write info for each item
DO WHILE NOT videos.EOF 
	on error resume next

    'remove non-validating characters from data and format strings to be used when writing file

    strDescription = videos.Fields("description")
    strDescription = Replace(Replace(Replace(Replace(Replace(strDescription, "&", "&amp;"), "<", "&lt;"), ">", "&gt;"), """", "&quot;"), "'", "&apos;")

    strTitle = videos.Fields("title")
    strTitle = Replace(Replace(Replace(Replace(Replace(strTitle, "&", "&amp;"), "<", "&lt;"), ">", "&gt;"), """", "&quot;"), "'", "&apos;")

    strGuid = "medselfed_" & replace(strTitle," ", "_") 

    strFLV = videos.Fields("flv")
    strFLV = Replace(strFLV," ","%20")

    strMP4 = videos.Fields("mp4")
    strMP4 = Replace(strMP4," ","%20")

    strImage = videos.Fields("image")
    strImage = Replace(strImage," ","%20")

    strKeywords = videos.Fields("keywords")

    strPubDate = return_RFC822_Date(Now(), "GMT")

    '******DEBUG******
    'Response.write("<hr>")

    'Dim iCtr
    'iCtr=iCtr+1
    'response.Write("recordNumber = " & iCtr & "<br>" ) 
    'Response.write("title = " & videos.Fields("title") & "<br>")
    'Response.write("flv = " & videos.Fields("flv") & "<br>")
    'Response.write("image = " & videos.Fields("image") & "<br>")
    'Response.write("description = " & videos.Fields("description") & "<br>")       	
    '*****************

    'write XML to file

	f.WriteLine("    <item>")

	f.WriteLine("      <guid isPermaLink=""false"">" & strGuid & "</guid>")

    If Len(strTitle)<>0  Then
        f.WriteLine("      <title>" & strTitle & "</title>")
    Else
       f.WriteLine("      <title></title>")
    End If 

    If Len(strDescription)<>0  Then
        f.WriteLine("      <description>" & strDescription & "</description>")

    Else
       f.WriteLine("      <description></description>")
   End If 


' This was removed becuase it does not validate
'    If IsNotNull(videos.Fields("image")) Then
'        f.WriteLine("      <image>" & Replace(videos.Fields("image")," ","%20") & "</image>")
'    Else
'       f.WriteLine("      <image></image>")
'    End If 
    
    If Len(strFLV)<>0 Then
        f.WriteLine("      <media:content url=""" & strFLV & """ type=""video/x-flv"" lang=""eng"" />")
    Else

    End If  
    
    If Len(strMP4)<>0  Then
        f.WriteLine("      <media:content url=""" & strMP4 & """ type=""video/mp4"" lang=""eng"" />")
    Else

    End If         
    
    If Len(strTitle)<>0  Then
        f.WriteLine("      <media:title type=""plain"">" & strTitle & "</media:title>")
    Else
       f.WriteLine("      <media:title type=""plain""></media:title>")
    End If 

    If Len(strDescription)<>0  Then
        f.WriteLine("      <media:description type=""plain"">" & strDescription & "</media:description>")
    Else
        f.WriteLine("      <media:description type=""plain""></media:description>")   
    End If

    If Len(strImage)<>0  Then
        f.WriteLine("      <media:thumbnail url=""" & strImage & """/>")
    Else

    End If 

    If Len(strKeywords)<>0  Then
        f.WriteLine("      <media:keywords>" & strKeywords & "</media:keywords>")
    Else

    End If 

    f.WriteLine("      <pubDate>" & strPubDate & "</pubDate>")

    f.WriteLine("    </item>")

	videos.MoveNext

Loop

f.WriteLine("</channel>")

f.WriteLine("</rss>")

'response.Redirect("editPartner.asp")

response.write("MRSS file created from <a target=""_blank"" href=""http://" & Request.ServerVariables("server_name") &"/xml/special/" & importFilename & """>/xml/special/" & importFilename & "</a> and saved as <a target=""_blank"" href=""http://" & Request.ServerVariables("server_name") &"/xml/special/" & exportFilename & """>http://" & Request.ServerVariables("server_name") &"/xml/special/" & exportFilename & "</a>")





%>