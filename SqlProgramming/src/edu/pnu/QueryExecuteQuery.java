package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class QueryExecuteQuery {
	
	public static void main(String[] args) {
		
		Connection con = null;
		PreparedStatement psmt = null;
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/myfirstdb";
			con = DriverManager.getConnection(url,"musthave", "tiger");
			
			String sql = "select id, name, moblie,home from phonebook";
			psmt = con.prepareStatement(sql);
			ResultSet rs = psmt.executeQuery();
			
			while (rs.next()) {
				System.out.printf("id: %3d, name: %3s, moblie number: %s, home number: %s \n", rs.getInt("id"), rs.getString("name"), rs.getString("moblie"), rs.getString("home"));
			}
			
		} catch (Exception e) {
			
		} finally {
			try {
				if (con != null) {
					
				}
			} catch (Exception e) {
				
			}
		}
		
	}

}
