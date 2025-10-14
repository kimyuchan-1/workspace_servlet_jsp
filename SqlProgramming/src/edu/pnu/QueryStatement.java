package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class QueryStatement {
	
	static Scanner sc = new Scanner(System.in);
	
	private static void method1(Connection con) throws Exception{
		
		Statement st = con.createStatement();
		System.out.print("인구 수를 입력해주세요(ex. 500000) : ");
		int popul = sc.nextInt();
		ResultSet rs = st.executeQuery("select id, name, countrycode, "
				+ "district, population from city where population >="+popul);
		
		while (rs.next()) {
			System.out.print(rs.getInt("id")+",");
			System.out.print(rs.getString("name")+",");
			System.out.print(rs.getString("countrycode")+",");
			System.out.print(rs.getString("district")+",");
			System.out.print(rs.getInt("population")+"\n");
		}
		rs.close();
		st.close();
	}
	
	private static void method2(Connection con) throws Exception {
		Statement st = con.createStatement();
		System.out.print("국가코드를 입력해주세요(ex. KOR) : ");
		String code = sc.next();
		ResultSet rs = st.executeQuery("select name, population from city where countrycode like '"+code+"'");
		
		while (rs.next()) {
			System.out.print(rs.getString("name")+",");
			System.out.print(rs.getInt("population")+"\n");
		}
		
		rs.close();
		st.close();
	}
	
	private static void method2_1(Connection con) throws Exception {
		Statement st = con.createStatement();
		System.out.print("국가명을 입력해주세요(ex. Korea) : ");
		String cont = sc.next();
		ResultSet rs = st.executeQuery("select city.name, country.name, city.population "
									 + "from city, country "
									 + "where country.name like '"+cont+"'"
									 + "and city.countrycode = country.code");
		
		while (rs.next()) {
			System.out.print(rs.getString("city.name")+",");
			System.out.print(rs.getInt("city.population")+"\n");
		}
		
		rs.close();
		st.close();
	}
	
	private static void method2_2(Connection con) throws Exception {
		Statement st = con.createStatement();
		System.out.print("국가코드 혹은 국가명을 입력해주세요(ex. KOR or Korea) : ");
		String code = sc.next();
		ResultSet rs = st.executeQuery("select city.name, city.population "
									 + "from city "
									 + "join country"
									 + "on city.countrycode = country.code"
									 + "where city.countrycode like '"+code+"' OR country.name like '"+code+"'");
		
		while (rs.next()) {
			System.out.print(rs.getString("city.name")+",");
			System.out.print(rs.getInt("city.population")+"\n");
		}
		
		rs.close();
		st.close();
	}
	
	private static void method3(Connection con) throws Exception {
		Statement st = con.createStatement();
		System.out.print("대륙을 입력해주세요(ex. Asia) : ");
		String conti = sc.next();
		ResultSet rs = st.executeQuery("select name from country where continent like '"+conti+"'");
		
		while (rs.next()) {
			System.out.print(rs.getString("name")+"\n");
		}
		rs.close();
		st.close();
	}
	
	private static void method4(Connection con) throws Exception {
		Statement st = con.createStatement();
		System.out.print("국가 면적를 입력해주세요(ex. 45221.00) : ");
		Double area = sc.nextDouble();
		ResultSet rs = st.executeQuery("select name, surfacearea from country where surfacearea < "+area);
		
		while (rs.next()) {
			System.out.print(rs.getString("name")+",");
			System.out.print(rs.getDouble("surfacearea")+"\n");
		}

		rs.close();
		st.close();
	}
	
	private static void method5(Connection con) throws Exception {
		Statement st = con.createStatement();
		System.out.print("한국의 행정구역을 입력해주세요(ex. Kyonggi) : ");
		String district = sc.next();
		ResultSet rs = st.executeQuery("select name from city where countrycode like 'KOR' && district like '"+district+"'");
		
		while (rs.next()) {
			System.out.print(rs.getString("name")+"\n");
		}

		rs.close();
		st.close();
	}
	
	private static void method6(Connection con) throws Exception {
		Statement st = con.createStatement();
		System.out.print("언어를 입력해주세요(ex. English) : ");
		String conlang = sc.next();
		ResultSet rs = st.executeQuery("select countrycode from countrylanguage where language like '"+conlang+"'");
		
		while (rs.next()) {
			System.out.print(rs.getString("countrycode")+"\n");
		}

		rs.close();
		st.close();
	}
	
	private static void method6_1(Connection con) throws Exception {
		Statement st = con.createStatement();
		System.out.print("언어를 입력해주세요(ex. English) : ");
		String conlang = sc.next();
		ResultSet rs = st.executeQuery("select country.name "
									 + "from countrylanguage "
									 + "join country"
									 + "on countrylanguage.countrycode = country.code"
									 + "where language like '"+conlang+"'");
		
		while (rs.next()) {
			System.out.print(rs.getString("country.name")+"\n");
		}

		rs.close();
		st.close();
	}
	
	private static void method7(Connection con) throws Exception {
		Statement st = con.createStatement();
		System.out.println("언어 사용 비율을 입력해주세요(ex. 78.14) : ");
		double per = sc.nextDouble();
		ResultSet rs = st.executeQuery("select countrycode, percentage from countrylanguage where percentage >= "+per);
		
		while (rs.next()) {
			System.out.print(rs.getString("countrycode")+",");
			System.out.print(rs.getDouble("percentage")+"\n");
		}

		rs.close();
		st.close();
	}
	
	private static void showMenu() {
		System.out.println();
		System.out.println("=======================Menu=======================");
		System.out.println("1번 : 입력한 인구 수보다 많은 도시 출력");
		System.out.println("2번 : 국가 코드로 해당 국가의 도시와 인구수 출력");
		System.out.println("3번 : 대륙명으로 해당 대륙에 속한 국가 출력");
		System.out.println("4번 : 입력한 면적보다 작은 국가 출력");
		System.out.println("5번 : 입력한 대한민국의 행정구 내 모든 도시 출력");
		System.out.println("6번 : 입력한 언어를 공식적으로 사용하는 국가 출력");
		System.out.println("7번 : 입력한 언어 사용 비율보다 높은 언어 사용을 가진 국가 출력");
	}

	public static void main(String[] args) {
		
		Connection con = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/world";
			con = DriverManager.getConnection(url, "musthave", "tiger");
			
			
			while (true) {
				
				showMenu();
				System.out.print("메뉴를 선택해주세요 : ");
				System.out.println();
				int menu = sc.nextInt();
				switch(menu) {
				case 1 -> method1(con);
				case 2 -> method2(con);
				case 3 -> method3(con);
				case 4 -> method4(con);
				case 5 -> method5(con);
				case 6 -> method6(con);
				case 7 -> method7(con);
				case 0 -> {
                    System.out.println("프로그램을 종료합니다.");
                    return; // main 종료
                }
                default -> System.out.println("잘못된 메뉴 번호입니다.");
				}
			}
			
		} catch (Exception e) {
			System.out.println("연결 실패 : "+ e.getMessage());
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {
				System.out.println("오류 : "+ e.getMessage());
			}
		}

	}

}
