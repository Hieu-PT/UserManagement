<%-- 
    Document   : sub
    Created on : Aug 18, 2020, 3:36:14 PM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sub Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%@include file="menuUser.jsp" %>
        <div class="main">
            <section class="col-main" style="min-height: 625px">
                <h2 style="font-size: 25px">Search Page</h2>
                <form action="MainController" method="POST">
                    Search:<input type="text" name="txtSearch" style="margin-left: 35px; margin-right: 20px"/>
                    <input type="hidden" name="role" value="Sub"/>
                    <input type="submit" value="Search" name="action"/>
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
