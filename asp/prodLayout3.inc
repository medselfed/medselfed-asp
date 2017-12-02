<table bgcolor="#ffffff" width="99%" border="0" cellpadding="15" cellspacing="0" align="center">
	<tr> 
		<td align="left" valign="top">
		<% for x = 1 to audioImage.length
			if audioImage.item(x-1).getAttribute("secId") = secId Then %> 
			<img USEMAP="#audioMap<%= secId %>" SRC="../image<%= audioImage.item(x-1).getAttribute("image") %>" ALT="Audio Presentation" WIDTH="146" HEIGHT="134" BORDER="0" ALIGN="bottom">
			<MAP NAME="audioMap<%= secId %>">			
				<AREA SHAPE="rect" COORDS="1,112,19,131" HREF="javascript:;" onClick="MM_openBrWindow('/asp/audiowin.asp?prodId=<%= prodId %>&fileName=<%= navDocRoot.selectSingleNode("directory").getAttribute("audioMedia") %><%= audioImage.item(x-1).getAttribute("audioMapQT")%>&mediaType=qt&siteId=<%= siteId %>','littlewin','width=225,height=100');">
				<AREA SHAPE="rect" COORDS="124,112,145,132" HREF="javascript:;" onClick="MM_openBrWindow('/asp/audiowin.asp?prodId=<%= prodId %>&fileName=<%= navDocRoot.selectSingleNode("directory").getAttribute("audioMedia") %><%= audioImage.item(x-1).getAttribute("audioMapWM")%>&mediaType=wm&siteId=<%= siteId %>','littlewin','width=225,height=100');">
			</MAP>
		<% end if
		next %>
		</td>
    	<td width="100%" align="left" valign="top">	
<% if centerId <> "" or headerImage <> "false" Then %>			
	        <table bgcolor="#ffffff" width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr align="center"> 
					<td valign="top" height="25"><h1 class="header4"><%= navDocRoot.selectSingleNode("pageHeader1").text %></h1></td>
				</tr>
				<tr align="center"> 
					<td valign="top" height="11"><h2 class="header5"><%= navDocRoot.selectSingleNode("pageHeader2").text %></h2></td>
                </tr>
                <tr align="center"> 
                  
                <td height="18" valign="top" class="headersec"><br>
                  <%= prodName %></td>
                </tr>
			</table>			
<% else %>
			 <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
               <tr>
            	 <td width="60" align="center" valign="top" class="sml">Powered By<br><img src="../image/000/<%= siteId %>/logo.gif" alt="HOME" name="homelink" id="homelink" width="49" height="53" border="0" align="bottom"></td>
                 <td align="center" valign="middle" class="headersec"><%= prodName %></td>
               </tr>
               <tr>                
            <td colspan="2" valign="bottom" class="header" height="36"><%= navDocRoot.selectSingleNode("pageHeader1").text %></td>
               </tr>
               <tr> 
                 <td colspan="2" valign="bottom" class="headerit2"><%= navDocRoot.selectSingleNode("pageHeader2").text %></td>
               </tr>
               <tr> 
                 <td colspan="2" valign="top" class="headerit2">&nbsp;</td>
               </tr>
            </table>
<% end if %>
            </td>
            <td align="right" valign="top">
			<table width="155" border="1" cellspacing="0" cellpadding="0">
<% for i = 1 to navElement.length %>
	<tr> 
<% if navElement.item(i-1).getAttribute("secId") = secId Then %>
	<td width="17" bgcolor="#FFFFFF"><a href="/asp/prodDisplay.asp?prodName=<%= navDocRoot.selectSingleNode("pageHeader1").text %> <%= navDocRoot.selectSingleNode("pageHeader2").text %> <%= navElement.item(i-1).text %>&prodId=<%= prodId %>&secId=<%= navElement.item(i-1).getAttribute("secId") %>&<%= navQueryString %>&relProdId=<%= relProdId %>"><img src="../image/000/nav/nav_on.gif" width="17" height="17" border="0"></a></td>
	<td bgcolor="#FFFFFF">&nbsp;&nbsp;<a href="/asp/prodDisplay.asp?prodId=<%= prodId %>&secId=<%= navElement.item(i-1).getAttribute("secId") %>&<%= navQueryString %>&relProdId=<%= relProdId %>" class="alt2"><%= navElement.item(i-1).text %></a></td>
<% else %>
	<td width="17" bgcolor="#FFFFFF"><a href="/asp/prodDisplay.asp?prodName=<%= navDocRoot.selectSingleNode("pageHeader1").text %> <%= navDocRoot.selectSingleNode("pageHeader2").text %> <%= navElement.item(i-1).text %>&prodId=<%= prodId %>&secId=<%= navElement.item(i-1).getAttribute("secId") %>&<%= navQueryString %>&relProdId=<%= relProdId %>"><img src="../image/000/nav/nav.gif" name="navImg<%= i - 1 %>" width="17" height="17" border="0" onMouseOver="swapImage(document.images['navImg<%= i - 1 %>'],navigationImage[2])"  onMouseOut="swapImage(document.images['navImg<%= i - 1 %>'],navigationImage[1])"></a></td>

    <td bgcolor="#999999">&nbsp;&nbsp;<a href="/asp/prodDisplay.asp?prodName=<%= navDocRoot.selectSingleNode("pageHeader1").text %> <%= navDocRoot.selectSingleNode("pageHeader2").text %> <%= navElement.item(i-1).text %>&prodId=<%= prodId %>&secId=<%= navElement.item(i-1).getAttribute("secId") %>&<%= navQueryString %>&relProdId=<%= relProdId %>" class="alt1" onMouseOver="swapImage(document.images['navImg<%= i - 1 %>'],navigationImage[2])" onMouseOut="swapImage(document.images['navImg<%= i - 1 %>'],navigationImage[1])"><%= navElement.item(i-1).text %></a></td>
<% end if %>
	</tr>
<% next	%>
<% if siteId = "postcare" Then %>
<tr>
	<td width="17" bgcolor="#FFFFFF"><a href="javascript:;" onClick="MM_openBrWindow('/asp/printFrame.asp?<%= Request.queryString() %>','printPage','width=600,height=500')"><img src="../image/000/nav/nav.gif" width="17" height="17" name="navImg<%= i %>" border="0" onMouseOver="swapImage(this,navigationImage[2])"  onMouseOut="swapImage(this,navigationImage[1])"></a></td>
    <td bgcolor="#999999">&nbsp;&nbsp;<a href="javascript:;" onClick="MM_openBrWindow('/asp/printFrame.asp?<%= Request.queryString() %>','printPage','width=600,height=500')" class="alt1" onMouseOver="swapImage(document.images['navImg<%= i %>'],navigationImage[2])" onMouseOut="swapImage(document.images['navImg<%= i %>'],navigationImage[1])">Print Out</a></td>
</tr>
<% if relProdId <> "" Then %>
<tr>
	<td width="17" bgcolor="#FFFFFF"><a href="/asp/prodRelation.asp?prodName=<%= navDocRoot.selectSingleNode("pageHeader1").text %> <%= navDocRoot.selectSingleNode("pageHeader2").text %> <%= prodName %>&prodId=<%= relProdId %>&<%= navQueryString %>"><img src="../image/000/nav/nav.gif" width="17" height="17" border="0" name="navImg<%= i + 1 %>" onMouseOver="swapImage(this,navigationImage[2])"  onMouseOut="swapImage(this,navigationImage[1])"></a></td>
    <td bgcolor="#999999">&nbsp;&nbsp;<a href="/asp/prodRelation.asp?prodId=<%= relProdId %>&<%= navQueryString %>" class="alt1"  onMouseOver="swapImage(document.images['navImg<%= i + 1 %>'],navigationImage[2])" onMouseOut="swapImage(document.images['navImg<%= i + 1 %>'],navigationImage[1])">Other Tasks</a></td>
</tr>
<tr>
	<td width="17" bgcolor="#FFFFFF"><a href="/asp/prodDisplay.asp?prodName=<%= navDocRoot.selectSingleNode("pageHeader1").text %> <%= navDocRoot.selectSingleNode("pageHeader2").text %> <%= prodName %>&prodId=<%= relProdId %>&<%= navQueryString %>"><img src="../image/000/nav/nav.gif" width="17" height="17" border="0" name="navImg<%= i + 2 %>" onMouseOver="swapImage(this,navigationImage[2])"  onMouseOut="swapImage(this,navigationImage[1])"></a></td>
    <td bgcolor="#999999">&nbsp;&nbsp;<a href="/asp/prodDisplay.asp?prodId=<%= relProdId %>&<%= navQueryString %>"class="alt1"  onMouseOver="swapImage(document.images['navImg<%= i + 2 %>'],navigationImage[2])" onMouseOut="swapImage(document.images['navImg<%= i + 2 %>'],navigationImage[1])">Return to Procedure</a></td>
</tr>
<% end if %>
<% end if %>
</table>
			</td>
          </tr>
		  <tr><td colspan="3" valign="top" align="center">
            <table cellpadding="0" cellspacing="0" border="0">
              <% if prodRelation.length <> "0" and postcare = "true" Then %>
              <tr> 
                <td align="center"><a href="/asp/prodRelation.asp?prodId=<%= prodId %>&<%= navQueryString %>" onMouseOut="swapImage(document.images['gotopostcare'],postcareImage[1])" onMouseOver="swapImage(document.images['gotopostcare'],postcareImage[0])"><img src="/image/000/preop/goto_pc.gif" border="0" name="gotopostcare"></a></td>
              </tr>
              <% elseif relProdId <> "" Then %>
              <% else %>
              <% end if %>
              <tr> 
                <td align="center"> 
                  <% if relProdId <> "" and headerImage <> "relation" Then %>
                  <table border="1" cellpadding="5">
                    <tr> 
                      <td width="90%" align="center" valign="middle" class="sml" bgcolor="#FFE6F4">This information is not intended to replace the advice of your doctor.
MedSelfEd, Inc. disclaims any liability for the decisions you make based on this information. </td>
                    </tr>
                  </table> 
				   <% elseif siteId = "postcare" Then %>
                  <table border="1" cellpadding="5">
                    <tr> 
                      <td width="90%" align="center" valign="middle" class="sml" bgcolor="#FFE6F4">This information is not intended to replace the advice of your doctor.
MedSelfEd, Inc. disclaims any liability for the decisions you make based on this information. </td>
                    </tr>
                  </table> 
                  <% else %>
                  <table border="1" cellpadding="5">
                    <tr> 
                      <td width="90%" align="center" valign="middle" class="sml" bgcolor="#FFE6F4">This information is not intended to replace the advice of your doctor.
MedSelfEd, Inc. disclaims any liability for the decisions you make based on this information. </td>
                    </tr>
                  </table>
                  <% end if %>
                </td>
              </tr>
            </table>		
	</td></tr>
	</table>
</div>
<img src="../image/000/bottom_cap2.gif" class="bottomCap" alt="">
</div>
<!--#include file="prodServices.inc" -->
<div class="topdiv">
<img src="../image/000/top_cap2.gif" class="topCap" alt=""><div class="lrlines">
<table bgcolor="#ffffff" width="95%" border="0" cellspacing="0" cellpadding="5" align="center">
          <% 
			for x = 1 to topHtml.length
				if topHtml.item(x-1).getAttribute("secId") = secId Then
			%>
          <tr>
            <td valign="top" colspan="3"><%= topHtml.item(x-1).text %></td>
          </tr>
          <%
				end if
			next 
			%>

          <% 
		  foundProds = "false"
		  for i = 1 to procedureInfo.length
				if procedureInfo.item(i-1).getAttribute("secId") = secId Then
					foundProds = "true"
				end if
			next
			if foundProds = "true" Then
		   %>

<tr>
	<td></td><td><img style="border:1px solid #999999" src="/image/000/slide.gif"></td><td></td>
</tr>

<% end if %>
          <% for i = 1 to procedureInfo.length
				if procedureInfo.item(i-1).getAttribute("secId") = secId Then
		   %>
          <% 
			for x = 1 to midHtml.length
				if midHtml.item(x-1).getAttribute("secId") = secId Then
					if midHtml.item(x-1).getAttribute("spotId") = procedureInfo.item(i-1).getAttribute("spotId") Then
			%>
          <tr>
            <td valign="top" colspan="3"><%= midHtml.item(x-1).text %></td>
          </tr>
          <%
					end if
				end if
			next 
			%>

          <tr> 
            <td valign="middle"> <% 
			for x = 1 to videoImage.length
				if videoImage.item(x-1).getAttribute("secId") = secId Then
					if videoImage.item(x-1).getAttribute("spotId") = procedureInfo.item(i-1).getAttribute("spotId") Then
			%> 
              <table bgcolor="#ffffff" width="0" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td bgcolor="#999999"> <table width="0" border="0" cellspacing="1" cellpadding="0">
                      <tr>
                        
                <td bgcolor="#FFFFFF"><img src="../image/000/movie.gif" alt="Movie" border="0" align="middle" height="68" usemap="#videoMap<%= videoImage.item(x-1).getAttribute("spotId") %>" width="38"> 
				<map name="videoMap<%= videoImage.item(x-1).getAttribute("spotId") %>">
  					<area shape="rect" coords="5,12,33,39" href="/asp/video.asp?prodId=<%= prodId %>&secId=<%= secId %>&spotId=<%= videoImage.item(x-1).getAttribute("spotId")%>&mediaType=qt&<%= navQueryString %>&relProdId=<%= relProdId %>">
  					<area shape="rect" coords="5,40,31,68" href="/asp/video.asp?prodId=<%= prodId %>&secId=<%= secId %>&spotId=<%= videoImage.item(x-1).getAttribute("spotId")%>&mediaType=wm&<%= navQueryString %>&relProdId=<%= relProdId %>">
				</map>
						</td>
                      </tr>
                    </table></td>
                </tr>
              </table>
              <%
					end if
				end if
			next
			%> </td>
            <td valign="middle">
              <table bgcolor="#ffffff" width="0" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td bgcolor="#999999"> <table bgcolor="#ffffff" width="0" border="0" cellspacing="1" cellpadding="0">
                      <tr> 
<!-- Slide Images Here -->					  
                        <td bgcolor="#FFFFFF">
						<% if procedureInfo.item(i-1).getAttribute("image") <> "" Then %>
						<a href="/asp/slides.asp?prodId=<%= prodId %>&secId=<%= procedureInfo.item(i-1).getAttribute("secId") %>&spotId=<%= procedureInfo.item(i-1).getAttribute("spotId") %>&<%= navQueryString%>&relProdId=<%= relProdId %>"><img src="../image<%= procedureInfo.item(i-1).getAttribute("image") %>" class="prodSlide" align="middle" alt="<%= procedureInfo.item(i-1).text %>"></a>
                        <% end if %>
						</td>
                      </tr>
                    </table></td>
                </tr>
              </table>
            </td>
            <td width="100%"><%= procedureInfo.item(i-1).text %></td>
          </tr>
          <% end if
		  next
   	
			for w = 1 to botHtml.length
				if botHtml.item(w-1).getAttribute("secId") = secId Then
		  %>
          <tr> 
            <td colspan="3" valign="top"><%= botHtml.item(w-1).text %></td>
          </tr>
          <% end if
		  next
		  %>
        </table>

<br>
<table width="90%" border="0" cellspacing="0" cellpadding="15">
          <tr>
            <td width="33%" align="left">
              <% if secId  = 2 Then %>
				&nbsp;      
			<% else %>
				<a href="/asp/prodDisplay.asp?prodId=<%= prodId %>&secId=<%= (thisSec - 1) %>&<%= navQueryString%>&<%= ehcQueryString %>">previous</a> 
			<% end if %></td>
	        <td width="33%" align="center"><a href="#top">top of page</a> </td>
			<td width="33%" align="right"> 
              <% if thisSec = lastSec Then %>
				&nbsp;  
			<% else %>
				<a href="/asp/prodDisplay.asp?prodId=<%= prodId %>&secId=<%= (thisSec + 1) %>&<%= navQueryString%>&<%= ehcQueryString %>">next</a> 
        	<% end if %></td>
  </tr>
</table>
