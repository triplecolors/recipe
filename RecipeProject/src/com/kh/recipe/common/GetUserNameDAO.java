package com.kh.recipe.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static com.kh.recipe.common.JDBCTemplate.*;


// DB에 회원번호를 가지고 한번 더가서 닉네임 가져오는 DAO
public class GetUserNameDAO {

	public String getUserName(Connection con, int uno) {
		String userName = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = "SELECT UNICK FROM ULIST WHERE UNO=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, uno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				userName = rset.getString("UNICK");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	
		return userName;
	}
	
	
	
	
	
	
}