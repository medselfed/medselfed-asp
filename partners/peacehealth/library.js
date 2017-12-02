function getCookie(name) {
  var dc = document.cookie;
  var prefix = name + "=";
  var begin = dc.indexOf("; " + prefix);
  if (begin == -1) {
    begin = dc.indexOf(prefix);
    if (begin != 0) return null;
  } else
    begin += 2;
  var end = document.cookie.indexOf(";", begin);
  if (end == -1)
    end = dc.length;
  return unescape(dc.substring(begin + prefix.length, end));
}


// Used to create banner & menu for system-wide content areas
function CreateSystemBanner()
{
  var banner = getCookie("Banner");
  var menuID = getCookie("MenuID");
  var regionID = getCookie("RegionID");  
  if(banner == null)
    banner = "BannerHome";
  if(menuID == null)
    menuID = "1";
  document.write ('<script language=JavaScript>');
  document.write ('CreateBanner("' + banner + '.gif");');
  document.write ('</script>');
  document.write ('<script type="text/javascript" src="http://www.peacehealth.org/std/menu' + menuID + '.js"></script>');
}


// Used to create banners
function CreateBanner(sBanner)
{
  var Path = getCookie("Directory");

  if(sBanner == "banner_OHVI.gif")
  {
    document.write ('<table cellpadding=0 cellspacing=0 border=0>');
    document.write ('<tr>');
    document.write ('<td bgcolor=#9E1B34>');
    document.write ('<img src=http://www.peacehealth.org/images/OHVI/banner_OHVI.gif border=0>');
    document.write ('</td>');
    document.write ('<td width=100% bgcolor=#9E1B34></td>');
    document.write ('<td bgcolor=#ECD1D6><img src=http://www.peacehealth.org/images/OHVI/Banner-R_OHVI.gif width="112" height="79"></td>');
    document.write ('<td bgcolor=#ECD1D6>');
    document.write ('<table cellpadding=0 cellspacing=0>');
    document.write ('<tr><td colspan=2 bgcolor=#ECD1D6><a href=/ohvi/><img src=http://www.peacehealth.org/images/OHVI/Banner-SearchHomeOHVI.gif width="111" height="27" border=0></a>');
    document.write ('<img src=http://www.peacehealth.org/images/OHVI/Banner-LineOHVI.gif width="11" height="27" border=0>');
    document.write ('<a href=http://www.peacehealth.org/OHVI/contact.htm><img src=http://www.peacehealth.org/images/OHVI/Banner-SearchContactOHVI.gif width="67" height="27" border=0></a>');
    document.write ('</td></tr>');  
    document.write ('<tr>');
    document.write ('<td bgcolor=#ECD1D6><img src=http://www.peacehealth.org/images/OHVI/Banner-SearchOHVI.gif width="54" height="29"></td>');
    document.write ('<td bgcolor=#ECD1D6><form action=http://www.peacehealth.org/apps/search/default.asp><input TYPE="HIDDEN" name="Action" VALUE="New"><input type=text name=SearchString size=8> <input type=hidden name=area value=/OHVI/><input type=image src=http://www.peacehealth.org/images/OHVI/Button-SearchOK_OHVI.jpg border=0 width="23" height="23"></td></tr></form>');
    document.write ('<tr><td bgcolor=#ECD1D6></td><td bgcolor=#ECD1D6><a href=/apps/search/><img src=http://www.peacehealth.org/images/OHVI/Banner-ASearchOHVI.jpg width="91" height="15" border=0></a></td></tr>');
    document.write ('</table>');
    document.write ('</td>');
    document.write ('</tr>');
    document.write ('</table>');

    document.write ('<span id=menuContents></span>');  
    return;
  }
  
  document.write ('<table cellpadding=0 cellspacing=0>');
  document.write ('<tr>');
  document.write ('<td bgcolor=#11568c>');
  if(sBanner=='BannerHome.gif')
    document.write ('<a href=/>')
  document.write ('<img src=http://www.peacehealth.org/images/' + sBanner + ' border=0>');
  if(sBanner=='BannerHome.gif')
    document.write ('</a>')
  document.write ('</td>');
  document.write ('<td width=100% bgcolor=#11568c></td>');
  document.write ('<td bgcolor=#BACBD8><img src=http://www.peacehealth.org/images/Banner-Right.jpg width="112" height="79"></td>');
  document.write ('<td bgcolor=#BACBD8>');
  document.write ('<table cellpadding=0 cellspacing=0>');
  document.write ('<tr><td colspan=2 bgcolor=#BACBD8 NOWRAP><a href=/><img src=http://www.peacehealth.org/images/Banner-SearchHomeA.jpg width="111" height="27" border=0></a>');
  document.write ('<img src=http://www.peacehealth.org/images/Banner-SearchHomeB.jpg width="11" height="27" border=0>');
  document.write ('<a href=http://www.peacehealth.org/notices/contactu.htm><img src=http://www.peacehealth.org/images/Banner-SearchHomeC.jpg width="67" height="27" border=0></a>');
  document.write ('</td></tr>');  
  document.write ('<tr>');
  document.write ('<td bgcolor=#BACBD8><img src=http://www.peacehealth.org/images/Banner-SearchTop.jpg width="54" height="29"></td>');
  document.write ('<td bgcolor=#BACBD8><form action=http://www.peacehealth.org/apps/search/default.asp><input TYPE="HIDDEN" NAME="Action" VALUE="New"><input type=text name=SearchString size=8> <input type=hidden name=area value=/' + Path + '/><input type=image src=http://www.peacehealth.org/images/Home-SearchOK.jpg border=0 width="23" height="23"></td></tr></form>');
  document.write ('<tr><td bgcolor=#BACBD8></td><td bgcolor=#BACBD8><a href=http://www.peacehealth.org/apps/search/><img src=http://www.peacehealth.org/images/Banner-SearchBottom.jpg width="91" height="15" border=0></a></td></tr>');
  document.write ('</table>');
  document.write ('</td>');
  document.write ('</tr>');
  document.write ('</table>');
  document.write ('<span id=menuContents></span>');  
}

function CreateFooter()
{
  var sBanner = getCookie("Banner");
  if(sBanner == "banner_OHVI.gif")
  {
    document.write ('<br><br>OHVI Banner');  
    return;
  }
  document.write ('<br><br>');
  document.write ('<table width=100%><tr><td width=10%></td><td width=80% background=http://www.peacehealth.org/images/footerLine.gif></td><td width=10%></td></tr></table>');
  document.write ('<br>');  
  document.write ('<span style="font-size:8pt;r"><center>');  
  document.write ('© PeaceHealth 1999-2004. All rights reserved | <a href=/notices/disclaim.htm>Terms and Conditions</a> | <a href=http://www.peacehealth.org/notices/peacehealth_joint_notice_of_privacy.htm>Notice of Privacy Practices</a>');
  document.write (' | <a href=http://www.peacehealth.org/notices/contactu.htm>Contact Us</a> | <a href=/>PeaceHealth Home</a> <br><br>');
  document.write ('</center></span>');
}


// The following functions are part of the menu system

// hide select boxes on page
function hideSelectBoxes() 
{
  selectBoxes = document.getElementsByTagName('select');
  for(i = 0; i < selectBoxes.length; i++){
    selectBoxes.item(i).style.visibility = 'hidden';
  }
  applets = document.getElementsByTagName('applet');
  for(i = 0; i < applets.length; i++){
    applets.item(i).style.visibility = 'hidden';
  }

}

function showSelectBoxes() 
{
  selectBoxes = document.getElementsByTagName('select');
  for(i = 0; i < selectBoxes.length; i++){
    selectBoxes.item(i).style.visibility = '';
  }
  applets = document.getElementsByTagName('applet');
  for(i = 0; i < applets.length; i++){
    applets.item(i).style.visibility = '';
  }
}


// MENU MOUSE OVER 
function menuOver(itemName) {
 clearTimeout(timeOn)
 menuActive = 1
}// MENU MOUSE OUT 
function menuOut(itemName) {
 if(document.layers) {
 	menuActive = 0 
 	timeOn = setTimeout("hideAllMenus()", 400)
 }
}
 // SET BACKGROUND COLOR 
function getImage(name) {
  if (document.layers) {
    return findImage(name, document);
  }
  return null;
}

function findImage(name, doc) {
  var i, img;
  for (i = 0; i < doc.images.length; i++)
    if (doc.images[i].name == name)
      return doc.images[i];
  for (i = 0; i < doc.layers.length; i++)
    if ((img = findImage(name, doc.layers[i].document)) != null) {
      img.container = doc.layers[i];
      return img;
    }
  return null;
}

function getImagePageLeft(img) {
  var x, obj;
  if (document.layers) {
    if (img.container != null)
      return img.container.pageX + img.x;
    else
      return img.x;
  }
  return -1;
}

function getImagePageTop(img) {
  var y, obj;
  if (document.layers) {
    if (img.container != null)
      return img.container.pageY + img.y;
    else
      return img.y;
  }
  return -1;
}

//document.write('<style> .menu{position: absolute;}</style>');
var timeOn = null
numMenus = 6;
document.onmouseover = hideAllMenus;
document.onclick = hideAllMenus;
window.onerror = null;

function getStyleObject(objectId) {
    // cross-browser function to get an object's style object given its id
    if(document.getElementById && document.getElementById(objectId)) {
	// W3C DOM
	return document.getElementById(objectId).style;
    } else if (document.all && document.all(objectId)) {
	// MSIE 4 DOM
	return document.all(objectId).style;
    } else if (document.layers && document.layers[objectId]) {
	// NN 4 DOM.. note: this won't find nested layers
	return document.layers[objectId];
    } else {
	return false;
    }
} // getStyleObject

function changeObjectVisibility(objectId, newVisibility) {
    // get a reference to the cross-browser style object and make sure the object exists
    var styleObject = getStyleObject(objectId);
    if(styleObject) {
	styleObject.display = newVisibility;
	return true;
    } else {
	//we couldn't find the object, so we can't change its visibility
	return false;
    }
} // changeObjectVisibility


function showMenu(menuNumber, eventObj, labelID) {
  hideAllMenus();
  hideSelectBoxes(); 	  
	if(document.layers) {
  	img = getImage("img" + menuNumber);
   	x = getImagePageLeft(img);
   	y = getImagePageTop(img);
   	menuTop = y + 10; // LAYER TOP POSITION
  	eval('document.layers["menu'+menuNumber+'"].top="'+menuTop+'"');
	  eval('document.layers["menu'+menuNumber+'"].left="'+x+'"');    
	}
  if(menuNumber == 6)	
  {
    document.getElementById('menu6').style.left = '550';
  }
	
	eventObj.cancelBubble = true;
    var menuId = 'menu' + menuNumber;
    if(changeObjectVisibility(menuId, 'inline')) {
	return true;
    } else {
	return false;
    }
}

function hideAllMenus() {
  showSelectBoxes();  
  for(counter = 1; counter <= numMenus; counter++) 
  {
	  changeObjectVisibility('menu' + counter, 'none');
  }
}

function moveObject(objectId, newXCoordinate, newYCoordinate) {
    // get a reference to the cross-browser style object and make sure the object exists
    var styleObject = getStyleObject(objectId);
    if(styleObject) {
	styleObject.left = newXCoordinate;
	styleObject.top = newYCoordinate;
	return true;
    } else {
	// we couldn't find the object, so we can't very well move it
	return false;
    }
} // moveObject

// ***********************
// onload stuff *
// ***********************
// Browser Detection
isMac = (navigator.appVersion.indexOf("Mac")!=-1) ? true : false;
NS4 = (document.layers) ? true : false;
IEmac = ((document.all)&&(isMac)) ? true : false;
IE4plus = (document.all) ? true : false;
IE4 = ((document.all)&&(navigator.appVersion.indexOf("MSIE 4.")!=-1)) ? true : false;
IE5 = ((document.all)&&(navigator.appVersion.indexOf("MSIE 5.")!=-1)) ? true : false;
ver4 = (NS4 || IE4plus) ? true : false;
NS6 = (!document.layers) && (navigator.userAgent.indexOf('Netscape')!=-1) ? true:false;

// Body onload utility (supports multiple onload functions)
var gSafeOnload = new Array();
function AddOnLoad(f)
{
	if (IEmac && IE4)  // IE 4.5 blows out on testing window.onload
	{
		window.onload = SafeOnload;
		gSafeOnload[gSafeOnload.length] = f;
	}
	else if  (window.onload)
	{
		if (window.onload != SafeOnload)
		{
			gSafeOnload[0] = window.onload;
			window.onload = SafeOnload;
		}		
		gSafeOnload[gSafeOnload.length] = f;
	}
	else
		window.onload = f;
}
function SafeOnload()
{
	for (var i=0;i<gSafeOnload.length;i++)
		gSafeOnload[i]();
}

// *************************
// intialize onload events *
// *************************
window.onload="";
AddOnLoad(initializeHacks);

//turn off the setFocus routine.  This can be turned on at the application level.
//AddOnLoad(setFocusFirstEmptyField);

// ***********************
// hacks and workarounds *
// ***********************

function setFocusFirstEmptyField(){
  first = true;
  //start i at 1 to skip the search form
	for (i = 1; i < document.forms.length; i++)
	{
		for (j = 0; j < document.forms[i].elements.length; j++)
		{
			if(document.forms[i].elements[j].type != "button" 
			&& document.forms[i].elements[j].type != "hidden" 
			&& document.forms[i].elements[j].disabled != true 
			&& document.forms[i].elements[j].value == '' 
			&& first
			&& document.forms[i].elements[j].name != 'searchterm'
			)
			{
        first = false;
        document.forms[i].elements[j].focus();
			}
		}
  }
}

// setup an event handler to hide popups for generic clicks on the document
function initializeHacks() {
    // this ugly little hack resizes a blank div to make sure you can click
    // anywhere in the window for Mac MSIE 5
    if ((navigator.appVersion.indexOf('MSIE 5') != -1) 
	&& (navigator.platform.indexOf('Mac') != -1)
	&& getStyleObject('blankDiv')) {
	window.onresize = explorerMacResizeFix;
    }
    resizeBlankDiv();
    // this next function creates a placeholder object for older browsers
    createFakeEventObj();
}



function createFakeEventObj() {
    // create a fake event object for older browsers to avoid errors in function call
    // when we need to pass the event object to functions
    if (!window.event) {
	window.event = false;
    }
} // createFakeEventObj



function resizeBlankDiv() {
    // resize blank placeholder div so IE 5 on mac will get all clicks in window
    if ((navigator.appVersion.indexOf('MSIE 5') != -1) 
	&& (navigator.platform.indexOf('Mac') != -1)
	&& getStyleObject('blankDiv')) {
	getStyleObject('blankDiv').width = document.body.clientWidth - 20;
	getStyleObject('blankDiv').height = document.body.clientHeight - 20;
    }
}

function explorerMacResizeFix () {
    location.reload(false);
}

function mClk(src){ 
	if(event.srcElement.tagName=='TD')
		src.children.tags('A')[0].click();
}
//-->

