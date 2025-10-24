package common;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Types;
import java.text.DecimalFormat;

import jakarta.servlet.jsp.JspWriter;

public class MyUtil {
	private static DecimalFormat df = new DecimalFormat("#,###");
	
	public static void writeSQL(JspWriter out, PreparedStatement psmt) throws Exception {
		String str = psmt.toString();
		
		String sql = str.substring(str.indexOf("PreparedStatement: ") + 19);
		
		out.println("<p>SQL : "+ sql + "</p>");
	}
	
	public static String toFormatString(long val) {
		return df.format(val);
	}
	
	private static boolean isIntegerType(int sqlType) {
		return sqlType == Types.TINYINT || sqlType == Types.SMALLINT || sqlType == Types.INTEGER || sqlType == Types.BIGINT;
	}
	
	public static void writeTableFromResultSet(JspWriter out, ResultSet rs) throws Exception {
		ResultSetMetaData md = rs.getMetaData();
		out.println("<table>");
		out.println("\t<tr>");
		
		out.println("\t\t");
		
		for (int i = 1; i <= md.getColumnCount(); i++) {
			out.print("<th>");
			out.print(md.getColumnName(i));
			out.print("</th>");
		}
		
		out.println("\n\t</tr>");
		
		while (rs.next()) {
			out.println("\t<tr>");
			out.println("\t\t");
			for (int i = 1; i <= md.getColumnCount(); i++) {
				out.print("<td>");
				if (isIntegerType(md.getColumnType(i))) {
					out.print(MyUtil.toFormatString(rs.getLong(i)));
				} else {
					out.print(rs.getString(i));
				}
				out.print("</td>");
			}
			out.print("\n\t</tr>");
		}
		out.println("</table>");
	}
}
