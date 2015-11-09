<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="locale" %>
<%@taglib tagdir="/WEB-INF/tags/"  prefix="t" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<t:template>
    <form action="<c:url value="/auth.htm" /> " method="POST">
        <input type="hidden" name="_spring_security_remember_me" value="true" />
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
        <div>
            <label>Username: </label>
            <input type="text" name="username" value="" placeholder="Your Name" />
        </div>
        <div>
            <label>Password: </label>
            <input type="password" name="password" value="" />
        </div>
        <div>
            <input type="submit" name="login" value="Log in" />
        </div>
    </form>
    <p>
        <c:if test="${param.error == 'invalidLoginPassword'}">
            Invalid login or password. Please check and try again.
        </c:if>
    </p>
    <p>
        <c:if test="${param.error == 'LoginRequired'}">
            You are curently logged off. Please log in.
        </c:if>
    </p>
</t:template>