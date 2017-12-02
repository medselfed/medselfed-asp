<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%

	partnerId = Request.QueryString("partnerId")
	prodId = Request.QueryString("prodId")
	totalItems = 0
	newItem = "true"

	bagSession = Session("bagSession")
	if bagSession = "true" Then

		bagContents = Session("bagContents")
		totalItems = Session("totalItems")
		
		do while i < totalItems
			if bagContents(0,i) = prodId then
				bagContents(1,i) = bagContents(1,i) + 1
				newItem = "false"
			end if
			i=i+1
		loop
		
		if newItem = "true" then
			totalItems = totalItems + 1
			ReDim Preserve bagContents(2,totalItems)
			bagContents(0,(totalItems - 1)) = prodId
			bagContents(1,(totalItems - 1)) = 1
		end if

		Session("totalItems") = totalItems
		Session("bagContents") = bagContents

	else
		Session("bagSession") = "true"

		Dim newBagContents(2,1)
		newBagContents(0,0) = prodId
		newBagContents(1,0) = 1
		Session("bagContents") = newBagContents 
		totalItems = 1
		Session("totalItems") = totalItems
	end if

	Response.Redirect("shoppingBag.asp?prodId=" + prodId + "&partnerId=" + partnerId)
%>

<%
	bagSession = Session("bagSession")
	totalItems = 0
	if bagSession = "true" Then
		bagContents = Session("bagContents")
		totalItems = Session("totalItems")	
	end if
%>
<%= bagSession %><br />
<%= totalItems %><br />
<%
	i = 0 
	do while i < totalItems
		thisProdId =  bagContents(0,i)
		thisItemQty = bagContents(1,i)
%>

<%= thisProdId %> : <%= thisItemQty %> <br />

<%
		i=i+1 
	loop 
%>