package com.kh.recipe.common;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class JDBCTemplate {
	
	public static Connection getConnection() {
		Connection con = null;
		
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/Recipe");
			con = ds.getConnection();
			
			con.setAutoCommit(false);			
			
		} catch (SQLException | NamingException e) {
			System.out.println("Connection을 생성하는 데에서 오류가 났습니다.");
		}
		return con;
	}
	
	public static void close(Connection con) {
			try {
				if(!con.isClosed()) {
				con.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println(e.getMessage());
			}
	}
	public static void close(Statement stmt) {
		try {
			if(!stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
	}
	public static void close(ResultSet rset) {
		try {
			if(!rset.isClosed()) {
				rset.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
	}

	
	
	
	
	public static void commit(Connection con) {
		try {
			if(!con.isClosed()) {
			con.commit();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		
	}
	public static void rollback(Connection con) {
		try {
			if(!con.isClosed()) {
				con.rollback();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		
	}
}
