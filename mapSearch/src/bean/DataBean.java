package bean;

public class DataBean {
	private String date;
	private String areaCode;
	private String serviceCode;
	private int people;
	private int sales;
	private int stores;

	public DataBean() {
	}

	public DataBean(String date, String areaCode, String serviceCode) {
		this.date = date;
		this.areaCode = areaCode;
		this.serviceCode = serviceCode;
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

	public String getServiceCode() {
		return serviceCode;
	}

	public void setServiceCode(String serviceCode) {
		this.serviceCode = serviceCode;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public int getStores() {
		return stores;
	}

	public void setStores(int istores) {
		this.stores = istores;
	}

}
