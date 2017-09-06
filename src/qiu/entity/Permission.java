package qiu.entity;

public class Permission {
	private Integer role;
	private String product;
	private String employee;
	private String stock;
	private String permission;
	public Integer getRole() {
		return role;
	}
	public void setRole(Integer role) {
		this.role = role;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getEmployee() {
		return employee;
	}
	public void setEmployee(String employee) {
		this.employee = employee;
	}
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	@Override
	public String toString() {
		return "Permission [role=" + role + ", product=" + product + ", employee=" + employee + ", stock=" + stock
				+ ", permission=" + permission + "]";
	}
	
	
}
