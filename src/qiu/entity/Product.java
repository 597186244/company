package qiu.entity;

public class Product {
	private Integer productNo;
	private String productName;
	private Integer productBuyPrice;
	private Integer productSoldPrice;
	private String productCategory;
	private String productNote;
	public Integer getProductNo() {
		return productNo;
	}
	public void setProductNo(Integer productNo) {
		this.productNo = productNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String prroductName) {
		this.productName = prroductName;
	}
	public Integer getProductBuyPrice() {
		return productBuyPrice;
	}
	public void setProductBuyPrice(Integer productBuyPrice) {
		this.productBuyPrice = productBuyPrice;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	public String getProductNote() {
		return productNote;
	}
	public void setProductNote(String productNote) {
		this.productNote = productNote;
	}
	public Integer getProductSoldPrice() {
		return productSoldPrice;
	}
	public void setProductSoldPrice(Integer productSoldPrice) {
		this.productSoldPrice = productSoldPrice;
	}
	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", productBuyPrice="
				+ productBuyPrice + ", productSoldPrice=" + productSoldPrice + ", productCategory=" + productCategory
				+ ", productNote=" + productNote + "]";
	}
	
	
}
