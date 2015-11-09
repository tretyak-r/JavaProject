<%-- 
    Document   : template
    Created on : 31.08.2015, 21:04:12
    Author     : Roman
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="locale" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel ="stylesheet" href='<c:url value="/css/main.css" />' />
        <script src='<c:url value="/js/main.js" />'></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="" style="height: 100px; background-color: #abb231;"></div>
        <jsp:doBody>
            <jsp:attribute>
                
            </jsp:attribute>
        </jsp:doBody>
    </body>
</html>
