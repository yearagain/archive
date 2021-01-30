package com.yearagain.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yearagain.sql.SqlHelper;

public class UpTailServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
		// TODO Auto-generated method stub
		arg1.setContentType("text/html;charset=UTF-8");
		PrintWriter pw=arg1.getWriter();
		arg0.setCharacterEncoding("UTF-8");
		HttpSession session = arg0.getSession(true);
		String tailVa=arg0.getParameter("tailva");
//最后处理
        
        System.out.println(tailVa);
        
		String sql="UPDATE user SET tail=? WHERE username=?";
        if(SqlHelper.ExecSql(sql,tailVa,session.getAttribute("username"))>=0) {
        	pw.write("<script language='javascript'>alert('修改成功！')</script>");
		}else {
			pw.write("<script language='javascript'>alert('小尾巴长度小于等于十！')</script>");
		}
        session.setAttribute("tail",tailVa);
        pw.write("<script language='javascript'>window.location='"+arg0.getContextPath()+"/userweb/userdata.jsp?sx=sx'</script>");
        
	}
	
}
