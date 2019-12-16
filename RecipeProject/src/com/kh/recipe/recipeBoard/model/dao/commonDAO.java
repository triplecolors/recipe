package com.kh.recipe.recipeBoard.model.dao;

import java.io.*;
import java.sql.*;
import java.util.*;

import static com.kh.recipe.common.JDBCTemplate.*;


public class commonDAO {
	// 쿼리 조회용 프로퍼티 등록
		private Properties prop = new Properties();
		
		public commonDAO() {
			try {
				prop.load( new FileReader( commonDAO.class.getResource("/mappers/recipeCommon.properties").getPath() ) );
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		public Map<Integer, Map<Integer, String>> selectCate(Connection con) {
			Map<Integer, Map<Integer, String>> catelist = new HashMap<>();
			Map<Integer, String> list = null;
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			try {
				pstmt = con.prepareStatement(prop.getProperty("selectCate"));
				
				for (int i = 1; i < 5; i++) {
					pstmt.setInt(1, i);
					rset = pstmt.executeQuery();
					list = new HashMap<Integer, String>();
					while (rset.next()) {
						if(rset.getInt(1) == i) continue;
						list.put(rset.getInt(1), rset.getString(3));
					}
					catelist.put(i, list);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("DAO에서 에러발생!!");
			} finally {
				close(rset);
				close(pstmt);
			}
			return catelist;
		}
}

























