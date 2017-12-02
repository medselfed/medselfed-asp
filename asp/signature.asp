<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="../global.inc" -->
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
<style type="text/css">
<!--
.style1 {font-size: 10px}
.style2 {font-size: 12px}
.style3 {	font-size: 9px;
	color: #FF9900;
}
.style5 {font-size: 24px}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--


function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>
<body>
<center>
<div class="topdiv">
<img src="../../image/000/top_cap2.gif" class="bottomCap" alt="">
<div class="lrlines">
	<img src="/image/000/preop/logo_b.gif">
	<p class="lrgred">Transfer Media<br> 
	   Order Form<br>
	  <span class="style1">Personal &amp; Content Information </span></p>
	<br>
</div>
    <div class="lrtlines" align="center">
	<table cellpadding="0" cellspacing="10" width="95%"><tr><td>
	<p class="sml" align="justify"><font class="lrgred"><span class="style5">1.</span> Personal Information </font><br>    
	<form name="form1" method="post" action="">
      <table width="644" height="35" border="0">
        <tr>
          <th scope="col"><div align="right"><span class="style1">First Name</span></div></th>
          <th scope="col"><div align="left">
            <p>
              <input name="FirstName" type="text" id="FirstName">
                <span class="style1">Last Name</span>
                <input name="LastName" type="text" id="LastName">
            </p>
            </div></th>
        </tr>
        <tr>
          <th scope="col"><div align="right"><span class="style1">Company </span></div></th>
          <th scope="col"><div align="left"><span class="style1">
              <input name="Company" type="text" id="Company" size="56">
          </span></div></th>
        </tr>
        <tr>
          <th scope="col"><div align="right"><span class="style1">Address1</span></div></th>
          <th scope="col"><div align="left"><span class="style1">
              <input name="Address1" type="text" id="Address1" size="56">
          </span></div></th>
        </tr>
        <tr>
          <th scope="col"><div align="right"><span class="style1">Address2</span></div></th>
          <th scope="col"><div align="left"><span class="style1">
              <input name="Address2" type="text" id="Address2" size="56">
          </span></div></th>
        </tr>
        <tr>
          <th scope="col"><div align="right"><span class="style1">City</span></div></th>
          <th scope="col"><div align="left"><span class="style1">
              <input name="City" type="text" id="City">
  State
  <input name="State" type="text" id="State" size="4" maxlength="2">
  Zip Code
  <input name="ZipCode" type="text" id="ZipCode" size="12" maxlength="10">
          </span></div></th>
        </tr>
        <tr>
          <th scope="col"><div align="right"><span class="style1">Phone</span></div></th>
          <th scope="col"><div align="left"><span class="style1">
              <input name="Phone" type="text" id="Phone" size="21" maxlength="19">
Email
<input name="Email" type="text" id="Email">
</span></div></th>
        </tr>
        <tr>
          <th scope="col"><div align="right"><span class="style1">Fax</span></div></th>
          <th scope="col"><div align="left"><span class="style1">
              <input name="Fax" type="text" id="Fax" size="22" maxlength="19">
          </span></div></th>
        </tr>
      </table>
      <p class="sml" align="justify"><font class="lrgred"><br>
        <br>
          <span class="style5">2.</span> Content</font> <br>
          <br>     
      <table width="512" border="0">
        <tr>
          <th width="83" valign="top" scope="col"><div align="left">Title</div></th>
          <th width="29" scope="col">&nbsp;</th>
          <th width="386" scope="col"><div align="left">
            <input name="textfield" type="text" size="50">
          </div></th>
        </tr>
        <tr>
          <td valign="top"><div align="left">Length</div></td>
          <td>&nbsp;</td>
          <td><div align="left">
            <p>
              <input type="text" name="textfield2">
(Hour : Minutes : Seconds)
<br>
<br>
<br>
<label>              </label>
            </p>
          </div></td>
        </tr>
        <tr>
          <td valign="top">Present Media Type</td>
          <td>&nbsp;</td>
          <td valign="top"><div align="left">
            <label>
            <input type="radio" name="Media Type" value="radio">
VHS</label>
            <br>
            <label>
            <input type="radio" name="Media Type" value="radio">
DVD</label>
            <br>
            <label>
            <input type="radio" name="Media Type" value="radio">
8mm</label>
            <br>
            <label>
            <input type="radio" name="Media Type" value="radio">
Film</label>
            <br>
            <br>
            <br>
          </div></td>
        </tr>
        <tr>
          <td valign="top">Transfered Media Type </td>
          <td>&nbsp;</td>
          <td valign="top"><div align="left">
            <p>
              <label>
              <input type="checkbox" name="VHS" value="VHS">
              VHS</label>
              <br>
              <label>
              <input type="checkbox" name="DVD" value="DVD">
  DVD</label>
              <br>
              <label>
              <input type="checkbox" name="MPEG2" value="MPEG2">
  MPEG2</label>
              <br>
              <label>
              <input type="checkbox" name="For PatientPad" value="PP">
  For PatientPad</label>
              <br>
              <label>
              <input type="checkbox" name="For Web (wmp)" value="wmp">
  For Web (Windows Media Player)</label>
              <br>
              <label>
              <input type="checkbox" name="For Web (qt)" value="qt">
  For Web (QuickTime)</label>
              <br>
              <br>
              <br>
            </p>
          </div></td>
        </tr>
        <tr>
          <td valign="top">Special Requests: </td>
          <td>&nbsp;</td>
          <td><div align="left">
            <textarea name="textarea" cols="50" rows="8"></textarea>
          </div></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td><div align="left"></div></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td><div align="left"></div></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td><div align="left"></div></td>
        </tr>
      </table>
      <p><br>
        <br>
        <br>
        <p class="sml" align="justify"><font class="lrgred"><u>PRINT</u></font><br>
          <br>
          <label>          </label>
          <br>
<br>
<label>
</label>
<br>
<span class="style1"></span>      </p>
      </form>
	<p class="sml" align="justify">	<br>
        <br>
     
      <p class="sml" align="justify">&nbsp;</p>
      </td>
	</tr>
	</table>
    </div>
    <img src="../../image/000/bottom_cap2.gif" class="bottomCap" alt="">
</div>
</center>
</body>
</html>