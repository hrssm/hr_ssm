package hr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hr.mapper.Salary_itemMapper;
import hr.pojo.Salary_item;
import hr.service.Salary_itemService;
@Service
public class Salary_itemServiceImpl implements Salary_itemService{
	@Autowired
	private Salary_itemMapper sm = null;

	@Override
	public boolean addSalary_item(Salary_item salary_item) {
		return sm.insertSalary_item(salary_item);
	}

	@Override
	public boolean removeSalary_itemById(int id) {
		return sm.deleteSalary_itemById(id);
	}

	@Override
	public List<Salary_item> querySalary_item() {
		return sm.getSalary_item();
	}

	@Override
	public Salary_item querySalary_itemById(int id) {
		return sm.selectSalary_itemById(id);
	}

	@Override
	public void modifySalary_item(Salary_item salary_item) {
		 sm.updateSalary_item(salary_item);
	}

}
