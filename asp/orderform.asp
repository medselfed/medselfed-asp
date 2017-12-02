<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="global.inc" -->
<%
	if subDomain = "postcare" Then
		Response.Redirect("/asp/sitemap.asp?siteId=postcare")
	end if
		
	' This NVP is used to determine the siteId 
	siteId  = "preop"
	prodId = Request.QueryString("prodId")
	partnerId = Request.QueryString("partnerId")
		
	titleText = "MedSelfEd Patient Education Order Form"
	pageTitle = "Order Form"


	bagSession = Session("bagSession")
	totalItems = 0
	if bagSession = "true" Then
		bagContents = Session("bagContents")
		totalItems = Session("totalItems")	
	end if
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
<form action="shippingForm.asp" method="get" id="shippingForm" name="shippingForm">
<input type="hidden" id="addrlocchange" name="addrlocchange" value="false" />
<div class="topdiv">
<!--#include file="header.inc" -->
<!--#include file="help.inc" -->
<form action="billingForm.asp" method="get">
<div class="lrlines">
<table width="100%" border="0" cellpadding="5" cellspacing="0" style="padding-left:10px; padding-right:10px">
<tr>
	<td colspan="3" class="lrggray">Ordering Full Length Videos</td>
</tr>
<tr>
	<td colspan="3">Required fields are indicated with a red asterisk (<span class="lrgred">*</span>).</td>
</tr>
<tr>
	<td colspan="3" class="medred">Shopping Cart</td>
</tr>
<tr>
        <td colspan="3" >
	<table width="100%" border="0" cellpadding="5" cellspacing="0">
		<tr>
			<td style="background:#cccccc; border-right: 1px solid #999999" class="med">Item #</td>
			<td style="background:#cccccc; border-right: 1px solid #999999" class="med">Description</td>
			<td style="background:#cccccc; border-right: 1px solid #999999" class="med">Qty</td>
			<td style="background:#cccccc; border-right: 1px solid #999999" class="med">Availability <span class="medred">*</span></td>
			<td align="center" style="background:#cccccc; border-right: 1px solid #999999" class="med">Cost</td>
			<td align="center" style="background:#cccccc;" class="med">Action</td>
		</tr>
<%
	i = 0 
	do while i < totalItems
		thisProdId =  bagContents(0,i)
		thisItemQty = bagContents(1,i)
%>
		<tr>
			<td><%= thisProdId %></td>
			<td>Cardiac Video</td>
			<td><input type="text" name="qty" value="<%= thisItemQty %>" style="width:20px" /></td>
			<td>In Stock</td>
			<td align="center">69.99</td>
			<td align="left">
				<input type="radio" checked="checked" name="bagaction-<%= thisProdId %>-<%= i %>" id="bagaction-<%= thisProdId %>-<%= i %>" value="purchase"/>Purchase Now<br />
				<input type="radio" name="bagaction-<%= thisProdId %>-<%= i %>" id="bagaction-<%= thisProdId %>-<%= i %>" value="remove"/>Remove<br />
				
			</td>
		</tr>
<%
		i=i+1 
	loop 
%>
		<tr>
			<td colspan="6" class="sml"><span class="medred">*</span>Please allow 3-5 business days for delivery</td>
	</table>
	</td>
</tr>
<tr>
	<td colspan="3" align="right">&nbsp;</td>
</tr>
</table>
</div>
<div class="lrtlines" >
<table width="100%" border="0" cellpadding="5" cellspacing="0" style="padding-left:10px; padding-right:10px">
<tr>
	<td colspan="3" align="right">&nbsp;</td>
</tr>
<tr>
        <td width="275" align="right">&nbsp;</td>
        <td width="150" align="right" class="med">Subtotal:</td>
        <td width="125" align="right">$69.99</td>
</tr>
<tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="med">Estimated Shipping:</td>
        <td align="right">$9.99</td>
</tr>
<tr>
        <td align="right">&nbsp;</td>
        <td align="right" colspan="2" style="border-bottom:1px solid #999999">&nbsp;</td>
</tr>
<tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="med">Estimated Total:</td>
        <td align="right">$79.99</td>
</tr>
<tr>
        <td colspan="3" align="right">&nbsp;</td>
</tr>
<tr>
        <td colspan="3" align="right">
		<input type="submit" style="border:1px solid #999999; width:130px" name="Return to procedure" value="Return to procedure" />
		<span style="width:30px">&nbsp;</span>
		<input type="submit" style="border:1px solid #999999; width:110px" name="Checkout" value="Checkout" />
	</td>
</tr>
<tr>
	<td colspan="3" align="right">&nbsp;</td>
</tr>
</table>
</div>		
</div>
</form>
<div class="topdiv">
<!--#include file="footer.inc" -->
</div>
</form>
</center>
<!--#include file="tracking.inc" -->
</body>
</html>
<!--#include file="chromefoot.inc" -->
