package com.kh.recipe.member.model.dao;

import static com.kh.recipe.common.JDBCTemplate.*;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.kh.recipe.member.model.vo.Member;

public class MemberDAO {

	private Properties prop = new Properties();
	public MemberDAO() {
      try {
         prop.load(new FileReader(
                  MemberDAO.class
                  .getResource("/mappers/member.properties")
                  .getPath()));
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   public Member selectOneMember(Connection con, Member m) {
      // 결과값 준비
	  Member result = null;
	  // DAO 실행준비
      PreparedStatement pstmt = null;
      // 결과값 담는 바구니 준비
      ResultSet rset = null;
      System.out.println(m);
      
      // 실행
      try {
         
         String sql  = prop.getProperty("selectMember");
         
         pstmt = con.prepareStatement(sql);
         
         pstmt.setString(1, m.getUserid());
         pstmt.setString(2, m.getUpwd());
         
         // DML(SELECT/INSERT/UPDATE/DELETE) => (DQL질의어(SELECT) + DML데이터조작어(INSERT/UPDATE/DELETE))
         // Query => 바구니로 담음
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
        	 result = new Member();
            
            // --- 원래 알고 있던 정보
            result.setUserid(m.getUserid());
            result.setUpwd(m.getUpwd());
            // --- DB로부터 가져온 정보
            result.setUno(rset.getInt(2));
            result.setUtype(rset.getString(3));
            result.setUnick(rset.getString(6));
            result.setUadrs(rset.getString(7));
            result.setUphone(rset.getString(8));
            result.setUdate(rset.getDate(9));
            result.setMstatus(rset.getString(10));
            result.setMrname(rset.getString(11));
            
         
         }
         
      } catch(SQLException e) {
         
         e.printStackTrace();
         
      } finally {
         close(rset);
         close(pstmt);
      }
      
      System.out.println(result);
      return result;
   }


   
   public int insertMember(Connection con, Member m) {
		// 준비는 끝났다...
	   int result = 0;
		PreparedStatement pstmt = null; 
		Statement stmt = null;
		String sql = prop.getProperty("insertMemberJoin");
		System.out.println(sql);
		
		// 실행
		try {
			
			// 일거리 줌
			pstmt = con.prepareStatement(sql);
			
			// 일거리 준비 : 쿼리 완성하기
			// INSERT INTO ulist VALUES(UNO, UTYPE, 			USERID, UPWD, UNICK, UADRS, UPHONE, UDATE);
			// INSERT INTO ulist VALUES(SEQ_UNO.nextval, DEFAULT, ?, 	?, 		?, 		?, 		?, DEFAULT);
			pstmt.setString(1, m.getUserid());
			pstmt.setString(2, m.getUpwd());
			pstmt.setString(3, m.getUnick());
			pstmt.setString(4, m.getUadrs());
			pstmt.setString(5, m.getUphone());
			
			// 일해라!
			// DML(SELECT/INSERT/UPDATE/DELETE) => (DQL질의어(SELECT) + DML데이터조작어(INSERT/UPDATE/DELETE))
	        // Update(); => 숫자로 받음
			result	= pstmt.executeUpdate();
			
			stmt = con.createStatement();
			result += stmt.executeUpdate("INSERT INTO MEMBER VALUES(SEQ_UNO.CURRVAL, 1, DEFAULT)");
			
		} catch (SQLException e) {
			System.out.println("DAO에러!");
			e.printStackTrace();
		} finally {
			// 닫아줌
			close(stmt);
			close(pstmt);
			close(stmt);
		} 
		
		
		return result;
	}

public int updateMember(Connection con, Member m) {
	int result = 0;
	PreparedStatement pstmt = null;
	
	
	try {
		
		String sql = prop.getProperty("updateMember");
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, m.getUpwd());
		pstmt.setString(2, m.getUnick());
		pstmt.setString(3, m.getUphone());
		pstmt.setString(4, m.getUadrs());
		pstmt.setString(5, m.getUserid());
		
		result = pstmt.executeUpdate();
		
	} catch (SQLException e) {
		
		e.printStackTrace();
		
	} finally {
		
		close(pstmt);
	}
	
	
	
	return result;
}


//마이페이지에 들어갈 회원 정보 조회
public Member myPageMember(Connection con, int uno) {
	  Member m = null;
 PreparedStatement pstmt = null;
 ResultSet rset = null;
 // 실행
 try {
    
    String sql  = prop.getProperty("myPageMember");
    
    pstmt = con.prepareStatement(sql);
    
    pstmt.setInt(1, uno);

    rset = pstmt.executeQuery();
    
    if(rset.next()) {
   	 m = new Member();
   	 
   	 
   	 System.out.println(m);
   	 m.setMrank(rset.getInt("MRANK"));
   	 m.setUno(rset.getInt("UNO"));
   	 m.setUtype(rset.getString("UTYPE"));
       m.setUserid(rset.getString("USERID"));
       m.setUpwd(rset.getString("UPWD"));
       m.setUnick(rset.getString("UNICK"));
       m.setUadrs(rset.getString("UADRS"));
       m.setUphone(rset.getString("UPHONE"));
       m.setUdate(rset.getDate("UDATE"));
       m.setMstatus(rset.getString("MSTATUS"));
       m.setMrname(rset.getString("MRNAME"));
       
    
    }
    
 } catch(SQLException e) {
    
    e.printStackTrace();
    
 } finally {
    close(rset);
    close(pstmt);
 }
 
 System.out.println(m);
 return m;
}

public int deleteMember(Connection con, String userid) {
	int result = 0;
	PreparedStatement pstmt = null;
	
	
	
	try {
		String sql = prop.getProperty("deleteMember");
		
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, userid);
		
		result=pstmt.executeUpdate();
		
	} catch (SQLException e) {
		
		e.printStackTrace();
		
	} finally {
		close(pstmt);
	}
	
	return result;
}

   
}
