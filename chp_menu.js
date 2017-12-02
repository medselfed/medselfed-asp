//The following line is critical for menu operation, and MUST APPEAR ONLY ONCE. If you have more than one menu_array.js file rem out this line in subsequent files

menunum=0;
menus=new Array();
_d=document;
function addmenu(){
	menunum++;
	menus[menunum]=menu;
}

function dumpmenus(){
	mt="<script language=javascript></script>";
	alert("test");

	for(a=1;a<menus.length;a++){
		alert("test");
//		mt+=" menu"+ a += menus["+a+"];"
	}

	mt+="<\/script>"
		;_d.write(mt)
}

//Please leave the above line intact. The above also needs to be enabled if it not already enabled unless this file is part of a multi pack.

if(navigator.appVersion.indexOf("MSIE 6.0")>0)
{
	effect = "Fade(duration=0.2);Alpha(style=0,opacity=88);Shadow(color='#777777', Direction=135, Strength=5)"
}
else
{
	effect = "Shadow(color='#ffffff', Direction=0, Strength=0)" // Stop IE5.5 bug when using more than one filter
}


timegap=500				// The time delay for menus to remain visible
followspeed=5			// Follow Scrolling speed
followrate=40			// Follow Scrolling Rate
suboffset_top=0;		// Sub menu offset Top position 
suboffset_left=0;		// Sub menu offset Left position

style1=[				// style1 is an array of properties. You can have as many property arrays as you need. This means that menus can have their own style.
"006388",					// Mouse Off Font Color
"ffffff",				// Mouse Off Background Color
"006388",				// Mouse On Font Color
"DFDBDB",				// Mouse On Background Color
"006388",				// Menu Border Color 
11,						// Font Size in pixels
"normal",				// Font Style (italic or normal)
"bold",					// Font Weight (bold or normal)
"Arial, Verdana",		// Font Name
0,						// Menu Item Padding
"",						// Sub Menu Image (Leave this blank if not needed)
,						// 3D Border & Separator bar
,				// 3D High Color
,				// 3D Low Color
,				// Current Page Item Font Color (leave this blank to disable)
,					// Current Page Item Background Color (leave this blank to disable)
"arrowdn.gif",			// Top Bar image (Leave this blank to disable)
"ffffff",				// Menu Header Font Color (Leave blank if headers are not needed)
"000099",				// Menu Header Background Color (Leave blank if headers are not needed)
]



addmenu(menu=[		// This is the array that contains your menu properties and details
"mainmenu",			// Menu Name - This is needed in order for the menu to be called
112,					// Menu Top - The Top position of the menu in pixels
1,				// Menu Left - The Left position of the menu in pixels
163,					// Menu Width - Menus width in pixels
0,					// Menu Border Width 
,					// Screen Position - here you can use "center;left;right;middle;top;bottom" or a combination of "center:middle"
style1,				// Properties Array - this is set higher up, as above
1,					// Always Visible - allows the menu item to be visible at all time (1=on/0=off)
"left",				// Alignment - sets the menu elements text alignment, values valid here are: left, right or center
,				// Filter - Text variable for setting transitional effects on menu activation - see above for more info
0,					// Follow Scrolling - Tells the menu item to follow the user down the screen (visible at all times) (1=on/0=off)
0, 					// Horizontal Menu - Tells the menu to become horizontal instead of top to bottom style (1=on/0=off)
,					// Keep Alive - Keeps the menu visible until the user moves over another menu or clicks elsewhere on the page (1=on/0=off)
,					// Position of TOP sub image left:center:right
,					// Set the Overall Width of Horizontal Menu to 100% and height to the specified amount (Leave blank to disable)
,					// Right To Left - Used in Hebrew for example. (1=on/0=off)
,					// Open the Menus OnClick - leave blank for OnMouseover (1=on/0=off)
,					// ID of the div you want to hide on MouseOver (useful for hiding form elements)
,					// Reserved for future use
,					// Reserved for future use
,					// Reserved for future use



	,"<img src=http://www.ehealthconnection.com/regions/toledo/content/sp_img/menu2/1.gif width=164 height=18 border=0><br><img src=http://www.ehealthconnection.com/regions/toledo/content/sp_img/menu2/sep.gif width=164 height=7 border=0><br>","show-menu=1","http://www.ehealthconnection.com/regions/toledo/content/health_wellness.asp","", // "Description Text", "URL", "Alternate URL", "Status", "Separator Bar"

	,"<img src=http://www.ehealthconnection.com/regions/toledo/content/sp_img/menu2/2.gif width=164 height=18 border=0><br><img src=http://www.ehealthconnection.com/regions/toledo/content/sp_img/menu2/sep.gif width=164 height=7 border=0><br>","show-menu=2","http://www.ehealthconnection.com/regions/toledo/content/health_services.asp","", // "Description Text", "URL", "Alternate URL", "Status", "Separator Bar"

	,"<img src=http://www.ehealthconnection.com/regions/toledo/content/sp_img/menu2/3.gif width=164 height=18 border=0><br><img src=http://www.ehealthconnection.com/regions/toledo/content/sp_img/menu2/sep.gif width=164 height=7 border=0><br>","show-menu=3","http://www.ehealthconnection.com/regions/toledo/content/where_serve.asp","", // "Description Text", "URL", "Alternate URL", "Status", "Separator Bar"

	,"<img src=http://www.ehealthconnection.com/regions/toledo/content/sp_img/menu2/4.gif width=164 height=18 border=0><br><img src=http://www.ehealthconnection.com/regions/toledo/content/sp_img/menu2/sep.gif width=164 height=7 border=0><br>","http://toledo.photobooks.com/","http://toledo.photobooks.com/","", // "Description Text", "URL", "Alternate URL", "Status", "Separator Bar"

	,"<img src=http://www.ehealthconnection.com/regions/toledo/content/sp_img/menu2/5b.gif width=164 height=18 border=0><br><img src=http://www.ehealthconnection.com/regions/toledo/content/sp_img/menu2/sep.gif width=164 height=7 border=0><br>","show-menu=78","http://www.ehealthconnection.com/regions/toledo/content/gme.asp","", // "Description Text", "URL", "Alternate URL", "Status", "Separator Bar"

	,"<img src=http://www.ehealthconnection.com/regions/toledo/content/sp_img/menu2/5.gif width=164 height=18 border=0><br><img src=http://www.ehealthconnection.com/regions/toledo/content/sp_img/menu2/sep.gif width=164 height=7 border=0><br>","show-menu=5","http://www.ehealthconnection.com/regions/toledo/content/For_Physicians.asp","", // "Description Text", "URL", "Alternate URL", "Status", "Separator Bar"

	,"<img src=http://www.ehealthconnection.com/regions/toledo/content/sp_img/menu2/6.gif width=164 height=18 border=0><br><img src=http://www.ehealthconnection.com/regions/toledo/content/sp_img/menu2/sep.gif width=164 height=7 border=0><br>","show-menu=6","http://www.ehealthconnection.com/regions/toledo/content/jobs.asp","", // "Description Text", "URL", "Alternate URL", "Status", "Separator Bar"

	,"<img src=http://www.ehealthconnection.com/regions/toledo/content/sp_img/menu2/7.gif width=164 height=18 border=0><br><img src=http://www.ehealthconnection.com/regions/toledo/content/sp_img/menu2/sep.gif width=164 height=7 border=0><br>","http://www.ehealthconnection.com/regions/toledo/content/contact_us.asp","http://www.ehealthconnection.com/regions/toledo/content/contact_us.asp","", // "Description Text", "URL", "Alternate URL", "Status", "Separator Bar"

	,"<img src=http://www.ehealthconnection.com/regions/toledo/content/sp_img/menu2/8.gif width=164 height=18 border=0><BR>","http://www.ehealthconnection.com/regions/toledo/content/search_site.asp","http://www.ehealthconnection.com/regions/toledo/content/search_site.asp","", // "Description Text", "URL", "Alternate URL", "Status", "Separator Bar"

])

	addmenu(menu=["1",
	,,200,1,"",style1,,"left",effect,,,,,,,,,,,,
	
	
	
	,"&nbsp;Overview","http://www.ehealthconnection.com/regions/toledo/content/health_wellness.asp",,,1
	
	,"&nbsp;Drug, Disease & Health Information","http://www.ehealthconnection.com/regions/toledo/content/health_information.asp",,,1
	
	,"&nbsp;Health Risk Appraisals & Tools","http://www.ehealthconnection.com/regions/toledo/content/health_tools.asp",,,1
	
	,"&nbsp;Community Health Screenings","http://www.ehealthconnection.com/regions/toledo/content/communityscreenings.asp",,,1
	
	,"&nbsp;Community Resources","http://www.ehealthconnection.com/regions/toledo/content/community_resources.asp",,,1
	
	,"&nbsp;Classes, Events & Support Groups","http://www.ehealthconnection.com/regions/toledo/content/calen.asp",,,1
	
	,"&nbsp;eMagazines","http://www.ehealthconnection.com/regions/toledo/content/emagazines.asp",,,1
	
	,"&nbsp;Mercy Women's Care Online","http://www.ehealthconnection.com/regions/toledo/content/womens_module.asp",,,1
	
	,"&nbsp;Mercy Children's Online","http://mercyweb.org/hugs",,,1
	
	,"&nbsp;The Heart Center Online","http://mercyweb.org/heartcenter/",,,1
	
	])



	addmenu(menu=["2",
	,,200,1,"",style1,,"left",effect,,,,,,,,,,,,
	
	
	
	,"&nbsp;Overview","http://www.ehealthconnection.com/regions/toledo/content/health_services.asp",,,1
	
	,"&nbsp;Ask A Mercy Nurse","http://www.ehealthconnection.com/regions/toledo/content/ask_a_nurse.asp",,,1
	
	,"&nbsp;Hospital & Clinic Services","http://www.ehealthconnection.com/regions/toledo/content/clinics.asp",,,1
	
	,"&nbsp;Laboratory Services","http://www.ehealthconnection.com/regions/toledo/content/Mercy_Lab_UsersGuide_Intro.asp",,,1
	
	,"&nbsp;Insurance Plan Information","http://www.ehealthconnection.com/regions/toledo/content/health_plan1.asp",,,1
	
	,"&nbsp;Mercy Oncology Services","http://www.ehealthconnection.com/regions/toledo/content/om_home.asp",,,1
	
	,"&nbsp;Mercy Web Nursery","http://www.ehealthconnection.com/regions/toledo/content/web_nursery.asp",,,1
	
	,"&nbsp;Local & National Health News","http://www.ehealthconnection.com/regions/toledo/content/news.asp",,,1
	
	,"&nbsp;Services for Business & Industry","http://www.ehealthconnection.com/regions/toledo/content/corporate_health.asp",,,1
	
	,"&nbsp;Surgical & OB Pre-Registration","http://www.ehealthconnection.com/regions/toledo/content/prereg.asp",,,1
	
	])



	addmenu(menu=["3",
	,,200,1,"",style1,,"left",effect,,,,,,,,,,,,
	
	
	
	,"&nbsp;Overview","http://www.ehealthconnection.com/regions/toledo/content/where_serve.asp",,,1
	
	,"&nbsp;St. Vincent Mercy Medical Center","http://www.ehealthconnection.com/regions/toledo/content/show_facility.asp?facility_id=10",,,1
	
	,"&nbsp;St. Charles Mercy Hospital","http://www.ehealthconnection.com/regions/toledo/content/show_facility.asp?facility_id=11",,,1
	
	,"&nbsp;St. Anne Mercy Hospital","http://www.ehealthconnection.com/regions/toledo/content/show_facility.asp?facility_id=13",,,1
	
	,"&nbsp;Mercy Children's Hospital","http://www.ehealthconnection.com/regions/toledo/content/show_facility.asp?facility_id=15",,,1
	
	,"&nbsp;Mercy Hospital of Tiffin","http://www.ehealthconnection.com/regions/toledo/content/show_facility.asp?facility_id=16",,,1
	
	,"&nbsp;Mercy Hospital of Willard","http://www.ehealthconnection.com/regions/toledo/content/show_facility.asp?facility_id=17",,,1
	
	,"&nbsp;Mercy Hospital of Defiance","http://www.ehealthconnection.com/regions/toledo/content/show_facility.asp?facility_id=160",,,1
	
	])



	addmenu(menu=["4",
	,,200,1,"",style1,,"left",effect,,,,,,,,,,,,
	
	
	
	])



	addmenu(menu=["78",
	,,200,1,"",style1,,"left",effect,,,,,,,,,,,,
	
	
	
	,"&nbsp;Residency Programs (M.D./D.O.)","http://www.svmmc-mhpresidencies.org/",,,1
	
	,"&nbsp;Mercy College of Northwest Ohio","http://www.mercycollege.edu/",,,1
	
	,"&nbsp;Clinical Lab Science Program","http://www.ehealthconnection.com/regions/toledo/content/Integrated_CLS_Mercy_Program.asp",,,1
	
	])



	addmenu(menu=["5",
	,,200,1,"",style1,,"left",effect,,,,,,,,,,,,
	
	
	
	,"&nbsp;CME Information","http://www.ehealthconnection.com/regions/toledo/content/CMElist.asp",,,1
	
	,"&nbsp;Laboratory Services","http://www.ehealthconnection.com/regions/toledo/content/Mercy_Lab_UsersGuide_Intro.asp",,,1
	
	,"&nbsp;Tools & Resources for Patients","http://www.ehealthconnection.com/regions/toledo/content/For_Physicians.asp",,,1
	
	,"&nbsp;Special Sections & Links","http://www.ehealthconnection.com/regions/toledo/content/For_Physicians.asp",,,1
	
	])



	addmenu(menu=["6",
	,,200,1,"",style1,,"left",effect,,,,,,,,,,,,
	
	
	
	,"&nbsp;Current Job Postings","http://www.ehealthconnection.com/regions/toledo/content/jobs.asp",,,1
	
	])



	addmenu(menu=["7",
	,,200,1,"",style1,,"left",effect,,,,,,,,,,,,
	
	
	
	])



	addmenu(menu=["8",
	,,200,1,"",style1,,"left",effect,,,,,,,,,,,,
	
	
	
	])






	

dumpmenus()

