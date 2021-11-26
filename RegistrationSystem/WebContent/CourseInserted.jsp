<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Inserted</title>
</head>
<body>  

<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.DriverManager" %>  
<%@ page import="java.sql.ResultSet" %>  
<%@ page import="java.sql.Statement" %>   

<h1>Book Inserted</h1>

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
    
    // WRITE DATA
    
        selectStatement.executeUpdate(
		   "INSERT INTO book (title,author,summary, pages,publisher, dateofpublication,additionalinfo, genre_genreid, language_langid, condition_conditionid) VALUES('"
          + request.getParameter("Title")
		  +"','"  
          + request.getParameter("Author") 
          +  "','" 
          + request.getParameter("Summary") 
          +  "','" 
          + request.getParameter("Pages") 
           +  "','" 
       	+ request.getParameter("Publisher") 
           +  "','" 
          + request.getParameter("startDate") 
          + "','"
          + request.getParameter("Additionalinfo") 
          +  "'," 
          + request.getParameter("Genre") 
          +  "," 
          + request.getParameter("Language") 
          +  "," 
          + request.getParameter("Condition") 
          +  ")" 
		);
        
        selectStatement.close();
        c.commit();
        c.close();

} catch (Exception e) {
	e.printStackTrace();
    System.err.println(e.getClass().getName() +": " + e.getMessage());
    System.exit(0);
}
		
%>
        <br>
        <a href="index.html"><b>Back to the Main Menu</b></a>
		
<body>
</html>