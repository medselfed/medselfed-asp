<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="global.inc" -->
<%
	if subDomain = "postcare" Then
		Response.Redirect("/asp/sitemap.asp?siteId=postcare")
	end if
		
	' This NVP is used to determine the siteId 
	siteId  = "preop"
	
	titleText = "MedSelfEd Patient Education Order Form"
	pageTitle = "Order Form"

	title = Request.QueryString("title")
	firstname = Request.QueryString("firstname")
	middlename = Request.QueryString("middlename")
	lastname = Request.QueryString("lastname")
	addrloc = Request.QueryString("addrloc")
	address1 = Request.QueryString("address1")
	address2 = Request.QueryString("address2")
	address3 = Request.QueryString("address3")
	city = Request.QueryString("city")
	zip = Request.QueryString("zip")
	statecode = Request.QueryString("statecode")
	
	company = Request.QueryString("company")
	shipisbill = Request.QueryString("shipisbill")
	email = Request.QueryString("email")
	optin = Request.QueryString("optin")
	dayphone = Request.QueryString("dayphone")
	dayphoneopt = Request.QueryString("dayphoneopt")
	evephone = Request.QueryString("evephone")
	evephoneopt = Request.QueryString("evephoneopt")
	continue = Request.QueryString("continue")
	addrlocchange = Request.QueryString("addrlocchange")
	shiptochange = Request.QueryString("shiptochange")
	showerrors = "false"
	iserror = "false"
	
	if continue = "continue" Then
		showerrors = "true"
		if firstname = "" or lastname = "" or address1 = "" or city = "" or statecode = "" or zip = "" or email = "" Then
			iserror = "true"
		else
			processBilling()
		end if		
	elseif addrlocchange = "true" or shiptochange = "true" or continue = "" Then
		showerrors = "false"
	end if

Sub processBilling()
	Response.Redirect "shippingForm.asp"
End Sub

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
<script	type="text/javascript">
function changeAddrLoc(addrObj){
	billingForm.addrlocchange.value = "true";
	billingForm.submit();
}
function changeShipTo(shipbillObj){
	billingForm.shiptochange.value = "true";
	billingForm.submit();
}
</script>


<% headerType = "true" %>

</head>
<body>
<style type="text/css">
input {
	font-family:Arial, Helvetica, sans-serif;
	font-size:12px;
}

select {
	font-family:Arial, Helvetica, sans-serif;
	font-size:12px;
}

</style>

<center>
<form action="billingForm.asp" method="get" id="billingForm" name="billingForm">
<input type="hidden" id="addrlocchange" name="addrlocchange" value="false" />
<input type="hidden" id="shiptochange" name="shiptochange" value="false" />
<div class="topdiv">
<!--#include file="header.inc" -->
<!--#include file="help.inc" -->
<div class="lrlines">
<table width="100%" border="0" cellpadding="5" cellspacing="0" style="padding-left:10px">
<tr>
	<td colspan="3" class="lrggray">Billing Information</td>
</tr>
<tr>
	<td colspan="3">Please enter the information exactly as it appears on your credit card statement.
Required fields are indicated with a red asterisk (<span class="lrgred">*</span>).</td>
</tr>
<tr>
	<td colspan="3" class="medred">Name</td>
</tr>
<tr>
	<td width="100" align="right">Title:</td>
	<td width="275" align="left">
		<select name="title" id="title" style="font-family:Arial, Helvetica, sans-serif; cursor:pointer">
			<option id="none" value="" <% if title = "" then %> selected <% end if %>>Please Choose</option>
			<option id="mr" value="mr" <% if title = "mr" then %> selected <% end if %>>Mr.</option>
			<option id="mrs" value="mrs" <% if title = "mrs" then %> selected <% end if %>>Mrs.</option>
			<option id="ms" value="ms" <% if title = "ms" then %> selected <% end if %>>Ms.</option>
			<option id="dr" value="dr" <% if title = "dr" then %> selected <% end if %>>Dr.</option>
		</select>
    </td>
	<td width="125">&nbsp;</td>
</tr>
<tr>
	<td width="100" align="right">First Name<span class="lrgred">*</span>:</td>
	<td width="275" align="left">
		<input type="text" size="50" style="font-family:Arial, Helvetica, sans-serif;" name="firstname" id="firstname" value="<%= firstname %>" />
    </td>
	<td width="125" class="smlred" align="left"><% if showerrors = "true" and firstname = "" Then %> Required Field <% end if %> </td>
</tr>
<tr>
	<td width="100" align="right">Middle Name:</td>
	<td width="275" align="left">
		<input type="text" size="50" style="font-family:Arial, Helvetica, sans-serif;" name="middlename" id="middlename" value="<%= middlename %>" />
    </td>
	<td width="125">&nbsp;</td>
</tr>
<tr>
	<td width="100" align="right">Last Name<span class="lrgred">*</span>:</td>
	<td width="275" align="left">
		<input type="text" size="50" style="font-family:Arial, Helvetica, sans-serif;" name="lastname" id="lastname" value="<%= lastname %>" />
    </td>
	<td width="125" class="smlred" align="left"><% if showerrors = "true" and lastname = "" Then %> Required Field <% end if %> </td>
</tr>
<tr>
	<td colspan="3">&nbsp;</td>
</tr>
</table>
</div>	
<div class="lrtlines" align="center">
<table width="100%" border="0" cellpadding="5" cellspacing="0" style="padding-left:10px">
<tr>
	<td colspan="3" class="medred"></td>
</tr>
<tr>
	<td colspan="3" class="medred">Billing Address</td>
</tr>
<tr>
	<td width="100" align="right">Address Location<span class="lrgred">*</span>:</td>
	<td colspan="2" align="left">
		<input style="cursor:pointer" type="radio" onChange="changeAddrLoc(this)" name="addrloc" id="addrloc" value="usa" <% if addrloc = "usa" then %> checked <% elseif addrloc = "" then %> checked <% end if %> style="padding-left:20px; vertical-align: middle">
		USA &amp; Territories
		<input style="cursor:pointer" type="radio" onChange="changeAddrLoc(this)" name="addrloc" id="addrloc" value="can" <% if addrloc = "can" then %> checked <% end if %> style="padding-left:20px; vertical-align: middle">Canada
	</td>
</tr>
<tr>
	<td width="100" align="right">&nbsp;</td>
	<td colspan="2" class="sml">Note that MedSelfEd only accepts orders from the US and Canada</td>
</tr>
<tr>
	<td width="100" align="right">Address<span class="lrgred">*</span>:</td>
	<td width="275" align="left">
		<input type="text" size="50" style="font-family:Arial, Helvetica, sans-serif;" name="address1" id="address1" value="<%= address1 %>" />
    </td>
	<td width="125" class="smlred" align="left"><% if showerrors = "true" and address1 = "" Then %> Required Field <% end if %> </td>
</tr>
<tr>
	<td width="100" align="right">&nbsp;</td>
	<td width="275" align="left">
		<input type="text" size="50" style="font-family:Arial, Helvetica, sans-serif;" name="address2" id="address2" value="<%= address2 %>" />
    </td>
	<td width="125">&nbsp;</td>
</tr>
<tr>
	<td width="100" align="right">&nbsp;</td>
	<td width="275" align="left">
		<input type="text" size="50" style="font-family:Arial, Helvetica, sans-serif;" name="address3" id="address3" value="<%= address3 %>"/>
    </td>
	<td width="125">&nbsp;</td>
</tr>
<tr>
	<td width="100" align="right">City<span class="lrgred">*</span>:</td>
	<td width="275" align="left">
		<input type="text" size="50" style="font-family:Arial, Helvetica, sans-serif;" name="city" id="city" value="<%= city %>"/>
    </td>
	<td width="125" class="smlred" align="left"><% if showerrors = "true" and city = "" Then %> Required Field <% end if %> </td>
</tr>
<% if addrloc = "usa" or addrloc = "" then %>
<tr>
	<td width="100" align="right">State<span class="lrgred">*</span>:</td>
	<td width="275" align="left">
<select  style="font-family:Arial, Helvetica, sans-serif;" name="statecode" id="statecode" value="<%= statecode %>"/>
  <option <%if statecode = "" then %>selected<% end if %> value="">Please Select</option>
  <option <%if statecode = "AL" then %>selected<% end if %> value="AL">Alabama (AL)</option>
  <option <%if statecode = "AK" then %>selected<% end if %> value="AK">Alaska (AK)</option>
  <option <%if statecode = "AS" then %>selected<% end if %> value="AS">American Samoa (AS)</option>
  <option <%if statecode = "AA" then %>selected<% end if %> value="AA">APO/FPO Address (AA)</option>
  <option <%if statecode = "AE" then %>selected<% end if %> value="AE">APO/FPO Address (AE)</option>
  <option <%if statecode = "AP" then %>selected<% end if %> value="AP">APO/FPO Address (AP)</option>
  <option <%if statecode = "AZ" then %>selected<% end if %> value="AZ">Arizona (AZ)</option>
  <option <%if statecode = "AR" then %>selected<% end if %> value="AR">Arkansas (AR)</option>
  <option <%if statecode = "CA" then %>selected<% end if %> value="CA">California (CA)</option>
  <option <%if statecode = "CO" then %>selected<% end if %> value="CO">Colorado (CO)</option>
  <option <%if statecode = "CT" then %>selected<% end if %> value="CT">Connecticut (CT)</option>
  <option <%if statecode = "DE" then %>selected<% end if %> value="DE">Delaware (DE)</option>
  <option <%if statecode = "DC" then %>selected<% end if %> value="DC">District of Columbia (DC)</option>
  <option <%if statecode = "FM" then %>selected<% end if %> value="FM">Federation of Micronesia (FM)</option>
  <option <%if statecode = "FL" then %>selected<% end if %> value="FL">Florida (FL)</option>
  <option <%if statecode = "GA" then %>selected<% end if %> value="GA">Georgia (GA)</option>
  <option <%if statecode = "GU" then %>selected<% end if %> value="GU">Guam (GU)</option>
  <option <%if statecode = "HI" then %>selected<% end if %> value="HI">Hawaii (HI)</option>
  <option <%if statecode = "ID" then %>selected<% end if %> value="ID">Idaho (ID)</option>
  <option <%if statecode = "IL" then %>selected<% end if %> value="IL">Illinois (IL)</option>
  <option <%if statecode = "IN" then %>selected<% end if %> value="IN">Indiana (IN)</option>
  <option <%if statecode = "IN" then %>selected<% end if %> value="IA">Iowa (IA)</option>
  <option <%if statecode = "KS" then %>selected<% end if %> value="KS">Kansas (KS)</option>
  <option <%if statecode = "KY" then %>selected<% end if %> value="KY">Kentucky (KY)</option>
  <option <%if statecode = "LA" then %>selected<% end if %> value="LA">Louisiana (LA)</option>
  <option <%if statecode = "ME" then %>selected<% end if %> value="ME">Maine (ME)</option>
  <option <%if statecode = "MH" then %>selected<% end if %> value="MH">Marshall Islands (MH)</option>
  <option <%if statecode = "MD" then %>selected<% end if %> value="MD">Maryland (MD)</option>
  <option <%if statecode = "MA" then %>selected<% end if %> value="MA">Massachusetts (MA)</option>
  <option <%if statecode = "MI" then %>selected<% end if %> value="MI">Michigan (MI)</option>
  <option <%if statecode = "MN" then %>selected<% end if %> value="MN">Minnesota (MN)</option>
  <option <%if statecode = "MS" then %>selected<% end if %> value="MS">Mississippi (MS)</option>
  <option <%if statecode = "MO" then %>selected<% end if %> value="MO">Missouri (MO)</option>
  <option <%if statecode = "MT" then %>selected<% end if %> value="MT">Montana (MT)</option>
  <option <%if statecode = "NE" then %>selected<% end if %> value="NE">Nebraska (NE)</option>
  <option <%if statecode = "NV" then %>selected<% end if %> value="NV">Nevada (NV)</option>
  <option <%if statecode = "NH" then %>selected<% end if %> value="NH">New Hampshire (NH)</option>
  <option <%if statecode = "NJ" then %>selected<% end if %> value="NJ">New Jersey (NJ)</option>
  <option <%if statecode = "NM" then %>selected<% end if %> value="NM">New Mexico (NM)</option>
  <option <%if statecode = "NY" then %>selected<% end if %> value="NY">New York (NY)</option>
  <option <%if statecode = "NC" then %>selected<% end if %> value="NC">North Carolina (NC)</option>
  <option <%if statecode = "ND" then %>selected<% end if %> value="ND">North Dakota (ND)</option>
  <option <%if statecode = "MP" then %>selected<% end if %> value="MP">Northern Mariana Islands (MP)</option>
  <option <%if statecode = "OH" then %>selected<% end if %> value="OH">Ohio (OH)</option>
  <option <%if statecode = "OK" then %>selected<% end if %> value="OK">Oklahoma (OK)</option>
  <option <%if statecode = "OR" then %>selected<% end if %> value="OR">Oregon (OR)</option>
  <option <%if statecode = "PW" then %>selected<% end if %> value="PW">Palau (PW)</option>
  <option <%if statecode = "PA" then %>selected<% end if %> value="PA">Pennsylvania (PA)</option>
  <option <%if statecode = "PR" then %>selected<% end if %> value="PR">Puerto Rico (PR)</option>
  <option <%if statecode = "RI" then %>selected<% end if %> value="RI">Rhode Island (RI)</option>
  <option <%if statecode = "SC" then %>selected<% end if %> value="SC">South Carolina (SC)</option>
  <option <%if statecode = "SD" then %>selected<% end if %> value="SD">South Dakota (SD)</option>
  <option <%if statecode = "TN" then %>selected<% end if %> value="TN">Tennessee (TN)</option>
  <option <%if statecode = "TX" then %>selected<% end if %> value="TX">Texas (TX)</option>
  <option <%if statecode = "UT" then %>selected<% end if %> value="UT">Utah (UT)</option>
  <option <%if statecode = "VT" then %>selected<% end if %> value="VT">Vermont (VT)</option>
  <option <%if statecode = "VI" then %>selected<% end if %> value="VI">Virgin Islands (VI)</option>
  <option <%if statecode = "VA" then %>selected<% end if %> value="VA">Virginia (VA)</option>
  <option <%if statecode = "WA" then %>selected<% end if %> value="WA">Washington (WA)</option>
  <option <%if statecode = "WI" then %>selected<% end if %> value="WI">West Virginia (WV)</option>
  <option <%if statecode = "WI" then %>selected<% end if %> value="WI">Wisconsin (WI)</option>
  <option <%if statecode = "WY" then %>selected<% end if %> value="WY">Wyoming (WY)</option>
</select>				
    </td>
	<td width="125" class="smlred" align="left"><% if showerrors = "true" and statecode = "" Then %> Required Field <% end if %> </td>
</tr>
<tr>
	<td width="100" align="right">Zip Code<span class="lrgred">*</span>:</td>
	<td width="275" align="left">
		<input type="text" size="50" style="font-family:Arial, Helvetica, sans-serif;" name="zip" id="zip" value="<%= zip %>"/>
    </td>
	<td width="125" class="smlred" align="left"><% if showerrors = "true" and zip = "" Then %> Required Field <% end if %> </td>
</tr>
<% elseif addrloc = "can" then %>
<tr>
	<td width="100" align="right">Province<span class="lrgred">*</span>:</td>
	<td width="275" align="left">
		<select  style="font-family:Arial, Helvetica, sans-serif;" name="statecode" id="statecode" value="<%= statecode %>"/>
			<option <%if statecode = "" then %>selected<% end if %> value="">Please Choose</option>
			<option <%if statecode = "AB" then %>selected<% end if %> value="AB">Alberta (AB)</option>
			<option <%if statecode = "BC" then %>selected<% end if %> value="BC">British Columbia (BC)</option>
			<option <%if statecode = "MB" then %>selected<% end if %> value="MB">Manitoba (MB)</option>
			<option <%if statecode = "NB" then %>selected<% end if %> value="NB">New Brunswick (NB)</option>
			<option <%if statecode = "NL" then %>selected<% end if %> value="NL">Newfoundland (NL)</option>
			<option <%if statecode = "NT" then %>selected<% end if %> value="NT">Northwest Territories (NT)</option>
			<option <%if statecode = "NS" then %>selected<% end if %> value="NS">Nova Scotia (NS)</option>
			<option <%if statecode = "NU" then %>selected<% end if %> value="NU">Nunavut (NU)</option>
			<option <%if statecode = "ON" then %>selected<% end if %> value="ON">Ontario (ON)</option>
			<option <%if statecode = "PE" then %>selected<% end if %> value="PE">Prince Edward Island (PE)</option>
			<option <%if statecode = "QC" then %>selected<% end if %> value="QC">Quebec (QC)</option>
			<option <%if statecode = "SK" then %>selected<% end if %> value="SK">Saskatchewan (SK)</option>
			<option <%if statecode = "YT" then %>selected<% end if %> value="YT">Yukon Territory (YT)</option>
		</select>
    </td>
	<td width="125" class="smlred" align="left"><% if showerrors = "true" and statecode = "" Then %> Required Field <% end if %> </td>
</tr>
<tr>
	<td width="100" align="right">Postal Code<span class="lrgred">*</span>:</td>
	<td width="275" align="left">
		<input type="text" size="50" style="font-family:Arial, Helvetica, sans-serif;" name="zip" id="zip" value="<%= zip %>"/>
    </td>
	<td width="125" class="smlred" align="left"><% if showerrors = "true" and zip = "" Then %> Required Field <% end if %> </td>
</tr>
<% end if %>
<tr>
	<td width="100" align="right">Company Name:</td>
	<td width="275" align="left">
		<input type="text" size="50" style="font-family:Arial, Helvetica, sans-serif;" name="company" id="company" value="<%= company %>"/>
    </td>
	<td width="125">&nbsp;</td>
</tr>
<tr>
	<td width="100" align="right">&nbsp;</td>
	<td colspan="2" class="med"><input type="checkbox" style="vertical-align: middle" name="shipisbill" id="shipisbill" <% if shipisbill = "on" or continue = "" then %>  checked="checked" <% end if %>/>Shipping address same as billing address<br>
	<span class="sml" style="padding-left:20px;">Note that FedEx cannot deliver to US P.O. Boxes</span></td>
</tr>
<tr>
	<td colspan="4">&nbsp;</td>
</tr>
</table>
</div>	
<div class="lrtlines" align="center">
<table width="100%" border="0" cellpadding="5" cellspacing="0" style="padding-left:10px">
<tr>
	<td colspan="3" class="medred"></td>
</tr>
<tr>
	<td colspan="3" class="medred">Contact Information</td>
</tr>
<tr>
	<td width="100" align="right">Email Address<span class="lrgred">*</span>:</td>
	<td width="275" align="left">
		<input type="text" size="25" style="font-family:Arial, Helvetica, sans-serif;" name="email" id="email" value="<%= email %>"/>
    </td>
	<td width="125" class="smlred" align="left"><% if showerrors = "true" and email = "" Then %> Required Field <% end if %> </td>
</tr>
<tr>
	<td width="100" align="right">&nbsp;</td>
	<td width="275" align="left" class="sml"><input type="checkbox" checked="checked" style="vertical-align: middle" name="optin" id="optin">
		Send me email updates on new procedures &amp; special offers
    </td>
	<td width="125">&nbsp;</td>
</tr>


<tr>
	<td width="100" align="right">Daytime Phone:</td>
	<td width="275" align="left">
		<input type="text" size="25" style="font-family:Arial, Helvetica, sans-serif;" name="dayphone" id="dayphone" value="<%= dayphone %>"/>
		<input type="radio" name="dayphoneopt" id="dayphoneopt" <% if dayphoneopt = "home" or dayphoneopt = "" then %>checked<% end if %> value="home" style="padding-left:20px; vertical-align: middle">Home
		<input type="radio" name="dayphoneopt" id="dayphoneopt" <% if dayphoneopt = "business" then %>checked<% end if %> value="business" style="padding-left:20px; vertical-align: middle">Business
    </td>
	<td width="125">&nbsp;</td>
</tr>
<tr>
	<td width="100" align="right">Evening Phone:</td>
	<td width="275" align="left">
		<input type="text" size="25" style="font-family:Arial, Helvetica, sans-serif;" name="evephone" id="evephone" value="<%= evephone %>"/>
		<input type="radio" name="evephoneopt" id="evephoneopt" value="home" <% if evephoneopt = "home" or evephoneopt = "" then %>checked<% end if %> style="padding-left:20px; vertical-align: middle">Home
		<input type="radio" name="evephoneopt" id="evephoneopt" value="business" <% if evephoneopt = "business" then %>checked<% end if %> style="padding-left:20px; vertical-align: middle">Business		
    </td>
	<td width="125">&nbsp;</td>
</tr>
<tr>
	<td colspan="4">&nbsp;</td>
</tr>
<tr>
	<td width="100" align="right">&nbsp;</td>
	<td width="275" align="left">&nbsp;</td>
	<td width="125" align="left"><input type="submit" id="continue" name="continue" value="continue" style="width:110px; background:#cccccc; border:1px solid #999999; width:110px; cursor:pointer"></td>
</tr>
<tr>
	<td colspan="4">&nbsp;</td>
</tr>
</table>
</div>		
</div>
<div class="topdiv">
<!--#include file="footer.inc" -->
</div>
</form>
</center>
<!--#include file="tracking.inc" -->
</body>
</html>
<!--#include file="chromefoot.inc" -->