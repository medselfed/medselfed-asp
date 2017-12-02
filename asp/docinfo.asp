<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
		
' change to address of your own SMTP server
	strHost = "mail.pwebtech.com"

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
		newBody = Request("Body")  + "\n"
		newBody = newBody + Request("Body")  + "\n"
		
			Mail.Body = newBody


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

%>
<% If bSuccess Then %>Message sent to <% = Request("To") %>  <% End If %>

