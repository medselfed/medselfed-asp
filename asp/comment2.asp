<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="global.inc" -->
<%
	if subDomain = "postcare" Then
		Response.Redirect("/asp/sitemap.asp?siteId=postcare")
	end if
		
	' This NVP is used to determine the siteId 
	siteId  = "preop"
%>
<!--#include file="chromehead.inc" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><%= pageTitle %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="<%= cssDir %>/keyframe.css" rel="stylesheet" type="text/css">
<link href="<%= cssDir %>/fonts.css" rel="stylesheet" type="text/css">
<link href="<%= cssDir %>/layout.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%= jsDir %>/common.js"></script>
<script type="text/javascript" src="<%= jsDir %>/MM_functions.js"></script>
<script language="JavaScript"><!--
function show(object) {
    if (document.layers && document.layers[object]){
        document.layers[object].visibility = 'visible';
    } else if (document.all) {
        document.all[object].style.visibility = 'visible';
    } else {
		document.getElementById(object).style.visibility = 'visible';
	}
}

function hide(object) {
    if (document.layers && document.layers[object]){
        document.layers[object].visibility = 'hidden';
    } else if (document.all) {
        document.all[object].style.visibility = 'hidden';
	} else {
		document.getElementById(object).style.visibility = 'hidden';
	}
}

function getBodyImageObj(){	
	maleBodyImgObj = new Image()
	maleBodyImgObj.src = '/image/body/body_m.gif'

	maleBodyOnImgObj = new Image()
	maleBodyOnImgObj.src = '/image/body/bodyon_m.gif'
	
	femaleBodyImgObj = new Image()
	femaleBodyImgObj.src = '/image/body/body_f.gif'
	
	femaleBodyOnImgObj = new Image()
	femaleBodyOnImgObj.src = '/image/body/bodyon_f.gif'
}
getBodyImageObj()
//-->
</script>
<% headerType = "true"

' change to address of your own SMTP server
	strHost = "mail.pwebtech.com"
	siteId = Session("siteId")
	siteId = "preop"

strHTML = "<div align=center><table width=598 border=0 cellspacing=0 cellpadding=0>" & chr(13) & chr(10)
strHTML = strHTML & "<tr><td colspan=3><IMG SRC=http://" & LCase(Request.ServerVariables("SERVER_NAME")) & "/image/000/top_cap2.gif WIDTH=598 HEIGHT=20 ALIGN=bottom></td>" & chr(13) & chr(10)
strHTML = strHTML & "</tr><tr>" & chr(13) & chr(10)
strHTML = strHTML & "<td width=1 bgcolor=#999999><img SRC=http://" & LCase(Request.ServerVariables("SERVER_NAME")) & "/image/000/grey_dot.gif width=1 height=1></td>" & chr(13) & chr(10)
strHTML = strHTML & "<td bgcolor=#ffffff><table border=0 cellpadding=5 cellspacing=0 width=100% >" & chr(13) & chr(10)
strHTML = strHTML & "<tr><td align=left valign=bottom bgcolor=#ffffff height=50> " & chr(13) & chr(10)
strHTML = strHTML & "<a href=http://" & LCase(Request.ServerVariables("SERVER_NAME")) & "/asp/home.asp?" & Request.QueryString() & "><img SRC=http://" & LCase(Request.ServerVariables("SERVER_NAME")) & "/image/000/" & siteId &"/" & siteId &"_email.gif border=0></a><br>" & chr(13) & chr(10)
strHTML = strHTML & "<br></td><td valign=middle rowspan=2 align=center bgcolor=#ffffff> " & chr(13) & chr(10)
strHTML = strHTML & "<table width=320 border=0 cellpadding=5 cellspacing=0><tr><td width=320 bordercolor=#CCCCCC bgcolor=#F3F3F3>" & chr(13) & chr(10)
strHTML = strHTML & "</td></tr>" & chr(13) & chr(10)
strHTML = strHTML & "</table></td></tr><tr><td height=140 align=left valign=top bgcolor=#ffffff>" & chr(13) & chr(10) 
strHTML = strHTML & "<p><b>To:  </b>" & Request("To") & " <br>"& chr(13) & chr(10) & " <br>"
strHTML = strHTML & "<b>From:  </b>" & Request("FromName") & " <br>"& chr(13) & chr(10) & " <br>"
strHTML = strHTML & "<b>Message:  </b>" & Request("Body") & "</p>" & chr(13) & chr(10) & " <br>"
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
	End If
	
	if siteId = "preop" Then
		subtxt = "PreOp&trade; Surgery Center"
	else
		subtxt = "PostCare&trade; Recovery Series"
	end if



 %>
</head>
<body>
<center>
<div class="topdiv">
<!--#include file="header.inc" -->
</div>
<div class="lrlines">&nbsp;
<center>
      <TABLE width="95%" CELLPADDING=0 CELLSPACING=0 border="0">
        <FORM METHOD="POST" ACTION="/asp/comment.asp?<%= Request.QueryString() %>">
		<INPUT NAME="To" TYPE="hidden" class="sml" value="webmaster@preop.com" size="50">
          <TR> 
            <TD class="medviolet">From: (your email address):</TD>
            <TD align="center"><INPUT class="sml" NAME="From" TYPE="TEXT" size="50"></TD>
          </TR>
          <TR> 
            <TD class="medviolet">Your Name (optional):</TD>
            <TD align="center" ><INPUT class="sml" NAME="FromName" TYPE="TEXT" size="50"></TD>
          </TR>
          <TR> 
            <TD class="medviolet">Subject:</TD>
            <TD align="center">
<INPUT class="sml" NAME="Subject" TYPE="TEXT" size="50" value="MedSelfEd's - <%= subtxt %>!"></TD>
          </TR>
          <TR> 
            <TD class="medviolet">Add a Message:</TD>
            <TD align="center"><br>
              <TEXTAREA class="sml" NAME="Body" cols="50" rows="3">Add your comment here....</TEXTAREA></TD>
          </TR>
          <TR> 
            <TD class="medviolet">Message Type:</TD>
            <TD class="medviolet" align="center"> 
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
	  <br>
</center>
    </div>
<div class="topdiv">
<!--#include file="footer.inc" -->
</div>
</center>
</body>
</html>
<!--#include file="chromefoot.inc" -->
