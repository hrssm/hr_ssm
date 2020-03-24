package hr.service;

import java.util.List;

import hr.pojo.Salary_grant_details;

public interface SalaryGrantDetailsService {
	public void saveSalary_grant_details(Salary_grant_details salary_grant_details);
	public void modifySalary_grant_details(Salary_grant_details salary_grant_details);
	public Salary_grant_details querySalary_grant_detailsById(int id);
	public List<Salary_grant_details> querySalary_grant_details();
	public boolean removeSalary_grant_detailsById(int sid);
}
