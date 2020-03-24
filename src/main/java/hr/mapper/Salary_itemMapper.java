package hr.mapper;

import java.util.List;

import hr.pojo.Bonus;
import hr.pojo.Salary_grant;
import hr.pojo.Salary_item;
import hr.pojo.Training;

public interface Salary_itemMapper {
	public boolean insertSalary_item(Salary_item salary_item);
	public List<Salary_item> getSalary_item();
	public boolean deleteSalary_itemById(int id);
	public Salary_item selectSalary_itemById(int id);
	public void updateSalary_item(Salary_item salary_item);

}
