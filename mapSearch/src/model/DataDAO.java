package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

import bean.AlleyDataBean;
import bean.ResultBean;
import util.DBUtil;

public class DataDAO {
	public static ResourceBundle sql = null;

	static {
		sql = DBUtil.getResourceBundle();
	}


	public static AlleyDataBean selectArea(String areaCode) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql.getString("selectArea"));
			pstmt.setString(1, areaCode);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				AlleyDataBean alley = new AlleyDataBean();
				alley.setAreaCode(rset.getString(1));
				alley.setDate(rset.getString(2));
				alley.setGu(rset.getString(3));
				alley.setDong(rset.getString(4));
				alley.setTotalPeople(rset.getFloat(5));
				alley.setTotalNearPeople(rset.getFloat(6));
				alley.setTotalBizman(rset.getFloat(7));
				alley.setTotalNearBizman(rset.getFloat(8));
				alley.setTotalLivingPeople(rset.getFloat(9));
				alley.setAvgOutcome(rset.getFloat(10));
				alley.setAvgIncome(rset.getFloat(11));
				alley.setAvgNearIcome(rset.getFloat(12));
				alley.setAvgNearOutcome(rset.getFloat(13));
				alley.setTotalFacility(rset.getFloat(14));
				alley.setTotalNearFacility(rset.getFloat(15));

				return alley;
			}
			return null;
		} finally {
			DBUtil.close(conn, pstmt, rset);
		}
	}


	public static ResultBean selectResult(String areaCode) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;


		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql.getString("selectResult"));
			pstmt.setString(1, areaCode);
			rset = pstmt.executeQuery();
	
			while (rset.next()) {
				ResultBean result = new ResultBean();
				result.setAreaCode(rset.getString(1));
				result.setServiceCode(rset.getString(2));
				result.setGu(rset.getString(3));
				result.setDong(rset.getString(4));
				result.setEstimatedSales(rset.getFloat(5));
				result.setEstimatedGroup(rset.getString(6));
				return result;
			}
			return null;
		} finally {
			DBUtil.close(conn, pstmt, rset);
		}
	}

}