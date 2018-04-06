package biz;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UserBean;
import model.UserDAO;

@SuppressWarnings("serial")
@WebServlet("/login")
public class LoginController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String inputId = request.getParameter("id");
		String inputPw = request.getParameter("pw");

		try {
			UserBean user = UserDAO.selectUser(inputId);
			if (user != null) {
				if (user.getPw().equals(inputPw)) {// 패스워드 검증
					request.getSession().setAttribute("user", user); 
					response.sendRedirect("service.jsp");

				} else { // 패스워드 불일치
					request.getSession().setAttribute("user", "block");
					response.sendRedirect("login.jsp");

				}
			}
		} catch (Exception e) {
			response.sendRedirect("login.jsp");
		}
	}
}
