package hr.service;

import java.util.List;

import hr.pojo.Salary_item;
import hr.pojo.Salary_standard;

public interface Salary_standardService {
	public boolean addSalary_standard(Salary_standard salary_standard);
	public boolean removeSalary_standardById(int id);
	public List<Salary_standard> querySalary_standard();
	public Salary_standard querySalary_standardById(int id);
	public void modifySalary_standard(Salary_standard salary_standard);
}
