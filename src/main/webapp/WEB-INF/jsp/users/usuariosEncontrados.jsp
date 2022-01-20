<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="IdusMartii" tagdir="/WEB-INF/tags" %>

<IdusMartii:adminLayout pageName="users">
    <h2>Users</h2>

    <table id="usersTable" class="table table-striped">
        <thead>
        <tr>
            <th style="width: 150px;">Username</th>
        </tr>
        </thead>
        <tbody>
      
           <c:forEach items="${users}" var="user">
            <tr>
                <td>
                	<c:out value="${user.username}"/>
                </td>
              <td>
				<spring:url value="/users/{id}/edit" var="userUrl">
		    	<spring:param name="id" value="${user.username}"/>
				</spring:url>
                	<a href= "${fn:escapeXml(userUrl)}">Editar</a>
               </td>
               <td> 
  				<spring:url value="/users/{username}/delete" var="userrUrl">
		    	<spring:param name="username" value="${user.username}"/>
				</spring:url> 
                    <a href="${fn:escapeXml(userrUrl)}">Eliminar</a>
           	   </td>
                                   	
            </tr>       
           </c:forEach>
              
                
                	
        </tbody>
    </table>
    
</IdusMartii:adminLayout>