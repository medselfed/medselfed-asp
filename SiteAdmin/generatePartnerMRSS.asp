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
	 partnerId =  Request.QueryString("partnerId")

dim fs, f 
set fs=Server.CreateObject("Scripting.FileSystemObject") 

dim centers        'connection Recordset
dim objConn        'connection object    
dim DSNtemp        'connection string    
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "DSN=MySqlDSN;database=medselfed_prod"


' get all file location for all products that the partner has access to
' this is the old string that uses the procedures_locations table that had to be removed becuase of view issues.
'SQLString = "SELECT partner_prods_rel.partnerid, procedures_locations.* FROM partner_prods_rel Join procedures_locations on procedures_locations.prodid=partner_prods_rel.prodid Where partner_prods_rel.partnerid like '" & partnerId & "'"

SQLString = "SELECT partner_prods_rel.partnerid, procedures.prodid, procedures.title, procedures.description, procedures.flv, procedures.image FROM partner_prods_rel Join procedures on procedures.prodid=partner_prods_rel.prodid Where partner_prods_rel.partnerid like '" & partnerId & "'"


'******DEBUG******
'response.Write(SQLString)
'*****************

Set procedures = objConn.Execute(SQLString)

'create mrss file
set f=fs.CreateTextFile(Server.MapPath("/xml/partners/" & procedures.Fields("partnerId") & "_mrss.xml"))
Server.MapPath("/xml/partners/" & procedures.Fields("partnerId") & "_mrss.xml")

'write mrss file headers
f.WriteLine("<?xml version=""1.0"" ?> ")
f.WriteLine("<rss version=""2.0"" xmlns:media=""http://search.yahoo.com/mrss/"">")
f.WriteLine("<channel>")
f.WriteLine("  <title>MedSelfEd PreOp Videos</title>")
f.WriteLine("  <link>http://www.medselfed.com</link>")
f.WriteLine("  <description></description>")

'write info for each item
DO WHILE NOT procedures.EOF 
	on error resume next

    '******DEBUG******
    'Dim iCtr
    'iCtr=iCtr+1
    'response.Write(iCtr) 
    'response.Write("<br>") 	
    '*****************

	f.WriteLine("    <item>")

	f.WriteLine("      <guid isPermaLink=""false"">medselfed_" & procedures.Fields("prodid") & "</guid>")

    If IsNotNull(Procedures.Fields("title")) Then
        f.WriteLine("      <title>" & Replace(Replace(Replace(Replace(Replace(procedures.Fields("title"), "&", "&amp;"), "<", "&lt;"), ">", "&gt;"), """", "&quot;"), "'", "&apos;") & "</title>")
    Else
       f.WriteLine("      <title></title>")
    End If 

    If IsNotNull(Procedures.Fields("description")) Then
        f.WriteLine("      <description>" & Replace(Replace(Replace(Replace(Replace(procedures.Fields("description"), "&", "&amp;"), "<", "&lt;"), ">", "&gt;"), """", "&quot;"), "'", "&apos;") & "</description>")
    Else
       f.WriteLine("      <description></description>")
    End If 


' This was removed becuase it does not validate
'    If IsNotNull(Procedures.Fields("image")) Then
'        f.WriteLine("      <image>" & Replace(procedures.Fields("image")," ","%20") & "</image>")
'    Else
'       f.WriteLine("      <image></image>")
'    End If 
    
    
    If IsNotNull(Procedures.Fields("flv")) Then
        f.WriteLine("      <media:content url=""" & Replace(procedures.Fields("flv")," ","%20") & """ type=""video/x-flv"" lang=""eng"" />")
    Else
       f.WriteLine("      <media:content url="""" type=""video/x-flv"" lang=""eng"" />")
    End If         
    
    If IsNotNull(Procedures.Fields("title")) Then
        f.WriteLine("      <media:title type=""plain"">" & Replace(Replace(Replace(Replace(Replace(procedures.Fields("title"), "&", "&amp;"), "<", "&lt;"), ">", "&gt;"), """", "&quot;"), "'", "&apos;") & "</media:title>")
    Else
       f.WriteLine("      <media:title type=""plain""></media:title>")
    End If 

    If IsNotNull(Procedures.Fields("description")) Then
        f.WriteLine("      <media:description type=""plain"">" & Replace(Replace(Replace(Replace(Replace(procedures.Fields("description"), "&", "&amp;"), "<", "&lt;"), ">", "&gt;"), """", "&quot;"), "'", "&apos;") & "</media:description>")
    Else
        f.WriteLine("      <media:description type=""plain""></media:description>")   
    End If

    If IsNotNull(Procedures.Fields("image")) Then
        f.WriteLine("      <media:thumbnail url=""" & Replace(procedures.Fields("image")," ","%20") & """/>")
    Else

    End If 

    f.WriteLine("      <pubDate>" & return_RFC822_Date(Now(), "GMT") & "</pubDate>")

    f.WriteLine("    </item>")

	procedures.MoveNext

Loop

f.WriteLine("</channel>")

f.WriteLine("</rss>")

response.Redirect("editPartner.asp")





%>