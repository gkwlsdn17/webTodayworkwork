<%@page import="java.sql.DriverManager"%>
<%@page import="com.hk.todayworkwork.value.CVALUES"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String result = "";
	String sqlClass=CVALUES.sqlClass;
	String sqlUrl=CVALUES.sqlUrl;
	String sqlUser=CVALUES.sqlUser;
	String sqlPass=CVALUES.sqlPass;
 	String id = request.getParameter("id");
	System.out.println("id="+id);
	try{
		Class.forName(sqlClass);
		conn = DriverManager.getConnection(sqlUrl,sqlUser,sqlPass);
		pstmt = conn.prepareStatement("select * from CUSTOMER where id= ?");
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()){
			result += "1";
		}
		else{
			result += "0";
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}
%>