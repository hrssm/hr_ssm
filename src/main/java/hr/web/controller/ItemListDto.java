package hr.web.controller;

import java.util.List;

import hr.pojo.Salary_standard_details;

public class ItemListDto {
	private List<Salary_standard_details> list;

	public List<Salary_standard_details> getList() {
		return list;
	}

	public void setList(List<Salary_standard_details> list) {
		this.list = list;
	}
}
