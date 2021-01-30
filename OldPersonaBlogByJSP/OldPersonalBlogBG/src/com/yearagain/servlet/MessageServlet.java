package com.yearagain.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yearagain.sql.SqlHelper;

public class MessageServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
		// TODO Auto-generated method stub
		arg1.setContentType("text/html;charset=UTF-8");
		PrintWriter pw=arg1.getWriter();
		arg0.setCharacterEncoding("UTF-8");
		String id=arg0.getParameter("id");
		String sql="UPDATE message SET mesagesh=1 WHERE messageid=?";
        if(SqlHelper.ExecSql(sql,Integer.parseInt(id))>=0) {
        	pw.write("<script language='javascript'>alert('审核通过！')</script>");
		}else {
			pw.write("<script language='javascript'>alert('未知错误！')</script>");
		}
        pw.write("<script language='javascript'>window.location='"+arg0.getContextPath()+"/manager.jsp'</script>");
	}

}
