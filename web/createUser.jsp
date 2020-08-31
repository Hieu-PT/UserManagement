<%-- 
    Document   : createUser
    Created on : Aug 18, 2020, 10:28:19 PM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create User Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%@include file="menuAdmin.jsp" %>
        <div class="main">
            <section class="col-main" style="min-height: 625px">
                <h2 style=" font-size: 30px; margin: 40px;">Create New User</h2>
                <font color="green">
                    ${requestScope.MESSAGE}
                </font>
                <form action="InsertUserController" method="POST" enctype="multipart/form-data">
                    Role: <select name="role" id="role" style="margin: 20px 20px 20px 108px">
                        <c:forEach items="${sessionScope.LIST_ROLES}" var="dto">
                            <option value="${dto.toString()}" <c:if test="${requestScope.Role == dto.toString()}">selected=""</c:if>>${dto.toString()}</option>
                        </c:forEach>
                    </select>
                    <br/>
                    Username: <input type="text" name="txtUsername" style="margin: 20px 20px 20px 70px;" value="${param.txtUsername}"/>
                    <font color="red">
                    ${requestScope.INVALID.usernameError}
                    </font>
                    <br/>
                    Password: <input type="password" name="txtPassword" style="margin: 20px 20px 20px 73px;" value="${param.txtPassword}"/>
                    <font color="red">
                    ${requestScope.INVALID.passwordError}
                    </font>
                    <br/>
                    Confirm Password: <input type="password" name="txtConfirm" style="margin: 20px 20px 20px 20px;" value="${param.txtConfirm}"/>
                    <font color="red">
                    ${requestScope.INVALID.confirmError}
                    </font>
                    <br/>
                    Fullname:<input type="text" name="txtName" style="margin: 20px 20px 10px 80px" value="${param.txtName}"/>
                    <font color="red">
                    ${requestScope.INVALID.nameError}
                    </font>
                    <br/>
                    Email:<input type="text" name="txtEmail" style="margin: 20px 20px 10px 101px" value="${param.txtEmail}"/>
                    <font color="red">
                    ${requestScope.INVALID.emailError}
                    </font>
                    <br/>
                    Phone:<input type="text" name="txtPhone" style="margin: 20px 20px 10px 96px" value="${param.txtPhone}"/>
                    <font color="red">
                    ${requestScope.INVALID.phoneError}
                    </font>
                    <br/>
                    Photo: <input type="file" name="image" size="60" style="margin: 20px 20px 20px 97px"/>
                    <font color="red">
                    ${requestScope.INVALID.photoError}
                    </font>
                    <br/>
                    <input type="submit" value="Create" name="action" style="margin:20px 20px 30px 170px"/>
                </form>
            </section>
            <%@include file="aside.jsp" %>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
