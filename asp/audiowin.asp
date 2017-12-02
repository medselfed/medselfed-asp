<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
prodId = Request.QueryString("prodId")
fileName = Request.QueryString("fileName") 
mediaType = Request.QueryString("mediaType")
siteId = Request.QueryString("siteId") 
%>
<html>
<head>
<title>PreOp.com</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#C5D1CE" leftmargin="0" topmargin="0" onLoad="self.focus()"><div align="center">
<IMG SRC="/image/000/<%= siteId %>/logo_audio.gif" ALIGN=bottom>
<% if mediaType = "qt" then %>
<EMBED SRC="<%= fileName %>" PLUGINSPAGE="http://quicktime.apple.com" WIDTH=160 HEIGHT=16 CONTROLLER=true LOOP=false AUTOPLAY=true>
<% else %>
<EMBED SRC="<%= fileName %>" PLUGINSPAGE="http://www.microsoft.com/Windows/mediaxPlayer/" WIDTH=146 HEIGHT=20 type="application/x-mplayer2" name=MediaPlayer2 autostart=true>
<% end if %>
</div>
<!--#include file="tracking.inc" -->
</body>
