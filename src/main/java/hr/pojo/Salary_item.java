package hr.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Salary_item implements Serializable{
	private Integer item_id;
	private Integer item_number;
	private String item_name;
	private double item_salary;
	
	public double getItem_salary() {
		return item_salary;
	}
	public void setItem_salary(double item_salary) {
		this.item_salary = item_salary;
	}
	public Integer getItem_number() {
		return item_number;
	}
	public void setItem_number(Integer item_number) {
		this.item_number = item_number;
	}
	public Integer getItem_id() {
		return item_id;
	}
	public void setItem_id(Integer item_id) {
		this.item_id = item_id;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	

   
	
}
