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
			pstmt.setString(2,  areaCode);

			rset = pstmt.executeQuery();
			all = new ArrayList<AlleyDataBean>();

			while (rset.next()) {
				AlleyDataBean alley = new AlleyDataBean();
				alley.setDate(rset.getString(1));
				alley.setGu(rset.getString(2));
				alley.setDong(rset.getString(3));
				alley.setAreaCode(rset.getString(4));
				alley.setTotalPeople(rset.getFloat(5));
				alley.setTotalNearPeople(rset.getFloat(6));
				alley.setTotalBizman(rset.getFloat(7));
				alley.setTotalNearBizman(rset.getFloat(8));
				alley.setTotalLivingPeople(rset.getFloat(9));
				alley.setAvgIncome(rset.getFloat(10));
				alley.setAvgOutcome(rset.getFloat(11));
				alley.setAvgNearOutcome(rset.getFloat(12));
				alley.setTotalFacility(rset.getFloat(13));
				alley.setTotalNearFacility(rset.getFloat(14));
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

	public static ArrayList<AlleyDataBean> selectArea(String areaCode) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AlleyDataBean> all = null;

		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql.getString("selectArea"));
			pstmt.setString(1,  areaCode);

			rset = pstmt.executeQuery();
			all = new ArrayList<AlleyDataBean>();

			while (rset.next()) {
				AlleyDataBean alley = new AlleyDataBean();
				alley.setDate(rset.getString(1));
				alley.setGu(rset.getString(2));
				alley.setDong(rset.getString(3));
				alley.setAreaCode(rset.getString(4));
				alley.setTotalPeople(rset.getFloat(5));
				alley.setTotalNearPeople(rset.getFloat(6));
				alley.setTotalBizman(rset.getFloat(7));
				alley.setTotalNearBizman(rset.getFloat(8));
				alley.setTotalLivingPeople(rset.getFloat(9));
				alley.setAvgIncome(rset.getFloat(10));
				alley.setAvgOutcome(rset.getFloat(11));
				alley.setAvgNearOutcome(rset.getFloat(12));
				alley.setTotalFacility(rset.getFloat(13));
				alley.setTotalNearFacility(rset.getFloat(14));
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
	
	public static ArrayList<ResultBean> selectResult(String areaCode) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ResultBean> all = null;

		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql.getString("selectSurResult"));
			pstmt.setString(1, areaCode);

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
	

}