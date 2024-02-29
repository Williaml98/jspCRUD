<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        text-align: center;
    }
    h1 {
        color: #333;
    }
    table {
        width: 50%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    td {
        padding: 10px;
    }
    input[type="text"],
    input[type="password"],
    input[type="email"],
    select {
        width: calc(100% - 20px);
        padding: 8px;
        margin: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    input[type="radio"] {
        margin-right: 5px;
    }
    input[type="submit"] {
        background-color: #4caf50;
        color: white;
        padding: 10px 20px;
        text-decoration: none;
        display: inline-block;
        border-radius: 5px;
        border: none;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>

<%@page import="com.javatpoint.dao.UserDao,com.javatpoint.bean.User"%>

<%
String id=request.getParameter("id");
User u=UserDao.getRecordById(Integer.parseInt(id));
%>

<h1>Edit Form</h1>
<form action="edituser.jsp" method="post">
<input type="hidden" name="id" value="<%=u.getId() %>"/>
<table>
<tr><td>Name:</td><td><input type="text" name="name" value="<%= u.getName()%>"/></td></tr>
<tr><td>Password:</td><td><input type="password" name="password" value="<%= u.getPassword()%>"/></td></tr>
<tr><td>Email:</td><td><input type="email" name="email" value="<%= u.getEmail()%>"/></td></tr>
<tr><td>Sex:</td><td><input type="radio" name="sex" value="male" <%= u.getSex().equals("male") ? "checked" : "" %>/>Male <input type="radio" name="sex" value="female" <%= u.getSex().equals("female") ? "checked" : "" %>/>Female </td></tr>
<tr><td>Country:</td><td>
<select name="country">
    <option <%= u.getCountry().equals("DRC") ? "selected" : "" %>>DRC</option>
    <option <%= u.getCountry().equals("Togo") ? "selected" : "" %>>Togo</option>
    <option <%= u.getCountry().equals("Rwanda") ? "selected" : "" %>>Rwanda</option>
    <option <%= u.getCountry().equals("Kenya") ? "selected" : "" %>>Kenya</option>
    <option <%= u.getCountry().equals("Other") ? "selected" : "" %>>Other</option>
</select>
</td></tr>
<tr><td colspan="2"><input type="submit" value="Edit User"/></td></tr>
</table>
</form>

</body>
</html>
