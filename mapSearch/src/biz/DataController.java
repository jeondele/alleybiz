package biz;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.AlleyDataBean;
import bean.DongDataBean;
import model.DataDAO;
import model.GetAreaCode;
import model.GetDongData;

@WebServlet("/data")
public class DataController extends HttpServlet {

	public DataController() {
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		String dong = request.getParameter("d");
		String gu = request.getParameter("g");
		String service = request.getParameter("service");
		System.out.println(service);

		if (dong == null) {
			request.getSession().setAttribute("areaCheck", "block");
			response.sendRedirect("mapService.jsp");
		} else if (service == null) {
			request.getSession().setAttribute("serviceCheck", "block");
			response.sendRedirect("mapService.jsp");

		} else {
			System.out.println(dong);
			ArrayList<String> codeList = getAreaCode(dong);
			ArrayList<AlleyDataBean> area = getAreaData(codeList);
			request.getSession().setAttribute("area", area);
			response.sendRedirect("mapAnalysis.jsp");
		
		}

		
	}

	public static ArrayList<DongDataBean> getDongData(String dong, ArrayList<AlleyDataBean> area) {
		ArrayList<DongDataBean> dongData = GetDongData.getDongData(dong, area);
		return dongData;
	}

	public static ArrayList<ArrayList<String>> getSurAreaCode(String gu, String dong) {
		ArrayList<String[]> file;
		HashMap<String, ArrayList<String>> guMap;
		ArrayList<ArrayList<String>> codeList = new ArrayList<>();
		try {

			file = GetAreaCode.getDataList();

			guMap = GetAreaCode.convertDongMap(file);
			ArrayList<String> dongList = guMap.get(gu);
			for (String dongs : dongList) {
				if (dongs == dong) {

				} else {
					ArrayList<String> codes = GetAreaCode.convertD2C(guMap, dong);
					codeList.add(codes);

				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			codeList = null;
		}
		return codeList;
	}

	public static ArrayList<String> getAreaCode(String dong) {

		HashMap<String, ArrayList<String>> dongMap;
		ArrayList<String> codeList;
		try {
			dongMap = GetAreaCode.convertCodeMap(GetAreaCode.getDataList());
			codeList = GetAreaCode.convertD2C(dongMap, dong);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			codeList = null;
		}

		return codeList;
	}

	public static ArrayList<AlleyDataBean> getAreaData(ArrayList<String> codeList) {
		ArrayList<AlleyDataBean> area = new ArrayList<>();
		AlleyDataBean data = null;
		for (String code : codeList) {
			try {
				code=code+".0";
				data = DataDAO.selectArea(code);
				area.add(data);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return area;
	}

	public static ArrayList<AlleyDataBean> getSurAreaData(ArrayList<ArrayList<String>> codeList) {
		ArrayList<AlleyDataBean> area = new ArrayList<>();
		AlleyDataBean data = null;
		for (ArrayList<String> codes : codeList) {
			for (String code : codes) {
				try {
					data = DataDAO.selectArea(code);
					area.add(data);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return area;
	}
}
