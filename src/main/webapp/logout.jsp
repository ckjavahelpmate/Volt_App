

<%
session.removeAttribute("profile");
session.removeAttribute("id");

response.sendRedirect("index.jsp");
%>
