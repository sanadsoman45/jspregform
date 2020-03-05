<%-- 
    Document   : newjsp
    Created on : 24 Feb, 2020, 8:52:30 PM
    Author     : Sanad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>crud operations</title>
    </head>
    <body>
        <form action="newjsp.jsp" method="post">
            <center>
            <table>
            <tr>
                <td colspan="6">
                    <center><h1>Details</h1></center>
                </td>
            </tr>
            <tr>
                <td>
                    Enter the First Name:
                </td>
                <td colspan="6">
                <input type="text" name="f_name"/>
                </td> 
            </tr>
            <tr>
                <td>
                    
                </td>
            </tr>
            <tr>
                <td>
                    Enter the last name:
                </td>
                <td colspan="6">
                    <input type="text" name="l_name"/>
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
            </tr>
            <tr>
                <td>
                    Enter the city:
                </td>
                <td colspan="6">
                    <input type="text" name="city"/>
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
            </tr>
            <tr>
                <td>
                    Enter the Email:
                </td>
                <td colspan="6">
                    <input type="text" name="email"/>
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
            </tr>
            <tr>
                <td>
                    <button name="inser">Insert</button>
                </td>
                <td>
                    <button name="updat">Update</button>
                </td>
                <td>
                    <button name="del">Delete</button>
                </td>
                <td>
                    <button name="ret">Retrieve</button>
                </td>
            </tr>
    </table>
            </center>
            <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sycs","root","");
                    try
                    {
                       String fname=request.getParameter("f_name");
                            String lname=request.getParameter("l_name");
                            String city=request.getParameter("city");
                            String email=request.getParameter("email");
                        if(request.getParameter("inser") !=null)
                        {
                            
                            if(!fname.equals(""))
                            {
                                if(!lname.equals(""))
                                {
                                    if(!city.equals(""))
                                    {
                                        if(!email.equals(""))
                                        {
                                        String query="insert into student values('"+fname+"','"+lname+"','"+city+"','"+email+"')";
                            Statement st=con.createStatement();
                            st.executeUpdate(query);
                            out.println("me aa gaya insert me");
                                        }
                                        }
                            }
                            
                            
                            }
                        }
                        if(request.getParameter("updat")!=null)
                        {
                            if(!fname.equals(""))
                            {
                            out.println("Inside Update");
                            String query="Update student set f_name=? where city=? ";
                            PreparedStatement  ps=con.prepareStatement(query);
                            ps.setString(1, request.getParameter("f_name"));
                            ps.setString(2, request.getParameter("city"));
                            ps.executeUpdate();
                            }
                            else
                            {
                                out.println("first name cannot be empty it should contain value");
                            }
                        }
                        if(request.getParameter("del")!=null)
                        {
                            if(!fname.equals(""))
                            {
                            out.println("inside Delete");
                            String query="delete from student where f_name=?";
                            PreparedStatement ps=con.prepareStatement(query);
                            ps.setString(1, request.getParameter("f_name"));
                            ps.executeUpdate();
                            }
                            else
                            {
                                out.print("Enter the first name of the record to be deleted");
                            }
                        }
                        if(request.getParameter("ret")!=null)
                        {
                            out.println("me aa gaya Select me");
                            String query="Select * from student";
                            PreparedStatement ps=con.prepareStatement(query);
                            ResultSet rs =ps.executeQuery();
                            while(rs.next())
                            {
                                String fname1=rs.getString("f_name");
                                String lname1=rs.getString("last_name");
                                String city1=rs.getString("city");
                                String email1=rs.getString("email");
                                out.println("First Name of the candidate is:"+fname1+"<br>");
                                out.println("Last name of the candidate is:"+lname1+"<br>");
                                out.println("City is:"+city1+"<br>");
                                out.println("email is:"+email1+"<br>");
                            }
                            rs.close();
                        }
                    }
                    catch(Exception e)
                    {
                        out.println();
                    }
                    finally
                    {
                        con.close();
                    }
                %>
        </form>
        </body>
</html>
