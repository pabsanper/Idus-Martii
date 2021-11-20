<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="IdusMartii" tagdir="/WEB-INF/tags" %>

<IdusMartii:layout pageName="users">
    <h2>Users</h2>

    <table id="usersTable" class="table table-striped">
        <thead>
        <tr>
            <th style="width: 150px;">Username</th>
            <th style="width: 200px;">Email</th>
            <th style="width: 100px;">Enabled</th>
            <th style="width: 200px;">Password</th>
           
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="users">
            <tr>
                <td>
                    <c:out value="${users.username}"/>
                </td>
                 <td>
                    <c:out value="${users.email}"/>
                </td>
				<td>
                    <c:out value="${users.enabled}"/>
                </td>
        		 <td>
                    <c:out value="${users.password}"/>
                </td>
                <td>
                
                	<spring:url value="/users/new" var="userUrl">
                    </spring:url>
                	<a href= "${fn:escapeXml(userUrl)}">Create</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</IdusMartii:layout>