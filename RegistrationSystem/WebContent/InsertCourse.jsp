<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#datepicker").datepicker();
            });
        </script>
<title>Insert A Book</title>
</head>
<body>  


<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.DriverManager" %>  
<%@ page import="java.sql.ResultSet" %>  
<%@ page import="java.sql.Statement" %>   

<h1>Please Insert a Book!</h1>


<form action="http://localhost:8080/RegistrationSystem/CourseInserted.jsp" method="get">
    <table>
      <tr>
        <td>Book title      
        <td><input type="text" name="Title"></td>
      </tr>
         
      <tr>
           <tr>
        <td>Author 
        <td><input type="text" name="Author"></td>
      </tr>
            <tr>
                <td>Published date</td>
                <td><input type="text" name="startDate" id="datepicker"></td>
       </tr>  
              <tr>
        <td>Summary 
        <td><input type="text" name="Summary" style="width:300px; height:100px;></td>
      </tr>
                       <tr>
        <td>Pages
        <td><input type="number" name="Pages"></td>
      </tr>
                       <tr>
        <td>Additionalinfo 
        <td><input type="text" name="Additionalinfo"></td>
      </tr>
                       <tr>
        <td>Publisher 
        <td><input type="text" name="Publisher"></td>
      </tr>
         <td>Language
        <td>
        <select id="LanguageSelect" name="Language">

        
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
        
        while (resultSet.next()){
            %>
            <option value="<%= resultSet.getString("langid") %>">
            <%= resultSet.getString("Language") %>	
            </option>
        <% 		
        }
        
        selectStatement.close();
        c.commit();
        c.close();

} catch (Exception e) {
	e.printStackTrace();
    System.err.println(e.getClass().getName() +": " + e.getMessage());
    System.exit(0);
}
		
%>            
          </select>
        </td>
      </tr> 
      
      
      
  
  
  
  
  
  
       </tr>
         <td>Condition
        <td>
        <select id="ConditionSelect" name="Condition">

        
  <%		

     
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
		   		"Select * from condition;"
		   );
        
        resultSet.beforeFirst();
        
        while (resultSet.next()){
            %>
            <option value="<%= resultSet.getString("conditionid") %>">
            <%= resultSet.getString("conditionname") %>	
            </option>
        <% 		
        }
        
        selectStatement.close();
        c.commit();
        c.close();

} catch (Exception e) {
	e.printStackTrace();
    System.err.println(e.getClass().getName() +": " + e.getMessage());
    System.exit(0);
}
		
%>            
          </select>
        </td>
      </tr> 
  
  
  
  
  
  
  
  
        </tr>
         <td>Genre
        <td>
        <select id="GenreSelect" name="Genre">

        
  <%		

     
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
		   		"Select * from genre;"
		   );
        
        resultSet.beforeFirst();
        
        while (resultSet.next()){
            %>
            <option value="<%= resultSet.getString("genreid") %>">
            <%= resultSet.getString("genrename") %>	
            </option>
        <% 		
        }
        
        selectStatement.close();
        c.commit();
        c.close();

} catch (Exception e) {
	e.printStackTrace();
    System.err.println(e.getClass().getName() +": " + e.getMessage());
    System.exit(0);
}
		
%>            
          </select>
        </td>
      </tr> 
  
  
  
  
  
  
  
  
  
  
  
      
      
      
      
    </table>
   <br>
   <input type="submit" value="Submit">
  </form> 
		
<body>
</html>