<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Teacher Details</title>
</head>
<body>  

<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.DriverManager" %>  
<%@ page import="java.sql.ResultSet" %>  
<%@ page import="java.sql.Statement" %>   

<h1>Courses of
<%= request.getParameter("firstname") %>
<%= request.getParameter("lastname") %>
</h1>

<%		

Connection c = null;
     
try {
   	
	String url = "jdbc:postgresql://drona.db.elephantsql.com:5432/fpizskff"; 
	String username = "fpizskff";
	String password = "axlW2oYFxGPcjg7FaMFo8ifdpLb-h-hY";
	Class.forName("org.postgresql.Driver");

    c = DriverManager.getConnection(url, username, password);
    c.setAutoCommit(false);
    
    Statement selectStatement = c.createStatement(
    		ResultSet.TYPE_SCROLL_SENSITIVE,
    		ResultSet.CONCUR_READ_ONLY
    	);
    
    // READ DATA
    
    ResultSet resultSet = selectStatement.executeQuery(
		   		"Select * from course WHERE lecturer="+request.getParameter("id")+";"
		   );
        
        resultSet.beforeFirst();
          
        %> <table border=1> 
             <tr>
               <td bgcolor=eeeeee><b>Course Title</b></td>
               <td bgcolor=eeeeee><b>Start Date</b></td>
             </tr> 
        <%
        
        while (resultSet.next()){
            %>
            <tr>
              <td>
                <%= resultSet.getString("courseTitle") %>
              </td>	
              <td>
                <%= resultSet.getString("startDate") %>
              </td>	  
            </tr>
        <% 		
        }
        
        %> </table> 
        
        <br>
        <a href="MainMenu.html"><b>Back to the Main Menu</b></a>
        
        <%
       
        selectStatement.close();
        c.commit();
        c.close();

} catch (Exception e) {
	e.printStackTrace();
    System.err.println(e.getClass().getName() +": " + e.getMessage());
    System.exit(0);
}
		
%>
		
<body>
</html>ml>