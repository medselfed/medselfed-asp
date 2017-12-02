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
<% headerType = "true" %>
</head>
<body>
<center>
<div class="topdiv">
<!--#include file="header.inc" -->
</div>
<div class="lrlines">&nbsp;
      <table cellpadding="2" cellspacing="0" width="99%">
        <tr> 
          <td width="50%" valign="top" align="center"> 
            <p class="smlred"><br>
              Click onto one of the bodies to enter site.</p>
            <a href="/asp/body.asp?sexId=male&<%= navQueryString  %>"><img src="../image/body/body_m.gif" border="0" height="254" width="103" onMouseOver="swapImage(this,maleBodyOnImgObj)" onMouseOut="restoreImage(this)"></a><a href="/asp/body.asp?sexId=male&<%= navQueryString %>"><img src="../image/body/body_f.gif" border="0" onMouseOver="swapImage(this,femaleBodyOnImgObj)" height="254" width="103" onMouseOut="restoreImage(this)"></a> 
          <td width="50%">
            <p class="sml"><font class="medviolet"><br>
              T</font>his is an information resource designed to help you understand 
              the nature of a medical condition and the surgical procedure most 
              commonly used to treat it.</p>
            <p class="sml">Our hope is that we will help you to:</p>
            <p class="smlred">&#8226; gain a better understanding of your medical 
              condition,<br>
              &#8226; know your treatment options,<br>
              &#8226; understand the risks of surgery - as well as the risk should 
              you decide not to have the treatment your doctor recommends.<br>
              &#8226; You should also know what to expect on the day of surgery<br>
              &#8226; and know how to care of yourself during recovery.</p>
            <p class="sml">This site is available in order to answer common questions 
              and to help you make an educated and careful decision about your 
              treatment. If you have any questions about your medical condition 
              or the surgical procedure presented on this site - the person to 
              ask is your doctor.</p>
            <p class="sml">As you explore, feel free to click on illustration 
              icons for an enlarged view, or click on movie or audio buttons.</p>
            <p class="sml"><font class="smlred">NOTE:</font> The site is best 
              viewed using browers Netscape 6 or Internet Explorer 5 or better. 
              You should also make sure that you have installed QuickTime or Windows 
              Media Player on your computer.<br>
              <br>
            </p>
          </td>
        </tr>
		<% if partnerId <> "dmc" Then %>
		        <tr> 
          <td colspan="2" align="center"> <br>
            <img src="../image/000/hon.gif">
            <p class="sml">We subscribe to the <a href="http://www.hon.ch/HONcode/Conduct.html?HONConduct454742">HONcode 
              principles</a><br>
              of the <a href="http://www.hon.ch/">Health On the Net Foundation</a></p>
		  </td>	
		</tr>
		<% end if %>
      </table>
      <br>
    </div>
<div class="topdiv">
<!--#include file="footer.inc" -->
</div>
</center>
</body>
</html>
<!--#include file="chromefoot.inc" -->
