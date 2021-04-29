<%
    String message = (String) session.getAttribute("message");
    if (message != null) {


%>

<div class="alert alert-danger" role="alert">
    <%= message%>
</div>

<%            session.removeAttribute("message");
    }
%>