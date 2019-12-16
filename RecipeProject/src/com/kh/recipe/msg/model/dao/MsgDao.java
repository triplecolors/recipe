package com.kh.recipe.msg.model.dao;

import static com.kh.recipe.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.recipe.member.model.vo.Member;
import com.kh.recipe.msg.model.vo.Msg;



public class MsgDao {
	
	private Properties prop = new Properties();
	
	public MsgDao() {
		String filePath = MsgDao.class
								.getResource("/mappers/msg.properties")
								.getPath();
		
		try {
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		
	}
	
	
	
	// Send Insert
	public int sendMsg(Connection con, Msg smsg) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		
		try {
			String sql =prop.getProperty("sendMsgInsert");
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, smsg.getmSender());
			pstmt.setInt(2, smsg.getmReceiver() );
			pstmt.setString(3, smsg.getmContent());
			pstmt.setString(4, smsg.getmType());
			pstmt.setDate(5, smsg.getmSendDate());
			pstmt.setDate(6, smsg.getmRecvDate());
			
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}

		return result;
	}



	public int receiveMsg(Connection con, Msg rmsg) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			    String sql = prop.getProperty("");
			
			    
			    
			pstmt = con.prepareStatement(sql);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	
}
