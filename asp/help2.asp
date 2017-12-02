<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="global.inc" -->
<!--#include file="chromehead.inc" -->
<%
	siteId = Request.QueryString("siteId")
	
	if siteId = "preop" Then
		titleText = "MedSelfEd Patient Education: Help Page 2"
	elseif siteId = "postcare" Then
		titleText = "MedSelfEd Patient Education: Help Page 2"
	else
		titleText = "MedSelfEd Patient Education: Help Page 2"
	end if
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><%= titleText %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="<%= cssDir %>/keyframe.css" rel="stylesheet" type="text/css">
<link href="<%= cssDir %>/fonts.css" rel="stylesheet" type="text/css">
<link href="<%= cssDir %>/layout.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%= jsDir %>/common.js"></script>
<script type="text/javascript" src="<%= jsDir %>/MM_functions.js"></script>
<SCRIPT LANGUAGE="JavaScript"><!--
function newImage(arg) {
	if (document.images) {
		rslt = new Image();
		rslt.src = arg;
		return rslt;
	}
}

function changeImages() {
	if (document.images && (preloadFlag == true)) {
		for (var i=0; i<changeImages.arguments.length; i+=2) {
			document[changeImages.arguments[i]].src = changeImages.arguments[i+1];
		}
	}
}

var preloadFlag = false;
function preloadImages() {
	if (document.images) {
		Page_1_2_bb_01_Page_1_2_bb_04_over = newImage("../image/help/Page-1_2_bb_01-Page-1_2_bb_.gif");
		Page_1_2_bb_02_Page_1_2_bb_04_over = newImage("../image/help/Page-1_2_bb_02-Page-1_2_bb_.gif");
		Page_1_2_bb_02_Page_1_2_bb_09_over = newImage("../image/help/Page-1_2_bb_02-Page-1_2_-06.gif");
		Page_1_2_bb_02_Page_1_2_bb_11_over = newImage("../image/help/Page-1_2_bb_02-Page-1_2_-07.gif");
		Page_1_2_bb_02_Page_1_2_bb_14_over = newImage("../image/help/Page-1_2_bb_02-Page-1_2_-08.gif");
		Page_1_2_bb_03_Page_1_2_bb_04_over = newImage("../image/help/Page-1_2_bb_03-Page-1_2_bb_.gif");
		Page_1_2_bb_04_over = newImage("../image/help/Page-1_2_bb_04-over.gif");
		Page_1_2_bb_05_Page_1_2_bb_04_over = newImage("../image/help/Page-1_2_bb_05-Page-1_2_bb_.gif");
		Page_1_2_bb_06_Page_1_2_bb_04_over = newImage("../image/help/Page-1_2_bb_06-Page-1_2_bb_.gif");
		Page_1_2_bb_07_Page_1_2_bb_04_over = newImage("../image/help/Page-1_2_bb_07-Page-1_2_bb_.gif");
		Page_1_2_bb_07_Page_1_2_bb_09_over = newImage("../image/help/Page-1_2_bb_07-Page-1_2_-19.gif");
		Page_1_2_bb_08_Page_1_2_bb_09_over = newImage("../image/help/Page-1_2_bb_08-Page-1_2_bb_.gif");
		Page_1_2_bb_08_Page_1_2_bb_11_over = newImage("../image/help/Page-1_2_bb_08-Page-1_2_-22.gif");
		Page_1_2_bb_09_Page_1_2_bb_04_over = newImage("../image/help/Page-1_2_bb_09-Page-1_2_bb_.gif");
		Page_1_2_bb_09_over = newImage("../image/help/Page-1_2_bb_09-over.gif");
		Page_1_2_bb_09_Page_1_2_bb_11_over = newImage("../image/help/Page-1_2_bb_09-Page-1_2_-26.gif");
		Page_1_2_bb_10_Page_1_2_bb_14_over = newImage("../image/help/Page-1_2_bb_10-Page-1_2_bb_.gif");
		Page_1_2_bb_11_Page_1_2_bb_09_over = newImage("../image/help/Page-1_2_bb_11-Page-1_2_bb_.gif");
		Page_1_2_bb_11_over = newImage("../image/help/Page-1_2_bb_11-over.gif");
		Page_1_2_bb_12_Page_1_2_bb_11_over = newImage("../image/help/Page-1_2_bb_12-Page-1_2_bb_.gif");
		Page_1_2_bb_13_Page_1_2_bb_14_over = newImage("../image/help/Page-1_2_bb_13-Page-1_2_bb_.gif");
		Page_1_2_bb_14_over = newImage("../image/help/Page-1_2_bb_14-over.gif");
		Page_1_2_bb_15_Page_1_2_bb_14_over = newImage("../image/help/Page-1_2_bb_15-Page-1_2_bb_.gif");
		Page_1_2_bb_16_Page_1_2_bb_14_over = newImage("../image/help/Page-1_2_bb_16-Page-1_2_bb_.gif");
		Page_1_2_bb_17_Page_1_2_bb_04_over = newImage("../image/help/Page-1_2_bb_17-Page-1_2_bb_.gif");
		Page_1_2_bb_17_Page_1_2_bb_14_over = newImage("../image/help/Page-1_2_bb_17-Page-1_2_-44.gif");
		preloadFlag = true;
	}
}

// --></SCRIPT>
</head>
<% headerImage = "multi"
%>
<body onLoad="preloadImages()">
<center>
<div class="topdiv">
<!--#include file="header.inc" -->
<div class="lrlines">
         <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH=580>
            <TR>
               <TD>
                  <P><A HREF="#" onmouseover="changeImages('Page_2_1_bb_01', '../image/help/Page-2_1_bb_01-over.gif', 'Page_2_1_bb_02', '../image/help/Page-2_1_bb_02-Page-2_1_bb_.gif', 'Page_2_1_bb_03', '../image/help/Page-2_1_bb_03-Page-2_1_bb_.gif', 'Page_2_1_bb_04', '../image/help/Page-2_1_bb_04-Page-2_1_bb_.gif', 'Page_2_1_bb_06', '../image/help/Page-2_1_bb_06-Page-2_1_bb_.gif');
return true;" onmouseout="changeImages('Page_2_1_bb_01', '../image/help/Page-2_1_bb_01.gif', 'Page_2_1_bb_02', '../image/help/Page-2_1_bb_02.gif', 'Page_2_1_bb_03', '../image/help/Page-2_1_bb_03.gif', 'Page_2_1_bb_04', '../image/help/Page-2_1_bb_04.gif', 'Page_2_1_bb_06', '../image/help/Page-2_1_bb_06.gif'); return true;"><IMG SRC="../image/help/Page-2_1_bb_01.gif" WIDTH=122 HEIGHT=97 BORDER=0 ALIGN=bottom name="Page_2_1_bb_01"></A></P>
               </TD>
               <TD ROWSPAN=2>
                  <P><IMG SRC="../image/help/Page-2_1_bb_02.gif" WIDTH=458 HEIGHT=301 ALIGN=bottom name="Page_2_1_bb_02"></P>
               </TD>
            </TR>
            <TR>
               <TD>
                  <P><IMG SRC="../image/help/Page-2_1_bb_03.gif" WIDTH=122 HEIGHT=204 ALIGN=bottom name="Page_2_1_bb_03"></P>
               </TD>
            </TR>
            <TR>
               <TD COLSPAN=2>
                  <P><IMG SRC="../image/help/Page-2_1_bb_04.gif" WIDTH=580 HEIGHT=292 ALIGN=bottom name="Page_2_1_bb_04"></P>
               </TD>
            </TR>
            <TR>
               <TD>
                  <P><A HREF="#" onmouseover="changeImages('Page_2_1_bb_02', '../image/help/Page-2_1_bb_02-Page-2_1_-05.gif', 'Page_2_1_bb_03', '../image/help/Page-2_1_bb_03-Page-2_1_-08.gif', 'Page_2_1_bb_04', '../image/help/Page-2_1_bb_04-Page-2_1_-11.gif', 'Page_2_1_bb_05', '../image/help/Page-2_1_bb_05-over.gif', 'Page_2_1_bb_06', '../image/help/Page-2_1_bb_06-Page-2_1_-16.gif',
'Page_2_1_bb_07', '../image/help/Page-2_1_bb_07-Page-2_1_bb_.gif'); return true;" onmouseout="changeImages('Page_2_1_bb_02', '../image/help/Page-2_1_bb_02.gif', 'Page_2_1_bb_03', '../image/help/Page-2_1_bb_03.gif', 'Page_2_1_bb_04', '../image/help/Page-2_1_bb_04.gif', 'Page_2_1_bb_05', '../image/help/Page-2_1_bb_05.gif', 'Page_2_1_bb_06', '../image/help/Page-2_1_bb_06.gif', 'Page_2_1_bb_07', '../image/help/Page-2_1_bb_07.gif'); return true;"><IMG SRC="../image/help/Page-2_1_bb_05.gif" WIDTH=122 HEIGHT=85 BORDER=0 ALIGN=bottom name="Page_2_1_bb_05"></A></P>
               </TD>
               <TD ROWSPAN=2>
                  <P><a href="#" onclick="history.go(-2)"><IMG SRC="../image/help/Page-2_1_bb_06.gif" WIDTH=458 HEIGHT=157 BORDER=0 ALIGN=bottom name="Page_2_1_bb_06"></A></P>
               </TD>
            </TR>
            <TR>
               <TD>
                  <P><IMG SRC="../image/help/Page-2_1_bb_07.gif" WIDTH=122 HEIGHT=72 ALIGN=bottom name="Page_2_1_bb_07"></P>
               </TD>
            </TR>
         </TABLE>
<br><br>
</div>
<!--#include file="footer.inc" -->
</div>
</center>
<!--#include file="tracking.inc" -->
</body>
</html>
<!--#include file="chromefoot.inc" -->
