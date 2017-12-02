<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
dim objConn        'connection object    
dim DSNtemp        'connection string    
Set objConn = Server.CreateObject("ADODB.Connection") 	
objConn.Open "DSN=MySqlDSN;;database=medselfed_emkt"

' THIS VARIABLE SETS THE RADIUS IN MILES
 siteId =  Request.QueryString("siteId")
 cemterId =  Request.QueryString("centerId")
 prodId =  Request.QueryString("prodId")

SQLString = "select keyword from keywords where prodId = " & prodId & " order by rank"
Set keywords = objConn.Execute(SQLString)

%>
<META name="description" content="Preop.com Patient Education is a comprehensive guide to medical surgery procedures online including videos, slide shows,  pictures and other media-flexible content">

<META name="keywords" content="<%
DO WHILE NOT keywords.EOF 
	on error resume next
	divText = divText + keywords.Fields("keyword") + ", "
%><%= keywords.Fields("keyword") %>,<%
keywords.MoveNext
Loop
%>">

<div style="text-align:justify; width:100%">
Keyword Information:<br>
<%= divText %>
</div>