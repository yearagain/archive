package com.yearagain.sql;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.mysql.cj.jdbc.result.ResultSetMetaData;



public class SqlHelper {

    /** 
     * 椹卞姩 
     */  
    public static String driver = "com.mysql.cj.jdbc.Driver"; //8.0.15JDBC 
    /** 
     * 杩炴帴瀛楃涓� 
     */  
    public static String url = "jdbc:mysql://localhost:3306/myweb?serverTimezone=UTC&autoReconnect=true";  
    /** 
     * 鐢ㄦ埛鍚� 
     */  
    public static String user = "root";  
    /** 
     * 瀵嗙爜 
     */  
    public static String password = "password";
    private static void close(Object obj)  
    {  
        if (obj == null)  
        {  
            return;  
        }  
        try  
        {  
            if (obj instanceof Statement)  
            {  
                ((Statement) obj).close();  
            } else if (obj instanceof PreparedStatement)  
            {  
                ((PreparedStatement) obj).close();  
            } else if (obj instanceof ResultSet)  
            {  
                ((ResultSet) obj).close();  
            } else if (obj instanceof Connection)  
            {  
                ((Connection) obj).close();  
            }  
        } catch (SQLException ex)  
        {  
            Logger.getLogger(SqlHelper.class.getName()).log(Level.SEVERE, null, ex);  
        }  
    } 
    private static void closeConnection(Object obj)  
    {  
        if (obj == null)  
        {  
            return;  
        }  
        try  
        {  
            if (obj instanceof Statement)  
            {  
                ((Statement) obj).getConnection().close();  
            } else if (obj instanceof PreparedStatement)  
            {  
                ((PreparedStatement) obj).getConnection().close();  
            } else if (obj instanceof ResultSet)  
            {  
                ((ResultSet) obj).getStatement().getConnection().close();  
            } else if (obj instanceof Connection)  
            {  
                ((Connection) obj).close();  
            }  
        } catch (SQLException ex)  
        {  
            Logger.getLogger(SqlHelper.class.getName()).log(Level.SEVERE, null, ex);  
        }  
    }  
    /** 
     * 鑾峰彇涓�涓暟鎹簱杩炴帴 
     * 閫氳繃璁剧疆绫荤殑  driver / url / user / password 杩欏洓涓潤鎬佸彉閲忔潵 璁剧疆鏁版嵁搴撹繛鎺ュ睘鎬� 
     * @return 鏁版嵁搴撹繛鎺� 
     */  
    public static Connection getConnection()  
    {  
        try  
        {  
            // 鑾峰彇椹卞姩,杩欓噷浣跨敤鐨勬槸 sqljdbc_1.2.2828.100_chs.exe,涓嶅悓鐗堟湰鐨勯┍鍔�,璇彞鏈夋墍涓嶅悓  
            Class.forName(driver);  
        } catch (ClassNotFoundException ex)  
        {  
            Logger.getLogger(SqlHelper.class.getName()).log(Level.SEVERE, null, ex);  
        }  
        try  
        {  
            return DriverManager.getConnection(url, user, password);  
        } catch (SQLException ex)  
        {  
            Logger.getLogger(SqlHelper.class.getName()).log(Level.SEVERE, null, ex);  
            return null;  
        }  
    }
    /** 
     * 鑾峰彇涓�涓� Statement 
     * 璇� Statement 宸茬粡璁剧疆鏁版嵁闆� 鍙互婊氬姩,鍙互鏇存柊 
     * @return 濡傛灉鑾峰彇澶辫触灏嗚繑鍥� null,璋冪敤鏃惰寰楁鏌ヨ繑鍥炲�� 
     */  
    public static Statement getStatement()  
    {  
        Connection conn = getConnection();  
        if (conn == null)  
        {  
            return null;  
        }  
        try  
        {  
            return conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,  
                    ResultSet.CONCUR_UPDATABLE);  
        // 璁剧疆鏁版嵁闆嗗彲浠ユ粴鍔�,鍙互鏇存柊  
        } catch (SQLException ex)  
        {  
            Logger.getLogger(SqlHelper.class.getName()).log(Level.SEVERE, null, ex);  
            close(conn);  
        }  
        return null;  
    }  
    /** 
     * 鑾峰彇涓�涓甫鍙傛暟鐨� PreparedStatement 
     * 璇� PreparedStatement 宸茬粡璁剧疆鏁版嵁闆� 鍙互婊氬姩,鍙互鏇存柊 
     * @param cmdText 闇�瑕� ? 鍙傛暟鐨� SQL 璇彞 
     * @param cmdParams SQL 璇彞鐨勫弬鏁拌〃 
     * @return 濡傛灉鑾峰彇澶辫触灏嗚繑鍥� null,璋冪敤鏃惰寰楁鏌ヨ繑鍥炲�� 
     */  
    public static PreparedStatement getPreparedStatement(String cmdText, Object... cmdParams)  
    {  
        Connection conn = getConnection();  
        if (conn == null)  
        {  
            return null;  
        }  
        PreparedStatement pstmt = null;  
        try  
        {  
            pstmt = conn.prepareStatement(cmdText, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);  
            int i = 1;  
            for (Object item : cmdParams)  
            {  
                pstmt.setObject(i, item);  
                i++;  
            }  
        } catch (SQLException e)  
        {  
            e.printStackTrace();  
            close(conn);  
        }  
        return pstmt;  
    }  
    /** 
     * 鎵ц SQL 璇彞,杩斿洖缁撴灉涓烘暣鍨� 
     * 涓昏鐢ㄤ簬鎵ц闈炴煡璇㈣鍙� 
     * @param cmdText 闇�瑕� ? 鍙傛暟鐨� SQL 璇彞 
     * @param cmdParams SQL 璇彞鐨勫弬鏁拌〃 
     * @return 闈炶礋鏁�:姝ｅ父鎵ц; -1:鎵ц閿欒; -2:杩炴帴閿欒 
     */  
    public static int ExecSql(String cmdText, Object... cmdParams)  
    {  
        PreparedStatement pstmt = getPreparedStatement(cmdText, cmdParams);  
        if (pstmt == null)  
        {  
            return -2;  
        }  
        int i;  
        try  
        {  
            i = pstmt.executeUpdate();  
        } catch (SQLException ex)  
        {  
            Logger.getLogger(SqlHelper.class.getName()).log(Level.SEVERE, null,  
                    ex);  
            i = -1;  
        }  
        closeConnection(pstmt);  
        return i;  
    }  
    /** 
     * 杩斿洖涓�涓� ResultSet 
     * @param cmdText SQL 璇彞 
     * @return 
     */  
    public static ResultSet getResultSet(String cmdText)  
    {  
        Statement stmt = getStatement();  
        if (stmt == null)  
        {  
            return null;  
        }  
        try  
        {  
            return stmt.executeQuery(cmdText);  
        } catch (SQLException ex)  
        {  
            Logger.getLogger(SqlHelper.class.getName()).log(Level.SEVERE, null, ex);  
            closeConnection(stmt);  
        }  
        return null;  
    }  
    /** 
     * 杩斿洖涓�涓� ResultSet 
     * @param cmdText 闇�瑕� ? 鍙傛暟鐨� SQL 璇彞 
     * @param cmdParams SQL 璇彞鐨勫弬鏁拌〃 
     * @return 
     */  
    public static ResultSet getResultSet(String cmdText, Object... cmdParams)  
    {  
        PreparedStatement pstmt = getPreparedStatement(cmdText, cmdParams);  
        if (pstmt == null)  
        {  
            return null;  
        }  
        try  
        {  
            return pstmt.executeQuery();  
        } catch (SQLException ex)  
        {  
            Logger.getLogger(SqlHelper.class.getName()).log(Level.SEVERE, null, ex);  
            closeConnection(pstmt);  
        }  
        return null;  
    }  
    
//    public static ArrayList executeQuery(String sql,String[] parameters) {
//    	ArrayList al=new ArrayList();
//    	Connection conn= null;
//    	PreparedStatement ps= null;
//    	ResultSet rs = null;
//    	try {
//    		conn=getConnection();
//			ps=conn.prepareStatement(sql);
//			if(parameters!=null) {
//				for(int i=0;i<parameters.length;i++) {
//					ps.setObject(i+1,parameters[i]);
//				}
//			}
//			rs=ps.executeQuery();
//			java.sql.ResultSetMetaData rsmd=rs.getMetaData();
//			int columnNum=rsmd.getColumnCount();
//			while(rs.next()) {
//				Object []objects=new Object[columnNum];
//				for(int i=0;i<objects.length;i++) {
//					objects[i]=rs.getObject(i+1);
//				}
//				al.add(objects);
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}finally {
//			close(rs);
//			close(ps);
//			close(conn);
//		}
//    	return al;
//    }
    /** 
     * 鎵ц SQL 璇彞,杩斿洖缁撴灉涓烘暣鍨� 
     * 涓昏鐢ㄤ簬鎵ц闈炴煡璇㈣鍙� 
     * @param cmdText SQL 璇彞 
     * @return 闈炶礋鏁�:姝ｅ父鎵ц; -1:鎵ц閿欒; -2:杩炴帴閿欒 
     */  
    public static int ExecSql(String cmdText)  
    {  
        Statement stmt = getStatement();  
        if (stmt == null)  
        {  
            return -2;  
        }  
        int i;  
        try  
        {  
            i = stmt.executeUpdate(cmdText);  
        } catch (SQLException ex)  
        {  
            Logger.getLogger(SqlHelper.class.getName()).log(Level.SEVERE, null,  
                    ex);  
            i = -1;  
        }  
        closeConnection(stmt);  
        return i;  
    }  
    
    
    
    

/*娴嬭瘯绋嬪簭*/
	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
//		String sql="select * from user";
//		Connection conn=null;
//		Statement st=null;
//		ResultSet rs =null;
//		try {
//			Class.forName("com.mysql.cj.jdbc.Driver");
//			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/myweb?serverTimezone=UTC", "root", "qsbglscl");
//			st=conn.createStatement();
//			rs=st.executeQuery(sql);
//			while(rs.next()) {
//				System.out.print(rs.getString("username"));
//				System.out.print(rs.getString("userpwd"));
//				System.out.print(rs.getString("tail"));
//				System.out.println();
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
//		finally {
//			try {
//				rs.close();
//			} catch (Exception e2) {
//				// TODO: handle exception
//			}
//			try {
//				st.close();
//			} catch (Exception e2) {
//				// TODO: handle exception
//			}
//			try {
//				conn.close();
//			} catch (Exception e2) {
//				// TODO: handle exception
//			}
//		}
		String uname="testtest1";
//		ResultSet rs2=SqlHelper.getResultSet("SELECT username FROM user where username='"+uname+"'22.");
		ResultSet rs2=SqlHelper.getResultSet("SELECT username FROM user where username=?",uname);
		while(rs2.next()) {
			
			try {
				System.out.println(rs2.getString("username"));
			}catch(Exception e) {
				e.getLocalizedMessage();
			}
		}
//		
//		Statement st=SqlHelper.getStatement();
//		ResultSet rs =st.executeQuery("SELECT username FROM user where username='testtest3'");
//		
//		while(rs.next()) {
//			System.out.print(rs.getString("username"));
//			System.out.println();
//		}
		//System.out.print("end");
	}

}
