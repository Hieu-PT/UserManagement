<%-- 
    Document   : viewPromotionHistory
    Created on : Aug 23, 2020, 11:28:46 AM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Promotion History</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%@include file="menuAdmin.jsp" %>
        <div class="main">
            <section class="col-main" style="min-height: 625px">
                <h2 style="font-size: 25px">Promotion History</h2>
                <form action="MainController" method="POST">
                    Search:<input type="text" name="txtSearch" style="margin-left: 35px; margin-right: 20px"/>
                    <input type="submit" value="Search " name="action" style="margin-left: 20px;"/>
                </form>
                <c:if test="${requestScope.INFO != null}">
                    <c:if test="${not empty requestScope.INFO}" var="checkList">
                        <br/>
                        <table border="5" style="margin: 30px; border: solid black;">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Promo ID</th>
                                    <th>Creator ID</th>
                                    <th>Creator Name</th>
                                    <th>Assignment Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.INFO}" var="dto" varStatus="counter">
                                    <tr>
                                        <td>${counter.count}</td>
                                        <td>${dto.promoID}</td>
                                        <td>${dto.creatorID}</td>
                                        <td>${dto.creatorName}</td>
                                        <td>${dto.assignmentDate}</td>
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
