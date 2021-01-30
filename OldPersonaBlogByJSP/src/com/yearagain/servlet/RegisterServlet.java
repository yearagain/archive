package com.yearagain.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

import com.yearagain.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegisterServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//arg1.setCharacterEncoding("UTF-8");  
		arg1.setContentType("text/html;charset=UTF-8");
		PrintWriter pw=arg1.getWriter();
		arg0.setCharacterEncoding("UTF-8");
		String userName=arg0.getParameter("uname");
		String password=arg0.getParameter("upwd");
		String sql="INSERT INTO user (username,userpwd) VALUES (?,?)";
		
		ResultSet rs=SqlHelper.getResultSet("SELECT username FROM user where username=?",userName);
		
		try {
			if(rs.first()) {
				pw.write("<script language='javascript'>alert('用户名已存在');window.location='"+arg0.getContextPath()+"/userweb/register.jsp'</script>");
				//arg1.sendRedirect(arg0.getContextPath()+"/userweb/register.jsp");
				return;
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		//System.out.println(SqlHelper.ExecSql(sql, userName,password));
		try {
			if(SqlHelper.ExecSql(sql, userName,password)>=0) {
				pw.write("<script language='javascript'>alert('注册成功！')</script>");
				HttpSession session = arg0.getSession(true); 
				session.setAttribute("username", userName); 
				session.setAttribute("txsrc", "upload/def.jpg");
				session.setAttribute("tail", "可自定义小尾巴");
//				try {
//					while(rs.next()) {
//						
//						try {
//							System.out.println(rs.getString("username"));
//						}catch(Exception e) {
//							e.getLocalizedMessage();
//						}
//					}
//				} catch (SQLException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
				pw.write("<script language='javascript'>window.location='"+arg0.getContextPath()+"/userweb/userdata.jsp'</script>");
				//arg1.sendRedirect(arg0.getContextPath()+"/userweb/userdata.jsp");
			}else {
				
				pw.write("<script language='javascript'>alert('注册失败！')</script>");
				arg1.sendRedirect(arg0.getContextPath()+"/userweb/login.jsp");
				
			}
			
		}catch(Exception err) {
			err.printStackTrace();
		}
		
		
		
		//System.out.println(userName);
		//System.out.println(password);
	}
	
}
