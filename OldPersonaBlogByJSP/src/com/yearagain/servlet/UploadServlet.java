package com.yearagain.servlet;



import com.jspsmart.upload.*;
import com.yearagain.sql.SqlHelper;

import org.apache.log4j.Logger;
 
 
import javax.servlet.ServletConfig;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
 
@WebServlet("/upload.do")
public class UploadServlet extends HttpServlet {
    ServletConfig servletConfig;
 
//  private static Logger logger = Logger.getLogger(UploadServlet.class);
 
    @Override
    public void init(ServletConfig config) throws ServletException {
        this.servletConfig=config;
    }
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw=response.getWriter();
		request.setCharacterEncoding("UTF-8"); 
    	SmartUpload su=new SmartUpload();//1：创建一个SmartUpload对象
         su.initialize(servletConfig,request,response);//2：初始化SmartUpload对象
 
         su.setAllowedFilesList("png,jpg,jpeg");//3:设置文件上传的限制
         su.setMaxFileSize(3*1024*1024);    //4：设置单个文件最大字节数
         HttpSession session = request.getSession(true);
         try{
             su.upload();//5:使用upload上传
         }catch (SmartUploadException e){
             e.printStackTrace();
         }
 
         //6:获取时间，作为文件名
         Date curDate=new Date();
         long d=curDate.getTime();
 
 
 
         //7:获取全部上传文件
         Files files=su.getFiles();
         //8:获取指定位置的文件文件
         File file=files.getFile(0);
 
         //9;获取文件的后缀名
         String extFile=file.getFileExt();
         //10:获取时间，作为文件名
         String mainFile=String.valueOf(d);
         
         
//      绝对路径
//      String uploadPath =servletConfig.getServletContext().getRealPath("/");
//      服务器的根目录下 /Users/mingkunyu/tool/apache-tomcat-8.5.32/wtpwebapps/Yuu/
         
//      使用相对路径
        String saveUrl="upload/";//此目录需要新建
        String filePath=saveUrl+mainFile+"."+extFile;
//      服务器的upload目录下  /Users/mingkunyu/tool/apache-tomcat-8.5.32/wtpwebapps/Yuu/upload/1540285990824.jpg 
 
        
//      eclipse重新部署之后，项目状态就会被清空(你的上传图片文件夹就会被删除)，但是如果不是重新部署，只是重启服务器的话，你的图片目录还会在。
        String uploadPath =servletConfig.getServletContext().getRealPath("/")+saveUrl;
//      /Users/mingkunyu/tool/apache-tomcat-8.5.32/wtpwebapps/Yuu/upload/
        //String uploadPath ="C:\\apache-tomcat-8.5.38\\webapps\\"+saveUrl;
        java.io.File f=new java.io.File(uploadPath);
        if (!f.exists()) {//没有此目录就新建一个目录
        	f.mkdirs();
        }
 
 
 
        try{
            file.saveAs(filePath); //文件另存到tomcat部署的项目文件夹中，不是当前项目物理位置
        }catch (SmartUploadException e){
            System.out.printf(filePath+"---------------------------------------");
            e.printStackTrace();
 
        }
        //最后处理
        
        session.setAttribute("txsrc",saveUrl+mainFile+"."+extFile);
        
		String sql="UPDATE user SET tx=? WHERE username=?";
        if(SqlHelper.ExecSql(sql,saveUrl+mainFile+"."+extFile,session.getAttribute("username"))>=0) {
        	pw.write("<script language='javascript'>alert('上传成功！')</script>");
		}else {
			pw.write("<script language='javascript'>alert('链接数据库失败！')</script>");
		}
        pw.write("<script language='javascript'>window.location='"+request.getContextPath()+"/userweb/userdata.jsp?sx=sx'</script>");
        
        //pw.write("<script language='javascript'> </script>");
       //request.getRequestDispatcher("/show.jsp").forward(request,response);
       //System.out.println(saveUrl+mainFile+"."+extFile);
    }
 
 
 
}
