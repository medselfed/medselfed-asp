<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
adurl = Request.QueryString("adurl")

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<frameset rows="80,*" frameborder="NO" border="0" framespacing="0">
  <frame src="backtosite.asp" name="topFrame" scrolling="NO" noresize >
  <frame src="<%= adurl %>" name="mainFrame">
 </frameset>
<noframes><body>

</body></noframes>
</html>
