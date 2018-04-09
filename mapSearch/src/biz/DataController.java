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
import model.GetOne;

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
		String serviceCode = request.getParameter("service");
		String test = request.getParameter("test");
		System.out.println(serviceCode);
		String areaCode = "12322";

		

			try {

				ArrayList<AlleyDataBean> area = DataDAO.selectArea(areaCode);
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

				request.getSession().setAttribute("area", area);
				// request.getSession().setAttribute("alley", alley);
				// request.getSession().setAttribute("surArea", surArea);
				// request.getSession().setAttribute("surAlley", surAlley);
				// request.getSession().setAttribute("result", result);
				// request.getSession().setAttribute("resultAlley", resultAlley);
				// request.getSession().setAttribute("surResult", surResult);
				// request.getSession().setAttribute("surResultAlley", surResultAlley);

				response.sendRedirect("result.jsp");

			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

}
