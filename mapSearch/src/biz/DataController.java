package biz;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.AlleyDataBean;
import bean.ResultBean;
import model.DataDAO;

@WebServlet("/data")
public class DataController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public DataController() {
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		String dong = request.getParameter("dong");
		String areaCode = request.getParameter("area");
		String serviceCode = request.getParameter("service");

		try {
			AlleyDataBean alley = DataDAO.selectArea(areaCode, serviceCode);
			ResultBean alleyResult=DataDAO.selectResult(areaCode, serviceCode);
			ArrayList<AlleyDataBean> surArea = DataDAO.selectSurArea(dong, areaCode);
			ArrayList<ResultBean> surResult= DataDAO.selectSurResult(dong, areaCode);
			


			// ArrayList<ResultBean> surResult = selectSurArea(areaList, serviceCode);

			request.getSession().setAttribute("alley", alley);
			request.getSession().setAttribute("surArea", surArea);
			request.getSession().setAttribute("alleyResult", alleyResult);
			request.getSession().setAttribute("surResult", surResult);

			response.sendRedirect("service.jsp");

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
