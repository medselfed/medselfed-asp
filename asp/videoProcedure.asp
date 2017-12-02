<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="global.inc" -->
<%

	<!-- dynamically include xml files -->

	fileName = "/xml/center/"& centerId &".xml"



	<!-- using the MSXML Document object model  -->

	set navDoc = Server.CreateObject("Microsoft.XMLDOM") 

	navDoc.validateOnParse = false 

	navDoc.load(Server.MapPath(fileName))

	' begin to read XML file

	set navDocRoot = navDoc.documentElement

	set centerElement = navDocRoot.getElementsByTagName("centerElement")

	siteId = navDocRoot.selectSingleNode("siteId").text

titleText = "MedSelfEd Patient Education: Video Procedure"

%>
<!--#include file="chromehead.inc" --> 
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
<script type="text/javascript" >

// load images for procedure rollovers

var centerImage = new Array(); 
var videoPlaying = false;

function getCenterImageObj(){

<% for i = 1 to centerElement.length %>
	centerImage[<%= (i - 1) %>] = new Image()
	centerImage[<%= (i - 1) %>].src = '<%= centerElement.item(i - 1).getAttribute("prodImage") %>'
	centerImage[<%= (i - 1) %>].id = '<%= centerElement.item(i - 1).getAttribute("prodId") %>'

<% next %>

}



function getNavImageObj(){
	genNavImageOn = new Image()
	genNavImageOn.src = imageUrl + '/000/dot3_r.gif'
	
	genNavImageOff = new Image()
	genNavImageOff.src = imageUrl + '/000/dot3.gif'
}

function playvideo(){

}

function showvideo (prodId){
	
	hideAllText()
	
	document.getElementById('videoFrame').src = "/asp/videoFile.asp?prodId=" + prodId + "&partnerId=<%= partnerId %>" ;
	videoPlaying = true;
	document.getElementById('prodName' + prodId).style.visibility = "visible";
	document.getElementById('prodVideoDiv').style.visibility = "visible";
	document.getElementById('prodImageDiv').style.visibility = "hidden";
	document.getElementById('prodFrame').src = "/asp/prodDisplay.asp?prodId=" + prodId + "&partnerId=<%= partnerId %>&centerId=<%= centerId %>&hideNav=true&campId=<%= campId %>"
}

function visitProd(prodId){
	document.location.href = "#top";
	document.getElementById('prodFrame').src = "/asp/prodDisplay.asp?prodId=" + prodId + "&partnerId=<%= partnerId %>&centerId=<%= centerId %>&hideNav=true&campId=<%= campId %>"
}


function hideAllText(){

	for(var x = 0; x!= centerImage.length; x++){
		document.getElementById('prodName' + centerImage[x].id).style.visibility = "hidden";
	}
	
}

function hidevideo(){
	document.getElementById('videoFrame').src = "/asp/videoBlank.asp";

	document.getElementById('prodImageDiv').style.visibility = "visible";
	document.getElementById('prodListDiv').style.visibility = "visible";
	document.getElementById('prodTextDiv').style.visibility = "visible";


	document.getElementById('prodTextDivOn').style.visibility = "hidden";
	document.getElementById('prodListDivOn').style.visibility = "hidden";

	document.getElementById('prodVideoDiv').style.visibility = "hidden";
}



getNavImageObj()

getCenterImageObj()

</script>
</head>
<body><center>
<div class="topdiv"> 
<!--#include file="header.inc" -->
  <!--#include file="help.inc" -->
  <div class="lrlines">&nbsp; 
    <table width="95%" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
      <tr>
        <td colspan="2" align="left" valign="middle" > <div id="prodTextDiv" class="medred" style="position:absolute; top:75px; visibility:visible"> 
            <br>
            &nbsp; &nbsp; Click to watch full related videos. </div>
		</td>
      </tr>
      <tr>
        <td align="left" valign="middle"> <div id="prodListDiv" style="position:absolute; top:20px; visibility:visible"> 
            <table bgcolor="#ffffff" border="0" cellspacing="0" cellpadding="5">
              <% for i = 1 to centerElement.length %>
              <% if prodId = centerElement.item(i - 1).getAttribute("prodId") Then %>
			  <div id="prodName<%= centerElement.item(i - 1).getAttribute("prodId") %>" style="position:absolute; top:2px; left:10px; width:250px; visibility:visible; font-size:13px; text-decoration:none" class="header4">
			  <% else %>
			  <div id="prodName<%= centerElement.item(i - 1).getAttribute("prodId") %>" style="position:absolute; top:2px; left:10px; width:250px; visibility:hidden; font-size:13px; text-decoration:none" class="header4">
			  <% end if %>
				<%= centerElement.item(i-1).text %>
				<br>
				<div style="position:relative">
				<div onClick="showvideo('<%= centerElement.item(i - 1).getAttribute("prodId") %>')" style="float:left; width:100px; padding:3px; color:#7F7F7F; cursor:pointer; font-size:10px; text-decoration:none"><img src="/image/icons/22x22/actions/forward.png" align="middle">Play Video</div>
				<div onClick="visitProd('<%= centerElement.item(i - 1).getAttribute("prodId") %>')" style="float:right; width:120px; vertical-align:top; padding:3px; color:#7F7F7F; cursor:pointer; font-size:10px; text-decoration:none"><img src="/image/icons/22x22/actions/editpaste.png" align="middle">Visit Procedure</div>
				</div>
			  </div>
			  <div style="position:relative; left:10px; width:290px; top:83px; visibility:visible">
			  <img align="top" src="../image/000/dot3.gif" height="12" width="20" border="0" name="prodDot<%= i - 1 %>">
			  <a href="javascript:;" style="font-size:10px" onclick="showvideo('<%= centerElement.item(i - 1).getAttribute("prodId") %>')" onMouseOut="if(!videoPlaying) restoreImage(document.images['prodDot<%= i - 1 %>']);  swapImage(document.images['prodDot<%= i - 1 %>'],genNavImageOff);" onMouseOver="if(!videoPlaying) swapImage(document.images['prodImage'],centerImage[<%= (i - 1) %>]); swapImage(document.images['prodDot<%= i - 1 %>'],genNavImageOn);"><%= centerElement.item(i-1).text %></a> 
			  </div>
			  			  
              <tr> 
                <td valign="middle"> 
                </td>
                <td valign="middle">		
				</td>
              </tr>
              <% next %>
            </table>
          </div>
		</td>
        <td align="right" valign="middle" height="260"> 
          <!-- get first image and procedure center !-->
		  <a name="top"></a>
          </td>
      </tr>
    </table>
    <br>
    <div id="prodImageDiv" style="position:absolute; top:50px; left:290px; width:330px; align:right; visibility:visible"> 
        <image name="prodImage" src="/image/<%= prodId %>/<%= prodId %>.gif"> 
    </div>	
	<div id="prodVideoDiv" style="position:absolute; top:30px; left:260px; width:330px; align:right; visibility:hidden"> 
            <iframe frameborder="0" scrolling="no" id="videoFrame" height="280" width="330"></iframe>
    </div>
  </div>
  <script language="JavaScript">
<!--
/*
var getFFVersion=navigator.userAgent.substring(navigator.userAgent.indexOf("Firefox")).split("/")[1]
var FFextraHeight=parseFloat(getFFVersion)>=0.1? 16 : 0 //extra height in px to add to 
function resizeframe(){
	var prodIframeObj = document.getElementById('prodFrame');
	if (prodIframeObj.contentDocument && prodIframeObj.contentDocument.body.offsetHeight){ //ns6 syntax
		prodIframeObj.height = prodIframeObj.contentDocument.body.offsetHeight+FFextraHeight; 
	} else { //ie5+ syntax
		alert('test')
		prodIframeObj.height = prodIframeObj.document.body.scrollHeight;
	}
}
*/
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

//-->

</script>
  <img src="../image/000/bottom_cap2.gif" class="bottomCap" alt="" width="32" height="32"> 
</div>
</center>
<iframe id="prodFrame"  scrolling="no" src="http://<%= partnerId %>.medselfed.com/asp/prodDisplay.asp?prodId=<%= prodId %>&partnerId=<%= partnerId %>&centerId=<%= centerId %>&hideNav=true&campId=<%= campId %>" width="100%" height="3500" frameborder="0"></iframe>
<!--#include file="tracking.inc" -->
</body>
</html>
<!--#include file="chromefoot.inc" -->
<% 
	Session("homelink") = "/asp/center.asp?centerId=" & centerId
%>
