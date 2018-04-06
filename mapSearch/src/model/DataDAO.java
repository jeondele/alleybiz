package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ResourceBundle;

import bean.AlleyDataBean;
import bean.ResultBean;
import util.DBUtil;

public class DataDAO {
	public static ResourceBundle sql = null;

	static {
		sql = DBUtil.getResourceBundle();
	}

	public static ArrayList<AlleyDataBean> selectSurArea(String dong, String areaCode) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AlleyDataBean> all = null;

		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql.getString("selectSurArea"));
			pstmt.setString(1, dong);
			pstmt.setString(2, areaCode);
			rset = pstmt.executeQuery();
			all = new ArrayList<AlleyDataBean>();

			while (rset.next()) {
				AlleyDataBean alley = new AlleyDataBean();
				alley.setAreaCode(rset.getString(1));
				alley.setServiceCode(rset.getString(2));
				alley.setTotalNearStore(rset.getFloat(3));
				alley.setTotalStore(rset.getFloat(4));
				alley.setAvgNearMonth(rset.getFloat(5));
				alley.setNearSales(rset.getFloat(6));
				alley.setNumberOfNearSales(rset.getFloat(8));
				alley.setAvgMonth(rset.getFloat(9));
				alley.setNumberOfSales(rset.getFloat(10));
				alley.setTotalPeople(rset.getFloat(11));
				alley.setTotalNearPeople(rset.getFloat(12));
				alley.setTotalBizman(rset.getFloat(13));
				alley.setTotalNearBizman(rset.getFloat(14));
				alley.setTotalLivingPeople(rset.getFloat(15));
				alley.setAvgIncome(rset.getFloat(16));
				alley.setAvgOutcome(rset.getFloat(17));
				alley.setAvgNearOutcome(rset.getFloat(18));
				alley.setTotalFacility(rset.getFloat(19));
				alley.setTotalNearFacility(rset.getFloat(20));
				all.add(alley);
			}
			if (all.size() != 0) {
				return all;
			} else {
				return null;
			}
		} finally {
			DBUtil.close(conn, pstmt, rset);
		}
	}

	public static AlleyDataBean selectArea(String areaCode, String serviceCode) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql.getString("selectArea"));
			pstmt.setString(1, areaCode);
			pstmt.setString(2, serviceCode);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				AlleyDataBean alley = new AlleyDataBean();
				alley.setAreaCode(rset.getString(1));
				alley.setServiceCode(rset.getString(2));
				alley.setTotalNearStore(rset.getFloat(3));
				alley.setTotalStore(rset.getFloat(4));
				alley.setAvgNearMonth(rset.getFloat(5));
				alley.setNearSales(rset.getFloat(6));
				alley.setNumberOfNearSales(rset.getFloat(8));
				alley.setAvgMonth(rset.getFloat(9));
				alley.setNumberOfSales(rset.getFloat(10));
				alley.setTotalPeople(rset.getFloat(11));
				alley.setTotalNearPeople(rset.getFloat(12));
				alley.setTotalBizman(rset.getFloat(13));
				alley.setTotalNearBizman(rset.getFloat(14));
				alley.setTotalLivingPeople(rset.getFloat(15));
				alley.setAvgIncome(rset.getFloat(16));
				alley.setAvgOutcome(rset.getFloat(17));
				alley.setAvgNearOutcome(rset.getFloat(18));
				alley.setTotalFacility(rset.getFloat(19));
				alley.setTotalNearFacility(rset.getFloat(20));
				return alley;
			}
			return null;
		} finally {
			DBUtil.close(conn, pstmt, rset);
		}
	}

	public static ArrayList<ResultBean> selectSurResult(String dong, String areaCode) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ResultBean> all = null;

		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql.getString("selectSurResult"));
			pstmt.setString(1, dong);
			pstmt.setString(2, areaCode);
			rset = pstmt.executeQuery();
			all = new ArrayList<ResultBean>();

			while (rset.next()) {
				ResultBean result = new ResultBean();
				result.setAreaCode(rset.getString(1));
				result.setServiceCode(rset.getString(2));
				result.setGu(rset.getString(3));
				result.setDong(rset.getString(4));
				result.setEstimatedSales(rset.getFloat(5));
				result.setEstimatedGroup(rset.getString(6));
				all.add(result);
			}
			if (all.size() != 0) {
				return all;
			} else {
				return null;
			}
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