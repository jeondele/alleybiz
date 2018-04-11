package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ResourceBundle;

import bean.AlleyDataBean;
import bean.ResultBean;
import bean.StoreSales;
import util.DBUtil;

public class DataDAO {
	public static ResourceBundle sql = null;

	static {
		sql = DBUtil.getResourceBundle();
	}

	public static ArrayList<AlleyDataBean> selectArea(String areaCode) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AlleyDataBean> all = null;
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql.getString("selectArea"));
			pstmt.setString(1, areaCode);
			rset = pstmt.executeQuery();
			all = new ArrayList<>();

			while (rset.next()) {
				AlleyDataBean alley = new AlleyDataBean();
				alley.setAreaCode(rset.getString(1));
				alley.setDate(rset.getString(2));
				alley.setTotalPeople(rset.getFloat(3));
				alley.setTotalNearPeople(rset.getFloat(4));
				alley.setTotalBizman(rset.getFloat(5));
				alley.setTotalNearBizman(rset.getFloat(6));
				alley.setTotalLivingPeople(rset.getFloat(7));
				alley.setAvgIncome(rset.getFloat(8));
				alley.setAvgOutcome(rset.getFloat(9));
				alley.setAvgNearIcome(rset.getFloat(10));
				alley.setAvgNearOutcome(rset.getFloat(11));
				alley.setTotalFacility(rset.getFloat(12));
				alley.setTotalNearFacility(rset.getFloat(13));
				all.add(alley);
			}
			if (all.size() != 0) {
				return all;
			}
			return null;
		} finally {
			DBUtil.close(conn, pstmt, rset);
		}
	}

	public static ResultBean selectResult(String areaCode, String serviceCode) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql.getString("selectResult"));
			pstmt.setString(1, areaCode);
			pstmt.setString(2, serviceCode);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				ResultBean result = new ResultBean();
				result.setAreaCode(rset.getString(1));
				result.setServiceCode(rset.getString(2));
				result.setSales(rset.getFloat(3));
				result.setPercentage(rset.getFloat(4));
				result.setEstimatedClass(rset.getString(5));
				return result;
			}
			return null;
		} finally {
			DBUtil.close(conn, pstmt, rset);
		}
	}

	public static ArrayList<StoreSales> selectStoreSales(String areaCode, String serviceCode) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<StoreSales> all = null;

		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql.getString("selectStoreSales"));
			pstmt.setString(1, areaCode);
			pstmt.setString(2, serviceCode);
			rset = pstmt.executeQuery();
			all = new ArrayList<>();

			while (rset.next()) {
				StoreSales result = new StoreSales();
				result.setDate(rset.getString(1));
				result.setAreaCode(rset.getString(2));
				result.setServiceCode(rset.getString(3));
				result.setSales(rset.getInt(4));
				result.setStores(rset.getInt(5));
				all.add(result);
			}
			if (all.size() != 0) {
				return all;
			}
			return null;
		} finally {
			DBUtil.close(conn, pstmt, rset);
		}
	}
}