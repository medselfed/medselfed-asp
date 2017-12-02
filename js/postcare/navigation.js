// JavaScript Document
function navElementObj(){
	var args = navElementObj.arguments
	this.name = args[0]
	this.linkUrl = args[1]
	this.linkSelected = args[2]
	this.prodId = args[3]
	this.secId = args[4]
	this.media = args[5]
	this.mediaMap = args[6]
}

function procdureInfoObj(){
	var args = procdureInfoObj.arguments
	this.name = args[0]
	this.image = args[1]
	this.text = args[2]
	this.media = args[3]
	this.mediaMap = args[4]
}
var topHtml = ''
var headHtml = ''

var navigationImage = new Array(); 

function getImageObj(){
	navigationImage[0] = new Image()
	navigationImage[0].src = imageUrl + '/000/nav/nav_on.gif'

	navigationImage[1] = new Image()
	navigationImage[1].src = imageUrl + '/000/nav/nav.gif'
	
	navigationImage[2] = new Image()
	navigationImage[2].src = imageUrl + '/000/nav/nav_go.gif'
}

function swapImage(){
	var args = swapImage.arguments
	imageObj = args[0]
	swapObj = args[1]
	imageObj.src = swapObj.src
}

var imageUrl = '../image'
var navOnImage = ' <IMG SRC="' + imageUrl + '/000/nav/nav_on.gif" WIDTH=17 HEIGHT=17 BORDER=0 ALIGN=middle>'
var navOffImage = ' <IMG onMouseOver="swapImage(this,navigationImage[2])"  onMouseOut="swapImage(this,navigationImage[1])" SRC="' + imageUrl + '/000/nav/nav.gif" WIDTH=17 HEIGHT=17 BORDER=0 ALIGN=middle>'

function getSpotImage(){
	newHtml = ''
	newHtml += '<image src="' + procdureInfoArray[(spotId - 1)].image + '">'
	document.write(newHtml)
	
}

function getSpotText(){
alert(procdureInfoArray[(spotId - 1)].text)
	document.write(procdureInfoArray[(spotId - 1)].text)
	
}

function getSpotLink(){
	newHtml = ''
	if(secId != 1){
		newHtml = '<a href="../html/template2.htm?prodId=' + prodId + '&secId=' + secId + '&spotId=' + (spotId - 1) + '">prev</a>'
	} else {
		newHtml = '<a href="../html/template2.htm?prodId=' + prodId + '&secId=' + secId + '&spotId=' + (spotId + 1) + '">|</a>'
	}
		newHtml = '<a href="">close</a>'
	if(secId != navElmenentArray.length){
		newHtml = '<a href="../html/template2.htm?prodId=' + prodId + '&secId=' + secId + '&spotId=' + (spotId - 1) + '">|</a>'
	} else {
		newHtml = '<a href="../html/template2.htm?prodId=' + prodId + '&secId=' + secId + '&spotId=' + (spotId + 1) + '">prev</a>'
	}

	document.write(newHtml)
}

function getSecLinks(){
	newHtml = ''
	newHtml +='<table width="100%" border="0" cellspacing="0" cellpadding="10"><tr>'
	if(secId != 1){
   		newHtml +='<td align="left" valign="middle" width="33%"><a href="../html/' + navElmenentArray[(secId - 1)].linkUrl + '?prodId=' + prodId + '&secId=' + (secId - 1) + '">previous</a></td>'
    } else {
   		newHtml +='<td align="left" valign="middle" width="33%">&nbsp;</td>'
	}
	newHtml +='<td align="center" valign="middle" width="33%"><a href="#top">top of page</a></td>'
	if(secId != navElmenentArray.length){
   		newHtml +='<td align="right" valign="middle" width="33%"><a href="../html/' + navElmenentArray[(secId - 1)].linkUrl + '?prodId=' + prodId + '&secId=' + (secId + 1) + '">next</a></td>'
    } else {
   		newHtml +='<td align="right" valign="middle" width="33%">&nbsp;</td>'
	}

	newHtml +='</tr></table>'
	
	document.write(newHtml)
}

function getSplitProcedureInfo(){
	var args = getSplitProcedureInfo.arguments
	var spotStart = args[0]
	var spotStop = args[1]
	var newHtml = ''
	newHtml += '<table width="580" border="0" cellspacing="5" cellpadding="0">'
	newHtml += '<tr><td valign="top" colspan="3">' + topHtml + '</td></tr>'
	
	for(var x = spotStart; x != spotStop; x++){
		if(procdureInfoArray[x].media != ''){
			newHtml += '<tr><td valign="top"><IMG SRC="' + procdureInfoArray[x].media + '" ALT="Movie" BORDER=1 ALIGN=middle></td>'
		} else {
			newHtml += '<tr><td valign="top"></td>'
		}
		newHtml += '<td valign="top"><a href="../html/template2.htm?prodId=' + prodId + '&secId=' + secId + '&spotId=' + (x + 1) + '"><IMG SRC="' + procdureInfoArray[x].image + '" ALIGN=middle border="0"></A></td>'
		newHtml += '<td width="100%">' + procdureInfoArray[x].text + '</td></tr>'
	}
newHtml += '<tr><td valign="top" colspan="3">' + midHtml + '</td></tr>'
newHtml += '</table>'

document.write(newHtml)
	
	
}


function getProcedureInfo(){
var newHtml = ''
newHtml += '<table width="580" border="0" cellspacing="5" cellpadding="0">'
newHtml += '<tr><td valign="top" colspan="3">' + topHtml + '</td></tr>'
	for(var x = 0; x != procdureInfoArray.length; x++){
		if(procdureInfoArray[x].media != ''){
			newHtml += '<tr><td valign="top"><IMG SRC="' + procdureInfoArray[x].media + '" ALT="Movie" BORDER=1 ALIGN=middle></td>'
		} else {
			newHtml += '<tr><td valign="top"></td>'
		}
		newHtml += '<td valign="top"><a href="../html/template2.htm?prodId=' + prodId + '&secId=' + secId + '&spotId=' + (x + 1) + '"><IMG SRC="' + procdureInfoArray[x].image + '" ALIGN=middle border="0"></A></td>'
		newHtml += '<td width="100%">' + procdureInfoArray[x].text + '</td></tr>'
	}
newHtml += '<tr><td valign="top" colspan="3">' + midHtml + '</td></tr>'
newHtml += '</table>'

document.write(newHtml)
}

function getNavElement(){

var newHtml = ''
var thisLink = ''
newHtml += '<TABLE BORDER=1 CELLSPACING=0 CELLPADDING=2 WIDTH=155>'
	for(var x = 0; x != navElmenentArray.length; x++){
		thisLink = '<a href="../html/' + navElmenentArray[x].linkUrl + '?prodId=' + navElmenentArray[x].prodId + '&secId=' + navElmenentArray[x].secId + '" class="alt">'
		if(secId == navElmenentArray[x].secId){
			navElmenentArray[x].linkSelected = true
		} else {
			navElmenentArray[x].linkSelected = false
		}
		
		if(navElmenentArray[x].linkSelected){
			newHtml += '<tr><td width="20">' + thisLink + '' + navOnImage + '</a></td><td>' + thisLink + '<u>' + navElmenentArray[x].name + '</u></a></td></tr>'
		} else {
			
			newHtml += '<tr><td width="20">' + thisLink + '' + navOffImage + '</a></td><td class="bground">' + thisLink + '' + navElmenentArray[x].name + '</a></td></tr>'
		}
	}
	newHtml +='</table>'
	document.write(newHtml)
}

function getStaticHtml(){
	var args = getStaticHtml.arguments
	var htmlText = args[0]
	if(htmlText != 'undefined' || htmlText != ''){
		document.write(htmlText)
	}
}

function getHostAudio(){
var newHtml = ''
	newHtml += '<IMG USEMAP="#audioMap" SRC="' + navElmenentArray[(secId - 1)].media + '" ALT="Audio Presentation" WIDTH=146 HEIGHT=134 BORDER=0 ALIGN=bottom>'
document.write(newHtml)
}

function getAudioMap(){
var newHtml = ''
	newHtml += '<MAP NAME="audioMap">'
    newHtml += '<AREA SHAPE="rect" COORDS="1,112,19,131" HREF="javascript:;" onClick="MM_openBrWindow(\'mediawin.htm?prodId=' + prodId + '&file=' + navElmenentArray[(secId - 1)].audioClipQt + '&type=qt\',\'littlewin\',\'width=225,height=100\');">'
    newHtml += '<AREA SHAPE="rect" COORDS="124,112,145,132" HREF="javascript:;" onClick="MM_openBrWindow(\'mediawin.htm?prodId=' + prodId + '&file=' + navElmenentArray[(secId - 1)].audioClipWm + '&type=wm\',\'littlewin\',\'width=225,height=100\');">'
    newHtml += '</MAP>'
	document.write(newHtml)
}

function getHeader(){
var newHtml = ''

	newHtml += '<table width="100%" border="0" cellspacing="0" cellpadding="0">'
	newHtml += '<tr><td height="100" valign="top">Powered By<br><IMG SRC="' + imageUrl + '/000/preopmini.gif" ALT="HOME" WIDTH=49 HEIGHT=53 BORDER=0 ALIGN=bottom></td></tr>'
	newHtml += '<tr><td class="header">' + navElmenentArray[(secId - 1)].name + '</td></tr>'
	newHtml += '<tr><td>' + pageHeader + '</td></tr>'
	newHtml += '</table>'
	
document.write(newHtml)
}

function getHeadHtml(){
		document.write(headHtml)
}

function getMediaEmbed(){
var newHtml = ''
if(mediaType == 'qt'){
	newHtml += '<EMBED SRC="' + fileName + '" PLUGINSPAGE="http://quicktime.apple.com" WIDTH=160 HEIGHT=16 CONTROLLER=true LOOP=false AUTOPLAY=true>'
} else {
	newHtml += '<EMBED SRC="' + fileName + '" PLUGINSPAGE="http://www.microsoft.com/Windows/mediaxPlayer/" WIDTH=146 HEIGHT=20 type="application/x-mplayer2" name=MediaPlayer2 autostart=true>'
}
document.write(newHtml)
}