<html>
<head>
<%
strDomain = LCase(Request.ServerVariables("SERVER_NAME"))

if strDomain = "preop.com" or strDomain = "www.preop.com"  Then
%>
	<meta http-equiv="refresh" content="0;URL=http://www.preop.com/asp/home.asp">
<%
elseif strDomain = "postcare.com" or strDomain = "www.postcare.com"  Then
%>
	<meta http-equiv="refresh" content="0;URL=http://www.postcare.com/asp/sitemap.asp?siteId=postcare">
<%
elseif strDomain = "medselfed.com" Then
%>
	<meta http-equiv="refresh" content="0;URL=http://www.medselfed.com/medselfed/mse/mse/mse.html">
<%
elseif strDomain = "google.medselfed.com" Then
%>
	<meta http-equiv="refresh" content="0;URL=http://www.usalife.com/preop_centers/dvd.html">
<%
elseif strDomain = "www.medselfed.com" Then
%>
	<meta http-equiv="refresh" content="0;URL=http://www.medselfed.com/medselfed/mse/mse/mse.html">
<%
else 
%>
	<meta http-equiv="refresh" content="0;URL=http://<%=strDomain%>/asp/home.asp">
<%
end if	
%>

</head>
<body>

<script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
</script>
<script type="text/javascript">
_uacct = "UA-160934-1";
urchinTracker();
</script>

</body>
</html>
