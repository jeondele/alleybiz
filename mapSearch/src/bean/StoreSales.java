package bean;

public class StoreSales {
	private String date;
	private String areaCode;
	private String serviceCode;
	private int sales;
	private int stores;
	
	
	public StoreSales() {}
	
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
		this.serviceCode=serviceCode;
	}
	
	public int getSales() {
		return sales;
	}
	public void setSales(float sales) {
		this.sales = Math.round(sales);
	}
	public int getStores() {
		return stores;
	}
	public void setStores(float stores) {
		this.stores = Math.round(stores);
	}

}
