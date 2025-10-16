package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.Scanner;

public class PhoneBookApp {
	
	private static void insertPhonebook(Connection con, Scanner sc) throws Exception {
		
		System.out.print("전화번호부에 입력할 대상의 이름을 입력해주세요: ");
		String name = sc.next();
		
		System.out.print("전화번호부에 입력할 대상의 연락처를 입력해주세요: ");
		String phoneNumber = sc.next();
		
		String sql = "insert into phonebook(name,moblie) value(?,?)";
		PreparedStatement psmt = con.prepareStatement(sql);
		
		psmt.setString(1, name);
		psmt.setString(2, phoneNumber);
		int n = psmt.executeUpdate();
		
		System.out.println(n+"개의 데이터가 업로드되었습니다.");
		
		psmt.close();
	}
	
	private static void updatePhonebook(Connection con, Scanner sc) throws Exception {
		
		System.out.print("전화번호부에 수정할 대상의 id를 입력해주세요: ");
		int id = sc.nextInt();
		
		System.out.print("전화번호부에 수정할 대상의 집 전화를 입력해주세요: ");
		String homeNumber = sc.next();
		
		String sql = "update phonebook set home = ? where id = ?";
		PreparedStatement psmt = con.prepareStatement(sql);
		
		psmt.setString(1, homeNumber);
		psmt.setInt(2, id);
		int n = psmt.executeUpdate();
		
		System.out.println(n+"개의 데이터가 업데이트되었습니다.");
		
		psmt.close();
		
	}

	private static void deletePhonebook(Connection con, Scanner sc) throws Exception {
		
		System.out.print("전화번호부에 삭제할 대상의 id를 입력해주세요: ");
		int id = sc.nextInt();
		
		String sql = "delete from phonebook where id = ?";
		PreparedStatement psmt = con.prepareStatement(sql);
		
		psmt.setInt(1, id);
		int n = psmt.executeUpdate();
		
		System.out.println(n+"개의 데이터가 삭제되었습니다.");
		
		psmt.close();
		
	}
	
	private static void selectPhonebook(Connection con, Scanner sc) throws Exception {
		String sql = "select id, name, moblie, home from phonebook";
		PreparedStatement psmt = con.prepareStatement(sql);
		ResultSet rs = psmt.executeQuery();
		
		while (rs.next()) {
			System.out.printf("id: %3d, name: %3s, moblie number: %s, home number: %s \n", rs.getInt("id"), rs.getString("name"), rs.getString("moblie"), rs.getString("home"));
		}
		
		psmt.close();
	}

	private static void nativeQuery(Connection con, Scanner sc) throws Exception {
		sc.nextLine();
		System.out.print("SQL> ");
		String sql = sc.nextLine();
		String pre = sql.substring(0,6).toLowerCase();
		
		Statement stmt = con.createStatement();
		
		if (!pre.startsWith("select")) {
			
			int cnt = stmt.executeUpdate(sql);
			
			if (pre.startsWith("insert")) {
				System.out.println(cnt + "건이 입력되었습니다.");
			} else if (pre.startsWith("update")) {
				System.out.println(cnt + "건이 수정되었습니다.");
			} else if (pre.startsWith("delete")) {
				System.out.println(cnt + "건이 삭제되었습니다.");
			} 
			
			return;
		}
		
		ResultSet rs = stmt.executeQuery(sql);
		ResultSetMetaData md = rs.getMetaData();
		
		while (rs.next()) {
			for (int i = 1; i <= md.getColumnCount(); i++) {
				if (i != 1) {
					System.out.print(", ");
				}
				System.out.print(rs.getString(i));
			}
			System.out.println();
		}
		 
	}
	
	private static Scanner sc = new Scanner(System.in);
	private static String url = "jdbc:mysql://localhost:3306/myfirstdb";
	
	public static void main(String[] args) throws Exception{
		Connection con = DriverManager.getConnection(url,"musthave","tiger");
		boolean flag = true;
		while (flag) {
			System.out.print("[I]nsert/[U]pdate/[D]elete/[S]elect/[N]ative/[Q]uit: ");
			char c = sc.next().toUpperCase().charAt(0);
			switch(c) {
			case 'I' : insertPhonebook(con,sc); 				break;
			case 'U' : updatePhonebook(con,sc); 				break;
			case 'D' : deletePhonebook(con,sc); 				break;
			case 'S' : selectPhonebook(con,sc); 				break;
			case 'N' : nativeQuery(con,sc); 					break;
			case 'Q' : flag = false; con.close(); sc.close(); 	break;
			}
			
		}
		
		System.out.println("Bye~");
	}

}
