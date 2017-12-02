// JavaScript Document
function show(object) {
//alert('show: ' + object)
    if (document.layers && document.layers[object]){
        document.layers[object].visibility = 'visible';
    } else if (document.all) {
        document.all[object].style.visibility = 'visible';
    } else {
		document.getElementById(object).style.visibility = 'visible';
	}
}

function hide(object) {
//alert('hide: ' + object)
    if (document.layers && document.layers[object]){
        document.layers[object].visibility = 'hidden';
    } else if (document.all) {
        document.all[object].style.visibility = 'hidden';
	} else {
		document.getElementById(object).style.visibility = 'hidden';
	}
}

function maximizeWin() {
 if (window.screen) {
  var aw = screen.availWidth;
  var ah = screen.availHeight;
  window.moveTo(0, 0);
  window.resizeTo(aw, ah);
 }
}

var navigationImage = new Array(); 

var imageUrl = '/image'

function getImageObj(){
	navigationImage[0] = new Image()
	navigationImage[0].src = '/image/000/nav/nav_on.gif'

	navigationImage[1] = new Image()
	navigationImage[1].src = '/image/000/nav/nav.gif'
	
	navigationImage[2] = new Image()
	navigationImage[2].src = '/image/000/nav/nav_go.gif'
	
	navigationImage[5] = new Image()
	navigationImage[5].src = '/image/000/nav/picnexton2.gif'
	
	navigationImage[6] = new Image()
	navigationImage[6].src = '/image/000/nav/picclose.gif'
	
	navigationImage[7] = new Image()
	navigationImage[7].src = '/image/000/nav/picbackon2.gif'
	
	navigationImage[8] = new Image()
	navigationImage[8].src = '/image/000/nav/continue2.gif'
	
}

var orgImage
var orgImage2

function swapImage(){
	var args = swapImage.arguments
	imageObj = args[0]
	swapObj = args[1]
	orgImage = imageObj.src
	imageObj.src = swapObj.src
}

function restoreImage(){
	var args = restoreImage.arguments
	imageObj = args[0]
	imageObj.src = orgImage
}

function swapImage2(){
	var args = swapImage2.arguments
	imageObj = args[0]
	swapObj = args[1]
	orgImage2 = imageObj.src
	imageObj.src = swapObj.src
}

function restoreImage2(){
	var args = restoreImage2.arguments
	imageObj = args[0]
	imageObj.src = orgImage2
}

var headImgOrg
var chestImgOrg
var midbodyImgOrg
var legImgOrg

function swapBodyHead(){
	document.images['headImg'].src = navigationImage[0].src
	document.images['chestImg'].src = chestImgOrg
	document.images['midbodyImg'].src = midbodyImgOrg
	document.images['legImg'].src = legImgOrg
}

function swapBodyChest(){
	document.images['headImg'].src = headImgOrg
	document.images['chestImg'].src = navigationImage[1].src
	document.images['midbodyImg'].src = navigationImage[2].src
	document.images['legImg'].src = legImgOrg
}

function swapBodyMid(){	
	document.images['headImg'].src = navigationImage[6].src
	document.images['chestImg'].src = navigationImage[4].src
	document.images['midbodyImg'].src = navigationImage[3].src
	document.images['legImg'].src = legImgOrg
}

function swapBodyLeg(){
	document.images['headImg'].src = headImgOrg
	document.images['chestImg'].src = chestImgOrg
	document.images['midbodyImg'].src = midbodyImgOrg
	document.images['legImg'].src = navigationImage[5].src
}
