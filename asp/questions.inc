<%
	fileName = "/xml/questions.xml"
	navDoc.validateOnParse = false 
	navDoc.load(Server.MapPath(fileName))
	' begin to read XML file
	set navDocRoot = navDoc.documentElement
	set questionElement = navDocRoot.getElementsByTagName("question")
	set answersElement = navDocRoot.getElementsByTagName("answers")
	navQuestionNum = 0
	questionsFound = "false"
	
for i = 1 to questionElement.length 
	if questionElement.item(i-1).getAttribute("prodId") = "all" or questionElement.item(i-1).getAttribute("prodId") = prodId Then
		if Session("question" & questionElement.item(i-1).getAttribute("questionId")) = "" Then
			questionsFound = "true"
		end if
	end if
next



%>
<% if questionsFound <> "false" and questionOn <> "0" Then %>
<script type="text/javascript">
<!--


function getNavImageObj(){
	genNavImageOn = new Image()
	genNavImageOn.src = imageUrl + '/000/dot3_r.gif'
}
getNavImageObj()

var navQuestionAry = new Array(); 

function navQuestionObj(name){
	this.name = name
}

function showFirstQuestion(){
	if (navQuestionAry.length != 0){
		show(navQuestionAry[0].name)
	} 
}

function showQuestion(questionObj){
	for(var x = 0; x != navQuestionAry.length; x++){
		if (questionObj == navQuestionAry[x].name){
			show(navQuestionAry[x].name)
		} else (
			hide(navQuestionAry[x].name)
		)
	}
}

function showNextQuestion(questionObj){
	for(var x = 0; x != navQuestionAry.length; x++){
		if (questionObj == navQuestionAry[x].name){
			if ((x + 1) == navQuestionAry.length){
			} else if (x < navQuestionAry.length){
				showQuestion(navQuestionAry[x + 1].name)
			} 
		} 
	}
}

function submitAnswer(questionId,answerId){
	newUrl = "/asp/submitAnswer.asp?sessionNum=<%= session.sessionID %>&partnerId=<%= partnerId %>&questionId=" + questionId + "&answerId=" + answerId
	document.getElementById("submitQuestion").src = newUrl
}

//-->
</script>
<table width="95%" cellpadding="2" cellspacing="0" border="0">
<tr><td height="175" valign="top">&nbsp;
<div align="center" class="divContQuestions">
<table width="70%" cellpadding="2" cellspacing="0" border="0">
<tr><td class="medred" align="left" colspan="2"><p>Survey Questions</p></td></tr>
</table>

<% 
questionNumber = 0
for i = 1 to questionElement.length 
	if questionElement.item(i-1).getAttribute("prodId") = "all" or questionElement.item(i-1).getAttribute("prodId") = prodId Then
		if Session("question" & questionElement.item(i-1).getAttribute("questionId")) = "" Then
		questionNumber = questionNumber + 1
%>
<div align="center" class="divQuestion" id="questionId<%= questionElement.item(i-1).getAttribute("questionId") %>">
<table width="70%" cellpadding="2" cellspacing="0" border="0">
<tr><td class="med" align="left" colspan="2"><%= questionNumber %>) <%= questionElement.item(i-1).text %></td></tr>
<script type="text/javascript">
		navQuestionAry[<%= navQuestionNum %>] = new navQuestionObj('questionId<%= questionElement.item(i-1).getAttribute("questionId") %>')
</script>
<% for y = 1 to answersElement.length 
		if answersElement.item(y-1).getAttribute("questionId") = questionElement.item(i-1).getAttribute("questionId") Then
%>
<tr><td class="sml" align="left" width="5%"><img src="../image/000/dot3.gif" border="0" name="prodDot<%= answersElement.item(y-1).getAttribute("answerId") %>" onClick="submitAnswer('<%= questionElement.item(i-1).getAttribute("questionId") %>','<%= answersElement.item(y-1).getAttribute("answerId") %>'); showNextQuestion('questionId<%= questionElement.item(i-1).getAttribute("questionId") %>')" onMouseOut="restoreImage(document.images['prodDot<%= answersElement.item(y-1).getAttribute("answerId") %>'])" onMouseOver="swapImage(document.images['prodDot<%= answersElement.item(y-1).getAttribute("answerId") %>'],genNavImageOn);"></td>
<td><a href="javascript:;" onClick="submitAnswer('<%= questionElement.item(i-1).getAttribute("questionId") %>','<%= answersElement.item(y-1).getAttribute("answerId") %>'); showNextQuestion('questionId<%= questionElement.item(i-1).getAttribute("questionId") %>')" class="altviolet2" onMouseOut="restoreImage(document.images['prodDot<%= answersElement.item(y-1).getAttribute("answerId") %>'])" onMouseOver="swapImage(document.images['prodDot<%= answersElement.item(y-1).getAttribute("answerId") %>'],genNavImageOn);"><%= answersElement.item(y-1).text %></a></td></tr>
<%
		end if
	next
%>
</table>
</div>
<%
		navQuestionNum = navQuestionNum + 1
		end if
	end if
next %>
<div align="center" class="divQuestion" id="questionIdThanks">
<script type="text/javascript">
<!--
		navQuestionAry[navQuestionAry.length] = new navQuestionObj('questionIdThanks')
//-->
</script>
<table width="70%" cellpadding="2" cellspacing="0" border="0">
<tr><td class="medred" align="middle" valign="center" height="30">Thank you for taking our Survey!</td></tr>
</table>
</div>
</div></td></tr></table>
<script type="text/javascript">
<!--
	showFirstQuestion()
//-->
</script>
<iframe height="0" width="0" border="0" frameborder="0" id="submitQuestion" name="submitQuestion"></iframe>
<% end if %>