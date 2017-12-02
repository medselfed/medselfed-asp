<%

	strDomain = "preop"

	for x = 1 to 10

		if Mid(strDomain, x, 1) = "." Then

			subDomain = Left(strDomain, x - 1)

			x = 10

		end if		

	next
	'****************DEV ENVIRONMENT*****************
	'This is required for page to run on development server
	'subDomain = "preop"
	'************************************************

	cachedate = Request.QueryString("cachedate")

	id = Request.QueryString("id")

	siteId = Request.QueryString("siteId")

	centerId = Request.QueryString("centerId")

	sexId = Request.QueryString("sexId")

	partnerId = Request.QueryString("partnerId")

	relProdId = Request.QueryString("relProdId")

	prodId = Request.QueryString("prodId")

	secId = Request.QueryString("secId")

	spotId = Request.QueryString("spotId")

	spotId = Request.QueryString("spotId")

	hideNav = Request.QueryString("hideNav")

	

	VisualIds = "&hideNav=" & hideNav

	

	mediaType = Request.QueryString("mediaType")



	emailId = Request.QueryString("emailId")

	affId = Request.QueryString("affId")

	campId = Request.QueryString("campId")	

	MarketingIds = "&emailId=" & emailId & "&affId=" & affId & "&campId=" & campId

	

	PartfileName = "/xml/partners/" & subDomain & ".xml"

	set PartnavDoc = Server.CreateObject("Microsoft.XMLDOM") 

	PartnavDoc.validateOnParse = false 

	PartnavDoc.load(Server.MapPath(PartfileName))

	' begin to read XML file

	set PartnavDocRoot = PartnavDoc.documentElement

	set navlink = PartnavDocRoot.getElementsByTagName("navlink")

	set navdrop = PartnavDocRoot.getElementsByTagName("navdrop")

	set centerLink = PartnavDocRoot.getElementsByTagName("centerLink")

	set prodLink = PartnavDocRoot.getElementsByTagName("prodLink")

	

	jsDir = PartnavDocRoot.selectSingleNode("jsDir").text

	cssDir = PartnavDocRoot.selectSingleNode("cssDir").text

	partnerName = PartnavDocRoot.selectSingleNode("name").text

	pageTitle = PartnavDocRoot.selectSingleNode("headerName").text

	headerType = PartnavDocRoot.selectSingleNode("headerType").text

	showads = PartnavDocRoot.selectSingleNode("showads").text

	questionOn = PartnavDocRoot.selectSingleNode("questions").text

	
	if partnerId = "" Then

		partnerId = PartnavDocRoot.selectSingleNode("partnerId").text

	end if

	postcare = PartnavDocRoot.selectSingleNode("postcare").text

	prodLayout = PartnavDocRoot.selectSingleNode("prodLayout").text





	Set objConn = Server.CreateObject("ADODB.Connection")

	objConn.Open "DSN=MySqlDSN;database=medselfed_prod"



	SQLString = "SELECT * FROM partners where partnerId = '" & partnerId & "'"

	if partnerId <> "" Then

		Set partners = objConn.Execute(SQLString)

	end if

	

	SQLString = "SELECT * FROM procedures where prodId = '" & prodId & "'"

	if prodId <> "" Then

		Set procedures = objConn.Execute(SQLString)

	end if	


sub getSessionData ()



end sub



	navQueryString = "partnerId=" & partnerId & "&id=" & Request.QueryString("id") & "&cachedate=" & Request.QueryString("cachedate") & MarketingIds & VisualIds



	centerQueryString = "&centerId=" & centerId

	relQueryString = "&relProdId=" & relProdId

	

	if relProdId <> "" Then

		headerType = "relation"

	end if	

%>
