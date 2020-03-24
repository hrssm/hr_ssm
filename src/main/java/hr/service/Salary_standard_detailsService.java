package hr.service;

import java.util.List;

import hr.pojo.Salary_item;
import hr.pojo.Salary_standard;
import hr.pojo.Salary_standard_details;

public interface Salary_standard_detailsService {
	public boolean addSalary_standard_details(Salary_standard_details salary_standard_details);
	public boolean removeSalary_standard_detailsById(int id);
	public List<Salary_standard_details> querySalary_standard_details();
	public Salary_standard_details querySalary_standard_detailsById(int id);
	public void modifySalary_standard_details(Salary_standard_details salary_standard_details);
	public boolean modifySalaryStandardDetailsByItemID(Salary_standard_details salary_standard_details);
	public List<Salary_standard_details> querySalary_standard_detailsByStandardId(String sid);
}
