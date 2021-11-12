<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Genre Details</title>
</head>
<body>  

<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.DriverManager" %>  
<%@ page import="java.sql.ResultSet" %>  
<%@ page import="java.sql.Statement" %>   

<h1>Books of
<%= request.getParameter("genrename") %>

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
		   		"Select * from book WHERE genre_genreid="+request.getParameter("genreid")+";"
		   );
        
        resultSet.beforeFirst();
          
        %> <table border=1> 
             <tr>
               <td bgcolor=eeeeee><b>Book Title</b></td>
               <td bgcolor=eeeeee><b>Author</b></td>
               <td bgcolor=eeeeee><b>Pages</b></td>
               <td bgcolor=eeeeee><b>Published Date</b></td>
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