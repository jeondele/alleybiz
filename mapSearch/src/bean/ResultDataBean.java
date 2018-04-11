package bean;

public class ResultDataBean {
	private String dong;
	private String service;
	private int sales;
	private int percentage;
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

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public int getPercentage() {
		return percentage;
	}

	public void setPercentage(int percentage) {
		this.percentage = percentage;
	}

	public String getEstimatedClass() {
		return estimatedClass;
	}

	public void setEstimatedClass(String estimatedClass) {
		this.estimatedClass = estimatedClass;
	}

}
