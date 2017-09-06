package qiu.entity;

public class stock {
	private Integer productNo;
	private String productName;
	private Integer number;
	private double buyMoney;
	private double soldMoney;
	private String date;
	public Integer getProductNo() {
		return productNo;
	}
	public void setProductNo(Integer productNo) {
		this.productNo = productNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public double getBuyMoney() {
		return buyMoney;
	}
	public void setBuyMoney(double buyMoney) {
		this.buyMoney = buyMoney;
	}
	public double getSoldMoney() {
		return soldMoney;
	}
	public void setSoldMoney(double soldMoney) {
		this.soldMoney = soldMoney;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "stock [productNo=" + productNo + ", productName=" + productName + ", number=" + number + ", buyMoney="
				+ buyMoney + ", soldMoney=" + soldMoney + ", date=" + date + "]";
	}
	
	
}
