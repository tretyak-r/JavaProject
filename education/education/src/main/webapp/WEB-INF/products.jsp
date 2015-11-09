<%-- 
    Document   : products
    Created on : 31.08.2015, 20:44:17
    Author     : Roman
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="locale" %>
<%@taglib tagdir="/WEB-INF/tags/"  prefix="t" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<t:template>
        <table>
            <thead>
                <tr>
                    <th>id</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Count</th>
                    <th>Price</th>
                    <th>Category ID</th>
                    <th>Category title</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${products}" var="product">
                <tr>${Product.id}</tr
                <tr>${Product.title}</tr>
                <tr>${Product.description}</tr>
                <tr>${Product.count}</tr>
                <tr>${Product.price}</tr>
                <tr>${Product.productCategory.id}</tr>
                <tr>${Product.productCategory.title}</tr>
            </c:forEach>
            </tbody>
        </table>
    </t:template>

