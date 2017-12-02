<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/asp/global.inc" -->
<!--#include virtual="/asp/chromehead.inc" -->
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
</head>
<body>
<center>
<div class="topdiv">
<img src="/image/000/top_cap2.gif" class="bottomCap" alt="">
<div class="lrlines">
	<img src="/image/000/preop/logo_b.gif">
	<p class="lrgred">Disclaimer</p>
	&nbsp;
</div>
    <div class="lrtlines" align="center">
	<table cellpadding="0" cellspacing="10" width="95%"><tr><td align="center">
	<textarea class="sml" rows="8" cols="100" wrap="hard"><% = partners.Fields("discliamer") %></textarea>
<center><br><a href="javascript:;" onclick="history.back(-1)"><img src="../../image/000/accept3.gif" border="0"></a></center></td></tr></table>
    </div>
    <img src="/image/000/bottom_cap2.gif" class="bottomCap" alt="">
</div>
</center>
</body>
</html>
<!--#include virtual="/asp/chromefoot.inc" -->
