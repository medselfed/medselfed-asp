<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<title>Print This Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<frameset rows="*,80" frameborder="NO" border="0" framespacing="0">
<% if spotId <> "" Then %>
  <frame src="/asp/slidePrint.asp?<%= Request.QueryString %>" name="mainFrame">
<% else %>
  <frame src="/asp/prodPrint.asp?<%= Request.QueryString %>" name="mainFrame">
<% end if %>
  <frame src="/asp/printNav.asp?<%= Request.QueryString %>" name="bottomFrame" scrolling="NO" noresize>
</frameset>
<noframes><body>

</body></noframes>
</html>

