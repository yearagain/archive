package com.yearagain.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yearagain.sql.SqlHelper;

public class LoginServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter pw=resp.getWriter();
		req.setCharacterEncoding("UTF-8");
		String userName=req.getParameter("uname");
		String password=req.getParameter("upwd");
		String uname=null;
		String upwd=null;
		String tail=null;
		String tx=null;
		ResultSet rs=SqlHelper.getResultSet("SELECT * FROM user where username=?",userName);
		try {
			if(!rs.first()) {
				pw.write("<script language='javascript'>alert('用户名不存在');window.location='"+req.getContextPath()+"/userweb/login.jsp'</script>");
				//arg1.sendRedirect(arg0.getContextPath()+"/userweb/register.jsp");
				return;
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			rs.previous();
			while(rs.next()) {
				uname=rs.getString("username");
				upwd=rs.getString("userpwd");
				tail=rs.getString("tail");
				tx=rs.getString("tx");
			}
			
		}catch(Exception err) {
			err.printStackTrace();
		}
		//System.out.println(uname+upwd+tail+tx);
		if(uname.equals(userName)&&upwd.equals(password)) {
			HttpSession session = req.getSession(true); 
			session.setAttribute("username", userName); 
			session.setAttribute("txsrc", tx);
			session.setAttribute("tail", tail);
			pw.write("<script language='javascript'>alert('登陆成功');window.location='"+req.getContextPath()+"/userweb/userdata.jsp?sx=sx'</script>");
		}else {
			pw.write("<script language='javascript'>alert('用户名或密码错误！');window.location='"+req.getContextPath()+"/userweb/login.jsp'</script>");
		}
		
	}

}
