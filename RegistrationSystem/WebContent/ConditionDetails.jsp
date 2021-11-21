<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8"">
<title>Condition Details</title>
</head>
<body>  

<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.DriverManager" %>  
<%@ page import="java.sql.ResultSet" %>  
<%@ page import="java.sql.Statement" %>   

<h1>Book condition: 
<%= request.getParameter("conditionname") %>

</h1>

<%		

Connection c = null;
     
try {
   	
	String url = "jdbc:postgresql://hattie.db.elephantsql.com:5432/ppbsypit"; 
	String username = "ppbsypit";
	String password = "brZCPgnLHUBfvKeUobtp9kfv9J-q6HOY";
	Class.forName("org.postgresql.Driver");

    c = DriverManager.getConnection(url, username, password);
    c.setAutoCommit(false);
    
    Statement selectStatement = c.createStatement(
    		ResultSet.TYPE_SCROLL_SENSITIVE,
    		ResultSet.CONCUR_READ_ONLY
    	);
    
    // READ DATA
    
    ResultSet resultSet = selectStatement.executeQuery(
		   		"Select * from book WHERE condition_conditionid="+request.getParameter("conditionid")+";"
		   );
        
        resultSet.beforeFirst();
          
        %> <table border=1> 
             <tr>
               <td bgcolor=eeeeee><b>Book Title</b></td>
               <td bgcolor=eeeeee><b>Author</b></td>
               <td bgcolor=eeeeee><b>Pages</b></td>
               <td bgcolor=eeeeee><b>Published date</b></td>
               <td bgcolor=eeeeee><b>Summary</b></td>
             </tr> 
        <%
        
        while (resultSet.next()){
            %>
            <tr>
              <td>
                <%= resultSet.getString("Title") %>
              </td>	
              <td>
                <%= resultSet.getString("Author") %>
              </td>	
              <td>
                <%= resultSet.getString("Pages") %>
              </td>	
              <td>
                <%= resultSet.getString("dateofpublication") %>
              </td>	
              <td>
                <%= resultSet.getString("Summary") %>
              </td>	
              
            </tr>
        <% 		
        }
        
        %> </table> 
        
        <br>
        <a href="NewFile.html"><b>Back to the Main Menu</b></a>
        
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
</html>