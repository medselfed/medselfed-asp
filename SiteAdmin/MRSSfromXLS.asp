<%@  language="VBSCRIPT" codepage="1252" %>

<h1>Generate MRSS Feed from XLS File</h1>
<p>This simple script takes an XML file and makes a XML format MRSS feed from it.  A few caveats:</p>
<ul>
    <li>The XLS file must have the exact format specified in the template available at <a target="_blank" href="http://"<% Request.ServerVariables("server_name") %>/xml/special/mrss_import_template.xls">/xml/special/mrss_import_template.xls"</a>.  This includes the label row.  Columns cannot be added or deleted from the file</li>
    <li>You file names MUST NOT have any spaces or special characters.</li>
    <li>Your file name should include the extension.</li>
    <li>Your Excel file needs to be saved in Excel 2003 format (.xls).</li>
    <li>For best compatibility, you will want to give your export file name a .xml extension.</li>
    <li>For this to work, a correctly formatted XLS file must be placed in the "/xml/special/" folder on the server.  You will need to place this file in the proper directory using a FTP client.</li>
</ul>

<form name="partnerUpdate" action="generateMRSSfromXLS.asp">
Import Filename:  <input class="sml" type="text" size="35" name="importFilename"> (i.e. mrss_import.xls)<br />
Export Filename:  <input class="sml" type="text" size="35" name="exportFilename"> (i.e. mrss_feed.xml)<br />

<input class="altButtonFormat" type="submit" name="action" value="Generate MRSS"/>

</form>


