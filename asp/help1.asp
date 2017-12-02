<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="global.inc" -->
<!--#include file="chromehead.inc" -->
<%
	siteId = Request.QueryString("siteId")
	
	if siteId = "preop" Then
		titleText = "MedSelfEd Patient Education: Help Page 1"
	elseif siteId = "postcare" Then
		titleText = "MedSelfEd Patient Education: Help Page 1"
	else
		titleText = "MedSelfEd Patient Education: Help Page 1"
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
                  <P><IMG SRC="../image/help/spacer.gif" WIDTH=108 HEIGHT=1 ALIGN=bottom></P>
               </TD>
               <TD>
                  <P><IMG SRC="../image/help/spacer.gif" WIDTH=27 HEIGHT=1 ALIGN=bottom></P>
               </TD>
               <TD>
                  <P><IMG SRC="../image/help/spacer.gif" WIDTH=22 HEIGHT=1 ALIGN=bottom></P>
               </TD>
               <TD>
                  <P><IMG SRC="../image/help/spacer.gif" WIDTH=7 HEIGHT=1 ALIGN=bottom></P>
               </TD>
               <TD>
                  <P><IMG SRC="../image/help/spacer.gif" WIDTH=21 HEIGHT=1 ALIGN=bottom></P>
               </TD>
               <TD>
                  <P><IMG SRC="../image/help/spacer.gif" WIDTH=84 HEIGHT=1 ALIGN=bottom></P>
               </TD>
               <TD>
                  <P><IMG SRC="../image/help/spacer.gif" WIDTH=311 HEIGHT=1 ALIGN=bottom></P>
               </TD>
               <TD>
                  <P></P>
               </TD>
            </TR>
            <TR>
               <TD COLSPAN=6>
                  <P><IMG SRC="../image/help/Page-1_2_bb_01.gif" WIDTH=269 HEIGHT=79 ALIGN=bottom name="Page_1_2_bb_01"></P>
               </TD>
               <TD ROWSPAN=10>
                  <P><IMG SRC="../image/help/Page-1_2_bb_02.gif" WIDTH=311 HEIGHT=583 ALIGN=bottom name="Page_1_2_bb_02"></P>
               </TD>
               <TD>
                  <P><IMG SRC="../image/help/spacer.gif" WIDTH=1 HEIGHT=79 ALIGN=bottom></P>
               </TD>
            </TR>
            <TR>
               <TD ROWSPAN=2>
                  <P><IMG SRC="../image/help/Page-1_2_bb_03.gif" WIDTH=108 HEIGHT=74 ALIGN=bottom name="Page_1_2_bb_03"></P>
               </TD>
               <TD COLSPAN=4>
                  <P><A HREF="#" onmouseover="changeImages('Page_1_2_bb_01', '../image/help/Page-1_2_bb_01-Page-1_2_bb_.gif', 'Page_1_2_bb_02', '../image/help/Page-1_2_bb_02-Page-1_2_bb_.gif', 'Page_1_2_bb_03', '../image/help/Page-1_2_bb_03-Page-1_2_bb_.gif', 'Page_1_2_bb_04', '../image/help/Page-1_2_bb_04-over.gif', 'Page_1_2_bb_05', '../image/help/Page-1_2_bb_05-Page-1_2_bb_.gif',
'Page_1_2_bb_06', '../image/help/Page-1_2_bb_06-Page-1_2_bb_.gif', 'Page_1_2_bb_07', '../image/help/Page-1_2_bb_07-Page-1_2_bb_.gif', 'Page_1_2_bb_09', '../image/help/Page-1_2_bb_09-Page-1_2_bb_.gif', 'Page_1_2_bb_17', '../image/help/Page-1_2_bb_17-Page-1_2_bb_.gif'); return true;" onmouseout="changeImages('Page_1_2_bb_01', '../image/help/Page-1_2_bb_01.gif', 'Page_1_2_bb_02', '../image/help/Page-1_2_bb_02.gif', 'Page_1_2_bb_03', '../image/help/Page-1_2_bb_03.gif', 'Page_1_2_bb_04', '../image/help/Page-1_2_bb_04.gif', 'Page_1_2_bb_05', '../image/help/Page-1_2_bb_05.gif', 'Page_1_2_bb_06', '../image/help/Page-1_2_bb_06.gif', 'Page_1_2_bb_07',
'../image/help/Page-1_2_bb_07.gif', 'Page_1_2_bb_09', '../image/help/Page-1_2_bb_09.gif', 'Page_1_2_bb_17', '../image/help/Page-1_2_bb_17.gif'); return true;"><IMG SRC="../image/help/Page-1_2_bb_04.gif" WIDTH=77 HEIGHT=36 BORDER=0 ALIGN=bottom name="Page_1_2_bb_04"></A></P>
               </TD>
               <TD ROWSPAN=2>
                  <P><IMG SRC="../image/help/Page-1_2_bb_05.gif" WIDTH=84 HEIGHT=74 ALIGN=bottom name="Page_1_2_bb_05"></P>
               </TD>
               <TD>
                  <P><IMG SRC="../image/help/spacer.gif" WIDTH=1 HEIGHT=36 ALIGN=bottom></P>
               </TD>
            </TR>
            <TR><TD COLSPAN=4>
                  <P><IMG SRC="../image/help/Page-1_2_bb_06.gif" WIDTH=77 HEIGHT=38 ALIGN=bottom name="Page_1_2_bb_06"></P>
               </TD>
               <TD>
                  <P><IMG SRC="../image/help/spacer.gif" WIDTH=1 HEIGHT=38 ALIGN=bottom></P>
               </TD>
            </TR>
            <TR>
               <TD COLSPAN=6>
                  <P><IMG SRC="../image/help/Page-1_2_bb_07.gif" WIDTH=269 HEIGHT=117 ALIGN=bottom name="Page_1_2_bb_07"></P>
               </TD>
               <TD>
                  <P><IMG SRC="../image/help/spacer.gif" WIDTH=1 HEIGHT=117 ALIGN=bottom></P>
               </TD>
            </TR>
            <TR>
               <TD COLSPAN=4>
                  <P><IMG SRC="../image/help/Page-1_2_bb_08.gif" WIDTH=164 HEIGHT=45 ALIGN=bottom name="Page_1_2_bb_08"></P>
               </TD>
               <TD COLSPAN=2>
                  <P><A HREF="#" onmouseover="changeImages('Page_1_2_bb_02', '../image/help/Page-1_2_bb_02-Page-1_2_-06.gif', 'Page_1_2_bb_07', '../image/help/Page-1_2_bb_07-Page-1_2_-19.gif', 'Page_1_2_bb_08', '../image/help/Page-1_2_bb_08-Page-1_2_bb_.gif', 'Page_1_2_bb_09', '../image/help/Page-1_2_bb_09-over.gif', 'Page_1_2_bb_11', '../image/help/Page-1_2_bb_11-Page-1_2_bb_.gif',
'Page_1_2_bb_17', '../image/help/Page-1_2_bb_17-Page-1_2_bb_.gif'); return true;" onmouseout="changeImages('Page_1_2_bb_02', '../image/help/Page-1_2_bb_02.gif', 'Page_1_2_bb_07', '../image/help/Page-1_2_bb_07.gif', 'Page_1_2_bb_08', '../image/help/Page-1_2_bb_08.gif', 'Page_1_2_bb_09', '../image/help/Page-1_2_bb_09.gif', 'Page_1_2_bb_11', '../image/help/Page-1_2_bb_11.gif', 'Page_1_2_bb_17', '../image/help/Page-1_2_bb_17.gif'); return true;"><IMG SRC="../image/help/Page-1_2_bb_09.gif" WIDTH=105 HEIGHT=45 BORDER=0 ALIGN=bottom name="Page_1_2_bb_09"></A></P>
               </TD>
               <TD>
                  <P><IMG SRC="../image/help/spacer.gif" WIDTH=1 HEIGHT=45 ALIGN=bottom></P>
               </TD>
            </TR>
            <TR>
               <TD ROWSPAN=2 COLSPAN=2>
                  <P><IMG SRC="../image/help/Page-1_2_bb_10.gif" WIDTH=135 HEIGHT=140 ALIGN=bottom name="Page_1_2_bb_10"></P>
               </TD>
               <TD COLSPAN=4>
                  <P><A HREF="#" onmouseover="changeImages('Page_1_2_bb_02', '../image/help/Page-1_2_bb_02-Page-1_2_-07.gif', 'Page_1_2_bb_08', '../image/help/Page-1_2_bb_08-Page-1_2_-22.gif', 'Page_1_2_bb_09', '../image/help/Page-1_2_bb_09-Page-1_2_-26.gif', 'Page_1_2_bb_11', '../image/help/Page-1_2_bb_11-over.gif', 'Page_1_2_bb_12', '../image/help/Page-1_2_bb_12-Page-1_2_bb_.gif',
'Page_1_2_bb_17', '../image/help/Page-1_2_bb_17-Page-1_2_bb_.gif'); return true;" onmouseout="changeImages('Page_1_2_bb_02', '../image/help/Page-1_2_bb_02.gif', 'Page_1_2_bb_08', '../image/help/Page-1_2_bb_08.gif', 'Page_1_2_bb_09', '../image/help/Page-1_2_bb_09.gif', 'Page_1_2_bb_11', '../image/help/Page-1_2_bb_11.gif', 'Page_1_2_bb_12', '../image/help/Page-1_2_bb_12.gif', 'Page_1_2_bb_17', '../image/help/Page-1_2_bb_17.gif'); return true;"><IMG SRC="../image/help/Page-1_2_bb_11.gif" WIDTH=134 HEIGHT=47 BORDER=0 ALIGN=bottom name="Page_1_2_bb_11"></A></P>
               </TD>
               <TD>
                  <P><IMG SRC="../image/help/spacer.gif" WIDTH=1 HEIGHT=47 ALIGN=bottom></P>
               </TD>
            </TR>
            <TR><TD COLSPAN=4>
                  <P><IMG SRC="../image/help/Page-1_2_bb_12.gif" WIDTH=134 HEIGHT=93 ALIGN=bottom name="Page_1_2_bb_12"></P>
               </TD>
               <TD>
                  <P><IMG SRC="../image/help/spacer.gif" WIDTH=1 HEIGHT=93 ALIGN=bottom></P>
               </TD>
            </TR>
            <TR>
               <TD COLSPAN=6>
                  <P><IMG SRC="../image/help/Page-1_2_bb_13.gif" WIDTH=269 HEIGHT=34 ALIGN=bottom name="Page_1_2_bb_13"></P>
               </TD>
               <TD>
                  <P><IMG SRC="../image/help/spacer.gif" WIDTH=1 HEIGHT=34 ALIGN=bottom></P>
               </TD>
            </TR>
            <TR>
               <TD COLSPAN=3>
                  <P><A HREF="#" onmouseover="changeImages('Page_1_2_bb_02', '../image/help/Page-1_2_bb_02-Page-1_2_-08.gif', 'Page_1_2_bb_10', '../image/help/Page-1_2_bb_10-Page-1_2_bb_.gif', 'Page_1_2_bb_13', '../image/help/Page-1_2_bb_13-Page-1_2_bb_.gif', 'Page_1_2_bb_14', '../image/help/Page-1_2_bb_14-over.gif', 'Page_1_2_bb_15', '../image/help/Page-1_2_bb_15-Page-1_2_bb_.gif',
'Page_1_2_bb_16', '../image/help/Page-1_2_bb_16-Page-1_2_bb_.gif', 'Page_1_2_bb_17', '../image/help/Page-1_2_bb_17-Page-1_2_-44.gif'); return true;" onmouseout="changeImages('Page_1_2_bb_02', '../image/help/Page-1_2_bb_02.gif', 'Page_1_2_bb_10', '../image/help/Page-1_2_bb_10.gif', 'Page_1_2_bb_13', '../image/help/Page-1_2_bb_13.gif', 'Page_1_2_bb_14', '../image/help/Page-1_2_bb_14.gif', 'Page_1_2_bb_15', '../image/help/Page-1_2_bb_15.gif', 'Page_1_2_bb_16', '../image/help/Page-1_2_bb_16.gif', 'Page_1_2_bb_17',
'../image/help/Page-1_2_bb_17.gif'); return true;"><IMG SRC="../image/help/Page-1_2_bb_14.gif" WIDTH=157 HEIGHT=67 BORDER=0 ALIGN=bottom name="Page_1_2_bb_14"></A></P>
               </TD>
               <TD ROWSPAN=3 COLSPAN=3>
                  <P><IMG SRC="../image/help/Page-1_2_bb_15.gif" WIDTH=112 HEIGHT=188 ALIGN=bottom name="Page_1_2_bb_15"></P>
               </TD>
               <TD>
                  <P><IMG SRC="../image/help/spacer.gif" WIDTH=1 HEIGHT=67 ALIGN=bottom></P>
               </TD>
            </TR>
            <TR>
               <TD ROWSPAN=2 COLSPAN=3>
                  <P><IMG SRC="../image/help/Page-1_2_bb_16.gif" WIDTH=157 HEIGHT=121 ALIGN=bottom name="Page_1_2_bb_16"></P>
               </TD>
               <TD>
                  <P><IMG SRC="../image/help/spacer.gif" WIDTH=1 HEIGHT=27 ALIGN=bottom></P>
               </TD>
            </TR>
            <TR><TD>
                  <P><A HREF="/asp/help2.asp?siteId=<%= siteId %>&<%= navQueryString %>"><IMG SRC="../image/help/Page-1_2_bb_17.gif" WIDTH=311 HEIGHT=94 BORDER=0 ALIGN=bottom name="Page_1_2_bb_17"></A></P>
               </TD>
               <TD>
                  <P><IMG SRC="../image/help/spacer.gif" WIDTH=1 HEIGHT=94 ALIGN=bottom></P>
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
