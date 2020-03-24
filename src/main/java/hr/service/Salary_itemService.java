package hr.service;

import java.util.List;

import hr.pojo.Bonus;
import hr.pojo.HumanFile;
import hr.pojo.Salary_item;

public interface Salary_itemService {
	public boolean addSalary_item(Salary_item salary_item);
	public boolean removeSalary_itemById(int id);
	public List<Salary_item> querySalary_item();
	public Salary_item querySalary_itemById(int id);
	public void modifySalary_item(Salary_item salary_item);


}
