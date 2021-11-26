<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert A New Order</title>
</head>
<body>  


<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.DriverManager" %>  
<%@ page import="java.sql.ResultSet" %>  
<%@ page import="java.sql.Statement" %>   

<h1>Please insert a new order!</h1>

<h4 style="color:black;font-size:18px;">

<form action="http://localhost:8080/RegistrationSystem/OrderInserted.jsp" method="get">
    <table>
      <tr>
        <td>First Name<font color="red">*</font>     
        <td><input type="text" name="FirstName" required></td>
      </tr>
         
      <tr>
           <tr>
        <td>Last Name<font color="red">*</font>    
        <td><input type="text" name="LastName" required></td>
      </tr>
 
              <tr>
        <td>Email<font color="red">*</font>   
        <td><input type="text" name="E-mail" style="width:300px; height:100px" required></td>
      </tr>
 
      </tr>
         <td>Book<font color="red">*</font> 
        <td>
        <select id="BookSelect" name="Title" required>

    
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
		   		"Select * from book;"
		   );
        
        resultSet.beforeFirst();
        
        while (resultSet.next()){
            %>
            <option value="<%= resultSet.getString("bookid") %>">
            <%= "Title: " +resultSet.getString("Title")+" Author: "+resultSet.getString("Author")%>	
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
      
      
    
  
          
  <%		

     
	
%>      
      
      
          </select>
        </td>
      </tr> 
  
  
  
  
          
  <%		

    
		
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