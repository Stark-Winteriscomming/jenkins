<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>



<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
	<%
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "changho";
    String pass = "ckdgh031";

	//JNDI를 이용하기 위한 객체 생성

	Context initCtx = new InitialContext();
 	Context envCtx = (Context)initCtx.lookup("java:/comp/env");
 	DataSource ds = (DataSource)envCtx.lookup("jdbc/TestDB");
 	Connection conn;
 	conn = ds.getConnection();
    Statement  stmt;
    PreparedStatement pstmt;
    ResultSet rs;
     
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(url, user, pass);
    stmt = conn.createStatement();
    pstmt=conn.prepareStatement("select * from users");
    rs=pstmt.executeQuery();
    while(rs.next()){
    	out.print(rs.getString("id")); 
    }
    stmt.close();  
    conn.close();
	%>
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
