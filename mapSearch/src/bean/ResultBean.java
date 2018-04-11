package bean;

public class ResultBean {
	private String areaCode;
	private String serviceCode;
	private float sales;
	private float percentage;
	private String estimatedClass;

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

	public float getSales() {
		return sales;
	}

	public void setSales(float sales) {
		this.sales = sales;
	}

	public float getPercentage() {
		return percentage;
	}

	public void setPercentage(float percentage) {
		this.percentage = percentage;
	}

	public String getEstimatedClass() {
		return estimatedClass;
	}

	public void setEstimatedClass(String estimatedClass) {
		this.estimatedClass = estimatedClass;
	}

}
