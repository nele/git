<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Languages</title>
</head>
<body>  

<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.DriverManager" %>  
<%@ page import="java.sql.ResultSet" %>  
<%@ page import="java.sql.Statement" %>   

<h1>List of Genres</h1>

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
		   		"Select * from language;"
		   );
        
        resultSet.beforeFirst();
          
        %> <ul> <%
        
        String URLparameters;
        while (resultSet.next()){
            URLparameters =  "langid="+resultSet.getString("langid");
            URLparameters += "&language="+resultSet.getString("language");
            %>
            <li>
            <a href="LanguageDetails.jsp?<%= URLparameters %>">
            <%= resultSet.getString("language") %>	
            </a>
        <% 		
        }
        
        %> </ul> <%
       
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