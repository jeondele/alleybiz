package biz;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UserBean;
import model.UserDAO;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String inputId = request.getParameter("id");
		String inputPw = request.getParameter("pw");

		UserBean user = new UserBean();
		user.setId(inputId);
		user.setPw(inputPw);
		user.setNickName("test");
		request.getSession().setAttribute("user", user);
		response.sendRedirect("report.jsp");
	}
}
