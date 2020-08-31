<%-- 
    Document   : viewPromotion
    Created on : Aug 21, 2020, 1:13:55 PM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Promotion</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%@include file="menuAdmin.jsp" %>
        <div class="main">
            <section class="col-main" style="min-height: 625px">
                <h2 style="font-size: 25px">Promotion List</h2>
                <h3>${requestScope.MESSAGE}</h3>
                <c:if test="${requestScope.INFO != null}">
                    <c:if test="${not empty requestScope.INFO}" var="checkList">
                        <form action="MainController">
                            <p style="color: green;">${requestScope.SUCCESS_MESSAGE}</p>
                            <p style="color: red; margin-left: 320px">${requestScope.RANKMESSAGE}</p>
                            <table border="5" style="margin: 10px; border: solid black;">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Image</th>
                                        <th>Username</th>
                                        <th>Fullname</th>
                                        <th>Rank (1-10)</th>
                                        <th>Remove</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.INFO}" var="dto" varStatus="counter">
                                        <tr>
                                            <td>${counter.count}</td>
                                            <td><img src="${dto.value.photo}" style="width: 80px; height: 80px"></td>
                                            <td>${dto.value.username}</td>
                                            <td>${dto.value.name}</td>
                                            <td>
                                                <input type="text" name="txtRank" value="${dto.value.rank}"/>
                                                <input type="hidden" name="txtUsername" value="${dto.value.username}"/>
                                            </td>
                                            <td>
                                                <c:url var="deleteLink" value="MainController">
                                                    <c:param name="action" value="Remove"/>
                                                    <c:param name="username" value="${dto.value.username}"/>
                                                    <c:param name="txtSearch" value="${param.txtSearch}"/>
                                                </c:url>
                                                <a href="${deleteLink}">Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <input type="submit" value="Save" name="action" style="margin: 0px 20px 20px 170px; width: 100px; height: 50px"/>
                            <input type="submit" value="Confirm" name="action" style="margin: 0px 20px 20px 20px; width: 100px; height: 50px"/>
                        </form>
                    </c:if>
                    <c:if test="${!checkList}">
                        Your promotion list is null
                    </c:if>
                </c:if>
            </section>
            <%@include file="aside.jsp" %>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
