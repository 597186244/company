package qiu.entity;

public class Employee {
	private Integer employeeNo;
	private String username;
	private String password;
	private String employeeName;
	private Integer employeeAge;
	private Integer role;
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public Integer getEmployeeAge() {
		return employeeAge;
	}
	public void setEmployeeAge(Integer employeeAge) {
		this.employeeAge = employeeAge;
	}
	public Integer getRole() {
		return role;
	}
	public void setRole(Integer role) {
		this.role = role;
	}
	public Integer getEmployeeNo() {
		return employeeNo;
	}
	public void setEmployeeNo(Integer employeeNo) {
		this.employeeNo = employeeNo;
	}
	@Override
	public String toString() {
		return "Employee [employeeNo=" + employeeNo + ", username=" + username + ", password=" + password
				+ ", employeeName=" + employeeName + ", employeeAge=" + employeeAge + ", role=" + role + "]";
	}
	
}
