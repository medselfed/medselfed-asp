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
.style3 {
	font-size: 9px;
	color: #FF9900;
}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function MM_goToURL() { //v3.0
  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
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
	<p class="lrgred">PatientPad Order Form<br>
	  <span class="style2">Custom Choices </span>	  </p>
	<br>
</div>
    <div class="lrtlines" align="center">
	<table cellpadding="0" cellspacing="0" width="95%"><tr><td>
	  <p class="sml" align="justify">      
	  <form name="form2" method="post" action="">
	    <span class="sml">
	    <input name="Submit" type="submit" onClick="MM_goToURL('parent','http://preop.medselfed.com/asp/order2.asp');return document.MM_returnValue" value="Go Back">
	    </span>	    <p>
	    <p class="sml" align="justify"><font class="lrgred">PreOp Surgery Centers</font><br>
	    <table width="589" border="0" cellpadding="10">
          <tr>
            <th scope="col"><span class="style2">(prices are quoted per month) <br>
                <span class="sml"><span class="style1">* available with active license only</span></span> </span></th>
            <th align="center" valign="middle" scope="col"><p class="style1">PatientPad<br>
              $24.95</p>              </th>
            <th align="center" valign="middle" scope="col"><span class="style1">WEB<br>
              $175</span></th>
            <th align="center" valign="middle" scope="col"><span class="style1">VHS*<br>
              $1.00</span></th>
            <th align="center" valign="middle" scope="col"><span class="style1">DVD*<br>
              $2.00</span></th>
            <th align="center" valign="middle" scope="col"><div align="center" class="style1">mpeg2(T)<br>
              $175</div></th>
            <th align="center" valign="middle" scope="col"><div align="center" class="style1">mpeg2(P)<br>
              $175</div></th>
          </tr>
          <tr>
            <td><span class="sml"><br>
              </span></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td align="center" valign="top"><span class="style1">per title </span></td>
            <td align="center" valign="top"><span class="style1">per title </span></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><span class="sml">
              <input type="checkbox" name="heart" value="checkbox">
PreOp Cardiac Center <a href="http://mkt.medselfed.com/asp/center.asp?centerId=heart" target="_blank"><span class="style3">(view)</span></a> 
              </span></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox" value="checkbox"></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox5" value="checkbox"></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox6" value="checkbox"></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox7" value="checkbox"></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox8" value="checkbox">              </td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox9" value="checkbox">              </td>
          </tr>
          <tr>
            <td><span class="sml">
              <input type="checkbox" name="women" value="checkbox">
PreOp Women's Center <a href="http://mkt.medselfed.com/asp/center.asp?centerId=womens" target="_blank"><span class="style3">(view)</span></a> 
              </span></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox10" value="checkbox"></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox11" value="checkbox"></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox12" value="checkbox"></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox13" value="checkbox"></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox14" value="checkbox"></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox15" value="checkbox"></td>
          </tr>
          <tr>
            <td><span class="sml">
              <input type="checkbox" name="checkbox2" value="checkbox">
PreOp Minimal Surgery Center <a href="http://mkt.medselfed.com/asp/center.asp?centerId=lap" target="_blank"><span class="style3">(view)</span></a> 
              </span></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox16" value="checkbox"></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox17" value="checkbox"></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox18" value="checkbox"></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox19" value="checkbox"></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox20" value="checkbox"></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox21" value="checkbox"></td>
          </tr>
          <tr>
            <td><span class="sml">
              <input type="checkbox" name="checkbox3" value="checkbox">
PreOp Orthopedic Center <a href="http://mkt.medselfed.com/asp/center.asp?centerId=ortho" target="_blank"><span class="style3">(view)</span></a> </span></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox22" value="checkbox"></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox23" value="checkbox"></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox24" value="checkbox"></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox25" value="checkbox"></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox26" value="checkbox"></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox27" value="checkbox"></td>
          </tr>
          <tr>
            <td><span class="sml">
              <input type="checkbox" name="checkbox4" value="checkbox">
PreOp Oncology Center <a href="http://mkt.medselfed.com/asp/center.asp?centerId=onco" target="_blank"><span class="style3">(view)</span></a> </span></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox28" value="checkbox"></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox29" value="checkbox"></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox30" value="checkbox"></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox31" value="checkbox"></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox32" value="checkbox"></td>
            <td align="center" valign="middle"><input type="checkbox" name="checkbox33" value="checkbox"></td>
          </tr>
        </table>
	    <p class="sml" align="justify"><br>
	        <br>
	      <br>
	      <br>
	      <br>
	      <br>
	    <br>
	      <p class="sml" align="justify"><font class="lrgred">Add PreOp Procedures <span class="style1">@ $4.95 each per month.</span> </font><br>
	  <br>
      <input type="checkbox" name="402" value="checkbox">
	  Abdominal Fibroid Removal - Myomectomy <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=402&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
	  <input type="checkbox" name="352" value="checkbox">
	  Achilles Tendon Repair <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=352&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
	  <input type="checkbox" name="357" value="checkbox">
	  Anti-Reflux Laparoscopy <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=357&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
	  <input type="checkbox" name="349" value="checkbox">
Arthroscopic Surgery Meniscus Repair of Knee <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=349&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="364" value="checkbox">
Balloon Angioplasty Coronary Angioplasty <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=364&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="338" value="checkbox">
Biopsy Surgery General Surgery <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=338&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="332" value="checkbox">
Breast Biopsy Incisional <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=332&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="333" value="checkbox">
Breast Biopsy Needle <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=333&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="334" value="checkbox">
Breast Biopsy Wire Guide <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=334&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="372" value="checkbox">
Bunion Removal Foot Surgery <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=372&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="361" value="checkbox">
Cardiac Catheterization Angiography <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=361&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="342" value="checkbox">
Carpal Tunnel Syndrome Repair <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=342&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="341" value="checkbox">
Cataract Small Incision <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=341&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="377" value="checkbox">
Coronary Artery Bypass Graft (CABG) <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=377&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="462" value="checkbox">
Coronary Artery Bypass Graft (CABG off-pump) <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=462&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="436" value="checkbox">
Cystoscopy - Female <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=436&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="435" value="checkbox">
Cystoscopy - Male <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=435&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="350" value="checkbox">
Dilation &amp;amp; Curettage of the Uterus <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=350&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="353" value="checkbox">
Endoscopy of Large Intestine <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=353&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="401" value="checkbox">
Fibroid - Tumor Removal Vaginal <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=401&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="343" value="checkbox">
Gallbladder Laparoscopic Cholecystectomy <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=343&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="440" value="checkbox">
Gallbladder Removal - Laparoscopic - Hassan Trocar <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=440&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="444" value="checkbox">
Gastric Bypass (Laparoscopic) <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=444&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="354" value="checkbox">
GI Endoscopy Upper GI <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=354&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="351" value="checkbox">
Hernia - Hiatal Laparoscopic <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=351&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="389" value="checkbox">
Hernia - Hiatal Open Repair <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=389&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="360" value="checkbox">
Hernia Repair Inguinal (Laparoscopic) <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=360&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="335" value="checkbox">
Hernia Repair Inguinal (Open) <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=335&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="382" value="checkbox">
Hip Replacement Surgery <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=382&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="349" value="checkbox">
Hysterectomy Removal of the Uterus <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=349&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="368" value="checkbox">
Hysterectomy: Uterus, Ovaries and Fallopian Tubes <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=368&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="337" value="checkbox">
Laparoscopy Diagnostic <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=337&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="376" value="checkbox">
Lasik Laser Eye Surgery <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=376&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="405" value="checkbox">
Mastectomy Modified Radical <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=405&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="407" value="checkbox">
Mastectomy Radical <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=407&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="403" value="checkbox">
Mastectomy Total <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=403&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="339" value="checkbox">
Myringotomy Insertion of Tube <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=339&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="336" value="checkbox">
Open Surgery General <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=336&secId=6" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="399" value="checkbox">
Permanent Pacemaker - Implant <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=399&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="375" value="checkbox">
PRK Laser Surgery <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=375&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="450" value="checkbox">
Shoulder Replacement Surgery <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=450&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="356" value="checkbox">
Spleen Removal Laparoscopic Splenectomy <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=356&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="370" value="checkbox">
Stent Implantation Coronary Angioplasty <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=370&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="380" value="checkbox">
Tonsillectomy <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=380&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="415" value="checkbox">
TURP - Transurethral Resection of the Prostate <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=415&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<input type="checkbox" name="414" value="checkbox">
Vasectomy <a href="http://mkt.medselfed.com/asp/prodDisplay.asp?prodId=414&secId=7" target="_blank"><span class="style3">(view)</span></a> <br>
<br>
<input name="Preview" type="submit" id="Preview" value="Preview Your Order">
<br>
	    </p>
	    <p class="sml" align="justify">&nbsp;</p>
	  </form>
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