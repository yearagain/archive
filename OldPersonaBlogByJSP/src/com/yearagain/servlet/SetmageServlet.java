package com.yearagain.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yearagain.sql.SqlHelper;

public class SetmageServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
		// TODO Auto-generated method stub
		arg1.setContentType("text/html;charset=UTF-8");
		PrintWriter pw=arg1.getWriter();
		arg0.setCharacterEncoding("UTF-8");
		HttpSession session = arg0.getSession(true);
		String value=arg0.getParameter("vlaue");
		
		String userName=null;
		
		Object obj=session.getAttribute("username");
		//pw.write("<script language='javascript'>alert('啦啦啦啦')</script>");
		if(obj==null){
			userName="guest";
			//pw.write("<script language='javascript'>alert('啦啦啦啦')</script>");
		}else {
			userName=session.getAttribute("username").toString();
		}
		String sql="INSERT INTO message (mesage,username) VALUES (?,?)";
		//System.out.println(value);
		//pw.write("<script language='javascript'>alert('"+userName+"')</script>");
		try {
			if(SqlHelper.ExecSql(sql,value,userName)>=0) {
				pw.write("<script language='javascript'>alert('审核后你的留言才会正式发布！')</script>");
				pw.write("<script language='javascript'>window.location='"+arg0.getContextPath()+"/lyq.jsp'</script>");
			}else {
				
				pw.write("<script language='javascript'>alert('留言失败！未知错误')</script>");
				pw.write("<script language='javascript'>window.location='"+arg0.getContextPath()+"/userweb/lyq.jsp'</script>");
			}
			
		}catch(Exception err) {
			err.printStackTrace();
		}
		
		
	}

}
