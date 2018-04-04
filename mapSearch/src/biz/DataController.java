package biz;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DataBean;
import bean.ResultBean;
import model.DataDAO;

@WebServlet("/data")
public class DataController extends HttpServlet {
	public DataController() {
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		String areaCode = request.getParameter("area");
		String serviceCode = request.getParameter("service");
		try {
			ResultBean result = DataDAO.selectResultData(areaCode, serviceCode);
			ArrayList<DataBean> data = DataDAO.selectData(areaCode, serviceCode);
			request.getSession().setAttribute("result", result);
			request.getSession().setAttribute("data", data);
			response.sendRedirect("service.jsp");

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
