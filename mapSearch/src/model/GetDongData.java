package model;

import java.util.ArrayList;

import bean.AlleyDataBean;
import bean.DongDataBean;
import bean.ResultBean;

public class GetDongData {

	public static ArrayList<DongDataBean> getDongData(String dong, ArrayList<AlleyDataBean> areaData) {
		ArrayList<DongDataBean> dongData = new ArrayList<>();
		DongDataBean dongData1606 = new DongDataBean();
		DongDataBean dongData1607 = new DongDataBean();
		DongDataBean dongData1608 = new DongDataBean();
		DongDataBean dongData1609 = new DongDataBean();
		DongDataBean dongData1610 = new DongDataBean();
		DongDataBean dongData1611 = new DongDataBean();
		DongDataBean dongData1612 = new DongDataBean();
		DongDataBean dongData1701 = new DongDataBean();
		DongDataBean dongData1702 = new DongDataBean();
		DongDataBean dongData1703 = new DongDataBean();
		DongDataBean dongData1704 = new DongDataBean();
		DongDataBean dongData1705 = new DongDataBean();
		DongDataBean dongData1706 = new DongDataBean();
		DongDataBean dongData1707 = new DongDataBean();
		DongDataBean dongData1708 = new DongDataBean();
		for (AlleyDataBean alley : areaData) {
			if (alley.getDate().equals("201606.0")) {
				dongData1606.setDate("201606.0");
				dongData1606.setDong(dong);
				dongData1606.setTotalPeople(alley.getTotalPeople());
				dongData1606.setTotalNearPeople(alley.getTotalNearPeople());
				dongData1606.setTotalBizman(alley.getTotalBizman());
				dongData1606.setTotalNearBizman(alley.getTotalNearBizman());
				dongData1606.setTotalLivingPeople(alley.getTotalLivingPeople());
				dongData1606.setAvgIncome(alley.getAvgIncome());
				dongData1606.setAvgOutcome(alley.getAvgOutcome());
				dongData1606.setAvgNearIcome(alley.getAvgNearIcome());
				dongData1606.setAvgNearOutcome(alley.getAvgNearOutcome());
				dongData1606.setTotalFacility(alley.getTotalFacility());
				dongData1606.setTotalNearFacility(alley.getTotalNearFacility());

			} else if (alley.getDate().equals("201607.0")) {
				dongData1607.setDate("201607.0");
				dongData1607.setDong(dong);
				dongData1607.setTotalPeople(alley.getTotalPeople());
				dongData1607.setTotalNearPeople(alley.getTotalNearPeople());
				dongData1607.setTotalBizman(alley.getTotalBizman());
				dongData1607.setTotalNearBizman(alley.getTotalNearBizman());
				dongData1607.setTotalLivingPeople(alley.getTotalLivingPeople());
				dongData1607.setAvgIncome(alley.getAvgIncome());
				dongData1607.setAvgOutcome(alley.getAvgOutcome());
				dongData1607.setAvgNearIcome(alley.getAvgNearIcome());
				dongData1607.setAvgNearOutcome(alley.getAvgNearOutcome());
				dongData1607.setTotalFacility(alley.getTotalFacility());
				dongData1607.setTotalNearFacility(alley.getTotalNearFacility());

			} else if (alley.getDate().equals("201608.0")) {
				dongData1608.setDate("201608.0");
				dongData1608.setDong(dong);
				dongData1608.setTotalPeople(alley.getTotalPeople());
				dongData1608.setTotalNearPeople(alley.getTotalNearPeople());
				dongData1608.setTotalBizman(alley.getTotalBizman());
				dongData1608.setTotalNearBizman(alley.getTotalNearBizman());
				dongData1608.setTotalLivingPeople(alley.getTotalLivingPeople());
				dongData1608.setAvgIncome(alley.getAvgIncome());
				dongData1608.setAvgOutcome(alley.getAvgOutcome());
				dongData1608.setAvgNearIcome(alley.getAvgNearIcome());
				dongData1608.setAvgNearOutcome(alley.getAvgNearOutcome());
				dongData1608.setTotalFacility(alley.getTotalFacility());
				dongData1608.setTotalNearFacility(alley.getTotalNearFacility());

			} else if (alley.getDate().equals("201609.0")) {
				dongData1609.setDate("201609.0");
				dongData1609.setDong(dong);
				dongData1609.setTotalPeople(alley.getTotalPeople());
				dongData1609.setTotalNearPeople(alley.getTotalNearPeople());
				dongData1609.setTotalBizman(alley.getTotalBizman());
				dongData1609.setTotalNearBizman(alley.getTotalNearBizman());
				dongData1609.setTotalLivingPeople(alley.getTotalLivingPeople());
				dongData1609.setAvgIncome(alley.getAvgIncome());
				dongData1609.setAvgOutcome(alley.getAvgOutcome());
				dongData1609.setAvgNearIcome(alley.getAvgNearIcome());
				dongData1609.setAvgNearOutcome(alley.getAvgNearOutcome());
				dongData1609.setTotalFacility(alley.getTotalFacility());
				dongData1609.setTotalNearFacility(alley.getTotalNearFacility());

			} else if (alley.getDate().equals("201610.0")) {
				dongData1610.setDate("201610.0");
				dongData1610.setDong(dong);
				dongData1610.setTotalPeople(alley.getTotalPeople());
				dongData1610.setTotalNearPeople(alley.getTotalNearPeople());
				dongData1610.setTotalBizman(alley.getTotalBizman());
				dongData1610.setTotalNearBizman(alley.getTotalNearBizman());
				dongData1610.setTotalLivingPeople(alley.getTotalLivingPeople());
				dongData1610.setAvgIncome(alley.getAvgIncome());
				dongData1610.setAvgOutcome(alley.getAvgOutcome());
				dongData1610.setAvgNearIcome(alley.getAvgNearIcome());
				dongData1610.setAvgNearOutcome(alley.getAvgNearOutcome());
				dongData1610.setTotalFacility(alley.getTotalFacility());
				dongData1610.setTotalNearFacility(alley.getTotalNearFacility());

			} else if (alley.getDate().equals("201611.0")) {
				dongData1611.setDate("201611.0");
				dongData1611.setDong(dong);
				dongData1611.setTotalPeople(alley.getTotalPeople());
				dongData1611.setTotalNearPeople(alley.getTotalNearPeople());
				dongData1611.setTotalBizman(alley.getTotalBizman());
				dongData1611.setTotalNearBizman(alley.getTotalNearBizman());
				dongData1611.setTotalLivingPeople(alley.getTotalLivingPeople());
				dongData1611.setAvgIncome(alley.getAvgIncome());
				dongData1611.setAvgOutcome(alley.getAvgOutcome());
				dongData1611.setAvgNearIcome(alley.getAvgNearIcome());
				dongData1611.setAvgNearOutcome(alley.getAvgNearOutcome());
				dongData1611.setTotalFacility(alley.getTotalFacility());
				dongData1611.setTotalNearFacility(alley.getTotalNearFacility());

			} else if (alley.getDate().equals("201612.0")) {
				dongData1612.setDate("201612.0");
				dongData1612.setDong(dong);
				dongData1612.setTotalPeople(alley.getTotalPeople());
				dongData1612.setTotalNearPeople(alley.getTotalNearPeople());
				dongData1612.setTotalBizman(alley.getTotalBizman());
				dongData1612.setTotalNearBizman(alley.getTotalNearBizman());
				dongData1612.setTotalLivingPeople(alley.getTotalLivingPeople());
				dongData1612.setAvgIncome(alley.getAvgIncome());
				dongData1612.setAvgOutcome(alley.getAvgOutcome());
				dongData1612.setAvgNearIcome(alley.getAvgNearIcome());
				dongData1612.setAvgNearOutcome(alley.getAvgNearOutcome());
				dongData1612.setTotalFacility(alley.getTotalFacility());
				dongData1612.setTotalNearFacility(alley.getTotalNearFacility());

			} else if (alley.getDate().equals("201701.0")) {
				dongData1701.setDate("201701.0");
				dongData1701.setDong(dong);
				dongData1701.setTotalPeople(alley.getTotalPeople());
				dongData1701.setTotalNearPeople(alley.getTotalNearPeople());
				dongData1701.setTotalBizman(alley.getTotalBizman());
				dongData1701.setTotalNearBizman(alley.getTotalNearBizman());
				dongData1701.setTotalLivingPeople(alley.getTotalLivingPeople());
				dongData1701.setAvgIncome(alley.getAvgIncome());
				dongData1701.setAvgOutcome(alley.getAvgOutcome());
				dongData1701.setAvgNearIcome(alley.getAvgNearIcome());
				dongData1701.setAvgNearOutcome(alley.getAvgNearOutcome());
				dongData1701.setTotalFacility(alley.getTotalFacility());
				dongData1701.setTotalNearFacility(alley.getTotalNearFacility());

			} else if (alley.getDate().equals("201702.0")) {
				dongData1702.setDate("201702.0");
				dongData1702.setDong(dong);
				dongData1702.setTotalPeople(alley.getTotalPeople());
				dongData1702.setTotalNearPeople(alley.getTotalNearPeople());
				dongData1702.setTotalBizman(alley.getTotalBizman());
				dongData1702.setTotalNearBizman(alley.getTotalNearBizman());
				dongData1702.setTotalLivingPeople(alley.getTotalLivingPeople());
				dongData1702.setAvgIncome(alley.getAvgIncome());
				dongData1702.setAvgOutcome(alley.getAvgOutcome());
				dongData1702.setAvgNearIcome(alley.getAvgNearIcome());
				dongData1702.setAvgNearOutcome(alley.getAvgNearOutcome());
				dongData1702.setTotalFacility(alley.getTotalFacility());
				dongData1702.setTotalNearFacility(alley.getTotalNearFacility());

			} else if (alley.getDate().equals("201703.0")) {
				dongData1703.setDate("201703.0");
				dongData1703.setDong(dong);
				dongData1703.setTotalPeople(alley.getTotalPeople());
				dongData1703.setTotalNearPeople(alley.getTotalNearPeople());
				dongData1703.setTotalBizman(alley.getTotalBizman());
				dongData1703.setTotalNearBizman(alley.getTotalNearBizman());
				dongData1703.setTotalLivingPeople(alley.getTotalLivingPeople());
				dongData1703.setAvgIncome(alley.getAvgIncome());
				dongData1703.setAvgOutcome(alley.getAvgOutcome());
				dongData1703.setAvgNearIcome(alley.getAvgNearIcome());
				dongData1703.setAvgNearOutcome(alley.getAvgNearOutcome());
				dongData1703.setTotalFacility(alley.getTotalFacility());
				dongData1703.setTotalNearFacility(alley.getTotalNearFacility());

			} else if (alley.getDate().equals("201704.0")) {
				dongData1704.setDate("201704.0");
				dongData1704.setDong(dong);
				dongData1704.setTotalPeople(alley.getTotalPeople());
				dongData1704.setTotalNearPeople(alley.getTotalNearPeople());
				dongData1704.setTotalBizman(alley.getTotalBizman());
				dongData1704.setTotalNearBizman(alley.getTotalNearBizman());
				dongData1704.setTotalLivingPeople(alley.getTotalLivingPeople());
				dongData1704.setAvgIncome(alley.getAvgIncome());
				dongData1704.setAvgOutcome(alley.getAvgOutcome());
				dongData1704.setAvgNearIcome(alley.getAvgNearIcome());
				dongData1704.setAvgNearOutcome(alley.getAvgNearOutcome());
				dongData1704.setTotalFacility(alley.getTotalFacility());
				dongData1704.setTotalNearFacility(alley.getTotalNearFacility());

			} else if (alley.getDate().equals("201705.0")) {
				dongData1705.setDate("201705.0");
				dongData1705.setDong(dong);
				dongData1705.setTotalPeople(alley.getTotalPeople());
				dongData1705.setTotalNearPeople(alley.getTotalNearPeople());
				dongData1705.setTotalBizman(alley.getTotalBizman());
				dongData1705.setTotalNearBizman(alley.getTotalNearBizman());
				dongData1705.setTotalLivingPeople(alley.getTotalLivingPeople());
				dongData1705.setAvgIncome(alley.getAvgIncome());
				dongData1705.setAvgOutcome(alley.getAvgOutcome());
				dongData1705.setAvgNearIcome(alley.getAvgNearIcome());
				dongData1705.setAvgNearOutcome(alley.getAvgNearOutcome());
				dongData1705.setTotalFacility(alley.getTotalFacility());
				dongData1705.setTotalNearFacility(alley.getTotalNearFacility());

			} else if (alley.getDate().equals("201706.0")) {
				dongData1706.setDate("201706.0");
				dongData1706.setDong(dong);
				dongData1706.setTotalPeople(alley.getTotalPeople());
				dongData1706.setTotalNearPeople(alley.getTotalNearPeople());
				dongData1706.setTotalBizman(alley.getTotalBizman());
				dongData1706.setTotalNearBizman(alley.getTotalNearBizman());
				dongData1706.setTotalLivingPeople(alley.getTotalLivingPeople());
				dongData1706.setAvgIncome(alley.getAvgIncome());
				dongData1706.setAvgOutcome(alley.getAvgOutcome());
				dongData1706.setAvgNearIcome(alley.getAvgNearIcome());
				dongData1706.setAvgNearOutcome(alley.getAvgNearOutcome());
				dongData1706.setTotalFacility(alley.getTotalFacility());
				dongData1706.setTotalNearFacility(alley.getTotalNearFacility());
			} else if (alley.getDate().equals("201707.0")) {
				dongData1707.setDate("201707.0");
				dongData1707.setDong(dong);
				dongData1707.setTotalPeople(alley.getTotalPeople());
				dongData1707.setTotalNearPeople(alley.getTotalNearPeople());
				dongData1707.setTotalBizman(alley.getTotalBizman());
				dongData1707.setTotalNearBizman(alley.getTotalNearBizman());
				dongData1707.setTotalLivingPeople(alley.getTotalLivingPeople());
				dongData1707.setAvgIncome(alley.getAvgIncome());
				dongData1707.setAvgOutcome(alley.getAvgOutcome());
				dongData1707.setAvgNearIcome(alley.getAvgNearIcome());
				dongData1707.setAvgNearOutcome(alley.getAvgNearOutcome());
				dongData1707.setTotalFacility(alley.getTotalFacility());
				dongData1707.setTotalNearFacility(alley.getTotalNearFacility());
			} else if (alley.getDate().equals("201708.0")) {
				dongData1708.setDate("201708.0");
				dongData1708.setDong(dong);
				dongData1708.setTotalPeople(alley.getTotalPeople());
				dongData1708.setTotalNearPeople(alley.getTotalNearPeople());
				dongData1708.setTotalBizman(alley.getTotalBizman());
				dongData1708.setTotalNearBizman(alley.getTotalNearBizman());
				dongData1708.setTotalLivingPeople(alley.getTotalLivingPeople());
				dongData1708.setAvgIncome(alley.getAvgIncome());
				dongData1708.setAvgOutcome(alley.getAvgOutcome());
				dongData1708.setAvgNearIcome(alley.getAvgNearIcome());
				dongData1708.setAvgNearOutcome(alley.getAvgNearOutcome());
				dongData1708.setTotalFacility(alley.getTotalFacility());
				dongData1708.setTotalNearFacility(alley.getTotalNearFacility());
			}

		}
		dongData.add(dongData1606);
		dongData.add(dongData1607);
		dongData.add(dongData1608);
		dongData.add(dongData1609);
		dongData.add(dongData1610);
		dongData.add(dongData1611);
		dongData.add(dongData1612);
		dongData.add(dongData1701);
		dongData.add(dongData1702);
		dongData.add(dongData1703);
		dongData.add(dongData1704);
		dongData.add(dongData1705);
		dongData.add(dongData1706);
		dongData.add(dongData1707);
		dongData.add(dongData1708);

		return dongData;
	}


}
