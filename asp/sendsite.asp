<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="global.inc" -->
<%
	' These NVP are for EHC Caching and Chrome Data
		cachedate = Request.QueryString("cachedate")
		id = Request.QueryString("id")
		
' change to address of your own SMTP server
	strHost = "localhost"
	siteId = Session("siteId")

strHTML = "<div align=center><table width=598 border=0 cellspacing=0 cellpadding=0>" & chr(13) & chr(10)
strHTML = strHTML & "<tr><td colspan=3><IMG SRC=http://" & LCase(Request.ServerVariables("SERVER_NAME")) & "/image/000/top_cap2.gif WIDTH=598 HEIGHT=20 ALIGN=bottom></td>" & chr(13) & chr(10)
strHTML = strHTML & "</tr><tr>" & chr(13) & chr(10)
strHTML = strHTML & "<td width=1 bgcolor=#999999><img SRC=http://" & LCase(Request.ServerVariables("SERVER_NAME")) & "/image/000/grey_dot.gif width=1 height=1></td>" & chr(13) & chr(10)
strHTML = strHTML & "<td bgcolor=#ffffff><table border=0 cellpadding=5 cellspacing=0 width=100% >" & chr(13) & chr(10)
strHTML = strHTML & "<tr><td align=left valign=bottom bgcolor=#ffffff height=50> " & chr(13) & chr(10)
strHTML = strHTML & "<a target=_blank href=http://" & LCase(Request.ServerVariables("SERVER_NAME")) & "/asp/home.asp?" & Request.QueryString() & "><img SRC=http://" & LCase(Request.ServerVariables("SERVER_NAME")) & "/image/000/" & siteId &"/" & siteId &"_email.gif border=0></a><br>" & chr(13) & chr(10)
strHTML = strHTML & "<br></td><td valign=middle rowspan=2 align=center bgcolor=#ffffff> " & chr(13) & chr(10)
strHTML = strHTML & "<a target=_blank href=http://" & LCase(Request.ServerVariables("SERVER_NAME")) & "/asp/prodDisplay.asp?" & Request.QueryString() & "> " & chr(13) & chr(10)
strHTML = strHTML & "<img SRC=http://" & LCase(Request.ServerVariables("SERVER_NAME")) & "/image/" & Request.QueryString("prodId") & "/" & Request.QueryString("prodId") & ".gif border=0></a>" & chr(13) & chr(10)
strHTML = strHTML & "<table width=320 border=0 cellpadding=5 cellspacing=0><tr><td width=320 bordercolor=#CCCCCC bgcolor=#F3F3F3>" & chr(13) & chr(10)
strHTML = strHTML & "</td></tr>" & chr(13) & chr(10)
strHTML = strHTML & "</table></td></tr><tr><td height=140 align=left valign=top bgcolor=#ffffff>" & chr(13) & chr(10) 
strHTML = strHTML & "<p><b>To:  </b>" & Request.QueryString("To") & " <br>"& chr(13) & chr(10) & " <br>"
strHTML = strHTML & "<b>From:  </b>" & Request.QueryString("FromName") & " <br>"& chr(13) & chr(10) & " <br>"
strHTML = strHTML & "<b>Message:  </b>" & Request.QueryString("Body") & "</p>" & chr(13) & chr(10) & " <br>"
strHTML = strHTML & "</td></tr><tr><td bgcolor=#ffffff height=22>&nbsp;</td>" & chr(13) & chr(10)
strHTML = strHTML & "<td valign=middle bgcolor=#ffffff align=center> " & chr(13) & chr(10)
strHTML = strHTML & "<div align=center><img SRC=http://" & LCase(Request.ServerVariables("SERVER_NAME")) & "/image/000/" & siteId &"/copyright.gif border=0>" & chr(13) & chr(10)
strHTML = strHTML & "</div></td></tr></table></td>" & chr(13) & chr(10)
strHTML = strHTML & "<td width=1 bgcolor=#999999><img SRC=http://" & LCase(Request.ServerVariables("SERVER_NAME")) & "/image/000/grey_dot.gif width=1 height=1></td>" & chr(13) & chr(10)
strHTML = strHTML & "</tr><tr><td colspan=3><img SRC=http://" & LCase(Request.ServerVariables("SERVER_NAME")) & "/image/000/bottom_cap2.gif width=598 height=20></td>" & chr(13) & chr(10)
strHTML = strHTML & "</tr></table>" & chr(13) & chr(10)
strHTML = strHTML & "</div>"




	If Request("Send") <> "" Then
		
		Set Mail = Server.CreateObject("Persits.MailSender")
		' enter valid SMTP host
		Mail.Host = strHost

		Mail.From = Request("From") ' From address
		Mail.FromName = Request("FromName") ' optional
		Mail.AddAddress Request("To")
		
		' message subject
		Mail.Subject = Request("Subject")
		' message body
		
		If Request("html") = "true" Then
			Mail.IsHTML = True
			Mail.Body = "<HTML><BODY><CENTER>" & strHTML & "</CENTER></BODY></html>"
		else
			Mail.Body = Request("Body") & chr(13) & chr(10) & chr(13) & chr(10)  & "http://" & LCase(Request.ServerVariables("SERVER_NAME")) & "/asp/prodDisplay.asp?" & Request.QueryString() 
		end if

		strErr = ""
		bSuccess = False
		On Error Resume Next ' catch errors
		Mail.Send	' send message
		If Err <> 0 Then ' error occurred
			strErr = Err.Description
		else
			bSuccess = True
		End If
		titleTextStatus = "(Sent)"
	else
		titleTextStatus = "(Compose)"
	End If
		
	if siteId = "preop" Then
		subtxt = "PreOp&trade; Surgery Center"
	else
		subtxt = "PostCare&trade; Recovery Series"
	end if
	
	if siteId = "preop" Then
		titleText = "MedSelfEd Patient Education: PreOp.com Surgery Center Send Site " & titleTextStatus	
	elseif siteId = "postcare" Then
		titleText = "MedSelfEd Patient Education: PostCare.com Recovery Series Send Site " & titleTextStatus	
	else
		titleText = "MedSelfEd Patient Education: Send Site " & titleTextStatus	
	end if
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><%= titleText %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../css/<%= siteId %>/keyframe.css" rel="stylesheet" type="text/css">
<link href="../css/<%= siteId %>/fonts.css" rel="stylesheet" type="text/css">
<link href="../css/<%= siteId %>/layout.css" rel="stylesheet" type="text/css">
<style type="text/css">
.topdiv {
	width: 500px;
	height: 200px;
}

.topCap {
	width: 500px;
	vertical-align: text-bottom;
	height: 20px;
}

.topHeader {
	width: 500px;
	vertical-align: text-bottom;
}

.bottomCap {
	width: 500px;
	vertical-align: text-top;
	height: 20px;
}

</style>
<script type="text/javascript" src="<%= jsDir %>/common.js"></script>
<script type="text/javascript" src="<%= jsDir %>/MM_functions.js"></script>
</head>
<body onLoad="self.focus()">
<center>
<div class="topdiv">
<img src="../image/000/top_cap2.gif" class="topCap" alt="">
<!--#include file="help.inc" -->
<div class="lrlines">&nbsp;
      <TABLE width="95%" CELLPADDING=2 CELLSPACING=0>
	  <tr>
          <td align="left" colspan="2"><IMG SRC="/image/000/<%= siteId %>/<%= siteId %>_email.gif" WIDTH=100 HEIGHT=53  border="0" ALIGN=absbottom>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="+2" color="#CCCCCC"><%= subtxt %></font> <br>
            <br>
          </td>
        </tr>
        <FORM METHOD="get" ACTION="/asp/sendsite.asp?<%= Request.QueryString() %>">
		<INPUT class="sml" NAME="prodId" TYPE="hidden" value="<%= Request.QueryString("prodId") %>">
          <TR> 
            <TD class="medviolet">From: (your email address):</TD>
            <TD><INPUT class="sml" NAME="From" TYPE="TEXT" size="50"></TD>
          </TR>
          <TR> 
            <TD class="medviolet">Your Name (optional):</TD>
            <TD><INPUT class="sml" NAME="FromName" TYPE="TEXT" size="50"></TD>
          </TR>
          <TR> 
            <TD class="medviolet">To: (enter one recipient's address):</TD>
            <TD><INPUT class="sml" TYPE="TEXT" size="50" NAME="To"></TD>
          </TR>
          <TR> 
            <TD class="medviolet">Subject:</TD>
            <TD>
<INPUT class="sml" NAME="Subject" TYPE="TEXT" size="50" value="MedSelfEd's - <%= subtxt %>!"></TD>
          </TR>
          <TR> 
            <TD class="medviolet">Add a Message:</TD>
            <TD><br>
              <TEXTAREA class="sml" NAME="Body" cols="50" rows="3">Hi, just visited this site and want to share it with you.  Take a look by clicking on the picture or link.</TEXTAREA></TD>
          </TR>
          <TR> 
            <TD class="medviolet">Message Type:</TD>
            <TD class="medviolet"> 
              <input type="radio" name="html" value="true" checked>
              HTML 
              <input type="radio" name="html" value="false">
              TEXT</TD>
          </TR>
          <TR> 
            <TD COLSPAN="2" align="center"><br> <INPUT TYPE="submit" NAME="Send" VALUE="Send Message"></TD>
          </TR>
          <% If strErr <> "" Then %>
          <TR> 
            <TD COLSPAN="2" align="center" valign="bottom"> <FONT COLOR="#FF0000">Error 
              occurred: <I>
              <% = strErr %>
              </I></FONT> </TD>
          </TR>
          <% End If %>
          <% If bSuccess Then %>
          <TR> 
            <TD COLSPAN="2" align="center" valign="bottom"> <FONT COLOR="#00A000">Success! 
              Message sent to 
              <% = Request("To") %>
              </FONT> </TD>
          </TR>
          <% End If %>
        </FORM>
      </TABLE>
      <br><br>
</div><img src="../image/000/bottom_cap2.gif" class="bottomCap" alt="">
</div>
</center>
<!--#include file="tracking.inc" -->
</body>
</html>

