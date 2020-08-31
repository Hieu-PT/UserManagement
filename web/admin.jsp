<%-- 
    Document   : admin
    Created on : Aug 18, 2020, 10:43:38 AM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%@include file="menuAdmin.jsp" %>
        <div class="main">
            <section class="col-main" style="min-height: 625px">
                <h2 style="font-size: 25px">Search Page</h2>
                <form action="MainController" method="POST">
                    Search:<input type="text" name="txtSearch" style="margin-left: 35px; margin-right: 20px"/>
                    <select name="role" id="role">
                        <option value="All" <c:if test="${requestScope.Role == 'All'}">selected=""</c:if>>All</option>
                        <c:forEach items="${sessionScope.LIST_ROLES}" var="dto">
                            <option value="${dto.toString()}" <c:if test="${requestScope.Role == dto.toString()}">selected=""</c:if>>${dto.toString()}</option>
                        </c:forEach>
                    </select>
                    <input type="submit" value="Search" name="action" style="margin-left: 20px;"/>
                </form>
                <c:if test="${requestScope.INFO != null}">
                    <c:if test="${not empty requestScope.INFO}" var="checkList">
                        <br/>
                        <table border="5" style="margin: 30px; border: solid black;">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Image</th>
                                    <th>Username</th>
                                    <th>Fullname</th>
                                    <th>Update</th>
                                    <th>Delete</th>
                                    <th>Promotion</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.INFO}" var="dto" varStatus="counter">
                                    <tr>
                                        <td>${counter.count}</td>
                                        <td><img src="${dto.photo}" style="width: 80px; height: 80px"></td>
                                        <td>${dto.username}</td>
                                        <td>${dto.name}</td>
                                        <td>
                                            <form action="MainController" method="POST">
                                                <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                                                <input type="hidden" name="id" value="${dto.username}"/>
                                                <input type="hidden" name="role" value="${param.role}"/>
                                                <input type="submit" value="Edit" name="action" style="width: 100%; height: 35px"/>
                                            </form>
                                        </td>
                                        <td>
                                            <c:url var="deleteLink" value="MainController">
                                                <c:param name="action" value="Delete"/>
                                                <c:param name="id" value="${dto.username}"/>
                                                <c:param name="txtSearch" value="${param.txtSearch}"/>
                                                <c:param name="role" value="${param.role}"/>
                                            </c:url>
                                            <a href="${deleteLink}">Delete</a>
                                        </td>
                                        <td>
                                            <c:if test="${dto.available}" var="checkAvailable">
                                                <form action="MainController" method="POST">
                                                    <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                                                    <input type="hidden" name="username" value="${dto.username}"/>
                                                    <input type="hidden" name="role" value="${param.role}"/>
                                                    <input type="submit" value="Add" name="action" style="width: 100%; height: 35px"/>
                                                </form>
                                            </c:if>
                                            <c:if test="${!checkAvailable}">Not Available</c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${!checkList}">
                        No record found
                    </c:if>
                </c:if>
            </section>
            <%@include file="aside.jsp" %>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
