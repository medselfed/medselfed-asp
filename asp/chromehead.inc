<%

  	Dim xml, strData, url, base

	url = ""

	

	if Request.QueryString("partnerId") = "chp" or subDomain = "chp" Then

		chpid = Request.QueryString("id")

		url = "http://www.ehealthconnection.com/regions/" & chpid & "/content/generated_for_preop.asp"

		'url = "http://www.medselfed.com/chpchrome.html"

	end if

	if Request.QueryString("partnerId") = "hvc" or subDomain = "hvc" Then

		hvcid = Request.QueryString("id")
		
		url = "http://www.kdmc.com/hvc/preop.asp"


	end if
	

	if Request.QueryString("partnerId") = "phj" or subDomain = "phj" Then

		phjid = Request.QueryString("id")

		url = "http://www.peacehealth.org/preop/peacehealthchrome.htm"

	end if



	if url <> "" Then	

		Set xml = Server.CreateObject("MSXML2.ServerXMLHTTP")

		xml.Open "GET", url, true   ' the True specifies an asynchronous request

		Call xml.Send()

		xml.waitForResponse 10

		strData = xml.ResponseText

		HeaderArray = Split(strData,"{CONTENTAREA}")

		Response.write(HeaderArray(0))

	end if

	

%>

<% if showads = "true" then %>

<table border="0" cellspacing="8" width="150" align="center">

<tr><td  valign="top">

<% end if %>

