<%@ Language="Vbscript" %>
<%
pagename = Request.QueryString("pagename")
if pagename = "/asp/body_h_m.asp" Then
	pagename = "/asp/body.asp?sexId=male"
	redirURL = pagename & "&" & Request.QueryString
elseif pagename = "/asp/body_h_f.asp" Then
	pagename = "/asp/body.asp?sexId=female"
	redirURL = pagename & "&" & Request.QueryString
else
	redirURL = pagename & "?" & Request.QueryString
end if 

Response.Redirect(redirURL)
%>