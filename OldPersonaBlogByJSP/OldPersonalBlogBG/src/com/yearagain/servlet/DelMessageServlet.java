package com.yearagain.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yearagain.sql.SqlHelper;

public class DelMessageServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter pw=resp.getWriter();
		req.setCharacterEncoding("UTF-8");
		String id=req.getParameter("id");
		String sql="DELETE FROM message WHERE messageid=?";
        if(SqlHelper.ExecSql(sql,Integer.parseInt(id))>=0) {
        	pw.write("<script language='javascript'>alert('删除成功！')</script>");
		}else {
			pw.write("<script language='javascript'>alert('未知错误！')</script>");
		}
        pw.write("<script language='javascript'>window.location='"+req.getContextPath()+"/manager.jsp?sx=sx'</script>");
	}

}
