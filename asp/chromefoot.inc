<%
if url <> "" Then
	Response.write(HeaderArray(1))
end if
%>
<% if showads = "true" then %>
</td>
<td valign="top">
<!--#include file="ads_vertical.inc" -->
</td>
</tr>
</table>
<% end if %>
