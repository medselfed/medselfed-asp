<%
'Set the response buffer to true
Response.Buffer = False 

'Dimension global variables
Dim fsoObject			'File system object
Dim fldObject			'Folder object	
Dim sarySearchWord		'Array to hold the words to be searched for
Dim strSearchWords		'Holds the search words
Dim blnIsRoot			'Set to true if we are searching in the root directory
Dim strFileURL			'Holds the path to the file on the site
Dim strServerPath		'Holds the server path to this script
Dim intNumFilesShown		'Holds the number of files shown so far
Dim intTotalFilesSearched	'Holds the number of files searched
Dim intTotalFilesFound		'Holds the total matching files found
Dim intFileNum			'Holds the file number
Dim intPageLinkLoopCounter	'Loop counter to display links to the other result pages
Dim sarySearchResults(1000,2)	'Two Dimensional Array holding the search results
Dim intDisplayResultsLoopCounter 'loop counter to diplay the results of the search
Dim intResultsArrayPosition	'Stores the array position of the array storing the results
Dim blnSearchResultsFound	'Set to true if search results are found
Dim strFilesTypesToSearch	'Holds the types of files to be searched
Dim strBarredFolders		'Holds the folders that you don't want searched
Dim strBarredFiles		'Holds the names of the files not to be searched
Dim blnEnglishLanguage		'Set to True if the user is using English


' -------------------------- Change the following line to the number of results you wish to have on each page ------------------------------------
Const intRecordsPerPage = 10 'change this to the number of results to show on each page

' --------------------- Place the names of the files types you want searching in the following line sepeararted by commas --------------------------
strFilesTypesToSearch = "htm,html,asp,shtml,xml" 

' --------------------- Place the names of the folders you don't want searched in the following line spearated by commas --------------------------
strBarredFolders = "cgi_bin,_bin" 'cgi_bin and _bin have been put in here as examples, but you can put any folders in here

' ---------- Place the names of the files you don't want searched in the following line spearated by commas include the file extension -------------
strBarredFiles = "adminstation.htm,no_allowed.asp" 'adminstration.htm and not_allowed.asp have been put in as an examples

' -------------------- Set this boolean to False if you are not using an English language web site --------------------------------------------------
blnEnglishLanguage = True 'True = HTML Encode best for English sites \ False = no Emcoding best for non English sites

'-----------------------------------------------------------------------------------------------------------------------------------------------------


'Initalise variables
intTotalFilesSearched = 0
%>
<!--#include file="global.inc" -->
<!--#include file="chromehead.inc" -->
<%
	if Request.QueryString("search") <> "" Then
		titleText = "MedSelfEd Patient Education: Search Results for " & Request.QueryString("search")
	else
		titleText = "MedSelfEd Patient Education: Search " & Request.QueryString("search")
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
<script  language="JavaScript">
<!-- Hide from older browsers...

//Check the form before submitting
function CheckForm () {

	//Check for a word to search
	if (document.frmSiteSearch.search.value==""){
		alert("Please enter at least one keyword to search");
		document.frmSiteSearch.search.focus();
		return false;
	}
	
	return true
}

var centerImage = new Array(); 
function getNavImageObj(){
	genNavImageOn = new Image()
	genNavImageOn.src = imageUrl + '/000/dot3_r.gif'
}
getNavImageObj()
// -->
</script>
</head>
<body>
<center>
<div class="topdiv">
<!--#include file="header.inc" -->
<div class="lrlines">&nbsp;
	<table width="95%" border="0" cellpadding="5" cellspacing="0" bgcolor="#ffffff">
<%
'Read in all the search words into one variable
strSearchWords = Trim(Request.QueryString("search"))

'If the site is in English then use the server HTML encode method
If blnEnglishLanguage = True Then
	'Replace any HTML tags with the HTML codes for the same characters (stops people entering HTML tags)
	strSearchWords = Server.HTMLEncode(strSearchWords)

'If the site is not english just change the script tags
Else
	'Just replace the script tag <> with HTML encoded &lt; and &gt;
	strSearchWords = Replace(strSearchWords, "<", "&lt;", 1, -1, 1)
	strSearchWords = Replace(strSearchWords, ">", "&gt;", 1, -1, 1)
End If

'Slit each word to be searched up and place in an array
sarySearchWord = Split(Trim(strSearchWords), " ")



'Read the file number to show from
intFileNum = CInt(Request.QueryString("FileNumPosition"))

'Set the number of files shown so far to the file number read in above
intNumFilesShown = intFileNum


'Create the file system object
Set fsoObject = Server.CreateObject("Scripting.FileSystemObject")


'If there is no words entered by the user to search for then dont carryout the file search routine
If NOT strSearchWords = "" Then


	'Get the path and the root folder to be searched
	Set fldObject = fsoObject.GetFolder(Server.MapPath("/xml"))
	
	'Read in the server path to this ASP script
	strServerPath = fldObject.Path & "\"
	
	'Set to true as this is searching the root directory
	blnIsRoot = True
		
	'Call the search sub prcedure
	Call SearchFile(fldObject)			
	
	'Reset server variables
	Set fsoObject = Nothing
	Set fldObject = Nothing	
	
	
	'Call the Bubble Sort procedure to sort the results into highest matches first
	Call SortResultsByNumMatches(sarySearchResults, intTotalFilesFound)
		
	
	'Display the HTML table with the results status of the search or what type of search it is
	'Response.Write vbCrLf & "	<table width=""95%"" border=""0"" cellspacing=""1"" cellpadding=""1"" align=""center"">"
	'Response.Write vbCrLf & " 	  <tr>"
%>
		<tr><td align="left" valign="middle" class="medred" colspan="2">
<%	
	'Display that there where no matching records found
	If blnSearchResultsFound = False Then 
		'Response.Write vbCrLf & " 	    <td class=""med"">&nbsp;Searched the site for <font class=""medred"">" & strSearchWords & "</font>. &nbsp;&nbsp;&nbsp;Sorry, no results found.</td>"   
%>
Searched the site for <font class="medred"><%= strSearchWords %></font>. &nbsp;&nbsp;&nbsp;Sorry, no results found.
<%	Else %>
Roll-over links and click to go to a procedure.
<%	
		'Response.Write vbCrLf & " 	    <td class=""med"">&nbsp;Searched the site for <font class=""medred"">" & strSearchWords & "</font>. &nbsp;&nbsp;&nbsp;Displaying Results " & intFileNum + 1 & " - " & intNumFilesShown & " of " & intTotalFilesFound & ".</td>"	    
	End If
	
	'Close the HTML table with the search status
	'Response.Write vbCrLf & "	  </tr>"
	'Response.Write vbCrLf & "	</table>"
%>
</td></tr>
<tr><td>
<table bgcolor=#ffffff border=0 cellspacing=0 cellpadding=5>
<%	
	
	'HTML table to display the search results or an error if there are no results
	'Response.Write vbCrLf & "	<table width=""95%"" border=""0"" cellspacing=""1"" cellpadding=""1"" align=""center"">"
	'Response.Write vbCrLf & "	 <tr>" 
	'Response.Write vbCrLf & "	  <td>"   

	'If no results are found then display an error message
	If blnSearchResultsFound = False Then 
	
		'Write HTML displaying the error
		Response.Write vbCrLf & "	 <tr><td colspan=""2"" class=""sml"">"
		Response.Write vbCrLf & "	   Your Search - <b>" & strSearchWords & "</b> - did not match any files on this site."
	   	Response.Write vbCrLf & "	   <br><br>"
	   	Response.Write vbCrLf & "	   Suggestions:"
	   	Response.Write vbCrLf & "	   <br>"
	   	Response.Write vbCrLf & "	   <ul><li>Make sure all words are spelled correctly.<li>Try different keywords.<li>Try more general keywords.<li>Try fewer keywords.</ul></td></tr>"
		Response.Write vbCrLf & "	 </td></tr>"
	'Else display the results
	Else
		
		'Loop round to display each result within the search results array
		
		%>
		<%
		For intDisplayResultsLoopCounter = (intFileNum + 1) to intNumFilesShown
			Response.Write vbCrLf & "	    " & sarySearchResults(intDisplayResultsLoopCounter,1)
		Next
				
	End If
	Response.Write vbCrLf & "	     </table>"
	'Close the HTML table displaying the results
	'Response.Write vbCrLf & "	    </td>"
	'Response.Write vbCrLf & "	  </tr>"
	'Response.Write vbCrLf & "	</table>"

%>
</td><td align="center" valign="middle" height="197" width="262"> 
        <image name="prodImage" src="/image/000/<%= siteId %>/logo_center.gif"></td>
		</tr><tr><td colspan="2" align="center" valign="middle" class="sml">
<%
End If

 
'Display an HTML table with links to the other search results
If intTotalFilesFound > intRecordsPerPage then

	'Display an HTML table with links to the other search results
	'Response.Write vbCrLf & "	<br>"
	'Response.Write vbCrLf & "	<table width=""95%"" border=""0"" cellspacing=""0"" cellpadding=""0"" align=""center"">"
	'Response.Write vbCrLf & " 	  <tr>"
	'Response.Write vbCrLf & " 	    <td>"
	'Response.Write vbCrLf & "		<table width=""95%"" border=""0"" cellpadding=""0"" cellspacing=""0"">"
	'Response.Write vbCrLf & "		  <tr>"
	'Response.Write vbCrLf & "		    <td width=""50%"" align=""center"">"
	
	Response.Write vbCrLf & "		Results Page:&nbsp;&nbsp;"
	
		
	'If the page number is higher than page 1 then display a back link    	
	If intNumFilesShown > intRecordsPerPage Then 
		Response.Write vbCrLf & "		 <a href=""search.asp?FileNumPosition=" &  intFileNum - intRecordsPerPage  & "&search=" & Replace(strSearchWords, " ", "+") & "&mode=" & Request.QueryString("mode") & "&siteId="& siteId &"&" & navQueryString & """ target=""_self"">&lt;&lt;&nbsp;Prev</a> "   	     	
	End If     	
	
	
	'If there are more pages to display then display links to all the search results pages
	If intTotalFilesFound > intRecordsPerPage Then 
		
		'Loop to diplay a hyper-link to each page in the search results    	
		For intPageLinkLoopCounter = 1 to CInt((intTotalFilesFound / intRecordsPerPage) + 0.5)
			
			'If the page to be linked to is the page displayed then don't make it a hyper-link
			If intFileNum = (intPageLinkLoopCounter * intRecordsPerPage) - intRecordsPerPage Then
				Response.Write vbCrLf & "		     " & intPageLinkLoopCounter
			Else
			
				Response.Write vbCrLf & "		     &nbsp;<a href=""search.asp?FileNumPosition=" &  (intPageLinkLoopCounter * intRecordsPerPage) - intRecordsPerPage & "&search=" & Replace(strSearchWords, " ", "+") & "&mode=" & Request.QueryString("mode") & "&siteId="& siteId &"&" & navQueryString & """ target=""_self"">" & intPageLinkLoopCounter & "</a>&nbsp; "			
			End If
		Next
	End If
	
	
	'If it is Not the last of the search results than display a next link     	
	If intTotalFilesFound > intNumFilesShown then   	
		Response.Write vbCrLf & "		&nbsp;<a href=""search.asp?FileNumPosition=" &  intNumFilesShown  & "&search=" & Replace(strSearchWords, " ", "+") & "&mode=" & Request.QueryString("mode") & "&siteId="& siteId &"&" & navQueryString & """ target=""_self"">Next&nbsp;&gt;&gt;</a>"	   	
	End If      	
	
	
	'Finsh HTML the table      	
	'Response.Write vbCrLf & "		    </td>"      	
	'Response.Write vbCrLf & "		  </tr>"
	'Response.Write vbCrLf & "		</table>"		
	'Response.Write vbCrLf & "	    </td>"
	'Response.Write vbCrLf & "	  </tr>"
	'Response.Write vbCrLf & "	</table>"
	
 
End If 

%>
	</td></tr>
<!--
Result Count: <%= intTotalFilesFound %>
//-->
	<form method="get" name="frmSiteSearch" action="search.asp" onSubmit="return CheckForm();">
<input type="hidden" name="siteId" value="<%= Request.QueryString("siteId") %>">
<input type="hidden" name="id" value="<%= Request.QueryString("id") %>">
<input type="hidden" name="cachedate" value="<%= Request.QueryString("cachedate") %>">
<input type="hidden" name="partnerId" value="<%= Request.QueryString("partnerId") %>">	
		<tr><td colspan="2" align="left" valign="middle" class="medred">
		Search the Web Site:</td></tr>
		<tr><td colspan="2" align="left" valign="middle" class="medred">
		<input type="TEXT" name="search" maxlength="50" class="sml" size="36" value="<% =Request.QueryString("search") %>"><input type="submit" value="Search &gt;&gt;" name="submit">
		</td></tr>
		<tr><td colspan="2" align="left" valign="middle" class="sml">
		Search On : 
        <input type="radio" name="mode" value="allwords" CHECKED>
        All Words 
        <input type="radio" name="mode" value="anywords">
        Any Words 
        <input type="radio" name="mode" value="phrase">
        Phrase		</td></tr>
</form>
	</table>
</div>
<div class="lrtlines" >
<table width="95%" border="0" cellpadding="5" cellspacing="0">
          <tr> 
			<td align="center">
		<table cellspacing="0" cellpadding="0" border="0">
		<tr>
		<td align="center"> <a href="/asp/<% =siteId %>/disclaimer.asp" class="smlred">Disclaimer</a></td>
		<td align="center"><font class="smlred">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</font></td>
		<td align="center">  <a href="/asp/<% =siteId %>/legal.asp" class="smlred">Legal</a></td>
		</tr>
		<tr></table><center>
		<img src="../image/000/<%= siteId %>/copyright.gif" border="0">
		</center>
	</td></tr></table>
</div>
<img src="../image/000/bottom_cap2.gif" class="bottomCap" alt="">
</div>
</center>
<!--#include file="tracking.inc" -->
</body>
</html>
<%



'Sub procedure to do the search
Public Sub SearchFile(fldObject)

	'Dimension local variabales
	Dim objRegExp				'Regular Expersions object
	Dim objMatches				'Holds the matches collection of the regular expresions object
	Dim filObject				'File object
	Dim tsObject				'Text stream object
	Dim subFldObject			'Sub folder object
	Dim strFileContents			'Holds the contents of the file being searched	
	Dim strPageTitle			'Holds the title of the page
	Dim strPageDescription			'Holds the description of the page
	Dim strPageKeywords			'Holds the keywords of the page
	Dim intSearchLoopCounter		'Loop counter to search all the words in the array
	Dim intNumMatches			'Holds the number of matches
	Dim blnSearchFound			'Set to true if the search words are found
	
	Dim intMatchPos	
	
	'Error handler
	On Error Resume Next
	
	'Set the error object to 0
	Err.Number = 0
		  		
	'Create the regular expresions object
	Set objRegExp = New RegExp
		  		
	'If an error has occured then the server does not support Regular Expresions
	If Err.Number <> 0 Then 
		Response.Write("<br>Error The Server does not support the Regular Expessions object<br>Please download the alternative version of this application from http://www.webwizguide.info/asp/sample_scripts/site_search_script.asp")
					
		'Reset error object
		Err.Number = 0
	End If
	
	for x = 1 to prodLink.length
	set filObject = fsoObject.GetFile(Server.MapPath("/xml/" & prodLink.item(x-1).getAttribute("prodId") & ".xml"))
	'Loop to search each file in the folder
	'For Each filObject in fldObject.Files
		
				
		'Check the file extension to make sure the file is of the extension type to be searched
		If InStr(1, strFilesTypesToSearch, fsoObject.GetExtensionName(filObject.Name), vbTextCompare) > 0 Then
	 
		  	'Check to make sure the file about to be searched is not a barred file if it is don't search the file
			If NOT InStr(1, strBarredFiles, filObject.Name, vbTextCompare) > 0 Then		  	
		  	
		  		'Initalise the search found variable to flase
			 	blnSearchFound = False
		  		
		  		'Initalise the number of matches variable
		  		intNumMatches = 0		  	
		  		
		  		'Set the regular exprsion object to read all cases of the occurance not just the first
		  		objRegExp.Global = True
		  		
		  		'Set the regular expression object to ignore case
		  		objRegExp.IgnoreCase = True
		  		
		  				  		
		  	
			  	'Open the file for searching
			    	Set tsObject = filObject.OpenAsTextStream
			
				'Read in the contents of the file
			   	strFileContents = tsObject.ReadAll		
		
				'Read in the title of the file
				strPageTitle = GetFileMetaTag("<pageHeader1>", "</pageHeader1>", strFileContents)
				strPageTitle = strPageTitle + " - " + GetFileMetaTag("<pageHeader2>", "</pageHeader2>", strFileContents)		
				'Read in the description meta tag of the file
				strPageDescription = GetFileMetaTag("<meta name=""description"" content=""", """>", strFileContents)
			 	
			 	'Read in the keywords of the file
			 	strPageKeywords = GetFileMetaTag("<meta name=""keywords"" content=""", """>", strFileContents)
			 			 	
			 	
			 	
			 	'Set the pattern using regular expressions to srip any HTML tags
			 	objRegExp.Pattern = "<[^>]*>"
			 	
			 	'Strip HTML tags from the contects of the file to be searched
			 	strFileContents = objRegExp.Replace(strFileContents,"")
			 		
			 	'Put the tittle, description and the keywords back into the file to be searched
			 	strFileContents = strFileContents & " " & strPageTitle & " " & strPageDescription & " " & strPageKeywords
			 	
			 
			 				 	
			 	'If the user has choosen to search by phrase 
			 	If Request.QueryString("mode") = "phrase" Then
			 		
			 		'Set the pattern to search for
			 		objRegExp.Pattern = "\b" & strSearchWords & "\b"
			 		
			 		'Search the file for the phrase
			 		Set objMatches = objRegExp.Execute(strFileContents)
			 		
			 		'Check to see if the phrase has been found
			 		If objMatches.Count > 0 Then
			 		
			 			'Get the number of times the phrase is matched
			 			intNumMatches = objMatches.Count		
			 			'If the search is found then set the search found variable to true
			 			blnSearchFound = True
			 		End If
			 	
			 	
			 	'Else the search is either by all or any words
			 	Else
			 			 	
			 		'If the search is by all words then initialise the search found variable to true
				 	If Request.QueryString("mode") = "allwords" then blnSearchFound = True
				 	
				 	
				 	'Loop round to search for each word to be searched
				 	For intSearchLoopCounter = 0 to UBound(sarySearchWord)
				 	
				 		'Set the pattern to search for
				 		objRegExp.Pattern = "\b" & sarySearchWord(intSearchLoopCounter) & "\b"
				 		
				 		'Search the file for the search words
				 		Set objMatches = objRegExp.Execute(strFileContents)
				 		    	
					    	'Check to see if any of the words have been found
					    	If objMatches.Count > 0 Then 
					    	
					    		'Get the number of times the search word is matched
			 				intNumMatches = intNumMatches + objMatches.Count
				    			'If the search word is found and the search is for any words then set the search found variable to true
				    			If Request.QueryString("mode") = "anywords" then blnSearchFound = True
				    			
				    		Else
				    			'If the search word is not found and the search is for all words then set the search found variable back to false as one of the words has not been found
				    			If Request.QueryString("mode") = "allwords" then blnSearchFound = False
				    			
				    		End If
				    	Next
			    	End If
			    				    	
			    if strPageTitle <> " - " Then	
			    	'Calculate the total files searched
			    	intTotalFilesSearched = intTotalFilesSearched + 1
			
			
			    	
			    	'If the page contains no title then Page Title variable the appropriate message to display
			    	If strPageTitle = "" Then strPageTitle = "No Title"
			    	
			    	'If the page contains no title then Page Description variable the appropriate message to display
			    	If strPageDescription = "" Then strPageDescription = "There is no description available for this page"
			    	
			    		    				    			    	
			    	
			    	'If the search found variable is true then display the results
			    	If blnSearchFound = True Then
			    			    	
			    					    		    	
					'Calculate the total files found 
					intTotalFilesFound = intTotalFilesFound + 1
										
			    			    		
					'Check that the file shown is between the the files shown so far and the maximum files to show per page
					If  intNumFilesShown < (intRecordsPerPage + intFileNum) and intTotalFilesFound > intNumFilesShown Then
	
						'Calculate the number of results shown
						intNumFilesShown = intNumFilesShown + 1
						
					End If	
		
					       		
				       		
			       		'Place the search results into the saerch results array
			       		'Calculate the array position of the results array
			       		intResultsArrayPosition = intResultsArrayPosition + 1
			       		
				       		
			       		'Set the search results found boolean to true
			       		blnSearchResultsFound = True
				     					       		
	       			'Place the search results into the search results array
					newUrl = Replace(filObject.Name, ".xml", "")
					newProdId = Replace(filObject.Name, ".xml", "")
  
	       			sarySearchResults(intResultsArrayPosition,1) = "<tr><td valign=middle><img src=/image/000/dot3.gif height=12 width=20 border=0 name=prodDot" & intResultsArrayPosition & "></td><td valign=middle><a href=""/asp/prodDisplay.asp?prodId=" & newUrl & "&" & navQueryString  & """  onMouseOut=""restoreImage(document.images['prodDot" & intResultsArrayPosition & "'])"" onMouseOver=""swapImage(document.images['prodImage'],centerImage[" & intResultsArrayPosition & "]); swapImage(document.images['prodDot" & intResultsArrayPosition & "'],genNavImageOn);"" class=""altviolet2"">" & strPageTitle & "</a></td></tr>"			   			   								
					sarySearchResults(intResultsArrayPosition,1) = sarySearchResults(intResultsArrayPosition,1) & vbCrLf & "<script>centerImage[" & intResultsArrayPosition & "] = new Image()"
					sarySearchResults(intResultsArrayPosition,1) = sarySearchResults(intResultsArrayPosition,1) & vbCrLf & "centerImage[" & intResultsArrayPosition & "].src = '/image/" & newProdId & "/" & newProdId & ".gif'</script>"
					
					'Read in the number of search word matches into the second part of the two dimensional array
					sarySearchResults(intResultsArrayPosition,2) = intNumMatches
			end if						
		      		End If
							
				'Close the text stream object
		    		tsObject.Close
			End If
		End If
	Next
	
	'Reset the Regular Expression object
	Set objRegExp = Nothing
	
	'Reset server variables
	Set filObject = Nothing
	Set tsObject = Nothing
	Set subFldObject = Nothing
End Sub




'Sub procedure to sort the array using a Bubble Sort to place highest matches first
Private Sub SortResultsByNumMatches(ByRef sarySearchResults, ByRef intTotalFilesFound)

	'Dimension variables
	Dim intArrayGap 		'Holds the part of the array being sorted
	Dim intIndexPosition		'Holds the Array index position being sorted
	Dim intTempResultsHold		'Temperary hold for the results if they need swapping array positions		
	Dim intTempNumMatchesHold	'Temperary hold for the number of matches for the result if they need swapping array positions
	Dim intPassNumber		'Holds the pass number for the sort
	Dim firstImage
	
	'Loop round to sort each result found
	For intPassNumber = 1 To intTotalFilesFound
	
		'Shortens the number of passes
		For intIndexPosition = 1 To (intTotalFilesFound - intPassNumber)
		
			'If the Result being sorted hass less matches than the next result in the array then swap them
			If sarySearchResults(intIndexPosition,2) < sarySearchResults((intIndexPosition+1),2) Then
			
				
				'Place the Result being sorted in a temporary variable
				intTempResultsHold = sarySearchResults(intIndexPosition,1)
				
				'Place the Number of Matches for the result being sorted in a temporary variable
				intTempNumMatchesHold = sarySearchResults(intIndexPosition,2)
				
				
				'Do the array position swap
				
				'Move the next Result with a higher match rate into the present array location
				sarySearchResults(intIndexPosition,1) = sarySearchResults((intIndexPosition+1),1)
									
				'Move the next Number of Matches for the result with a higher match rate into the present array location
				sarySearchResults(intIndexPosition,2) = sarySearchResults((intIndexPosition+1),2)
				
				'Move the Result from the teporary holding variable into the next array position
				sarySearchResults((intIndexPosition+1),1) = intTempResultsHold
				
				'Move the Number of Matches for the result from the teporary holding variable into the next array position
				sarySearchResults((intIndexPosition+1),2) = intTempNumMatchesHold			
			End If
		Next			
	Next					
End Sub




'Function to read in the files meta tags
Private Function GetFileMetaTag(ByRef strStartValue, ByRef strEndValue, ByVal strFileContents)

	'Dimension Variables
	Dim intStartPositionInFile	'Holds the start position in the file
	Dim intEndPositionInFile	'Holds the end position in the file
	
	
	'Get the start position in the file of the meta tag
	intStartPositionInFile = InStr(1, LCase(strFileContents), strStartValue, 1)
	
	
	'If no description or keywords are found then you may be using http-equiv= instead of name= in your meta tags
	If intStartPositionInFile = 0 And InStr(strStartValue, "name=") Then
		
		'Swap name= for http-equiv= 
		strStartValue = Replace(strStartValue, "name=", "http-equiv=")
		
		'Check again for keywords or description
		intStartPositionInFile = InStr(1, LCase(strFileContents), strStartValue, 1)		
	End If
	
				    	
	'If there is a description then the position in file will be over 0
	If NOT intStartPositionInFile = 0 Then
					
		'Get the end position of the HTML meta tag
		intStartPositionInFile = intStartPositionInFile + Len(strStartValue)
						
		'Get the position in file of the closing tag for the meta tag
		intEndPositionInFile = InStr(intStartPositionInFile, LCase(strFileContents), strEndValue, 1)
	
		'Read in the meta tag from the file for the function to return
		GetFileMetaTag = Trim(Mid(strFileContents, intStartPositionInFile, (intEndPositionInFile - intStartPositionInFile)))
					
	'If the is no meta tag then the GetFileMetaTag function returns a null value
	Else
		GetFileMetaTag = ""
		       		
	End If

End Function
%>
<!--#include file="chromefoot.inc" -->

  
