<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="global.inc" -->
<%
	if subDomain = "postcare" Then
		Response.Redirect("/asp/sitemap.asp?siteId=postcare")
	end if
		
	' This NVP is used to determine the siteId 
	siteId  = "preop"
	
	titleText = "MedSelfEd Patient Education: PreOp.com Home Page"
%>
<!--#include file="chromehead.inc" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><%= titleText %></title>
<!--#include file="meta.inc" -->
<link href="<%= baseHref %><%= cssDir %>/keyframe.css" rel="stylesheet" type="text/css">
<link href="<%= baseHref %><%= cssDir %>/fonts.css" rel="stylesheet" type="text/css">
<link href="<%= baseHref %><%= cssDir %>/layout.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%= baseHref %><%= jsDir %>/common.js"></script>
<script type="text/javascript" src="<%= baseHref %><%= jsDir %>/MM_functions.js"></script>
<% headerType = "true" %>
</head>
<body>
<center>
<div class="topdiv">
<!--#include file="header.inc" -->
<!--#include file="help.inc" -->
</div>
<div class="lrlines">&nbsp;
      
    <table cellpadding="2" cellspacing="0" width="99%">
	<tr>
	<td>
<div style="float:left; width:50%; height:200px">
<p class="lrgred">Privacy Policy Statement</p>
<p class="med">This is the web site of MedSelfEd, Inc..</p>
<p class="sml">Our postal address is:<br>
53 Gray Cliff Rd<br>
Newton, MA 02459<br>
We can be reached via e-mail at:<br>
<span class="smlred">privacyadmin@medselfed.net</span><br>
<p class="smlred">or you can reach us by telephone at 617-244-7591</p>
<p class="medred">This Policy is effective on June 1, 2005</p>
</div>
          <div style="float:right; width:50%;  height:200px"><center><img src="/image/lgMedpo.gif" width="180" height="182" /> 
          </center></div>
<div style="width:100%">
<p class="sml">For each visitor to our Web page, our Web server automatically recognizes the consumer's domain name and e-mail address (where possible).</p>
<p class="sml">We collect the domain name and e-mail address (where possible) of visitors to our Web page, the e-mail addresses of those who communicate with us via e-mail, aggregate information on what pages consumers access or visit, user-specific information on what pages consumers access or visit.</p>
<p class="sml">The information we collect is used for internal review and is then discarded, used to improve the content of our Web page, used to customize the content and/or layout of our page for each individual visitor, used to notify consumers about updates to our Web site, not shared with other organizations for commercial purposes.</p>
<p class="sml">With respect to cookies: We use cookies to record user-specific information on what pages users access or visit, record past activity at a site in order to provide better service when visitors return to our site , customize Web page content based on visitors' browser type or other information that the visitor sends and record session information.</p>
<p class="sml">If you do not want to receive e-mail from us in the future, please let us know by writing to us at the above address.</p>
<p class="sml">With respect to Ad Servers: To try and bring you offers that are of interest to you, we have relationships with other companies that we allow to place ads on our Web pages. As a result of your visit to our site, ad server companies may collect information such as your domain type, your IP address and clickstream information.<span class="Apple-converted-space">  </span>For further information, consult the privacy policies from a listing of other companies furnished to you by writing to us at the above address.</p>
<p class="sml">From time to time, we may use customer information for new, unanticipated uses not previously disclosed in our privacy notice.<span class="Apple-converted-space">  </span>If our information practices change at some time in the future we will post the policy changes to our Web site to notify you of these changes and provide you with the ability to opt out of these new uses.<span class="Apple-converted-space">  </span>If you are concerned about how your information is used, you should check back at our Web site periodically.</p>
<p class="sml">Customers may prevent their information from being used for purposes other than those for which it was originally collected by writing to us at the above address.</p>
<p class="sml">Upon request we provide site visitors with access to a description of information that we maintain about them. Consumers can access this information by writing to us at the above address.</p>
<p class="sml">Upon request we offer visitors the ability to have inaccuracies corrected in unique identifiers. Consumers can have this information corrected by writing to us at the above address.</p>
<p class="sml">With respect to security: We have appropriate security measures in place in our physical facilities to protect against the loss, misuse or alteration of information that we have collected from you at our site.</p>
<p class="sml">If you feel that this site is not following its stated information policy, you may contact us at the above addresses or phone number.</p>
</div>
	</td>
	</tr>
    </table>
      <br><a href="javascript:;" onclick="history.back(-1)"><img src="/image/000/close.gif" border="0"></a><br><br>
    </div>
<div class="topdiv">
<!--#include file="footer.inc" -->
</div>
</center>
<!--#include file="tracking.inc" -->
</body>
</html>
<!--#include file="chromefoot.inc" -->
