package utils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CookieManager {
	public static void makeCookie(HttpServletResponse response, String cName, int cValue, int cTime) {
		String ScValue = String.valueOf(cValue);
		Cookie cookie = new Cookie(cName, ScValue);
		cookie.setPath("/");
		cookie.setMaxAge(cTime);
		response.addCookie(cookie);
	}
	
	public static String readCookie(HttpServletRequest request, String cName) {
		String cookieValue = "";
		
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				String cookieName = c.getName();
				if (cookieName.equals(cName)) {
					cookieValue = String.valueOf(c.getValue());
				}
				
			}
		}
		return cookieValue;
	}
	
	public static void deleteCookie(HttpServletResponse response, String cName) {
		makeCookie(response, cName, 0, 0);
	}
}
