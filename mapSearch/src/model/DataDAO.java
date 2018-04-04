package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ResourceBundle;

import bean.DataBean;
import bean.ResultBean;
import util.DBUtil;

public class DataDAO {
	public static ResourceBundle sql = null;

	static {
		sql = DBUtil.getResourceBundle();
	}

	public static ArrayList<DataBean> selectAllData() throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<DataBean> all = null;

		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql.getString("selectAllData"));
			rset = pstmt.executeQuery();
			all = new ArrayList<DataBean>();

			while (rset.next()) {
				DataBean user = new DataBean();
				user.setDate(rset.getString(1));
				user.setAreaCode(rset.getString(2));
				user.setServiceCode(rset.getString(3));
				user.setServiceCode(rset.getString(4));
				user.setSales(rset.getInt(5));
				user.setStores(rset.getInt(6));
				all.add(user);
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

	public static ArrayList<DataBean> selectAreaCode(String areaCode) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<DataBean> all = null;
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql.getString("selectAreaCode"));
			pstmt.setString(1, areaCode);
			rset = pstmt.executeQuery();
			all = new ArrayList<DataBean>();

			while (rset.next()) {
				DataBean user = new DataBean();
				user.setDate(rset.getString(1));
				user.setAreaCode(rset.getString(2));
				user.setServiceCode(rset.getString(3));
				user.setServiceCode(rset.getString(4));
				user.setSales(rset.getInt(5));
				user.setStores(rset.getInt(6));
				all.add(user);

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

	public static ArrayList<DataBean> selectServiceCodeData(String serviceCode) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<DataBean> all = null;
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql.getString("selectServiceCode"));
			pstmt.setString(1, serviceCode);
			rset = pstmt.executeQuery();
			all = new ArrayList<DataBean>();

			while (rset.next()) {
				DataBean user = new DataBean();
				user.setDate(rset.getString(1));
				user.setAreaCode(rset.getString(2));
				user.setServiceCode(rset.getString(3));
				user.setServiceCode(rset.getString(4));
				user.setSales(rset.getInt(5));
				user.setStores(rset.getInt(6));
				all.add(user);

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

	public static ArrayList<DataBean> selectData(String areaCode, String serviceCode) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<DataBean> all = null;
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql.getString("selectData"));
			pstmt.setString(1, areaCode);
			pstmt.setString(2, serviceCode);
			rset = pstmt.executeQuery();
			all = new ArrayList<DataBean>();

			if (rset.next()) {
				DataBean user = new DataBean();
				user.setDate(rset.getString(1));
				user.setAreaCode(rset.getString(2));
				user.setServiceCode(rset.getString(3));
				user.setServiceCode(rset.getString(4));
				user.setSales(rset.getInt(5));
				user.setStores(rset.getInt(6));
				all.add(user);

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

	public static ResultBean selectResultData(String areaCode, String serviceCode) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql.getString("selectResultData"));
			pstmt.setString(1, areaCode);
			pstmt.setString(2, serviceCode);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				ResultBean result = new ResultBean();
				result.setAreaCode(rset.getString(1));
				result.setServiceCode(rset.getString(2));
				result.setServiceCode(rset.getString(3));
				result.setEstimatedSales(rset.getInt(4));
				result.setEstimatedGroup(rset.getString(5));
				return result;
			}
			return null;
		} finally {
			DBUtil.close(conn, pstmt, rset);
		}
	}

}