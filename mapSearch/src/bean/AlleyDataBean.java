package bean;

public class AlleyDataBean {
	private String date;
	private String areaCode;
	private int totalPeople;
	private int totalNearPeople;
	private int totalBizman;
	private int totalNearBizman;
	private int totalLivingPeople;
	private int avgOutcome;
	private int avgIncome;
	private int avgNearIcome;
	private int avgNearOutcome;
	private int totalFacility;
	private int totalNearFacility;

	public AlleyDataBean() {

	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	public int getTotalPeople() {
		return totalPeople;
	}

	public void setTotalPeople(float totalPeople) {
		this.totalPeople = Math.round(totalPeople);
	}

	public int getTotalNearPeople() {
		return totalNearPeople;
	}

	public void setTotalNearPeople(float totalNearPeople) {
		this.totalNearPeople = Math.round(totalNearPeople);
	}

	public int getTotalBizman() {
		return totalBizman;
	}

	public void setTotalBizman(float totalBizman) {
		this.totalBizman = Math.round(totalBizman);
	}

	public int getTotalNearBizman() {
		return totalNearBizman;
	}

	public void setTotalNearBizman(float totalNearBizman) {
		this.totalNearBizman =Math.round(totalNearBizman);
	}

	public int getTotalLivingPeople() {
		return totalLivingPeople;
	}

	public void setTotalLivingPeople(float totalLivingPeople) {
		this.totalLivingPeople = Math.round(totalLivingPeople);
	}

	public int getAvgIncome() {
		return avgIncome;
	}

	public void setAvgIncome(float avgIncome) {
		this.avgIncome = Math.round(avgIncome);
	}

	public int getAvgOutcome() {
		return avgOutcome;
	}

	public void setAvgOutcome(float avgOutcome) {
		this.avgOutcome = Math.round(avgOutcome);
	}

	public int getTotalFacility() {
		return totalFacility;
	}

	public void setTotalFacility(float totalFacility) {
		this.totalFacility = Math.round(totalFacility);
	}

	public int getTotalNearFacility() {
		return totalNearFacility;
	}

	public void setTotalNearFacility(float totalNearFacility) {
		this.totalNearFacility = Math.round(totalNearFacility);
	}

	public int getAvgNearIcome() {
		return avgNearIcome;
	}

	public void setAvgNearIcome(float avgNearIcome) {
		this.avgNearIcome = Math.round(avgNearIcome);
	}

	public int getAvgNearOutcome() {
		return avgNearOutcome;
	}

	public void setAvgNearOutcome(float avgNearOutcome) {
		this.avgNearOutcome = Math.round(avgNearOutcome);
	}

}
