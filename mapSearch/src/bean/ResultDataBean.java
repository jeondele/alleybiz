package bean;

public class ResultDataBean {
	private String dong;
	private String service;
	private float sales;
	private float percentage;
	private String estimatedClass;

	public ResultDataBean() {
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
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
