package model;

import java.sql.SQLException;
import java.util.ArrayList;

import bean.AlleyDataBean;
import bean.ResultBean;

public class GetOne {

	public static AlleyDataBean getAreaService(ArrayList<AlleyDataBean> area, String areaCode) {

		

		int len = area.size();
		for (int i = 0; i < len; i++) {
			AlleyDataBean alley = new AlleyDataBean();
			alley = area.get(i);
			String code = alley.getAreaCode();
			if (code.equals(areaCode)) {
				return alley;
			}
			
		}
		return null;

	}

	public static ResultBean getResultAreaService(ArrayList<ResultBean> result, String areaCode, String serviceCode) {
		try {
			result = DataDAO.selectResult(areaCode);
			ResultBean resultAlley = new ResultBean();
			int len = result.size();
			for (int i = 0; i < len; i++) {
				resultAlley = result.get(i);
				String code = resultAlley.getAreaCode();
				if (code.equals(areaCode)) {
					break;
				}
			}
			return resultAlley;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

}
