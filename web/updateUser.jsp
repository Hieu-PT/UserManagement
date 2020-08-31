<%-- 
    Document   : updateUser
    Created on : Aug 19, 2020, 11:31:03 PM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update User's Profile Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%@include file="menuAdmin.jsp" %>
        <div class="main">
            <section class="col-main" style="min-height: 625px">
                <h2 style=" font-size: 30px; margin: 40px;">Update User's Profile</h2>
                <font color="green">
                    ${requestScope.MESSAGE}
                </font>
                <form action="UpdateUserController" method="POST" enctype="multipart/form-data">
                    Role: <select name="role" id="role" style="margin: 20px 20px 20px 108px">
                        <c:forEach items="${sessionScope.LIST_ROLES}" var="dto">
                            <option value="${dto.toString()}" <c:if test="${requestScope.Role == dto.toString()}">selected=""</c:if>>${dto.toString()}</option>
                        </c:forEach>
                    </select>
                    <br/>
                    Username: <input type="text" name="txtUsername" readonly="" style="margin: 20px 20px 20px 70px;" value="${requestScope.DTO.username}"/>
                    <font color="red">
                    ${requestScope.INVALID.usernameError}
                    </font>
                    <br/>
                    Password: <input type="password" name="txtPassword" style="margin: 20px 20px 20px 73px;"/>
                    <font color="red">
                    ${requestScope.INVALID.passwordError}
                    </font>
                    <br/>
                    Confirm Password: <input type="password" name="txtConfirm" style="margin: 20px 20px 20px 20px;"/>
                    <font color="red">
                    ${requestScope.INVALID.confirmError}
                    </font>
                    <br/>
                    Fullname:<input type="text" name="txtName" style="margin: 10px 20px 10px 80px" value="${requestScope.DTO.name}"/>
                    <font color="red">
                    ${requestScope.INVALID.nameError}
                    </font>
                    <br/>
                    Email:<input type="text" name="txtEmail" style="margin: 10px 20px 10px 101px" value="${requestScope.DTO.email}"/>
                    <font color="red">
                    ${requestScope.INVALID.emailError}
                    </font>
                    <br/>
                    Phone:<input type="text" name="txtPhone" style="margin: 10px 20px 10px 96px" value="${requestScope.DTO.phone}"/>
                    <font color="red">
                    ${requestScope.INVALID.phoneError}
                    </font>
                    <br/>
                    Photo: <input type="file" name="image" size="60" style="margin: 20px 20px 20px 97px"/>
                    <font color="red">
                    ${requestScope.INVALID.photoError}
                    </font>
                    <br/>
                    <img src="${requestScope.DTO.photo}" style="width: 160px; height: 160px; margin: 8px 20px 8px 142px"/><br/>
                    <input type="submit" value="Update" name="action" style="margin:20px 20px 30px 170px"/>
                    <input type="hidden" name="txtPhoto" value="${requestScope.DTO.photo}"/>
                </form>
            </section>
            <%@include file="aside.jsp" %>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
