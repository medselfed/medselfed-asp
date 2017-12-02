<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 
 orderBy =  Request.QueryString("orderBy")
 createNew =  Request.QueryString("createNew")
 
dim SQLString 
if orderBy <> "" Then
	SQLString = "SELECT * FROM partners order by " & orderBy
else 
	SQLString = "SELECT * FROM partners"
end if

dim RS            'connection Recordset
dim objConn        'connection object    
dim DSNtemp        'connection string    
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open "DSN=MySqlDSN;database=medselfed_dev"
Set Rs = objConn.Execute(SQLString)
%>
<!--#include file="header.inc" -->
<style type="text/css">
<!--
.style1 {font-size: x-small}
-->
</style>

<table width="100%"  border="0">
  <tr>
    <td rowspan="2" align="center">Site Id ProdId CenterId</td>
    <td>&nbsp;</td>
    <td align="left" valign="top"><strong>Procedure Name (English) </strong><a href="#"><span class="style1"></span></a></td>
    <td colspan="2" align="left" valign="top"><input name="textfield" type="text" size="50"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="left" valign="top"><strong>Procedure Name (Spanish) </strong><a href="#"><span class="style1"></span></a></td>
    <td colspan="2" align="left" valign="top"><input name="textfield" type="text" size="50"></td>
  </tr>
  <tr>
    <td width="37%" align="center"> <strong>Bullets (English) </strong> </td>
    <td width="5%"><p>&nbsp;    </p>    </td>
    <td width="17%"> <strong>Bullets (Spanish) </strong> </td>
    <td width="18%"> <strong>Copy (English) </strong><a href="#"><span class="style1">translate</span></a>  </td>
    <td width="23%"> <strong>Copy (Spanish) </strong> </td>
  </tr>
  <tr>
    <td align="center"><img src="/image/361/361-2-01b.gif" width="320" height="240"></td>
    <td>&nbsp;</td>
    <td align="left" valign="top"> <div align="left"><textarea rows="15">Como almacenar la insulina. </textarea>
    </div></td>
    <td align="left" valign="top"><p align="left"><textarea rows="15">How you store your insulins before and after you open the vials or cartridges is most important. </textarea></p></td>
    <td align="left" valign="top"><div align="left"><textarea rows="15">La forma como almacenes tu insulina antes y despu&eacute;s de que abras un frasco &oacute; cartucho es lo m&aacute;s importante. </textarea></div></td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
    <td>&nbsp;</td>
    <td align="left" valign="top"><form name="form1" method="post" action="">
      <input type="submit" name="Submit" value="Submit">
      <input type="reset" name="Submit4" value="Reset">
        </form></td>
    <td align="left" valign="top"><input type="submit" name="Submit2" value="Submit">
    <input type="reset" name="Submit5" value="Reset">    </td>
    <td align="left" valign="top"><input type="submit" name="Submit3" value="Submit">
    <input type="reset" name="Submit6" value="Reset">    </td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
    <td>&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><img src="/image/361/361-2-02b.gif" width="320" height="240"></td>
    <td>&nbsp;</td>
    <td align="left" valign="top">
      <div align="left">
        <textarea rows="15">Como almacenar la insulina. </textarea>
    </div></td>
    <td align="left" valign="top"><p align="left">
        <textarea rows="15">How you store your insulins before and after you open the vials or cartridges is most important. </textarea>
    </p></td>
    <td align="left" valign="top"><div align="left">
        <textarea rows="15">La forma como almacenes tu insulina antes y despu&eacute;s de que abras un frasco &oacute; cartucho es lo m&aacute;s importante. </textarea>
    </div></td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
    <td>&nbsp;</td>
    <td align="left" valign="top"><form name="form1" method="post" action="">
        <input type="submit" name="Submit" value="Submit">
        <input type="reset" name="Submit4" value="Reset">
    </form></td>
    <td align="left" valign="top"><input type="submit" name="Submit2" value="Submit">
        <input type="reset" name="Submit5" value="Reset">
    </td>
    <td align="left" valign="top"><input type="submit" name="Submit3" value="Submit">
        <input type="reset" name="Submit6" value="Reset">
    </td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
    <td>&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><img src="/image/361/361-2-03b.gif" width="320" height="240"></td>
    <td>&nbsp;</td>
    <td align="left" valign="top">
      <div align="left">
        <textarea rows="15">Como almacenar la insulina. </textarea>
    </div></td>
    <td align="left" valign="top"><p align="left">
        <textarea rows="15">How you store your insulins before and after you open the vials or cartridges is most important. </textarea>
    </p></td>
    <td align="left" valign="top"><div align="left">
        <textarea rows="15">La forma como almacenes tu insulina antes y despu&eacute;s de que abras un frasco &oacute; cartucho es lo m&aacute;s importante. </textarea>
    </div></td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
    <td>&nbsp;</td>
    <td align="left" valign="top"><form name="form1" method="post" action="">
        <input type="submit" name="Submit" value="Submit">
        <input type="reset" name="Submit4" value="Reset">
    </form></td>
    <td align="left" valign="top"><input type="submit" name="Submit2" value="Submit">
        <input type="reset" name="Submit5" value="Reset">
    </td>
    <td align="left" valign="top"><input type="submit" name="Submit3" value="Submit">
        <input type="reset" name="Submit6" value="Reset">
    </td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
    <td>&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><img src="/image/361/361-2-04b.gif" width="320" height="240"></td>
    <td>&nbsp;</td>
    <td align="left" valign="top">
      <div align="left">
        <textarea rows="15">Como almacenar la insulina. </textarea>
    </div></td>
    <td align="left" valign="top"><p align="left">
        <textarea rows="15">How you store your insulins before and after you open the vials or cartridges is most important. </textarea>
    </p></td>
    <td align="left" valign="top"><div align="left">
        <textarea rows="15">La forma como almacenes tu insulina antes y despu&eacute;s de que abras un frasco &oacute; cartucho es lo m&aacute;s importante. </textarea>
    </div></td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
    <td>&nbsp;</td>
    <td align="left" valign="top"><form name="form1" method="post" action="">
        <input type="submit" name="Submit" value="Submit">
        <input type="reset" name="Submit4" value="Reset">
    </form></td>
    <td align="left" valign="top"><input type="submit" name="Submit2" value="Submit">
        <input type="reset" name="Submit5" value="Reset">
    </td>
    <td align="left" valign="top"><input type="submit" name="Submit3" value="Submit">
        <input type="reset" name="Submit6" value="Reset">
    </td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
    <td>&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
  </tr>
</table>
<!--#include file="footer.inc" -->
<img src="/image/000/top_cap2.gif" width="600"><div class="lrlines">
<table cellpadding="3" align="center" cellspacing="0" border="0" width="95%">
	<tr><td class="med" align="left">
<% pagename = "editPartner.asp" %>
<!--#include file="help.inc" -->
</td></tr></table>
</div>
<img src="/image/000/bottom_cap2.gif" width="600">



