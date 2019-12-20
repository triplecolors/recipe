package com.kh.recipe.BoardCommon.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.recipe.BoardCommon.model.vo.Bfile;
import com.kh.recipe.recipeBoard.model.vo.Recipe;

import static com.kh.recipe.common.JDBCTemplate.*;

public class BFileDAO {
	private Properties prop = new Properties();
	public BFileDAO() {
		try {
			prop.load( new FileReader(BFileDAO.class.getResource("/mappers/bFile.properties").getPath()));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("prop파일을 못찾았어요!");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("prop IO에서 문제가 생겼어요!");
		}
	}

	public int selectCurrentBno(Connection con) {
		int result = 0;
		Statement stmt = null;
		ResultSet rset = null;
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(prop.getProperty("selectCurrentBno"));
			
			while (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DAO에서 에러 발생!!");
		} finally {
			close(rset);
			close(stmt);
		}
		return result;
	}
	
	public int insertBfile(Connection con, ArrayList<Bfile> fList) {
		int result = 0;
		PreparedStatement pstmt = null;
		System.out.println(fList.size());
		System.out.println(prop.getProperty("insertBfile"));
		try {
			for (int i = 0; i < fList.size(); i++) {
				pstmt = con.prepareStatement(prop.getProperty("insertBfile"));
				pstmt.setInt(1, fList.get(i).getBno());
				pstmt.setString(2, fList.get(i).getFname());
				pstmt.setString(3, fList.get(i).getFpath());
				pstmt.setInt(4, fList.get(i).getFlevel());
				// 첫 이미지는 0 level (대표)
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteBfile(Connection con, int bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement("DELETE FROM BFILE WHERE BNO = ?");
			pstmt.setInt(1, bno);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DAO에서 에러 발생!");
		} finally {
			close(pstmt);
		}
		return result;
	}


}
