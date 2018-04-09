package biz;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.AlleyDataBean;
import model.DataDAO;

@WebServlet("/data")
public class DataController extends HttpServlet {

	public DataController() {
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		String dong = request.getParameter("d");
		String dongs = request.getParameter("msg");

		// String areaCode = request.getParameter("area");
		String service = request.getParameter("service");

		String areaCode = "11947.0";

		if (dong == null) {
			request.getSession().setAttribute("areaCheck", "block");
			response.sendRedirect("mapService.jsp");
		} else if (service == null) {
			request.getSession().setAttribute("serviceCheck", "block");
			response.sendRedirect("mapService.jsp");

		} else {
			response.sendRedirect("result.jsp");

			try {

				ArrayList<AlleyDataBean> area = DataDAO.selectArea(areaCode);
				request.getSession().setAttribute("area", area);
				// AlleyDataBean alley = GetOne.getAreaService(area, areaCode);

				// ArrayList<AlleyDataBean> surArea = DataDAO.selectSurArea(dong, areaCode);
				// AlleyDataBean surAlley = GetOne.getAreaService(surArea, areaCode);

				// ArrayList<ResultBean> result = DataDAO.selectResult(areaCode);
				// ResultBean resultAlley = GetOne.getResultAreaService(result, areaCode,
				// serviceCode);
				//
				// ArrayList<ResultBean> surResult = DataDAO.selectSurResult(dong, areaCode);
				// ResultBean surResultAlley = GetOne.getResultAreaService(surResult, areaCode,
				// serviceCode);

				// ArrayList<ResultBean> surResult = selectSurArea(areaList, serviceCode);



			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
	}

}
