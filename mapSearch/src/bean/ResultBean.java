package bean;

public class ResultBean {
	private String areaCode;
	private String serviceCode;
	private float estimatedSales;
	private String estimatedGroup;

	public ResultBean() {
	}

	public String getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	public String getServiceCode() {
		return serviceCode;
	}

	public void setServiceCode(String serviceCode) {
		this.serviceCode = serviceCode;
	}

	public float getEstimatedSales() {
		return estimatedSales;
	}

	public void setEstimatedSales(float estimatedSales) {
		this.estimatedSales = estimatedSales;
	}

	public String getEstimatedGroup() {
		return estimatedGroup;
	}

	public void setEstimatedGroup(String estimatedGroup) {
		this.estimatedGroup = estimatedGroup;
	}

	
}
