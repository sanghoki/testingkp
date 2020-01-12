<%-- 
    Document   : index
    Created on : Dec 17, 2019, 3:06:41 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    if (request.getParameter("submit") != null) {
        String name1 = request.getParameter("name1");
        String course = request.getParameter("course2");
        String fee = request.getParameter("fee3");

        Connection conn;
        PreparedStatement pst;
        ResultSet rs;

        Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/dx4MOMIJOa", "dx4MOMIJOa", "3RfNgsCAlZ");

        pst = conn.prepareStatement("insert into kp(dbname,course,fee) values (?,?,?)");
        pst.setString(1, name1);
        pst.setString(2, course);
        pst.setString(3, fee);
        pst.executeUpdate();
%>
<script>
    alert("Data Di Input");
</script>

<%
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even){background-color: #f2f2f2}

            th {
                background-color: #4CAF50;
                color: white;
            }
        </style>
    </head>
    <body>
        <h1>Student Information
        </h1>
        <br>
        <div class="row">
            <div class="col-sm-4">
                <form class="card" method="POST">
                    <div alight="left">   
                        <label class="form-label"> STUDENT NAME </label>
                        <input type="text" class="form-control" placeholder="Student Name" name="name1" id="name" required>
                    </div>

                    <div alight="left">   
                        <label class="form-label"> Course </label>
                        <input type="text" class="form-control" placeholder="Course" name="course2" id="course" required>
                    </div>

                    <div alight="left">   
                        <label class="form-label"> Fee </label>
                        <input type="text" class="form-control" placeholder="Fee" name="fee3" id="fee" required>
                    </div>

                    <br>
                    <div alight="right">   
                        <input type="submit"  name="submit" id="submit" class="btn btn-info">
                        <input type="reset"  name="reset" id="reset" class="btn btn-info">
                    </div>
                </form> 
            </div>
            <div class="col-sm-8">
                <div class="panel-body">
                    <table id="tblStudent" class=" table-bordered" cellpadding ="20" width=50%>
                        <thead>
                            <tr>
                                <th>Student Name</th>
                                <th>Course</th>
                                <th>Fee</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>

                            <%
                                Connection conn;
                                PreparedStatement pst;
                                ResultSet rs;

                                Class.forName("com.mysql.jdbc.Driver");
                                 conn = DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/dx4MOMIJOa", "dx4MOMIJOa", "3RfNgsCAlZ");

                                String query = "Select * from kp";
                                Statement st = conn.createStatement();

                                rs = st.executeQuery(query);

                                while (rs.next()) {
                                    String id = rs.getString("id");


                            %>

                            <tr>
                                <td><%=rs.getString("dbname")%></td>
                                <td><%=rs.getString("course")%></td>
                                <td><%=rs.getString("fee")%></td>
                                <td><a href="update.jsp?id=<%=id%>">EDIT</a></td>
                                <td><a href="delete.jsp?id=<%=id%>">DELETE</a></td>
                            </tr>

                            <%

                                }
                            %>
                    </table>

                </div>
            </div>

    </body>
</html>
