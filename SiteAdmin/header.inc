<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>MedSelfEd Site Administrator</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="/css/main/keyframe.css" rel="stylesheet" type="text/css">
<link href="/css/main/fonts.css" rel="stylesheet" type="text/css">
<link href="/css/main/layout.css" rel="stylesheet" type="text/css">
<style>
.altButtonFormat {
background-color: #000066;
font-family: verdana;
border: #333333 1px solid;
font-size: 10px;
color: #FFFFFF
}

</style>
<script type="text/javascript" src="/js/preop/common.js"></script>
<script type="text/javascript" src="/js/preop/MM_functions.js"></script>
</head>
<body>
<center>
<div class="topdiv">
<script>
<!--
var navDropAry = new Array(); 
function navDropObj(name){
	this.name = name
}
	navDropAry[0] = new navDropObj('partnerDrop')
	navDropAry[1] = new navDropObj('navigationDrop')
	navDropAry[2] = new navDropObj('centerDrop')
	navDropAry[3] = new navDropObj('procedureDrop')
	navDropAry[4] = new navDropObj('questionDrop')
	navDropAry[5] = new navDropObj('helpDrop')

function showDrop(navObj){
	for(var x = 0; x != navDropAry.length; x++){
		if (navObj == navDropAry[x].name){
			show(navDropAry[x].name)
		} else (
			hide(navDropAry[x].name)
		)
	}
}

//-->
</script>
<table cellpadding="0" cellspacing="0" border="0" width="100%"><tr><td align="left" width="126"><img src="../image/partner/partner_ehc.gif" alt=""></td><td align="center" valign="middle" class="headshim">MedSelfEd Site Administrator<br><font class="smlgray">Wednesday, July 30, 2003</font></td><td align="right" width="107"><img src="../image/000/preop/powered.gif" class="homeHead" alt="" border="0"></td></tr></table>
<div align="left" class="divContHeader">
	<div class="backImg">
		<img src="../image/000/nav_bar.gif" class="navBar">
	</div>
	<div class="divContNav">
	<table border="0" cellspacing="0" cellpadding="0" width="100%"><tr>
		<td width="16%" align="center"  valign="top">
				<div id="partnerHead" class="navHeader"><a href="editPartner.asp?orderBy=partnerId" class="NavHead" onMouseOver="showDrop('partnerDrop')">Partners</a></div>
				<div id="partnerDrop" class="navDrop" onMouseOver="showDrop('partnerDrop')" onMouseOut="showDrop('none')">
		<table cellpadding="2" width="75" cellspacing="0" class="lrblines">
			<tr><td><a href="editPartner.asp?createNew=true" class="smlred">Create New</td></tr>
			<tr><td class="sml">Order By</td></tr>
			<tr><td><a href="editPartner.asp?orderBy=partnerId" class="navLink">&nbsp;Partner ID</a></td></tr>
			<tr><td><a href="editPartner.asp?orderBy=name" class="navLink">&nbsp;Name</a></td></tr>
		</table>
	</div>
		</td><td width="16%" align="center"  valign="top">
				<div id="navigationHead" class="navHeader"><a href="editNavigation.asp?table=navlinks&key=navlinkId" class="NavHead" onMouseOver="showDrop('navigationDrop')">Navigation</a></div>
				<div id="navigationDrop" class="navDrop" onMouseOver="showDrop('navigationDrop')" onMouseOut="showDrop('none')">
		<table cellpadding="2" width="75" cellspacing="0" class="lrblines">
			<tr><td><a href="editNavigation.asp?table=navlinks&key=navlinkId" class="navLink">Top Bar</a></td></tr>
			<tr><td><a href="editNavigation.asp?table=navdrops&key=navdropId" class="navLink">Nav Drops</a></td></tr>
		</table>
	</div>
		</td><td width="16%" align="center"  valign="top">
				<div id="centerHead" class="navHeader"><a href="editCenters.asp" class="NavHead" onMouseOver="showDrop('centerDrop')">Centers</a></div>
				<div id="centerDrop" class="navDrop" onMouseOver="showDrop('centerDrop')" onMouseOut="showDrop('none')">
		<table cellpadding="2" width="75" cellspacing="0" class="lrblines">
			<tr><td><a href="editCenters.asp?createNew=true" class="smlred">Create New</a></td></tr>
			<tr><td class="sml">Order By</td></tr>
			<tr><td><a href="editCenters.asp?orderBy=centerId" class="navLink">&nbsp;Center ID</a></td></tr>
			<tr><td><a href="editCenters.asp?orderBy=text" class="navLink">&nbsp;Name</a></td></tr>
			<tr><td><a href="editCenters.asp?orderBy=siteId" class="navLink">&nbsp;Site ID</a></td></tr>
		</table>
	</div>
		</td><td width="16%" align="center"  valign="top">
				<div id="procedureHead" class="navHeader"><a href="editProds.asp?orderBy=prodId" class="NavHead" onMouseOver="showDrop('procedureDrop')">Procedures</a></div>
				<div id="procedureDrop" class="navDrop" onMouseOver="showDrop('procedureDrop')" onMouseOut="showDrop('none')">
		<table cellpadding="2" width="75" cellspacing="0" class="lrblines">
			<tr><td><a href="editProds.asp?createNew=true" class="smlred">Create New</td></tr>
			<tr><td class="sml">Order By</td></tr>
			<tr><td><a href="editProds.asp?orderBy=prodId" class="navLink">&nbsp;Prod ID</a></td></tr>
			<tr><td><a href="editProds.asp?orderBy=text" class="navLink">&nbsp;Name</a></td></tr>
			<tr><td><a href="editProds.asp?orderBy=siteId" class="navLink">&nbsp;Site ID</a></td></tr>
		</table>
	</div>
		</td><td width="16%" align="center"  valign="top">
			<div id="questionHead" class="navHeader"><a href="editQuestions.asp" class="NavHead" onMouseOver="showDrop('questionDrop')">Questions</a></div>
			<div id="questionDrop" class="navDrop" onMouseOver="showDrop('questionDrop')" onMouseOut="showDrop('none')">
		<table cellpadding="2" width="75" cellspacing="0" class="lrblines">
		<tr><td><a href="editQuestions.asp?createNew=true" class="smlred">Create New</td></tr>
		<tr><td><a href="editQuestions.asp" class="navLink">All Questions</td></tr>
		<tr><td><a href="showAnswers.asp" class="navLink">All Responses</a></td></tr>
		</table>
	</div>
		</td><td width="16%" align="center"  valign="top">
			<div id="helpHead" class="navHeader"><a href="help.asp" class="NavHead" onMouseOver="showDrop('helpDrop')">Help</a></div>
			<div id="helpDrop" class="navDrop" onMouseOver="showDrop('helpDrop')" onMouseOut="showDrop('none')"></div>
		</td></tr></table>
</div>
<br>
<div class="lrlines">&nbsp;