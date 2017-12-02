<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%

	partnerId = Request.QueryString("partnerId")
	prodId = Request.QueryString("prodId")

	bagSession = Session("bagSession")
	
	Dim newBagContents
	Dim newTotalItems
	newTotalItems = 0
	
	ReDim newBagContents(2,0)


	if bagSession = "true" Then
		bagContents = Session("bagContents")
		totalItems = Session("totalItems")
		
		do while i < totalItems
			updateProdIdQty = Request.QueryString("qty_" + bagContents(0,i))
			updateProdIdAction = Request.QueryString("bagaction_" + bagContents(0,i))
			if updateProdIdQty = 0 Then
				updateProdIdAction = "remove"
			end if 
			
			if updateProdIdAction = "purchase" Then
				if updateProdIdQty <> bagContents(1,i) then
					bagContents(1,i) = updateProdIdQty
				end if
				
				if Ubound(newBagContents,2) <> newTotalItems Then
					ReDim Preserve newBagContents(2,newTotalItems)
				end if
				 
				newBagContents(0,newTotalItems) = bagContents(0,i)
				newBagContents(1,newTotalItems) = bagContents(1,i)
				newTotalItems = newTotalItems + 1
				
			elseif updateProdIdAction = "remove" Then
				bagContents(1,i) = 0
			end if
			%>
				Update: <%= bagContents(0,i) %><br />
				Current Qty: <%= bagContents(1,i) %><br />
				Update Qty to: <%= updateProdIdQty %><br />
				Update Action: <%= updateProdIdAction %><br /><br />
			<%

			i=i+1
		loop
		
		'if newTotalItems = 0  and totalItems = 0 Then
		'	Session("bagSession") = "false"
		'	Session("bagContents") = ""
		'	Session("totalItems") = 0
		'else 
		'	Session("bagSession") = "true"
			Session("bagContents") = newBagContents
			Session("totalItems") = newTotalItems			
		'end if

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

<%= thisProdId %> : <%= thisProdId %> : <%= thisItemQty %> <br />

<%
		i=i+1 
	loop 
%>